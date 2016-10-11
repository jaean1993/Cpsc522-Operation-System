#include <lib/x86.h>
#include <lib/debug.h>

#include "import.h"

/**
 * Sets the entire page map for process 0 as identity map.
 * Note that part of the task is already completed by pdir_init.
 */
void pdir_init_kern(unsigned int mbi_adr)
{
    // TODO: define your local variables here.

    pdir_init(mbi_adr);
    for (int i = 0; i < 1024; ++i)
    {
    	set_pdir_entry_identity(0,i);
    }
    //TODO
}

/**
 * Maps the physical page # [page_index] for the given virtual address with the given permission.
 * In the case, when the page table for the page directory entry is not set up, you need to allocate the page table first.
 * In the case of error, it returns the constant MagicNumber defined in lib/x86.h,
 * otherwise, it returns the physical page index registered in the page directory,
 * e.g., the return value of get_pdir_entry_by_va or alloc_ptbl.
 */
unsigned int map_page(unsigned int proc_index, unsigned int vadr, unsigned int page_index, unsigned int perm)
{   
  // TODO
	unsigned int temp = get_pdir_entry_by_va(proc_index, vadr);
	if (temp == 0)
	{
		unsigned int alloc = alloc_ptbl(proc_index, vadr);
		if (alloc == 0)
		{
			return MagicNumber;
		}
		temp = alloc;
	}
  set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
  return temp;
}

/**
 * Remove the mapping for the given virtual address (with rmv_ptbl_entry_by_va).
 * You need to first make sure that the mapping is still valid,
 * e.g., by reading the page table entry for the virtual address.
 * Nothing should be done if the mapping no longer exists.
 * You do not need to unmap the page table from the page directory.
 * It should return the corresponding page table entry.
 */
unsigned int unmap_page(unsigned int proc_index, unsigned int vadr)
{
  // TODO
  unsigned int temp = get_ptbl_entry_by_va(proc_index, vadr);
  if(temp == 0) {
  	return 0;
  }
  rmv_ptbl_entry_by_va(proc_index, vadr);
  return temp;
}   
