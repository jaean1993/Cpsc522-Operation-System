#include <lib/spinlock.h>
#ifndef _KERN_THREAD_PTHREAD_H_
#define _KERN_THREAD_PTHREAD_H_

#ifdef _KERN_

void thread_init(unsigned int mbi_addr);
unsigned int thread_spawn(void *entry, unsigned int id, unsigned int quota);
void thread_yield(void);
void thread_update(void);
void thread_suspend(spinlock_t* lk);
void thread_make_ready(unsigned int c_id, unsigned int id);

#endif /* _KERN_ */

#endif /* !_KERN_THREAD_PTHREAD_H_ */

