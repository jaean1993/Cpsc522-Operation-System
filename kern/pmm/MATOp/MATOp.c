#include <lib/debug.h>
#include "import.h"
unsigned int test = 0;
/**
 * Allocation of a physical page.
 *
 * 1. First, implement a naive page allocator that scans the allocation table (AT) 
 *    using the functions defined in import.h to find the first unallocated page
 *    with usable permission.
 *    (Q: Do you have to scan allocation table from index 0? Recall how you have
 *    initialized the table in pmem_init.)
 *    Then mark the page as allocated in the allocation table and return the page
 *    index of the page found. In the case when there is no avaiable page found,
 *    return 0.
 * 2. Optimize the code with the memorization techniques so that you do not have to
 *    scan the allocation table from scratch every time.
 */
unsigned int
palloc()
{ 
  if (test != 0)
  {
  	unsigned int temp = test;
  	test = 0;
  	return temp;	
  }
 
  for (int i = 0x40000000 / 4096; i <= 0xF0000000 / 4096; i++)
  {
  	if (at_is_norm(i) == 1 && at_is_allocated(i) == 0)
  	{	
  		at_set_allocated(i,1);
  		return i;
  
  	}
  }
  return 0;
}
/**
 * Free of a physical page.
 *
 * This function marks the page with given index as unallocated
 * in the allocation table.
 *
 * Hint: Simple.
 */
void
pfree(unsigned int pfree_index)
{
  at_set_allocated(pfree_index,0);
  test = pfree_index;
}
