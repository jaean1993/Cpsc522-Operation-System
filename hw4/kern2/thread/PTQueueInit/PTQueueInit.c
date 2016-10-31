#include "lib/x86.h"

#include "import.h"

/**
 * Initializes all the thread queues with
 * tqueue_init_at_id.
 */
void tqueue_init(unsigned int mbi_addr)
{
  // TODO: define your local variables here.

	tcb_init(mbi_addr);
	unsigned int i;
	for (i = 0; i < NUM_IDS + 1; ++i)
	{
		tqueue_init_at_id(i);
	}
	
}

/**
 * Insert the TCB #pid into the tail of the thread queue #chid.
 * Recall that the doubly linked list is index based.
 * So you only need to insert the index.
 * Hint: there are multiple cases in this function.
 */
void tqueue_enqueue(unsigned int chid, unsigned int pid)
{	
	
	unsigned int old_tail =  tqueue_get_tail(chid);

	tcb_set_next(old_tail, pid);
	if (old_tail != NUM_IDS)
	{
		tcb_set_prev(pid, old_tail);
	} else {
		tqueue_set_head(chid, pid);
	}
	
	tqueue_set_tail(chid, pid);

}

/**
 * Reverse action of tqueue_enqueue, i.g., pops a TCB from the head of specified queue.
 * It returns the poped thread's id, or NUM_IDS if the queue is empty.
 * Hint: there are mutiple cases in this function.
 */
unsigned int tqueue_dequeue(unsigned int chid)
{
  // TODO
	unsigned int result = tqueue_get_head(chid);
	unsigned int new_head = tcb_get_next(result);
	tqueue_set_head(chid, new_head);
	if (tcb_get_next(new_head) == NUM_IDS)
	{
		tqueue_set_tail(chid, new_head);
	}
	tcb_set_next(result, NUM_IDS);

  	return result;
}

/**
 * Removes the TCB #pid from the queue #chid.
 * Hint: there are many cases in this function.
 */
void tqueue_remove(unsigned int chid, unsigned int pid)
{
  unsigned int id = tqueue_get_tail(chid);
  while(id != pid) {
  	id = tcb_get_next(id);
  }

  unsigned int old_id_next = tcb_get_next(id);
  unsigned int old_id_prev = tcb_get_prev(id);
  if (old_id_next == NUM_IDS) 
  {
  	tqueue_set_tail(chid, old_id_prev);
  }
  if (old_id_prev == NUM_IDS)
  {
  	tqueue_set_head(chid, old_id_next);
  }
  
  tcb_set_next(old_id_prev, old_id_next);
  tcb_set_prev(old_id_next, old_id_prev);

  tcb_set_prev(id, NUM_IDS);
  tcb_set_next(id, NUM_IDS);

}
