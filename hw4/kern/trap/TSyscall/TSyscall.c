#include <lib/debug.h>
#include <lib/types.h>
#include <lib/x86.h>
#include <lib/trap.h>
#include <lib/syscall.h>
#include <dev/intr.h>
#include <pcpu/PCPUIntro/export.h>
#include <lib/spinlock.h>

#include "import.h"

#define MAX_ARRAY_LEN 100
#define MAX_BUFFER_LEN 10

static char sys_buf[NUM_IDS][PAGESIZE];


static spinlock_t lock;

static int e_queue_point[NUM_CPUS]; 
static int f_queue_point[NUM_CPUS];

static unsigned int front_end[NUM_CPUS][2];

typedef struct {
	unsigned int queue[MAX_ARRAY_LEN];
} CV;

static CV empty[NUM_CPUS];
static CV full[NUM_CPUS];
/**
 * Copies a string from user into buffer and prints it to the screen.
 * This is called by the user level "printf" library as a system call.
 */
void sys_puts(tf_t *tf)
{
	unsigned int cur_pid;
	unsigned int str_uva, str_len;
	unsigned int remain, cur_pos, nbytes;

	cur_pid = get_curid();
	str_uva = syscall_get_arg2(tf);
	str_len = syscall_get_arg3(tf);

	if (!(VM_USERLO <= str_uva && str_uva + str_len <= VM_USERHI)) {
		syscall_set_errno(tf, E_INVAL_ADDR);
		return;
	}

	remain = str_len;
	cur_pos = str_uva;

	while (remain) {
		if (remain < PAGESIZE - 1)
			nbytes = remain;
		else
			nbytes = PAGESIZE - 1;

		if (pt_copyin(cur_pid,
			      cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
			syscall_set_errno(tf, E_MEM);
			return;
		}

		sys_buf[cur_pid][nbytes] = '\0';
		KERN_INFO("From cpu %d: %s", get_pcpu_idx(), sys_buf[cur_pid]);

		remain -= nbytes;
		cur_pos += nbytes;
	}

	syscall_set_errno(tf, E_SUCC);
}

extern uint8_t _binary___obj_user_pingpong_ping_start[];
extern uint8_t _binary___obj_user_pingpong_pong_start[];
extern uint8_t _binary___obj_user_pingpong_ding_start[];

/**
 * Spawns a new child process.
 * The user level library function sys_spawn (defined in user/include/syscall.h)
 * takes two arguments [elf_id] and [quota], and returns the new child process id
 * or NUM_IDS (as failure), with appropriate error number.
 * Currently, we have three user processes defined in user/pingpong/ directory,
 * ping, pong, and ding.
 * The linker ELF addresses for those compiled binaries are defined above.
 * Since we do not yet have a file system implemented in mCertiKOS,
 * we statically loading the ELF binraries in to the memory based on the
 * first parameter [elf_id], i.e., ping, pong, and ding corresponds to
 * the elf_id of 1, 2, and 3, respectively.
 * If the parameter [elf_id] is none of those three, then it should return
 * NUM_IDS with the error number E_INVAL_PID. The same error case apply
 * when the proc_create fails.
 * Otherwise, you mark it as successful, and return the new child process id.
 */
void sys_spawn(tf_t *tf)
{
  //TODO: improve the implementation by adding the missing argument checks to
  //make sure the calll to sys_spawn never goes wrong.
	unsigned int new_pid;
	unsigned int elf_id, quota;
	unsigned int cur_pid;
	void *elf_addr;

	elf_id = syscall_get_arg2(tf);
	quota = syscall_get_arg3(tf);
	cur_pid = get_curid();

	if (container_can_consume(cur_pid, quota) == 0)
	{
		syscall_set_errno(tf, E_EXCEEDS_QUOTA);
		syscall_set_retval1(tf, NUM_IDS);
		return;
	}
	//index for the child process
	if (container_get_nchildren(cur_pid) + 1 + cur_pid * MAX_CHILDREN > NUM_IDS)
	{
		syscall_set_errno(tf, E_MAX_NUM_CHILDEN_REACHED);
		syscall_set_retval1(tf, NUM_IDS);
		return;
	}

	if (container_get_nchildren(cur_pid) > MAX_CHILDREN)
	{
		syscall_set_errno(tf, E_INVAL_CHILD_ID);
		syscall_set_retval1(tf, NUM_IDS);
		return;
	}

	if (elf_id == 1) {
		elf_addr = _binary___obj_user_pingpong_ping_start;
	} else if (elf_id == 2) {
		elf_addr = _binary___obj_user_pingpong_pong_start;
	} else if (elf_id == 3) {
    elf_addr = _binary___obj_user_pingpong_ding_start;
	} else {
		syscall_set_errno(tf, E_INVAL_PID);
		syscall_set_retval1(tf, NUM_IDS);
		return;
	}

	new_pid = proc_create(elf_addr, quota);

	if (new_pid == NUM_IDS) {
		syscall_set_errno(tf, E_INVAL_PID);
		syscall_set_retval1(tf, NUM_IDS);
	} else {
		syscall_set_errno(tf, E_SUCC);
		syscall_set_retval1(tf, new_pid);
	}
}

/**
 * Yields to another thread/process.
 * The user level library function sys_yield (defined in user/include/syscall.h)
 * does not take any argument and does not have any return values.
 * Do not forget to set the error number as E_SUCC.
 */
void sys_yield(tf_t *tf)
{
	thread_yield();
	syscall_set_errno(tf, E_SUCC);
}

void sys_produce(tf_t *tf)
{	
	
	unsigned int cur_pid = get_pcpu_idx();

	intr_local_disable();
	KERN_DEBUG("CPU %d: Process %d: Produced \n", get_pcpu_idx(), get_curid());
	intr_local_enable();
	spinlock_acquire(&lock);
	intr_local_disable();
	// KERN_DEBUG("produce; after acquire lock  CPU %d: Process %d: Produced \n", get_pcpu_idx(), get_curid());
	intr_local_enable();

	// unsigned int cur_id = get_curid();
	while ((front_end[cur_pid][1] - front_end[cur_pid][0]) == MAX_BUFFER_LEN) {
		intr_local_disable();
		KERN_DEBUG("produce waiting loop CPU: %d Process: %d\n",get_pcpu_idx(), get_curid());
		intr_local_enable();
		wait(1, &lock, cur_pid);
	}
	
	front_end[get_pcpu_idx()][1]++;
	intr_local_disable();
	// KERN_DEBUG("tail %d\n", front_end[cur_pid][1]);
	intr_local_enable();
  // unsigned int i;
  // for(i = 0; i < 5; i++) {
  // 	intr_local_disable();
    // KERN_DEBUG("CPU %d: Process %d: Produced \n", get_pcpu_idx(), get_curid());
  // 	intr_local_enable();
  // }
  	signal(0,cur_pid);
  	intr_local_disable();
  	KERN_DEBUG("produce: after signal  CPU: %d Process: %d \n", get_pcpu_idx(), get_curid());
  	intr_local_enable();
	spinlock_release(&lock);
	
	syscall_set_errno(tf, E_SUCC);

}

void sys_consume(tf_t *tf)
{	

	unsigned int cur_pid = get_pcpu_idx();

	intr_local_disable();
	KERN_DEBUG("CPU %d: Process %d: Consumed \n", get_pcpu_idx(), get_curid());
	intr_local_enable();
	spinlock_acquire(&lock);
	intr_local_disable();
	KERN_DEBUG("consume; after acquire lock  CPU %d: Process %d \n", get_pcpu_idx(), get_curid());
	intr_local_enable();

	while (front_end[cur_pid][0] == front_end[cur_pid][1]) {
		intr_local_disable();
		KERN_DEBUG("consume waiting loop CPU %d: Process %d:\n",get_pcpu_idx(), get_curid());
		intr_local_enable();
		wait(0, &lock, cur_pid);
		intr_local_disable();
		// KERN_DEBUG("consume stop waiting loop CPU %d: Process %d:\n",get_pcpu_idx(), get_curid());
		intr_local_enable();
	}
	intr_local_disable();
	// KERN_DEBUG("consume didn't waiting loop CPU %d: Process %d:\n",get_pcpu_idx(), get_curid());
	intr_local_enable();
	// unsigned int id = buf[get_pcpu_idx()][front % MAX_BUFFER_LEN];

	front_end[cur_pid][0]++;
	intr_local_disable();
	// KERN_DEBUG("front %d\n", front_end[cur_pid][0]);
	intr_local_enable();
	signal(1, cur_pid);
	intr_local_disable();
  	KERN_DEBUG("consume: after signal  CPU %d: Process %d \n", get_pcpu_idx(), get_curid());
  	intr_local_enable();
  // unsigned int i;
  // for(i = 0; i < 5; i++) {
  // 	intr_local_disable();
    // KERN_DEBUG("CPU %d: Process %d: Consumed \n", get_pcpu_idx(), get_curid());
  // 	intr_local_enable();
  // }

  	spinlock_release(&lock);

	syscall_set_errno(tf, E_SUCC);
}

void wait(unsigned int sig, spinlock_t * sub_lock, int cur_cid) {
	if (sig == 0)
	{	//empty
		e_queue_point[cur_cid]++;
		intr_local_disable();
		// KERN_DEBUG(" e_queue_point[%d] :%d\n", cur_pid, e_queue_point[cur_pid]);
		intr_local_enable();
		empty[cur_cid].queue[e_queue_point[cur_cid] - 1] = get_curid();
	} else if (sig == 1){
		f_queue_point[cur_cid]++;
		full[cur_cid].queue[f_queue_point[cur_cid] - 1] = get_curid();
	}

	thread_suspend(sub_lock);
	intr_local_disable();
	// KERN_DEBUG("CPU %d: Process %d: acquire lock after suspend \n", get_pcpu_idx(), get_curid());
	intr_local_enable();
	spinlock_acquire(sub_lock);
	intr_local_disable();
	KERN_DEBUG("CPU %d: Process %d: get lock after suspend \n", get_pcpu_idx(), get_curid());
	intr_local_enable();
}

void signal(unsigned int sig, int cur_cid) {
	if (sig == 0 && e_queue_point[cur_cid] != 0)
	{	//empty
		unsigned int id = empty[cur_cid].queue[e_queue_point[cur_cid] - 1];
		intr_local_disable();
		KERN_DEBUG("wake a consume process id:  %d \n", id);
		intr_local_enable();
		e_queue_point[cur_cid]--;
		thread_make_ready(cur_cid, id);
	} else if (sig == 1 && f_queue_point[cur_cid] != 0) {
		unsigned int id = full[cur_cid].queue[f_queue_point[cur_cid] - 1];
		intr_local_disable();
		KERN_DEBUG("signal weak id %d:  \n", id);
		intr_local_enable();
		f_queue_point[cur_cid]--;
		thread_make_ready(cur_cid, id);
	}

}
