#include <lib/x86.h>

#include "import.h"

/**
 * For each process from id 0 to NUM_IDS -1,
 * set the page directory entries sothat the kernel portion of the map as identity map,
 * and the rest of page directories are unmmaped.
 */
void pdir_init(unsigned int mbi_adr)
{
    // TODO: define your local variables here.

    idptbl_init(mbi_adr);

    for (int i = 0; i < NUM_IDS; ++i)
    {	
    		
    		for (int j = 0; j < 1024; ++j)
    		{	
    			
    			if (j >= 256 && j < 960)
    			{
    					rmv_pdir_entry(i, j);
    			}else {
    				set_pdir_entry_identity(i, j);
    			}	
    			
    				
    		}
    }
    // TODO
}

/**
 * Allocates a page (with container_alloc) for the page table,
 * and registers it in page directory for the given virtual address,
 * and clears (set to 0) the whole page table entries for this newly mapped page table.
 * It returns the page index of the newly allocated physical page.
 * In the case when there's no physical page available, it returns 0.
 */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vadr)
{
  // TODO
  int page_index = container_alloc(proc_index);
  if (page_index == 0)
  {
  	return 0;
  }
  set_pdir_entry_by_va(proc_index, vadr, page_index);
  for (int i = 0; i < 1024; ++i)
	{	
		rmv_ptbl_entry(proc_index, vadr >> 22, i);
	}
  
  return page_index;
}

// Reverse operation of alloc_ptbl.
// Removes corresponding page directory entry,
// and frees the page for the page table entries (with container_free).
void free_ptbl(unsigned int proc_index, unsigned int vadr)
{	
	unsigned int temp = get_ptbl_entry_by_va(proc_index, vadr);
	container_free(proc_index, temp >> 12);
	rmv_pdir_entry_by_va(proc_index, vadr);
}
