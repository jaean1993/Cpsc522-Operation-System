#include <lib/trap.h>
#include <lib/debug.h>
#include <dev/intr.h>
#include "import.h"

int inited = FALSE;

void
trap_init_array(void)
{
  KERN_ASSERT(inited == FALSE);
  memzero(&(TRAP_HANDLER), sizeof(trap_cb_t) * 8 * 256);
  inited = TRUE;
}

void
trap_handler_register(int cpu_idx, int trapno, trap_cb_t cb)
{
  KERN_ASSERT(0 <= cpu_idx && cpu_idx < 8);
  KERN_ASSERT(0 <= trapno && trapno < 256);
  KERN_ASSERT(cb != NULL);

  TRAP_HANDLER[cpu_idx][trapno] = cb;
}

void
trap_init(unsigned int cpu_idx){

	if (cpu_idx == 0){
		trap_init_array();
	}

	if (cpu_idx == 0){
		KERN_INFO("[BSP KERN] Register trap handlers ... \n");
	} else {
		KERN_INFO("[AP%d KERN] Register trap handlers ... \n", cpu_idx);
	}

  // TODO: for CPU # [cpu_idx], register appropriate trap handler for each trap number,
  // with trap_handler_register function defined above.
	trap_handler_register(cpu_idx, T_DIVIDE, exception_handler);
	trap_handler_register(cpu_idx, T_DEBUG, exception_handler);
	trap_handler_register(cpu_idx, T_NMI, exception_handler);
	trap_handler_register(cpu_idx, T_BRKPT, exception_handler);
	trap_handler_register(cpu_idx, T_OFLOW, exception_handler);
	trap_handler_register(cpu_idx, T_BOUND, exception_handler);
	trap_handler_register(cpu_idx, T_ILLOP, exception_handler);
	trap_handler_register(cpu_idx, T_DEVICE, exception_handler);
	trap_handler_register(cpu_idx, T_DBLFLT, exception_handler);
	trap_handler_register(cpu_idx, T_COPROC, exception_handler);
	trap_handler_register(cpu_idx, T_TSS, exception_handler);
	trap_handler_register(cpu_idx, T_SEGNP, exception_handler);
	trap_handler_register(cpu_idx, T_STACK, exception_handler);
	trap_handler_register(cpu_idx, T_GPFLT, exception_handler);
	trap_handler_register(cpu_idx, T_PGFLT, exception_handler);
	trap_handler_register(cpu_idx, T_RES, exception_handler);
	trap_handler_register(cpu_idx, T_FPERR, exception_handler);
	trap_handler_register(cpu_idx, T_ALIGN, exception_handler);
	trap_handler_register(cpu_idx, T_MCHK, exception_handler);
	trap_handler_register(cpu_idx, T_SIMD, exception_handler);
	trap_handler_register(cpu_idx, T_SECEV, exception_handler);

	trap_handler_register(cpu_idx, T_SYSCALL, syscall_dispatch);

	trap_handler_register(cpu_idx, T_IRQ0+IRQ_TIMER, interrupt_handler);
  	trap_handler_register(cpu_idx, T_IRQ0+IRQ_KBD, interrupt_handler);
  	trap_handler_register(cpu_idx, T_IRQ0+IRQ_SERIAL13, interrupt_handler);

	if (cpu_idx == 0){
		KERN_INFO("[BSP KERN] Done.\n");
	} else {
		KERN_INFO("[AP%d KERN] Done.\n", cpu_idx);
	}

	if (cpu_idx == 0){
		KERN_INFO("[BSP KERN] Enabling interrupts ... \n");
	} else {
		KERN_INFO("[AP%d KERN] Enabling interrupts ... \n", cpu_idx);
	}

	/* enable interrupts */
  intr_enable (IRQ_TIMER, cpu_idx);
  intr_enable (IRQ_KBD, cpu_idx);
 	intr_enable (IRQ_SERIAL13, cpu_idx);

	if (cpu_idx == 0){
		KERN_INFO("[BSP KERN] Done.\n");
	} else {
		KERN_INFO("[AP%d KERN] Done.\n", cpu_idx);
	}

}

