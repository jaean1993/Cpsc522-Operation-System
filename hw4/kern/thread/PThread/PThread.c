#include <lib/x86.h>
#include <lib/thread.h>
#include <lib/spinlock.h>
#include <lib/debug.h>
#include <dev/lapic.h>
#include <pcpu/PCPUIntro/export.h>
#include <dev/intr.h>

#include "import.h"

static spinlock_t lock;

static unsigned int elapsed_time[NUM_CPUS];

void thread_init(unsigned int mbi_addr)
{	
	for (int i = 0; i < NUM_CPUS; ++i)
	{
		elapsed_time[i] = 0;
	}
	spinlock_init(&lock);
	tqueue_init(mbi_addr);
	set_curid(0);
	tcb_set_state(0, TSTATE_RUN);
}

/**
 * Allocates new child thread context, set the state of the new child thread
 * as ready, and pushes it to the ready queue.
 * It returns the child thread id.
 */
unsigned int thread_spawn(void *entry, unsigned int id, unsigned int quota)
{
	spinlock_acquire(&lock);
	unsigned int pid;

	pid = kctx_new(entry, id, quota);
	tcb_set_cpu(pid, get_pcpu_idx());
	tcb_set_state(pid, TSTATE_READY);
	tqueue_enqueue(NUM_IDS + get_pcpu_idx(), pid);
	spinlock_release(&lock);
	return pid;
}

/**
 * Yield to the next thread in the ready queue.
 * You should set the currently running thread state as ready,
 * and push it back to the ready queue.
 * And set the state of the poped thread as running, set the
 * current thread id, then switches to the new kernel context.
 * Hint: if you are the only thread that is ready to run,
 * do you need to switch to yourself?
 */
void thread_yield(void)
{	
	spinlock_acquire(&lock);
	unsigned int old_cur_pid;
	unsigned int new_cur_pid;

	old_cur_pid = get_curid();
	tcb_set_state(old_cur_pid, TSTATE_READY);
	tqueue_enqueue(NUM_IDS + get_pcpu_idx(), old_cur_pid);

	new_cur_pid = tqueue_dequeue(NUM_IDS + get_pcpu_idx());
	tcb_set_state(new_cur_pid, TSTATE_RUN);
	set_curid(new_cur_pid);
	// KERN_DEBUG("here \n");
	if (old_cur_pid != new_cur_pid){
		spinlock_release(&lock);
		kctx_switch(old_cur_pid, new_cur_pid);
		return;
	}
	spinlock_release(&lock);
}

void sched_update(void) {
	spinlock_acquire(&lock);
	unsigned int current_cpu_id = get_pcpu_idx();
	elapsed_time[current_cpu_id] += 1000/LAPIC_TIMER_INTR_FREQ;
	if (elapsed_time[current_cpu_id] > SCHED_SLICE)
	{
		elapsed_time[current_cpu_id] = 0;
		spinlock_release(&lock);
		thread_yield();
		return;
	} 
	
	spinlock_release(&lock);		
	
}

void thread_suspend(spinlock_t* lk) {
	intr_local_disable();
	spinlock_acquire(&lock);
	int has_lock = 1;
	
	spinlock_release(lk);

	unsigned int old_cur_pid = get_curid();
	unsigned int new_cur_pid = tqueue_dequeue(NUM_IDS + get_pcpu_idx());
	
	if (new_cur_pid == NUM_IDS) {
		has_lock = 0;
		spinlock_release(&lock);
	}
	while(new_cur_pid == NUM_IDS) {
		KERN_DEBUG("NUM_IDS: %d \n", new_cur_pid);
		new_cur_pid = tqueue_dequeue(NUM_IDS + get_pcpu_idx());
	}
	if (has_lock != 1)
	{
		spinlock_acquire(&lock);
	}


	if (old_cur_pid != new_cur_pid)
	{
	
		tcb_set_state(new_cur_pid, TSTATE_RUN);
		set_curid(new_cur_pid);

		KERN_DEBUG("old_cur_pid: %d, new_cur_pid: %d\n", old_cur_pid, new_cur_pid);
		spinlock_release(&lock);
		KERN_DEBUG("after release lock %d\n", get_curid());		
		kctx_switch(old_cur_pid, new_cur_pid);
		KERN_DEBUG("after switch kctx lk %d\n", get_curid());

	} else {
		spinlock_release(&lock);
	}
	
	// KERN_DEBUG("release lk final final%d\n", new_cur_pid);
	// intr_local_enable();
}

void thread_make_ready(unsigned int c_id, unsigned int id) {

	spinlock_acquire(&lock);
	intr_local_disable();
	KERN_DEBUG("inside thread_make_ready acquire lock id: %d \n", id);
	KERN_DEBUG("inside thread_make_ready acquire lock  Cpu %d , process_id : %d \n", get_pcpu_idx(),get_curid());
	
	tcb_set_state(id, TSTATE_READY);
	tqueue_enqueue(NUM_IDS + c_id, id);

	KERN_DEBUG("make ready %d\n", id);

	spinlock_release(&lock);
	intr_local_enable();
	
	
	
}

