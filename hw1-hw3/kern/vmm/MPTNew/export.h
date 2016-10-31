#ifndef _NEW_MM_MPTNEW_H_
#define _NEW_MM_MPTNEW_H_

unsigned int alloc_page(unsigned int, unsigned int, unsigned int);
unsigned int alloc_mem_quota(unsigned int, unsigned int);
void cpy_cow(unsigned int PID, unsigned int vaddr);

#endif

