
obj/kern/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <video_init>:
#include "video.h"
//tmphack
//#include<dev/serial.h>
void
video_init(void)
{
  100000:	56                   	push   %esi
  100001:	53                   	push   %ebx
  100002:	83 ec 04             	sub    $0x4,%esp
	uint16_t was;
	unsigned pos;

	/* Get a pointer to the memory-mapped text display buffer. */
	cp = (uint16_t*) CGA_BUF;
	was = *cp;
  100005:	0f b7 15 00 80 0b 00 	movzwl 0xb8000,%edx
	*cp = (uint16_t) 0xA55A;
  10000c:	66 c7 05 00 80 0b 00 	movw   $0xa55a,0xb8000
  100013:	5a a5 
	if (*cp != 0xA55A) {
  100015:	0f b7 05 00 80 0b 00 	movzwl 0xb8000,%eax
  10001c:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100020:	0f 84 8c 00 00 00    	je     1000b2 <video_init+0xb2>
		cp = (uint16_t*) MONO_BUF;
		addr_6845 = MONO_BASE;
  100026:	c7 05 8c d4 96 00 b4 	movl   $0x3b4,0x96d48c
  10002d:	03 00 00 
		dprintf("addr_6845:%x\n",addr_6845);
  100030:	83 ec 08             	sub    $0x8,%esp
  100033:	68 b4 03 00 00       	push   $0x3b4
  100038:	68 a0 4b 10 00       	push   $0x104ba0
  10003d:	e8 48 1f 00 00       	call   101f8a <dprintf>
  100042:	83 c4 10             	add    $0x10,%esp
	/* Get a pointer to the memory-mapped text display buffer. */
	cp = (uint16_t*) CGA_BUF;
	was = *cp;
	*cp = (uint16_t) 0xA55A;
	if (*cp != 0xA55A) {
		cp = (uint16_t*) MONO_BUF;
  100045:	be 00 00 0b 00       	mov    $0xb0000,%esi
		addr_6845 = CGA_BASE;
		dprintf("addr_6845:%x\n",addr_6845);
	}
	
	/* Extract cursor location */
	outb(addr_6845, 14);
  10004a:	83 ec 08             	sub    $0x8,%esp
  10004d:	6a 0e                	push   $0xe
  10004f:	ff 35 8c d4 96 00    	pushl  0x96d48c
  100055:	e8 7a 27 00 00       	call   1027d4 <outb>
	pos = inb(addr_6845 + 1) << 8;
  10005a:	a1 8c d4 96 00       	mov    0x96d48c,%eax
  10005f:	83 c0 01             	add    $0x1,%eax
  100062:	89 04 24             	mov    %eax,(%esp)
  100065:	e8 52 27 00 00       	call   1027bc <inb>
  10006a:	0f b6 d8             	movzbl %al,%ebx
  10006d:	c1 e3 08             	shl    $0x8,%ebx
	outb(addr_6845, 15);
  100070:	83 c4 08             	add    $0x8,%esp
  100073:	6a 0f                	push   $0xf
  100075:	ff 35 8c d4 96 00    	pushl  0x96d48c
  10007b:	e8 54 27 00 00       	call   1027d4 <outb>
	pos |= inb(addr_6845 + 1);
  100080:	a1 8c d4 96 00       	mov    0x96d48c,%eax
  100085:	83 c0 01             	add    $0x1,%eax
  100088:	89 04 24             	mov    %eax,(%esp)
  10008b:	e8 2c 27 00 00       	call   1027bc <inb>
  100090:	0f b6 c0             	movzbl %al,%eax
  100093:	09 c3                	or     %eax,%ebx

	terminal.crt_buf = (uint16_t*) cp;
  100095:	89 35 80 d4 96 00    	mov    %esi,0x96d480
	terminal.crt_pos = pos;
  10009b:	66 89 1d 84 d4 96 00 	mov    %bx,0x96d484
	terminal.active_console = 0;
  1000a2:	c7 05 88 d4 96 00 00 	movl   $0x0,0x96d488
  1000a9:	00 00 00 
//  video_clear_screen();
}
  1000ac:	83 c4 14             	add    $0x14,%esp
  1000af:	5b                   	pop    %ebx
  1000b0:	5e                   	pop    %esi
  1000b1:	c3                   	ret    
	if (*cp != 0xA55A) {
		cp = (uint16_t*) MONO_BUF;
		addr_6845 = MONO_BASE;
		dprintf("addr_6845:%x\n",addr_6845);
	} else {
		*cp = was;
  1000b2:	66 89 15 00 80 0b 00 	mov    %dx,0xb8000
		addr_6845 = CGA_BASE;
  1000b9:	c7 05 8c d4 96 00 d4 	movl   $0x3d4,0x96d48c
  1000c0:	03 00 00 
		dprintf("addr_6845:%x\n",addr_6845);
  1000c3:	83 ec 08             	sub    $0x8,%esp
  1000c6:	68 d4 03 00 00       	push   $0x3d4
  1000cb:	68 a0 4b 10 00       	push   $0x104ba0
  1000d0:	e8 b5 1e 00 00       	call   101f8a <dprintf>
  1000d5:	83 c4 10             	add    $0x10,%esp
	volatile uint16_t *cp;
	uint16_t was;
	unsigned pos;

	/* Get a pointer to the memory-mapped text display buffer. */
	cp = (uint16_t*) CGA_BUF;
  1000d8:	be 00 80 0b 00       	mov    $0xb8000,%esi
  1000dd:	e9 68 ff ff ff       	jmp    10004a <video_init+0x4a>

001000e2 <video_putc>:
//  video_clear_screen();
}

void
video_putc(int c)
{
  1000e2:	83 ec 0c             	sub    $0xc,%esp
  1000e5:	8b 44 24 10          	mov    0x10(%esp),%eax

	// if no attribute given, then use black on white
	if (!(c & ~0xFF))
  1000e9:	a9 00 ff ff ff       	test   $0xffffff00,%eax
  1000ee:	75 03                	jne    1000f3 <video_putc+0x11>
		c |= 0x0700;
  1000f0:	80 cc 07             	or     $0x7,%ah

	switch (c & 0xff) {
  1000f3:	0f b6 d0             	movzbl %al,%edx
  1000f6:	83 fa 09             	cmp    $0x9,%edx
  1000f9:	0f 84 f2 00 00 00    	je     1001f1 <video_putc+0x10f>
  1000ff:	83 fa 09             	cmp    $0x9,%edx
  100102:	0f 8e 9d 00 00 00    	jle    1001a5 <video_putc+0xc3>
  100108:	83 fa 0a             	cmp    $0xa,%edx
  10010b:	0f 84 cb 00 00 00    	je     1001dc <video_putc+0xfa>
  100111:	83 fa 0d             	cmp    $0xd,%edx
  100114:	0f 85 19 01 00 00    	jne    100233 <video_putc+0x151>
		break;
	case '\n':
		terminal.crt_pos += CRT_COLS;
		/* fallthru */
	case '\r':
		terminal.crt_pos -= (terminal.crt_pos % CRT_COLS);
  10011a:	0f b7 05 84 d4 96 00 	movzwl 0x96d484,%eax
  100121:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  100127:	c1 e8 10             	shr    $0x10,%eax
  10012a:	66 c1 e8 06          	shr    $0x6,%ax
  10012e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100135:	01 d0                	add    %edx,%eax
  100137:	c1 e0 04             	shl    $0x4,%eax
  10013a:	66 a3 84 d4 96 00    	mov    %ax,0x96d484
	default:
		terminal.crt_buf[terminal.crt_pos++] = c;		/* write the character */
		break;
	}

	if (terminal.crt_pos >= CRT_SIZE) {
  100140:	66 81 3d 84 d4 96 00 	cmpw   $0x7cf,0x96d484
  100147:	cf 07 
  100149:	0f 87 07 01 00 00    	ja     100256 <video_putc+0x174>
		terminal.crt_pos -= CRT_COLS;
	}


	/* move that little blinky thing */
	outb(addr_6845, 14);
  10014f:	83 ec 08             	sub    $0x8,%esp
  100152:	6a 0e                	push   $0xe
  100154:	ff 35 8c d4 96 00    	pushl  0x96d48c
  10015a:	e8 75 26 00 00       	call   1027d4 <outb>
	outb(addr_6845 + 1, terminal.crt_pos >> 8);
  10015f:	a1 8c d4 96 00       	mov    0x96d48c,%eax
  100164:	83 c0 01             	add    $0x1,%eax
  100167:	83 c4 08             	add    $0x8,%esp
  10016a:	0f b6 15 85 d4 96 00 	movzbl 0x96d485,%edx
  100171:	52                   	push   %edx
  100172:	50                   	push   %eax
  100173:	e8 5c 26 00 00       	call   1027d4 <outb>
	outb(addr_6845, 15);
  100178:	83 c4 08             	add    $0x8,%esp
  10017b:	6a 0f                	push   $0xf
  10017d:	ff 35 8c d4 96 00    	pushl  0x96d48c
  100183:	e8 4c 26 00 00       	call   1027d4 <outb>
	outb(addr_6845 + 1, terminal.crt_pos);
  100188:	a1 8c d4 96 00       	mov    0x96d48c,%eax
  10018d:	83 c0 01             	add    $0x1,%eax
  100190:	83 c4 08             	add    $0x8,%esp
  100193:	0f b6 15 84 d4 96 00 	movzbl 0x96d484,%edx
  10019a:	52                   	push   %edx
  10019b:	50                   	push   %eax
  10019c:	e8 33 26 00 00       	call   1027d4 <outb>
       	  }
       outb(COM1+COM_TX, c);
       tmpcount++;
	  }
	*/
}
  1001a1:	83 c4 1c             	add    $0x1c,%esp
  1001a4:	c3                   	ret    

	// if no attribute given, then use black on white
	if (!(c & ~0xFF))
		c |= 0x0700;

	switch (c & 0xff) {
  1001a5:	83 fa 08             	cmp    $0x8,%edx
  1001a8:	0f 85 85 00 00 00    	jne    100233 <video_putc+0x151>
	case '\b':
		if (terminal.crt_pos > 0) {
  1001ae:	0f b7 15 84 d4 96 00 	movzwl 0x96d484,%edx
  1001b5:	66 85 d2             	test   %dx,%dx
  1001b8:	74 86                	je     100140 <video_putc+0x5e>
			terminal.crt_pos--;
  1001ba:	83 ea 01             	sub    $0x1,%edx
  1001bd:	66 89 15 84 d4 96 00 	mov    %dx,0x96d484
			terminal.crt_buf[terminal.crt_pos] = (c & ~0xff) | ' ';
  1001c4:	0f b7 d2             	movzwl %dx,%edx
  1001c7:	01 d2                	add    %edx,%edx
  1001c9:	03 15 80 d4 96 00    	add    0x96d480,%edx
  1001cf:	b0 00                	mov    $0x0,%al
  1001d1:	83 c8 20             	or     $0x20,%eax
  1001d4:	66 89 02             	mov    %ax,(%edx)
  1001d7:	e9 64 ff ff ff       	jmp    100140 <video_putc+0x5e>
		}
		break;
	case '\n':
		terminal.crt_pos += CRT_COLS;
  1001dc:	0f b7 05 84 d4 96 00 	movzwl 0x96d484,%eax
  1001e3:	83 c0 50             	add    $0x50,%eax
  1001e6:	66 a3 84 d4 96 00    	mov    %ax,0x96d484
  1001ec:	e9 29 ff ff ff       	jmp    10011a <video_putc+0x38>
		/* fallthru */
	case '\r':
		terminal.crt_pos -= (terminal.crt_pos % CRT_COLS);
		break;
	case '\t':
		video_putc(' ');
  1001f1:	83 ec 0c             	sub    $0xc,%esp
  1001f4:	6a 20                	push   $0x20
  1001f6:	e8 e7 fe ff ff       	call   1000e2 <video_putc>
		video_putc(' ');
  1001fb:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  100202:	e8 db fe ff ff       	call   1000e2 <video_putc>
		video_putc(' ');
  100207:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10020e:	e8 cf fe ff ff       	call   1000e2 <video_putc>
		video_putc(' ');
  100213:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10021a:	e8 c3 fe ff ff       	call   1000e2 <video_putc>
		video_putc(' ');
  10021f:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  100226:	e8 b7 fe ff ff       	call   1000e2 <video_putc>
		break;
  10022b:	83 c4 10             	add    $0x10,%esp
  10022e:	e9 0d ff ff ff       	jmp    100140 <video_putc+0x5e>
	default:
		terminal.crt_buf[terminal.crt_pos++] = c;		/* write the character */
  100233:	0f b7 15 84 d4 96 00 	movzwl 0x96d484,%edx
  10023a:	8d 4a 01             	lea    0x1(%edx),%ecx
  10023d:	66 89 0d 84 d4 96 00 	mov    %cx,0x96d484
  100244:	0f b7 d2             	movzwl %dx,%edx
  100247:	8b 0d 80 d4 96 00    	mov    0x96d480,%ecx
  10024d:	66 89 04 51          	mov    %ax,(%ecx,%edx,2)
		break;
  100251:	e9 ea fe ff ff       	jmp    100140 <video_putc+0x5e>
	}

	if (terminal.crt_pos >= CRT_SIZE) {
		int i;
		memmove(terminal.crt_buf, terminal.crt_buf + CRT_COLS,
  100256:	a1 80 d4 96 00       	mov    0x96d480,%eax
  10025b:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  100261:	83 ec 04             	sub    $0x4,%esp
  100264:	68 00 0f 00 00       	push   $0xf00
  100269:	52                   	push   %edx
  10026a:	50                   	push   %eax
  10026b:	e8 14 1a 00 00       	call   101c84 <memmove>
			(CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
		for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
  100270:	83 c4 10             	add    $0x10,%esp
  100273:	b8 80 07 00 00       	mov    $0x780,%eax
  100278:	eb 11                	jmp    10028b <video_putc+0x1a9>
			terminal.crt_buf[i] = 0x0700 | ' ';
  10027a:	8d 14 00             	lea    (%eax,%eax,1),%edx
  10027d:	03 15 80 d4 96 00    	add    0x96d480,%edx
  100283:	66 c7 02 20 07       	movw   $0x720,(%edx)

	if (terminal.crt_pos >= CRT_SIZE) {
		int i;
		memmove(terminal.crt_buf, terminal.crt_buf + CRT_COLS,
			(CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
		for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
  100288:	83 c0 01             	add    $0x1,%eax
  10028b:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  100290:	7e e8                	jle    10027a <video_putc+0x198>
			terminal.crt_buf[i] = 0x0700 | ' ';
		terminal.crt_pos -= CRT_COLS;
  100292:	0f b7 05 84 d4 96 00 	movzwl 0x96d484,%eax
  100299:	83 e8 50             	sub    $0x50,%eax
  10029c:	66 a3 84 d4 96 00    	mov    %ax,0x96d484
  1002a2:	e9 a8 fe ff ff       	jmp    10014f <video_putc+0x6d>

001002a7 <video_set_cursor>:
	*/
}

void
video_set_cursor (int x, int y)
{
  1002a7:	8b 44 24 04          	mov    0x4(%esp),%eax
    terminal.crt_pos = x * CRT_COLS + y;
  1002ab:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1002b2:	01 c2                	add    %eax,%edx
  1002b4:	89 d0                	mov    %edx,%eax
  1002b6:	c1 e0 04             	shl    $0x4,%eax
  1002b9:	66 03 44 24 08       	add    0x8(%esp),%ax
  1002be:	66 a3 84 d4 96 00    	mov    %ax,0x96d484
  1002c4:	c3                   	ret    

001002c5 <video_clear_screen>:

void
video_clear_screen ()
{
    int i;
    for (i = 0; i < CRT_SIZE; i++)
  1002c5:	b8 00 00 00 00       	mov    $0x0,%eax
  1002ca:	eb 11                	jmp    1002dd <video_clear_screen+0x18>
    {
        terminal.crt_buf[i] = ' ';
  1002cc:	8d 14 00             	lea    (%eax,%eax,1),%edx
  1002cf:	03 15 80 d4 96 00    	add    0x96d480,%edx
  1002d5:	66 c7 02 20 00       	movw   $0x20,(%edx)

void
video_clear_screen ()
{
    int i;
    for (i = 0; i < CRT_SIZE; i++)
  1002da:	83 c0 01             	add    $0x1,%eax
  1002dd:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  1002e2:	7e e8                	jle    1002cc <video_clear_screen+0x7>
    {
        terminal.crt_buf[i] = ' ';
    }
}
  1002e4:	f3 c3                	repz ret 

001002e6 <cons_init>:
	uint32_t rpos, wpos;
} cons;

void
cons_init()
{
  1002e6:	83 ec 10             	sub    $0x10,%esp
	memset(&cons, 0x0, sizeof(cons));
  1002e9:	68 08 02 00 00       	push   $0x208
  1002ee:	6a 00                	push   $0x0
  1002f0:	68 a0 d4 96 00       	push   $0x96d4a0
  1002f5:	e8 41 19 00 00       	call   101c3b <memset>
	serial_init();
  1002fa:	e8 c2 02 00 00       	call   1005c1 <serial_init>
	video_init();
  1002ff:	e8 fc fc ff ff       	call   100000 <video_init>
}
  100304:	83 c4 1c             	add    $0x1c,%esp
  100307:	c3                   	ret    

00100308 <cons_intr>:

void
cons_intr(int (*proc)(void))
{
  100308:	53                   	push   %ebx
  100309:	83 ec 08             	sub    $0x8,%esp
  10030c:	8b 5c 24 10          	mov    0x10(%esp),%ebx
	int c;

	while ((c = (*proc)()) != -1) {
  100310:	ff d3                	call   *%ebx
  100312:	83 f8 ff             	cmp    $0xffffffff,%eax
  100315:	74 2d                	je     100344 <cons_intr+0x3c>
		if (c == 0)
  100317:	85 c0                	test   %eax,%eax
  100319:	74 f5                	je     100310 <cons_intr+0x8>
			continue;
		cons.buf[cons.wpos++] = c;
  10031b:	8b 0d a4 d6 96 00    	mov    0x96d6a4,%ecx
  100321:	8d 51 01             	lea    0x1(%ecx),%edx
  100324:	89 15 a4 d6 96 00    	mov    %edx,0x96d6a4
  10032a:	88 81 a0 d4 96 00    	mov    %al,0x96d4a0(%ecx)
		if (cons.wpos == CONSOLE_BUFFER_SIZE)
  100330:	81 fa 00 02 00 00    	cmp    $0x200,%edx
  100336:	75 d8                	jne    100310 <cons_intr+0x8>
			cons.wpos = 0;
  100338:	c7 05 a4 d6 96 00 00 	movl   $0x0,0x96d6a4
  10033f:	00 00 00 
  100342:	eb cc                	jmp    100310 <cons_intr+0x8>
	}
}
  100344:	83 c4 08             	add    $0x8,%esp
  100347:	5b                   	pop    %ebx
  100348:	c3                   	ret    

00100349 <cons_getc>:

char
cons_getc(void)
{
  100349:	83 ec 0c             	sub    $0xc,%esp
  int c;

  // poll for any pending input characters,
  // so that this function works even when interrupts are disabled
  // (e.g., when called from the kernel monitor).
  serial_intr();
  10034c:	e8 e5 01 00 00       	call   100536 <serial_intr>
  keyboard_intr();
  100351:	e8 3f 04 00 00       	call   100795 <keyboard_intr>

  // grab the next character from the input buffer.
  if (cons.rpos != cons.wpos) {
  100356:	a1 a0 d6 96 00       	mov    0x96d6a0,%eax
  10035b:	3b 05 a4 d6 96 00    	cmp    0x96d6a4,%eax
  100361:	74 28                	je     10038b <cons_getc+0x42>
    c = cons.buf[cons.rpos++];
  100363:	8d 50 01             	lea    0x1(%eax),%edx
  100366:	89 15 a0 d6 96 00    	mov    %edx,0x96d6a0
  10036c:	0f b6 80 a0 d4 96 00 	movzbl 0x96d4a0(%eax),%eax
    if (cons.rpos == CONSOLE_BUFFER_SIZE)
  100373:	81 fa 00 02 00 00    	cmp    $0x200,%edx
  100379:	74 04                	je     10037f <cons_getc+0x36>
      cons.rpos = 0;
    return c;
  }
  return 0;
}
  10037b:	83 c4 0c             	add    $0xc,%esp
  10037e:	c3                   	ret    

  // grab the next character from the input buffer.
  if (cons.rpos != cons.wpos) {
    c = cons.buf[cons.rpos++];
    if (cons.rpos == CONSOLE_BUFFER_SIZE)
      cons.rpos = 0;
  10037f:	c7 05 a0 d6 96 00 00 	movl   $0x0,0x96d6a0
  100386:	00 00 00 
  100389:	eb f0                	jmp    10037b <cons_getc+0x32>
    return c;
  }
  return 0;
  10038b:	b8 00 00 00 00       	mov    $0x0,%eax
  100390:	eb e9                	jmp    10037b <cons_getc+0x32>

00100392 <cons_putc>:
}

void
cons_putc(char c)
{
  100392:	53                   	push   %ebx
  100393:	83 ec 14             	sub    $0x14,%esp
	serial_putc(c);
  100396:	0f be 5c 24 1c       	movsbl 0x1c(%esp),%ebx
  10039b:	53                   	push   %ebx
  10039c:	e8 b2 01 00 00       	call   100553 <serial_putc>
  video_putc(c);
  1003a1:	89 1c 24             	mov    %ebx,(%esp)
  1003a4:	e8 39 fd ff ff       	call   1000e2 <video_putc>
}
  1003a9:	83 c4 18             	add    $0x18,%esp
  1003ac:	5b                   	pop    %ebx
  1003ad:	c3                   	ret    

001003ae <getchar>:

char
getchar(void)
{
  1003ae:	83 ec 0c             	sub    $0xc,%esp
  char c;

  while ((c = cons_getc()) == 0)
  1003b1:	e8 93 ff ff ff       	call   100349 <cons_getc>
  1003b6:	84 c0                	test   %al,%al
  1003b8:	74 f7                	je     1003b1 <getchar+0x3>
    /* do nothing */;
  return c;
}
  1003ba:	83 c4 0c             	add    $0xc,%esp
  1003bd:	c3                   	ret    

001003be <putchar>:

void
putchar(char c)
{
  1003be:	83 ec 18             	sub    $0x18,%esp
  cons_putc(c);
  1003c1:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
  1003c6:	50                   	push   %eax
  1003c7:	e8 c6 ff ff ff       	call   100392 <cons_putc>
}
  1003cc:	83 c4 1c             	add    $0x1c,%esp
  1003cf:	c3                   	ret    

001003d0 <readline>:

char *
readline(const char *prompt)
{
  1003d0:	56                   	push   %esi
  1003d1:	53                   	push   %ebx
  1003d2:	83 ec 04             	sub    $0x4,%esp
  1003d5:	8b 44 24 10          	mov    0x10(%esp),%eax
  int i;
  char c;

  if (prompt != NULL)
  1003d9:	85 c0                	test   %eax,%eax
  1003db:	74 11                	je     1003ee <readline+0x1e>
    dprintf("%s", prompt);
  1003dd:	83 ec 08             	sub    $0x8,%esp
  1003e0:	50                   	push   %eax
  1003e1:	68 ae 4b 10 00       	push   $0x104bae
  1003e6:	e8 9f 1b 00 00       	call   101f8a <dprintf>
  1003eb:	83 c4 10             	add    $0x10,%esp
    } else if ((c == '\b' || c == '\x7f') && i > 0) {
      putchar('\b');
      i--;
    } else if (c >= ' ' && i < BUFLEN-1) {
      putchar(c);
      linebuf[i++] = c;
  1003ee:	be 00 00 00 00       	mov    $0x0,%esi
  1003f3:	eb 42                	jmp    100437 <readline+0x67>

  i = 0;
  while (1) {
    c = getchar();
    if (c < 0) {
      dprintf("read error: %e\n", c);
  1003f5:	83 ec 08             	sub    $0x8,%esp
  1003f8:	0f be d8             	movsbl %al,%ebx
  1003fb:	53                   	push   %ebx
  1003fc:	68 b1 4b 10 00       	push   $0x104bb1
  100401:	e8 84 1b 00 00       	call   101f8a <dprintf>
      return NULL;
  100406:	83 c4 10             	add    $0x10,%esp
  100409:	b8 00 00 00 00       	mov    $0x0,%eax
      putchar('\n');
      linebuf[i] = 0;
      return linebuf;
    }
  }
}
  10040e:	83 c4 04             	add    $0x4,%esp
  100411:	5b                   	pop    %ebx
  100412:	5e                   	pop    %esi
  100413:	c3                   	ret    
      dprintf("read error: %e\n", c);
      return NULL;
    } else if ((c == '\b' || c == '\x7f') && i > 0) {
      putchar('\b');
      i--;
    } else if (c >= ' ' && i < BUFLEN-1) {
  100414:	80 fb 1f             	cmp    $0x1f,%bl
  100417:	0f 9f c2             	setg   %dl
  10041a:	81 fe fe 03 00 00    	cmp    $0x3fe,%esi
  100420:	0f 9e c0             	setle  %al
  100423:	84 c2                	test   %al,%dl
  100425:	75 3f                	jne    100466 <readline+0x96>
      putchar(c);
      linebuf[i++] = c;
    } else if (c == '\n' || c == '\r') {
  100427:	80 fb 0a             	cmp    $0xa,%bl
  10042a:	0f 94 c2             	sete   %dl
  10042d:	80 fb 0d             	cmp    $0xd,%bl
  100430:	0f 94 c0             	sete   %al
  100433:	08 c2                	or     %al,%dl
  100435:	75 49                	jne    100480 <readline+0xb0>
  if (prompt != NULL)
    dprintf("%s", prompt);

  i = 0;
  while (1) {
    c = getchar();
  100437:	e8 72 ff ff ff       	call   1003ae <getchar>
  10043c:	89 c3                	mov    %eax,%ebx
    if (c < 0) {
  10043e:	84 c0                	test   %al,%al
  100440:	78 b3                	js     1003f5 <readline+0x25>
      dprintf("read error: %e\n", c);
      return NULL;
    } else if ((c == '\b' || c == '\x7f') && i > 0) {
  100442:	3c 08                	cmp    $0x8,%al
  100444:	0f 94 c2             	sete   %dl
  100447:	3c 7f                	cmp    $0x7f,%al
  100449:	0f 94 c0             	sete   %al
  10044c:	08 c2                	or     %al,%dl
  10044e:	74 c4                	je     100414 <readline+0x44>
  100450:	85 f6                	test   %esi,%esi
  100452:	7e c0                	jle    100414 <readline+0x44>
      putchar('\b');
  100454:	83 ec 0c             	sub    $0xc,%esp
  100457:	6a 08                	push   $0x8
  100459:	e8 60 ff ff ff       	call   1003be <putchar>
      i--;
  10045e:	83 ee 01             	sub    $0x1,%esi
  100461:	83 c4 10             	add    $0x10,%esp
  100464:	eb d1                	jmp    100437 <readline+0x67>
    } else if (c >= ' ' && i < BUFLEN-1) {
      putchar(c);
  100466:	83 ec 0c             	sub    $0xc,%esp
  100469:	0f be c3             	movsbl %bl,%eax
  10046c:	50                   	push   %eax
  10046d:	e8 4c ff ff ff       	call   1003be <putchar>
      linebuf[i++] = c;
  100472:	88 9e 00 c0 12 00    	mov    %bl,0x12c000(%esi)
  100478:	83 c4 10             	add    $0x10,%esp
  10047b:	8d 76 01             	lea    0x1(%esi),%esi
  10047e:	eb b7                	jmp    100437 <readline+0x67>
    } else if (c == '\n' || c == '\r') {
      putchar('\n');
  100480:	83 ec 0c             	sub    $0xc,%esp
  100483:	6a 0a                	push   $0xa
  100485:	e8 34 ff ff ff       	call   1003be <putchar>
      linebuf[i] = 0;
  10048a:	c6 86 00 c0 12 00 00 	movb   $0x0,0x12c000(%esi)
      return linebuf;
  100491:	83 c4 10             	add    $0x10,%esp
  100494:	b8 00 c0 12 00       	mov    $0x12c000,%eax
  100499:	e9 70 ff ff ff       	jmp    10040e <readline+0x3e>

0010049e <serial_proc_data>:
	inb(0x84);
}

static int
serial_proc_data(void)
{
  10049e:	83 ec 18             	sub    $0x18,%esp
	if (!(inb(COM1+COM_LSR) & COM_LSR_DATA))
  1004a1:	68 fd 03 00 00       	push   $0x3fd
  1004a6:	e8 11 23 00 00       	call   1027bc <inb>
  1004ab:	83 c4 10             	add    $0x10,%esp
  1004ae:	a8 01                	test   $0x1,%al
  1004b0:	74 17                	je     1004c9 <serial_proc_data+0x2b>
		return -1;
	return inb(COM1+COM_RX);
  1004b2:	83 ec 0c             	sub    $0xc,%esp
  1004b5:	68 f8 03 00 00       	push   $0x3f8
  1004ba:	e8 fd 22 00 00       	call   1027bc <inb>
  1004bf:	0f b6 c0             	movzbl %al,%eax
  1004c2:	83 c4 10             	add    $0x10,%esp
}
  1004c5:	83 c4 0c             	add    $0xc,%esp
  1004c8:	c3                   	ret    

static int
serial_proc_data(void)
{
	if (!(inb(COM1+COM_LSR) & COM_LSR_DATA))
		return -1;
  1004c9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1004ce:	eb f5                	jmp    1004c5 <serial_proc_data+0x27>

001004d0 <delay>:
bool serial_exists;

// Stupid I/O delay routine necessitated by historical PC design flaws
static void
delay(void)
{
  1004d0:	83 ec 18             	sub    $0x18,%esp
	inb(0x84);
  1004d3:	68 84 00 00 00       	push   $0x84
  1004d8:	e8 df 22 00 00       	call   1027bc <inb>
	inb(0x84);
  1004dd:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  1004e4:	e8 d3 22 00 00       	call   1027bc <inb>
	inb(0x84);
  1004e9:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  1004f0:	e8 c7 22 00 00       	call   1027bc <inb>
	inb(0x84);
  1004f5:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  1004fc:	e8 bb 22 00 00       	call   1027bc <inb>
}
  100501:	83 c4 1c             	add    $0x1c,%esp
  100504:	c3                   	ret    

00100505 <serial_reformatnewline>:
	int nl = '\n';
	/* POSIX requires newline on the serial line to
	 * be a CR-LF pair. Without this, you get a malformed output
	 * with clients like minicom or screen
	 */
	if (c == nl) {
  100505:	83 f8 0a             	cmp    $0xa,%eax
  100508:	74 06                	je     100510 <serial_reformatnewline+0xb>
		outb(p, cr);
		outb(p, nl);
		return 1;
	}
	else
		return 0;
  10050a:	b8 00 00 00 00       	mov    $0x0,%eax
  10050f:	c3                   	ret    
		cons_intr(serial_proc_data);
}

static int
serial_reformatnewline(int c, int p)
{
  100510:	53                   	push   %ebx
  100511:	83 ec 10             	sub    $0x10,%esp
  100514:	89 d3                	mov    %edx,%ebx
	/* POSIX requires newline on the serial line to
	 * be a CR-LF pair. Without this, you get a malformed output
	 * with clients like minicom or screen
	 */
	if (c == nl) {
		outb(p, cr);
  100516:	6a 0d                	push   $0xd
  100518:	52                   	push   %edx
  100519:	e8 b6 22 00 00       	call   1027d4 <outb>
		outb(p, nl);
  10051e:	83 c4 08             	add    $0x8,%esp
  100521:	6a 0a                	push   $0xa
  100523:	53                   	push   %ebx
  100524:	e8 ab 22 00 00       	call   1027d4 <outb>
		return 1;
  100529:	83 c4 10             	add    $0x10,%esp
  10052c:	b8 01 00 00 00       	mov    $0x1,%eax
	}
	else
		return 0;
}
  100531:	83 c4 08             	add    $0x8,%esp
  100534:	5b                   	pop    %ebx
  100535:	c3                   	ret    

00100536 <serial_intr>:
}

void
serial_intr(void)
{
	if (serial_exists)
  100536:	80 3d a8 d6 96 00 00 	cmpb   $0x0,0x96d6a8
  10053d:	75 02                	jne    100541 <serial_intr+0xb>
		cons_intr(serial_proc_data);
}
  10053f:	f3 c3                	repz ret 
	return inb(COM1+COM_RX);
}

void
serial_intr(void)
{
  100541:	83 ec 18             	sub    $0x18,%esp
	if (serial_exists)
		cons_intr(serial_proc_data);
  100544:	68 9e 04 10 00       	push   $0x10049e
  100549:	e8 ba fd ff ff       	call   100308 <cons_intr>
}
  10054e:	83 c4 1c             	add    $0x1c,%esp
  100551:	eb ec                	jmp    10053f <serial_intr+0x9>

00100553 <serial_putc>:
		return 0;
}

void
serial_putc(char c)
{
  100553:	56                   	push   %esi
  100554:	53                   	push   %ebx
  100555:	83 ec 04             	sub    $0x4,%esp
  100558:	8b 74 24 10          	mov    0x10(%esp),%esi
	if (!serial_exists)
  10055c:	80 3d a8 d6 96 00 00 	cmpb   $0x0,0x96d6a8
  100563:	74 3e                	je     1005a3 <serial_putc+0x50>
  100565:	bb 00 00 00 00       	mov    $0x0,%ebx
		return;

	int i;
	for (i = 0;
	     !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800;
  10056a:	83 ec 0c             	sub    $0xc,%esp
  10056d:	68 fd 03 00 00       	push   $0x3fd
  100572:	e8 45 22 00 00       	call   1027bc <inb>
{
	if (!serial_exists)
		return;

	int i;
	for (i = 0;
  100577:	83 c4 10             	add    $0x10,%esp
  10057a:	a8 20                	test   $0x20,%al
  10057c:	75 12                	jne    100590 <serial_putc+0x3d>
	     !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800;
  10057e:	81 fb ff 31 00 00    	cmp    $0x31ff,%ebx
  100584:	7f 0a                	jg     100590 <serial_putc+0x3d>
	     i++)
		delay();
  100586:	e8 45 ff ff ff       	call   1004d0 <delay>
		return;

	int i;
	for (i = 0;
	     !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800;
	     i++)
  10058b:	83 c3 01             	add    $0x1,%ebx
  10058e:	eb da                	jmp    10056a <serial_putc+0x17>
		delay();

	if (!serial_reformatnewline(c, COM1 + COM_TX))
  100590:	89 f0                	mov    %esi,%eax
  100592:	0f be c0             	movsbl %al,%eax
  100595:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10059a:	e8 66 ff ff ff       	call   100505 <serial_reformatnewline>
  10059f:	85 c0                	test   %eax,%eax
  1005a1:	74 06                	je     1005a9 <serial_putc+0x56>
		outb(COM1 + COM_TX, c);
}
  1005a3:	83 c4 04             	add    $0x4,%esp
  1005a6:	5b                   	pop    %ebx
  1005a7:	5e                   	pop    %esi
  1005a8:	c3                   	ret    
	     !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800;
	     i++)
		delay();

	if (!serial_reformatnewline(c, COM1 + COM_TX))
		outb(COM1 + COM_TX, c);
  1005a9:	83 ec 08             	sub    $0x8,%esp
  1005ac:	89 f0                	mov    %esi,%eax
  1005ae:	0f b6 f0             	movzbl %al,%esi
  1005b1:	56                   	push   %esi
  1005b2:	68 f8 03 00 00       	push   $0x3f8
  1005b7:	e8 18 22 00 00       	call   1027d4 <outb>
  1005bc:	83 c4 10             	add    $0x10,%esp
  1005bf:	eb e2                	jmp    1005a3 <serial_putc+0x50>

001005c1 <serial_init>:
}

void
serial_init(void)
{
  1005c1:	83 ec 14             	sub    $0x14,%esp
	/* turn off interrupt */
	outb(COM1 + COM_IER, 0);
  1005c4:	6a 00                	push   $0x0
  1005c6:	68 f9 03 00 00       	push   $0x3f9
  1005cb:	e8 04 22 00 00       	call   1027d4 <outb>

	/* set DLAB */
	outb(COM1 + COM_LCR, COM_LCR_DLAB);
  1005d0:	83 c4 08             	add    $0x8,%esp
  1005d3:	68 80 00 00 00       	push   $0x80
  1005d8:	68 fb 03 00 00       	push   $0x3fb
  1005dd:	e8 f2 21 00 00       	call   1027d4 <outb>

	/* set baud rate */
	outb(COM1 + COM_DLL, 0x0001 & 0xff);
  1005e2:	83 c4 08             	add    $0x8,%esp
  1005e5:	6a 01                	push   $0x1
  1005e7:	68 f8 03 00 00       	push   $0x3f8
  1005ec:	e8 e3 21 00 00       	call   1027d4 <outb>
	outb(COM1 + COM_DLM, 0x0001 >> 8);
  1005f1:	83 c4 08             	add    $0x8,%esp
  1005f4:	6a 00                	push   $0x0
  1005f6:	68 f9 03 00 00       	push   $0x3f9
  1005fb:	e8 d4 21 00 00       	call   1027d4 <outb>

	/* Set the line status.  */
	outb(COM1 + COM_LCR, COM_LCR_WLEN8 & ~COM_LCR_DLAB);
  100600:	83 c4 08             	add    $0x8,%esp
  100603:	6a 03                	push   $0x3
  100605:	68 fb 03 00 00       	push   $0x3fb
  10060a:	e8 c5 21 00 00       	call   1027d4 <outb>

	/* Enable the FIFO.  */
	outb(COM1 + COM_FCR, 0xc7);
  10060f:	83 c4 08             	add    $0x8,%esp
  100612:	68 c7 00 00 00       	push   $0xc7
  100617:	68 fa 03 00 00       	push   $0x3fa
  10061c:	e8 b3 21 00 00       	call   1027d4 <outb>

	/* Turn on DTR, RTS, and OUT2.  */
	outb(COM1 + COM_MCR, 0x0b);
  100621:	83 c4 08             	add    $0x8,%esp
  100624:	6a 0b                	push   $0xb
  100626:	68 fc 03 00 00       	push   $0x3fc
  10062b:	e8 a4 21 00 00       	call   1027d4 <outb>

	// Clear any preexisting overrun indications and interrupts
	// Serial COM1 doesn't exist if COM_LSR returns 0xFF
	serial_exists = (inb(COM1+COM_LSR) != 0xFF);
  100630:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
  100637:	e8 80 21 00 00       	call   1027bc <inb>
  10063c:	3c ff                	cmp    $0xff,%al
  10063e:	0f 95 05 a8 d6 96 00 	setne  0x96d6a8
	(void) inb(COM1+COM_IIR);
  100645:	c7 04 24 fa 03 00 00 	movl   $0x3fa,(%esp)
  10064c:	e8 6b 21 00 00       	call   1027bc <inb>
	(void) inb(COM1+COM_RX);
  100651:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
  100658:	e8 5f 21 00 00       	call   1027bc <inb>
}
  10065d:	83 c4 1c             	add    $0x1c,%esp
  100660:	c3                   	ret    

00100661 <serial_intenable>:

void
serial_intenable(void)
{
	if (serial_exists) {
  100661:	80 3d a8 d6 96 00 00 	cmpb   $0x0,0x96d6a8
  100668:	75 02                	jne    10066c <serial_intenable+0xb>
		outb(COM1+COM_IER, 1);
		//intr_enable(IRQ_SERIAL13);
		serial_intr();
	}
}
  10066a:	f3 c3                	repz ret 
	(void) inb(COM1+COM_RX);
}

void
serial_intenable(void)
{
  10066c:	83 ec 14             	sub    $0x14,%esp
	if (serial_exists) {
		outb(COM1+COM_IER, 1);
  10066f:	6a 01                	push   $0x1
  100671:	68 f9 03 00 00       	push   $0x3f9
  100676:	e8 59 21 00 00       	call   1027d4 <outb>
		//intr_enable(IRQ_SERIAL13);
		serial_intr();
  10067b:	e8 b6 fe ff ff       	call   100536 <serial_intr>
	}
}
  100680:	83 c4 1c             	add    $0x1c,%esp
  100683:	eb e5                	jmp    10066a <serial_intenable+0x9>

00100685 <kbd_proc_data>:
 * Get data from the keyboard.  If we finish a character, return it.  Else 0.
 * Return -1 if no data.
 */
static int
kbd_proc_data(void)
{
  100685:	53                   	push   %ebx
  100686:	83 ec 14             	sub    $0x14,%esp
  int c;
  uint8_t data;
  static uint32_t shift;

  if ((inb(KBSTATP) & KBS_DIB) == 0)
  100689:	6a 64                	push   $0x64
  10068b:	e8 2c 21 00 00       	call   1027bc <inb>
  100690:	83 c4 10             	add    $0x10,%esp
  100693:	a8 01                	test   $0x1,%al
  100695:	0f 84 f3 00 00 00    	je     10078e <kbd_proc_data+0x109>
    return -1;

  data = inb(KBDATAP);
  10069b:	83 ec 0c             	sub    $0xc,%esp
  10069e:	6a 60                	push   $0x60
  1006a0:	e8 17 21 00 00       	call   1027bc <inb>
  1006a5:	89 c2                	mov    %eax,%edx

  if (data == 0xE0) {
  1006a7:	83 c4 10             	add    $0x10,%esp
  1006aa:	3c e0                	cmp    $0xe0,%al
  1006ac:	74 74                	je     100722 <kbd_proc_data+0x9d>
    // E0 escape character
    shift |= E0ESC;
    return 0;
  } else if (data & 0x80) {
  1006ae:	84 c0                	test   %al,%al
  1006b0:	78 7e                	js     100730 <kbd_proc_data+0xab>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if (shift & E0ESC) {
  1006b2:	8b 0d 00 c4 12 00    	mov    0x12c400,%ecx
  1006b8:	f6 c1 40             	test   $0x40,%cl
  1006bb:	74 0e                	je     1006cb <kbd_proc_data+0x46>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
  1006bd:	89 c2                	mov    %eax,%edx
  1006bf:	83 ca 80             	or     $0xffffff80,%edx
    shift &= ~E0ESC;
  1006c2:	83 e1 bf             	and    $0xffffffbf,%ecx
  1006c5:	89 0d 00 c4 12 00    	mov    %ecx,0x12c400
  }

  shift |= shiftcode[data];
  1006cb:	0f b6 d2             	movzbl %dl,%edx
  1006ce:	0f b6 82 00 4d 10 00 	movzbl 0x104d00(%edx),%eax
  1006d5:	0b 05 00 c4 12 00    	or     0x12c400,%eax
  shift ^= togglecode[data];
  1006db:	0f b6 8a 00 4c 10 00 	movzbl 0x104c00(%edx),%ecx
  1006e2:	31 c8                	xor    %ecx,%eax
  1006e4:	a3 00 c4 12 00       	mov    %eax,0x12c400

  c = charcode[shift & (CTL | SHIFT)][data];
  1006e9:	89 c1                	mov    %eax,%ecx
  1006eb:	83 e1 03             	and    $0x3,%ecx
  1006ee:	8b 0c 8d e0 4b 10 00 	mov    0x104be0(,%ecx,4),%ecx
  1006f5:	0f b6 14 11          	movzbl (%ecx,%edx,1),%edx
  1006f9:	0f b6 da             	movzbl %dl,%ebx
  if (shift & CAPSLOCK) {
  1006fc:	a8 08                	test   $0x8,%al
  1006fe:	74 0d                	je     10070d <kbd_proc_data+0x88>
    if ('a' <= c && c <= 'z')
  100700:	89 da                	mov    %ebx,%edx
  100702:	8d 4b 9f             	lea    -0x61(%ebx),%ecx
  100705:	83 f9 19             	cmp    $0x19,%ecx
  100708:	77 56                	ja     100760 <kbd_proc_data+0xdb>
      c += 'A' - 'a';
  10070a:	83 eb 20             	sub    $0x20,%ebx
      c += 'a' - 'A';
  }

  // Process special keys
  // Ctrl-Alt-Del: reboot
  if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  10070d:	f7 d0                	not    %eax
  10070f:	a8 06                	test   $0x6,%al
  100711:	75 08                	jne    10071b <kbd_proc_data+0x96>
  100713:	81 fb e9 00 00 00    	cmp    $0xe9,%ebx
  100719:	74 52                	je     10076d <kbd_proc_data+0xe8>
    dprintf("Rebooting!\n");
    outb(0x92, 0x3); // courtesy of Chris Frost
  }

  return c;
}
  10071b:	89 d8                	mov    %ebx,%eax
  10071d:	83 c4 08             	add    $0x8,%esp
  100720:	5b                   	pop    %ebx
  100721:	c3                   	ret    

  data = inb(KBDATAP);

  if (data == 0xE0) {
    // E0 escape character
    shift |= E0ESC;
  100722:	83 0d 00 c4 12 00 40 	orl    $0x40,0x12c400
    return 0;
  100729:	bb 00 00 00 00       	mov    $0x0,%ebx
  10072e:	eb eb                	jmp    10071b <kbd_proc_data+0x96>
  } else if (data & 0x80) {
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
  100730:	8b 0d 00 c4 12 00    	mov    0x12c400,%ecx
  100736:	f6 c1 40             	test   $0x40,%cl
  100739:	75 05                	jne    100740 <kbd_proc_data+0xbb>
  10073b:	89 c2                	mov    %eax,%edx
  10073d:	83 e2 7f             	and    $0x7f,%edx
    shift &= ~(shiftcode[data] | E0ESC);
  100740:	0f b6 d2             	movzbl %dl,%edx
  100743:	0f b6 82 00 4d 10 00 	movzbl 0x104d00(%edx),%eax
  10074a:	83 c8 40             	or     $0x40,%eax
  10074d:	0f b6 c0             	movzbl %al,%eax
  100750:	f7 d0                	not    %eax
  100752:	21 c8                	and    %ecx,%eax
  100754:	a3 00 c4 12 00       	mov    %eax,0x12c400
    return 0;
  100759:	bb 00 00 00 00       	mov    $0x0,%ebx
  10075e:	eb bb                	jmp    10071b <kbd_proc_data+0x96>

  c = charcode[shift & (CTL | SHIFT)][data];
  if (shift & CAPSLOCK) {
    if ('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if ('A' <= c && c <= 'Z')
  100760:	83 ea 41             	sub    $0x41,%edx
  100763:	83 fa 19             	cmp    $0x19,%edx
  100766:	77 a5                	ja     10070d <kbd_proc_data+0x88>
      c += 'a' - 'A';
  100768:	83 c3 20             	add    $0x20,%ebx
  10076b:	eb a0                	jmp    10070d <kbd_proc_data+0x88>
  }

  // Process special keys
  // Ctrl-Alt-Del: reboot
  if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
    dprintf("Rebooting!\n");
  10076d:	83 ec 0c             	sub    $0xc,%esp
  100770:	68 c1 4b 10 00       	push   $0x104bc1
  100775:	e8 10 18 00 00       	call   101f8a <dprintf>
    outb(0x92, 0x3); // courtesy of Chris Frost
  10077a:	83 c4 08             	add    $0x8,%esp
  10077d:	6a 03                	push   $0x3
  10077f:	68 92 00 00 00       	push   $0x92
  100784:	e8 4b 20 00 00       	call   1027d4 <outb>
  100789:	83 c4 10             	add    $0x10,%esp
  10078c:	eb 8d                	jmp    10071b <kbd_proc_data+0x96>
  int c;
  uint8_t data;
  static uint32_t shift;

  if ((inb(KBSTATP) & KBS_DIB) == 0)
    return -1;
  10078e:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  100793:	eb 86                	jmp    10071b <kbd_proc_data+0x96>

00100795 <keyboard_intr>:
  return c;
}

void
keyboard_intr(void)
{
  100795:	83 ec 18             	sub    $0x18,%esp
  cons_intr(kbd_proc_data);
  100798:	68 85 06 10 00       	push   $0x100685
  10079d:	e8 66 fb ff ff       	call   100308 <cons_intr>
}
  1007a2:	83 c4 1c             	add    $0x1c,%esp
  1007a5:	c3                   	ret    

001007a6 <devinit>:

void intr_init(void);

void
devinit (uintptr_t mbi_addr)
{
  1007a6:	53                   	push   %ebx
  1007a7:	83 ec 08             	sub    $0x8,%esp
  1007aa:	8b 5c 24 10          	mov    0x10(%esp),%ebx
	seg_init ();
  1007ae:	e8 84 1c 00 00       	call   102437 <seg_init>

	enable_sse ();
  1007b3:	e8 75 1f 00 00       	call   10272d <enable_sse>

	cons_init ();
  1007b8:	e8 29 fb ff ff       	call   1002e6 <cons_init>
	KERN_DEBUG("cons initialized.\n");
  1007bd:	83 ec 04             	sub    $0x4,%esp
  1007c0:	68 00 4e 10 00       	push   $0x104e00
  1007c5:	6a 15                	push   $0x15
  1007c7:	68 13 4e 10 00       	push   $0x104e13
  1007cc:	e8 3a 16 00 00       	call   101e0b <debug_normal>
	KERN_DEBUG("devinit mbi_adr: %d\n", mbi_addr);
  1007d1:	53                   	push   %ebx
  1007d2:	68 26 4e 10 00       	push   $0x104e26
  1007d7:	6a 16                	push   $0x16
  1007d9:	68 13 4e 10 00       	push   $0x104e13
  1007de:	e8 28 16 00 00       	call   101e0b <debug_normal>

  tsc_init();
  1007e3:	83 c4 20             	add    $0x20,%esp
  1007e6:	e8 33 11 00 00       	call   10191e <tsc_init>

	intr_init();
  1007eb:	e8 ed 0c 00 00       	call   1014dd <intr_init>

  /* enable interrupts */
  intr_enable (IRQ_TIMER);
  1007f0:	83 ec 0c             	sub    $0xc,%esp
  1007f3:	6a 00                	push   $0x0
  1007f5:	e8 07 0d 00 00       	call   101501 <intr_enable>
  intr_enable (IRQ_KBD);
  1007fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  100801:	e8 fb 0c 00 00       	call   101501 <intr_enable>
  intr_enable (IRQ_SERIAL13);
  100806:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  10080d:	e8 ef 0c 00 00       	call   101501 <intr_enable>

	pmmap_init (mbi_addr);
  100812:	89 1c 24             	mov    %ebx,(%esp)
  100815:	e8 24 02 00 00       	call   100a3e <pmmap_init>

}
  10081a:	83 c4 18             	add    $0x18,%esp
  10081d:	5b                   	pop    %ebx
  10081e:	c3                   	ret    

0010081f <pmmap_dump>:
		max_usable_memory = last_slot[PMMAP_USABLE]->end;
}

static void
pmmap_dump(void)
{
  10081f:	53                   	push   %ebx
  100820:	83 ec 08             	sub    $0x8,%esp
	struct pmmap *slot;
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100823:	8b 1d 38 c4 12 00    	mov    0x12c438,%ebx
  100829:	eb 30                	jmp    10085b <pmmap_dump+0x3c>
		KERN_INFO("BIOS-e820: 0x%08x - 0x%08x (%s)\n",
  10082b:	b9 5d 4e 10 00       	mov    $0x104e5d,%ecx
  100830:	eb 05                	jmp    100837 <pmmap_dump+0x18>
  100832:	b9 44 4e 10 00       	mov    $0x104e44,%ecx
  100837:	8b 13                	mov    (%ebx),%edx
  100839:	8b 43 04             	mov    0x4(%ebx),%eax
  10083c:	39 c2                	cmp    %eax,%edx
  10083e:	74 08                	je     100848 <pmmap_dump+0x29>
  100840:	83 f8 ff             	cmp    $0xffffffff,%eax
  100843:	74 03                	je     100848 <pmmap_dump+0x29>
  100845:	83 e8 01             	sub    $0x1,%eax
  100848:	51                   	push   %ecx
  100849:	50                   	push   %eax
  10084a:	52                   	push   %edx
  10084b:	68 c4 4e 10 00       	push   $0x104ec4
  100850:	e8 9e 15 00 00       	call   101df3 <debug_info>

static void
pmmap_dump(void)
{
	struct pmmap *slot;
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100855:	8b 5b 0c             	mov    0xc(%ebx),%ebx
  100858:	83 c4 10             	add    $0x10,%esp
  10085b:	85 db                	test   %ebx,%ebx
  10085d:	74 2c                	je     10088b <pmmap_dump+0x6c>
		KERN_INFO("BIOS-e820: 0x%08x - 0x%08x (%s)\n",
  10085f:	8b 43 08             	mov    0x8(%ebx),%eax
  100862:	83 f8 01             	cmp    $0x1,%eax
  100865:	74 cb                	je     100832 <pmmap_dump+0x13>
  100867:	83 f8 02             	cmp    $0x2,%eax
  10086a:	74 11                	je     10087d <pmmap_dump+0x5e>
  10086c:	83 f8 03             	cmp    $0x3,%eax
  10086f:	74 13                	je     100884 <pmmap_dump+0x65>
  100871:	83 f8 04             	cmp    $0x4,%eax
  100874:	74 b5                	je     10082b <pmmap_dump+0xc>
  100876:	b9 55 4e 10 00       	mov    $0x104e55,%ecx
  10087b:	eb ba                	jmp    100837 <pmmap_dump+0x18>
  10087d:	b9 3b 4e 10 00       	mov    $0x104e3b,%ecx
  100882:	eb b3                	jmp    100837 <pmmap_dump+0x18>
  100884:	b9 4b 4e 10 00       	mov    $0x104e4b,%ecx
  100889:	eb ac                	jmp    100837 <pmmap_dump+0x18>
			  (slot->type == MEM_RESERVED) ? "reserved" :
			  (slot->type == MEM_ACPI) ? "ACPI data" :
			  (slot->type == MEM_NVS) ? "ACPI NVS" :
			  "unknown");
	}
}
  10088b:	83 c4 08             	add    $0x8,%esp
  10088e:	5b                   	pop    %ebx
  10088f:	c3                   	ret    

00100890 <pmmap_merge>:
  }
}

static void
pmmap_merge(void)
{
  100890:	56                   	push   %esi
  100891:	53                   	push   %ebx
  100892:	83 ec 14             	sub    $0x14,%esp
	struct pmmap *slot, *next_slot;
	struct pmmap *last_slot[4] = { NULL, NULL, NULL, NULL };
  100895:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10089c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  1008a3:	00 
  1008a4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  1008ab:	00 
  1008ac:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  1008b3:	00 
	int sublist_nr;

	/*
	 * Step 1: Merge overlaped entries in pmmap_list.
	 */
	SLIST_FOREACH(slot, &pmmap_list, next) {
  1008b4:	8b 1d 38 c4 12 00    	mov    0x12c438,%ebx
  1008ba:	eb 03                	jmp    1008bf <pmmap_merge+0x2f>
  1008bc:	8b 5b 0c             	mov    0xc(%ebx),%ebx
  1008bf:	85 db                	test   %ebx,%ebx
  1008c1:	74 39                	je     1008fc <pmmap_merge+0x6c>
		if ((next_slot = SLIST_NEXT(slot, next)) == NULL)
  1008c3:	8b 43 0c             	mov    0xc(%ebx),%eax
  1008c6:	85 c0                	test   %eax,%eax
  1008c8:	74 32                	je     1008fc <pmmap_merge+0x6c>
			break;
		if (slot->start <= next_slot->start &&
  1008ca:	8b 10                	mov    (%eax),%edx
  1008cc:	39 13                	cmp    %edx,(%ebx)
  1008ce:	77 ec                	ja     1008bc <pmmap_merge+0x2c>
		    slot->end >= next_slot->start &&
  1008d0:	8b 4b 04             	mov    0x4(%ebx),%ecx
	 * Step 1: Merge overlaped entries in pmmap_list.
	 */
	SLIST_FOREACH(slot, &pmmap_list, next) {
		if ((next_slot = SLIST_NEXT(slot, next)) == NULL)
			break;
		if (slot->start <= next_slot->start &&
  1008d3:	39 ca                	cmp    %ecx,%edx
  1008d5:	77 e5                	ja     1008bc <pmmap_merge+0x2c>
		    slot->end >= next_slot->start &&
  1008d7:	8b 50 08             	mov    0x8(%eax),%edx
  1008da:	39 53 08             	cmp    %edx,0x8(%ebx)
  1008dd:	75 dd                	jne    1008bc <pmmap_merge+0x2c>
		    slot->type == next_slot->type) {
			slot->end = max(slot->end, next_slot->end);
  1008df:	83 ec 08             	sub    $0x8,%esp
  1008e2:	ff 70 04             	pushl  0x4(%eax)
  1008e5:	51                   	push   %ecx
  1008e6:	e8 d2 1d 00 00       	call   1026bd <max>
  1008eb:	89 43 04             	mov    %eax,0x4(%ebx)
			SLIST_REMOVE_AFTER(slot, next);
  1008ee:	8b 43 0c             	mov    0xc(%ebx),%eax
  1008f1:	8b 40 0c             	mov    0xc(%eax),%eax
  1008f4:	89 43 0c             	mov    %eax,0xc(%ebx)
  1008f7:	83 c4 10             	add    $0x10,%esp
  1008fa:	eb c0                	jmp    1008bc <pmmap_merge+0x2c>

	/*
	 * Step 2: Create the specfic lists: pmmap_usable, pmmap_resv,
	 *         pmmap_acpi, pmmap_nvs.
	 */
	SLIST_FOREACH(slot, &pmmap_list, next) {
  1008fc:	8b 1d 38 c4 12 00    	mov    0x12c438,%ebx
  100902:	eb 27                	jmp    10092b <pmmap_merge+0x9b>
		sublist_nr = PMMAP_SUBLIST_NR(slot->type);
  100904:	be 03 00 00 00       	mov    $0x3,%esi
  100909:	eb 05                	jmp    100910 <pmmap_merge+0x80>
  10090b:	be 00 00 00 00       	mov    $0x0,%esi
    KERN_ASSERT(sublist_nr != -1);
  100910:	83 fe ff             	cmp    $0xffffffff,%esi
  100913:	74 46                	je     10095b <pmmap_merge+0xcb>
		if (last_slot[sublist_nr] != NULL)
  100915:	8b 04 b4             	mov    (%esp,%esi,4),%eax
  100918:	85 c0                	test   %eax,%eax
  10091a:	74 5a                	je     100976 <pmmap_merge+0xe6>
			SLIST_INSERT_AFTER(last_slot[sublist_nr], slot,
  10091c:	8b 50 10             	mov    0x10(%eax),%edx
  10091f:	89 53 10             	mov    %edx,0x10(%ebx)
  100922:	89 58 10             	mov    %ebx,0x10(%eax)
					   type_next);
		else
			SLIST_INSERT_HEAD(&pmmap_sublist[sublist_nr], slot,
					  type_next);
		last_slot[sublist_nr] = slot;
  100925:	89 1c b4             	mov    %ebx,(%esp,%esi,4)

	/*
	 * Step 2: Create the specfic lists: pmmap_usable, pmmap_resv,
	 *         pmmap_acpi, pmmap_nvs.
	 */
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100928:	8b 5b 0c             	mov    0xc(%ebx),%ebx
  10092b:	85 db                	test   %ebx,%ebx
  10092d:	74 5a                	je     100989 <pmmap_merge+0xf9>
		sublist_nr = PMMAP_SUBLIST_NR(slot->type);
  10092f:	8b 43 08             	mov    0x8(%ebx),%eax
  100932:	83 f8 01             	cmp    $0x1,%eax
  100935:	74 d4                	je     10090b <pmmap_merge+0x7b>
  100937:	83 f8 02             	cmp    $0x2,%eax
  10093a:	74 11                	je     10094d <pmmap_merge+0xbd>
  10093c:	83 f8 03             	cmp    $0x3,%eax
  10093f:	74 13                	je     100954 <pmmap_merge+0xc4>
  100941:	83 f8 04             	cmp    $0x4,%eax
  100944:	74 be                	je     100904 <pmmap_merge+0x74>
  100946:	be ff ff ff ff       	mov    $0xffffffff,%esi
  10094b:	eb c3                	jmp    100910 <pmmap_merge+0x80>
  10094d:	be 01 00 00 00       	mov    $0x1,%esi
  100952:	eb bc                	jmp    100910 <pmmap_merge+0x80>
  100954:	be 02 00 00 00       	mov    $0x2,%esi
  100959:	eb b5                	jmp    100910 <pmmap_merge+0x80>
    KERN_ASSERT(sublist_nr != -1);
  10095b:	68 66 4e 10 00       	push   $0x104e66
  100960:	68 77 4e 10 00       	push   $0x104e77
  100965:	6a 71                	push   $0x71
  100967:	68 94 4e 10 00       	push   $0x104e94
  10096c:	e8 c4 14 00 00       	call   101e35 <debug_panic>
  100971:	83 c4 10             	add    $0x10,%esp
  100974:	eb 9f                	jmp    100915 <pmmap_merge+0x85>
		if (last_slot[sublist_nr] != NULL)
			SLIST_INSERT_AFTER(last_slot[sublist_nr], slot,
					   type_next);
		else
			SLIST_INSERT_HEAD(&pmmap_sublist[sublist_nr], slot,
  100976:	8b 04 b5 28 c4 12 00 	mov    0x12c428(,%esi,4),%eax
  10097d:	89 43 10             	mov    %eax,0x10(%ebx)
  100980:	89 1c b5 28 c4 12 00 	mov    %ebx,0x12c428(,%esi,4)
  100987:	eb 9c                	jmp    100925 <pmmap_merge+0x95>
					  type_next);
		last_slot[sublist_nr] = slot;
	}

	if (last_slot[PMMAP_USABLE] != NULL)
  100989:	8b 04 24             	mov    (%esp),%eax
  10098c:	85 c0                	test   %eax,%eax
  10098e:	74 08                	je     100998 <pmmap_merge+0x108>
		max_usable_memory = last_slot[PMMAP_USABLE]->end;
  100990:	8b 40 04             	mov    0x4(%eax),%eax
  100993:	a3 24 c4 12 00       	mov    %eax,0x12c424
}
  100998:	83 c4 14             	add    $0x14,%esp
  10099b:	5b                   	pop    %ebx
  10099c:	5e                   	pop    %esi
  10099d:	c3                   	ret    

0010099e <pmmap_alloc_slot>:
static int pmmap_nentries = 0;

struct pmmap *
pmmap_alloc_slot(void)
{
	if (unlikely(pmmap_slots_next_free == 128))
  10099e:	a1 3c c4 12 00       	mov    0x12c43c,%eax
  1009a3:	3d 80 00 00 00       	cmp    $0x80,%eax
  1009a8:	74 19                	je     1009c3 <pmmap_alloc_slot+0x25>
		return NULL;
	return &pmmap_slots[pmmap_slots_next_free++];
  1009aa:	8d 50 01             	lea    0x1(%eax),%edx
  1009ad:	89 15 3c c4 12 00    	mov    %edx,0x12c43c
  1009b3:	8d 14 80             	lea    (%eax,%eax,4),%edx
  1009b6:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
  1009bd:	05 40 c4 12 00       	add    $0x12c440,%eax
  1009c2:	c3                   	ret    

struct pmmap *
pmmap_alloc_slot(void)
{
	if (unlikely(pmmap_slots_next_free == 128))
		return NULL;
  1009c3:	b8 00 00 00 00       	mov    $0x0,%eax
	return &pmmap_slots[pmmap_slots_next_free++];
}
  1009c8:	c3                   	ret    

001009c9 <pmmap_insert>:
 * @param end
 * @param type
 */
static void
pmmap_insert(uintptr_t start, uintptr_t end, uint32_t type)
{
  1009c9:	55                   	push   %ebp
  1009ca:	57                   	push   %edi
  1009cb:	56                   	push   %esi
  1009cc:	53                   	push   %ebx
  1009cd:	83 ec 0c             	sub    $0xc,%esp
  1009d0:	89 c3                	mov    %eax,%ebx
  1009d2:	89 d5                	mov    %edx,%ebp
  1009d4:	89 cf                	mov    %ecx,%edi
	struct pmmap *free_slot, *slot, *last_slot;

	if ((free_slot = pmmap_alloc_slot()) == NULL)
  1009d6:	e8 c3 ff ff ff       	call   10099e <pmmap_alloc_slot>
  1009db:	89 c6                	mov    %eax,%esi
  1009dd:	85 c0                	test   %eax,%eax
  1009df:	74 24                	je     100a05 <pmmap_insert+0x3c>
		KERN_PANIC("More than 128 E820 entries.\n");

	free_slot->start = start;
  1009e1:	89 1e                	mov    %ebx,(%esi)
	free_slot->end = end;
  1009e3:	89 6e 04             	mov    %ebp,0x4(%esi)
	free_slot->type = type;
  1009e6:	89 7e 08             	mov    %edi,0x8(%esi)

	last_slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  1009e9:	8b 0d 38 c4 12 00    	mov    0x12c438,%ecx
  1009ef:	89 c8                	mov    %ecx,%eax

	free_slot->start = start;
	free_slot->end = end;
	free_slot->type = type;

	last_slot = NULL;
  1009f1:	ba 00 00 00 00       	mov    $0x0,%edx

	SLIST_FOREACH(slot, &pmmap_list, next) {
  1009f6:	85 c0                	test   %eax,%eax
  1009f8:	74 24                	je     100a1e <pmmap_insert+0x55>
		if (start < slot->start)
  1009fa:	3b 18                	cmp    (%eax),%ebx
  1009fc:	72 20                	jb     100a1e <pmmap_insert+0x55>
			break;
		last_slot = slot;
  1009fe:	89 c2                	mov    %eax,%edx
	free_slot->end = end;
	free_slot->type = type;

	last_slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100a00:	8b 40 0c             	mov    0xc(%eax),%eax
  100a03:	eb f1                	jmp    1009f6 <pmmap_insert+0x2d>
pmmap_insert(uintptr_t start, uintptr_t end, uint32_t type)
{
	struct pmmap *free_slot, *slot, *last_slot;

	if ((free_slot = pmmap_alloc_slot()) == NULL)
		KERN_PANIC("More than 128 E820 entries.\n");
  100a05:	83 ec 04             	sub    $0x4,%esp
  100a08:	68 a5 4e 10 00       	push   $0x104ea5
  100a0d:	6a 3e                	push   $0x3e
  100a0f:	68 94 4e 10 00       	push   $0x104e94
  100a14:	e8 1c 14 00 00       	call   101e35 <debug_panic>
  100a19:	83 c4 10             	add    $0x10,%esp
  100a1c:	eb c3                	jmp    1009e1 <pmmap_insert+0x18>
		if (start < slot->start)
			break;
		last_slot = slot;
	}

	if (last_slot == NULL)
  100a1e:	85 d2                	test   %edx,%edx
  100a20:	74 11                	je     100a33 <pmmap_insert+0x6a>
  {
		SLIST_INSERT_HEAD(&pmmap_list, free_slot, next);
  }
	else
  {
		SLIST_INSERT_AFTER(last_slot, free_slot, next);
  100a22:	8b 42 0c             	mov    0xc(%edx),%eax
  100a25:	89 46 0c             	mov    %eax,0xc(%esi)
  100a28:	89 72 0c             	mov    %esi,0xc(%edx)
  }
}
  100a2b:	83 c4 0c             	add    $0xc,%esp
  100a2e:	5b                   	pop    %ebx
  100a2f:	5e                   	pop    %esi
  100a30:	5f                   	pop    %edi
  100a31:	5d                   	pop    %ebp
  100a32:	c3                   	ret    
		last_slot = slot;
	}

	if (last_slot == NULL)
  {
		SLIST_INSERT_HEAD(&pmmap_list, free_slot, next);
  100a33:	89 4e 0c             	mov    %ecx,0xc(%esi)
  100a36:	89 35 38 c4 12 00    	mov    %esi,0x12c438
  100a3c:	eb ed                	jmp    100a2b <pmmap_insert+0x62>

00100a3e <pmmap_init>:
	}
}

void
pmmap_init(uintptr_t mbi_addr)
{
  100a3e:	57                   	push   %edi
  100a3f:	56                   	push   %esi
  100a40:	53                   	push   %ebx
  100a41:	8b 74 24 10          	mov    0x10(%esp),%esi
	KERN_INFO("\n");
  100a45:	83 ec 0c             	sub    $0xc,%esp
  100a48:	68 4f 54 10 00       	push   $0x10544f
  100a4d:	e8 a1 13 00 00       	call   101df3 <debug_info>

	mboot_info_t *mbi = (mboot_info_t *) mbi_addr;
  100a52:	89 f3                	mov    %esi,%ebx
	mboot_mmap_t *p = (mboot_mmap_t *) mbi->mmap_addr;
  100a54:	8b 4e 30             	mov    0x30(%esi),%ecx

	SLIST_INIT(&pmmap_list);
  100a57:	c7 05 38 c4 12 00 00 	movl   $0x0,0x12c438
  100a5e:	00 00 00 
	SLIST_INIT(&pmmap_sublist[PMMAP_USABLE]);
  100a61:	c7 05 28 c4 12 00 00 	movl   $0x0,0x12c428
  100a68:	00 00 00 
	SLIST_INIT(&pmmap_sublist[PMMAP_RESV]);
  100a6b:	c7 05 2c c4 12 00 00 	movl   $0x0,0x12c42c
  100a72:	00 00 00 
	SLIST_INIT(&pmmap_sublist[PMMAP_ACPI]);
  100a75:	c7 05 30 c4 12 00 00 	movl   $0x0,0x12c430
  100a7c:	00 00 00 
	SLIST_INIT(&pmmap_sublist[PMMAP_NVS]);
  100a7f:	c7 05 34 c4 12 00 00 	movl   $0x0,0x12c434
  100a86:	00 00 00 

	/*
	 * Copy memory map information from multiboot information mbi to pmmap.
	 */
	while ((uintptr_t) p - (uintptr_t) mbi->mmap_addr < mbi->mmap_length) {
  100a89:	83 c4 10             	add    $0x10,%esp
  100a8c:	eb 10                	jmp    100a9e <pmmap_init+0x60>
		else
			start = p->base_addr_low;

		if (p->length_high != 0 ||
		    p->length_low >= 0xffffffff - start)
			end = 0xffffffff;
  100a8e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
		else
			end = start + p->length_low;

		type = p->type;
  100a93:	8b 49 14             	mov    0x14(%ecx),%ecx

		pmmap_insert(start, end, type);
  100a96:	e8 2e ff ff ff       	call   1009c9 <pmmap_insert>
    //pmmap_dump();

	next:
		p = (mboot_mmap_t *) (((uint32_t) p) + sizeof(mboot_mmap_t)/* p->size */);
  100a9b:	8d 4e 18             	lea    0x18(%esi),%ecx
	SLIST_INIT(&pmmap_sublist[PMMAP_NVS]);

	/*
	 * Copy memory map information from multiboot information mbi to pmmap.
	 */
	while ((uintptr_t) p - (uintptr_t) mbi->mmap_addr < mbi->mmap_length) {
  100a9e:	89 ce                	mov    %ecx,%esi
  100aa0:	89 c8                	mov    %ecx,%eax
  100aa2:	2b 43 30             	sub    0x30(%ebx),%eax
  100aa5:	3b 43 2c             	cmp    0x2c(%ebx),%eax
  100aa8:	73 25                	jae    100acf <pmmap_init+0x91>
		uintptr_t start,end;
		uint32_t type;

		if (p->base_addr_high != 0)	/* ignore address above 4G */
  100aaa:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  100aae:	75 eb                	jne    100a9b <pmmap_init+0x5d>
			goto next;
		else
			start = p->base_addr_low;
  100ab0:	8b 41 04             	mov    0x4(%ecx),%eax

		if (p->length_high != 0 ||
  100ab3:	83 79 10 00          	cmpl   $0x0,0x10(%ecx)
  100ab7:	75 d5                	jne    100a8e <pmmap_init+0x50>
		    p->length_low >= 0xffffffff - start)
  100ab9:	8b 51 0c             	mov    0xc(%ecx),%edx
  100abc:	89 c7                	mov    %eax,%edi
  100abe:	f7 d7                	not    %edi
		if (p->base_addr_high != 0)	/* ignore address above 4G */
			goto next;
		else
			start = p->base_addr_low;

		if (p->length_high != 0 ||
  100ac0:	39 fa                	cmp    %edi,%edx
  100ac2:	73 04                	jae    100ac8 <pmmap_init+0x8a>
		    p->length_low >= 0xffffffff - start)
			end = 0xffffffff;
		else
			end = start + p->length_low;
  100ac4:	01 c2                	add    %eax,%edx
  100ac6:	eb cb                	jmp    100a93 <pmmap_init+0x55>
		else
			start = p->base_addr_low;

		if (p->length_high != 0 ||
		    p->length_low >= 0xffffffff - start)
			end = 0xffffffff;
  100ac8:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  100acd:	eb c4                	jmp    100a93 <pmmap_init+0x55>
	next:
		p = (mboot_mmap_t *) (((uint32_t) p) + sizeof(mboot_mmap_t)/* p->size */);
	}

	/* merge overlapped memory regions */
	pmmap_merge();
  100acf:	e8 bc fd ff ff       	call   100890 <pmmap_merge>
	pmmap_dump();
  100ad4:	e8 46 fd ff ff       	call   10081f <pmmap_dump>

	/* count the number of pmmap entries */
	struct pmmap *slot;
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100ad9:	a1 38 c4 12 00       	mov    0x12c438,%eax
  100ade:	eb 0a                	jmp    100aea <pmmap_init+0xac>
		pmmap_nentries++;
  100ae0:	83 05 20 c4 12 00 01 	addl   $0x1,0x12c420
	pmmap_merge();
	pmmap_dump();

	/* count the number of pmmap entries */
	struct pmmap *slot;
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100ae7:	8b 40 0c             	mov    0xc(%eax),%eax
  100aea:	85 c0                	test   %eax,%eax
  100aec:	75 f2                	jne    100ae0 <pmmap_init+0xa2>
		pmmap_nentries++;
	}

	/* Calculate the maximum page number */
	mem_npages = rounddown(max_usable_memory, PAGESIZE) / PAGESIZE;
  100aee:	83 ec 08             	sub    $0x8,%esp
  100af1:	68 00 10 00 00       	push   $0x1000
  100af6:	ff 35 24 c4 12 00    	pushl  0x12c424
  100afc:	e8 d8 1b 00 00       	call   1026d9 <rounddown>
}
  100b01:	83 c4 10             	add    $0x10,%esp
  100b04:	5b                   	pop    %ebx
  100b05:	5e                   	pop    %esi
  100b06:	5f                   	pop    %edi
  100b07:	c3                   	ret    

00100b08 <get_size>:

int
get_size(void)
{
	return pmmap_nentries;
}
  100b08:	a1 20 c4 12 00       	mov    0x12c420,%eax
  100b0d:	c3                   	ret    

00100b0e <get_mms>:

uint32_t
get_mms(int idx)
{
  100b0e:	8b 4c 24 04          	mov    0x4(%esp),%ecx
	int i = 0;
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b12:	a1 38 c4 12 00       	mov    0x12c438,%eax
}

uint32_t
get_mms(int idx)
{
	int i = 0;
  100b17:	ba 00 00 00 00       	mov    $0x0,%edx
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b1c:	85 c0                	test   %eax,%eax
  100b1e:	74 0c                	je     100b2c <get_mms+0x1e>
		if (i == idx)
  100b20:	39 ca                	cmp    %ecx,%edx
  100b22:	74 08                	je     100b2c <get_mms+0x1e>
			break;
		i++;
  100b24:	83 c2 01             	add    $0x1,%edx
get_mms(int idx)
{
	int i = 0;
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b27:	8b 40 0c             	mov    0xc(%eax),%eax
  100b2a:	eb f0                	jmp    100b1c <get_mms+0xe>
		if (i == idx)
			break;
		i++;
	}

	if (slot == NULL || i == pmmap_nentries)
  100b2c:	85 c0                	test   %eax,%eax
  100b2e:	74 0b                	je     100b3b <get_mms+0x2d>
  100b30:	3b 15 20 c4 12 00    	cmp    0x12c420,%edx
  100b36:	74 09                	je     100b41 <get_mms+0x33>
		return 0;

	return slot->start;
  100b38:	8b 00                	mov    (%eax),%eax
  100b3a:	c3                   	ret    
			break;
		i++;
	}

	if (slot == NULL || i == pmmap_nentries)
		return 0;
  100b3b:	b8 00 00 00 00       	mov    $0x0,%eax
  100b40:	c3                   	ret    
  100b41:	b8 00 00 00 00       	mov    $0x0,%eax

	return slot->start;
}
  100b46:	c3                   	ret    

00100b47 <get_mml>:

uint32_t
get_mml(int idx)
{
  100b47:	8b 4c 24 04          	mov    0x4(%esp),%ecx
	int i = 0;
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b4b:	8b 15 38 c4 12 00    	mov    0x12c438,%edx
}

uint32_t
get_mml(int idx)
{
	int i = 0;
  100b51:	b8 00 00 00 00       	mov    $0x0,%eax
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b56:	85 d2                	test   %edx,%edx
  100b58:	74 0c                	je     100b66 <get_mml+0x1f>
		if (i == idx)
  100b5a:	39 c8                	cmp    %ecx,%eax
  100b5c:	74 08                	je     100b66 <get_mml+0x1f>
			break;
		i++;
  100b5e:	83 c0 01             	add    $0x1,%eax
get_mml(int idx)
{
	int i = 0;
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b61:	8b 52 0c             	mov    0xc(%edx),%edx
  100b64:	eb f0                	jmp    100b56 <get_mml+0xf>
		if (i == idx)
			break;
		i++;
	}

	if (slot == NULL || i == pmmap_nentries)
  100b66:	85 d2                	test   %edx,%edx
  100b68:	74 0e                	je     100b78 <get_mml+0x31>
  100b6a:	3b 05 20 c4 12 00    	cmp    0x12c420,%eax
  100b70:	74 0c                	je     100b7e <get_mml+0x37>
		return 0;

	return slot->end - slot->start;
  100b72:	8b 42 04             	mov    0x4(%edx),%eax
  100b75:	2b 02                	sub    (%edx),%eax
  100b77:	c3                   	ret    
			break;
		i++;
	}

	if (slot == NULL || i == pmmap_nentries)
		return 0;
  100b78:	b8 00 00 00 00       	mov    $0x0,%eax
  100b7d:	c3                   	ret    
  100b7e:	b8 00 00 00 00       	mov    $0x0,%eax

	return slot->end - slot->start;
}
  100b83:	c3                   	ret    

00100b84 <is_usable>:

int
is_usable(int idx)
{
  100b84:	8b 4c 24 04          	mov    0x4(%esp),%ecx
	int i = 0;
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b88:	a1 38 c4 12 00       	mov    0x12c438,%eax
}

int
is_usable(int idx)
{
	int i = 0;
  100b8d:	ba 00 00 00 00       	mov    $0x0,%edx
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b92:	85 c0                	test   %eax,%eax
  100b94:	74 0c                	je     100ba2 <is_usable+0x1e>
		if (i == idx)
  100b96:	39 ca                	cmp    %ecx,%edx
  100b98:	74 08                	je     100ba2 <is_usable+0x1e>
			break;
		i++;
  100b9a:	83 c2 01             	add    $0x1,%edx
is_usable(int idx)
{
	int i = 0;
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b9d:	8b 40 0c             	mov    0xc(%eax),%eax
  100ba0:	eb f0                	jmp    100b92 <is_usable+0xe>
		if (i == idx)
			break;
		i++;
	}

	if (slot == NULL || i == pmmap_nentries)
  100ba2:	85 c0                	test   %eax,%eax
  100ba4:	74 13                	je     100bb9 <is_usable+0x35>
  100ba6:	3b 15 20 c4 12 00    	cmp    0x12c420,%edx
  100bac:	74 11                	je     100bbf <is_usable+0x3b>
		return 0;

	return slot->type == MEM_RAM;
  100bae:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
  100bb2:	0f 94 c0             	sete   %al
  100bb5:	0f b6 c0             	movzbl %al,%eax
  100bb8:	c3                   	ret    
			break;
		i++;
	}

	if (slot == NULL || i == pmmap_nentries)
		return 0;
  100bb9:	b8 00 00 00 00       	mov    $0x0,%eax
  100bbe:	c3                   	ret    
  100bbf:	b8 00 00 00 00       	mov    $0x0,%eax

	return slot->type == MEM_RAM;
}
  100bc4:	c3                   	ret    

00100bc5 <set_cr3>:

void
set_cr3(char **pdir)
{
  100bc5:	83 ec 18             	sub    $0x18,%esp
	lcr3((uint32_t) pdir);
  100bc8:	ff 74 24 1c          	pushl  0x1c(%esp)
  100bcc:	e8 d7 1b 00 00       	call   1027a8 <lcr3>
}
  100bd1:	83 c4 1c             	add    $0x1c,%esp
  100bd4:	c3                   	ret    

00100bd5 <enable_paging>:

void
enable_paging(void)
{
  100bd5:	83 ec 0c             	sub    $0xc,%esp
	/* enable global pages (Sec 4.10.2.4, Intel ASDM Vol3) */
	uint32_t cr4 = rcr4();
  100bd8:	e8 db 1b 00 00       	call   1027b8 <rcr4>
	cr4 |= CR4_PGE;
  100bdd:	0c 80                	or     $0x80,%al
	lcr4(cr4);
  100bdf:	83 ec 0c             	sub    $0xc,%esp
  100be2:	50                   	push   %eax
  100be3:	e8 c8 1b 00 00       	call   1027b0 <lcr4>

	/* turn on paging */
	uint32_t cr0 = rcr0();
  100be8:	e8 b3 1b 00 00       	call   1027a0 <rcr0>
  100bed:	83 e0 f3             	and    $0xfffffff3,%eax
	cr0 |= CR0_PE | CR0_PG | CR0_AM | CR0_WP | CR0_NE | CR0_MP;
	cr0 &= ~(CR0_EM | CR0_TS);
  100bf0:	0d 23 00 05 80       	or     $0x80050023,%eax
	lcr0(cr0);
  100bf5:	89 04 24             	mov    %eax,(%esp)
  100bf8:	e8 9b 1b 00 00       	call   102798 <lcr0>
}
  100bfd:	83 c4 1c             	add    $0x1c,%esp
  100c00:	c3                   	ret    

00100c01 <intr_init_idt>:

	/* check that T_IRQ0 is a multiple of 8 */
	KERN_ASSERT((T_IRQ0 & 7) == 0);

	/* install a default handler */
	for (i = 0; i < sizeof(idt)/sizeof(idt[0]); i++)
  100c01:	ba 00 00 00 00       	mov    $0x0,%edx
  100c06:	eb 48                	jmp    100c50 <intr_init_idt+0x4f>
		SETGATE(idt[i], 0, CPU_GDT_KCODE, &Xdefault, 0);
  100c08:	b9 fe 1b 10 00       	mov    $0x101bfe,%ecx
  100c0d:	66 89 0c d5 c0 d6 96 	mov    %cx,0x96d6c0(,%edx,8)
  100c14:	00 
  100c15:	66 c7 04 d5 c2 d6 96 	movw   $0x8,0x96d6c2(,%edx,8)
  100c1c:	00 08 00 
  100c1f:	c6 04 d5 c4 d6 96 00 	movb   $0x0,0x96d6c4(,%edx,8)
  100c26:	00 
  100c27:	0f b6 04 d5 c5 d6 96 	movzbl 0x96d6c5(,%edx,8),%eax
  100c2e:	00 
  100c2f:	83 e0 f0             	and    $0xfffffff0,%eax
  100c32:	83 c8 0e             	or     $0xe,%eax
  100c35:	83 e0 8f             	and    $0xffffff8f,%eax
  100c38:	83 c8 80             	or     $0xffffff80,%eax
  100c3b:	88 04 d5 c5 d6 96 00 	mov    %al,0x96d6c5(,%edx,8)
  100c42:	c1 e9 10             	shr    $0x10,%ecx
  100c45:	66 89 0c d5 c6 d6 96 	mov    %cx,0x96d6c6(,%edx,8)
  100c4c:	00 

	/* check that T_IRQ0 is a multiple of 8 */
	KERN_ASSERT((T_IRQ0 & 7) == 0);

	/* install a default handler */
	for (i = 0; i < sizeof(idt)/sizeof(idt[0]); i++)
  100c4d:	83 c2 01             	add    $0x1,%edx
  100c50:	81 fa ff 00 00 00    	cmp    $0xff,%edx
  100c56:	76 b0                	jbe    100c08 <intr_init_idt+0x7>
		SETGATE(idt[i], 0, CPU_GDT_KCODE, &Xdefault, 0);

	SETGATE(idt[T_DIVIDE],            0, CPU_GDT_KCODE, &Xdivide,       0);
  100c58:	ba f0 1a 10 00       	mov    $0x101af0,%edx
  100c5d:	66 89 15 c0 d6 96 00 	mov    %dx,0x96d6c0
  100c64:	66 c7 05 c2 d6 96 00 	movw   $0x8,0x96d6c2
  100c6b:	08 00 
  100c6d:	c6 05 c4 d6 96 00 00 	movb   $0x0,0x96d6c4
  100c74:	0f b6 05 c5 d6 96 00 	movzbl 0x96d6c5,%eax
  100c7b:	83 e0 f0             	and    $0xfffffff0,%eax
  100c7e:	83 c8 0e             	or     $0xe,%eax
  100c81:	83 e0 8f             	and    $0xffffff8f,%eax
  100c84:	83 c8 80             	or     $0xffffff80,%eax
  100c87:	a2 c5 d6 96 00       	mov    %al,0x96d6c5
  100c8c:	c1 ea 10             	shr    $0x10,%edx
  100c8f:	66 89 15 c6 d6 96 00 	mov    %dx,0x96d6c6
	SETGATE(idt[T_DEBUG],             0, CPU_GDT_KCODE, &Xdebug,        0);
  100c96:	ba fa 1a 10 00       	mov    $0x101afa,%edx
  100c9b:	66 89 15 c8 d6 96 00 	mov    %dx,0x96d6c8
  100ca2:	66 c7 05 ca d6 96 00 	movw   $0x8,0x96d6ca
  100ca9:	08 00 
  100cab:	c6 05 cc d6 96 00 00 	movb   $0x0,0x96d6cc
  100cb2:	0f b6 05 cd d6 96 00 	movzbl 0x96d6cd,%eax
  100cb9:	83 e0 f0             	and    $0xfffffff0,%eax
  100cbc:	83 c8 0e             	or     $0xe,%eax
  100cbf:	83 e0 8f             	and    $0xffffff8f,%eax
  100cc2:	83 c8 80             	or     $0xffffff80,%eax
  100cc5:	a2 cd d6 96 00       	mov    %al,0x96d6cd
  100cca:	c1 ea 10             	shr    $0x10,%edx
  100ccd:	66 89 15 ce d6 96 00 	mov    %dx,0x96d6ce
	SETGATE(idt[T_NMI],               0, CPU_GDT_KCODE, &Xnmi,          0);
  100cd4:	ba 04 1b 10 00       	mov    $0x101b04,%edx
  100cd9:	66 89 15 d0 d6 96 00 	mov    %dx,0x96d6d0
  100ce0:	66 c7 05 d2 d6 96 00 	movw   $0x8,0x96d6d2
  100ce7:	08 00 
  100ce9:	c6 05 d4 d6 96 00 00 	movb   $0x0,0x96d6d4
  100cf0:	0f b6 05 d5 d6 96 00 	movzbl 0x96d6d5,%eax
  100cf7:	83 e0 f0             	and    $0xfffffff0,%eax
  100cfa:	83 c8 0e             	or     $0xe,%eax
  100cfd:	83 e0 8f             	and    $0xffffff8f,%eax
  100d00:	83 c8 80             	or     $0xffffff80,%eax
  100d03:	a2 d5 d6 96 00       	mov    %al,0x96d6d5
  100d08:	c1 ea 10             	shr    $0x10,%edx
  100d0b:	66 89 15 d6 d6 96 00 	mov    %dx,0x96d6d6
	SETGATE(idt[T_BRKPT],             0, CPU_GDT_KCODE, &Xbrkpt,        3);
  100d12:	ba 0e 1b 10 00       	mov    $0x101b0e,%edx
  100d17:	66 89 15 d8 d6 96 00 	mov    %dx,0x96d6d8
  100d1e:	66 c7 05 da d6 96 00 	movw   $0x8,0x96d6da
  100d25:	08 00 
  100d27:	c6 05 dc d6 96 00 00 	movb   $0x0,0x96d6dc
  100d2e:	0f b6 05 dd d6 96 00 	movzbl 0x96d6dd,%eax
  100d35:	83 e0 f0             	and    $0xfffffff0,%eax
  100d38:	83 c8 0e             	or     $0xe,%eax
  100d3b:	83 e0 ef             	and    $0xffffffef,%eax
  100d3e:	83 c8 e0             	or     $0xffffffe0,%eax
  100d41:	a2 dd d6 96 00       	mov    %al,0x96d6dd
  100d46:	c1 ea 10             	shr    $0x10,%edx
  100d49:	66 89 15 de d6 96 00 	mov    %dx,0x96d6de
	SETGATE(idt[T_OFLOW],             0, CPU_GDT_KCODE, &Xoflow,        3);
  100d50:	ba 18 1b 10 00       	mov    $0x101b18,%edx
  100d55:	66 89 15 e0 d6 96 00 	mov    %dx,0x96d6e0
  100d5c:	66 c7 05 e2 d6 96 00 	movw   $0x8,0x96d6e2
  100d63:	08 00 
  100d65:	c6 05 e4 d6 96 00 00 	movb   $0x0,0x96d6e4
  100d6c:	0f b6 05 e5 d6 96 00 	movzbl 0x96d6e5,%eax
  100d73:	83 e0 f0             	and    $0xfffffff0,%eax
  100d76:	83 c8 0e             	or     $0xe,%eax
  100d79:	83 e0 ef             	and    $0xffffffef,%eax
  100d7c:	83 c8 e0             	or     $0xffffffe0,%eax
  100d7f:	a2 e5 d6 96 00       	mov    %al,0x96d6e5
  100d84:	c1 ea 10             	shr    $0x10,%edx
  100d87:	66 89 15 e6 d6 96 00 	mov    %dx,0x96d6e6
	SETGATE(idt[T_BOUND],             0, CPU_GDT_KCODE, &Xbound,        0);
  100d8e:	ba 22 1b 10 00       	mov    $0x101b22,%edx
  100d93:	66 89 15 e8 d6 96 00 	mov    %dx,0x96d6e8
  100d9a:	66 c7 05 ea d6 96 00 	movw   $0x8,0x96d6ea
  100da1:	08 00 
  100da3:	c6 05 ec d6 96 00 00 	movb   $0x0,0x96d6ec
  100daa:	0f b6 05 ed d6 96 00 	movzbl 0x96d6ed,%eax
  100db1:	83 e0 f0             	and    $0xfffffff0,%eax
  100db4:	83 c8 0e             	or     $0xe,%eax
  100db7:	83 e0 8f             	and    $0xffffff8f,%eax
  100dba:	83 c8 80             	or     $0xffffff80,%eax
  100dbd:	a2 ed d6 96 00       	mov    %al,0x96d6ed
  100dc2:	c1 ea 10             	shr    $0x10,%edx
  100dc5:	66 89 15 ee d6 96 00 	mov    %dx,0x96d6ee
	SETGATE(idt[T_ILLOP],             0, CPU_GDT_KCODE, &Xillop,        0);
  100dcc:	ba 2c 1b 10 00       	mov    $0x101b2c,%edx
  100dd1:	66 89 15 f0 d6 96 00 	mov    %dx,0x96d6f0
  100dd8:	66 c7 05 f2 d6 96 00 	movw   $0x8,0x96d6f2
  100ddf:	08 00 
  100de1:	c6 05 f4 d6 96 00 00 	movb   $0x0,0x96d6f4
  100de8:	0f b6 05 f5 d6 96 00 	movzbl 0x96d6f5,%eax
  100def:	83 e0 f0             	and    $0xfffffff0,%eax
  100df2:	83 c8 0e             	or     $0xe,%eax
  100df5:	83 e0 8f             	and    $0xffffff8f,%eax
  100df8:	83 c8 80             	or     $0xffffff80,%eax
  100dfb:	a2 f5 d6 96 00       	mov    %al,0x96d6f5
  100e00:	c1 ea 10             	shr    $0x10,%edx
  100e03:	66 89 15 f6 d6 96 00 	mov    %dx,0x96d6f6
	SETGATE(idt[T_DEVICE],            0, CPU_GDT_KCODE, &Xdevice,       0);
  100e0a:	ba 36 1b 10 00       	mov    $0x101b36,%edx
  100e0f:	66 89 15 f8 d6 96 00 	mov    %dx,0x96d6f8
  100e16:	66 c7 05 fa d6 96 00 	movw   $0x8,0x96d6fa
  100e1d:	08 00 
  100e1f:	c6 05 fc d6 96 00 00 	movb   $0x0,0x96d6fc
  100e26:	0f b6 05 fd d6 96 00 	movzbl 0x96d6fd,%eax
  100e2d:	83 e0 f0             	and    $0xfffffff0,%eax
  100e30:	83 c8 0e             	or     $0xe,%eax
  100e33:	83 e0 8f             	and    $0xffffff8f,%eax
  100e36:	83 c8 80             	or     $0xffffff80,%eax
  100e39:	a2 fd d6 96 00       	mov    %al,0x96d6fd
  100e3e:	c1 ea 10             	shr    $0x10,%edx
  100e41:	66 89 15 fe d6 96 00 	mov    %dx,0x96d6fe
	SETGATE(idt[T_DBLFLT],            0, CPU_GDT_KCODE, &Xdblflt,       0);
  100e48:	ba 40 1b 10 00       	mov    $0x101b40,%edx
  100e4d:	66 89 15 00 d7 96 00 	mov    %dx,0x96d700
  100e54:	66 c7 05 02 d7 96 00 	movw   $0x8,0x96d702
  100e5b:	08 00 
  100e5d:	c6 05 04 d7 96 00 00 	movb   $0x0,0x96d704
  100e64:	0f b6 05 05 d7 96 00 	movzbl 0x96d705,%eax
  100e6b:	83 e0 f0             	and    $0xfffffff0,%eax
  100e6e:	83 c8 0e             	or     $0xe,%eax
  100e71:	83 e0 8f             	and    $0xffffff8f,%eax
  100e74:	83 c8 80             	or     $0xffffff80,%eax
  100e77:	a2 05 d7 96 00       	mov    %al,0x96d705
  100e7c:	c1 ea 10             	shr    $0x10,%edx
  100e7f:	66 89 15 06 d7 96 00 	mov    %dx,0x96d706
	SETGATE(idt[T_TSS],               0, CPU_GDT_KCODE, &Xtss,          0);
  100e86:	ba 52 1b 10 00       	mov    $0x101b52,%edx
  100e8b:	66 89 15 10 d7 96 00 	mov    %dx,0x96d710
  100e92:	66 c7 05 12 d7 96 00 	movw   $0x8,0x96d712
  100e99:	08 00 
  100e9b:	c6 05 14 d7 96 00 00 	movb   $0x0,0x96d714
  100ea2:	0f b6 05 15 d7 96 00 	movzbl 0x96d715,%eax
  100ea9:	83 e0 f0             	and    $0xfffffff0,%eax
  100eac:	83 c8 0e             	or     $0xe,%eax
  100eaf:	83 e0 8f             	and    $0xffffff8f,%eax
  100eb2:	83 c8 80             	or     $0xffffff80,%eax
  100eb5:	a2 15 d7 96 00       	mov    %al,0x96d715
  100eba:	c1 ea 10             	shr    $0x10,%edx
  100ebd:	66 89 15 16 d7 96 00 	mov    %dx,0x96d716
	SETGATE(idt[T_SEGNP],             0, CPU_GDT_KCODE, &Xsegnp,        0);
  100ec4:	ba 5a 1b 10 00       	mov    $0x101b5a,%edx
  100ec9:	66 89 15 18 d7 96 00 	mov    %dx,0x96d718
  100ed0:	66 c7 05 1a d7 96 00 	movw   $0x8,0x96d71a
  100ed7:	08 00 
  100ed9:	c6 05 1c d7 96 00 00 	movb   $0x0,0x96d71c
  100ee0:	0f b6 05 1d d7 96 00 	movzbl 0x96d71d,%eax
  100ee7:	83 e0 f0             	and    $0xfffffff0,%eax
  100eea:	83 c8 0e             	or     $0xe,%eax
  100eed:	83 e0 8f             	and    $0xffffff8f,%eax
  100ef0:	83 c8 80             	or     $0xffffff80,%eax
  100ef3:	a2 1d d7 96 00       	mov    %al,0x96d71d
  100ef8:	c1 ea 10             	shr    $0x10,%edx
  100efb:	66 89 15 1e d7 96 00 	mov    %dx,0x96d71e
	SETGATE(idt[T_STACK],             0, CPU_GDT_KCODE, &Xstack,        0);
  100f02:	ba 62 1b 10 00       	mov    $0x101b62,%edx
  100f07:	66 89 15 20 d7 96 00 	mov    %dx,0x96d720
  100f0e:	66 c7 05 22 d7 96 00 	movw   $0x8,0x96d722
  100f15:	08 00 
  100f17:	c6 05 24 d7 96 00 00 	movb   $0x0,0x96d724
  100f1e:	0f b6 05 25 d7 96 00 	movzbl 0x96d725,%eax
  100f25:	83 e0 f0             	and    $0xfffffff0,%eax
  100f28:	83 c8 0e             	or     $0xe,%eax
  100f2b:	83 e0 8f             	and    $0xffffff8f,%eax
  100f2e:	83 c8 80             	or     $0xffffff80,%eax
  100f31:	a2 25 d7 96 00       	mov    %al,0x96d725
  100f36:	c1 ea 10             	shr    $0x10,%edx
  100f39:	66 89 15 26 d7 96 00 	mov    %dx,0x96d726
	SETGATE(idt[T_GPFLT],             0, CPU_GDT_KCODE, &Xgpflt,        0);
  100f40:	ba 6a 1b 10 00       	mov    $0x101b6a,%edx
  100f45:	66 89 15 28 d7 96 00 	mov    %dx,0x96d728
  100f4c:	66 c7 05 2a d7 96 00 	movw   $0x8,0x96d72a
  100f53:	08 00 
  100f55:	c6 05 2c d7 96 00 00 	movb   $0x0,0x96d72c
  100f5c:	0f b6 05 2d d7 96 00 	movzbl 0x96d72d,%eax
  100f63:	83 e0 f0             	and    $0xfffffff0,%eax
  100f66:	83 c8 0e             	or     $0xe,%eax
  100f69:	83 e0 8f             	and    $0xffffff8f,%eax
  100f6c:	83 c8 80             	or     $0xffffff80,%eax
  100f6f:	a2 2d d7 96 00       	mov    %al,0x96d72d
  100f74:	c1 ea 10             	shr    $0x10,%edx
  100f77:	66 89 15 2e d7 96 00 	mov    %dx,0x96d72e
	SETGATE(idt[T_PGFLT],             0, CPU_GDT_KCODE, &Xpgflt,        0);
  100f7e:	ba 72 1b 10 00       	mov    $0x101b72,%edx
  100f83:	66 89 15 30 d7 96 00 	mov    %dx,0x96d730
  100f8a:	66 c7 05 32 d7 96 00 	movw   $0x8,0x96d732
  100f91:	08 00 
  100f93:	c6 05 34 d7 96 00 00 	movb   $0x0,0x96d734
  100f9a:	0f b6 05 35 d7 96 00 	movzbl 0x96d735,%eax
  100fa1:	83 e0 f0             	and    $0xfffffff0,%eax
  100fa4:	83 c8 0e             	or     $0xe,%eax
  100fa7:	83 e0 8f             	and    $0xffffff8f,%eax
  100faa:	83 c8 80             	or     $0xffffff80,%eax
  100fad:	a2 35 d7 96 00       	mov    %al,0x96d735
  100fb2:	c1 ea 10             	shr    $0x10,%edx
  100fb5:	66 89 15 36 d7 96 00 	mov    %dx,0x96d736
	SETGATE(idt[T_FPERR],             0, CPU_GDT_KCODE, &Xfperr,        0);
  100fbc:	ba 84 1b 10 00       	mov    $0x101b84,%edx
  100fc1:	66 89 15 40 d7 96 00 	mov    %dx,0x96d740
  100fc8:	66 c7 05 42 d7 96 00 	movw   $0x8,0x96d742
  100fcf:	08 00 
  100fd1:	c6 05 44 d7 96 00 00 	movb   $0x0,0x96d744
  100fd8:	0f b6 05 45 d7 96 00 	movzbl 0x96d745,%eax
  100fdf:	83 e0 f0             	and    $0xfffffff0,%eax
  100fe2:	83 c8 0e             	or     $0xe,%eax
  100fe5:	83 e0 8f             	and    $0xffffff8f,%eax
  100fe8:	83 c8 80             	or     $0xffffff80,%eax
  100feb:	a2 45 d7 96 00       	mov    %al,0x96d745
  100ff0:	c1 ea 10             	shr    $0x10,%edx
  100ff3:	66 89 15 46 d7 96 00 	mov    %dx,0x96d746
	SETGATE(idt[T_ALIGN],             0, CPU_GDT_KCODE, &Xalign,        0);
  100ffa:	ba 8e 1b 10 00       	mov    $0x101b8e,%edx
  100fff:	66 89 15 48 d7 96 00 	mov    %dx,0x96d748
  101006:	66 c7 05 4a d7 96 00 	movw   $0x8,0x96d74a
  10100d:	08 00 
  10100f:	c6 05 4c d7 96 00 00 	movb   $0x0,0x96d74c
  101016:	0f b6 05 4d d7 96 00 	movzbl 0x96d74d,%eax
  10101d:	83 e0 f0             	and    $0xfffffff0,%eax
  101020:	83 c8 0e             	or     $0xe,%eax
  101023:	83 e0 8f             	and    $0xffffff8f,%eax
  101026:	83 c8 80             	or     $0xffffff80,%eax
  101029:	a2 4d d7 96 00       	mov    %al,0x96d74d
  10102e:	c1 ea 10             	shr    $0x10,%edx
  101031:	66 89 15 4e d7 96 00 	mov    %dx,0x96d74e
	SETGATE(idt[T_MCHK],              0, CPU_GDT_KCODE, &Xmchk,         0);
  101038:	ba 92 1b 10 00       	mov    $0x101b92,%edx
  10103d:	66 89 15 50 d7 96 00 	mov    %dx,0x96d750
  101044:	66 c7 05 52 d7 96 00 	movw   $0x8,0x96d752
  10104b:	08 00 
  10104d:	c6 05 54 d7 96 00 00 	movb   $0x0,0x96d754
  101054:	0f b6 05 55 d7 96 00 	movzbl 0x96d755,%eax
  10105b:	83 e0 f0             	and    $0xfffffff0,%eax
  10105e:	83 c8 0e             	or     $0xe,%eax
  101061:	83 e0 8f             	and    $0xffffff8f,%eax
  101064:	83 c8 80             	or     $0xffffff80,%eax
  101067:	a2 55 d7 96 00       	mov    %al,0x96d755
  10106c:	c1 ea 10             	shr    $0x10,%edx
  10106f:	66 89 15 56 d7 96 00 	mov    %dx,0x96d756

	SETGATE(idt[T_IRQ0+IRQ_TIMER],    0, CPU_GDT_KCODE, &Xirq_timer,    0);
  101076:	ba 98 1b 10 00       	mov    $0x101b98,%edx
  10107b:	66 89 15 c0 d7 96 00 	mov    %dx,0x96d7c0
  101082:	66 c7 05 c2 d7 96 00 	movw   $0x8,0x96d7c2
  101089:	08 00 
  10108b:	c6 05 c4 d7 96 00 00 	movb   $0x0,0x96d7c4
  101092:	0f b6 05 c5 d7 96 00 	movzbl 0x96d7c5,%eax
  101099:	83 e0 f0             	and    $0xfffffff0,%eax
  10109c:	83 c8 0e             	or     $0xe,%eax
  10109f:	83 e0 8f             	and    $0xffffff8f,%eax
  1010a2:	83 c8 80             	or     $0xffffff80,%eax
  1010a5:	a2 c5 d7 96 00       	mov    %al,0x96d7c5
  1010aa:	c1 ea 10             	shr    $0x10,%edx
  1010ad:	66 89 15 c6 d7 96 00 	mov    %dx,0x96d7c6
	SETGATE(idt[T_IRQ0+IRQ_KBD],      0, CPU_GDT_KCODE, &Xirq_kbd,      0);
  1010b4:	ba 9e 1b 10 00       	mov    $0x101b9e,%edx
  1010b9:	66 89 15 c8 d7 96 00 	mov    %dx,0x96d7c8
  1010c0:	66 c7 05 ca d7 96 00 	movw   $0x8,0x96d7ca
  1010c7:	08 00 
  1010c9:	c6 05 cc d7 96 00 00 	movb   $0x0,0x96d7cc
  1010d0:	0f b6 05 cd d7 96 00 	movzbl 0x96d7cd,%eax
  1010d7:	83 e0 f0             	and    $0xfffffff0,%eax
  1010da:	83 c8 0e             	or     $0xe,%eax
  1010dd:	83 e0 8f             	and    $0xffffff8f,%eax
  1010e0:	83 c8 80             	or     $0xffffff80,%eax
  1010e3:	a2 cd d7 96 00       	mov    %al,0x96d7cd
  1010e8:	c1 ea 10             	shr    $0x10,%edx
  1010eb:	66 89 15 ce d7 96 00 	mov    %dx,0x96d7ce
	SETGATE(idt[T_IRQ0+IRQ_SLAVE],    0, CPU_GDT_KCODE, &Xirq_slave,    0);
  1010f2:	ba a4 1b 10 00       	mov    $0x101ba4,%edx
  1010f7:	66 89 15 d0 d7 96 00 	mov    %dx,0x96d7d0
  1010fe:	66 c7 05 d2 d7 96 00 	movw   $0x8,0x96d7d2
  101105:	08 00 
  101107:	c6 05 d4 d7 96 00 00 	movb   $0x0,0x96d7d4
  10110e:	0f b6 05 d5 d7 96 00 	movzbl 0x96d7d5,%eax
  101115:	83 e0 f0             	and    $0xfffffff0,%eax
  101118:	83 c8 0e             	or     $0xe,%eax
  10111b:	83 e0 8f             	and    $0xffffff8f,%eax
  10111e:	83 c8 80             	or     $0xffffff80,%eax
  101121:	a2 d5 d7 96 00       	mov    %al,0x96d7d5
  101126:	c1 ea 10             	shr    $0x10,%edx
  101129:	66 89 15 d6 d7 96 00 	mov    %dx,0x96d7d6
	SETGATE(idt[T_IRQ0+IRQ_SERIAL24], 0, CPU_GDT_KCODE, &Xirq_serial2,  0);
  101130:	ba aa 1b 10 00       	mov    $0x101baa,%edx
  101135:	66 89 15 d8 d7 96 00 	mov    %dx,0x96d7d8
  10113c:	66 c7 05 da d7 96 00 	movw   $0x8,0x96d7da
  101143:	08 00 
  101145:	c6 05 dc d7 96 00 00 	movb   $0x0,0x96d7dc
  10114c:	0f b6 05 dd d7 96 00 	movzbl 0x96d7dd,%eax
  101153:	83 e0 f0             	and    $0xfffffff0,%eax
  101156:	83 c8 0e             	or     $0xe,%eax
  101159:	83 e0 8f             	and    $0xffffff8f,%eax
  10115c:	83 c8 80             	or     $0xffffff80,%eax
  10115f:	a2 dd d7 96 00       	mov    %al,0x96d7dd
  101164:	c1 ea 10             	shr    $0x10,%edx
  101167:	66 89 15 de d7 96 00 	mov    %dx,0x96d7de
	SETGATE(idt[T_IRQ0+IRQ_SERIAL13], 0, CPU_GDT_KCODE, &Xirq_serial1,  0);
  10116e:	ba b0 1b 10 00       	mov    $0x101bb0,%edx
  101173:	66 89 15 e0 d7 96 00 	mov    %dx,0x96d7e0
  10117a:	66 c7 05 e2 d7 96 00 	movw   $0x8,0x96d7e2
  101181:	08 00 
  101183:	c6 05 e4 d7 96 00 00 	movb   $0x0,0x96d7e4
  10118a:	0f b6 05 e5 d7 96 00 	movzbl 0x96d7e5,%eax
  101191:	83 e0 f0             	and    $0xfffffff0,%eax
  101194:	83 c8 0e             	or     $0xe,%eax
  101197:	83 e0 8f             	and    $0xffffff8f,%eax
  10119a:	83 c8 80             	or     $0xffffff80,%eax
  10119d:	a2 e5 d7 96 00       	mov    %al,0x96d7e5
  1011a2:	c1 ea 10             	shr    $0x10,%edx
  1011a5:	66 89 15 e6 d7 96 00 	mov    %dx,0x96d7e6
	SETGATE(idt[T_IRQ0+IRQ_LPT2],     0, CPU_GDT_KCODE, &Xirq_lpt,      0);
  1011ac:	ba b6 1b 10 00       	mov    $0x101bb6,%edx
  1011b1:	66 89 15 e8 d7 96 00 	mov    %dx,0x96d7e8
  1011b8:	66 c7 05 ea d7 96 00 	movw   $0x8,0x96d7ea
  1011bf:	08 00 
  1011c1:	c6 05 ec d7 96 00 00 	movb   $0x0,0x96d7ec
  1011c8:	0f b6 05 ed d7 96 00 	movzbl 0x96d7ed,%eax
  1011cf:	83 e0 f0             	and    $0xfffffff0,%eax
  1011d2:	83 c8 0e             	or     $0xe,%eax
  1011d5:	83 e0 8f             	and    $0xffffff8f,%eax
  1011d8:	83 c8 80             	or     $0xffffff80,%eax
  1011db:	a2 ed d7 96 00       	mov    %al,0x96d7ed
  1011e0:	c1 ea 10             	shr    $0x10,%edx
  1011e3:	66 89 15 ee d7 96 00 	mov    %dx,0x96d7ee
	SETGATE(idt[T_IRQ0+IRQ_FLOPPY],   0, CPU_GDT_KCODE, &Xirq_floppy,   0);
  1011ea:	ba bc 1b 10 00       	mov    $0x101bbc,%edx
  1011ef:	66 89 15 f0 d7 96 00 	mov    %dx,0x96d7f0
  1011f6:	66 c7 05 f2 d7 96 00 	movw   $0x8,0x96d7f2
  1011fd:	08 00 
  1011ff:	c6 05 f4 d7 96 00 00 	movb   $0x0,0x96d7f4
  101206:	0f b6 05 f5 d7 96 00 	movzbl 0x96d7f5,%eax
  10120d:	83 e0 f0             	and    $0xfffffff0,%eax
  101210:	83 c8 0e             	or     $0xe,%eax
  101213:	83 e0 8f             	and    $0xffffff8f,%eax
  101216:	83 c8 80             	or     $0xffffff80,%eax
  101219:	a2 f5 d7 96 00       	mov    %al,0x96d7f5
  10121e:	c1 ea 10             	shr    $0x10,%edx
  101221:	66 89 15 f6 d7 96 00 	mov    %dx,0x96d7f6
	SETGATE(idt[T_IRQ0+IRQ_SPURIOUS], 0, CPU_GDT_KCODE, &Xirq_spurious, 0);
  101228:	ba c2 1b 10 00       	mov    $0x101bc2,%edx
  10122d:	66 89 15 f8 d7 96 00 	mov    %dx,0x96d7f8
  101234:	66 c7 05 fa d7 96 00 	movw   $0x8,0x96d7fa
  10123b:	08 00 
  10123d:	c6 05 fc d7 96 00 00 	movb   $0x0,0x96d7fc
  101244:	0f b6 05 fd d7 96 00 	movzbl 0x96d7fd,%eax
  10124b:	83 e0 f0             	and    $0xfffffff0,%eax
  10124e:	83 c8 0e             	or     $0xe,%eax
  101251:	83 e0 8f             	and    $0xffffff8f,%eax
  101254:	83 c8 80             	or     $0xffffff80,%eax
  101257:	a2 fd d7 96 00       	mov    %al,0x96d7fd
  10125c:	c1 ea 10             	shr    $0x10,%edx
  10125f:	66 89 15 fe d7 96 00 	mov    %dx,0x96d7fe
	SETGATE(idt[T_IRQ0+IRQ_RTC],      0, CPU_GDT_KCODE, &Xirq_rtc,      0);
  101266:	ba c8 1b 10 00       	mov    $0x101bc8,%edx
  10126b:	66 89 15 00 d8 96 00 	mov    %dx,0x96d800
  101272:	66 c7 05 02 d8 96 00 	movw   $0x8,0x96d802
  101279:	08 00 
  10127b:	c6 05 04 d8 96 00 00 	movb   $0x0,0x96d804
  101282:	0f b6 05 05 d8 96 00 	movzbl 0x96d805,%eax
  101289:	83 e0 f0             	and    $0xfffffff0,%eax
  10128c:	83 c8 0e             	or     $0xe,%eax
  10128f:	83 e0 8f             	and    $0xffffff8f,%eax
  101292:	83 c8 80             	or     $0xffffff80,%eax
  101295:	a2 05 d8 96 00       	mov    %al,0x96d805
  10129a:	c1 ea 10             	shr    $0x10,%edx
  10129d:	66 89 15 06 d8 96 00 	mov    %dx,0x96d806
	SETGATE(idt[T_IRQ0+9],            0, CPU_GDT_KCODE, &Xirq9,         0);
  1012a4:	ba ce 1b 10 00       	mov    $0x101bce,%edx
  1012a9:	66 89 15 08 d8 96 00 	mov    %dx,0x96d808
  1012b0:	66 c7 05 0a d8 96 00 	movw   $0x8,0x96d80a
  1012b7:	08 00 
  1012b9:	c6 05 0c d8 96 00 00 	movb   $0x0,0x96d80c
  1012c0:	0f b6 05 0d d8 96 00 	movzbl 0x96d80d,%eax
  1012c7:	83 e0 f0             	and    $0xfffffff0,%eax
  1012ca:	83 c8 0e             	or     $0xe,%eax
  1012cd:	83 e0 8f             	and    $0xffffff8f,%eax
  1012d0:	83 c8 80             	or     $0xffffff80,%eax
  1012d3:	a2 0d d8 96 00       	mov    %al,0x96d80d
  1012d8:	c1 ea 10             	shr    $0x10,%edx
  1012db:	66 89 15 0e d8 96 00 	mov    %dx,0x96d80e
	SETGATE(idt[T_IRQ0+10],           0, CPU_GDT_KCODE, &Xirq10,        0);
  1012e2:	ba d4 1b 10 00       	mov    $0x101bd4,%edx
  1012e7:	66 89 15 10 d8 96 00 	mov    %dx,0x96d810
  1012ee:	66 c7 05 12 d8 96 00 	movw   $0x8,0x96d812
  1012f5:	08 00 
  1012f7:	c6 05 14 d8 96 00 00 	movb   $0x0,0x96d814
  1012fe:	0f b6 05 15 d8 96 00 	movzbl 0x96d815,%eax
  101305:	83 e0 f0             	and    $0xfffffff0,%eax
  101308:	83 c8 0e             	or     $0xe,%eax
  10130b:	83 e0 8f             	and    $0xffffff8f,%eax
  10130e:	83 c8 80             	or     $0xffffff80,%eax
  101311:	a2 15 d8 96 00       	mov    %al,0x96d815
  101316:	c1 ea 10             	shr    $0x10,%edx
  101319:	66 89 15 16 d8 96 00 	mov    %dx,0x96d816
	SETGATE(idt[T_IRQ0+11],           0, CPU_GDT_KCODE, &Xirq11,        0);
  101320:	b8 da 1b 10 00       	mov    $0x101bda,%eax
  101325:	66 a3 18 d8 96 00    	mov    %ax,0x96d818
  10132b:	66 c7 05 1a d8 96 00 	movw   $0x8,0x96d81a
  101332:	08 00 
  101334:	c6 05 1c d8 96 00 00 	movb   $0x0,0x96d81c
  10133b:	0f b6 05 1d d8 96 00 	movzbl 0x96d81d,%eax
  101342:	83 e0 f0             	and    $0xfffffff0,%eax
  101345:	83 c8 0e             	or     $0xe,%eax
  101348:	83 e0 8e             	and    $0xffffff8e,%eax
  10134b:	83 c8 80             	or     $0xffffff80,%eax
  10134e:	a2 1d d8 96 00       	mov    %al,0x96d81d
  101353:	b8 da 1b 10 00       	mov    $0x101bda,%eax
  101358:	c1 e8 10             	shr    $0x10,%eax
  10135b:	66 a3 1e d8 96 00    	mov    %ax,0x96d81e
	SETGATE(idt[T_IRQ0+IRQ_MOUSE],    0, CPU_GDT_KCODE, &Xirq_mouse,    0);
  101361:	ba e0 1b 10 00       	mov    $0x101be0,%edx
  101366:	66 89 15 20 d8 96 00 	mov    %dx,0x96d820
  10136d:	66 c7 05 22 d8 96 00 	movw   $0x8,0x96d822
  101374:	08 00 
  101376:	c6 05 24 d8 96 00 00 	movb   $0x0,0x96d824
  10137d:	0f b6 05 25 d8 96 00 	movzbl 0x96d825,%eax
  101384:	83 e0 f0             	and    $0xfffffff0,%eax
  101387:	83 c8 0e             	or     $0xe,%eax
  10138a:	83 e0 8f             	and    $0xffffff8f,%eax
  10138d:	83 c8 80             	or     $0xffffff80,%eax
  101390:	a2 25 d8 96 00       	mov    %al,0x96d825
  101395:	c1 ea 10             	shr    $0x10,%edx
  101398:	66 89 15 26 d8 96 00 	mov    %dx,0x96d826
	SETGATE(idt[T_IRQ0+IRQ_COPROCESSOR], 0, CPU_GDT_KCODE, &Xirq_coproc, 0);
  10139f:	ba e6 1b 10 00       	mov    $0x101be6,%edx
  1013a4:	66 89 15 28 d8 96 00 	mov    %dx,0x96d828
  1013ab:	66 c7 05 2a d8 96 00 	movw   $0x8,0x96d82a
  1013b2:	08 00 
  1013b4:	c6 05 2c d8 96 00 00 	movb   $0x0,0x96d82c
  1013bb:	0f b6 05 2d d8 96 00 	movzbl 0x96d82d,%eax
  1013c2:	83 e0 f0             	and    $0xfffffff0,%eax
  1013c5:	83 c8 0e             	or     $0xe,%eax
  1013c8:	83 e0 8f             	and    $0xffffff8f,%eax
  1013cb:	83 c8 80             	or     $0xffffff80,%eax
  1013ce:	a2 2d d8 96 00       	mov    %al,0x96d82d
  1013d3:	c1 ea 10             	shr    $0x10,%edx
  1013d6:	66 89 15 2e d8 96 00 	mov    %dx,0x96d82e
	SETGATE(idt[T_IRQ0+IRQ_IDE1],     0, CPU_GDT_KCODE, &Xirq_ide1,     0);
  1013dd:	ba ec 1b 10 00       	mov    $0x101bec,%edx
  1013e2:	66 89 15 30 d8 96 00 	mov    %dx,0x96d830
  1013e9:	66 c7 05 32 d8 96 00 	movw   $0x8,0x96d832
  1013f0:	08 00 
  1013f2:	c6 05 34 d8 96 00 00 	movb   $0x0,0x96d834
  1013f9:	0f b6 05 35 d8 96 00 	movzbl 0x96d835,%eax
  101400:	83 e0 f0             	and    $0xfffffff0,%eax
  101403:	83 c8 0e             	or     $0xe,%eax
  101406:	83 e0 8f             	and    $0xffffff8f,%eax
  101409:	83 c8 80             	or     $0xffffff80,%eax
  10140c:	a2 35 d8 96 00       	mov    %al,0x96d835
  101411:	c1 ea 10             	shr    $0x10,%edx
  101414:	66 89 15 36 d8 96 00 	mov    %dx,0x96d836
	SETGATE(idt[T_IRQ0+IRQ_IDE2],     0, CPU_GDT_KCODE, &Xirq_ide2,     0);
  10141b:	ba f2 1b 10 00       	mov    $0x101bf2,%edx
  101420:	66 89 15 38 d8 96 00 	mov    %dx,0x96d838
  101427:	66 c7 05 3a d8 96 00 	movw   $0x8,0x96d83a
  10142e:	08 00 
  101430:	c6 05 3c d8 96 00 00 	movb   $0x0,0x96d83c
  101437:	0f b6 05 3d d8 96 00 	movzbl 0x96d83d,%eax
  10143e:	83 e0 f0             	and    $0xfffffff0,%eax
  101441:	83 c8 0e             	or     $0xe,%eax
  101444:	83 e0 8f             	and    $0xffffff8f,%eax
  101447:	83 c8 80             	or     $0xffffff80,%eax
  10144a:	a2 3d d8 96 00       	mov    %al,0x96d83d
  10144f:	c1 ea 10             	shr    $0x10,%edx
  101452:	66 89 15 3e d8 96 00 	mov    %dx,0x96d83e

	// Use DPL=3 here because system calls are explicitly invoked
	// by the user process (with "int $T_SYSCALL").
	SETGATE(idt[T_SYSCALL],           0, CPU_GDT_KCODE, &Xsyscall,      3);
  101459:	ba f8 1b 10 00       	mov    $0x101bf8,%edx
  10145e:	66 89 15 40 d8 96 00 	mov    %dx,0x96d840
  101465:	66 c7 05 42 d8 96 00 	movw   $0x8,0x96d842
  10146c:	08 00 
  10146e:	c6 05 44 d8 96 00 00 	movb   $0x0,0x96d844
  101475:	0f b6 05 45 d8 96 00 	movzbl 0x96d845,%eax
  10147c:	83 e0 f0             	and    $0xfffffff0,%eax
  10147f:	83 c8 0e             	or     $0xe,%eax
  101482:	83 e0 ef             	and    $0xffffffef,%eax
  101485:	83 c8 e0             	or     $0xffffffe0,%eax
  101488:	a2 45 d8 96 00       	mov    %al,0x96d845
  10148d:	c1 ea 10             	shr    $0x10,%edx
  101490:	66 89 15 46 d8 96 00 	mov    %dx,0x96d846

	/* default */
	SETGATE(idt[T_DEFAULT],           0, CPU_GDT_KCODE, &Xdefault,      0);
  101497:	ba fe 1b 10 00       	mov    $0x101bfe,%edx
  10149c:	66 89 15 b0 de 96 00 	mov    %dx,0x96deb0
  1014a3:	66 c7 05 b2 de 96 00 	movw   $0x8,0x96deb2
  1014aa:	08 00 
  1014ac:	c6 05 b4 de 96 00 00 	movb   $0x0,0x96deb4
  1014b3:	0f b6 05 b5 de 96 00 	movzbl 0x96deb5,%eax
  1014ba:	83 e0 f0             	and    $0xfffffff0,%eax
  1014bd:	83 c8 0e             	or     $0xe,%eax
  1014c0:	83 e0 8f             	and    $0xffffff8f,%eax
  1014c3:	83 c8 80             	or     $0xffffff80,%eax
  1014c6:	a2 b5 de 96 00       	mov    %al,0x96deb5
  1014cb:	c1 ea 10             	shr    $0x10,%edx
  1014ce:	66 89 15 b6 de 96 00 	mov    %dx,0x96deb6

	asm volatile("lidt %0" : : "m" (idt_pd));
  1014d5:	0f 01 1d 00 93 10 00 	lidtl  0x109300
  1014dc:	c3                   	ret    

001014dd <intr_init>:
}

void
intr_init(void)
{
	if (intr_inited == TRUE)
  1014dd:	0f b6 05 40 ce 12 00 	movzbl 0x12ce40,%eax
  1014e4:	3c 01                	cmp    $0x1,%al
  1014e6:	74 17                	je     1014ff <intr_init+0x22>
	asm volatile("lidt %0" : : "m" (idt_pd));
}

void
intr_init(void)
{
  1014e8:	83 ec 0c             	sub    $0xc,%esp
	if (intr_inited == TRUE)
		return;

  pic_init();
  1014eb:	e8 55 00 00 00       	call   101545 <pic_init>
	intr_init_idt();
  1014f0:	e8 0c f7 ff ff       	call   100c01 <intr_init_idt>
	intr_inited = TRUE;
  1014f5:	c6 05 40 ce 12 00 01 	movb   $0x1,0x12ce40
}
  1014fc:	83 c4 0c             	add    $0xc,%esp
  1014ff:	f3 c3                	repz ret 

00101501 <intr_enable>:

void
intr_enable(uint8_t irq)
{
  101501:	83 ec 0c             	sub    $0xc,%esp
  101504:	8b 44 24 10          	mov    0x10(%esp),%eax
	if (irq >= 16)
  101508:	3c 0f                	cmp    $0xf,%al
  10150a:	76 04                	jbe    101510 <intr_enable+0xf>
		return;
	pic_enable(irq);
}
  10150c:	83 c4 0c             	add    $0xc,%esp
  10150f:	c3                   	ret    
void
intr_enable(uint8_t irq)
{
	if (irq >= 16)
		return;
	pic_enable(irq);
  101510:	83 ec 0c             	sub    $0xc,%esp
  101513:	0f b6 c0             	movzbl %al,%eax
  101516:	50                   	push   %eax
  101517:	e8 56 01 00 00       	call   101672 <pic_enable>
  10151c:	83 c4 10             	add    $0x10,%esp
  10151f:	eb eb                	jmp    10150c <intr_enable+0xb>

00101521 <intr_eoi>:
}

void
intr_eoi(void)
{
  101521:	83 ec 0c             	sub    $0xc,%esp
	pic_eoi();
  101524:	e8 6d 01 00 00       	call   101696 <pic_eoi>
}
  101529:	83 c4 0c             	add    $0xc,%esp
  10152c:	c3                   	ret    

0010152d <intr_local_enable>:

void
intr_local_enable(void)
{
  10152d:	83 ec 0c             	sub    $0xc,%esp
	sti();
  101530:	e8 da 11 00 00       	call   10270f <sti>
}
  101535:	83 c4 0c             	add    $0xc,%esp
  101538:	c3                   	ret    

00101539 <intr_local_disable>:

void
intr_local_disable(void)
{
  101539:	83 ec 0c             	sub    $0xc,%esp
	cli();
  10153c:	e8 cc 11 00 00       	call   10270d <cli>
}
  101541:	83 c4 0c             	add    $0xc,%esp
  101544:	c3                   	ret    

00101545 <pic_init>:

/* Initialize the 8259A interrupt controllers. */
void
pic_init(void)
{
	if (pic_inited == TRUE)		// only do once on bootstrap CPU
  101545:	80 3d 41 ce 12 00 01 	cmpb   $0x1,0x12ce41
  10154c:	0f 84 ee 00 00 00    	je     101640 <pic_init+0xfb>
static bool pic_inited = FALSE;

/* Initialize the 8259A interrupt controllers. */
void
pic_init(void)
{
  101552:	83 ec 14             	sub    $0x14,%esp
	if (pic_inited == TRUE)		// only do once on bootstrap CPU
		return;
	pic_inited = TRUE;
  101555:	c6 05 41 ce 12 00 01 	movb   $0x1,0x12ce41

	/* mask all interrupts */
	outb(IO_PIC1+1, 0xff);
  10155c:	68 ff 00 00 00       	push   $0xff
  101561:	6a 21                	push   $0x21
  101563:	e8 6c 12 00 00       	call   1027d4 <outb>
	outb(IO_PIC2+1, 0xff);
  101568:	83 c4 08             	add    $0x8,%esp
  10156b:	68 ff 00 00 00       	push   $0xff
  101570:	68 a1 00 00 00       	push   $0xa1
  101575:	e8 5a 12 00 00       	call   1027d4 <outb>

	// ICW1:  0001g0hi
	//    g:  0 = edge triggering, 1 = level triggering
	//    h:  0 = cascaded PICs, 1 = master only
	//    i:  0 = no ICW4, 1 = ICW4 required
	outb(IO_PIC1, 0x11);
  10157a:	83 c4 08             	add    $0x8,%esp
  10157d:	6a 11                	push   $0x11
  10157f:	6a 20                	push   $0x20
  101581:	e8 4e 12 00 00       	call   1027d4 <outb>

	// ICW2:  Vector offset
	outb(IO_PIC1+1, T_IRQ0);
  101586:	83 c4 08             	add    $0x8,%esp
  101589:	6a 20                	push   $0x20
  10158b:	6a 21                	push   $0x21
  10158d:	e8 42 12 00 00       	call   1027d4 <outb>

	// ICW3:  bit mask of IR lines connected to slave PICs (master PIC),
	//        3-bit No of IR line at which slave connects to master(slave PIC).
	outb(IO_PIC1+1, 1<<IRQ_SLAVE);
  101592:	83 c4 08             	add    $0x8,%esp
  101595:	6a 04                	push   $0x4
  101597:	6a 21                	push   $0x21
  101599:	e8 36 12 00 00       	call   1027d4 <outb>
	//    m:  0 = slave PIC, 1 = master PIC
	//	  (ignored when b is 0, as the master/slave role
	//	  can be hardwired).
	//    a:  1 = Automatic EOI mode
	//    p:  0 = MCS-80/85 mode, 1 = intel x86 mode
	outb(IO_PIC1+1, 0x1);
  10159e:	83 c4 08             	add    $0x8,%esp
  1015a1:	6a 01                	push   $0x1
  1015a3:	6a 21                	push   $0x21
  1015a5:	e8 2a 12 00 00       	call   1027d4 <outb>

	// Set up slave (8259A-2)
	outb(IO_PIC2, 0x11);			// ICW1
  1015aa:	83 c4 08             	add    $0x8,%esp
  1015ad:	6a 11                	push   $0x11
  1015af:	68 a0 00 00 00       	push   $0xa0
  1015b4:	e8 1b 12 00 00       	call   1027d4 <outb>
	outb(IO_PIC2+1, T_IRQ0 + 8);		// ICW2
  1015b9:	83 c4 08             	add    $0x8,%esp
  1015bc:	6a 28                	push   $0x28
  1015be:	68 a1 00 00 00       	push   $0xa1
  1015c3:	e8 0c 12 00 00       	call   1027d4 <outb>
	outb(IO_PIC2+1, IRQ_SLAVE);		// ICW3
  1015c8:	83 c4 08             	add    $0x8,%esp
  1015cb:	6a 02                	push   $0x2
  1015cd:	68 a1 00 00 00       	push   $0xa1
  1015d2:	e8 fd 11 00 00       	call   1027d4 <outb>
	// NB Automatic EOI mode doesn't tend to work on the slave.
	// Linux source code says it's "to be investigated".
	outb(IO_PIC2+1, 0x01);			// ICW4
  1015d7:	83 c4 08             	add    $0x8,%esp
  1015da:	6a 01                	push   $0x1
  1015dc:	68 a1 00 00 00       	push   $0xa1
  1015e1:	e8 ee 11 00 00       	call   1027d4 <outb>

	// OCW3:  0ef01prs
	//   ef:  0x = NOP, 10 = clear specific mask, 11 = set specific mask
	//    p:  0 = no polling, 1 = polling mode
	//   rs:  0x = NOP, 10 = read IRR, 11 = read ISR
	outb(IO_PIC1, 0x68);             /* clear specific mask */
  1015e6:	83 c4 08             	add    $0x8,%esp
  1015e9:	6a 68                	push   $0x68
  1015eb:	6a 20                	push   $0x20
  1015ed:	e8 e2 11 00 00       	call   1027d4 <outb>
	outb(IO_PIC1, 0x0a);             /* read IRR by default */
  1015f2:	83 c4 08             	add    $0x8,%esp
  1015f5:	6a 0a                	push   $0xa
  1015f7:	6a 20                	push   $0x20
  1015f9:	e8 d6 11 00 00       	call   1027d4 <outb>

	outb(IO_PIC2, 0x68);               /* OCW3 */
  1015fe:	83 c4 08             	add    $0x8,%esp
  101601:	6a 68                	push   $0x68
  101603:	68 a0 00 00 00       	push   $0xa0
  101608:	e8 c7 11 00 00       	call   1027d4 <outb>
	outb(IO_PIC2, 0x0a);               /* OCW3 */
  10160d:	83 c4 08             	add    $0x8,%esp
  101610:	6a 0a                	push   $0xa
  101612:	68 a0 00 00 00       	push   $0xa0
  101617:	e8 b8 11 00 00       	call   1027d4 <outb>

	// mask all interrupts
	outb(IO_PIC1+1, 0xFF);
  10161c:	83 c4 08             	add    $0x8,%esp
  10161f:	68 ff 00 00 00       	push   $0xff
  101624:	6a 21                	push   $0x21
  101626:	e8 a9 11 00 00       	call   1027d4 <outb>
	outb(IO_PIC2+1, 0xFF);
  10162b:	83 c4 08             	add    $0x8,%esp
  10162e:	68 ff 00 00 00       	push   $0xff
  101633:	68 a1 00 00 00       	push   $0xa1
  101638:	e8 97 11 00 00       	call   1027d4 <outb>
}
  10163d:	83 c4 1c             	add    $0x1c,%esp
  101640:	f3 c3                	repz ret 

00101642 <pic_setmask>:

void
pic_setmask(uint16_t mask)
{
  101642:	53                   	push   %ebx
  101643:	83 ec 10             	sub    $0x10,%esp
  101646:	8b 5c 24 18          	mov    0x18(%esp),%ebx
	irqmask = mask;
  10164a:	66 89 1d 06 93 10 00 	mov    %bx,0x109306
	outb(IO_PIC1+1, (char)mask);
  101651:	0f b6 c3             	movzbl %bl,%eax
  101654:	50                   	push   %eax
  101655:	6a 21                	push   $0x21
  101657:	e8 78 11 00 00       	call   1027d4 <outb>
	outb(IO_PIC2+1, (char)(mask >> 8));
  10165c:	83 c4 08             	add    $0x8,%esp
  10165f:	0f b6 df             	movzbl %bh,%ebx
  101662:	53                   	push   %ebx
  101663:	68 a1 00 00 00       	push   $0xa1
  101668:	e8 67 11 00 00       	call   1027d4 <outb>
}
  10166d:	83 c4 18             	add    $0x18,%esp
  101670:	5b                   	pop    %ebx
  101671:	c3                   	ret    

00101672 <pic_enable>:

void
pic_enable(int irq)
{
  101672:	83 ec 18             	sub    $0x18,%esp
	pic_setmask(irqmask & ~(1 << irq));
  101675:	b8 01 00 00 00       	mov    $0x1,%eax
  10167a:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
  10167e:	d3 e0                	shl    %cl,%eax
  101680:	f7 d0                	not    %eax
  101682:	66 23 05 06 93 10 00 	and    0x109306,%ax
  101689:	0f b7 c0             	movzwl %ax,%eax
  10168c:	50                   	push   %eax
  10168d:	e8 b0 ff ff ff       	call   101642 <pic_setmask>
}
  101692:	83 c4 1c             	add    $0x1c,%esp
  101695:	c3                   	ret    

00101696 <pic_eoi>:

void
pic_eoi(void)
{
  101696:	83 ec 14             	sub    $0x14,%esp
	// OCW2: rse00xxx
	//   r: rotate
	//   s: specific
	//   e: end-of-interrupt
	// xxx: specific interrupt line
	outb(IO_PIC1, 0x20);
  101699:	6a 20                	push   $0x20
  10169b:	6a 20                	push   $0x20
  10169d:	e8 32 11 00 00       	call   1027d4 <outb>
	outb(IO_PIC2, 0x20);
  1016a2:	83 c4 08             	add    $0x8,%esp
  1016a5:	6a 20                	push   $0x20
  1016a7:	68 a0 00 00 00       	push   $0xa0
  1016ac:	e8 23 11 00 00       	call   1027d4 <outb>
}
  1016b1:	83 c4 1c             	add    $0x1c,%esp
  1016b4:	c3                   	ret    

001016b5 <pic_reset>:

void
pic_reset(void)
{
  1016b5:	83 ec 14             	sub    $0x14,%esp
	// mask all interrupts
	outb(IO_PIC1+1, 0x00);
  1016b8:	6a 00                	push   $0x0
  1016ba:	6a 21                	push   $0x21
  1016bc:	e8 13 11 00 00       	call   1027d4 <outb>
	outb(IO_PIC2+1, 0x00);
  1016c1:	83 c4 08             	add    $0x8,%esp
  1016c4:	6a 00                	push   $0x0
  1016c6:	68 a1 00 00 00       	push   $0xa1
  1016cb:	e8 04 11 00 00       	call   1027d4 <outb>

	// ICW1:  0001g0hi
	//    g:  0 = edge triggering, 1 = level triggering
	//    h:  0 = cascaded PICs, 1 = master only
	//    i:  0 = no ICW4, 1 = ICW4 required
	outb(IO_PIC1, 0x11);
  1016d0:	83 c4 08             	add    $0x8,%esp
  1016d3:	6a 11                	push   $0x11
  1016d5:	6a 20                	push   $0x20
  1016d7:	e8 f8 10 00 00       	call   1027d4 <outb>

	// ICW2:  Vector offset
	outb(IO_PIC1+1, T_IRQ0);
  1016dc:	83 c4 08             	add    $0x8,%esp
  1016df:	6a 20                	push   $0x20
  1016e1:	6a 21                	push   $0x21
  1016e3:	e8 ec 10 00 00       	call   1027d4 <outb>

	// ICW3:  bit mask of IR lines connected to slave PICs (master PIC),
	//        3-bit No of IR line at which slave connects to master(slave PIC).
	outb(IO_PIC1+1, 1<<IRQ_SLAVE);
  1016e8:	83 c4 08             	add    $0x8,%esp
  1016eb:	6a 04                	push   $0x4
  1016ed:	6a 21                	push   $0x21
  1016ef:	e8 e0 10 00 00       	call   1027d4 <outb>
	//    m:  0 = slave PIC, 1 = master PIC
	//	  (ignored when b is 0, as the master/slave role
	//	  can be hardwired).
	//    a:  1 = Automatic EOI mode
	//    p:  0 = MCS-80/85 mode, 1 = intel x86 mode
	outb(IO_PIC1+1, 0x3);
  1016f4:	83 c4 08             	add    $0x8,%esp
  1016f7:	6a 03                	push   $0x3
  1016f9:	6a 21                	push   $0x21
  1016fb:	e8 d4 10 00 00       	call   1027d4 <outb>

	// Set up slave (8259A-2)
	outb(IO_PIC2, 0x11);			// ICW1
  101700:	83 c4 08             	add    $0x8,%esp
  101703:	6a 11                	push   $0x11
  101705:	68 a0 00 00 00       	push   $0xa0
  10170a:	e8 c5 10 00 00       	call   1027d4 <outb>
	outb(IO_PIC2+1, T_IRQ0 + 8);		// ICW2
  10170f:	83 c4 08             	add    $0x8,%esp
  101712:	6a 28                	push   $0x28
  101714:	68 a1 00 00 00       	push   $0xa1
  101719:	e8 b6 10 00 00       	call   1027d4 <outb>
	outb(IO_PIC2+1, IRQ_SLAVE);		// ICW3
  10171e:	83 c4 08             	add    $0x8,%esp
  101721:	6a 02                	push   $0x2
  101723:	68 a1 00 00 00       	push   $0xa1
  101728:	e8 a7 10 00 00       	call   1027d4 <outb>
	// NB Automatic EOI mode doesn't tend to work on the slave.
	// Linux source code says it's "to be investigated".
	outb(IO_PIC2+1, 0x01);			// ICW4
  10172d:	83 c4 08             	add    $0x8,%esp
  101730:	6a 01                	push   $0x1
  101732:	68 a1 00 00 00       	push   $0xa1
  101737:	e8 98 10 00 00       	call   1027d4 <outb>

	// OCW3:  0ef01prs
	//   ef:  0x = NOP, 10 = clear specific mask, 11 = set specific mask
	//    p:  0 = no polling, 1 = polling mode
	//   rs:  0x = NOP, 10 = read IRR, 11 = read ISR
	outb(IO_PIC1, 0x68);             /* clear specific mask */
  10173c:	83 c4 08             	add    $0x8,%esp
  10173f:	6a 68                	push   $0x68
  101741:	6a 20                	push   $0x20
  101743:	e8 8c 10 00 00       	call   1027d4 <outb>
	outb(IO_PIC1, 0x0a);             /* read IRR by default */
  101748:	83 c4 08             	add    $0x8,%esp
  10174b:	6a 0a                	push   $0xa
  10174d:	6a 20                	push   $0x20
  10174f:	e8 80 10 00 00       	call   1027d4 <outb>

	outb(IO_PIC2, 0x68);               /* OCW3 */
  101754:	83 c4 08             	add    $0x8,%esp
  101757:	6a 68                	push   $0x68
  101759:	68 a0 00 00 00       	push   $0xa0
  10175e:	e8 71 10 00 00       	call   1027d4 <outb>
	outb(IO_PIC2, 0x0a);               /* OCW3 */
  101763:	83 c4 08             	add    $0x8,%esp
  101766:	6a 0a                	push   $0xa
  101768:	68 a0 00 00 00       	push   $0xa0
  10176d:	e8 62 10 00 00       	call   1027d4 <outb>
}
  101772:	83 c4 1c             	add    $0x1c,%esp
  101775:	c3                   	ret    

00101776 <timer_hw_init>:

// Initialize the programmable interval timer.

void
timer_hw_init(void)
{
  101776:	83 ec 14             	sub    $0x14,%esp
	outb(PIT_CONTROL, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  101779:	6a 34                	push   $0x34
  10177b:	6a 43                	push   $0x43
  10177d:	e8 52 10 00 00       	call   1027d4 <outb>
	outb(PIT_CHANNEL0, LOW8(LATCH));
  101782:	83 c4 08             	add    $0x8,%esp
  101785:	68 9c 00 00 00       	push   $0x9c
  10178a:	6a 40                	push   $0x40
  10178c:	e8 43 10 00 00       	call   1027d4 <outb>
	outb(PIT_CHANNEL0, HIGH8(LATCH));
  101791:	83 c4 08             	add    $0x8,%esp
  101794:	6a 2e                	push   $0x2e
  101796:	6a 40                	push   $0x40
  101798:	e8 37 10 00 00       	call   1027d4 <outb>
}
  10179d:	83 c4 1c             	add    $0x1c,%esp
  1017a0:	c3                   	ret    

001017a1 <tsc_calibrate>:
/*
 * XXX: From Linux 3.2.6: arch/x86/kernel/tsc.c: pit_calibrate_tsc()
 */
static uint64_t
tsc_calibrate(uint32_t latch, uint32_t ms, int loopmin)
{
  1017a1:	55                   	push   %ebp
  1017a2:	57                   	push   %edi
  1017a3:	56                   	push   %esi
  1017a4:	53                   	push   %ebx
  1017a5:	83 ec 38             	sub    $0x38,%esp
  1017a8:	89 c3                	mov    %eax,%ebx
  1017aa:	89 54 24 28          	mov    %edx,0x28(%esp)
  1017ae:	89 cd                	mov    %ecx,%ebp
	uint64_t tsc, t1, t2, delta, tscmin, tscmax;;
	int pitcnt;

	/* Set the Gate high, disable speaker */
	outb(0x61, (inb(0x61) & ~0x02) | 0x01);
  1017b0:	6a 61                	push   $0x61
  1017b2:	e8 05 10 00 00       	call   1027bc <inb>
  1017b7:	83 e0 fc             	and    $0xfffffffc,%eax
  1017ba:	83 c8 01             	or     $0x1,%eax
  1017bd:	83 c4 08             	add    $0x8,%esp
  1017c0:	0f b6 c0             	movzbl %al,%eax
  1017c3:	50                   	push   %eax
  1017c4:	6a 61                	push   $0x61
  1017c6:	e8 09 10 00 00       	call   1027d4 <outb>
	/*
	 * Setup CTC channel 2 for mode 0, (interrupt on terminal
	 * count mode), binary count. Set the latch register to 50ms
	 * (LSB then MSB) to begin countdown.
	 */
	outb(0x43, 0xb0);
  1017cb:	83 c4 08             	add    $0x8,%esp
  1017ce:	68 b0 00 00 00       	push   $0xb0
  1017d3:	6a 43                	push   $0x43
  1017d5:	e8 fa 0f 00 00       	call   1027d4 <outb>
	outb(0x42, latch & 0xff);
  1017da:	83 c4 08             	add    $0x8,%esp
  1017dd:	0f b6 c3             	movzbl %bl,%eax
  1017e0:	50                   	push   %eax
  1017e1:	6a 42                	push   $0x42
  1017e3:	e8 ec 0f 00 00       	call   1027d4 <outb>
	outb(0x42, latch >> 8);
  1017e8:	83 c4 08             	add    $0x8,%esp
  1017eb:	0f b6 df             	movzbl %bh,%ebx
  1017ee:	53                   	push   %ebx
  1017ef:	6a 42                	push   $0x42
  1017f1:	e8 de 0f 00 00       	call   1027d4 <outb>

	tsc = t1 = t2 = rdtsc();
  1017f6:	e8 2f 0f 00 00       	call   10272a <rdtsc>
  1017fb:	89 44 24 20          	mov    %eax,0x20(%esp)
  1017ff:	89 54 24 24          	mov    %edx,0x24(%esp)

	pitcnt = 0;
	tscmax = 0;
	tscmin = ~(uint64_t) 0x0;
	while ((inb(0x61) & 0x20) == 0) {
  101803:	83 c4 10             	add    $0x10,%esp
	 */
	outb(0x43, 0xb0);
	outb(0x42, latch & 0xff);
	outb(0x42, latch >> 8);

	tsc = t1 = t2 = rdtsc();
  101806:	89 c6                	mov    %eax,%esi
  101808:	89 d7                	mov    %edx,%edi

	pitcnt = 0;
  10180a:	bb 00 00 00 00       	mov    $0x0,%ebx
	tscmax = 0;
  10180f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  101816:	00 
  101817:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  10181e:	00 
	tscmin = ~(uint64_t) 0x0;
  10181f:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
  101826:	c7 44 24 04 ff ff ff 	movl   $0xffffffff,0x4(%esp)
  10182d:	ff 
  10182e:	89 5c 24 18          	mov    %ebx,0x18(%esp)
	while ((inb(0x61) & 0x20) == 0) {
  101832:	eb 11                	jmp    101845 <tsc_calibrate+0xa4>
		delta = t2 - tsc;
		tsc = t2;
		if (delta < tscmin)
			tscmin = delta;
		if (delta > tscmax)
			tscmax = delta;
  101834:	89 74 24 08          	mov    %esi,0x8(%esp)
  101838:	89 7c 24 0c          	mov    %edi,0xc(%esp)
		pitcnt++;
  10183c:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
	tscmax = 0;
	tscmin = ~(uint64_t) 0x0;
	while ((inb(0x61) & 0x20) == 0) {
		t2 = rdtsc();
		delta = t2 - tsc;
		tsc = t2;
  101841:	89 c6                	mov    %eax,%esi
  101843:	89 d7                	mov    %edx,%edi
	tsc = t1 = t2 = rdtsc();

	pitcnt = 0;
	tscmax = 0;
	tscmin = ~(uint64_t) 0x0;
	while ((inb(0x61) & 0x20) == 0) {
  101845:	83 ec 0c             	sub    $0xc,%esp
  101848:	6a 61                	push   $0x61
  10184a:	e8 6d 0f 00 00       	call   1027bc <inb>
  10184f:	83 c4 10             	add    $0x10,%esp
  101852:	a8 20                	test   $0x20,%al
  101854:	75 3d                	jne    101893 <tsc_calibrate+0xf2>
		t2 = rdtsc();
  101856:	e8 cf 0e 00 00       	call   10272a <rdtsc>
		delta = t2 - tsc;
  10185b:	89 c1                	mov    %eax,%ecx
  10185d:	89 d3                	mov    %edx,%ebx
  10185f:	29 f1                	sub    %esi,%ecx
  101861:	19 fb                	sbb    %edi,%ebx
  101863:	89 ce                	mov    %ecx,%esi
  101865:	89 df                	mov    %ebx,%edi
		tsc = t2;
		if (delta < tscmin)
  101867:	8b 0c 24             	mov    (%esp),%ecx
  10186a:	8b 5c 24 04          	mov    0x4(%esp),%ebx
  10186e:	39 fb                	cmp    %edi,%ebx
  101870:	77 06                	ja     101878 <tsc_calibrate+0xd7>
  101872:	72 0b                	jb     10187f <tsc_calibrate+0xde>
  101874:	39 f1                	cmp    %esi,%ecx
  101876:	76 07                	jbe    10187f <tsc_calibrate+0xde>
			tscmin = delta;
  101878:	89 34 24             	mov    %esi,(%esp)
  10187b:	89 7c 24 04          	mov    %edi,0x4(%esp)
		if (delta > tscmax)
  10187f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  101883:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  101887:	39 fb                	cmp    %edi,%ebx
  101889:	72 a9                	jb     101834 <tsc_calibrate+0x93>
  10188b:	77 af                	ja     10183c <tsc_calibrate+0x9b>
  10188d:	39 f1                	cmp    %esi,%ecx
  10188f:	73 ab                	jae    10183c <tsc_calibrate+0x9b>
  101891:	eb a1                	jmp    101834 <tsc_calibrate+0x93>
  101893:	8b 5c 24 18          	mov    0x18(%esp),%ebx
	 * times, then we have been hit by a massive SMI
	 *
	 * If the maximum is 10 times larger than the minimum,
	 * then we got hit by an SMI as well.
	 */
	KERN_DEBUG("pitcnt=%u, tscmin=%llu, tscmax=%llu\n",
  101897:	ff 74 24 0c          	pushl  0xc(%esp)
  10189b:	ff 74 24 0c          	pushl  0xc(%esp)
  10189f:	ff 74 24 0c          	pushl  0xc(%esp)
  1018a3:	ff 74 24 0c          	pushl  0xc(%esp)
  1018a7:	53                   	push   %ebx
  1018a8:	68 e8 4e 10 00       	push   $0x104ee8
  1018ad:	6a 3a                	push   $0x3a
  1018af:	68 0d 4f 10 00       	push   $0x104f0d
  1018b4:	e8 52 05 00 00       	call   101e0b <debug_normal>
		   pitcnt, tscmin, tscmax);
	if (pitcnt < loopmin || tscmax > 10 * tscmin)
  1018b9:	83 c4 20             	add    $0x20,%esp
  1018bc:	39 eb                	cmp    %ebp,%ebx
  1018be:	7d 12                	jge    1018d2 <tsc_calibrate+0x131>
		return ~(uint64_t) 0x0;
  1018c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1018c5:	ba ff ff ff ff       	mov    $0xffffffff,%edx

	/* Calculate the PIT value */
	delta = t2 - t1;
	return delta / ms;
}
  1018ca:	83 c4 2c             	add    $0x2c,%esp
  1018cd:	5b                   	pop    %ebx
  1018ce:	5e                   	pop    %esi
  1018cf:	5f                   	pop    %edi
  1018d0:	5d                   	pop    %ebp
  1018d1:	c3                   	ret    
	 * If the maximum is 10 times larger than the minimum,
	 * then we got hit by an SMI as well.
	 */
	KERN_DEBUG("pitcnt=%u, tscmin=%llu, tscmax=%llu\n",
		   pitcnt, tscmin, tscmax);
	if (pitcnt < loopmin || tscmax > 10 * tscmin)
  1018d2:	6b 4c 24 04 0a       	imul   $0xa,0x4(%esp),%ecx
  1018d7:	b8 0a 00 00 00       	mov    $0xa,%eax
  1018dc:	f7 24 24             	mull   (%esp)
  1018df:	01 ca                	add    %ecx,%edx
  1018e1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  1018e5:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  1018e9:	39 d3                	cmp    %edx,%ebx
  1018eb:	77 25                	ja     101912 <tsc_calibrate+0x171>
  1018ed:	72 04                	jb     1018f3 <tsc_calibrate+0x152>
  1018ef:	39 c1                	cmp    %eax,%ecx
  1018f1:	77 1f                	ja     101912 <tsc_calibrate+0x171>
		return ~(uint64_t) 0x0;

	/* Calculate the PIT value */
	delta = t2 - t1;
  1018f3:	2b 74 24 10          	sub    0x10(%esp),%esi
  1018f7:	1b 7c 24 14          	sbb    0x14(%esp),%edi
	return delta / ms;
  1018fb:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  1018ff:	ba 00 00 00 00       	mov    $0x0,%edx
  101904:	52                   	push   %edx
  101905:	50                   	push   %eax
  101906:	57                   	push   %edi
  101907:	56                   	push   %esi
  101908:	e8 03 30 00 00       	call   104910 <__udivdi3>
  10190d:	83 c4 10             	add    $0x10,%esp
  101910:	eb b8                	jmp    1018ca <tsc_calibrate+0x129>
	 * then we got hit by an SMI as well.
	 */
	KERN_DEBUG("pitcnt=%u, tscmin=%llu, tscmax=%llu\n",
		   pitcnt, tscmin, tscmax);
	if (pitcnt < loopmin || tscmax > 10 * tscmin)
		return ~(uint64_t) 0x0;
  101912:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101917:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  10191c:	eb ac                	jmp    1018ca <tsc_calibrate+0x129>

0010191e <tsc_init>:
	return delta / ms;
}

int
tsc_init(void)
{
  10191e:	57                   	push   %edi
  10191f:	56                   	push   %esi
  101920:	53                   	push   %ebx
	uint64_t ret;
	int i;

	timer_hw_init();
  101921:	e8 50 fe ff ff       	call   101776 <timer_hw_init>

	tsc_per_ms = 0;
  101926:	c7 05 c0 de 96 00 00 	movl   $0x0,0x96dec0
  10192d:	00 00 00 
  101930:	c7 05 c4 de 96 00 00 	movl   $0x0,0x96dec4
  101937:	00 00 00 

	/*
	 * XXX: If TSC calibration fails frequently, try to increase the
	 *      upperbound of loop condition, e.g. alternating 3 to 10.
	 */
	for (i = 0; i < 10; i++) {
  10193a:	bb 00 00 00 00       	mov    $0x0,%ebx
  10193f:	83 fb 09             	cmp    $0x9,%ebx
  101942:	7f 3a                	jg     10197e <tsc_init+0x60>
		ret = tsc_calibrate(CAL_LATCH, CAL_MS, CAL_PIT_LOOPS);
  101944:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  101949:	ba 0a 00 00 00       	mov    $0xa,%edx
  10194e:	b8 9b 2e 00 00       	mov    $0x2e9b,%eax
  101953:	e8 49 fe ff ff       	call   1017a1 <tsc_calibrate>
  101958:	89 c6                	mov    %eax,%esi
  10195a:	89 d7                	mov    %edx,%edi
		if (ret != ~(uint64_t) 0x0)
  10195c:	f7 d0                	not    %eax
  10195e:	f7 d2                	not    %edx
  101960:	09 c2                	or     %eax,%edx
  101962:	75 1a                	jne    10197e <tsc_init+0x60>
			break;
		KERN_DEBUG("[%d] Retry to calibrate TSC.\n", i+1);
  101964:	83 c3 01             	add    $0x1,%ebx
  101967:	53                   	push   %ebx
  101968:	68 1c 4f 10 00       	push   $0x104f1c
  10196d:	6a 55                	push   $0x55
  10196f:	68 0d 4f 10 00       	push   $0x104f0d
  101974:	e8 92 04 00 00       	call   101e0b <debug_normal>

	/*
	 * XXX: If TSC calibration fails frequently, try to increase the
	 *      upperbound of loop condition, e.g. alternating 3 to 10.
	 */
	for (i = 0; i < 10; i++) {
  101979:	83 c4 10             	add    $0x10,%esp
  10197c:	eb c1                	jmp    10193f <tsc_init+0x21>
		if (ret != ~(uint64_t) 0x0)
			break;
		KERN_DEBUG("[%d] Retry to calibrate TSC.\n", i+1);
	}

	if (ret == ~(uint64_t) 0x0) {
  10197e:	89 fa                	mov    %edi,%edx
  101980:	f7 d2                	not    %edx
  101982:	89 f0                	mov    %esi,%eax
  101984:	f7 d0                	not    %eax
  101986:	09 c2                	or     %eax,%edx
  101988:	74 4d                	je     1019d7 <tsc_init+0xb9>
		tsc_per_ms = 1000000;

		timer_hw_init();
		return 1;
	} else {
		tsc_per_ms = ret;
  10198a:	89 35 c0 de 96 00    	mov    %esi,0x96dec0
  101990:	89 3d c4 de 96 00    	mov    %edi,0x96dec4
		KERN_DEBUG("TSC freq = %llu Hz.\n", tsc_per_ms*1000);
  101996:	a1 c0 de 96 00       	mov    0x96dec0,%eax
  10199b:	8b 15 c4 de 96 00    	mov    0x96dec4,%edx
  1019a1:	83 ec 0c             	sub    $0xc,%esp
  1019a4:	69 ca e8 03 00 00    	imul   $0x3e8,%edx,%ecx
  1019aa:	ba e8 03 00 00       	mov    $0x3e8,%edx
  1019af:	f7 e2                	mul    %edx
  1019b1:	01 ca                	add    %ecx,%edx
  1019b3:	52                   	push   %edx
  1019b4:	50                   	push   %eax
  1019b5:	68 6d 4f 10 00       	push   $0x104f6d
  1019ba:	6a 61                	push   $0x61
  1019bc:	68 0d 4f 10 00       	push   $0x104f0d
  1019c1:	e8 45 04 00 00       	call   101e0b <debug_normal>

		timer_hw_init();
  1019c6:	83 c4 20             	add    $0x20,%esp
  1019c9:	e8 a8 fd ff ff       	call   101776 <timer_hw_init>
		return 0;
  1019ce:	b8 00 00 00 00       	mov    $0x0,%eax
	}
}
  1019d3:	5b                   	pop    %ebx
  1019d4:	5e                   	pop    %esi
  1019d5:	5f                   	pop    %edi
  1019d6:	c3                   	ret    
			break;
		KERN_DEBUG("[%d] Retry to calibrate TSC.\n", i+1);
	}

	if (ret == ~(uint64_t) 0x0) {
		KERN_DEBUG("TSC calibration failed.\n");
  1019d7:	83 ec 04             	sub    $0x4,%esp
  1019da:	68 3a 4f 10 00       	push   $0x104f3a
  1019df:	6a 59                	push   $0x59
  1019e1:	68 0d 4f 10 00       	push   $0x104f0d
  1019e6:	e8 20 04 00 00       	call   101e0b <debug_normal>
		KERN_DEBUG("Assume TSC freq = 1 GHz.\n");
  1019eb:	83 c4 0c             	add    $0xc,%esp
  1019ee:	68 53 4f 10 00       	push   $0x104f53
  1019f3:	6a 5a                	push   $0x5a
  1019f5:	68 0d 4f 10 00       	push   $0x104f0d
  1019fa:	e8 0c 04 00 00       	call   101e0b <debug_normal>
		tsc_per_ms = 1000000;
  1019ff:	c7 05 c0 de 96 00 40 	movl   $0xf4240,0x96dec0
  101a06:	42 0f 00 
  101a09:	c7 05 c4 de 96 00 00 	movl   $0x0,0x96dec4
  101a10:	00 00 00 

		timer_hw_init();
  101a13:	e8 5e fd ff ff       	call   101776 <timer_hw_init>
		return 1;
  101a18:	83 c4 10             	add    $0x10,%esp
  101a1b:	b8 01 00 00 00       	mov    $0x1,%eax
  101a20:	eb b1                	jmp    1019d3 <tsc_init+0xb5>

00101a22 <delay>:
/*
 * Wait for ms millisecond.
 */
void
delay(uint32_t ms)
{
  101a22:	57                   	push   %edi
  101a23:	56                   	push   %esi
  101a24:	53                   	push   %ebx
  101a25:	83 ec 10             	sub    $0x10,%esp
  101a28:	8b 44 24 20          	mov    0x20(%esp),%eax
	volatile uint64_t ticks = tsc_per_ms * ms;
  101a2c:	8b 0d c0 de 96 00    	mov    0x96dec0,%ecx
  101a32:	8b 1d c4 de 96 00    	mov    0x96dec4,%ebx
  101a38:	0f af d8             	imul   %eax,%ebx
  101a3b:	f7 e1                	mul    %ecx
  101a3d:	01 da                	add    %ebx,%edx
  101a3f:	89 44 24 08          	mov    %eax,0x8(%esp)
  101a43:	89 54 24 0c          	mov    %edx,0xc(%esp)
	volatile uint64_t start = rdtsc();
  101a47:	e8 de 0c 00 00       	call   10272a <rdtsc>
  101a4c:	89 04 24             	mov    %eax,(%esp)
  101a4f:	89 54 24 04          	mov    %edx,0x4(%esp)
	while (rdtsc() < start + ticks);
  101a53:	e8 d2 0c 00 00       	call   10272a <rdtsc>
  101a58:	8b 0c 24             	mov    (%esp),%ecx
  101a5b:	8b 5c 24 04          	mov    0x4(%esp),%ebx
  101a5f:	8b 74 24 08          	mov    0x8(%esp),%esi
  101a63:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  101a67:	01 f1                	add    %esi,%ecx
  101a69:	11 fb                	adc    %edi,%ebx
  101a6b:	39 da                	cmp    %ebx,%edx
  101a6d:	72 e4                	jb     101a53 <delay+0x31>
  101a6f:	77 04                	ja     101a75 <delay+0x53>
  101a71:	39 c8                	cmp    %ecx,%eax
  101a73:	72 de                	jb     101a53 <delay+0x31>
}
  101a75:	83 c4 10             	add    $0x10,%esp
  101a78:	5b                   	pop    %ebx
  101a79:	5e                   	pop    %esi
  101a7a:	5f                   	pop    %edi
  101a7b:	c3                   	ret    

00101a7c <udelay>:
/*
 * Wait for us microsecond.
 */
void
udelay(uint32_t us)
{
  101a7c:	57                   	push   %edi
  101a7d:	56                   	push   %esi
  101a7e:	53                   	push   %ebx
  101a7f:	83 ec 10             	sub    $0x10,%esp
  101a82:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    volatile uint64_t ticks = tsc_per_ms / 1000 * us;
  101a86:	a1 c0 de 96 00       	mov    0x96dec0,%eax
  101a8b:	8b 15 c4 de 96 00    	mov    0x96dec4,%edx
  101a91:	6a 00                	push   $0x0
  101a93:	68 e8 03 00 00       	push   $0x3e8
  101a98:	52                   	push   %edx
  101a99:	50                   	push   %eax
  101a9a:	e8 71 2e 00 00       	call   104910 <__udivdi3>
  101a9f:	83 c4 10             	add    $0x10,%esp
  101aa2:	89 d1                	mov    %edx,%ecx
  101aa4:	0f af cb             	imul   %ebx,%ecx
  101aa7:	f7 e3                	mul    %ebx
  101aa9:	01 ca                	add    %ecx,%edx
  101aab:	89 44 24 08          	mov    %eax,0x8(%esp)
  101aaf:	89 54 24 0c          	mov    %edx,0xc(%esp)
    volatile uint64_t start = rdtsc();
  101ab3:	e8 72 0c 00 00       	call   10272a <rdtsc>
  101ab8:	89 04 24             	mov    %eax,(%esp)
  101abb:	89 54 24 04          	mov    %edx,0x4(%esp)
    while (rdtsc() < start + ticks);
  101abf:	e8 66 0c 00 00       	call   10272a <rdtsc>
  101ac4:	8b 0c 24             	mov    (%esp),%ecx
  101ac7:	8b 5c 24 04          	mov    0x4(%esp),%ebx
  101acb:	8b 74 24 08          	mov    0x8(%esp),%esi
  101acf:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  101ad3:	01 f1                	add    %esi,%ecx
  101ad5:	11 fb                	adc    %edi,%ebx
  101ad7:	39 da                	cmp    %ebx,%edx
  101ad9:	72 e4                	jb     101abf <udelay+0x43>
  101adb:	77 04                	ja     101ae1 <udelay+0x65>
  101add:	39 c8                	cmp    %ecx,%eax
  101adf:	72 de                	jb     101abf <udelay+0x43>
}
  101ae1:	83 c4 10             	add    $0x10,%esp
  101ae4:	5b                   	pop    %ebx
  101ae5:	5e                   	pop    %esi
  101ae6:	5f                   	pop    %edi
  101ae7:	c3                   	ret    
  101ae8:	66 90                	xchg   %ax,%ax
  101aea:	66 90                	xchg   %ax,%ax
  101aec:	66 90                	xchg   %ax,%ax
  101aee:	66 90                	xchg   %ax,%ax

00101af0 <Xdivide>:
	jmp _alltraps

.text

/* exceptions  */
TRAPHANDLER_NOEC(Xdivide,	T_DIVIDE)
  101af0:	6a 00                	push   $0x0
  101af2:	6a 00                	push   $0x0
  101af4:	e9 17 01 00 00       	jmp    101c10 <_alltraps>
  101af9:	90                   	nop

00101afa <Xdebug>:
TRAPHANDLER_NOEC(Xdebug,	T_DEBUG)
  101afa:	6a 00                	push   $0x0
  101afc:	6a 01                	push   $0x1
  101afe:	e9 0d 01 00 00       	jmp    101c10 <_alltraps>
  101b03:	90                   	nop

00101b04 <Xnmi>:
TRAPHANDLER_NOEC(Xnmi,		T_NMI)
  101b04:	6a 00                	push   $0x0
  101b06:	6a 02                	push   $0x2
  101b08:	e9 03 01 00 00       	jmp    101c10 <_alltraps>
  101b0d:	90                   	nop

00101b0e <Xbrkpt>:
TRAPHANDLER_NOEC(Xbrkpt,	T_BRKPT)
  101b0e:	6a 00                	push   $0x0
  101b10:	6a 03                	push   $0x3
  101b12:	e9 f9 00 00 00       	jmp    101c10 <_alltraps>
  101b17:	90                   	nop

00101b18 <Xoflow>:
TRAPHANDLER_NOEC(Xoflow,	T_OFLOW)
  101b18:	6a 00                	push   $0x0
  101b1a:	6a 04                	push   $0x4
  101b1c:	e9 ef 00 00 00       	jmp    101c10 <_alltraps>
  101b21:	90                   	nop

00101b22 <Xbound>:
TRAPHANDLER_NOEC(Xbound,	T_BOUND)
  101b22:	6a 00                	push   $0x0
  101b24:	6a 05                	push   $0x5
  101b26:	e9 e5 00 00 00       	jmp    101c10 <_alltraps>
  101b2b:	90                   	nop

00101b2c <Xillop>:
TRAPHANDLER_NOEC(Xillop,	T_ILLOP)
  101b2c:	6a 00                	push   $0x0
  101b2e:	6a 06                	push   $0x6
  101b30:	e9 db 00 00 00       	jmp    101c10 <_alltraps>
  101b35:	90                   	nop

00101b36 <Xdevice>:
TRAPHANDLER_NOEC(Xdevice,	T_DEVICE)
  101b36:	6a 00                	push   $0x0
  101b38:	6a 07                	push   $0x7
  101b3a:	e9 d1 00 00 00       	jmp    101c10 <_alltraps>
  101b3f:	90                   	nop

00101b40 <Xdblflt>:
TRAPHANDLER     (Xdblflt,	T_DBLFLT)
  101b40:	6a 08                	push   $0x8
  101b42:	e9 c9 00 00 00       	jmp    101c10 <_alltraps>
  101b47:	90                   	nop

00101b48 <Xcoproc>:
TRAPHANDLER_NOEC(Xcoproc,	T_COPROC)
  101b48:	6a 00                	push   $0x0
  101b4a:	6a 09                	push   $0x9
  101b4c:	e9 bf 00 00 00       	jmp    101c10 <_alltraps>
  101b51:	90                   	nop

00101b52 <Xtss>:
TRAPHANDLER     (Xtss,		T_TSS)
  101b52:	6a 0a                	push   $0xa
  101b54:	e9 b7 00 00 00       	jmp    101c10 <_alltraps>
  101b59:	90                   	nop

00101b5a <Xsegnp>:
TRAPHANDLER     (Xsegnp,	T_SEGNP)
  101b5a:	6a 0b                	push   $0xb
  101b5c:	e9 af 00 00 00       	jmp    101c10 <_alltraps>
  101b61:	90                   	nop

00101b62 <Xstack>:
TRAPHANDLER     (Xstack,	T_STACK)
  101b62:	6a 0c                	push   $0xc
  101b64:	e9 a7 00 00 00       	jmp    101c10 <_alltraps>
  101b69:	90                   	nop

00101b6a <Xgpflt>:
TRAPHANDLER     (Xgpflt,	T_GPFLT)
  101b6a:	6a 0d                	push   $0xd
  101b6c:	e9 9f 00 00 00       	jmp    101c10 <_alltraps>
  101b71:	90                   	nop

00101b72 <Xpgflt>:
TRAPHANDLER     (Xpgflt,	T_PGFLT)
  101b72:	6a 0e                	push   $0xe
  101b74:	e9 97 00 00 00       	jmp    101c10 <_alltraps>
  101b79:	90                   	nop

00101b7a <Xres>:
TRAPHANDLER_NOEC(Xres,		T_RES)
  101b7a:	6a 00                	push   $0x0
  101b7c:	6a 0f                	push   $0xf
  101b7e:	e9 8d 00 00 00       	jmp    101c10 <_alltraps>
  101b83:	90                   	nop

00101b84 <Xfperr>:
TRAPHANDLER_NOEC(Xfperr,	T_FPERR)
  101b84:	6a 00                	push   $0x0
  101b86:	6a 10                	push   $0x10
  101b88:	e9 83 00 00 00       	jmp    101c10 <_alltraps>
  101b8d:	90                   	nop

00101b8e <Xalign>:
TRAPHANDLER     (Xalign,	T_ALIGN)
  101b8e:	6a 11                	push   $0x11
  101b90:	eb 7e                	jmp    101c10 <_alltraps>

00101b92 <Xmchk>:
TRAPHANDLER_NOEC(Xmchk,		T_MCHK)
  101b92:	6a 00                	push   $0x0
  101b94:	6a 12                	push   $0x12
  101b96:	eb 78                	jmp    101c10 <_alltraps>

00101b98 <Xirq_timer>:

/* ISA interrupts  */
TRAPHANDLER_NOEC(Xirq_timer,	T_IRQ0 + IRQ_TIMER)
  101b98:	6a 00                	push   $0x0
  101b9a:	6a 20                	push   $0x20
  101b9c:	eb 72                	jmp    101c10 <_alltraps>

00101b9e <Xirq_kbd>:
TRAPHANDLER_NOEC(Xirq_kbd,	T_IRQ0 + IRQ_KBD)
  101b9e:	6a 00                	push   $0x0
  101ba0:	6a 21                	push   $0x21
  101ba2:	eb 6c                	jmp    101c10 <_alltraps>

00101ba4 <Xirq_slave>:
TRAPHANDLER_NOEC(Xirq_slave,	T_IRQ0 + IRQ_SLAVE)
  101ba4:	6a 00                	push   $0x0
  101ba6:	6a 22                	push   $0x22
  101ba8:	eb 66                	jmp    101c10 <_alltraps>

00101baa <Xirq_serial2>:
TRAPHANDLER_NOEC(Xirq_serial2,	T_IRQ0 + IRQ_SERIAL24)
  101baa:	6a 00                	push   $0x0
  101bac:	6a 23                	push   $0x23
  101bae:	eb 60                	jmp    101c10 <_alltraps>

00101bb0 <Xirq_serial1>:
TRAPHANDLER_NOEC(Xirq_serial1,	T_IRQ0 + IRQ_SERIAL13)
  101bb0:	6a 00                	push   $0x0
  101bb2:	6a 24                	push   $0x24
  101bb4:	eb 5a                	jmp    101c10 <_alltraps>

00101bb6 <Xirq_lpt>:
TRAPHANDLER_NOEC(Xirq_lpt,	T_IRQ0 + IRQ_LPT2)
  101bb6:	6a 00                	push   $0x0
  101bb8:	6a 25                	push   $0x25
  101bba:	eb 54                	jmp    101c10 <_alltraps>

00101bbc <Xirq_floppy>:
TRAPHANDLER_NOEC(Xirq_floppy,	T_IRQ0 + IRQ_FLOPPY)
  101bbc:	6a 00                	push   $0x0
  101bbe:	6a 26                	push   $0x26
  101bc0:	eb 4e                	jmp    101c10 <_alltraps>

00101bc2 <Xirq_spurious>:
TRAPHANDLER_NOEC(Xirq_spurious,	T_IRQ0 + IRQ_SPURIOUS)
  101bc2:	6a 00                	push   $0x0
  101bc4:	6a 27                	push   $0x27
  101bc6:	eb 48                	jmp    101c10 <_alltraps>

00101bc8 <Xirq_rtc>:
TRAPHANDLER_NOEC(Xirq_rtc,	T_IRQ0 + IRQ_RTC)
  101bc8:	6a 00                	push   $0x0
  101bca:	6a 28                	push   $0x28
  101bcc:	eb 42                	jmp    101c10 <_alltraps>

00101bce <Xirq9>:
TRAPHANDLER_NOEC(Xirq9,		T_IRQ0 + 9)
  101bce:	6a 00                	push   $0x0
  101bd0:	6a 29                	push   $0x29
  101bd2:	eb 3c                	jmp    101c10 <_alltraps>

00101bd4 <Xirq10>:
TRAPHANDLER_NOEC(Xirq10,	T_IRQ0 + 10)
  101bd4:	6a 00                	push   $0x0
  101bd6:	6a 2a                	push   $0x2a
  101bd8:	eb 36                	jmp    101c10 <_alltraps>

00101bda <Xirq11>:
TRAPHANDLER_NOEC(Xirq11,	T_IRQ0 + 11)
  101bda:	6a 00                	push   $0x0
  101bdc:	6a 2b                	push   $0x2b
  101bde:	eb 30                	jmp    101c10 <_alltraps>

00101be0 <Xirq_mouse>:
TRAPHANDLER_NOEC(Xirq_mouse,	T_IRQ0 + IRQ_MOUSE)
  101be0:	6a 00                	push   $0x0
  101be2:	6a 2c                	push   $0x2c
  101be4:	eb 2a                	jmp    101c10 <_alltraps>

00101be6 <Xirq_coproc>:
TRAPHANDLER_NOEC(Xirq_coproc,	T_IRQ0 + IRQ_COPROCESSOR)
  101be6:	6a 00                	push   $0x0
  101be8:	6a 2d                	push   $0x2d
  101bea:	eb 24                	jmp    101c10 <_alltraps>

00101bec <Xirq_ide1>:
TRAPHANDLER_NOEC(Xirq_ide1,	T_IRQ0 + IRQ_IDE1)
  101bec:	6a 00                	push   $0x0
  101bee:	6a 2e                	push   $0x2e
  101bf0:	eb 1e                	jmp    101c10 <_alltraps>

00101bf2 <Xirq_ide2>:
TRAPHANDLER_NOEC(Xirq_ide2,	T_IRQ0 + IRQ_IDE2)
  101bf2:	6a 00                	push   $0x0
  101bf4:	6a 2f                	push   $0x2f
  101bf6:	eb 18                	jmp    101c10 <_alltraps>

00101bf8 <Xsyscall>:

/* syscall */
TRAPHANDLER_NOEC(Xsyscall,	T_SYSCALL)
  101bf8:	6a 00                	push   $0x0
  101bfa:	6a 30                	push   $0x30
  101bfc:	eb 12                	jmp    101c10 <_alltraps>

00101bfe <Xdefault>:

/* default ? */
TRAPHANDLER     (Xdefault,	T_DEFAULT)
  101bfe:	68 fe 00 00 00       	push   $0xfe
  101c03:	eb 0b                	jmp    101c10 <_alltraps>
  101c05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101c10 <_alltraps>:

.globl	_alltraps
.type	_alltraps,@function
.p2align 4, 0x90		/* 16-byte alignment, nop filled */
_alltraps:
	cli			# make sure there is no nested trap
  101c10:	fa                   	cli    

	cld
  101c11:	fc                   	cld    

	pushl %ds		# build context
  101c12:	1e                   	push   %ds
	pushl %es
  101c13:	06                   	push   %es
	pushal
  101c14:	60                   	pusha  

	movl $CPU_GDT_KDATA,%eax # load kernel's data segment
  101c15:	b8 10 00 00 00       	mov    $0x10,%eax
	movw %ax,%ds
  101c1a:	8e d8                	mov    %eax,%ds
	movw %ax,%es
  101c1c:	8e c0                	mov    %eax,%es

	pushl %esp		# pass pointer to this trapframe
  101c1e:	54                   	push   %esp
	call trap		# and call trap (does not return)
  101c1f:	e8 6c 2c 00 00       	call   104890 <trap>

1:	hlt			# should never get here; just spin...
  101c24:	f4                   	hlt    
  101c25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101c30 <trap_return>:
//
.globl	trap_return
.type	trap_return,@function
.p2align 4, 0x90		/* 16-byte alignment, nop filled */
trap_return:
	movl	4(%esp),%esp	// reset stack pointer to point to trap frame
  101c30:	8b 64 24 04          	mov    0x4(%esp),%esp
	popal			// restore general-purpose registers except esp
  101c34:	61                   	popa   
	popl	%es		// restore data segment registers
  101c35:	07                   	pop    %es
	popl	%ds
  101c36:	1f                   	pop    %ds
	addl	$8,%esp		// skip tf_trapno and tf_errcode
  101c37:	83 c4 08             	add    $0x8,%esp
	iret			// return from trap handler
  101c3a:	cf                   	iret   

00101c3b <memset>:
#include "string.h"
#include "types.h"

void *
memset(void *v, int c, size_t n)
{
  101c3b:	57                   	push   %edi
  101c3c:	53                   	push   %ebx
  101c3d:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  101c41:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    if (n == 0)
  101c45:	85 c9                	test   %ecx,%ecx
  101c47:	74 14                	je     101c5d <memset+0x22>
        return v;
    if ((int)v%4 == 0 && n%4 == 0) {
  101c49:	f7 c7 03 00 00 00    	test   $0x3,%edi
  101c4f:	75 05                	jne    101c56 <memset+0x1b>
  101c51:	f6 c1 03             	test   $0x3,%cl
  101c54:	74 0c                	je     101c62 <memset+0x27>
        c = (c<<24)|(c<<16)|(c<<8)|c;
        asm volatile("cld; rep stosl\n"
                 :: "D" (v), "a" (c), "c" (n/4)
                 : "cc", "memory");
    } else
        asm volatile("cld; rep stosb\n"
  101c56:	8b 44 24 10          	mov    0x10(%esp),%eax
  101c5a:	fc                   	cld    
  101c5b:	f3 aa                	rep stos %al,%es:(%edi)
                 :: "D" (v), "a" (c), "c" (n)
                 : "cc", "memory");
    return v;
}
  101c5d:	89 f8                	mov    %edi,%eax
  101c5f:	5b                   	pop    %ebx
  101c60:	5f                   	pop    %edi
  101c61:	c3                   	ret    
memset(void *v, int c, size_t n)
{
    if (n == 0)
        return v;
    if ((int)v%4 == 0 && n%4 == 0) {
        c &= 0xFF;
  101c62:	0f b6 44 24 10       	movzbl 0x10(%esp),%eax
        c = (c<<24)|(c<<16)|(c<<8)|c;
  101c67:	89 c2                	mov    %eax,%edx
  101c69:	c1 e2 18             	shl    $0x18,%edx
  101c6c:	89 c3                	mov    %eax,%ebx
  101c6e:	c1 e3 10             	shl    $0x10,%ebx
  101c71:	09 da                	or     %ebx,%edx
  101c73:	89 c3                	mov    %eax,%ebx
  101c75:	c1 e3 08             	shl    $0x8,%ebx
  101c78:	09 da                	or     %ebx,%edx
  101c7a:	09 d0                	or     %edx,%eax
        asm volatile("cld; rep stosl\n"
                 :: "D" (v), "a" (c), "c" (n/4)
  101c7c:	c1 e9 02             	shr    $0x2,%ecx
    if (n == 0)
        return v;
    if ((int)v%4 == 0 && n%4 == 0) {
        c &= 0xFF;
        c = (c<<24)|(c<<16)|(c<<8)|c;
        asm volatile("cld; rep stosl\n"
  101c7f:	fc                   	cld    
  101c80:	f3 ab                	rep stos %eax,%es:(%edi)
  101c82:	eb d9                	jmp    101c5d <memset+0x22>

00101c84 <memmove>:
    return v;
}

void *
memmove(void *dst, const void *src, size_t n)
{
  101c84:	57                   	push   %edi
  101c85:	56                   	push   %esi
  101c86:	8b 44 24 0c          	mov    0xc(%esp),%eax
  101c8a:	8b 74 24 10          	mov    0x10(%esp),%esi
  101c8e:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
  101c92:	39 c6                	cmp    %eax,%esi
  101c94:	73 36                	jae    101ccc <memmove+0x48>
  101c96:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  101c99:	39 d0                	cmp    %edx,%eax
  101c9b:	73 2f                	jae    101ccc <memmove+0x48>
        s += n;
        d += n;
  101c9d:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
  101ca0:	f6 c2 03             	test   $0x3,%dl
  101ca3:	75 1b                	jne    101cc0 <memmove+0x3c>
  101ca5:	f7 c7 03 00 00 00    	test   $0x3,%edi
  101cab:	75 13                	jne    101cc0 <memmove+0x3c>
  101cad:	f6 c1 03             	test   $0x3,%cl
  101cb0:	75 0e                	jne    101cc0 <memmove+0x3c>
            asm volatile("std; rep movsl\n"
                     :: "D" (d-4), "S" (s-4), "c" (n/4)
  101cb2:	83 ef 04             	sub    $0x4,%edi
  101cb5:	8d 72 fc             	lea    -0x4(%edx),%esi
  101cb8:	c1 e9 02             	shr    $0x2,%ecx
    d = dst;
    if (s < d && s + n > d) {
        s += n;
        d += n;
        if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
            asm volatile("std; rep movsl\n"
  101cbb:	fd                   	std    
  101cbc:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101cbe:	eb 09                	jmp    101cc9 <memmove+0x45>
                     :: "D" (d-4), "S" (s-4), "c" (n/4)
                     : "cc", "memory");
        else
            asm volatile("std; rep movsb\n"
                     :: "D" (d-1), "S" (s-1), "c" (n)
  101cc0:	83 ef 01             	sub    $0x1,%edi
  101cc3:	8d 72 ff             	lea    -0x1(%edx),%esi
        if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
            asm volatile("std; rep movsl\n"
                     :: "D" (d-4), "S" (s-4), "c" (n/4)
                     : "cc", "memory");
        else
            asm volatile("std; rep movsb\n"
  101cc6:	fd                   	std    
  101cc7:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                     :: "D" (d-1), "S" (s-1), "c" (n)
                     : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile("cld" ::: "cc");
  101cc9:	fc                   	cld    
  101cca:	eb 16                	jmp    101ce2 <memmove+0x5e>
    } else {
        if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
  101ccc:	f7 c6 03 00 00 00    	test   $0x3,%esi
  101cd2:	75 09                	jne    101cdd <memmove+0x59>
  101cd4:	a8 03                	test   $0x3,%al
  101cd6:	75 05                	jne    101cdd <memmove+0x59>
  101cd8:	f6 c1 03             	test   $0x3,%cl
  101cdb:	74 08                	je     101ce5 <memmove+0x61>
            asm volatile("cld; rep movsl\n"
                     :: "D" (d), "S" (s), "c" (n/4)
                     : "cc", "memory");
        else
            asm volatile("cld; rep movsb\n"
  101cdd:	89 c7                	mov    %eax,%edi
  101cdf:	fc                   	cld    
  101ce0:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                     :: "D" (d), "S" (s), "c" (n)
                     : "cc", "memory");
    }
    return dst;
}
  101ce2:	5e                   	pop    %esi
  101ce3:	5f                   	pop    %edi
  101ce4:	c3                   	ret    
        // Some versions of GCC rely on DF being clear
        asm volatile("cld" ::: "cc");
    } else {
        if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
            asm volatile("cld; rep movsl\n"
                     :: "D" (d), "S" (s), "c" (n/4)
  101ce5:	c1 e9 02             	shr    $0x2,%ecx
                     : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile("cld" ::: "cc");
    } else {
        if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
            asm volatile("cld; rep movsl\n"
  101ce8:	89 c7                	mov    %eax,%edi
  101cea:	fc                   	cld    
  101ceb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101ced:	eb f3                	jmp    101ce2 <memmove+0x5e>

00101cef <memcpy>:
}

void *
memcpy(void *dst, const void *src, size_t n)
{
	return memmove(dst, src, n);
  101cef:	ff 74 24 0c          	pushl  0xc(%esp)
  101cf3:	ff 74 24 0c          	pushl  0xc(%esp)
  101cf7:	ff 74 24 0c          	pushl  0xc(%esp)
  101cfb:	e8 84 ff ff ff       	call   101c84 <memmove>
  101d00:	83 c4 0c             	add    $0xc,%esp
}
  101d03:	c3                   	ret    

00101d04 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
  101d04:	53                   	push   %ebx
  101d05:	8b 54 24 08          	mov    0x8(%esp),%edx
  101d09:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  101d0d:	8b 44 24 10          	mov    0x10(%esp),%eax
	while (n > 0 && *p && *p == *q)
  101d11:	eb 09                	jmp    101d1c <strncmp+0x18>
		n--, p++, q++;
  101d13:	83 e8 01             	sub    $0x1,%eax
  101d16:	83 c2 01             	add    $0x1,%edx
  101d19:	83 c1 01             	add    $0x1,%ecx
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
  101d1c:	85 c0                	test   %eax,%eax
  101d1e:	74 0b                	je     101d2b <strncmp+0x27>
  101d20:	0f b6 1a             	movzbl (%edx),%ebx
  101d23:	84 db                	test   %bl,%bl
  101d25:	74 04                	je     101d2b <strncmp+0x27>
  101d27:	3a 19                	cmp    (%ecx),%bl
  101d29:	74 e8                	je     101d13 <strncmp+0xf>
		n--, p++, q++;
	if (n == 0)
  101d2b:	85 c0                	test   %eax,%eax
  101d2d:	74 0a                	je     101d39 <strncmp+0x35>
		return 0;
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
  101d2f:	0f b6 02             	movzbl (%edx),%eax
  101d32:	0f b6 11             	movzbl (%ecx),%edx
  101d35:	29 d0                	sub    %edx,%eax
}
  101d37:	5b                   	pop    %ebx
  101d38:	c3                   	ret    
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
		n--, p++, q++;
	if (n == 0)
		return 0;
  101d39:	b8 00 00 00 00       	mov    $0x0,%eax
  101d3e:	eb f7                	jmp    101d37 <strncmp+0x33>

00101d40 <strnlen>:
		return (int) ((unsigned char) *p - (unsigned char) *q);
}

int
strnlen(const char *s, size_t size)
{
  101d40:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  101d44:	8b 54 24 08          	mov    0x8(%esp),%edx
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  101d48:	b8 00 00 00 00       	mov    $0x0,%eax
  101d4d:	eb 09                	jmp    101d58 <strnlen+0x18>
		n++;
  101d4f:	83 c0 01             	add    $0x1,%eax
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  101d52:	83 c1 01             	add    $0x1,%ecx
  101d55:	83 ea 01             	sub    $0x1,%edx
  101d58:	85 d2                	test   %edx,%edx
  101d5a:	74 05                	je     101d61 <strnlen+0x21>
  101d5c:	80 39 00             	cmpb   $0x0,(%ecx)
  101d5f:	75 ee                	jne    101d4f <strnlen+0xf>
		n++;
	return n;
}
  101d61:	f3 c3                	repz ret 

00101d63 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  101d63:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  101d67:	8b 54 24 08          	mov    0x8(%esp),%edx
  while (*p && *p == *q)
  101d6b:	eb 06                	jmp    101d73 <strcmp+0x10>
    p++, q++;
  101d6d:	83 c1 01             	add    $0x1,%ecx
  101d70:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while (*p && *p == *q)
  101d73:	0f b6 01             	movzbl (%ecx),%eax
  101d76:	84 c0                	test   %al,%al
  101d78:	74 04                	je     101d7e <strcmp+0x1b>
  101d7a:	3a 02                	cmp    (%edx),%al
  101d7c:	74 ef                	je     101d6d <strcmp+0xa>
    p++, q++;
  return (int) ((unsigned char) *p - (unsigned char) *q);
  101d7e:	0f b6 c0             	movzbl %al,%eax
  101d81:	0f b6 12             	movzbl (%edx),%edx
  101d84:	29 d0                	sub    %edx,%eax
}
  101d86:	c3                   	ret    

00101d87 <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
  101d87:	8b 44 24 04          	mov    0x4(%esp),%eax
  101d8b:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
  for (; *s; s++)
  101d90:	0f b6 10             	movzbl (%eax),%edx
  101d93:	84 d2                	test   %dl,%dl
  101d95:	74 09                	je     101da0 <strchr+0x19>
    if (*s == c)
  101d97:	38 ca                	cmp    %cl,%dl
  101d99:	74 0a                	je     101da5 <strchr+0x1e>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
  for (; *s; s++)
  101d9b:	83 c0 01             	add    $0x1,%eax
  101d9e:	eb f0                	jmp    101d90 <strchr+0x9>
    if (*s == c)
      return (char *) s;
  return 0;
  101da0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101da5:	f3 c3                	repz ret 

00101da7 <memzero>:

void *
memzero(void *v, size_t n)
{
	return memset(v, 0, n);
  101da7:	ff 74 24 08          	pushl  0x8(%esp)
  101dab:	6a 00                	push   $0x0
  101dad:	ff 74 24 0c          	pushl  0xc(%esp)
  101db1:	e8 85 fe ff ff       	call   101c3b <memset>
  101db6:	83 c4 0c             	add    $0xc,%esp
}
  101db9:	c3                   	ret    

00101dba <debug_trace>:

#define DEBUG_TRACEFRAMES	10

static void
debug_trace(uintptr_t ebp, uintptr_t *eips)
{
  101dba:	56                   	push   %esi
  101dbb:	53                   	push   %ebx
  101dbc:	89 d6                	mov    %edx,%esi
	int i;
	uintptr_t *frame = (uintptr_t *) ebp;

	for (i = 0; i < DEBUG_TRACEFRAMES && frame; i++) {
  101dbe:	b9 00 00 00 00       	mov    $0x0,%ecx
  101dc3:	eb 0b                	jmp    101dd0 <debug_trace+0x16>
		eips[i] = frame[1];		/* saved %eip */
  101dc5:	8b 50 04             	mov    0x4(%eax),%edx
  101dc8:	89 14 8e             	mov    %edx,(%esi,%ecx,4)
		frame = (uintptr_t *) frame[0];	/* saved %ebp */
  101dcb:	8b 00                	mov    (%eax),%eax
debug_trace(uintptr_t ebp, uintptr_t *eips)
{
	int i;
	uintptr_t *frame = (uintptr_t *) ebp;

	for (i = 0; i < DEBUG_TRACEFRAMES && frame; i++) {
  101dcd:	83 c1 01             	add    $0x1,%ecx
  101dd0:	83 f9 09             	cmp    $0x9,%ecx
  101dd3:	0f 9e c3             	setle  %bl
  101dd6:	85 c0                	test   %eax,%eax
  101dd8:	0f 95 c2             	setne  %dl
  101ddb:	84 da                	test   %bl,%dl
  101ddd:	75 e6                	jne    101dc5 <debug_trace+0xb>
  101ddf:	eb 0a                	jmp    101deb <debug_trace+0x31>
		eips[i] = frame[1];		/* saved %eip */
		frame = (uintptr_t *) frame[0];	/* saved %ebp */
	}
	for (; i < DEBUG_TRACEFRAMES; i++)
		eips[i] = 0;
  101de1:	c7 04 8e 00 00 00 00 	movl   $0x0,(%esi,%ecx,4)

	for (i = 0; i < DEBUG_TRACEFRAMES && frame; i++) {
		eips[i] = frame[1];		/* saved %eip */
		frame = (uintptr_t *) frame[0];	/* saved %ebp */
	}
	for (; i < DEBUG_TRACEFRAMES; i++)
  101de8:	83 c1 01             	add    $0x1,%ecx
  101deb:	83 f9 09             	cmp    $0x9,%ecx
  101dee:	7e f1                	jle    101de1 <debug_trace+0x27>
		eips[i] = 0;
}
  101df0:	5b                   	pop    %ebx
  101df1:	5e                   	pop    %esi
  101df2:	c3                   	ret    

00101df3 <debug_info>:

#include <lib/types.h>

void
debug_info(const char *fmt, ...)
{
  101df3:	83 ec 0c             	sub    $0xc,%esp
#ifdef DEBUG_MSG
	va_list ap;
	va_start(ap, fmt);
  101df6:	8d 44 24 14          	lea    0x14(%esp),%eax
	vdprintf(fmt, ap);
  101dfa:	83 ec 08             	sub    $0x8,%esp
  101dfd:	50                   	push   %eax
  101dfe:	ff 74 24 1c          	pushl  0x1c(%esp)
  101e02:	e8 33 01 00 00       	call   101f3a <vdprintf>
	va_end(ap);
#endif
}
  101e07:	83 c4 1c             	add    $0x1c,%esp
  101e0a:	c3                   	ret    

00101e0b <debug_normal>:

#ifdef DEBUG_MSG

void
debug_normal(const char *file, int line, const char *fmt, ...)
{
  101e0b:	83 ec 10             	sub    $0x10,%esp
	dprintf("[D] %s:%d: ", file, line);
  101e0e:	ff 74 24 18          	pushl  0x18(%esp)
  101e12:	ff 74 24 18          	pushl  0x18(%esp)
  101e16:	68 82 4f 10 00       	push   $0x104f82
  101e1b:	e8 6a 01 00 00       	call   101f8a <dprintf>

	va_list ap;
	va_start(ap, fmt);
  101e20:	8d 44 24 2c          	lea    0x2c(%esp),%eax
	vdprintf(fmt, ap);
  101e24:	83 c4 08             	add    $0x8,%esp
  101e27:	50                   	push   %eax
  101e28:	ff 74 24 24          	pushl  0x24(%esp)
  101e2c:	e8 09 01 00 00       	call   101f3a <vdprintf>
	va_end(ap);
}
  101e31:	83 c4 1c             	add    $0x1c,%esp
  101e34:	c3                   	ret    

00101e35 <debug_panic>:
		eips[i] = 0;
}

gcc_noinline void
debug_panic(const char *file, int line, const char *fmt,...)
{
  101e35:	53                   	push   %ebx
  101e36:	83 ec 3c             	sub    $0x3c,%esp
	int i;
	uintptr_t eips[DEBUG_TRACEFRAMES];
	va_list ap;

	dprintf("[P] %s:%d: ", file, line);
  101e39:	ff 74 24 48          	pushl  0x48(%esp)
  101e3d:	ff 74 24 48          	pushl  0x48(%esp)
  101e41:	68 8e 4f 10 00       	push   $0x104f8e
  101e46:	e8 3f 01 00 00       	call   101f8a <dprintf>

	va_start(ap, fmt);
  101e4b:	8d 44 24 5c          	lea    0x5c(%esp),%eax
	vdprintf(fmt, ap);
  101e4f:	83 c4 08             	add    $0x8,%esp
  101e52:	50                   	push   %eax
  101e53:	ff 74 24 54          	pushl  0x54(%esp)
  101e57:	e8 de 00 00 00       	call   101f3a <vdprintf>

static inline uint32_t __attribute__((always_inline))
read_ebp(void)
{
	uint32_t ebp;
	__asm __volatile("movl %%ebp,%0" : "=rm" (ebp));
  101e5c:	89 e8                	mov    %ebp,%eax
	va_end(ap);

	debug_trace(read_ebp(), eips);
  101e5e:	8d 54 24 18          	lea    0x18(%esp),%edx
  101e62:	e8 53 ff ff ff       	call   101dba <debug_trace>
	for (i = 0; i < DEBUG_TRACEFRAMES && eips[i] != 0; i++)
  101e67:	83 c4 10             	add    $0x10,%esp
  101e6a:	bb 00 00 00 00       	mov    $0x0,%ebx
  101e6f:	eb 14                	jmp    101e85 <debug_panic+0x50>
		dprintf("\tfrom 0x%08x\n", eips[i]);
  101e71:	83 ec 08             	sub    $0x8,%esp
  101e74:	50                   	push   %eax
  101e75:	68 9a 4f 10 00       	push   $0x104f9a
  101e7a:	e8 0b 01 00 00       	call   101f8a <dprintf>
	va_start(ap, fmt);
	vdprintf(fmt, ap);
	va_end(ap);

	debug_trace(read_ebp(), eips);
	for (i = 0; i < DEBUG_TRACEFRAMES && eips[i] != 0; i++)
  101e7f:	83 c3 01             	add    $0x1,%ebx
  101e82:	83 c4 10             	add    $0x10,%esp
  101e85:	83 fb 09             	cmp    $0x9,%ebx
  101e88:	7f 08                	jg     101e92 <debug_panic+0x5d>
  101e8a:	8b 44 9c 08          	mov    0x8(%esp,%ebx,4),%eax
  101e8e:	85 c0                	test   %eax,%eax
  101e90:	75 df                	jne    101e71 <debug_panic+0x3c>
		dprintf("\tfrom 0x%08x\n", eips[i]);

	dprintf("Kernel Panic !!!\n");
  101e92:	83 ec 0c             	sub    $0xc,%esp
  101e95:	68 a8 4f 10 00       	push   $0x104fa8
  101e9a:	e8 eb 00 00 00       	call   101f8a <dprintf>

	//intr_local_disable();
	halt();
  101e9f:	e8 84 08 00 00       	call   102728 <halt>
}
  101ea4:	83 c4 48             	add    $0x48,%esp
  101ea7:	5b                   	pop    %ebx
  101ea8:	c3                   	ret    

00101ea9 <debug_warn>:

void
debug_warn(const char *file, int line, const char *fmt,...)
{
  101ea9:	83 ec 10             	sub    $0x10,%esp
	dprintf("[W] %s:%d: ", file, line);
  101eac:	ff 74 24 18          	pushl  0x18(%esp)
  101eb0:	ff 74 24 18          	pushl  0x18(%esp)
  101eb4:	68 ba 4f 10 00       	push   $0x104fba
  101eb9:	e8 cc 00 00 00       	call   101f8a <dprintf>

	va_list ap;
	va_start(ap, fmt);
  101ebe:	8d 44 24 2c          	lea    0x2c(%esp),%eax
	vdprintf(fmt, ap);
  101ec2:	83 c4 08             	add    $0x8,%esp
  101ec5:	50                   	push   %eax
  101ec6:	ff 74 24 24          	pushl  0x24(%esp)
  101eca:	e8 6b 00 00 00       	call   101f3a <vdprintf>
	va_end(ap);
}
  101ecf:	83 c4 1c             	add    $0x1c,%esp
  101ed2:	c3                   	ret    

00101ed3 <cputs>:
    char buf[CONSOLE_BUFFER_SIZE];
};

static void
cputs (const char *str)
{
  101ed3:	53                   	push   %ebx
  101ed4:	83 ec 08             	sub    $0x8,%esp
  101ed7:	89 c3                	mov    %eax,%ebx
    while (*str)
  101ed9:	eb 12                	jmp    101eed <cputs+0x1a>
    {
        cons_putc (*str);
  101edb:	83 ec 0c             	sub    $0xc,%esp
  101ede:	0f be c0             	movsbl %al,%eax
  101ee1:	50                   	push   %eax
  101ee2:	e8 ab e4 ff ff       	call   100392 <cons_putc>
        str += 1;
  101ee7:	83 c3 01             	add    $0x1,%ebx
  101eea:	83 c4 10             	add    $0x10,%esp
};

static void
cputs (const char *str)
{
    while (*str)
  101eed:	0f b6 03             	movzbl (%ebx),%eax
  101ef0:	84 c0                	test   %al,%al
  101ef2:	75 e7                	jne    101edb <cputs+0x8>
    {
        cons_putc (*str);
        str += 1;
    }
}
  101ef4:	83 c4 08             	add    $0x8,%esp
  101ef7:	5b                   	pop    %ebx
  101ef8:	c3                   	ret    

00101ef9 <putch>:

static void
putch (int ch, struct dprintbuf *b)
{
  101ef9:	53                   	push   %ebx
  101efa:	83 ec 08             	sub    $0x8,%esp
  101efd:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    b->buf[b->idx++] = ch;
  101f01:	8b 13                	mov    (%ebx),%edx
  101f03:	8d 42 01             	lea    0x1(%edx),%eax
  101f06:	89 03                	mov    %eax,(%ebx)
  101f08:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  101f0c:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
    if (b->idx == CONSOLE_BUFFER_SIZE - 1)
  101f10:	3d ff 01 00 00       	cmp    $0x1ff,%eax
  101f15:	74 0e                	je     101f25 <putch+0x2c>
    {
        b->buf[b->idx] = 0;
        cputs (b->buf);
        b->idx = 0;
    }
    b->cnt++;
  101f17:	8b 43 04             	mov    0x4(%ebx),%eax
  101f1a:	83 c0 01             	add    $0x1,%eax
  101f1d:	89 43 04             	mov    %eax,0x4(%ebx)
}
  101f20:	83 c4 08             	add    $0x8,%esp
  101f23:	5b                   	pop    %ebx
  101f24:	c3                   	ret    
putch (int ch, struct dprintbuf *b)
{
    b->buf[b->idx++] = ch;
    if (b->idx == CONSOLE_BUFFER_SIZE - 1)
    {
        b->buf[b->idx] = 0;
  101f25:	c6 44 13 09 00       	movb   $0x0,0x9(%ebx,%edx,1)
        cputs (b->buf);
  101f2a:	8d 43 08             	lea    0x8(%ebx),%eax
  101f2d:	e8 a1 ff ff ff       	call   101ed3 <cputs>
        b->idx = 0;
  101f32:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  101f38:	eb dd                	jmp    101f17 <putch+0x1e>

00101f3a <vdprintf>:
    b->cnt++;
}

int
vdprintf (const char *fmt, va_list ap)
{
  101f3a:	81 ec 1c 02 00 00    	sub    $0x21c,%esp
    struct dprintbuf b;

    b.idx = 0;
  101f40:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  101f47:	00 
    b.cnt = 0;
  101f48:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  101f4f:	00 
    vprintfmt ((void*) putch, &b, fmt, ap);
  101f50:	ff b4 24 24 02 00 00 	pushl  0x224(%esp)
  101f57:	ff b4 24 24 02 00 00 	pushl  0x224(%esp)
  101f5e:	8d 44 24 10          	lea    0x10(%esp),%eax
  101f62:	50                   	push   %eax
  101f63:	68 f9 1e 10 00       	push   $0x101ef9
  101f68:	e8 4b 01 00 00       	call   1020b8 <vprintfmt>

    b.buf[b.idx] = 0;
  101f6d:	8b 44 24 18          	mov    0x18(%esp),%eax
  101f71:	c6 44 04 20 00       	movb   $0x0,0x20(%esp,%eax,1)
    cputs (b.buf);
  101f76:	8d 44 24 20          	lea    0x20(%esp),%eax
  101f7a:	e8 54 ff ff ff       	call   101ed3 <cputs>

    return b.cnt;
}
  101f7f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  101f83:	81 c4 2c 02 00 00    	add    $0x22c,%esp
  101f89:	c3                   	ret    

00101f8a <dprintf>:

int
dprintf (const char *fmt, ...)
{
  101f8a:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
  101f8d:	8d 44 24 14          	lea    0x14(%esp),%eax
    cnt = vdprintf (fmt, ap);
  101f91:	83 ec 08             	sub    $0x8,%esp
  101f94:	50                   	push   %eax
  101f95:	ff 74 24 1c          	pushl  0x1c(%esp)
  101f99:	e8 9c ff ff ff       	call   101f3a <vdprintf>
    va_end(ap);

    return cnt;
}
  101f9e:	83 c4 1c             	add    $0x1c,%esp
  101fa1:	c3                   	ret    

00101fa2 <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(putch_t putch, void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
  101fa2:	55                   	push   %ebp
  101fa3:	57                   	push   %edi
  101fa4:	56                   	push   %esi
  101fa5:	53                   	push   %ebx
  101fa6:	83 ec 1c             	sub    $0x1c,%esp
  101fa9:	89 c6                	mov    %eax,%esi
  101fab:	89 d7                	mov    %edx,%edi
  101fad:	8b 44 24 30          	mov    0x30(%esp),%eax
  101fb1:	8b 54 24 34          	mov    0x34(%esp),%edx
  101fb5:	89 44 24 08          	mov    %eax,0x8(%esp)
  101fb9:	89 54 24 0c          	mov    %edx,0xc(%esp)
  101fbd:	8b 6c 24 40          	mov    0x40(%esp),%ebp
	/* first recursively print all preceding (more significant) digits */
	if (num >= base) {
  101fc1:	8b 4c 24 38          	mov    0x38(%esp),%ecx
  101fc5:	bb 00 00 00 00       	mov    $0x0,%ebx
  101fca:	89 0c 24             	mov    %ecx,(%esp)
  101fcd:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  101fd1:	39 d3                	cmp    %edx,%ebx
  101fd3:	72 06                	jb     101fdb <printnum+0x39>
  101fd5:	39 44 24 38          	cmp    %eax,0x38(%esp)
  101fd9:	77 77                	ja     102052 <printnum+0xb0>
		printnum(putch, putdat, num / base, base, width - 1, padc);
  101fdb:	83 ec 0c             	sub    $0xc,%esp
  101fde:	55                   	push   %ebp
  101fdf:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  101fe3:	8d 58 ff             	lea    -0x1(%eax),%ebx
  101fe6:	53                   	push   %ebx
  101fe7:	ff 74 24 4c          	pushl  0x4c(%esp)
  101feb:	83 ec 08             	sub    $0x8,%esp
  101fee:	ff 74 24 24          	pushl  0x24(%esp)
  101ff2:	ff 74 24 24          	pushl  0x24(%esp)
  101ff6:	ff 74 24 34          	pushl  0x34(%esp)
  101ffa:	ff 74 24 34          	pushl  0x34(%esp)
  101ffe:	e8 0d 29 00 00       	call   104910 <__udivdi3>
  102003:	83 c4 18             	add    $0x18,%esp
  102006:	52                   	push   %edx
  102007:	50                   	push   %eax
  102008:	89 fa                	mov    %edi,%edx
  10200a:	89 f0                	mov    %esi,%eax
  10200c:	e8 91 ff ff ff       	call   101fa2 <printnum>
  102011:	83 c4 20             	add    $0x20,%esp
  102014:	eb 11                	jmp    102027 <printnum+0x85>
	} else {
		/* print any needed pad characters before first digit */
		while (--width > 0)
			putch(padc, putdat);
  102016:	83 ec 08             	sub    $0x8,%esp
  102019:	57                   	push   %edi
  10201a:	55                   	push   %ebp
  10201b:	ff d6                	call   *%esi
  10201d:	83 c4 10             	add    $0x10,%esp
	/* first recursively print all preceding (more significant) digits */
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		/* print any needed pad characters before first digit */
		while (--width > 0)
  102020:	83 eb 01             	sub    $0x1,%ebx
  102023:	85 db                	test   %ebx,%ebx
  102025:	7f ef                	jg     102016 <printnum+0x74>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
  102027:	ff 74 24 04          	pushl  0x4(%esp)
  10202b:	ff 74 24 04          	pushl  0x4(%esp)
  10202f:	ff 74 24 14          	pushl  0x14(%esp)
  102033:	ff 74 24 14          	pushl  0x14(%esp)
  102037:	e8 04 2a 00 00       	call   104a40 <__umoddi3>
  10203c:	83 c4 08             	add    $0x8,%esp
  10203f:	57                   	push   %edi
  102040:	0f be 80 c6 4f 10 00 	movsbl 0x104fc6(%eax),%eax
  102047:	50                   	push   %eax
  102048:	ff d6                	call   *%esi
}
  10204a:	83 c4 2c             	add    $0x2c,%esp
  10204d:	5b                   	pop    %ebx
  10204e:	5e                   	pop    %esi
  10204f:	5f                   	pop    %edi
  102050:	5d                   	pop    %ebp
  102051:	c3                   	ret    
  102052:	8b 5c 24 3c          	mov    0x3c(%esp),%ebx
  102056:	eb c8                	jmp    102020 <printnum+0x7e>

00102058 <getuint>:
 * depending on the lflag parameter.
 */
static unsigned long long
getuint(va_list *ap, int lflag)
{
	if (lflag >= 2)
  102058:	83 fa 01             	cmp    $0x1,%edx
  10205b:	7f 13                	jg     102070 <getuint+0x18>
		return va_arg(*ap, unsigned long long);
	else if (lflag)
  10205d:	85 d2                	test   %edx,%edx
  10205f:	75 1c                	jne    10207d <getuint+0x25>
		return va_arg(*ap, unsigned long);
	else
		return va_arg(*ap, unsigned int);
  102061:	8b 10                	mov    (%eax),%edx
  102063:	8d 4a 04             	lea    0x4(%edx),%ecx
  102066:	89 08                	mov    %ecx,(%eax)
  102068:	8b 02                	mov    (%edx),%eax
  10206a:	ba 00 00 00 00       	mov    $0x0,%edx
}
  10206f:	c3                   	ret    
 */
static unsigned long long
getuint(va_list *ap, int lflag)
{
	if (lflag >= 2)
		return va_arg(*ap, unsigned long long);
  102070:	8b 10                	mov    (%eax),%edx
  102072:	8d 4a 08             	lea    0x8(%edx),%ecx
  102075:	89 08                	mov    %ecx,(%eax)
  102077:	8b 02                	mov    (%edx),%eax
  102079:	8b 52 04             	mov    0x4(%edx),%edx
  10207c:	c3                   	ret    
	else if (lflag)
		return va_arg(*ap, unsigned long);
  10207d:	8b 10                	mov    (%eax),%edx
  10207f:	8d 4a 04             	lea    0x4(%edx),%ecx
  102082:	89 08                	mov    %ecx,(%eax)
  102084:	8b 02                	mov    (%edx),%eax
  102086:	ba 00 00 00 00       	mov    $0x0,%edx
  10208b:	c3                   	ret    

0010208c <getint>:
 * because of sign extension
 */
static long long
getint(va_list *ap, int lflag)
{
	if (lflag >= 2)
  10208c:	83 fa 01             	cmp    $0x1,%edx
  10208f:	7f 0f                	jg     1020a0 <getint+0x14>
		return va_arg(*ap, long long);
	else if (lflag)
  102091:	85 d2                	test   %edx,%edx
  102093:	75 18                	jne    1020ad <getint+0x21>
		return va_arg(*ap, long);
	else
		return va_arg(*ap, int);
  102095:	8b 10                	mov    (%eax),%edx
  102097:	8d 4a 04             	lea    0x4(%edx),%ecx
  10209a:	89 08                	mov    %ecx,(%eax)
  10209c:	8b 02                	mov    (%edx),%eax
  10209e:	99                   	cltd   
}
  10209f:	c3                   	ret    
 */
static long long
getint(va_list *ap, int lflag)
{
	if (lflag >= 2)
		return va_arg(*ap, long long);
  1020a0:	8b 10                	mov    (%eax),%edx
  1020a2:	8d 4a 08             	lea    0x8(%edx),%ecx
  1020a5:	89 08                	mov    %ecx,(%eax)
  1020a7:	8b 02                	mov    (%edx),%eax
  1020a9:	8b 52 04             	mov    0x4(%edx),%edx
  1020ac:	c3                   	ret    
	else if (lflag)
		return va_arg(*ap, long);
  1020ad:	8b 10                	mov    (%eax),%edx
  1020af:	8d 4a 04             	lea    0x4(%edx),%ecx
  1020b2:	89 08                	mov    %ecx,(%eax)
  1020b4:	8b 02                	mov    (%edx),%eax
  1020b6:	99                   	cltd   
  1020b7:	c3                   	ret    

001020b8 <vprintfmt>:
		return va_arg(*ap, int);
}

void
vprintfmt(putch_t putch, void *putdat, const char *fmt, va_list ap)
{
  1020b8:	55                   	push   %ebp
  1020b9:	57                   	push   %edi
  1020ba:	56                   	push   %esi
  1020bb:	53                   	push   %ebx
  1020bc:	83 ec 2c             	sub    $0x2c,%esp
  1020bf:	8b 5c 24 40          	mov    0x40(%esp),%ebx
  1020c3:	8b 74 24 44          	mov    0x44(%esp),%esi
  1020c7:	8b 6c 24 48          	mov    0x48(%esp),%ebp
  1020cb:	89 f7                	mov    %esi,%edi
  1020cd:	89 de                	mov    %ebx,%esi
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
  1020cf:	8d 5d 01             	lea    0x1(%ebp),%ebx
  1020d2:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
  1020d6:	83 f8 25             	cmp    $0x25,%eax
  1020d9:	74 16                	je     1020f1 <vprintfmt+0x39>
			if (ch == '\0')
  1020db:	85 c0                	test   %eax,%eax
  1020dd:	0f 84 ea 02 00 00    	je     1023cd <vprintfmt+0x315>
				return;
			putch(ch, putdat);
  1020e3:	83 ec 08             	sub    $0x8,%esp
  1020e6:	57                   	push   %edi
  1020e7:	50                   	push   %eax
  1020e8:	ff d6                	call   *%esi
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
  1020ea:	83 c4 10             	add    $0x10,%esp
  1020ed:	89 dd                	mov    %ebx,%ebp
  1020ef:	eb de                	jmp    1020cf <vprintfmt+0x17>
  1020f1:	c6 44 24 17 20       	movb   $0x20,0x17(%esp)
  1020f6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  1020fd:	00 
  1020fe:	c7 44 24 18 ff ff ff 	movl   $0xffffffff,0x18(%esp)
  102105:	ff 
  102106:	c7 44 24 10 ff ff ff 	movl   $0xffffffff,0x10(%esp)
  10210d:	ff 
  10210e:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  102115:	00 
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
  102116:	8d 6b 01             	lea    0x1(%ebx),%ebp
  102119:	0f b6 13             	movzbl (%ebx),%edx
  10211c:	0f b6 c2             	movzbl %dl,%eax
  10211f:	83 ea 23             	sub    $0x23,%edx
  102122:	80 fa 55             	cmp    $0x55,%dl
  102125:	0f 87 86 02 00 00    	ja     1023b1 <vprintfmt+0x2f9>
  10212b:	0f b6 d2             	movzbl %dl,%edx
  10212e:	ff 24 95 e0 4f 10 00 	jmp    *0x104fe0(,%edx,4)
  102135:	89 eb                	mov    %ebp,%ebx

			// flag to pad on the right
		case '-':
			padc = '-';
  102137:	c6 44 24 17 2d       	movb   $0x2d,0x17(%esp)
  10213c:	eb d8                	jmp    102116 <vprintfmt+0x5e>
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
  10213e:	89 eb                	mov    %ebp,%ebx
			padc = '-';
			goto reswitch;

			// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
  102140:	c6 44 24 17 30       	movb   $0x30,0x17(%esp)
  102145:	eb cf                	jmp    102116 <vprintfmt+0x5e>
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
  102147:	89 eb                	mov    %ebp,%ebx
			precision = va_arg(ap, int);
			goto process_precision;

		case '.':
			if (width < 0)
				width = 0;
  102149:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  102150:	00 
  102151:	eb c3                	jmp    102116 <vprintfmt+0x5e>
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
  102153:	b9 00 00 00 00       	mov    $0x0,%ecx
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
				precision = precision * 10 + ch - '0';
  102158:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  10215b:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
  10215e:	8d 4c 10 d0          	lea    -0x30(%eax,%edx,1),%ecx
				ch = *fmt;
  102162:	0f be 45 00          	movsbl 0x0(%ebp),%eax
				if (ch < '0' || ch > '9')
  102166:	8d 50 d0             	lea    -0x30(%eax),%edx
  102169:	83 fa 09             	cmp    $0x9,%edx
  10216c:	77 51                	ja     1021bf <vprintfmt+0x107>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
  10216e:	83 c5 01             	add    $0x1,%ebp
				precision = precision * 10 + ch - '0';
  102171:	eb e5                	jmp    102158 <vprintfmt+0xa0>
					break;
			}
			goto process_precision;

		case '*':
			precision = va_arg(ap, int);
  102173:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  102177:	8d 50 04             	lea    0x4(%eax),%edx
  10217a:	89 54 24 4c          	mov    %edx,0x4c(%esp)
  10217e:	8b 00                	mov    (%eax),%eax
  102180:	89 44 24 18          	mov    %eax,0x18(%esp)
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
  102184:	89 eb                	mov    %ebp,%ebx
		case '#':
			altflag = 1;
			goto reswitch;

		process_precision:
			if (width < 0)
  102186:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  10218b:	79 89                	jns    102116 <vprintfmt+0x5e>
				width = precision, precision = -1;
  10218d:	8b 44 24 18          	mov    0x18(%esp),%eax
  102191:	89 44 24 10          	mov    %eax,0x10(%esp)
  102195:	c7 44 24 18 ff ff ff 	movl   $0xffffffff,0x18(%esp)
  10219c:	ff 
  10219d:	e9 74 ff ff ff       	jmp    102116 <vprintfmt+0x5e>
		case '*':
			precision = va_arg(ap, int);
			goto process_precision;

		case '.':
			if (width < 0)
  1021a2:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  1021a7:	78 9e                	js     102147 <vprintfmt+0x8f>
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
  1021a9:	89 eb                	mov    %ebp,%ebx
  1021ab:	e9 66 ff ff ff       	jmp    102116 <vprintfmt+0x5e>
  1021b0:	89 eb                	mov    %ebp,%ebx
			if (width < 0)
				width = 0;
			goto reswitch;

		case '#':
			altflag = 1;
  1021b2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  1021b9:	00 
			goto reswitch;
  1021ba:	e9 57 ff ff ff       	jmp    102116 <vprintfmt+0x5e>
  1021bf:	89 4c 24 18          	mov    %ecx,0x18(%esp)
  1021c3:	89 eb                	mov    %ebp,%ebx
  1021c5:	eb bf                	jmp    102186 <vprintfmt+0xce>
				width = precision, precision = -1;
			goto reswitch;

			// long flag (doubled for long long)
		case 'l':
			lflag++;
  1021c7:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
  1021cc:	89 eb                	mov    %ebp,%ebx
			goto reswitch;

			// long flag (doubled for long long)
		case 'l':
			lflag++;
			goto reswitch;
  1021ce:	e9 43 ff ff ff       	jmp    102116 <vprintfmt+0x5e>

			// character
		case 'c':
			putch(va_arg(ap, int), putdat);
  1021d3:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  1021d7:	8d 50 04             	lea    0x4(%eax),%edx
  1021da:	89 54 24 4c          	mov    %edx,0x4c(%esp)
  1021de:	83 ec 08             	sub    $0x8,%esp
  1021e1:	57                   	push   %edi
  1021e2:	ff 30                	pushl  (%eax)
  1021e4:	ff d6                	call   *%esi
			break;
  1021e6:	83 c4 10             	add    $0x10,%esp
  1021e9:	e9 e1 fe ff ff       	jmp    1020cf <vprintfmt+0x17>

			// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
  1021ee:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  1021f2:	8d 50 04             	lea    0x4(%eax),%edx
  1021f5:	89 54 24 4c          	mov    %edx,0x4c(%esp)
  1021f9:	8b 18                	mov    (%eax),%ebx
  1021fb:	85 db                	test   %ebx,%ebx
  1021fd:	74 28                	je     102227 <vprintfmt+0x16f>
				p = "(null)";
			if (width > 0 && padc != '-')
  1021ff:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  102204:	0f 9f c2             	setg   %dl
  102207:	80 7c 24 17 2d       	cmpb   $0x2d,0x17(%esp)
  10220c:	0f 95 c0             	setne  %al
  10220f:	84 c2                	test   %al,%dl
  102211:	75 1b                	jne    10222e <vprintfmt+0x176>
  102213:	89 d8                	mov    %ebx,%eax
  102215:	89 74 24 40          	mov    %esi,0x40(%esp)
  102219:	8b 74 24 10          	mov    0x10(%esp),%esi
  10221d:	89 6c 24 48          	mov    %ebp,0x48(%esp)
  102221:	8b 6c 24 18          	mov    0x18(%esp),%ebp
  102225:	eb 62                	jmp    102289 <vprintfmt+0x1d1>
			break;

			// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
  102227:	bb d7 4f 10 00       	mov    $0x104fd7,%ebx
  10222c:	eb d1                	jmp    1021ff <vprintfmt+0x147>
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision);
  10222e:	83 ec 08             	sub    $0x8,%esp
  102231:	ff 74 24 20          	pushl  0x20(%esp)
  102235:	53                   	push   %ebx
  102236:	e8 05 fb ff ff       	call   101d40 <strnlen>
  10223b:	29 44 24 20          	sub    %eax,0x20(%esp)
  10223f:	8b 4c 24 20          	mov    0x20(%esp),%ecx
  102243:	83 c4 10             	add    $0x10,%esp
  102246:	89 6c 24 48          	mov    %ebp,0x48(%esp)
  10224a:	89 dd                	mov    %ebx,%ebp
  10224c:	89 cb                	mov    %ecx,%ebx
  10224e:	eb 12                	jmp    102262 <vprintfmt+0x1aa>
				     width > 0;
				     width--)
					putch(padc, putdat);
  102250:	83 ec 08             	sub    $0x8,%esp
  102253:	57                   	push   %edi
  102254:	0f be 44 24 23       	movsbl 0x23(%esp),%eax
  102259:	50                   	push   %eax
  10225a:	ff d6                	call   *%esi
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision);
				     width > 0;
				     width--)
  10225c:	83 eb 01             	sub    $0x1,%ebx
  10225f:	83 c4 10             	add    $0x10,%esp
			// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision);
  102262:	85 db                	test   %ebx,%ebx
  102264:	7f ea                	jg     102250 <vprintfmt+0x198>
  102266:	89 d9                	mov    %ebx,%ecx
  102268:	89 eb                	mov    %ebp,%ebx
  10226a:	89 d8                	mov    %ebx,%eax
  10226c:	89 74 24 40          	mov    %esi,0x40(%esp)
  102270:	89 ce                	mov    %ecx,%esi
  102272:	8b 6c 24 18          	mov    0x18(%esp),%ebp
  102276:	eb 11                	jmp    102289 <vprintfmt+0x1d1>
				     (precision < 0 || --precision >= 0);
			     width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
  102278:	83 ec 08             	sub    $0x8,%esp
  10227b:	57                   	push   %edi
  10227c:	52                   	push   %edx
  10227d:	ff 54 24 50          	call   *0x50(%esp)
  102281:	83 c4 10             	add    $0x10,%esp
				     width--)
					putch(padc, putdat);
			for (;
			     (ch = *p++) != '\0' &&
				     (precision < 0 || --precision >= 0);
			     width--)
  102284:	83 ee 01             	sub    $0x1,%esi
				for (width -= strnlen(p, precision);
				     width > 0;
				     width--)
					putch(padc, putdat);
			for (;
			     (ch = *p++) != '\0' &&
  102287:	89 d8                	mov    %ebx,%eax
  102289:	8d 58 01             	lea    0x1(%eax),%ebx
  10228c:	0f b6 00             	movzbl (%eax),%eax
  10228f:	0f be d0             	movsbl %al,%edx
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision);
				     width > 0;
				     width--)
					putch(padc, putdat);
			for (;
  102292:	85 d2                	test   %edx,%edx
  102294:	74 36                	je     1022cc <vprintfmt+0x214>
			     (ch = *p++) != '\0' &&
  102296:	85 ed                	test   %ebp,%ebp
  102298:	78 05                	js     10229f <vprintfmt+0x1e7>
				     (precision < 0 || --precision >= 0);
  10229a:	83 ed 01             	sub    $0x1,%ebp
  10229d:	78 21                	js     1022c0 <vprintfmt+0x208>
			     width--)
				if (altflag && (ch < ' ' || ch > '~'))
  10229f:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  1022a4:	74 d2                	je     102278 <vprintfmt+0x1c0>
  1022a6:	0f be c0             	movsbl %al,%eax
  1022a9:	83 e8 20             	sub    $0x20,%eax
  1022ac:	83 f8 5e             	cmp    $0x5e,%eax
  1022af:	76 c7                	jbe    102278 <vprintfmt+0x1c0>
					putch('?', putdat);
  1022b1:	83 ec 08             	sub    $0x8,%esp
  1022b4:	57                   	push   %edi
  1022b5:	6a 3f                	push   $0x3f
  1022b7:	ff 54 24 50          	call   *0x50(%esp)
  1022bb:	83 c4 10             	add    $0x10,%esp
  1022be:	eb c4                	jmp    102284 <vprintfmt+0x1cc>
  1022c0:	89 f3                	mov    %esi,%ebx
  1022c2:	8b 74 24 40          	mov    0x40(%esp),%esi
  1022c6:	8b 6c 24 48          	mov    0x48(%esp),%ebp
  1022ca:	eb 0a                	jmp    1022d6 <vprintfmt+0x21e>
  1022cc:	89 f3                	mov    %esi,%ebx
  1022ce:	8b 74 24 40          	mov    0x40(%esp),%esi
  1022d2:	8b 6c 24 48          	mov    0x48(%esp),%ebp
				else
					putch(ch, putdat);
			for (; width > 0; width--)
  1022d6:	85 db                	test   %ebx,%ebx
  1022d8:	0f 8e f1 fd ff ff    	jle    1020cf <vprintfmt+0x17>
				putch(' ', putdat);
  1022de:	83 ec 08             	sub    $0x8,%esp
  1022e1:	57                   	push   %edi
  1022e2:	6a 20                	push   $0x20
  1022e4:	ff d6                	call   *%esi
			     width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
  1022e6:	83 eb 01             	sub    $0x1,%ebx
  1022e9:	83 c4 10             	add    $0x10,%esp
  1022ec:	eb e8                	jmp    1022d6 <vprintfmt+0x21e>
				putch(' ', putdat);
			break;

			// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
  1022ee:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  1022f2:	8d 44 24 4c          	lea    0x4c(%esp),%eax
  1022f6:	e8 91 fd ff ff       	call   10208c <getint>
  1022fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1022ff:	89 54 24 0c          	mov    %edx,0xc(%esp)
			if ((long long) num < 0) {
  102303:	85 d2                	test   %edx,%edx
  102305:	78 07                	js     10230e <vprintfmt+0x256>
				putch('-', putdat);
				num = -(long long) num;
			}
			base = 10;
  102307:	bb 0a 00 00 00       	mov    $0xa,%ebx
  10230c:	eb 33                	jmp    102341 <vprintfmt+0x289>

			// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
			if ((long long) num < 0) {
				putch('-', putdat);
  10230e:	83 ec 08             	sub    $0x8,%esp
  102311:	57                   	push   %edi
  102312:	6a 2d                	push   $0x2d
  102314:	ff d6                	call   *%esi
				num = -(long long) num;
  102316:	8b 44 24 18          	mov    0x18(%esp),%eax
  10231a:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  10231e:	f7 d8                	neg    %eax
  102320:	83 d2 00             	adc    $0x0,%edx
  102323:	f7 da                	neg    %edx
  102325:	83 c4 10             	add    $0x10,%esp
			}
			base = 10;
  102328:	bb 0a 00 00 00       	mov    $0xa,%ebx
  10232d:	eb 12                	jmp    102341 <vprintfmt+0x289>
			goto number;

			// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
  10232f:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  102333:	8d 44 24 4c          	lea    0x4c(%esp),%eax
  102337:	e8 1c fd ff ff       	call   102058 <getuint>
			base = 10;
  10233c:	bb 0a 00 00 00       	mov    $0xa,%ebx
			// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
			base = 16;
		number:
			printnum(putch, putdat, num, base, width, padc);
  102341:	83 ec 0c             	sub    $0xc,%esp
  102344:	0f be 4c 24 23       	movsbl 0x23(%esp),%ecx
  102349:	51                   	push   %ecx
  10234a:	ff 74 24 20          	pushl  0x20(%esp)
  10234e:	53                   	push   %ebx
  10234f:	52                   	push   %edx
  102350:	50                   	push   %eax
  102351:	89 fa                	mov    %edi,%edx
  102353:	89 f0                	mov    %esi,%eax
  102355:	e8 48 fc ff ff       	call   101fa2 <printnum>
			break;
  10235a:	83 c4 20             	add    $0x20,%esp
  10235d:	e9 6d fd ff ff       	jmp    1020cf <vprintfmt+0x17>
		case 'o':
      // TODO

			// pointer
		case 'p':
			putch('0', putdat);
  102362:	83 ec 08             	sub    $0x8,%esp
  102365:	57                   	push   %edi
  102366:	6a 30                	push   $0x30
  102368:	ff d6                	call   *%esi
			putch('x', putdat);
  10236a:	83 c4 08             	add    $0x8,%esp
  10236d:	57                   	push   %edi
  10236e:	6a 78                	push   $0x78
  102370:	ff d6                	call   *%esi
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
  102372:	8b 44 24 5c          	mov    0x5c(%esp),%eax
  102376:	8d 50 04             	lea    0x4(%eax),%edx
  102379:	89 54 24 5c          	mov    %edx,0x5c(%esp)

			// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
  10237d:	8b 00                	mov    (%eax),%eax
  10237f:	ba 00 00 00 00       	mov    $0x0,%edx
				(uintptr_t) va_arg(ap, void *);
			base = 16;
			goto number;
  102384:	83 c4 10             	add    $0x10,%esp
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
  102387:	bb 10 00 00 00       	mov    $0x10,%ebx
			goto number;
  10238c:	eb b3                	jmp    102341 <vprintfmt+0x289>

			// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
  10238e:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  102392:	8d 44 24 4c          	lea    0x4c(%esp),%eax
  102396:	e8 bd fc ff ff       	call   102058 <getuint>
			base = 16;
  10239b:	bb 10 00 00 00       	mov    $0x10,%ebx
  1023a0:	eb 9f                	jmp    102341 <vprintfmt+0x289>
			printnum(putch, putdat, num, base, width, padc);
			break;

			// escaped '%' character
		case '%':
			putch(ch, putdat);
  1023a2:	83 ec 08             	sub    $0x8,%esp
  1023a5:	57                   	push   %edi
  1023a6:	50                   	push   %eax
  1023a7:	ff d6                	call   *%esi
			break;
  1023a9:	83 c4 10             	add    $0x10,%esp
  1023ac:	e9 1e fd ff ff       	jmp    1020cf <vprintfmt+0x17>

			// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
  1023b1:	83 ec 08             	sub    $0x8,%esp
  1023b4:	57                   	push   %edi
  1023b5:	6a 25                	push   $0x25
  1023b7:	ff d6                	call   *%esi
			for (fmt--; fmt[-1] != '%'; fmt--)
  1023b9:	83 c4 10             	add    $0x10,%esp
  1023bc:	89 dd                	mov    %ebx,%ebp
  1023be:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
  1023c2:	0f 84 07 fd ff ff    	je     1020cf <vprintfmt+0x17>
  1023c8:	83 ed 01             	sub    $0x1,%ebp
  1023cb:	eb f1                	jmp    1023be <vprintfmt+0x306>
				/* do nothing */;
			break;
		}
	}
}
  1023cd:	83 c4 2c             	add    $0x2c,%esp
  1023d0:	5b                   	pop    %ebx
  1023d1:	5e                   	pop    %esi
  1023d2:	5f                   	pop    %edi
  1023d3:	5d                   	pop    %ebp
  1023d4:	c3                   	ret    

001023d5 <tss_switch>:

segdesc_t gdt_LOC[CPU_GDT_NDESC];
tss_t tss_LOC[64];

void tss_switch(uint32_t pid)
{
  1023d5:	83 ec 18             	sub    $0x18,%esp
	gdt_LOC[CPU_GDT_TSS >> 3] =
		SEGDESC16(STS_T32A,
  1023d8:	69 44 24 1c ec 00 00 	imul   $0xec,0x1c(%esp),%eax
  1023df:	00 
  1023e0:	05 40 f0 9a 00       	add    $0x9af040,%eax
  1023e5:	89 c1                	mov    %eax,%ecx
  1023e7:	c1 e9 10             	shr    $0x10,%ecx
  1023ea:	89 c2                	mov    %eax,%edx
  1023ec:	c1 ea 18             	shr    $0x18,%edx
segdesc_t gdt_LOC[CPU_GDT_NDESC];
tss_t tss_LOC[64];

void tss_switch(uint32_t pid)
{
	gdt_LOC[CPU_GDT_TSS >> 3] =
  1023ef:	66 c7 05 28 f0 9a 00 	movw   $0xeb,0x9af028
  1023f6:	eb 00 
  1023f8:	66 a3 2a f0 9a 00    	mov    %ax,0x9af02a
  1023fe:	88 0d 2c f0 9a 00    	mov    %cl,0x9af02c
  102404:	0f b6 05 2d f0 9a 00 	movzbl 0x9af02d,%eax
  10240b:	83 e0 f0             	and    $0xfffffff0,%eax
  10240e:	83 c8 09             	or     $0x9,%eax
  102411:	83 e0 9f             	and    $0xffffff9f,%eax
  102414:	83 c8 80             	or     $0xffffff80,%eax
  102417:	c6 05 2e f0 9a 00 40 	movb   $0x40,0x9af02e
  10241e:	88 15 2f f0 9a 00    	mov    %dl,0x9af02f
		SEGDESC16(STS_T32A,
			  (uint32_t) (&tss_LOC[pid]), sizeof(tss_t) - 1, 0);
	gdt_LOC[CPU_GDT_TSS >> 3].sd_s = 0;
  102424:	83 e0 ef             	and    $0xffffffef,%eax
  102427:	a2 2d f0 9a 00       	mov    %al,0x9af02d
	ltr(CPU_GDT_TSS);
  10242c:	6a 28                	push   $0x28
  10242e:	e8 5d 03 00 00       	call   102790 <ltr>
}
  102433:	83 c4 1c             	add    $0x1c,%esp
  102436:	c3                   	ret    

00102437 <seg_init>:

void seg_init (void)
{
  102437:	56                   	push   %esi
  102438:	53                   	push   %ebx
  102439:	83 ec 1c             	sub    $0x1c,%esp
	/* clear BSS */
	extern uint8_t end[], edata[];
	memzero (edata, bsp_kstack - edata);
  10243c:	b8 00 e0 96 00       	mov    $0x96e000,%eax
  102441:	2d 20 ba 12 00       	sub    $0x12ba20,%eax
  102446:	50                   	push   %eax
  102447:	68 20 ba 12 00       	push   $0x12ba20
  10244c:	e8 56 f9 ff ff       	call   101da7 <memzero>
	memzero (bsp_kstack + 4096, end - bsp_kstack - 4096);
  102451:	b8 20 3c df 00       	mov    $0xdf3c20,%eax
  102456:	2d 00 e0 96 00       	sub    $0x96e000,%eax
  10245b:	83 c4 08             	add    $0x8,%esp
  10245e:	50                   	push   %eax
  10245f:	68 00 f0 96 00       	push   $0x96f000
  102464:	e8 3e f9 ff ff       	call   101da7 <memzero>

	/* setup GDT */
	gdt_LOC[0] = SEGDESC_NULL
  102469:	c7 05 00 f0 9a 00 00 	movl   $0x0,0x9af000
  102470:	00 00 00 
  102473:	c7 05 04 f0 9a 00 00 	movl   $0x0,0x9af004
  10247a:	00 00 00 
	;
	/* 0x08: kernel code */
	gdt_LOC[CPU_GDT_KCODE >> 3] = SEGDESC32(STA_X | STA_R, 0x0, 0xffffffff, 0);
  10247d:	66 c7 05 08 f0 9a 00 	movw   $0xffff,0x9af008
  102484:	ff ff 
  102486:	66 c7 05 0a f0 9a 00 	movw   $0x0,0x9af00a
  10248d:	00 00 
  10248f:	c6 05 0c f0 9a 00 00 	movb   $0x0,0x9af00c
  102496:	0f b6 05 0d f0 9a 00 	movzbl 0x9af00d,%eax
  10249d:	83 e0 f0             	and    $0xfffffff0,%eax
  1024a0:	83 c8 1a             	or     $0x1a,%eax
  1024a3:	83 e0 9f             	and    $0xffffff9f,%eax
  1024a6:	83 c8 80             	or     $0xffffff80,%eax
  1024a9:	a2 0d f0 9a 00       	mov    %al,0x9af00d
  1024ae:	0f b6 05 0e f0 9a 00 	movzbl 0x9af00e,%eax
  1024b5:	83 c8 0f             	or     $0xf,%eax
  1024b8:	83 e0 cf             	and    $0xffffffcf,%eax
  1024bb:	83 c8 c0             	or     $0xffffffc0,%eax
  1024be:	a2 0e f0 9a 00       	mov    %al,0x9af00e
  1024c3:	c6 05 0f f0 9a 00 00 	movb   $0x0,0x9af00f
	/* 0x10: kernel data */
	gdt_LOC[CPU_GDT_KDATA >> 3] = SEGDESC32(STA_W, 0x0, 0xffffffff, 0);
  1024ca:	66 c7 05 10 f0 9a 00 	movw   $0xffff,0x9af010
  1024d1:	ff ff 
  1024d3:	66 c7 05 12 f0 9a 00 	movw   $0x0,0x9af012
  1024da:	00 00 
  1024dc:	c6 05 14 f0 9a 00 00 	movb   $0x0,0x9af014
  1024e3:	0f b6 05 15 f0 9a 00 	movzbl 0x9af015,%eax
  1024ea:	83 e0 f0             	and    $0xfffffff0,%eax
  1024ed:	83 c8 12             	or     $0x12,%eax
  1024f0:	83 e0 9f             	and    $0xffffff9f,%eax
  1024f3:	83 c8 80             	or     $0xffffff80,%eax
  1024f6:	a2 15 f0 9a 00       	mov    %al,0x9af015
  1024fb:	0f b6 05 16 f0 9a 00 	movzbl 0x9af016,%eax
  102502:	83 c8 0f             	or     $0xf,%eax
  102505:	83 e0 cf             	and    $0xffffffcf,%eax
  102508:	83 c8 c0             	or     $0xffffffc0,%eax
  10250b:	a2 16 f0 9a 00       	mov    %al,0x9af016
  102510:	c6 05 17 f0 9a 00 00 	movb   $0x0,0x9af017
	/* 0x18: user code */
	gdt_LOC[CPU_GDT_UCODE >> 3] = SEGDESC32(STA_X | STA_R, 0x00000000,
  102517:	66 c7 05 18 f0 9a 00 	movw   $0xffff,0x9af018
  10251e:	ff ff 
  102520:	66 c7 05 1a f0 9a 00 	movw   $0x0,0x9af01a
  102527:	00 00 
  102529:	c6 05 1c f0 9a 00 00 	movb   $0x0,0x9af01c
  102530:	c6 05 1d f0 9a 00 fa 	movb   $0xfa,0x9af01d
  102537:	0f b6 05 1e f0 9a 00 	movzbl 0x9af01e,%eax
  10253e:	83 c8 0f             	or     $0xf,%eax
  102541:	83 e0 cf             	and    $0xffffffcf,%eax
  102544:	83 c8 c0             	or     $0xffffffc0,%eax
  102547:	a2 1e f0 9a 00       	mov    %al,0x9af01e
  10254c:	c6 05 1f f0 9a 00 00 	movb   $0x0,0x9af01f
		0xffffffff, 3);
	/* 0x20: user data */
	gdt_LOC[CPU_GDT_UDATA >> 3] = SEGDESC32(STA_W, 0x00000000, 0xffffffff, 3);
  102553:	66 c7 05 20 f0 9a 00 	movw   $0xffff,0x9af020
  10255a:	ff ff 
  10255c:	66 c7 05 22 f0 9a 00 	movw   $0x0,0x9af022
  102563:	00 00 
  102565:	c6 05 24 f0 9a 00 00 	movb   $0x0,0x9af024
  10256c:	c6 05 25 f0 9a 00 f2 	movb   $0xf2,0x9af025
  102573:	0f b6 05 26 f0 9a 00 	movzbl 0x9af026,%eax
  10257a:	83 c8 0f             	or     $0xf,%eax
  10257d:	83 e0 cf             	and    $0xffffffcf,%eax
  102580:	83 c8 c0             	or     $0xffffffc0,%eax
  102583:	a2 26 f0 9a 00       	mov    %al,0x9af026
  102588:	c6 05 27 f0 9a 00 00 	movb   $0x0,0x9af027

	/* setup TSS */
	tss0.ts_esp0 = (uint32_t) bsp_kstack + 4096;
  10258f:	ba 60 ce 12 00       	mov    $0x12ce60,%edx
  102594:	c7 05 64 ce 12 00 00 	movl   $0x96f000,0x12ce64
  10259b:	f0 96 00 
	tss0.ts_ss0 = CPU_GDT_KDATA;
  10259e:	66 c7 05 68 ce 12 00 	movw   $0x10,0x12ce68
  1025a5:	10 00 
	gdt_LOC[CPU_GDT_TSS >> 3] = SEGDESC16(STS_T32A, (uint32_t) (&tss0),
  1025a7:	66 c7 05 28 f0 9a 00 	movw   $0xeb,0x9af028
  1025ae:	eb 00 
  1025b0:	66 89 15 2a f0 9a 00 	mov    %dx,0x9af02a
  1025b7:	89 d0                	mov    %edx,%eax
  1025b9:	c1 e8 10             	shr    $0x10,%eax
  1025bc:	a2 2c f0 9a 00       	mov    %al,0x9af02c
  1025c1:	0f b6 05 2d f0 9a 00 	movzbl 0x9af02d,%eax
  1025c8:	83 e0 f0             	and    $0xfffffff0,%eax
  1025cb:	83 c8 09             	or     $0x9,%eax
  1025ce:	83 e0 9f             	and    $0xffffff9f,%eax
  1025d1:	83 c8 80             	or     $0xffffff80,%eax
  1025d4:	c6 05 2e f0 9a 00 40 	movb   $0x40,0x9af02e
  1025db:	c1 ea 18             	shr    $0x18,%edx
  1025de:	88 15 2f f0 9a 00    	mov    %dl,0x9af02f
		sizeof(tss_t) - 1, 0);
	gdt_LOC[CPU_GDT_TSS >> 3].sd_s = 0;
  1025e4:	83 e0 ef             	and    $0xffffffef,%eax
  1025e7:	a2 2d f0 9a 00       	mov    %al,0x9af02d

	pseudodesc_t gdt_desc =
  1025ec:	66 c7 44 24 1a 2f 00 	movw   $0x2f,0x1a(%esp)
  1025f3:	c7 44 24 1c 00 f0 9a 	movl   $0x9af000,0x1c(%esp)
  1025fa:	00 
		{ .pd_lim = sizeof(gdt_LOC) - 1, .pd_base = (uint32_t) gdt_LOC };
	asm volatile("lgdt %0" :: "m" (gdt_desc));
  1025fb:	0f 01 54 24 1a       	lgdtl  0x1a(%esp)
	asm volatile("movw %%ax,%%gs" :: "a" (CPU_GDT_KDATA));
  102600:	b8 10 00 00 00       	mov    $0x10,%eax
  102605:	8e e8                	mov    %eax,%gs
	asm volatile("movw %%ax,%%fs" :: "a" (CPU_GDT_KDATA));
  102607:	8e e0                	mov    %eax,%fs
	asm volatile("movw %%ax,%%es" :: "a" (CPU_GDT_KDATA));
  102609:	8e c0                	mov    %eax,%es
	asm volatile("movw %%ax,%%ds" :: "a" (CPU_GDT_KDATA));
  10260b:	8e d8                	mov    %eax,%ds
	asm volatile("movw %%ax,%%ss" :: "a" (CPU_GDT_KDATA));
  10260d:	8e d0                	mov    %eax,%ss
	/* reload %cs */
	asm volatile("ljmp %0,$1f\n 1:\n" :: "i" (CPU_GDT_KCODE));
  10260f:	ea 16 26 10 00 08 00 	ljmp   $0x8,$0x102616

	/*
	 * Load a null LDT.
	 */
	lldt (0);
  102616:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10261d:	e8 e3 00 00 00       	call   102705 <lldt>

	/*
	 * Load the bootstrap TSS.
	 */
	ltr (CPU_GDT_TSS);
  102622:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
  102629:	e8 62 01 00 00       	call   102790 <ltr>

	/*
	 * Load IDT.
	 */
	extern pseudodesc_t idt_pd;
	asm volatile("lidt %0" : : "m" (idt_pd));
  10262e:	0f 01 1d 00 93 10 00 	lidtl  0x109300

	/*
	 * Initialize all TSS structures for processes.
	 */
	unsigned int pid;
	memzero (tss_LOC, sizeof(tss_t) * 64);
  102635:	83 c4 08             	add    $0x8,%esp
  102638:	68 00 3b 00 00       	push   $0x3b00
  10263d:	68 40 f0 9a 00       	push   $0x9af040
  102642:	e8 60 f7 ff ff       	call   101da7 <memzero>
	memzero (STACK_LOC, sizeof(char) * 64 * 4096);
  102647:	83 c4 08             	add    $0x8,%esp
  10264a:	68 00 00 04 00       	push   $0x40000
  10264f:	68 00 f0 96 00       	push   $0x96f000
  102654:	e8 4e f7 ff ff       	call   101da7 <memzero>
	for (pid = 0; pid < 64; pid++)
  102659:	83 c4 10             	add    $0x10,%esp
  10265c:	bb 00 00 00 00       	mov    $0x0,%ebx
  102661:	eb 4f                	jmp    1026b2 <seg_init+0x27b>
	{
		tss_LOC[pid].ts_esp0 = (uint32_t) STACK_LOC[pid] + 4096;
  102663:	89 da                	mov    %ebx,%edx
  102665:	c1 e2 0c             	shl    $0xc,%edx
  102668:	81 c2 00 00 97 00    	add    $0x970000,%edx
  10266e:	69 c3 ec 00 00 00    	imul   $0xec,%ebx,%eax
  102674:	8d b0 40 f0 9a 00    	lea    0x9af040(%eax),%esi
  10267a:	89 90 44 f0 9a 00    	mov    %edx,0x9af044(%eax)
		tss_LOC[pid].ts_ss0 = CPU_GDT_KDATA;
  102680:	66 c7 80 48 f0 9a 00 	movw   $0x10,0x9af048(%eax)
  102687:	10 00 
		tss_LOC[pid].ts_iomb = offsetof(tss_t, ts_iopm);
  102689:	66 c7 80 a6 f0 9a 00 	movw   $0x68,0x9af0a6(%eax)
  102690:	68 00 
		memzero (tss_LOC[pid].ts_iopm, sizeof(uint8_t) * 128);
  102692:	05 a8 f0 9a 00       	add    $0x9af0a8,%eax
  102697:	83 ec 08             	sub    $0x8,%esp
  10269a:	68 80 00 00 00       	push   $0x80
  10269f:	50                   	push   %eax
  1026a0:	e8 02 f7 ff ff       	call   101da7 <memzero>
		tss_LOC[pid].ts_iopm[128] = 0xff;
  1026a5:	c6 86 e8 00 00 00 ff 	movb   $0xff,0xe8(%esi)
	 * Initialize all TSS structures for processes.
	 */
	unsigned int pid;
	memzero (tss_LOC, sizeof(tss_t) * 64);
	memzero (STACK_LOC, sizeof(char) * 64 * 4096);
	for (pid = 0; pid < 64; pid++)
  1026ac:	83 c3 01             	add    $0x1,%ebx
  1026af:	83 c4 10             	add    $0x10,%esp
  1026b2:	83 fb 3f             	cmp    $0x3f,%ebx
  1026b5:	76 ac                	jbe    102663 <seg_init+0x22c>
		tss_LOC[pid].ts_ss0 = CPU_GDT_KDATA;
		tss_LOC[pid].ts_iomb = offsetof(tss_t, ts_iopm);
		memzero (tss_LOC[pid].ts_iopm, sizeof(uint8_t) * 128);
		tss_LOC[pid].ts_iopm[128] = 0xff;
	}
}
  1026b7:	83 c4 14             	add    $0x14,%esp
  1026ba:	5b                   	pop    %ebx
  1026bb:	5e                   	pop    %esi
  1026bc:	c3                   	ret    

001026bd <max>:
#include "types.h"

uint32_t
max(uint32_t a, uint32_t b)
{
  1026bd:	8b 54 24 04          	mov    0x4(%esp),%edx
  1026c1:	8b 44 24 08          	mov    0x8(%esp),%eax
	return (a > b) ? a : b;
  1026c5:	39 d0                	cmp    %edx,%eax
  1026c7:	0f 42 c2             	cmovb  %edx,%eax
}
  1026ca:	c3                   	ret    

001026cb <min>:

uint32_t
min(uint32_t a, uint32_t b)
{
  1026cb:	8b 54 24 04          	mov    0x4(%esp),%edx
  1026cf:	8b 44 24 08          	mov    0x8(%esp),%eax
	return (a < b) ? a : b;
  1026d3:	39 d0                	cmp    %edx,%eax
  1026d5:	0f 47 c2             	cmova  %edx,%eax
}
  1026d8:	c3                   	ret    

001026d9 <rounddown>:

uint32_t
rounddown(uint32_t a, uint32_t n)
{
  1026d9:	8b 4c 24 04          	mov    0x4(%esp),%ecx
	return a - a % n;
  1026dd:	89 c8                	mov    %ecx,%eax
  1026df:	ba 00 00 00 00       	mov    $0x0,%edx
  1026e4:	f7 74 24 08          	divl   0x8(%esp)
  1026e8:	89 c8                	mov    %ecx,%eax
  1026ea:	29 d0                	sub    %edx,%eax
}
  1026ec:	c3                   	ret    

001026ed <roundup>:

uint32_t
roundup(uint32_t a, uint32_t n)
{
  1026ed:	8b 54 24 08          	mov    0x8(%esp),%edx
	return rounddown(a+n-1, n);
  1026f1:	89 d0                	mov    %edx,%eax
  1026f3:	03 44 24 04          	add    0x4(%esp),%eax
  1026f7:	52                   	push   %edx
  1026f8:	83 e8 01             	sub    $0x1,%eax
  1026fb:	50                   	push   %eax
  1026fc:	e8 d8 ff ff ff       	call   1026d9 <rounddown>
  102701:	83 c4 08             	add    $0x8,%esp
}
  102704:	c3                   	ret    

00102705 <lldt>:
#include "x86.h"

gcc_inline void
lldt(uint16_t sel)
{
	__asm __volatile("lldt %0" : : "r" (sel));
  102705:	8b 44 24 04          	mov    0x4(%esp),%eax
  102709:	0f 00 d0             	lldt   %ax
  10270c:	c3                   	ret    

0010270d <cli>:
}

gcc_inline void
cli(void)
{
	__asm __volatile("cli":::"memory");
  10270d:	fa                   	cli    
  10270e:	c3                   	ret    

0010270f <sti>:
}

gcc_inline void
sti(void)
{
	__asm __volatile("sti;nop");
  10270f:	fb                   	sti    
  102710:	90                   	nop
  102711:	c3                   	ret    

00102712 <rdmsr>:

gcc_inline uint64_t
rdmsr(uint32_t msr)
{
	uint64_t rv;
	__asm __volatile("rdmsr" : "=A" (rv) : "c" (msr));
  102712:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  102716:	0f 32                	rdmsr  
	return rv;
}
  102718:	c3                   	ret    

00102719 <wrmsr>:

gcc_inline void
wrmsr(uint32_t msr, uint64_t newval)
{
        __asm __volatile("wrmsr" : : "A" (newval), "c" (msr));
  102719:	8b 44 24 08          	mov    0x8(%esp),%eax
  10271d:	8b 54 24 0c          	mov    0xc(%esp),%edx
  102721:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  102725:	0f 30                	wrmsr  
  102727:	c3                   	ret    

00102728 <halt>:
}

gcc_inline void
halt(void)
{
	__asm __volatile("hlt");
  102728:	f4                   	hlt    
  102729:	c3                   	ret    

0010272a <rdtsc>:
gcc_inline uint64_t
rdtsc(void)
{
	uint64_t rv;

	__asm __volatile("rdtsc" : "=A" (rv));
  10272a:	0f 31                	rdtsc  
	return (rv);
}
  10272c:	c3                   	ret    

0010272d <enable_sse>:

gcc_inline uint32_t
rcr4(void)
{
	uint32_t cr4;
	__asm __volatile("movl %%cr4,%0" : "=r" (cr4));
  10272d:	0f 20 e0             	mov    %cr4,%eax
gcc_inline void
enable_sse(void)
{
	uint32_t cr0, cr4;

	cr4 = rcr4() | CR4_OSFXSR | CR4_OSXMMEXCPT;
  102730:	80 cc 06             	or     $0x6,%ah
	FENCE();
  102733:	0f ae f0             	mfence 
}

gcc_inline void
lcr4(uint32_t val)
{
	__asm __volatile("movl %0,%%cr4" : : "r" (val));
  102736:	0f 22 e0             	mov    %eax,%cr4

gcc_inline uint32_t
rcr0(void)
{
	uint32_t val;
	__asm __volatile("movl %%cr0,%0" : "=r" (val));
  102739:	0f 20 c0             	mov    %cr0,%eax
	cr4 = rcr4() | CR4_OSFXSR | CR4_OSXMMEXCPT;
	FENCE();
	lcr4(cr4);

	cr0 = rcr0() | CR0_MP;
	FENCE();
  10273c:	0f ae f0             	mfence 
  10273f:	c3                   	ret    

00102740 <cpuid>:
}

gcc_inline void
cpuid(uint32_t info,
      uint32_t *eaxp, uint32_t *ebxp, uint32_t *ecxp, uint32_t *edxp)
{
  102740:	55                   	push   %ebp
  102741:	57                   	push   %edi
  102742:	56                   	push   %esi
  102743:	53                   	push   %ebx
  102744:	8b 44 24 14          	mov    0x14(%esp),%eax
  102748:	8b 7c 24 18          	mov    0x18(%esp),%edi
  10274c:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
  102750:	8b 74 24 24          	mov    0x24(%esp),%esi
	uint32_t eax, ebx, ecx, edx;
	__asm __volatile("cpuid"
  102754:	0f a2                	cpuid  
			 : "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)
			 : "a" (info));
	if (eaxp)
  102756:	85 ff                	test   %edi,%edi
  102758:	74 02                	je     10275c <cpuid+0x1c>
		*eaxp = eax;
  10275a:	89 07                	mov    %eax,(%edi)
	if (ebxp)
  10275c:	85 ed                	test   %ebp,%ebp
  10275e:	74 03                	je     102763 <cpuid+0x23>
		*ebxp = ebx;
  102760:	89 5d 00             	mov    %ebx,0x0(%ebp)
	if (ecxp)
  102763:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
  102768:	74 06                	je     102770 <cpuid+0x30>
		*ecxp = ecx;
  10276a:	8b 44 24 20          	mov    0x20(%esp),%eax
  10276e:	89 08                	mov    %ecx,(%eax)
	if (edxp)
  102770:	85 f6                	test   %esi,%esi
  102772:	74 02                	je     102776 <cpuid+0x36>
		*edxp = edx;
  102774:	89 16                	mov    %edx,(%esi)
}
  102776:	5b                   	pop    %ebx
  102777:	5e                   	pop    %esi
  102778:	5f                   	pop    %edi
  102779:	5d                   	pop    %ebp
  10277a:	c3                   	ret    

0010277b <rcr3>:

gcc_inline uint32_t
rcr3(void)
{
    uint32_t val;
    __asm __volatile("movl %%cr3,%0" : "=r" (val));
  10277b:	0f 20 d8             	mov    %cr3,%eax
    return val;
}
  10277e:	c3                   	ret    

0010277f <outl>:

gcc_inline void
outl(int port, uint32_t data)
{
	__asm __volatile("outl %0,%w1" : : "a" (data), "d" (port));
  10277f:	8b 44 24 08          	mov    0x8(%esp),%eax
  102783:	8b 54 24 04          	mov    0x4(%esp),%edx
  102787:	ef                   	out    %eax,(%dx)
  102788:	c3                   	ret    

00102789 <inl>:

gcc_inline uint32_t
inl(int port)
{
	uint32_t data;
	__asm __volatile("inl %w1,%0" : "=a" (data) : "d" (port));
  102789:	8b 54 24 04          	mov    0x4(%esp),%edx
  10278d:	ed                   	in     (%dx),%eax
	return data;
}
  10278e:	c3                   	ret    

0010278f <smp_wmb>:

gcc_inline void
smp_wmb(void)
{
	__asm __volatile("":::"memory");
  10278f:	c3                   	ret    

00102790 <ltr>:


gcc_inline void
ltr(uint16_t sel)
{
	__asm __volatile("ltr %0" : : "r" (sel));
  102790:	8b 44 24 04          	mov    0x4(%esp),%eax
  102794:	0f 00 d8             	ltr    %ax
  102797:	c3                   	ret    

00102798 <lcr0>:
}

gcc_inline void
lcr0(uint32_t val)
{
	__asm __volatile("movl %0,%%cr0" : : "r" (val));
  102798:	8b 44 24 04          	mov    0x4(%esp),%eax
  10279c:	0f 22 c0             	mov    %eax,%cr0
  10279f:	c3                   	ret    

001027a0 <rcr0>:

gcc_inline uint32_t
rcr0(void)
{
	uint32_t val;
	__asm __volatile("movl %%cr0,%0" : "=r" (val));
  1027a0:	0f 20 c0             	mov    %cr0,%eax
	return val;
}
  1027a3:	c3                   	ret    

001027a4 <rcr2>:

gcc_inline uint32_t
rcr2(void)
{
	uint32_t val;
	__asm __volatile("movl %%cr2,%0" : "=r" (val));
  1027a4:	0f 20 d0             	mov    %cr2,%eax
	return val;
}
  1027a7:	c3                   	ret    

001027a8 <lcr3>:

gcc_inline void
lcr3(uint32_t val)
{
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
  1027a8:	8b 44 24 04          	mov    0x4(%esp),%eax
  1027ac:	0f 22 d8             	mov    %eax,%cr3
  1027af:	c3                   	ret    

001027b0 <lcr4>:
}

gcc_inline void
lcr4(uint32_t val)
{
	__asm __volatile("movl %0,%%cr4" : : "r" (val));
  1027b0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1027b4:	0f 22 e0             	mov    %eax,%cr4
  1027b7:	c3                   	ret    

001027b8 <rcr4>:

gcc_inline uint32_t
rcr4(void)
{
	uint32_t cr4;
	__asm __volatile("movl %%cr4,%0" : "=r" (cr4));
  1027b8:	0f 20 e0             	mov    %cr4,%eax
	return cr4;
}
  1027bb:	c3                   	ret    

001027bc <inb>:

gcc_inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  1027bc:	8b 54 24 04          	mov    0x4(%esp),%edx
  1027c0:	ec                   	in     (%dx),%al
	return data;
}
  1027c1:	c3                   	ret    

001027c2 <insl>:

gcc_inline void
insl(int port, void *addr, int cnt)
{
  1027c2:	57                   	push   %edi
	__asm __volatile("cld\n\trepne\n\tinsl"                 :
  1027c3:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  1027c7:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  1027cb:	8b 54 24 08          	mov    0x8(%esp),%edx
  1027cf:	fc                   	cld    
  1027d0:	f2 6d                	repnz insl (%dx),%es:(%edi)
			 "=D" (addr), "=c" (cnt)                :
			 "d" (port), "0" (addr), "1" (cnt)      :
			 "memory", "cc");
}
  1027d2:	5f                   	pop    %edi
  1027d3:	c3                   	ret    

001027d4 <outb>:

gcc_inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  1027d4:	8b 44 24 08          	mov    0x8(%esp),%eax
  1027d8:	8b 54 24 04          	mov    0x4(%esp),%edx
  1027dc:	ee                   	out    %al,(%dx)
  1027dd:	c3                   	ret    

001027de <outsw>:
}

gcc_inline void
outsw(int port, const void *addr, int cnt)
{
  1027de:	56                   	push   %esi
	__asm __volatile("cld\n\trepne\n\toutsw"                :
  1027df:	8b 74 24 0c          	mov    0xc(%esp),%esi
  1027e3:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  1027e7:	8b 54 24 08          	mov    0x8(%esp),%edx
  1027eb:	fc                   	cld    
  1027ec:	f2 66 6f             	repnz outsw %ds:(%esi),(%dx)
			 "=S" (addr), "=c" (cnt)                :
			 "d" (port), "0" (addr), "1" (cnt)      :
			 "cc");
}
  1027ef:	5e                   	pop    %esi
  1027f0:	c3                   	ret    

001027f1 <mon_start_user>:
extern void set_curid(unsigned int);
extern void kctx_switch(unsigned int, unsigned int);

int
mon_start_user (int argc, char **argv, struct Trapframe *tf)
{
  1027f1:	53                   	push   %ebx
  1027f2:	83 ec 10             	sub    $0x10,%esp
    unsigned int idle_pid;
    idle_pid = proc_create (_binary___obj_user_idle_idle_start, 10000);
  1027f5:	68 10 27 00 00       	push   $0x2710
  1027fa:	68 0c 93 10 00       	push   $0x10930c
  1027ff:	e8 6c 17 00 00       	call   103f70 <proc_create>
  102804:	89 c3                	mov    %eax,%ebx
    KERN_DEBUG("process idle %d is created.\n", idle_pid);
  102806:	50                   	push   %eax
  102807:	68 38 51 10 00       	push   $0x105138
  10280c:	6a 2d                	push   $0x2d
  10280e:	68 55 51 10 00       	push   $0x105155
  102813:	e8 f3 f5 ff ff       	call   101e0b <debug_normal>

    KERN_INFO("Start user-space ... \n");
  102818:	83 c4 14             	add    $0x14,%esp
  10281b:	68 68 51 10 00       	push   $0x105168
  102820:	e8 ce f5 ff ff       	call   101df3 <debug_info>

    tqueue_remove (NUM_IDS, idle_pid);
  102825:	83 c4 08             	add    $0x8,%esp
  102828:	53                   	push   %ebx
  102829:	6a 40                	push   $0x40
  10282b:	e8 60 15 00 00       	call   103d90 <tqueue_remove>
    tcb_set_state (idle_pid, TSTATE_RUN);
  102830:	83 c4 08             	add    $0x8,%esp
  102833:	6a 01                	push   $0x1
  102835:	53                   	push   %ebx
  102836:	e8 f5 12 00 00       	call   103b30 <tcb_set_state>
    set_curid (idle_pid);
  10283b:	89 1c 24             	mov    %ebx,(%esp)
  10283e:	e8 0d 16 00 00       	call   103e50 <set_curid>
    kctx_switch (0, idle_pid);
  102843:	83 c4 08             	add    $0x8,%esp
  102846:	53                   	push   %ebx
  102847:	6a 00                	push   $0x0
  102849:	e8 32 12 00 00       	call   103a80 <kctx_switch>

    KERN_PANIC("mon_startuser() should never reach here.\n");
  10284e:	83 c4 0c             	add    $0xc,%esp
  102851:	68 6c 52 10 00       	push   $0x10526c
  102856:	6a 36                	push   $0x36
  102858:	68 55 51 10 00       	push   $0x105155
  10285d:	e8 d3 f5 ff ff       	call   101e35 <debug_panic>
}
  102862:	83 c4 18             	add    $0x18,%esp
  102865:	5b                   	pop    %ebx
  102866:	c3                   	ret    

00102867 <mon_help>:

int
mon_help (int argc, char **argv, struct Trapframe *tf)
{
  102867:	53                   	push   %ebx
  102868:	83 ec 08             	sub    $0x8,%esp
	int i;

	for (i = 0; i < NCOMMANDS; i++)
  10286b:	bb 00 00 00 00       	mov    $0x0,%ebx
  102870:	eb 2b                	jmp    10289d <mon_help+0x36>
		dprintf("%s - %s\n", commands[i].name, commands[i].desc);
  102872:	83 ec 04             	sub    $0x4,%esp
  102875:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
  102878:	01 d8                	add    %ebx,%eax
  10287a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102881:	ff b2 84 53 10 00    	pushl  0x105384(%edx)
  102887:	ff b2 80 53 10 00    	pushl  0x105380(%edx)
  10288d:	68 7f 51 10 00       	push   $0x10517f
  102892:	e8 f3 f6 ff ff       	call   101f8a <dprintf>
int
mon_help (int argc, char **argv, struct Trapframe *tf)
{
	int i;

	for (i = 0; i < NCOMMANDS; i++)
  102897:	83 c3 01             	add    $0x1,%ebx
  10289a:	83 c4 10             	add    $0x10,%esp
  10289d:	83 fb 02             	cmp    $0x2,%ebx
  1028a0:	76 d0                	jbe    102872 <mon_help+0xb>
		dprintf("%s - %s\n", commands[i].name, commands[i].desc);
	return 0;
}
  1028a2:	b8 00 00 00 00       	mov    $0x0,%eax
  1028a7:	83 c4 08             	add    $0x8,%esp
  1028aa:	5b                   	pop    %ebx
  1028ab:	c3                   	ret    

001028ac <mon_kerninfo>:

int
mon_kerninfo (int argc, char **argv, struct Trapframe *tf)
{
  1028ac:	83 ec 18             	sub    $0x18,%esp
	extern uint8_t start[], etext[], edata[], end[];

	dprintf("Special kernel symbols:\n");
  1028af:	68 88 51 10 00       	push   $0x105188
  1028b4:	e8 d1 f6 ff ff       	call   101f8a <dprintf>
	dprintf("  start  %08x\n", start);
  1028b9:	83 c4 08             	add    $0x8,%esp
  1028bc:	68 60 2f 10 00       	push   $0x102f60
  1028c1:	68 a1 51 10 00       	push   $0x1051a1
  1028c6:	e8 bf f6 ff ff       	call   101f8a <dprintf>
	dprintf("  etext  %08x\n", etext);
  1028cb:	83 c4 08             	add    $0x8,%esp
  1028ce:	68 81 4b 10 00       	push   $0x104b81
  1028d3:	68 b0 51 10 00       	push   $0x1051b0
  1028d8:	e8 ad f6 ff ff       	call   101f8a <dprintf>
	dprintf("  edata  %08x\n", edata);
  1028dd:	83 c4 08             	add    $0x8,%esp
  1028e0:	68 20 ba 12 00       	push   $0x12ba20
  1028e5:	68 bf 51 10 00       	push   $0x1051bf
  1028ea:	e8 9b f6 ff ff       	call   101f8a <dprintf>
	dprintf("  end    %08x\n", end);
  1028ef:	83 c4 08             	add    $0x8,%esp
  1028f2:	68 20 4c df 00       	push   $0xdf4c20
  1028f7:	68 ce 51 10 00       	push   $0x1051ce
  1028fc:	e8 89 f6 ff ff       	call   101f8a <dprintf>
	dprintf("Kernel executable memory footprint: %dKB\n",
		ROUNDUP(end - start, 1024) / 1024);
  102901:	b8 20 4c df 00       	mov    $0xdf4c20,%eax
  102906:	2d 61 2b 10 00       	sub    $0x102b61,%eax
  10290b:	89 c1                	mov    %eax,%ecx
  10290d:	c1 f9 1f             	sar    $0x1f,%ecx
  102910:	c1 e9 16             	shr    $0x16,%ecx
  102913:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  102916:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  10291c:	29 ca                	sub    %ecx,%edx
  10291e:	29 d0                	sub    %edx,%eax
	dprintf("Special kernel symbols:\n");
	dprintf("  start  %08x\n", start);
	dprintf("  etext  %08x\n", etext);
	dprintf("  edata  %08x\n", edata);
	dprintf("  end    %08x\n", end);
	dprintf("Kernel executable memory footprint: %dKB\n",
  102920:	83 c4 08             	add    $0x8,%esp
  102923:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  102929:	85 c0                	test   %eax,%eax
  10292b:	0f 49 d0             	cmovns %eax,%edx
  10292e:	c1 fa 0a             	sar    $0xa,%edx
  102931:	52                   	push   %edx
  102932:	68 98 52 10 00       	push   $0x105298
  102937:	e8 4e f6 ff ff       	call   101f8a <dprintf>
		ROUNDUP(end - start, 1024) / 1024);
	return 0;
}
  10293c:	b8 00 00 00 00       	mov    $0x0,%eax
  102941:	83 c4 1c             	add    $0x1c,%esp
  102944:	c3                   	ret    

00102945 <runcmd>:
#define WHITESPACE "\t\r\n "
#define MAXARGS 16

static int
runcmd (char *buf, struct Trapframe *tf)
{
  102945:	55                   	push   %ebp
  102946:	57                   	push   %edi
  102947:	56                   	push   %esi
  102948:	53                   	push   %ebx
  102949:	83 ec 4c             	sub    $0x4c,%esp
  10294c:	89 c3                	mov    %eax,%ebx
  10294e:	89 d7                	mov    %edx,%edi
	char *argv[MAXARGS];
	int i;

	// Parse the command buffer into whitespace-separated arguments
	argc = 0;
	argv[argc] = 0;
  102950:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
	int argc;
	char *argv[MAXARGS];
	int i;

	// Parse the command buffer into whitespace-separated arguments
	argc = 0;
  102957:	bd 00 00 00 00       	mov    $0x0,%ebp
  10295c:	eb 67                	jmp    1029c5 <runcmd+0x80>
	argv[argc] = 0;
	while (1)
	{
		// gobble whitespace
		while (*buf && strchr (WHITESPACE, *buf))
  10295e:	83 ec 08             	sub    $0x8,%esp
  102961:	0f be c0             	movsbl %al,%eax
  102964:	50                   	push   %eax
  102965:	68 dd 51 10 00       	push   $0x1051dd
  10296a:	e8 18 f4 ff ff       	call   101d87 <strchr>
  10296f:	83 c4 10             	add    $0x10,%esp
  102972:	85 c0                	test   %eax,%eax
  102974:	74 56                	je     1029cc <runcmd+0x87>
			*buf++ = 0;
  102976:	c6 03 00             	movb   $0x0,(%ebx)
  102979:	89 ee                	mov    %ebp,%esi
  10297b:	8d 5b 01             	lea    0x1(%ebx),%ebx
  10297e:	eb 43                	jmp    1029c3 <runcmd+0x7e>
			break;

		// save and scan past next arg
		if (argc == MAXARGS - 1)
		{
			dprintf("Too many arguments (max %d)\n", MAXARGS);
  102980:	83 ec 08             	sub    $0x8,%esp
  102983:	6a 10                	push   $0x10
  102985:	68 e2 51 10 00       	push   $0x1051e2
  10298a:	e8 fb f5 ff ff       	call   101f8a <dprintf>
			return 0;
  10298f:	83 c4 10             	add    $0x10,%esp
  102992:	bd 00 00 00 00       	mov    $0x0,%ebp
		if (strcmp (argv[0], commands[i].name) == 0)
			return commands[i].func (argc, argv, tf);
	}
	dprintf("Unknown command '%s'\n", argv[0]);
	return 0;
}
  102997:	89 e8                	mov    %ebp,%eax
  102999:	83 c4 4c             	add    $0x4c,%esp
  10299c:	5b                   	pop    %ebx
  10299d:	5e                   	pop    %esi
  10299e:	5f                   	pop    %edi
  10299f:	5d                   	pop    %ebp
  1029a0:	c3                   	ret    
			dprintf("Too many arguments (max %d)\n", MAXARGS);
			return 0;
		}
		argv[argc++] = buf;
		while (*buf && !strchr (WHITESPACE, *buf))
			buf++;
  1029a1:	83 c3 01             	add    $0x1,%ebx
		{
			dprintf("Too many arguments (max %d)\n", MAXARGS);
			return 0;
		}
		argv[argc++] = buf;
		while (*buf && !strchr (WHITESPACE, *buf))
  1029a4:	0f b6 03             	movzbl (%ebx),%eax
  1029a7:	84 c0                	test   %al,%al
  1029a9:	74 18                	je     1029c3 <runcmd+0x7e>
  1029ab:	83 ec 08             	sub    $0x8,%esp
  1029ae:	0f be c0             	movsbl %al,%eax
  1029b1:	50                   	push   %eax
  1029b2:	68 dd 51 10 00       	push   $0x1051dd
  1029b7:	e8 cb f3 ff ff       	call   101d87 <strchr>
  1029bc:	83 c4 10             	add    $0x10,%esp
  1029bf:	85 c0                	test   %eax,%eax
  1029c1:	74 de                	je     1029a1 <runcmd+0x5c>
	argv[argc] = 0;
	while (1)
	{
		// gobble whitespace
		while (*buf && strchr (WHITESPACE, *buf))
			*buf++ = 0;
  1029c3:	89 f5                	mov    %esi,%ebp
	argc = 0;
	argv[argc] = 0;
	while (1)
	{
		// gobble whitespace
		while (*buf && strchr (WHITESPACE, *buf))
  1029c5:	0f b6 03             	movzbl (%ebx),%eax
  1029c8:	84 c0                	test   %al,%al
  1029ca:	75 92                	jne    10295e <runcmd+0x19>
			*buf++ = 0;
		if (*buf == 0)
  1029cc:	80 3b 00             	cmpb   $0x0,(%ebx)
  1029cf:	74 0d                	je     1029de <runcmd+0x99>
			break;

		// save and scan past next arg
		if (argc == MAXARGS - 1)
  1029d1:	83 fd 0f             	cmp    $0xf,%ebp
  1029d4:	74 aa                	je     102980 <runcmd+0x3b>
		{
			dprintf("Too many arguments (max %d)\n", MAXARGS);
			return 0;
		}
		argv[argc++] = buf;
  1029d6:	8d 75 01             	lea    0x1(%ebp),%esi
  1029d9:	89 1c ac             	mov    %ebx,(%esp,%ebp,4)
		while (*buf && !strchr (WHITESPACE, *buf))
  1029dc:	eb c6                	jmp    1029a4 <runcmd+0x5f>
			buf++;
	}
	argv[argc] = 0;
  1029de:	c7 04 ac 00 00 00 00 	movl   $0x0,(%esp,%ebp,4)

	// Lookup and invoke the command
	if (argc == 0)
  1029e5:	85 ed                	test   %ebp,%ebp
  1029e7:	74 ae                	je     102997 <runcmd+0x52>
  1029e9:	bb 00 00 00 00       	mov    $0x0,%ebx
		return 0;
	for (i = 0; i < NCOMMANDS; i++)
  1029ee:	83 fb 02             	cmp    $0x2,%ebx
  1029f1:	77 4c                	ja     102a3f <runcmd+0xfa>
	{
		if (strcmp (argv[0], commands[i].name) == 0)
  1029f3:	83 ec 08             	sub    $0x8,%esp
  1029f6:	8d 14 5b             	lea    (%ebx,%ebx,2),%edx
  1029f9:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
  102a00:	ff b0 80 53 10 00    	pushl  0x105380(%eax)
  102a06:	ff 74 24 0c          	pushl  0xc(%esp)
  102a0a:	e8 54 f3 ff ff       	call   101d63 <strcmp>
  102a0f:	83 c4 10             	add    $0x10,%esp
  102a12:	85 c0                	test   %eax,%eax
  102a14:	74 05                	je     102a1b <runcmd+0xd6>
	argv[argc] = 0;

	// Lookup and invoke the command
	if (argc == 0)
		return 0;
	for (i = 0; i < NCOMMANDS; i++)
  102a16:	83 c3 01             	add    $0x1,%ebx
  102a19:	eb d3                	jmp    1029ee <runcmd+0xa9>
	{
		if (strcmp (argv[0], commands[i].name) == 0)
			return commands[i].func (argc, argv, tf);
  102a1b:	8d 14 5b             	lea    (%ebx,%ebx,2),%edx
  102a1e:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
  102a25:	83 ec 04             	sub    $0x4,%esp
  102a28:	57                   	push   %edi
  102a29:	8d 54 24 08          	lea    0x8(%esp),%edx
  102a2d:	52                   	push   %edx
  102a2e:	55                   	push   %ebp
  102a2f:	ff 90 88 53 10 00    	call   *0x105388(%eax)
  102a35:	89 c5                	mov    %eax,%ebp
  102a37:	83 c4 10             	add    $0x10,%esp
  102a3a:	e9 58 ff ff ff       	jmp    102997 <runcmd+0x52>
	}
	dprintf("Unknown command '%s'\n", argv[0]);
  102a3f:	83 ec 08             	sub    $0x8,%esp
  102a42:	ff 74 24 08          	pushl  0x8(%esp)
  102a46:	68 ff 51 10 00       	push   $0x1051ff
  102a4b:	e8 3a f5 ff ff       	call   101f8a <dprintf>
	return 0;
  102a50:	83 c4 10             	add    $0x10,%esp
  102a53:	bd 00 00 00 00       	mov    $0x0,%ebp
  102a58:	e9 3a ff ff ff       	jmp    102997 <runcmd+0x52>

00102a5d <monitor>:
}

void
monitor (struct Trapframe *tf)
{
  102a5d:	53                   	push   %ebx
  102a5e:	83 ec 14             	sub    $0x14,%esp
  102a61:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
	char *buf;

	dprintf("\n****************************************\n\n");
  102a65:	68 c4 52 10 00       	push   $0x1052c4
  102a6a:	e8 1b f5 ff ff       	call   101f8a <dprintf>
	dprintf("Welcome to the mCertiKOS kernel monitor!\n");
  102a6f:	c7 04 24 f0 52 10 00 	movl   $0x1052f0,(%esp)
  102a76:	e8 0f f5 ff ff       	call   101f8a <dprintf>
	dprintf("\n****************************************\n\n");
  102a7b:	c7 04 24 c4 52 10 00 	movl   $0x1052c4,(%esp)
  102a82:	e8 03 f5 ff ff       	call   101f8a <dprintf>
	dprintf("Type 'help' for a list of commands.\n");
  102a87:	c7 04 24 1c 53 10 00 	movl   $0x10531c,(%esp)
  102a8e:	e8 f7 f4 ff ff       	call   101f8a <dprintf>
  102a93:	83 c4 10             	add    $0x10,%esp

	while (1)
	{
		buf = (char *) readline ("$> ");
  102a96:	83 ec 0c             	sub    $0xc,%esp
  102a99:	68 15 52 10 00       	push   $0x105215
  102a9e:	e8 2d d9 ff ff       	call   1003d0 <readline>
		if (buf != NULL)
  102aa3:	83 c4 10             	add    $0x10,%esp
  102aa6:	85 c0                	test   %eax,%eax
  102aa8:	74 ec                	je     102a96 <monitor+0x39>
			if (runcmd (buf, tf) < 0)
  102aaa:	89 da                	mov    %ebx,%edx
  102aac:	e8 94 fe ff ff       	call   102945 <runcmd>
  102ab1:	85 c0                	test   %eax,%eax
  102ab3:	79 e1                	jns    102a96 <monitor+0x39>
				break;
	}
}
  102ab5:	83 c4 08             	add    $0x8,%esp
  102ab8:	5b                   	pop    %ebx
  102ab9:	c3                   	ret    

00102aba <pt_copyin>:
extern void alloc_page(unsigned int pid, unsigned int vaddr, unsigned int perm);
extern unsigned int get_ptbl_entry_by_va(unsigned int pid, unsigned int vaddr);

size_t
pt_copyin(uint32_t pmap_id, uintptr_t uva, void *kva, size_t len)
{
  102aba:	55                   	push   %ebp
  102abb:	57                   	push   %edi
  102abc:	56                   	push   %esi
  102abd:	53                   	push   %ebx
  102abe:	83 ec 1c             	sub    $0x1c,%esp
  102ac1:	8b 7c 24 34          	mov    0x34(%esp),%edi
  102ac5:	8b 6c 24 38          	mov    0x38(%esp),%ebp
  102ac9:	8b 74 24 3c          	mov    0x3c(%esp),%esi
	if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
  102acd:	81 ff ff ff ff 3f    	cmp    $0x3fffffff,%edi
  102ad3:	0f 86 9a 00 00 00    	jbe    102b73 <pt_copyin+0xb9>
  102ad9:	8d 04 37             	lea    (%edi,%esi,1),%eax
  102adc:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  102ae1:	0f 87 a0 00 00 00    	ja     102b87 <pt_copyin+0xcd>
		return 0;

	if ((uintptr_t) kva + len > VM_USERHI)
  102ae7:	8d 04 2e             	lea    (%esi,%ebp,1),%eax
  102aea:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  102aef:	0f 87 9c 00 00 00    	ja     102b91 <pt_copyin+0xd7>
  102af5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102afc:	00 
  102afd:	eb 3b                	jmp    102b3a <pt_copyin+0x80>
		if ((uva_pa & PTE_P) == 0) {
			alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
		}

		uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  102aff:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  102b04:	89 fa                	mov    %edi,%edx
  102b06:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102b0c:	09 d0                	or     %edx,%eax

		size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
			len : PAGESIZE - uva_pa % PAGESIZE;
  102b0e:	89 c2                	mov    %eax,%edx
  102b10:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102b16:	bb 00 10 00 00       	mov    $0x1000,%ebx
  102b1b:	29 d3                	sub    %edx,%ebx
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
		}

		uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);

		size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  102b1d:	39 de                	cmp    %ebx,%esi
  102b1f:	0f 46 de             	cmovbe %esi,%ebx
			len : PAGESIZE - uva_pa % PAGESIZE;

		memcpy(kva, (void *) uva_pa, size);
  102b22:	83 ec 04             	sub    $0x4,%esp
  102b25:	53                   	push   %ebx
  102b26:	50                   	push   %eax
  102b27:	55                   	push   %ebp
  102b28:	e8 c2 f1 ff ff       	call   101cef <memcpy>

		len -= size;
  102b2d:	29 de                	sub    %ebx,%esi
		uva += size;
  102b2f:	01 df                	add    %ebx,%edi
		kva += size;
  102b31:	01 dd                	add    %ebx,%ebp
		copied += size;
  102b33:	01 5c 24 1c          	add    %ebx,0x1c(%esp)
  102b37:	83 c4 10             	add    $0x10,%esp
	if ((uintptr_t) kva + len > VM_USERHI)
		return 0;

	size_t copied = 0;

	while (len) {
  102b3a:	85 f6                	test   %esi,%esi
  102b3c:	74 3d                	je     102b7b <pt_copyin+0xc1>
		uintptr_t uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  102b3e:	83 ec 08             	sub    $0x8,%esp
  102b41:	57                   	push   %edi
  102b42:	ff 74 24 3c          	pushl  0x3c(%esp)
  102b46:	e8 65 0a 00 00       	call   1035b0 <get_ptbl_entry_by_va>

		if ((uva_pa & PTE_P) == 0) {
  102b4b:	83 c4 10             	add    $0x10,%esp
  102b4e:	a8 01                	test   $0x1,%al
  102b50:	75 ad                	jne    102aff <pt_copyin+0x45>
			alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
  102b52:	83 ec 04             	sub    $0x4,%esp
  102b55:	6a 07                	push   $0x7
  102b57:	57                   	push   %edi
  102b58:	ff 74 24 3c          	pushl  0x3c(%esp)
  102b5c:	e8 2f 0e 00 00       	call   103990 <alloc_page>
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  102b61:	83 c4 08             	add    $0x8,%esp
  102b64:	57                   	push   %edi
  102b65:	ff 74 24 3c          	pushl  0x3c(%esp)
  102b69:	e8 42 0a 00 00       	call   1035b0 <get_ptbl_entry_by_va>
  102b6e:	83 c4 10             	add    $0x10,%esp
  102b71:	eb 8c                	jmp    102aff <pt_copyin+0x45>

size_t
pt_copyin(uint32_t pmap_id, uintptr_t uva, void *kva, size_t len)
{
	if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
		return 0;
  102b73:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102b7a:	00 
		kva += size;
		copied += size;
	}

	return copied;
}
  102b7b:	8b 44 24 0c          	mov    0xc(%esp),%eax
  102b7f:	83 c4 1c             	add    $0x1c,%esp
  102b82:	5b                   	pop    %ebx
  102b83:	5e                   	pop    %esi
  102b84:	5f                   	pop    %edi
  102b85:	5d                   	pop    %ebp
  102b86:	c3                   	ret    

size_t
pt_copyin(uint32_t pmap_id, uintptr_t uva, void *kva, size_t len)
{
	if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
		return 0;
  102b87:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102b8e:	00 
  102b8f:	eb ea                	jmp    102b7b <pt_copyin+0xc1>

	if ((uintptr_t) kva + len > VM_USERHI)
		return 0;
  102b91:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102b98:	00 
  102b99:	eb e0                	jmp    102b7b <pt_copyin+0xc1>

00102b9b <pt_copyout>:
	return copied;
}

size_t
pt_copyout(void *kva, uint32_t pmap_id, uintptr_t uva, size_t len)
{
  102b9b:	55                   	push   %ebp
  102b9c:	57                   	push   %edi
  102b9d:	56                   	push   %esi
  102b9e:	53                   	push   %ebx
  102b9f:	83 ec 1c             	sub    $0x1c,%esp
  102ba2:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  102ba6:	8b 7c 24 38          	mov    0x38(%esp),%edi
  102baa:	8b 74 24 3c          	mov    0x3c(%esp),%esi
	if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
  102bae:	81 ff ff ff ff 3f    	cmp    $0x3fffffff,%edi
  102bb4:	0f 86 9a 00 00 00    	jbe    102c54 <pt_copyout+0xb9>
  102bba:	8d 04 37             	lea    (%edi,%esi,1),%eax
  102bbd:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  102bc2:	0f 87 a0 00 00 00    	ja     102c68 <pt_copyout+0xcd>
		return 0;

	if ((uintptr_t) kva + len > VM_USERHI)
  102bc8:	8d 04 2e             	lea    (%esi,%ebp,1),%eax
  102bcb:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  102bd0:	0f 87 9c 00 00 00    	ja     102c72 <pt_copyout+0xd7>
  102bd6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102bdd:	00 
  102bde:	eb 3b                	jmp    102c1b <pt_copyout+0x80>
		if ((uva_pa & PTE_P) == 0) {
			alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
		}

		uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  102be0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  102be5:	89 fa                	mov    %edi,%edx
  102be7:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102bed:	09 d0                	or     %edx,%eax

		size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
			len : PAGESIZE - uva_pa % PAGESIZE;
  102bef:	89 c2                	mov    %eax,%edx
  102bf1:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102bf7:	bb 00 10 00 00       	mov    $0x1000,%ebx
  102bfc:	29 d3                	sub    %edx,%ebx
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
		}

		uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);

		size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  102bfe:	39 de                	cmp    %ebx,%esi
  102c00:	0f 46 de             	cmovbe %esi,%ebx
			len : PAGESIZE - uva_pa % PAGESIZE;

		memcpy((void *) uva_pa, kva, size);
  102c03:	83 ec 04             	sub    $0x4,%esp
  102c06:	53                   	push   %ebx
  102c07:	55                   	push   %ebp
  102c08:	50                   	push   %eax
  102c09:	e8 e1 f0 ff ff       	call   101cef <memcpy>

		len -= size;
  102c0e:	29 de                	sub    %ebx,%esi
		uva += size;
  102c10:	01 df                	add    %ebx,%edi
		kva += size;
  102c12:	01 dd                	add    %ebx,%ebp
		copied += size;
  102c14:	01 5c 24 1c          	add    %ebx,0x1c(%esp)
  102c18:	83 c4 10             	add    $0x10,%esp
	if ((uintptr_t) kva + len > VM_USERHI)
		return 0;

	size_t copied = 0;

	while (len) {
  102c1b:	85 f6                	test   %esi,%esi
  102c1d:	74 3d                	je     102c5c <pt_copyout+0xc1>
		uintptr_t uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  102c1f:	83 ec 08             	sub    $0x8,%esp
  102c22:	57                   	push   %edi
  102c23:	ff 74 24 40          	pushl  0x40(%esp)
  102c27:	e8 84 09 00 00       	call   1035b0 <get_ptbl_entry_by_va>

		if ((uva_pa & PTE_P) == 0) {
  102c2c:	83 c4 10             	add    $0x10,%esp
  102c2f:	a8 01                	test   $0x1,%al
  102c31:	75 ad                	jne    102be0 <pt_copyout+0x45>
			alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
  102c33:	83 ec 04             	sub    $0x4,%esp
  102c36:	6a 07                	push   $0x7
  102c38:	57                   	push   %edi
  102c39:	ff 74 24 40          	pushl  0x40(%esp)
  102c3d:	e8 4e 0d 00 00       	call   103990 <alloc_page>
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  102c42:	83 c4 08             	add    $0x8,%esp
  102c45:	57                   	push   %edi
  102c46:	ff 74 24 40          	pushl  0x40(%esp)
  102c4a:	e8 61 09 00 00       	call   1035b0 <get_ptbl_entry_by_va>
  102c4f:	83 c4 10             	add    $0x10,%esp
  102c52:	eb 8c                	jmp    102be0 <pt_copyout+0x45>

size_t
pt_copyout(void *kva, uint32_t pmap_id, uintptr_t uva, size_t len)
{
	if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
		return 0;
  102c54:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102c5b:	00 
		kva += size;
		copied += size;
	}

	return copied;
}
  102c5c:	8b 44 24 0c          	mov    0xc(%esp),%eax
  102c60:	83 c4 1c             	add    $0x1c,%esp
  102c63:	5b                   	pop    %ebx
  102c64:	5e                   	pop    %esi
  102c65:	5f                   	pop    %edi
  102c66:	5d                   	pop    %ebp
  102c67:	c3                   	ret    

size_t
pt_copyout(void *kva, uint32_t pmap_id, uintptr_t uva, size_t len)
{
	if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
		return 0;
  102c68:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102c6f:	00 
  102c70:	eb ea                	jmp    102c5c <pt_copyout+0xc1>

	if ((uintptr_t) kva + len > VM_USERHI)
		return 0;
  102c72:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102c79:	00 
  102c7a:	eb e0                	jmp    102c5c <pt_copyout+0xc1>

00102c7c <pt_memset>:
	return copied;
}

size_t
pt_memset(uint32_t pmap_id, uintptr_t va, char c, size_t len)
{
  102c7c:	55                   	push   %ebp
  102c7d:	57                   	push   %edi
  102c7e:	56                   	push   %esi
  102c7f:	53                   	push   %ebx
  102c80:	83 ec 1c             	sub    $0x1c,%esp
  102c83:	8b 7c 24 34          	mov    0x34(%esp),%edi
  102c87:	8b 74 24 3c          	mov    0x3c(%esp),%esi
  102c8b:	0f b6 44 24 38       	movzbl 0x38(%esp),%eax
  102c90:	88 44 24 0f          	mov    %al,0xf(%esp)
        size_t set = 0;
  102c94:	bd 00 00 00 00       	mov    $0x0,%ebp

	while (len) {
  102c99:	eb 3c                	jmp    102cd7 <pt_memset+0x5b>
		if ((pa & PTE_P) == 0) {
			alloc_page(pmap_id, va, PTE_P | PTE_U | PTE_W);
			pa = get_ptbl_entry_by_va(pmap_id, va);
		}

		pa = (pa & 0xfffff000) + (va % PAGESIZE);
  102c9b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  102ca0:	89 fa                	mov    %edi,%edx
  102ca2:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102ca8:	09 d0                	or     %edx,%eax

		size_t size = (len < PAGESIZE - pa % PAGESIZE) ?
			len : PAGESIZE - pa % PAGESIZE;
  102caa:	89 c2                	mov    %eax,%edx
  102cac:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102cb2:	bb 00 10 00 00       	mov    $0x1000,%ebx
  102cb7:	29 d3                	sub    %edx,%ebx
			pa = get_ptbl_entry_by_va(pmap_id, va);
		}

		pa = (pa & 0xfffff000) + (va % PAGESIZE);

		size_t size = (len < PAGESIZE - pa % PAGESIZE) ?
  102cb9:	39 de                	cmp    %ebx,%esi
  102cbb:	0f 46 de             	cmovbe %esi,%ebx
			len : PAGESIZE - pa % PAGESIZE;

		memset((void *) pa, c, size);
  102cbe:	83 ec 04             	sub    $0x4,%esp
  102cc1:	53                   	push   %ebx
  102cc2:	0f be 54 24 17       	movsbl 0x17(%esp),%edx
  102cc7:	52                   	push   %edx
  102cc8:	50                   	push   %eax
  102cc9:	e8 6d ef ff ff       	call   101c3b <memset>

		len -= size;
  102cce:	29 de                	sub    %ebx,%esi
		va += size;
  102cd0:	01 df                	add    %ebx,%edi
		set += size;
  102cd2:	01 dd                	add    %ebx,%ebp
  102cd4:	83 c4 10             	add    $0x10,%esp
size_t
pt_memset(uint32_t pmap_id, uintptr_t va, char c, size_t len)
{
        size_t set = 0;

	while (len) {
  102cd7:	85 f6                	test   %esi,%esi
  102cd9:	74 35                	je     102d10 <pt_memset+0x94>
		uintptr_t pa = get_ptbl_entry_by_va(pmap_id, va);
  102cdb:	83 ec 08             	sub    $0x8,%esp
  102cde:	57                   	push   %edi
  102cdf:	ff 74 24 3c          	pushl  0x3c(%esp)
  102ce3:	e8 c8 08 00 00       	call   1035b0 <get_ptbl_entry_by_va>

		if ((pa & PTE_P) == 0) {
  102ce8:	83 c4 10             	add    $0x10,%esp
  102ceb:	a8 01                	test   $0x1,%al
  102ced:	75 ac                	jne    102c9b <pt_memset+0x1f>
			alloc_page(pmap_id, va, PTE_P | PTE_U | PTE_W);
  102cef:	83 ec 04             	sub    $0x4,%esp
  102cf2:	6a 07                	push   $0x7
  102cf4:	57                   	push   %edi
  102cf5:	ff 74 24 3c          	pushl  0x3c(%esp)
  102cf9:	e8 92 0c 00 00       	call   103990 <alloc_page>
			pa = get_ptbl_entry_by_va(pmap_id, va);
  102cfe:	83 c4 08             	add    $0x8,%esp
  102d01:	57                   	push   %edi
  102d02:	ff 74 24 3c          	pushl  0x3c(%esp)
  102d06:	e8 a5 08 00 00       	call   1035b0 <get_ptbl_entry_by_va>
  102d0b:	83 c4 10             	add    $0x10,%esp
  102d0e:	eb 8b                	jmp    102c9b <pt_memset+0x1f>
		va += size;
		set += size;
	}

	return set;
}
  102d10:	89 e8                	mov    %ebp,%eax
  102d12:	83 c4 1c             	add    $0x1c,%esp
  102d15:	5b                   	pop    %ebx
  102d16:	5e                   	pop    %esi
  102d17:	5f                   	pop    %edi
  102d18:	5d                   	pop    %ebp
  102d19:	c3                   	ret    

00102d1a <elf_load>:
/*
 * Load elf execution file exe to the virtual address space pmap.
 */
void
elf_load (void *exe_ptr, int pid)
{
  102d1a:	55                   	push   %ebp
  102d1b:	57                   	push   %edi
  102d1c:	56                   	push   %esi
  102d1d:	53                   	push   %ebx
  102d1e:	83 ec 2c             	sub    $0x2c,%esp
  102d21:	8b 5c 24 40          	mov    0x40(%esp),%ebx
  102d25:	8b 7c 24 44          	mov    0x44(%esp),%edi
	elfhdr *eh;
	proghdr *ph, *eph;
	sechdr *sh, *esh;
	char *strtab;
	uintptr_t exe = (uintptr_t) exe_ptr;
  102d29:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)

	eh = (elfhdr *) exe;

	KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  102d2d:	81 3b 7f 45 4c 46    	cmpl   $0x464c457f,(%ebx)
  102d33:	74 19                	je     102d4e <elf_load+0x34>
  102d35:	68 a4 53 10 00       	push   $0x1053a4
  102d3a:	68 77 4e 10 00       	push   $0x104e77
  102d3f:	6a 1e                	push   $0x1e
  102d41:	68 bd 53 10 00       	push   $0x1053bd
  102d46:	e8 ea f0 ff ff       	call   101e35 <debug_panic>
  102d4b:	83 c4 10             	add    $0x10,%esp
	KERN_ASSERT(eh->e_shstrndx != ELF_SHN_UNDEF);
  102d4e:	66 83 7b 32 00       	cmpw   $0x0,0x32(%ebx)
  102d53:	74 4c                	je     102da1 <elf_load+0x87>

	sh = (sechdr *) ((uintptr_t) eh + eh->e_shoff);
  102d55:	89 d9                	mov    %ebx,%ecx
  102d57:	03 4b 20             	add    0x20(%ebx),%ecx
	esh = sh + eh->e_shnum;

	strtab = (char *) (exe + sh[eh->e_shstrndx].sh_offset);
  102d5a:	0f b7 43 32          	movzwl 0x32(%ebx),%eax
  102d5e:	8d 14 80             	lea    (%eax,%eax,4),%edx
  102d61:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
	KERN_ASSERT(sh[eh->e_shstrndx].sh_type == ELF_SHT_STRTAB);
  102d68:	83 7c 01 04 03       	cmpl   $0x3,0x4(%ecx,%eax,1)
  102d6d:	74 19                	je     102d88 <elf_load+0x6e>
  102d6f:	68 ec 53 10 00       	push   $0x1053ec
  102d74:	68 77 4e 10 00       	push   $0x104e77
  102d79:	6a 25                	push   $0x25
  102d7b:	68 bd 53 10 00       	push   $0x1053bd
  102d80:	e8 b0 f0 ff ff       	call   101e35 <debug_panic>
  102d85:	83 c4 10             	add    $0x10,%esp

	ph = (proghdr *) ((uintptr_t) eh + eh->e_phoff);
  102d88:	89 da                	mov    %ebx,%edx
  102d8a:	03 53 1c             	add    0x1c(%ebx),%edx
  102d8d:	89 d5                	mov    %edx,%ebp
	eph = ph + eh->e_phnum;
  102d8f:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
  102d93:	c1 e0 05             	shl    $0x5,%eax
  102d96:	01 d0                	add    %edx,%eax
  102d98:	89 44 24 10          	mov    %eax,0x10(%esp)

	for (; ph < eph; ph++)
  102d9c:	e9 ba 00 00 00       	jmp    102e5b <elf_load+0x141>
	uintptr_t exe = (uintptr_t) exe_ptr;

	eh = (elfhdr *) exe;

	KERN_ASSERT(eh->e_magic == ELF_MAGIC);
	KERN_ASSERT(eh->e_shstrndx != ELF_SHN_UNDEF);
  102da1:	68 cc 53 10 00       	push   $0x1053cc
  102da6:	68 77 4e 10 00       	push   $0x104e77
  102dab:	6a 1f                	push   $0x1f
  102dad:	68 bd 53 10 00       	push   $0x1053bd
  102db2:	e8 7e f0 ff ff       	call   101e35 <debug_panic>
  102db7:	83 c4 10             	add    $0x10,%esp
  102dba:	eb 99                	jmp    102d55 <elf_load+0x3b>
		zva = ph->p_va + ph->p_filesz;
		eva = roundup (ph->p_va + ph->p_memsz, PAGESIZE);

		perm = PTE_U | PTE_P;
		if (ph->p_flags & ELF_PROG_FLAG_WRITE)
			perm |= PTE_W;
  102dbc:	c7 44 24 0c 07 00 00 	movl   $0x7,0xc(%esp)
  102dc3:	00 
  102dc4:	89 6c 24 14          	mov    %ebp,0x14(%esp)
  102dc8:	8b 6c 24 18          	mov    0x18(%esp),%ebp
  102dcc:	eb 2f                	jmp    102dfd <elf_load+0xe3>
			alloc_page (pid, va, perm);

			if (va < rounddown (zva, PAGESIZE))
			{
				/* copy a complete page */
				pt_copyout ((void *) fa, pid, va, PAGESIZE);
  102dce:	68 00 10 00 00       	push   $0x1000
  102dd3:	53                   	push   %ebx
  102dd4:	57                   	push   %edi
  102dd5:	56                   	push   %esi
  102dd6:	e8 c0 fd ff ff       	call   102b9b <pt_copyout>
  102ddb:	83 c4 10             	add    $0x10,%esp
  102dde:	eb 11                	jmp    102df1 <elf_load+0xd7>
				pt_copyout ((void *) fa, pid, va, zva - va);
			}
			else
			{
				/* zero a page */
				pt_memset (pid, va, 0, PAGESIZE);
  102de0:	68 00 10 00 00       	push   $0x1000
  102de5:	6a 00                	push   $0x0
  102de7:	53                   	push   %ebx
  102de8:	57                   	push   %edi
  102de9:	e8 8e fe ff ff       	call   102c7c <pt_memset>
  102dee:	83 c4 10             	add    $0x10,%esp

		perm = PTE_U | PTE_P;
		if (ph->p_flags & ELF_PROG_FLAG_WRITE)
			perm |= PTE_W;

		for (; va < eva; va += PAGESIZE, fa += PAGESIZE)
  102df1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  102df7:	81 c6 00 10 00 00    	add    $0x1000,%esi
  102dfd:	3b 5c 24 08          	cmp    0x8(%esp),%ebx
  102e01:	73 51                	jae    102e54 <elf_load+0x13a>
		{
			alloc_page (pid, va, perm);
  102e03:	83 ec 04             	sub    $0x4,%esp
  102e06:	ff 74 24 10          	pushl  0x10(%esp)
  102e0a:	53                   	push   %ebx
  102e0b:	57                   	push   %edi
  102e0c:	e8 7f 0b 00 00       	call   103990 <alloc_page>

			if (va < rounddown (zva, PAGESIZE))
  102e11:	83 c4 08             	add    $0x8,%esp
  102e14:	68 00 10 00 00       	push   $0x1000
  102e19:	55                   	push   %ebp
  102e1a:	e8 ba f8 ff ff       	call   1026d9 <rounddown>
  102e1f:	83 c4 10             	add    $0x10,%esp
  102e22:	39 c3                	cmp    %eax,%ebx
  102e24:	72 a8                	jb     102dce <elf_load+0xb4>
			{
				/* copy a complete page */
				pt_copyout ((void *) fa, pid, va, PAGESIZE);
			}
			else if (va < zva && ph->p_filesz)
  102e26:	39 eb                	cmp    %ebp,%ebx
  102e28:	73 b6                	jae    102de0 <elf_load+0xc6>
  102e2a:	8b 44 24 14          	mov    0x14(%esp),%eax
  102e2e:	83 78 10 00          	cmpl   $0x0,0x10(%eax)
  102e32:	74 ac                	je     102de0 <elf_load+0xc6>
			{
				/* copy a partial page */
				pt_memset (pid, va, 0, PAGESIZE);
  102e34:	68 00 10 00 00       	push   $0x1000
  102e39:	6a 00                	push   $0x0
  102e3b:	53                   	push   %ebx
  102e3c:	57                   	push   %edi
  102e3d:	e8 3a fe ff ff       	call   102c7c <pt_memset>
				pt_copyout ((void *) fa, pid, va, zva - va);
  102e42:	89 e8                	mov    %ebp,%eax
  102e44:	29 d8                	sub    %ebx,%eax
  102e46:	50                   	push   %eax
  102e47:	53                   	push   %ebx
  102e48:	57                   	push   %edi
  102e49:	56                   	push   %esi
  102e4a:	e8 4c fd ff ff       	call   102b9b <pt_copyout>
  102e4f:	83 c4 20             	add    $0x20,%esp
  102e52:	eb 9d                	jmp    102df1 <elf_load+0xd7>
  102e54:	8b 6c 24 14          	mov    0x14(%esp),%ebp
	KERN_ASSERT(sh[eh->e_shstrndx].sh_type == ELF_SHT_STRTAB);

	ph = (proghdr *) ((uintptr_t) eh + eh->e_phoff);
	eph = ph + eh->e_phnum;

	for (; ph < eph; ph++)
  102e58:	83 c5 20             	add    $0x20,%ebp
  102e5b:	3b 6c 24 10          	cmp    0x10(%esp),%ebp
  102e5f:	73 72                	jae    102ed3 <elf_load+0x1b9>
	{
		uintptr_t fa;
		uint32_t va, zva, eva, perm;

		if (ph->p_type != ELF_PROG_LOAD)
  102e61:	83 7d 00 01          	cmpl   $0x1,0x0(%ebp)
  102e65:	75 f1                	jne    102e58 <elf_load+0x13e>
			continue;

		fa = (uintptr_t) eh + rounddown (ph->p_offset, PAGESIZE);
  102e67:	83 ec 08             	sub    $0x8,%esp
  102e6a:	68 00 10 00 00       	push   $0x1000
  102e6f:	ff 75 04             	pushl  0x4(%ebp)
  102e72:	e8 62 f8 ff ff       	call   1026d9 <rounddown>
  102e77:	8b 54 24 2c          	mov    0x2c(%esp),%edx
  102e7b:	8d 34 02             	lea    (%edx,%eax,1),%esi
		va = rounddown (ph->p_va, PAGESIZE);
  102e7e:	83 c4 08             	add    $0x8,%esp
  102e81:	68 00 10 00 00       	push   $0x1000
  102e86:	ff 75 08             	pushl  0x8(%ebp)
  102e89:	e8 4b f8 ff ff       	call   1026d9 <rounddown>
  102e8e:	89 c3                	mov    %eax,%ebx
		zva = ph->p_va + ph->p_filesz;
  102e90:	8b 45 08             	mov    0x8(%ebp),%eax
  102e93:	89 c1                	mov    %eax,%ecx
  102e95:	03 4d 10             	add    0x10(%ebp),%ecx
  102e98:	89 4c 24 28          	mov    %ecx,0x28(%esp)
		eva = roundup (ph->p_va + ph->p_memsz, PAGESIZE);
  102e9c:	03 45 14             	add    0x14(%ebp),%eax
  102e9f:	83 c4 08             	add    $0x8,%esp
  102ea2:	68 00 10 00 00       	push   $0x1000
  102ea7:	50                   	push   %eax
  102ea8:	e8 40 f8 ff ff       	call   1026ed <roundup>
  102ead:	89 44 24 18          	mov    %eax,0x18(%esp)

		perm = PTE_U | PTE_P;
		if (ph->p_flags & ELF_PROG_FLAG_WRITE)
  102eb1:	83 c4 10             	add    $0x10,%esp
  102eb4:	f6 45 18 02          	testb  $0x2,0x18(%ebp)
  102eb8:	0f 85 fe fe ff ff    	jne    102dbc <elf_load+0xa2>
		fa = (uintptr_t) eh + rounddown (ph->p_offset, PAGESIZE);
		va = rounddown (ph->p_va, PAGESIZE);
		zva = ph->p_va + ph->p_filesz;
		eva = roundup (ph->p_va + ph->p_memsz, PAGESIZE);

		perm = PTE_U | PTE_P;
  102ebe:	c7 44 24 0c 05 00 00 	movl   $0x5,0xc(%esp)
  102ec5:	00 
  102ec6:	89 6c 24 14          	mov    %ebp,0x14(%esp)
  102eca:	8b 6c 24 18          	mov    0x18(%esp),%ebp
  102ece:	e9 2a ff ff ff       	jmp    102dfd <elf_load+0xe3>
				pt_memset (pid, va, 0, PAGESIZE);
			}
		}
	}

}
  102ed3:	83 c4 2c             	add    $0x2c,%esp
  102ed6:	5b                   	pop    %ebx
  102ed7:	5e                   	pop    %esi
  102ed8:	5f                   	pop    %edi
  102ed9:	5d                   	pop    %ebp
  102eda:	c3                   	ret    

00102edb <elf_entry>:

uintptr_t
elf_entry (void *exe_ptr)
{
  102edb:	53                   	push   %ebx
  102edc:	83 ec 08             	sub    $0x8,%esp
  102edf:	8b 5c 24 10          	mov    0x10(%esp),%ebx
	uintptr_t exe = (uintptr_t) exe_ptr;
	elfhdr *eh = (elfhdr *) exe;
	KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  102ee3:	81 3b 7f 45 4c 46    	cmpl   $0x464c457f,(%ebx)
  102ee9:	74 19                	je     102f04 <elf_entry+0x29>
  102eeb:	68 a4 53 10 00       	push   $0x1053a4
  102ef0:	68 77 4e 10 00       	push   $0x104e77
  102ef5:	6a 59                	push   $0x59
  102ef7:	68 bd 53 10 00       	push   $0x1053bd
  102efc:	e8 34 ef ff ff       	call   101e35 <debug_panic>
  102f01:	83 c4 10             	add    $0x10,%esp
	return (uintptr_t) eh->e_entry;
  102f04:	8b 43 18             	mov    0x18(%ebx),%eax
}
  102f07:	83 c4 08             	add    $0x8,%esp
  102f0a:	5b                   	pop    %ebx
  102f0b:	c3                   	ret    
  102f0c:	66 90                	xchg   %ax,%ax
  102f0e:	66 90                	xchg   %ax,%ax

00102f10 <kern_init>:
    #endif
}

void
kern_init (uintptr_t mbi_addr)
{
  102f10:	83 ec 18             	sub    $0x18,%esp
    thread_init(mbi_addr);
  102f13:	ff 74 24 1c          	pushl  0x1c(%esp)
  102f17:	e8 44 0f 00 00       	call   103e60 <thread_init>

    KERN_DEBUG("Kernel initialized.\n");
  102f1c:	83 c4 0c             	add    $0xc,%esp
  102f1f:	68 19 54 10 00       	push   $0x105419
  102f24:	6a 39                	push   $0x39
  102f26:	68 2e 54 10 00       	push   $0x10542e
  102f2b:	e8 db ee ff ff       	call   101e0b <debug_normal>
#endif

static void
kern_main (void)
{
    KERN_DEBUG("In kernel main.\n\n");
  102f30:	83 c4 0c             	add    $0xc,%esp
  102f33:	68 3f 54 10 00       	push   $0x10543f
  102f38:	6a 10                	push   $0x10
  102f3a:	68 2e 54 10 00       	push   $0x10542e
  102f3f:	e8 c7 ee ff ff       	call   101e0b <debug_normal>
    else
      dprintf("Test failed.\n");
    dprintf("\n");
    dprintf("\nTest complete. Please Use Ctrl-a x to exit qemu.");
    #else
    monitor(NULL);
  102f44:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
  102f4b:	00 
    thread_init(mbi_addr);

    KERN_DEBUG("Kernel initialized.\n");

    kern_main ();
}
  102f4c:	83 c4 1c             	add    $0x1c,%esp
    else
      dprintf("Test failed.\n");
    dprintf("\n");
    dprintf("\nTest complete. Please Use Ctrl-a x to exit qemu.");
    #else
    monitor(NULL);
  102f4f:	e9 09 fb ff ff       	jmp    102a5d <monitor>
  102f54:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  102f5a:	00 00                	add    %al,(%eax)
  102f5c:	fb                   	sti    
  102f5d:	4f                   	dec    %edi
  102f5e:	52                   	push   %edx
  102f5f:	e4                   	.byte 0xe4

00102f60 <start>:
	.long	CHECKSUM

	/* this is the entry of the kernel */
	.globl	start
start:
	cli
  102f60:	fa                   	cli    

	/* check whether the bootloader provide multiboot information */
	cmpl    $MULTIBOOT_BOOTLOADER_MAGIC, %eax
  102f61:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
	jne     spin
  102f66:	75 27                	jne    102f8f <spin>
	movl	%ebx, multiboot_ptr
  102f68:	89 1d 90 2f 10 00    	mov    %ebx,0x102f90

	/* tell BIOS to warmboot next time */
	movw	$0x1234,0x472
  102f6e:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
  102f75:	34 12 

	/* clear EFLAGS */
	pushl	$0x2
  102f77:	6a 02                	push   $0x2
	popfl
  102f79:	9d                   	popf   

	/* prepare the kernel stack  */
	movl	$0x0,%ebp
  102f7a:	bd 00 00 00 00       	mov    $0x0,%ebp
	movl	$(bsp_kstack+4096),%esp
  102f7f:	bc 00 f0 96 00       	mov    $0x96f000,%esp

	/* jump to the C code */
	push	multiboot_ptr
  102f84:	ff 35 90 2f 10 00    	pushl  0x102f90
	call	kern_init
  102f8a:	e8 81 ff ff ff       	call   102f10 <kern_init>

00102f8f <spin>:

	/* should not be here */
spin:
	hlt
  102f8f:	f4                   	hlt    

00102f90 <multiboot_ptr>:
  102f90:	00 00                	add    %al,(%eax)
  102f92:	00 00                	add    %al,(%eax)
  102f94:	66 90                	xchg   %ax,%ax
  102f96:	66 90                	xchg   %ax,%ax
  102f98:	66 90                	xchg   %ax,%ax
  102f9a:	66 90                	xchg   %ax,%ax
  102f9c:	66 90                	xchg   %ax,%ax
  102f9e:	66 90                	xchg   %ax,%ax

00102fa0 <get_nps>:
//The getter function for NUM_PAGES.
unsigned int
get_nps(void)
{
	return NUM_PAGES;
}
  102fa0:	a1 60 cf 92 00       	mov    0x92cf60,%eax
  102fa5:	c3                   	ret    
  102fa6:	8d 76 00             	lea    0x0(%esi),%esi
  102fa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102fb0 <set_nps>:

//The setter function for NUM_PAGES.
void
set_nps(unsigned int nps)
{
	NUM_PAGES = nps;
  102fb0:	8b 44 24 04          	mov    0x4(%esp),%eax
  102fb4:	a3 60 cf 92 00       	mov    %eax,0x92cf60
  102fb9:	c3                   	ret    
  102fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00102fc0 <at_is_norm>:
	tperm = AT[page_index].perm;

	if (tperm == 0) {
		tperm = 0;
	} else {
		if (tperm == 1)
  102fc0:	8b 44 24 04          	mov    0x4(%esp),%eax
  102fc4:	83 3c c5 60 cf 12 00 	cmpl   $0x1,0x12cf60(,%eax,8)
  102fcb:	01 
  102fcc:	0f 97 c0             	seta   %al
  102fcf:	0f b6 c0             	movzbl %al,%eax
		else
			tperm = 1;
	}

	return tperm;
}
  102fd2:	c3                   	ret    
  102fd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102fe0 <at_set_perm>:
 * Sets the permission of the page with given index.
 * It also marks the page as unallocated.
 */
void
at_set_perm(unsigned int page_index, unsigned int norm_val)
{
  102fe0:	8b 44 24 04          	mov    0x4(%esp),%eax
	AT[page_index].perm = norm_val;
  102fe4:	8b 54 24 08          	mov    0x8(%esp),%edx
	AT[page_index].allocated = 0;
  102fe8:	c7 04 c5 64 cf 12 00 	movl   $0x0,0x12cf64(,%eax,8)
  102fef:	00 00 00 00 
 * It also marks the page as unallocated.
 */
void
at_set_perm(unsigned int page_index, unsigned int norm_val)
{
	AT[page_index].perm = norm_val;
  102ff3:	89 14 c5 60 cf 12 00 	mov    %edx,0x12cf60(,%eax,8)
	AT[page_index].allocated = 0;
  102ffa:	c3                   	ret    
  102ffb:	90                   	nop
  102ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103000 <at_is_allocated>:
at_is_allocated(unsigned int page_index)
{
	unsigned int allocated;

	allocated = AT[page_index].allocated;
	if (allocated == 0)
  103000:	8b 44 24 04          	mov    0x4(%esp),%eax
  103004:	8b 04 c5 64 cf 12 00 	mov    0x12cf64(,%eax,8),%eax
  10300b:	85 c0                	test   %eax,%eax
  10300d:	0f 95 c0             	setne  %al
  103010:	0f b6 c0             	movzbl %al,%eax
		allocated = 0;
	else
		allocated = 1;

	return allocated;
}
  103013:	c3                   	ret    
  103014:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10301a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00103020 <at_set_allocated>:
 * Set the flag of the page with given index to the given value.
 */
void
at_set_allocated(unsigned int page_index, unsigned int allocated)
{
	AT[page_index].allocated = allocated;
  103020:	8b 54 24 08          	mov    0x8(%esp),%edx
  103024:	8b 44 24 04          	mov    0x4(%esp),%eax
  103028:	89 14 c5 64 cf 12 00 	mov    %edx,0x12cf64(,%eax,8)
  10302f:	c3                   	ret    

00103030 <pmem_init>:
 *    information available in the physical memory map table.
 *    Review import.h in the current directory for the list of avaiable getter and setter functions.
 */
void
pmem_init(unsigned int mbi_addr)
{
  103030:	55                   	push   %ebp
  103031:	57                   	push   %edi
  103032:	56                   	push   %esi
  103033:	53                   	push   %ebx
  103034:	83 ec 38             	sub    $0x38,%esp
	unsigned int i, j, isnorm, maxs, size, flag;
	unsigned int s, l;

  //Calls the lower layer initializatin primitives.
  //The parameter mbi_addr shell not be used in the further code.
	devinit(mbi_addr);
  103037:	ff 74 24 4c          	pushl  0x4c(%esp)
  10303b:	e8 66 d7 ff ff       	call   1007a6 <devinit>
   * Calculate the number of actual number of avaiable physical pages and store it into the local varaible nps.
   * Hint: Think of it as the highest address possible in the ranges of the memory map table,
   *       divided by the page size.
   */
	i = 0;
	size = get_size();
  103040:	e8 c3 da ff ff       	call   100b08 <get_size>
	nps = 0;
	while (i < size) {
  103045:	83 c4 10             	add    $0x10,%esp
  103048:	85 c0                	test   %eax,%eax
  10304a:	0f 84 9f 00 00 00    	je     1030ef <pmem_init+0xbf>
  103050:	89 c6                	mov    %eax,%esi
  103052:	31 db                	xor    %ebx,%ebx
  103054:	31 ff                	xor    %edi,%edi
  103056:	eb 0f                	jmp    103067 <pmem_init+0x37>
  103058:	90                   	nop
  103059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			l = get_mml(i);
			maxs = (s + l) / PAGESIZE + 1;
			if (maxs > nps)
				nps = maxs;
		}
		i++;
  103060:	83 c3 01             	add    $0x1,%ebx
   *       divided by the page size.
   */
	i = 0;
	size = get_size();
	nps = 0;
	while (i < size) {
  103063:	39 de                	cmp    %ebx,%esi
  103065:	74 3a                	je     1030a1 <pmem_init+0x71>
		if (is_usable(i)){
  103067:	83 ec 0c             	sub    $0xc,%esp
  10306a:	53                   	push   %ebx
  10306b:	e8 14 db ff ff       	call   100b84 <is_usable>
  103070:	83 c4 10             	add    $0x10,%esp
  103073:	85 c0                	test   %eax,%eax
  103075:	74 e9                	je     103060 <pmem_init+0x30>
			s = get_mms(i);
  103077:	83 ec 0c             	sub    $0xc,%esp
  10307a:	53                   	push   %ebx
  10307b:	e8 8e da ff ff       	call   100b0e <get_mms>
  103080:	89 c5                	mov    %eax,%ebp
			l = get_mml(i);
  103082:	89 1c 24             	mov    %ebx,(%esp)
  103085:	e8 bd da ff ff       	call   100b47 <get_mml>
			maxs = (s + l) / PAGESIZE + 1;
  10308a:	01 e8                	add    %ebp,%eax
  10308c:	83 c4 10             	add    $0x10,%esp
  10308f:	c1 e8 0c             	shr    $0xc,%eax
  103092:	8d 40 01             	lea    0x1(%eax),%eax
  103095:	39 c7                	cmp    %eax,%edi
  103097:	0f 42 f8             	cmovb  %eax,%edi
			if (maxs > nps)
				nps = maxs;
		}
		i++;
  10309a:	83 c3 01             	add    $0x1,%ebx
   *       divided by the page size.
   */
	i = 0;
	size = get_size();
	nps = 0;
	while (i < size) {
  10309d:	39 de                	cmp    %ebx,%esi
  10309f:	75 c6                	jne    103067 <pmem_init+0x37>
				nps = maxs;
		}
		i++;
	}

	set_nps(nps); // Setting the value computed above to NUM_PAGES.
  1030a1:	83 ec 0c             	sub    $0xc,%esp
  1030a4:	57                   	push   %edi
  1030a5:	e8 06 ff ff ff       	call   102fb0 <set_nps>
   *    But the ranges in the momory map table may not cover the entire available address space.
   *    That means there may be some gaps between the ranges.
   *    You should still set the permission of those pages in allocation table to 0.
   */
	i = 0;
	while (i < nps) {
  1030aa:	83 c4 10             	add    $0x10,%esp
  1030ad:	85 ff                	test   %edi,%edi
  1030af:	74 36                	je     1030e7 <pmem_init+0xb7>
  1030b1:	bd 01 00 00 00       	mov    $0x1,%ebp
  1030b6:	31 f6                	xor    %esi,%esi
  1030b8:	eb 08                	jmp    1030c2 <pmem_init+0x92>
  1030ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1030c0:	89 c5                	mov    %eax,%ebp
		if (i < VM_USERLO_PI || i >= VM_USERHI_PI) {
  1030c2:	8d 86 00 00 fc ff    	lea    -0x40000(%esi),%eax
  1030c8:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  1030cd:	76 34                	jbe    103103 <pmem_init+0xd3>
			at_set_perm(i, 1);
  1030cf:	83 ec 08             	sub    $0x8,%esp
  1030d2:	6a 01                	push   $0x1
  1030d4:	56                   	push   %esi
  1030d5:	e8 06 ff ff ff       	call   102fe0 <at_set_perm>
  1030da:	83 c4 10             	add    $0x10,%esp
  1030dd:	83 c6 01             	add    $0x1,%esi
   *    But the ranges in the momory map table may not cover the entire available address space.
   *    That means there may be some gaps between the ranges.
   *    You should still set the permission of those pages in allocation table to 0.
   */
	i = 0;
	while (i < nps) {
  1030e0:	39 ef                	cmp    %ebp,%edi
  1030e2:	8d 45 01             	lea    0x1(%ebp),%eax
  1030e5:	77 d9                	ja     1030c0 <pmem_init+0x90>
				at_set_perm(i, 0);
		}
		i++;
	}

}
  1030e7:	83 c4 2c             	add    $0x2c,%esp
  1030ea:	5b                   	pop    %ebx
  1030eb:	5e                   	pop    %esi
  1030ec:	5f                   	pop    %edi
  1030ed:	5d                   	pop    %ebp
  1030ee:	c3                   	ret    
				nps = maxs;
		}
		i++;
	}

	set_nps(nps); // Setting the value computed above to NUM_PAGES.
  1030ef:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%esp)
  1030f6:	00 
				at_set_perm(i, 0);
		}
		i++;
	}

}
  1030f7:	83 c4 2c             	add    $0x2c,%esp
  1030fa:	5b                   	pop    %ebx
  1030fb:	5e                   	pop    %esi
  1030fc:	5f                   	pop    %edi
  1030fd:	5d                   	pop    %ebp
				nps = maxs;
		}
		i++;
	}

	set_nps(nps); // Setting the value computed above to NUM_PAGES.
  1030fe:	e9 ad fe ff ff       	jmp    102fb0 <set_nps>
  103103:	89 f0                	mov    %esi,%eax
			isnorm = 0;
			while (j < size && flag == 0) {
				s = get_mms(j);
				l = get_mml(j);
				isnorm = is_usable(j);
				if (s <= i * PAGESIZE && l + s >= (i + 1) * PAGESIZE) {
  103105:	89 74 24 18          	mov    %esi,0x18(%esp)
  103109:	89 7c 24 14          	mov    %edi,0x14(%esp)
  10310d:	c1 e0 0c             	shl    $0xc,%eax
  103110:	89 6c 24 1c          	mov    %ebp,0x1c(%esp)
  103114:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103118:	89 e8                	mov    %ebp,%eax
  10311a:	c1 e0 0c             	shl    $0xc,%eax
  10311d:	89 44 24 10          	mov    %eax,0x10(%esp)
  103121:	31 c0                	xor    %eax,%eax
  103123:	89 c6                	mov    %eax,%esi
  103125:	8d 76 00             	lea    0x0(%esi),%esi
		} else {
			j = 0;
			flag = 0;
			isnorm = 0;
			while (j < size && flag == 0) {
				s = get_mms(j);
  103128:	83 ec 0c             	sub    $0xc,%esp
  10312b:	56                   	push   %esi
  10312c:	e8 dd d9 ff ff       	call   100b0e <get_mms>
				l = get_mml(j);
  103131:	89 34 24             	mov    %esi,(%esp)
		} else {
			j = 0;
			flag = 0;
			isnorm = 0;
			while (j < size && flag == 0) {
				s = get_mms(j);
  103134:	89 c5                	mov    %eax,%ebp
				l = get_mml(j);
  103136:	e8 0c da ff ff       	call   100b47 <get_mml>
				isnorm = is_usable(j);
  10313b:	89 34 24             	mov    %esi,(%esp)
			j = 0;
			flag = 0;
			isnorm = 0;
			while (j < size && flag == 0) {
				s = get_mms(j);
				l = get_mml(j);
  10313e:	89 c7                	mov    %eax,%edi
				isnorm = is_usable(j);
  103140:	e8 3f da ff ff       	call   100b84 <is_usable>
				if (s <= i * PAGESIZE && l + s >= (i + 1) * PAGESIZE) {
  103145:	83 c4 10             	add    $0x10,%esp
  103148:	31 c9                	xor    %ecx,%ecx
  10314a:	3b 6c 24 0c          	cmp    0xc(%esp),%ebp
  10314e:	77 0b                	ja     10315b <pmem_init+0x12b>
  103150:	8d 54 3d 00          	lea    0x0(%ebp,%edi,1),%edx
  103154:	3b 54 24 10          	cmp    0x10(%esp),%edx
  103158:	0f 93 c1             	setae  %cl
					flag = 1;
				}
				j++;
  10315b:	83 c6 01             	add    $0x1,%esi
			at_set_perm(i, 1);
		} else {
			j = 0;
			flag = 0;
			isnorm = 0;
			while (j < size && flag == 0) {
  10315e:	39 f3                	cmp    %esi,%ebx
  103160:	0f 97 c2             	seta   %dl
  103163:	38 d1                	cmp    %dl,%cl
  103165:	72 c1                	jb     103128 <pmem_init+0xf8>
  103167:	89 c2                	mov    %eax,%edx
  103169:	8b 7c 24 14          	mov    0x14(%esp),%edi
  10316d:	89 c8                	mov    %ecx,%eax
				if (s <= i * PAGESIZE && l + s >= (i + 1) * PAGESIZE) {
					flag = 1;
				}
				j++;
			}
			if (flag == 1 && isnorm == 1)
  10316f:	83 fa 01             	cmp    $0x1,%edx
  103172:	8b 74 24 18          	mov    0x18(%esp),%esi
  103176:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
  10317a:	75 17                	jne    103193 <pmem_init+0x163>
  10317c:	84 c0                	test   %al,%al
  10317e:	74 13                	je     103193 <pmem_init+0x163>
				at_set_perm(i, 2);
  103180:	83 ec 08             	sub    $0x8,%esp
  103183:	6a 02                	push   $0x2
  103185:	56                   	push   %esi
  103186:	e8 55 fe ff ff       	call   102fe0 <at_set_perm>
  10318b:	83 c4 10             	add    $0x10,%esp
  10318e:	e9 4a ff ff ff       	jmp    1030dd <pmem_init+0xad>
			else
				at_set_perm(i, 0);
  103193:	83 ec 08             	sub    $0x8,%esp
  103196:	6a 00                	push   $0x0
  103198:	56                   	push   %esi
  103199:	e8 42 fe ff ff       	call   102fe0 <at_set_perm>
  10319e:	83 c4 10             	add    $0x10,%esp
  1031a1:	e9 37 ff ff ff       	jmp    1030dd <pmem_init+0xad>
  1031a6:	66 90                	xchg   %ax,%ax
  1031a8:	66 90                	xchg   %ax,%ax
  1031aa:	66 90                	xchg   %ax,%ax
  1031ac:	66 90                	xchg   %ax,%ax
  1031ae:	66 90                	xchg   %ax,%ax

001031b0 <palloc>:
 * 2. Optimize the code with the memorization techniques so that you do not have to
 *    scan the allocation table from scratch every time.
 */
unsigned int
palloc()
{ 
  1031b0:	57                   	push   %edi
  1031b1:	56                   	push   %esi
  1031b2:	53                   	push   %ebx
    unsigned int tnps;
    unsigned int palloc_index;
    unsigned int palloc_cur_at;
    unsigned int palloc_is_norm;
    unsigned int palloc_free_index;
    tnps = get_nps();
  1031b3:	e8 e8 fd ff ff       	call   102fa0 <get_nps>
  1031b8:	89 c6                	mov    %eax,%esi
    palloc_index = last_palloc_index + 1;
  1031ba:	a1 08 93 10 00       	mov    0x109308,%eax
  1031bf:	89 f7                	mov    %esi,%edi
  1031c1:	8d 58 01             	lea    0x1(%eax),%ebx
    palloc_free_index = tnps;
    while( palloc_index < tnps && palloc_free_index == tnps )
  1031c4:	39 de                	cmp    %ebx,%esi
  1031c6:	77 13                	ja     1031db <palloc+0x2b>
  1031c8:	eb 66                	jmp    103230 <palloc+0x80>
  1031ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        {
            palloc_cur_at = at_is_allocated(palloc_index);
            if (palloc_cur_at == 0)
                palloc_free_index = palloc_index;
        }
        palloc_index ++;
  1031d0:	83 c3 01             	add    $0x1,%ebx
    unsigned int palloc_is_norm;
    unsigned int palloc_free_index;
    tnps = get_nps();
    palloc_index = last_palloc_index + 1;
    palloc_free_index = tnps;
    while( palloc_index < tnps && palloc_free_index == tnps )
  1031d3:	39 de                	cmp    %ebx,%esi
  1031d5:	76 31                	jbe    103208 <palloc+0x58>
  1031d7:	39 f7                	cmp    %esi,%edi
  1031d9:	75 2d                	jne    103208 <palloc+0x58>
    {
        palloc_is_norm = at_is_norm(palloc_index);
  1031db:	83 ec 0c             	sub    $0xc,%esp
  1031de:	53                   	push   %ebx
  1031df:	e8 dc fd ff ff       	call   102fc0 <at_is_norm>
        if (palloc_is_norm == 1)
  1031e4:	83 c4 10             	add    $0x10,%esp
  1031e7:	83 f8 01             	cmp    $0x1,%eax
  1031ea:	75 e4                	jne    1031d0 <palloc+0x20>
        {
            palloc_cur_at = at_is_allocated(palloc_index);
  1031ec:	83 ec 0c             	sub    $0xc,%esp
  1031ef:	53                   	push   %ebx
  1031f0:	e8 0b fe ff ff       	call   103000 <at_is_allocated>
            if (palloc_cur_at == 0)
  1031f5:	83 c4 10             	add    $0x10,%esp
  1031f8:	85 c0                	test   %eax,%eax
  1031fa:	0f 44 fb             	cmove  %ebx,%edi
                palloc_free_index = palloc_index;
        }
        palloc_index ++;
  1031fd:	83 c3 01             	add    $0x1,%ebx
    unsigned int palloc_is_norm;
    unsigned int palloc_free_index;
    tnps = get_nps();
    palloc_index = last_palloc_index + 1;
    palloc_free_index = tnps;
    while( palloc_index < tnps && palloc_free_index == tnps )
  103200:	39 de                	cmp    %ebx,%esi
  103202:	77 d3                	ja     1031d7 <palloc+0x27>
  103204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            if (palloc_cur_at == 0)
                palloc_free_index = palloc_index;
        }
        palloc_index ++;
    }
    if (palloc_free_index == tnps)
  103208:	39 f7                	cmp    %esi,%edi
  10320a:	74 24                	je     103230 <palloc+0x80>
      palloc_free_index = 0;
    else
    {
      at_set_allocated(palloc_free_index, 1);
  10320c:	83 ec 08             	sub    $0x8,%esp
  10320f:	6a 01                	push   $0x1
  103211:	57                   	push   %edi
  103212:	e8 09 fe ff ff       	call   103020 <at_set_allocated>
  103217:	89 f8                	mov    %edi,%eax
  103219:	31 d2                	xor    %edx,%edx
  10321b:	83 c4 10             	add    $0x10,%esp
  10321e:	f7 f6                	div    %esi
    }
    last_palloc_index = palloc_free_index % tnps;
    return palloc_free_index;
}
  103220:	5b                   	pop    %ebx
  103221:	89 f8                	mov    %edi,%eax
  103223:	5e                   	pop    %esi
  103224:	5f                   	pop    %edi
      palloc_free_index = 0;
    else
    {
      at_set_allocated(palloc_free_index, 1);
    }
    last_palloc_index = palloc_free_index % tnps;
  103225:	89 15 08 93 10 00    	mov    %edx,0x109308
    return palloc_free_index;
}
  10322b:	c3                   	ret    
  10322c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                palloc_free_index = palloc_index;
        }
        palloc_index ++;
    }
    if (palloc_free_index == tnps)
      palloc_free_index = 0;
  103230:	31 ff                	xor    %edi,%edi
  103232:	31 d2                	xor    %edx,%edx
    {
      at_set_allocated(palloc_free_index, 1);
    }
    last_palloc_index = palloc_free_index % tnps;
    return palloc_free_index;
}
  103234:	89 f8                	mov    %edi,%eax
      palloc_free_index = 0;
    else
    {
      at_set_allocated(palloc_free_index, 1);
    }
    last_palloc_index = palloc_free_index % tnps;
  103236:	89 15 08 93 10 00    	mov    %edx,0x109308
    return palloc_free_index;
}
  10323c:	5b                   	pop    %ebx
  10323d:	5e                   	pop    %esi
  10323e:	5f                   	pop    %edi
  10323f:	c3                   	ret    

00103240 <pfree>:
 *
 * Hint: Simple.
 */
void
pfree(unsigned int pfree_index)
{
  103240:	83 ec 14             	sub    $0x14,%esp
  at_set_allocated(pfree_index,0);
  103243:	6a 00                	push   $0x0
  103245:	ff 74 24 1c          	pushl  0x1c(%esp)
  103249:	e8 d2 fd ff ff       	call   103020 <at_set_allocated>
}
  10324e:	83 c4 1c             	add    $0x1c,%esp
  103251:	c3                   	ret    
  103252:	66 90                	xchg   %ax,%ax
  103254:	66 90                	xchg   %ax,%ax
  103256:	66 90                	xchg   %ax,%ax
  103258:	66 90                	xchg   %ax,%ax
  10325a:	66 90                	xchg   %ax,%ax
  10325c:	66 90                	xchg   %ax,%ax
  10325e:	66 90                	xchg   %ax,%ax

00103260 <container_init>:
/**
 * Initializes the container data for the root process (the one with index 0).
 * The root process is the one that gets spawned first by the kernel.
 */
void container_init(unsigned int mbi_addr)
{
  103260:	55                   	push   %ebp
  103261:	57                   	push   %edi
  103262:	56                   	push   %esi
  103263:	53                   	push   %ebx
  103264:	83 ec 18             	sub    $0x18,%esp
  unsigned int real_quota;
  // TODO: define your local variables here.
  unsigned int nps, i, norm, used;

  pmem_init(mbi_addr);
  103267:	ff 74 24 2c          	pushl  0x2c(%esp)
  10326b:	e8 c0 fd ff ff       	call   103030 <pmem_init>
  /**
   * TODO: compute the available quota and store it into the variable real_quota.
   * It should be the number of the unallocated pages with the normal permission
   * in the physical memory allocation table.
   */
  nps = get_nps();
  103270:	e8 2b fd ff ff       	call   102fa0 <get_nps>
  i = 1;
  while (i < nps) {
  103275:	83 c4 10             	add    $0x10,%esp
  103278:	83 f8 01             	cmp    $0x1,%eax
  10327b:	0f 86 85 00 00 00    	jbe    103306 <container_init+0xa6>
  103281:	89 c5                	mov    %eax,%ebp
  103283:	bb 01 00 00 00       	mov    $0x1,%ebx
  103288:	31 ff                	xor    %edi,%edi
  10328a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    norm = at_is_norm(i);
  103290:	83 ec 0c             	sub    $0xc,%esp
  103293:	53                   	push   %ebx
  103294:	e8 27 fd ff ff       	call   102fc0 <at_is_norm>
  103299:	89 c6                	mov    %eax,%esi
    used = at_is_allocated(i);
  10329b:	89 1c 24             	mov    %ebx,(%esp)
  10329e:	e8 5d fd ff ff       	call   103000 <at_is_allocated>
    if (norm == 1 && used == 0)
  1032a3:	83 c4 10             	add    $0x10,%esp
  1032a6:	83 fe 01             	cmp    $0x1,%esi
  1032a9:	75 0a                	jne    1032b5 <container_init+0x55>
  1032ab:	85 c0                	test   %eax,%eax
  1032ad:	0f 94 c0             	sete   %al
      real_quota++;
  1032b0:	3c 01                	cmp    $0x1,%al
  1032b2:	83 df ff             	sbb    $0xffffffff,%edi
    i++;
  1032b5:	83 c3 01             	add    $0x1,%ebx
   * It should be the number of the unallocated pages with the normal permission
   * in the physical memory allocation table.
   */
  nps = get_nps();
  i = 1;
  while (i < nps) {
  1032b8:	39 dd                	cmp    %ebx,%ebp
  1032ba:	75 d4                	jne    103290 <container_init+0x30>
  1032bc:	89 fb                	mov    %edi,%ebx
    used = at_is_allocated(i);
    if (norm == 1 && used == 0)
      real_quota++;
    i++;
  }
  KERN_DEBUG("\nreal quota: %d\n\n", real_quota);
  1032be:	57                   	push   %edi
  1032bf:	68 51 54 10 00       	push   $0x105451
  1032c4:	6a 2b                	push   $0x2b
  1032c6:	68 64 54 10 00       	push   $0x105464
  1032cb:	e8 3b eb ff ff       	call   101e0b <debug_normal>

  CONTAINER[0].quota = real_quota;
  1032d0:	89 1d 80 cf 92 00    	mov    %ebx,0x92cf80
  CONTAINER[0].usage = 0;
  1032d6:	c7 05 84 cf 92 00 00 	movl   $0x0,0x92cf84
  1032dd:	00 00 00 
  CONTAINER[0].parent = 0;
  1032e0:	c7 05 88 cf 92 00 00 	movl   $0x0,0x92cf88
  1032e7:	00 00 00 
  CONTAINER[0].nchildren = 0;
  1032ea:	c7 05 8c cf 92 00 00 	movl   $0x0,0x92cf8c
  1032f1:	00 00 00 
  CONTAINER[0].used = 1;
  1032f4:	c7 05 90 cf 92 00 01 	movl   $0x1,0x92cf90
  1032fb:	00 00 00 
}
  1032fe:	83 c4 1c             	add    $0x1c,%esp
  103301:	5b                   	pop    %ebx
  103302:	5e                   	pop    %esi
  103303:	5f                   	pop    %edi
  103304:	5d                   	pop    %ebp
  103305:	c3                   	ret    
   * It should be the number of the unallocated pages with the normal permission
   * in the physical memory allocation table.
   */
  nps = get_nps();
  i = 1;
  while (i < nps) {
  103306:	31 db                	xor    %ebx,%ebx
  unsigned int real_quota;
  // TODO: define your local variables here.
  unsigned int nps, i, norm, used;

  pmem_init(mbi_addr);
  real_quota = 0;
  103308:	31 ff                	xor    %edi,%edi
  10330a:	eb b2                	jmp    1032be <container_init+0x5e>
  10330c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103310 <container_get_parent>:
}


// get the id of parent process of process # [id]
unsigned int container_get_parent(unsigned int id)
{
  103310:	8b 44 24 04          	mov    0x4(%esp),%eax
  return CONTAINER[id].parent;
  103314:	8d 04 80             	lea    (%eax,%eax,4),%eax
  103317:	8b 04 85 88 cf 92 00 	mov    0x92cf88(,%eax,4),%eax
}
  10331e:	c3                   	ret    
  10331f:	90                   	nop

00103320 <container_get_nchildren>:


// get the number of children of process # [id]
unsigned int container_get_nchildren(unsigned int id)
{
  103320:	8b 44 24 04          	mov    0x4(%esp),%eax
  // TODO
  // return 0;
  return CONTAINER[id].nchildren;
  103324:	8d 04 80             	lea    (%eax,%eax,4),%eax
  103327:	8b 04 85 8c cf 92 00 	mov    0x92cf8c(,%eax,4),%eax
}
  10332e:	c3                   	ret    
  10332f:	90                   	nop

00103330 <container_get_quota>:


// get the maximum memory quota of process # [id]
unsigned int container_get_quota(unsigned int id)
{
  103330:	8b 44 24 04          	mov    0x4(%esp),%eax
  // TODO
  // return 0;
  return CONTAINER[id].quota;
  103334:	8d 04 80             	lea    (%eax,%eax,4),%eax
  103337:	8b 04 85 80 cf 92 00 	mov    0x92cf80(,%eax,4),%eax
}
  10333e:	c3                   	ret    
  10333f:	90                   	nop

00103340 <container_get_usage>:


// get the current memory usage of process # [id]
unsigned int container_get_usage(unsigned int id)
{
  103340:	8b 44 24 04          	mov    0x4(%esp),%eax
  // TODO
  // return 0;
  return CONTAINER[id].usage;
  103344:	8d 04 80             	lea    (%eax,%eax,4),%eax
  103347:	8b 04 85 84 cf 92 00 	mov    0x92cf84(,%eax,4),%eax
}
  10334e:	c3                   	ret    
  10334f:	90                   	nop

00103350 <container_can_consume>:


// determines whether the process # [id] can consume extra
// [n] pages of memory. If so, returns 1, o.w., returns 0.
unsigned int container_can_consume(unsigned int id, unsigned int n)
{
  103350:	8b 44 24 04          	mov    0x4(%esp),%eax
  // TODO
  // return 0;
  if (CONTAINER[id].usage + n > CONTAINER[id].quota) return 0;
  103354:	8d 04 80             	lea    (%eax,%eax,4),%eax
  103357:	c1 e0 02             	shl    $0x2,%eax
  10335a:	8b 90 84 cf 92 00    	mov    0x92cf84(%eax),%edx
  103360:	03 54 24 08          	add    0x8(%esp),%edx
  103364:	3b 90 80 cf 92 00    	cmp    0x92cf80(%eax),%edx
  10336a:	0f 96 c0             	setbe  %al
  10336d:	0f b6 c0             	movzbl %al,%eax
  return 1;
}
  103370:	c3                   	ret    
  103371:	eb 0d                	jmp    103380 <container_split>
  103373:	90                   	nop
  103374:	90                   	nop
  103375:	90                   	nop
  103376:	90                   	nop
  103377:	90                   	nop
  103378:	90                   	nop
  103379:	90                   	nop
  10337a:	90                   	nop
  10337b:	90                   	nop
  10337c:	90                   	nop
  10337d:	90                   	nop
  10337e:	90                   	nop
  10337f:	90                   	nop

00103380 <container_split>:
 * dedicates [quota] pages of memory for a new child process.
 * you can assume it is safe to allocate [quota] pages (i.e., the check is already done outside before calling this function)
 * returns the container index for the new child process.
 */
unsigned int container_split(unsigned int id, unsigned int quota)
{
  103380:	55                   	push   %ebp
  103381:	57                   	push   %edi
  103382:	56                   	push   %esi
  103383:	53                   	push   %ebx
  103384:	8b 54 24 14          	mov    0x14(%esp),%edx
  103388:	8b 6c 24 18          	mov    0x18(%esp),%ebp
  unsigned int child, nc;

  nc = CONTAINER[id].nchildren;
  10338c:	8d 04 92             	lea    (%edx,%edx,4),%eax
  10338f:	8d 0c 85 80 cf 92 00 	lea    0x92cf80(,%eax,4),%ecx
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process
  103396:	8d 44 52 01          	lea    0x1(%edx,%edx,2),%eax
 */
unsigned int container_split(unsigned int id, unsigned int quota)
{
  unsigned int child, nc;

  nc = CONTAINER[id].nchildren;
  10339a:	8b 59 0c             	mov    0xc(%ecx),%ebx
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process
  10339d:	01 d8                	add    %ebx,%eax
  CONTAINER[child].usage = 0;
  CONTAINER[child].parent = id;
  CONTAINER[child].nchildren = 0;

  CONTAINER[id].usage += quota;
  CONTAINER[id].nchildren = nc + 1;
  10339f:	83 c3 01             	add    $0x1,%ebx
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process

  /**
   * TODO: update the container structure of both parent and child process appropriately.
   */
  CONTAINER[child].used = 1;
  1033a2:	8d 3c 80             	lea    (%eax,%eax,4),%edi
  1033a5:	c1 e7 02             	shl    $0x2,%edi
  CONTAINER[child].quota = quota;
  CONTAINER[child].usage = 0;
  1033a8:	c7 87 84 cf 92 00 00 	movl   $0x0,0x92cf84(%edi)
  1033af:	00 00 00 
  CONTAINER[child].parent = id;
  CONTAINER[child].nchildren = 0;

  CONTAINER[id].usage += quota;
  1033b2:	01 69 04             	add    %ebp,0x4(%ecx)

  /**
   * TODO: update the container structure of both parent and child process appropriately.
   */
  CONTAINER[child].used = 1;
  CONTAINER[child].quota = quota;
  1033b5:	89 af 80 cf 92 00    	mov    %ebp,0x92cf80(%edi)
  CONTAINER[child].usage = 0;
  CONTAINER[child].parent = id;
  CONTAINER[child].nchildren = 0;
  1033bb:	c7 87 8c cf 92 00 00 	movl   $0x0,0x92cf8c(%edi)
  1033c2:	00 00 00 
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process

  /**
   * TODO: update the container structure of both parent and child process appropriately.
   */
  CONTAINER[child].used = 1;
  1033c5:	c7 87 90 cf 92 00 01 	movl   $0x1,0x92cf90(%edi)
  1033cc:	00 00 00 
  CONTAINER[child].usage = 0;
  CONTAINER[child].parent = id;
  CONTAINER[child].nchildren = 0;

  CONTAINER[id].usage += quota;
  CONTAINER[id].nchildren = nc + 1;
  1033cf:	89 59 0c             	mov    %ebx,0xc(%ecx)
   * TODO: update the container structure of both parent and child process appropriately.
   */
  CONTAINER[child].used = 1;
  CONTAINER[child].quota = quota;
  CONTAINER[child].usage = 0;
  CONTAINER[child].parent = id;
  1033d2:	89 97 88 cf 92 00    	mov    %edx,0x92cf88(%edi)

  CONTAINER[id].usage += quota;
  CONTAINER[id].nchildren = nc + 1;

  return child;
}
  1033d8:	5b                   	pop    %ebx
  1033d9:	5e                   	pop    %esi
  1033da:	5f                   	pop    %edi
  1033db:	5d                   	pop    %ebp
  1033dc:	c3                   	ret    
  1033dd:	8d 76 00             	lea    0x0(%esi),%esi

001033e0 <container_alloc>:
 * allocates one more page for process # [id], given that its usage would not exceed the quota.
 * the container structure should be updated accordingly after the allocation.
 * returns the page index of the allocated page, or 0 in the case of failure.
 */
unsigned int container_alloc(unsigned int id)
{
  1033e0:	8b 44 24 04          	mov    0x4(%esp),%eax
  /*
   * TODO: implement the function here.
   */
  // return 0;
  unsigned int u, q, i;
  u = CONTAINER[id].usage;
  1033e4:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1033e7:	c1 e0 02             	shl    $0x2,%eax
  1033ea:	8b 90 84 cf 92 00    	mov    0x92cf84(%eax),%edx
  q = CONTAINER[id].quota;
  if (u == q) return 0;
  1033f0:	3b 90 80 cf 92 00    	cmp    0x92cf80(%eax),%edx
  1033f6:	74 18                	je     103410 <container_alloc+0x30>

  CONTAINER[id].usage = u + 1;
  1033f8:	83 c2 01             	add    $0x1,%edx
  1033fb:	89 90 84 cf 92 00    	mov    %edx,0x92cf84(%eax)
  i = palloc();
  103401:	e9 aa fd ff ff       	jmp    1031b0 <palloc>
  103406:	8d 76 00             	lea    0x0(%esi),%esi
  103409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  return i;
}
  103410:	31 c0                	xor    %eax,%eax
  103412:	c3                   	ret    
  103413:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103420 <container_free>:

// frees the physical page and reduces the usage by 1.
void container_free(unsigned int id, unsigned int page_index)
{
  103420:	53                   	push   %ebx
  103421:	83 ec 14             	sub    $0x14,%esp
  103424:	8b 5c 24 20          	mov    0x20(%esp),%ebx
  // TODO
  if (at_is_allocated(page_index)) {
  103428:	53                   	push   %ebx
  103429:	e8 d2 fb ff ff       	call   103000 <at_is_allocated>
  10342e:	83 c4 10             	add    $0x10,%esp
  103431:	85 c0                	test   %eax,%eax
  103433:	75 0b                	jne    103440 <container_free+0x20>
    pfree(page_index);
    if (CONTAINER[id].usage > 0)
      CONTAINER[id].usage -= 1;
  }
}
  103435:	83 c4 08             	add    $0x8,%esp
  103438:	5b                   	pop    %ebx
  103439:	c3                   	ret    
  10343a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// frees the physical page and reduces the usage by 1.
void container_free(unsigned int id, unsigned int page_index)
{
  // TODO
  if (at_is_allocated(page_index)) {
    pfree(page_index);
  103440:	83 ec 0c             	sub    $0xc,%esp
  103443:	53                   	push   %ebx
  103444:	e8 f7 fd ff ff       	call   103240 <pfree>
    if (CONTAINER[id].usage > 0)
  103449:	8b 44 24 20          	mov    0x20(%esp),%eax
  10344d:	83 c4 10             	add    $0x10,%esp
  103450:	8d 04 80             	lea    (%eax,%eax,4),%eax
  103453:	8d 14 85 80 cf 92 00 	lea    0x92cf80(,%eax,4),%edx
  10345a:	8b 42 04             	mov    0x4(%edx),%eax
  10345d:	85 c0                	test   %eax,%eax
  10345f:	7e d4                	jle    103435 <container_free+0x15>
      CONTAINER[id].usage -= 1;
  103461:	83 e8 01             	sub    $0x1,%eax
  103464:	89 42 04             	mov    %eax,0x4(%edx)
  }
}
  103467:	83 c4 08             	add    $0x8,%esp
  10346a:	5b                   	pop    %ebx
  10346b:	c3                   	ret    
  10346c:	66 90                	xchg   %ax,%ax
  10346e:	66 90                	xchg   %ax,%ax

00103470 <set_pdir_base>:

// sets the CR3 register with the start address of the page structure for process # [index]
void set_pdir_base(unsigned int index)
{
    // TODO
	  set_cr3(PDirPool[index]);
  103470:	8b 44 24 04          	mov    0x4(%esp),%eax
  103474:	c1 e0 0c             	shl    $0xc,%eax
  103477:	05 00 30 db 00       	add    $0xdb3000,%eax
  10347c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103480:	e9 40 d7 ff ff       	jmp    100bc5 <set_cr3>
  103485:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103490 <get_pdir_entry>:
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
    // TODO
    // return 0;
    unsigned int pde;
    pde = (unsigned int)PDirPool[proc_index][pde_index];
  103490:	8b 44 24 04          	mov    0x4(%esp),%eax
  103494:	c1 e0 0a             	shl    $0xa,%eax
  103497:	03 44 24 08          	add    0x8(%esp),%eax
    return pde;
  10349b:	8b 04 85 00 30 db 00 	mov    0xdb3000(,%eax,4),%eax
}   
  1034a2:	c3                   	ret    
  1034a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1034a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001034b0 <set_pdir_entry>:
// sets specified page directory entry with the start address of physical page # [page_index].
// you should also set the permissions PTE_P, PTE_W, and PTE_U
void set_pdir_entry(unsigned int proc_index, unsigned int pde_index, unsigned int page_index)
{
    // TODO
    PDirPool[proc_index][pde_index] = (char *)(page_index * PAGESIZE + PT_PERM_PTU);
  1034b0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1034b4:	8b 54 24 0c          	mov    0xc(%esp),%edx
  1034b8:	c1 e0 0a             	shl    $0xa,%eax
  1034bb:	03 44 24 08          	add    0x8(%esp),%eax
  1034bf:	c1 e2 0c             	shl    $0xc,%edx
  1034c2:	83 c2 07             	add    $0x7,%edx
  1034c5:	89 14 85 00 30 db 00 	mov    %edx,0xdb3000(,%eax,4)
  1034cc:	c3                   	ret    
  1034cd:	8d 76 00             	lea    0x0(%esi),%esi

001034d0 <set_pdir_entry_identity>:
// you should also set the permissions PTE_P, PTE_W, and PTE_U
// this will be used to map the page directory entry to identity page table.
void set_pdir_entry_identity(unsigned int proc_index, unsigned int pde_index)
{   
    // TODO
    PDirPool[proc_index][pde_index] = ((char *)(IDPTbl[pde_index])) + PT_PERM_PTU;
  1034d0:	8b 54 24 04          	mov    0x4(%esp),%edx
// sets the page directory entry # [pde_index] for the process # [proc_index]
// with the initial address of page directory # [pde_index] in IDPTbl
// you should also set the permissions PTE_P, PTE_W, and PTE_U
// this will be used to map the page directory entry to identity page table.
void set_pdir_entry_identity(unsigned int proc_index, unsigned int pde_index)
{   
  1034d4:	8b 44 24 08          	mov    0x8(%esp),%eax
    // TODO
    PDirPool[proc_index][pde_index] = ((char *)(IDPTbl[pde_index])) + PT_PERM_PTU;
  1034d8:	c1 e2 0a             	shl    $0xa,%edx
  1034db:	01 c2                	add    %eax,%edx
  1034dd:	c1 e0 0c             	shl    $0xc,%eax
  1034e0:	05 07 30 9b 00       	add    $0x9b3007,%eax
  1034e5:	89 04 95 00 30 db 00 	mov    %eax,0xdb3000(,%edx,4)
  1034ec:	c3                   	ret    
  1034ed:	8d 76 00             	lea    0x0(%esi),%esi

001034f0 <rmv_pdir_entry>:
// removes specified page directory entry (set the page directory entry to 0).
// don't forget to cast the value to (char *).
void rmv_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
    // TODO
    PDirPool[proc_index][pde_index] = (char *)PT_PERM_UP;
  1034f0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1034f4:	c1 e0 0a             	shl    $0xa,%eax
  1034f7:	03 44 24 08          	add    0x8(%esp),%eax
  1034fb:	c7 04 85 00 30 db 00 	movl   $0x0,0xdb3000(,%eax,4)
  103502:	00 00 00 00 
  103506:	c3                   	ret    
  103507:	89 f6                	mov    %esi,%esi
  103509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103510 <get_ptbl_entry>:
unsigned int get_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{   
    // TODO
    // return 0;
    unsigned int addr;
    addr = ((unsigned int)PDirPool[proc_index][pde_index] & 0xfffff000) + pte_index * 4;
  103510:	8b 44 24 04          	mov    0x4(%esp),%eax
    return *((unsigned int *) addr);
  103514:	8b 54 24 0c          	mov    0xc(%esp),%edx
unsigned int get_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{   
    // TODO
    // return 0;
    unsigned int addr;
    addr = ((unsigned int)PDirPool[proc_index][pde_index] & 0xfffff000) + pte_index * 4;
  103518:	c1 e0 0a             	shl    $0xa,%eax
  10351b:	03 44 24 08          	add    0x8(%esp),%eax
  10351f:	8b 04 85 00 30 db 00 	mov    0xdb3000(,%eax,4),%eax
  103526:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    return *((unsigned int *) addr);
  10352b:	8b 04 90             	mov    (%eax,%edx,4),%eax
}
  10352e:	c3                   	ret    
  10352f:	90                   	nop

00103530 <set_ptbl_entry>:
// you should also set the given permission
void set_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index, unsigned int page_index, unsigned int perm)
{   
    // TODO
    unsigned int addr;
    addr = ((unsigned int)PDirPool[proc_index][pde_index] & 0xfffff000) + pte_index * 4;
  103530:	8b 44 24 04          	mov    0x4(%esp),%eax
    *((unsigned int *) addr) = page_index * PAGESIZE + perm;
  103534:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
// you should also set the given permission
void set_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index, unsigned int page_index, unsigned int perm)
{   
    // TODO
    unsigned int addr;
    addr = ((unsigned int)PDirPool[proc_index][pde_index] & 0xfffff000) + pte_index * 4;
  103538:	c1 e0 0a             	shl    $0xa,%eax
  10353b:	03 44 24 08          	add    0x8(%esp),%eax
  10353f:	8b 14 85 00 30 db 00 	mov    0xdb3000(,%eax,4),%edx
    *((unsigned int *) addr) = page_index * PAGESIZE + perm;
  103546:	8b 44 24 10          	mov    0x10(%esp),%eax
  10354a:	c1 e0 0c             	shl    $0xc,%eax
  10354d:	03 44 24 14          	add    0x14(%esp),%eax
// you should also set the given permission
void set_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index, unsigned int page_index, unsigned int perm)
{   
    // TODO
    unsigned int addr;
    addr = ((unsigned int)PDirPool[proc_index][pde_index] & 0xfffff000) + pte_index * 4;
  103551:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    *((unsigned int *) addr) = page_index * PAGESIZE + perm;
  103557:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
  10355a:	c3                   	ret    
  10355b:	90                   	nop
  10355c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103560 <set_ptbl_entry_identity>:
// sets the specified page table entry in IDPTbl as the identity map.
// you should also set the given permission
void set_ptbl_entry_identity(unsigned int pde_index, unsigned int pte_index, unsigned int perm)
{
    // TODO
    IDPTbl[pde_index][pte_index] = (pde_index * 1024 + pte_index) * PAGESIZE + perm;
  103560:	8b 44 24 04          	mov    0x4(%esp),%eax
  103564:	c1 e0 0a             	shl    $0xa,%eax
  103567:	03 44 24 08          	add    0x8(%esp),%eax
  10356b:	89 c2                	mov    %eax,%edx
  10356d:	c1 e2 0c             	shl    $0xc,%edx
  103570:	03 54 24 0c          	add    0xc(%esp),%edx
  103574:	89 14 85 00 30 9b 00 	mov    %edx,0x9b3000(,%eax,4)
  10357b:	c3                   	ret    
  10357c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103580 <rmv_ptbl_entry>:
// sets the specified page table entry to 0
void rmv_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{
    // TODO
    unsigned int addr;
    addr = ((unsigned int)PDirPool[proc_index][pde_index] & 0xfffff000) + pte_index * 4;
  103580:	8b 44 24 04          	mov    0x4(%esp),%eax
    *((unsigned int *) addr) = 0;
  103584:	8b 54 24 0c          	mov    0xc(%esp),%edx
// sets the specified page table entry to 0
void rmv_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{
    // TODO
    unsigned int addr;
    addr = ((unsigned int)PDirPool[proc_index][pde_index] & 0xfffff000) + pte_index * 4;
  103588:	c1 e0 0a             	shl    $0xa,%eax
  10358b:	03 44 24 08          	add    0x8(%esp),%eax
  10358f:	8b 04 85 00 30 db 00 	mov    0xdb3000(,%eax,4),%eax
  103596:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    *((unsigned int *) addr) = 0;
  10359b:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
  1035a2:	c3                   	ret    
  1035a3:	66 90                	xchg   %ax,%ax
  1035a5:	66 90                	xchg   %ax,%ax
  1035a7:	66 90                	xchg   %ax,%ax
  1035a9:	66 90                	xchg   %ax,%ax
  1035ab:	66 90                	xchg   %ax,%ax
  1035ad:	66 90                	xchg   %ax,%ax
  1035af:	90                   	nop

001035b0 <get_ptbl_entry_by_va>:
 * Returns the page table entry corresponding to the virtual address,
 * according to the page structure of process # [proc_index].
 * Returns 0 if the mapping does not exist.
 */
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  1035b0:	57                   	push   %edi
  1035b1:	56                   	push   %esi
  1035b2:	53                   	push   %ebx
  1035b3:	8b 5c 24 14          	mov    0x14(%esp),%ebx
  1035b7:	8b 74 24 10          	mov    0x10(%esp),%esi
    unsigned int pde_index;
    unsigned int pte_index;
    unsigned int ptbl_entry;
    unsigned int pde;
    pde_index = vaddr / (4096 * 1024);
    pde = get_pdir_entry(proc_index, pde_index);
  1035bb:	83 ec 08             	sub    $0x8,%esp
    // return 0;
    unsigned int pde_index;
    unsigned int pte_index;
    unsigned int ptbl_entry;
    unsigned int pde;
    pde_index = vaddr / (4096 * 1024);
  1035be:	89 df                	mov    %ebx,%edi
  1035c0:	c1 ef 16             	shr    $0x16,%edi
    pde = get_pdir_entry(proc_index, pde_index);
  1035c3:	57                   	push   %edi
  1035c4:	56                   	push   %esi
  1035c5:	e8 c6 fe ff ff       	call   103490 <get_pdir_entry>
    if (pde == 0)
  1035ca:	83 c4 10             	add    $0x10,%esp
  1035cd:	85 c0                	test   %eax,%eax
  1035cf:	74 17                	je     1035e8 <get_ptbl_entry_by_va+0x38>
      return 0;
    pte_index = (vaddr / 4096) % 1024;
  1035d1:	c1 eb 0c             	shr    $0xc,%ebx
    ptbl_entry = get_ptbl_entry(proc_index, pde_index, pte_index);
  1035d4:	83 ec 04             	sub    $0x4,%esp
    unsigned int pde;
    pde_index = vaddr / (4096 * 1024);
    pde = get_pdir_entry(proc_index, pde_index);
    if (pde == 0)
      return 0;
    pte_index = (vaddr / 4096) % 1024;
  1035d7:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
    ptbl_entry = get_ptbl_entry(proc_index, pde_index, pte_index);
  1035dd:	53                   	push   %ebx
  1035de:	57                   	push   %edi
  1035df:	56                   	push   %esi
  1035e0:	e8 2b ff ff ff       	call   103510 <get_ptbl_entry>
    return ptbl_entry;
  1035e5:	83 c4 10             	add    $0x10,%esp
}         
  1035e8:	5b                   	pop    %ebx
  1035e9:	5e                   	pop    %esi
  1035ea:	5f                   	pop    %edi
  1035eb:	c3                   	ret    
  1035ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001035f0 <get_pdir_entry_by_va>:
    // TODO
    // return 0;
    unsigned int pde_index;
    unsigned int page_index;
    pde_index = vaddr / (4096 * 1024);
    page_index = get_pdir_entry(proc_index, pde_index);
  1035f0:	c1 6c 24 08 16       	shrl   $0x16,0x8(%esp)
  1035f5:	e9 96 fe ff ff       	jmp    103490 <get_pdir_entry>
  1035fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00103600 <rmv_ptbl_entry_by_va>:
    return page_index;
}

// removes the page table entry for the given virtual address
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  103600:	83 ec 10             	sub    $0x10,%esp
  103603:	8b 44 24 18          	mov    0x18(%esp),%eax
    // TODO
    unsigned int pde_index;
    unsigned int pte_index;
    pde_index = vaddr / (4096 * 1024);
    pte_index = (vaddr / 4096) % 1024;
  103607:	89 c2                	mov    %eax,%edx
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
    // TODO
    unsigned int pde_index;
    unsigned int pte_index;
    pde_index = vaddr / (4096 * 1024);
  103609:	c1 e8 16             	shr    $0x16,%eax
    pte_index = (vaddr / 4096) % 1024;
  10360c:	c1 ea 0c             	shr    $0xc,%edx
  10360f:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
    rmv_ptbl_entry(proc_index, pde_index, pte_index);
  103615:	52                   	push   %edx
  103616:	50                   	push   %eax
  103617:	ff 74 24 1c          	pushl  0x1c(%esp)
  10361b:	e8 60 ff ff ff       	call   103580 <rmv_ptbl_entry>
}
  103620:	83 c4 1c             	add    $0x1c,%esp
  103623:	c3                   	ret    
  103624:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10362a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00103630 <rmv_pdir_entry_by_va>:
void rmv_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
    // TODO
    unsigned int pde_index;
    pde_index = vaddr / (4096 * 1024);
    rmv_pdir_entry(proc_index, pde_index);
  103630:	c1 6c 24 08 16       	shrl   $0x16,0x8(%esp)
  103635:	e9 b6 fe ff ff       	jmp    1034f0 <rmv_pdir_entry>
  10363a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00103640 <set_ptbl_entry_by_va>:
}

// maps the virtual address [vaddr] to the physical page # [page_index] with permission [perm]
// you do not need to worry about the page directory entry. just map the page table entry.
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index, unsigned int perm)
{
  103640:	83 ec 18             	sub    $0x18,%esp
  103643:	8b 44 24 20          	mov    0x20(%esp),%eax
    // TODO
    unsigned int pde_index;
    unsigned int pte_index;
    pde_index = vaddr / (4096 * 1024);
    pte_index = (vaddr / 4096) % 1024;
    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  103647:	ff 74 24 28          	pushl  0x28(%esp)
  10364b:	ff 74 24 28          	pushl  0x28(%esp)
{
    // TODO
    unsigned int pde_index;
    unsigned int pte_index;
    pde_index = vaddr / (4096 * 1024);
    pte_index = (vaddr / 4096) % 1024;
  10364f:	89 c2                	mov    %eax,%edx
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index, unsigned int perm)
{
    // TODO
    unsigned int pde_index;
    unsigned int pte_index;
    pde_index = vaddr / (4096 * 1024);
  103651:	c1 e8 16             	shr    $0x16,%eax
    pte_index = (vaddr / 4096) % 1024;
  103654:	c1 ea 0c             	shr    $0xc,%edx
  103657:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  10365d:	52                   	push   %edx
  10365e:	50                   	push   %eax
  10365f:	ff 74 24 2c          	pushl  0x2c(%esp)
  103663:	e8 c8 fe ff ff       	call   103530 <set_ptbl_entry>
}
  103668:	83 c4 2c             	add    $0x2c,%esp
  10366b:	c3                   	ret    
  10366c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103670 <set_pdir_entry_by_va>:
// registers the mapping from [vaddr] to physical page # [page_index] in the page directory
void set_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index)
{
    // TODO
    unsigned int pde_index;
    pde_index = vaddr / (4096 * 1024);
  103670:	8b 44 24 08          	mov    0x8(%esp),%eax
  103674:	c1 e8 16             	shr    $0x16,%eax
    set_pdir_entry(proc_index, pde_index, page_index);
  103677:	89 44 24 08          	mov    %eax,0x8(%esp)
  10367b:	e9 30 fe ff ff       	jmp    1034b0 <set_pdir_entry>

00103680 <idptbl_init>:

// initializes the identity page table
// the permission for the kernel memory should be PTE_P, PTE_W, and PTE_G,
// while the permission for the rest should be PTE_P and PTE_W.
void idptbl_init(unsigned int mbi_adr)
{
  103680:	57                   	push   %edi
  103681:	56                   	push   %esi
    unsigned int i, j;
    unsigned int perm;
    container_init(mbi_adr);

    // TODO
    i = 0;
  103682:	31 ff                	xor    %edi,%edi

// initializes the identity page table
// the permission for the kernel memory should be PTE_P, PTE_W, and PTE_G,
// while the permission for the rest should be PTE_P and PTE_W.
void idptbl_init(unsigned int mbi_adr)
{
  103684:	53                   	push   %ebx
    unsigned int i, j;
    unsigned int perm;
    container_init(mbi_adr);
  103685:	83 ec 0c             	sub    $0xc,%esp
  103688:	ff 74 24 1c          	pushl  0x1c(%esp)
  10368c:	e8 cf fb ff ff       	call   103260 <container_init>
  103691:	83 c4 10             	add    $0x10,%esp
  103694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

    // TODO
    i = 0;
    while(i < 1024)
    {
      if (i < 256 || i >= 960)
  103698:	8d 87 00 ff ff ff    	lea    -0x100(%edi),%eax
        perm = PTE_P | PTE_W | PTE_G;
      else
        perm = PTE_P | PTE_W;
  10369e:	3d c0 02 00 00       	cmp    $0x2c0,%eax
  1036a3:	19 f6                	sbb    %esi,%esi
      j = 0;
  1036a5:	31 db                	xor    %ebx,%ebx
    while(i < 1024)
    {
      if (i < 256 || i >= 960)
        perm = PTE_P | PTE_W | PTE_G;
      else
        perm = PTE_P | PTE_W;
  1036a7:	81 e6 00 ff ff ff    	and    $0xffffff00,%esi
  1036ad:	81 c6 03 01 00 00    	add    $0x103,%esi
  1036b3:	90                   	nop
  1036b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      j = 0;
      while(j < 1024)
      {
        set_ptbl_entry_identity(i, j, perm);
  1036b8:	83 ec 04             	sub    $0x4,%esp
  1036bb:	56                   	push   %esi
  1036bc:	53                   	push   %ebx
        j ++;
  1036bd:	83 c3 01             	add    $0x1,%ebx
      else
        perm = PTE_P | PTE_W;
      j = 0;
      while(j < 1024)
      {
        set_ptbl_entry_identity(i, j, perm);
  1036c0:	57                   	push   %edi
  1036c1:	e8 9a fe ff ff       	call   103560 <set_ptbl_entry_identity>
      if (i < 256 || i >= 960)
        perm = PTE_P | PTE_W | PTE_G;
      else
        perm = PTE_P | PTE_W;
      j = 0;
      while(j < 1024)
  1036c6:	83 c4 10             	add    $0x10,%esp
  1036c9:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
  1036cf:	75 e7                	jne    1036b8 <idptbl_init+0x38>
      {
        set_ptbl_entry_identity(i, j, perm);
        j ++;
      }
      i ++;
  1036d1:	83 c7 01             	add    $0x1,%edi
    unsigned int perm;
    container_init(mbi_adr);

    // TODO
    i = 0;
    while(i < 1024)
  1036d4:	81 ff 00 04 00 00    	cmp    $0x400,%edi
  1036da:	75 bc                	jne    103698 <idptbl_init+0x18>
        set_ptbl_entry_identity(i, j, perm);
        j ++;
      }
      i ++;
    }
}
  1036dc:	5b                   	pop    %ebx
  1036dd:	5e                   	pop    %esi
  1036de:	5f                   	pop    %edi
  1036df:	c3                   	ret    

001036e0 <pdir_init>:
 * For each process from id 0 to NUM_IDS -1,
 * set the page directory entries sothat the kernel portion of the map as identity map,
 * and the rest of page directories are unmmaped.
 */
void pdir_init(unsigned int mbi_adr)
{
  1036e0:	56                   	push   %esi
  1036e1:	53                   	push   %ebx
    unsigned int i, j;
    idptbl_init(mbi_adr);

    // TODO
    i = 0;
  1036e2:	31 f6                	xor    %esi,%esi
 * For each process from id 0 to NUM_IDS -1,
 * set the page directory entries sothat the kernel portion of the map as identity map,
 * and the rest of page directories are unmmaped.
 */
void pdir_init(unsigned int mbi_adr)
{
  1036e4:	83 ec 10             	sub    $0x10,%esp
    unsigned int i, j;
    idptbl_init(mbi_adr);
  1036e7:	ff 74 24 1c          	pushl  0x1c(%esp)
  1036eb:	e8 90 ff ff ff       	call   103680 <idptbl_init>
  1036f0:	83 c4 10             	add    $0x10,%esp
  1036f3:	90                   	nop
  1036f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 * For each process from id 0 to NUM_IDS -1,
 * set the page directory entries sothat the kernel portion of the map as identity map,
 * and the rest of page directories are unmmaped.
 */
void pdir_init(unsigned int mbi_adr)
{
  1036f8:	31 db                	xor    %ebx,%ebx
  1036fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while(i < NUM_IDS)
    {
        j = 0;
        while(j < 1024)    
        {
            if (j < 256 || j >= 960)    
  103700:	8d 83 00 ff ff ff    	lea    -0x100(%ebx),%eax
  103706:	3d bf 02 00 00       	cmp    $0x2bf,%eax
  10370b:	77 26                	ja     103733 <pdir_init+0x53>
              set_pdir_entry_identity(i, j);
            else
              rmv_pdir_entry(i, j);
  10370d:	83 ec 08             	sub    $0x8,%esp
  103710:	53                   	push   %ebx
  103711:	56                   	push   %esi
  103712:	e8 d9 fd ff ff       	call   1034f0 <rmv_pdir_entry>
  103717:	83 c4 10             	add    $0x10,%esp
            j++;
  10371a:	83 c3 01             	add    $0x1,%ebx
    // TODO
    i = 0;
    while(i < NUM_IDS)
    {
        j = 0;
        while(j < 1024)    
  10371d:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
  103723:	75 db                	jne    103700 <pdir_init+0x20>
              set_pdir_entry_identity(i, j);
            else
              rmv_pdir_entry(i, j);
            j++;
        }
        i++;
  103725:	83 c6 01             	add    $0x1,%esi
    unsigned int i, j;
    idptbl_init(mbi_adr);

    // TODO
    i = 0;
    while(i < NUM_IDS)
  103728:	83 fe 40             	cmp    $0x40,%esi
  10372b:	75 cb                	jne    1036f8 <pdir_init+0x18>
              rmv_pdir_entry(i, j);
            j++;
        }
        i++;
    }
}
  10372d:	83 c4 04             	add    $0x4,%esp
  103730:	5b                   	pop    %ebx
  103731:	5e                   	pop    %esi
  103732:	c3                   	ret    
    {
        j = 0;
        while(j < 1024)    
        {
            if (j < 256 || j >= 960)    
              set_pdir_entry_identity(i, j);
  103733:	83 ec 08             	sub    $0x8,%esp
  103736:	53                   	push   %ebx
  103737:	56                   	push   %esi
  103738:	e8 93 fd ff ff       	call   1034d0 <set_pdir_entry_identity>
  10373d:	83 c4 10             	add    $0x10,%esp
  103740:	eb d8                	jmp    10371a <pdir_init+0x3a>
  103742:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103750 <alloc_ptbl>:
 * and clears (set to 0) the whole page table entries for this newly mapped page table.
 * It returns the page index of the newly allocated physical page.
 * In the case when there's no physical page available, it returns 0.
 */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vadr)
{
  103750:	55                   	push   %ebp
  103751:	57                   	push   %edi
  103752:	56                   	push   %esi
  103753:	53                   	push   %ebx
  103754:	83 ec 18             	sub    $0x18,%esp
  103757:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  // TODO
  unsigned int i;
  unsigned int pi;
  unsigned int pde_index;
  pi = container_alloc(proc_index);
  10375b:	56                   	push   %esi
  10375c:	e8 7f fc ff ff       	call   1033e0 <container_alloc>
  if (pi != 0)
  103761:	83 c4 10             	add    $0x10,%esp
  103764:	85 c0                	test   %eax,%eax
{
  // TODO
  unsigned int i;
  unsigned int pi;
  unsigned int pde_index;
  pi = container_alloc(proc_index);
  103766:	89 c5                	mov    %eax,%ebp
  if (pi != 0)
  103768:	75 0e                	jne    103778 <alloc_ptbl+0x28>
      rmv_ptbl_entry(proc_index, pde_index, i);
      i ++;
    }     
  }       
  return pi;
}
  10376a:	83 c4 0c             	add    $0xc,%esp
  10376d:	89 e8                	mov    %ebp,%eax
  10376f:	5b                   	pop    %ebx
  103770:	5e                   	pop    %esi
  103771:	5f                   	pop    %edi
  103772:	5d                   	pop    %ebp
  103773:	c3                   	ret    
  103774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  unsigned int pi;
  unsigned int pde_index;
  pi = container_alloc(proc_index);
  if (pi != 0)
  {
    set_pdir_entry_by_va(proc_index, vadr, pi);
  103778:	83 ec 04             	sub    $0x4,%esp
    pde_index = vadr / (4096 * 1024);
    i = 0;
  10377b:	31 db                	xor    %ebx,%ebx
  unsigned int pi;
  unsigned int pde_index;
  pi = container_alloc(proc_index);
  if (pi != 0)
  {
    set_pdir_entry_by_va(proc_index, vadr, pi);
  10377d:	50                   	push   %eax
  10377e:	ff 74 24 2c          	pushl  0x2c(%esp)
  103782:	56                   	push   %esi
  103783:	e8 e8 fe ff ff       	call   103670 <set_pdir_entry_by_va>
    pde_index = vadr / (4096 * 1024);
  103788:	8b 7c 24 34          	mov    0x34(%esp),%edi
  10378c:	83 c4 10             	add    $0x10,%esp
  10378f:	c1 ef 16             	shr    $0x16,%edi
  103792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    i = 0;
    while (i < 1024)        
    {
      rmv_ptbl_entry(proc_index, pde_index, i);
  103798:	83 ec 04             	sub    $0x4,%esp
  10379b:	53                   	push   %ebx
  10379c:	57                   	push   %edi
      i ++;
  10379d:	83 c3 01             	add    $0x1,%ebx
    set_pdir_entry_by_va(proc_index, vadr, pi);
    pde_index = vadr / (4096 * 1024);
    i = 0;
    while (i < 1024)        
    {
      rmv_ptbl_entry(proc_index, pde_index, i);
  1037a0:	56                   	push   %esi
  1037a1:	e8 da fd ff ff       	call   103580 <rmv_ptbl_entry>
  if (pi != 0)
  {
    set_pdir_entry_by_va(proc_index, vadr, pi);
    pde_index = vadr / (4096 * 1024);
    i = 0;
    while (i < 1024)        
  1037a6:	83 c4 10             	add    $0x10,%esp
  1037a9:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
  1037af:	75 e7                	jne    103798 <alloc_ptbl+0x48>
      rmv_ptbl_entry(proc_index, pde_index, i);
      i ++;
    }     
  }       
  return pi;
}
  1037b1:	83 c4 0c             	add    $0xc,%esp
  1037b4:	89 e8                	mov    %ebp,%eax
  1037b6:	5b                   	pop    %ebx
  1037b7:	5e                   	pop    %esi
  1037b8:	5f                   	pop    %edi
  1037b9:	5d                   	pop    %ebp
  1037ba:	c3                   	ret    
  1037bb:	90                   	nop
  1037bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001037c0 <free_ptbl>:

// Reverse operation of alloc_ptbl.
// Removes corresponding page directory entry,
// and frees the page for the page table entries (with container_free).
void free_ptbl(unsigned int proc_index, unsigned int vadr)
{
  1037c0:	57                   	push   %edi
  1037c1:	56                   	push   %esi
  1037c2:	53                   	push   %ebx
  1037c3:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  1037c7:	8b 7c 24 14          	mov    0x14(%esp),%edi
  // TODO
  unsigned int pde;
  pde = get_pdir_entry_by_va(proc_index, vadr);
  1037cb:	83 ec 08             	sub    $0x8,%esp
  1037ce:	57                   	push   %edi
  1037cf:	53                   	push   %ebx
  1037d0:	e8 1b fe ff ff       	call   1035f0 <get_pdir_entry_by_va>
  1037d5:	89 c6                	mov    %eax,%esi
  rmv_pdir_entry_by_va(proc_index, vadr);
  1037d7:	58                   	pop    %eax
  1037d8:	5a                   	pop    %edx
  1037d9:	57                   	push   %edi
  1037da:	53                   	push   %ebx
  container_free(proc_index, pde / PAGESIZE);
  1037db:	c1 ee 0c             	shr    $0xc,%esi
void free_ptbl(unsigned int proc_index, unsigned int vadr)
{
  // TODO
  unsigned int pde;
  pde = get_pdir_entry_by_va(proc_index, vadr);
  rmv_pdir_entry_by_va(proc_index, vadr);
  1037de:	e8 4d fe ff ff       	call   103630 <rmv_pdir_entry_by_va>
  container_free(proc_index, pde / PAGESIZE);
  1037e3:	83 c4 10             	add    $0x10,%esp
  1037e6:	89 74 24 14          	mov    %esi,0x14(%esp)
  1037ea:	89 5c 24 10          	mov    %ebx,0x10(%esp)
}
  1037ee:	5b                   	pop    %ebx
  1037ef:	5e                   	pop    %esi
  1037f0:	5f                   	pop    %edi
{
  // TODO
  unsigned int pde;
  pde = get_pdir_entry_by_va(proc_index, vadr);
  rmv_pdir_entry_by_va(proc_index, vadr);
  container_free(proc_index, pde / PAGESIZE);
  1037f1:	e9 2a fc ff ff       	jmp    103420 <container_free>
  1037f6:	66 90                	xchg   %ax,%ax
  1037f8:	66 90                	xchg   %ax,%ax
  1037fa:	66 90                	xchg   %ax,%ax
  1037fc:	66 90                	xchg   %ax,%ax
  1037fe:	66 90                	xchg   %ax,%ax

00103800 <pdir_init_kern>:
/**
 * Sets the entire page map for process 0 as identity map.
 * Note that part of the task is already completed by pdir_init.
 */
void pdir_init_kern(unsigned int mbi_adr)
{
  103800:	53                   	push   %ebx
    unsigned int i;
    pdir_init(mbi_adr);
    
    //TODO
    i = 256;
  103801:	bb 00 01 00 00       	mov    $0x100,%ebx
/**
 * Sets the entire page map for process 0 as identity map.
 * Note that part of the task is already completed by pdir_init.
 */
void pdir_init_kern(unsigned int mbi_adr)
{
  103806:	83 ec 14             	sub    $0x14,%esp
    unsigned int i;
    pdir_init(mbi_adr);
  103809:	ff 74 24 1c          	pushl  0x1c(%esp)
  10380d:	e8 ce fe ff ff       	call   1036e0 <pdir_init>
  103812:	83 c4 10             	add    $0x10,%esp
  103815:	8d 76 00             	lea    0x0(%esi),%esi
    
    //TODO
    i = 256;
    while(i < 960)
    {
        set_pdir_entry_identity(0, i);
  103818:	83 ec 08             	sub    $0x8,%esp
  10381b:	53                   	push   %ebx
  10381c:	6a 00                	push   $0x0
        i ++;
  10381e:	83 c3 01             	add    $0x1,%ebx
    
    //TODO
    i = 256;
    while(i < 960)
    {
        set_pdir_entry_identity(0, i);
  103821:	e8 aa fc ff ff       	call   1034d0 <set_pdir_entry_identity>
    unsigned int i;
    pdir_init(mbi_adr);
    
    //TODO
    i = 256;
    while(i < 960)
  103826:	83 c4 10             	add    $0x10,%esp
  103829:	81 fb c0 03 00 00    	cmp    $0x3c0,%ebx
  10382f:	75 e7                	jne    103818 <pdir_init_kern+0x18>
    {
        set_pdir_entry_identity(0, i);
        i ++;
    }
}
  103831:	83 c4 08             	add    $0x8,%esp
  103834:	5b                   	pop    %ebx
  103835:	c3                   	ret    
  103836:	8d 76 00             	lea    0x0(%esi),%esi
  103839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103840 <map_page>:
 * In the case of error, it returns the constant MagicNumber defined in lib/x86.h,
 * otherwise, it returns the physical page index registered in the page directory,
 * e.g., the return value of get_pdir_entry_by_va or alloc_ptbl.
 */
unsigned int map_page(unsigned int proc_index, unsigned int vadr, unsigned int page_index, unsigned int perm)
{   
  103840:	56                   	push   %esi
  103841:	53                   	push   %ebx
  103842:	83 ec 1c             	sub    $0x1c,%esp
  103845:	8b 5c 24 28          	mov    0x28(%esp),%ebx
  103849:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  // TODO
  // return 0;
  unsigned int pdir_entry; 
  unsigned int result;
  pdir_entry = get_pdir_entry_by_va(proc_index, vadr);
  10384d:	56                   	push   %esi
  10384e:	53                   	push   %ebx
  10384f:	e8 9c fd ff ff       	call   1035f0 <get_pdir_entry_by_va>
  if (pdir_entry != 0)
  103854:	83 c4 10             	add    $0x10,%esp
  103857:	85 c0                	test   %eax,%eax
  103859:	74 2d                	je     103888 <map_page+0x48>
  {
    result = alloc_ptbl(proc_index, vadr);
    if (result == 0)
      result = MagicNumber;
  }
  if (result != MagicNumber)
  10385b:	3d 01 00 10 00       	cmp    $0x100001,%eax
  103860:	74 1a                	je     10387c <map_page+0x3c>
  103862:	89 44 24 0c          	mov    %eax,0xc(%esp)
    set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
  103866:	ff 74 24 2c          	pushl  0x2c(%esp)
  10386a:	ff 74 24 2c          	pushl  0x2c(%esp)
  10386e:	56                   	push   %esi
  10386f:	53                   	push   %ebx
  103870:	e8 cb fd ff ff       	call   103640 <set_ptbl_entry_by_va>
  103875:	83 c4 10             	add    $0x10,%esp
  103878:	8b 44 24 0c          	mov    0xc(%esp),%eax
  return result;
}
  10387c:	83 c4 14             	add    $0x14,%esp
  10387f:	5b                   	pop    %ebx
  103880:	5e                   	pop    %esi
  103881:	c3                   	ret    
  103882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  pdir_entry = get_pdir_entry_by_va(proc_index, vadr);
  if (pdir_entry != 0)
    result = pdir_entry;
  else
  {
    result = alloc_ptbl(proc_index, vadr);
  103888:	83 ec 08             	sub    $0x8,%esp
  10388b:	56                   	push   %esi
  10388c:	53                   	push   %ebx
  10388d:	e8 be fe ff ff       	call   103750 <alloc_ptbl>
    if (result == 0)
  103892:	83 c4 10             	add    $0x10,%esp
  103895:	85 c0                	test   %eax,%eax
  103897:	75 c2                	jne    10385b <map_page+0x1b>
      result = MagicNumber;
  }
  if (result != MagicNumber)
    set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
  return result;
}
  103899:	83 c4 14             	add    $0x14,%esp
    result = pdir_entry;
  else
  {
    result = alloc_ptbl(proc_index, vadr);
    if (result == 0)
      result = MagicNumber;
  10389c:	b8 01 00 10 00       	mov    $0x100001,%eax
  }
  if (result != MagicNumber)
    set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
  return result;
}
  1038a1:	5b                   	pop    %ebx
  1038a2:	5e                   	pop    %esi
  1038a3:	c3                   	ret    
  1038a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1038aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

001038b0 <unmap_page>:
 * Nothing should be done if the mapping no longer exists.
 * You do not need to unmap the page table from the page directory.
 * It should return the corresponding page table entry.
 */
unsigned int unmap_page(unsigned int proc_index, unsigned int vadr)
{
  1038b0:	56                   	push   %esi
  1038b1:	53                   	push   %ebx
  1038b2:	83 ec 1c             	sub    $0x1c,%esp
  1038b5:	8b 5c 24 28          	mov    0x28(%esp),%ebx
  1038b9:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  // TODO
  // return 0;
  unsigned int ptbl_entry;
  unsigned int count;
  ptbl_entry = get_ptbl_entry_by_va(proc_index, vadr);
  1038bd:	56                   	push   %esi
  1038be:	53                   	push   %ebx
  1038bf:	e8 ec fc ff ff       	call   1035b0 <get_ptbl_entry_by_va>
  if (ptbl_entry != 0)
  1038c4:	83 c4 10             	add    $0x10,%esp
  1038c7:	85 c0                	test   %eax,%eax
  1038c9:	74 15                	je     1038e0 <unmap_page+0x30>
  1038cb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    rmv_ptbl_entry_by_va(proc_index, vadr);
  1038cf:	83 ec 08             	sub    $0x8,%esp
  1038d2:	56                   	push   %esi
  1038d3:	53                   	push   %ebx
  1038d4:	e8 27 fd ff ff       	call   103600 <rmv_ptbl_entry_by_va>
  1038d9:	83 c4 10             	add    $0x10,%esp
  1038dc:	8b 44 24 0c          	mov    0xc(%esp),%eax
  return ptbl_entry;
}   
  1038e0:	83 c4 14             	add    $0x14,%esp
  1038e3:	5b                   	pop    %ebx
  1038e4:	5e                   	pop    %esi
  1038e5:	c3                   	ret    
  1038e6:	8d 76 00             	lea    0x0(%esi),%esi
  1038e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001038f0 <cpy_page>:

void cpy_page(unsigned int proc_index_source, unsigned int proc_index_copy) {
  1038f0:	55                   	push   %ebp
  1038f1:	57                   	push   %edi
  1038f2:	56                   	push   %esi
  1038f3:	53                   	push   %ebx
  1038f4:	bb 00 00 00 40       	mov    $0x40000000,%ebx
  1038f9:	83 ec 1c             	sub    $0x1c,%esp
  1038fc:	8b 74 24 30          	mov    0x30(%esp),%esi
  103900:	8d 83 00 00 40 00    	lea    0x400000(%ebx),%eax
  103906:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10390a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        for (int i = 256; i < 960; ++i)
        {
            for (int j = 0; j < 1024; ++j)
            {   
                unsigned int ptbl_entry = get_ptbl_entry_by_va(proc_index_source, (i << 22) + (j << 12));
  103910:	83 ec 08             	sub    $0x8,%esp
  103913:	53                   	push   %ebx
  103914:	56                   	push   %esi
  103915:	e8 96 fc ff ff       	call   1035b0 <get_ptbl_entry_by_va>
                // if (ptbl_entry != 0)
                
                  unsigned int page_index = ptbl_entry>>12;
  10391a:	89 c7                	mov    %eax,%edi
                  unsigned int perm = ptbl_entry & 0x00000fff| PTE_COW & (~PTE_W);
  10391c:	25 ff 07 00 00       	and    $0x7ff,%eax
  103921:	80 cc 08             	or     $0x8,%ah
            for (int j = 0; j < 1024; ++j)
            {   
                unsigned int ptbl_entry = get_ptbl_entry_by_va(proc_index_source, (i << 22) + (j << 12));
                // if (ptbl_entry != 0)
                
                  unsigned int page_index = ptbl_entry>>12;
  103924:	c1 ef 0c             	shr    $0xc,%edi
                  unsigned int perm = ptbl_entry & 0x00000fff| PTE_COW & (~PTE_W);
                  map_page(proc_index_source, (i << 22) + (j << 12), page_index, perm);
  103927:	50                   	push   %eax
  103928:	57                   	push   %edi
            {   
                unsigned int ptbl_entry = get_ptbl_entry_by_va(proc_index_source, (i << 22) + (j << 12));
                // if (ptbl_entry != 0)
                
                  unsigned int page_index = ptbl_entry>>12;
                  unsigned int perm = ptbl_entry & 0x00000fff| PTE_COW & (~PTE_W);
  103929:	89 c5                	mov    %eax,%ebp
                  map_page(proc_index_source, (i << 22) + (j << 12), page_index, perm);
  10392b:	53                   	push   %ebx
  10392c:	56                   	push   %esi
  10392d:	e8 0e ff ff ff       	call   103840 <map_page>
                  map_page(proc_index_copy, (i << 22) + (j << 12), page_index, perm);
  103932:	83 c4 20             	add    $0x20,%esp
  103935:	55                   	push   %ebp
  103936:	57                   	push   %edi
  103937:	53                   	push   %ebx
  103938:	ff 74 24 40          	pushl  0x40(%esp)
  10393c:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  103942:	e8 f9 fe ff ff       	call   103840 <map_page>
}   

void cpy_page(unsigned int proc_index_source, unsigned int proc_index_copy) {
        for (int i = 256; i < 960; ++i)
        {
            for (int j = 0; j < 1024; ++j)
  103947:	83 c4 10             	add    $0x10,%esp
  10394a:	39 5c 24 0c          	cmp    %ebx,0xc(%esp)
  10394e:	75 c0                	jne    103910 <cpy_page+0x20>
  103950:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    rmv_ptbl_entry_by_va(proc_index, vadr);
  return ptbl_entry;
}   

void cpy_page(unsigned int proc_index_source, unsigned int proc_index_copy) {
        for (int i = 256; i < 960; ++i)
  103954:	81 fb 00 00 00 f0    	cmp    $0xf0000000,%ebx
  10395a:	75 a4                	jne    103900 <cpy_page+0x10>
            
                
            }
        }
        
}
  10395c:	83 c4 1c             	add    $0x1c,%esp
  10395f:	5b                   	pop    %ebx
  103960:	5e                   	pop    %esi
  103961:	5f                   	pop    %edi
  103962:	5d                   	pop    %ebp
  103963:	c3                   	ret    
  103964:	66 90                	xchg   %ax,%ax
  103966:	66 90                	xchg   %ax,%ax
  103968:	66 90                	xchg   %ax,%ax
  10396a:	66 90                	xchg   %ax,%ax
  10396c:	66 90                	xchg   %ax,%ax
  10396e:	66 90                	xchg   %ax,%ax

00103970 <paging_init>:
 * Initializes the page structures,
 * move to the page structure # 0 (kernel).
 * and turn on the paging.
 */
void paging_init(unsigned int mbi_addr)
{
  103970:	83 ec 18             	sub    $0x18,%esp
	pdir_init_kern(mbi_addr);
  103973:	ff 74 24 1c          	pushl  0x1c(%esp)
  103977:	e8 84 fe ff ff       	call   103800 <pdir_init_kern>
	set_pdir_base(0);
  10397c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  103983:	e8 e8 fa ff ff       	call   103470 <set_pdir_base>
	enable_paging();
}
  103988:	83 c4 1c             	add    $0x1c,%esp
 */
void paging_init(unsigned int mbi_addr)
{
	pdir_init_kern(mbi_addr);
	set_pdir_base(0);
	enable_paging();
  10398b:	e9 45 d2 ff ff       	jmp    100bd5 <enable_paging>

00103990 <alloc_page>:
 * It should return the physical page index registered in the page directory, i.e., the
 * return value from map_page.
 * In the case of error, it should return the MagicNumber.
 */
unsigned int alloc_page (unsigned int proc_index, unsigned int vaddr, unsigned int perm)
{
  103990:	53                   	push   %ebx
  103991:	83 ec 14             	sub    $0x14,%esp
  103994:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
	// TODO
	// return 0;
	unsigned int pi;
	unsigned int result;
	pi = container_alloc (proc_index);
  103998:	53                   	push   %ebx
  103999:	e8 42 fa ff ff       	call   1033e0 <container_alloc>

	if (pi == 0)
  10399e:	83 c4 10             	add    $0x10,%esp
  1039a1:	85 c0                	test   %eax,%eax
  1039a3:	ba 01 00 10 00       	mov    $0x100001,%edx
  1039a8:	75 0e                	jne    1039b8 <alloc_page+0x28>
		result = MagicNumber;
	else
		result = map_page (proc_index, vaddr, pi, perm);

	return result;
}
  1039aa:	83 c4 08             	add    $0x8,%esp
  1039ad:	89 d0                	mov    %edx,%eax
  1039af:	5b                   	pop    %ebx
  1039b0:	c3                   	ret    
  1039b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	pi = container_alloc (proc_index);

	if (pi == 0)
		result = MagicNumber;
	else
		result = map_page (proc_index, vaddr, pi, perm);
  1039b8:	ff 74 24 18          	pushl  0x18(%esp)
  1039bc:	50                   	push   %eax
  1039bd:	ff 74 24 1c          	pushl  0x1c(%esp)
  1039c1:	53                   	push   %ebx
  1039c2:	e8 79 fe ff ff       	call   103840 <map_page>
  1039c7:	83 c4 10             	add    $0x10,%esp
  1039ca:	89 c2                	mov    %eax,%edx

	return result;
}
  1039cc:	83 c4 08             	add    $0x8,%esp
  1039cf:	89 d0                	mov    %edx,%eax
  1039d1:	5b                   	pop    %ebx
  1039d2:	c3                   	ret    
  1039d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1039d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001039e0 <alloc_mem_quota>:
 * Designate some memory quota for the next child process.
 */
unsigned int alloc_mem_quota (unsigned int id, unsigned int quota)
{
	unsigned int child;
	child = container_split (id, quota);
  1039e0:	e9 9b f9 ff ff       	jmp    103380 <container_split>
  1039e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1039e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001039f0 <cpy_cow>:
	return child;
}

void cpy_cow(unsigned int PID, unsigned int vaddr) {
  1039f0:	57                   	push   %edi
  1039f1:	56                   	push   %esi
  1039f2:	53                   	push   %ebx
  1039f3:	8b 74 24 10          	mov    0x10(%esp),%esi
  1039f7:	8b 7c 24 14          	mov    0x14(%esp),%edi
	unsigned int old_page_index = get_ptbl_entry_by_va(PID, vaddr);
  1039fb:	83 ec 08             	sub    $0x8,%esp
  1039fe:	57                   	push   %edi
  1039ff:	56                   	push   %esi
  103a00:	e8 ab fb ff ff       	call   1035b0 <get_ptbl_entry_by_va>
    unsigned int n_phy_page_index = alloc_page(PID, vaddr, PTE_COW);
  103a05:	83 c4 0c             	add    $0xc,%esp
	child = container_split (id, quota);
	return child;
}

void cpy_cow(unsigned int PID, unsigned int vaddr) {
	unsigned int old_page_index = get_ptbl_entry_by_va(PID, vaddr);
  103a08:	89 c3                	mov    %eax,%ebx
    unsigned int n_phy_page_index = alloc_page(PID, vaddr, PTE_COW);
  103a0a:	68 00 08 00 00       	push   $0x800
  103a0f:	57                   	push   %edi
    memcpy((char *)(n_phy_page_index * 4096), (char *)(old_page_index & 0xfffff000), 4096);
  103a10:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
	return child;
}

void cpy_cow(unsigned int PID, unsigned int vaddr) {
	unsigned int old_page_index = get_ptbl_entry_by_va(PID, vaddr);
    unsigned int n_phy_page_index = alloc_page(PID, vaddr, PTE_COW);
  103a16:	56                   	push   %esi
  103a17:	e8 74 ff ff ff       	call   103990 <alloc_page>
    memcpy((char *)(n_phy_page_index * 4096), (char *)(old_page_index & 0xfffff000), 4096);
  103a1c:	83 c4 0c             	add    $0xc,%esp
  103a1f:	c1 e0 0c             	shl    $0xc,%eax
  103a22:	68 00 10 00 00       	push   $0x1000
  103a27:	53                   	push   %ebx
  103a28:	50                   	push   %eax
  103a29:	e8 c1 e2 ff ff       	call   101cef <memcpy>
}
  103a2e:	83 c4 10             	add    $0x10,%esp
  103a31:	5b                   	pop    %ebx
  103a32:	5e                   	pop    %esi
  103a33:	5f                   	pop    %edi
  103a34:	c3                   	ret    
  103a35:	66 90                	xchg   %ax,%ax
  103a37:	66 90                	xchg   %ax,%ax
  103a39:	66 90                	xchg   %ax,%ax
  103a3b:	66 90                	xchg   %ax,%ax
  103a3d:	66 90                	xchg   %ax,%ax
  103a3f:	90                   	nop

00103a40 <kctx_set_esp>:

//places to save the [NUM_IDS] kernel thread states.
struct kctx kctx_pool[NUM_IDS];

void kctx_set_esp(unsigned int pid, void *esp)
{
  103a40:	8b 44 24 04          	mov    0x4(%esp),%eax
	kctx_pool[pid].esp = esp;
  103a44:	8b 54 24 08          	mov    0x8(%esp),%edx
  103a48:	8d 04 40             	lea    (%eax,%eax,2),%eax
  103a4b:	89 14 c5 00 30 df 00 	mov    %edx,0xdf3000(,%eax,8)
  103a52:	c3                   	ret    
  103a53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103a60 <kctx_set_eip>:
}

void kctx_set_eip(unsigned int pid, void *eip)
{
  103a60:	8b 44 24 04          	mov    0x4(%esp),%eax
	kctx_pool[pid].eip = eip;
  103a64:	8b 54 24 08          	mov    0x8(%esp),%edx
  103a68:	8d 04 40             	lea    (%eax,%eax,2),%eax
  103a6b:	89 14 c5 14 30 df 00 	mov    %edx,0xdf3014(,%eax,8)
  103a72:	c3                   	ret    
  103a73:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103a80 <kctx_switch>:
/**
 * Saves the states for thread # [from_pid] and restores the states
 * for thread # [to_pid].
 */
void kctx_switch(unsigned int from_pid, unsigned int to_pid)
{
  103a80:	8b 44 24 04          	mov    0x4(%esp),%eax
  103a84:	8b 54 24 08          	mov    0x8(%esp),%edx
	cswitch(&kctx_pool[from_pid], &kctx_pool[to_pid]);
  103a88:	8d 04 40             	lea    (%eax,%eax,2),%eax
  103a8b:	8d 14 52             	lea    (%edx,%edx,2),%edx
  103a8e:	8d 04 c5 00 30 df 00 	lea    0xdf3000(,%eax,8),%eax
  103a95:	8d 14 d5 00 30 df 00 	lea    0xdf3000(,%edx,8),%edx
  103a9c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103aa0:	89 54 24 08          	mov    %edx,0x8(%esp)
  103aa4:	e9 00 00 00 00       	jmp    103aa9 <cswitch>

00103aa9 <cswitch>:
 * void cswitch(struct kctx *from, struct kctx *to);
 */

	.globl cswitch
cswitch:
	movl	  4(%esp), %eax	/* %eax <- from */
  103aa9:	8b 44 24 04          	mov    0x4(%esp),%eax
	movl	  8(%esp), %edx	/* %edx <- to */
  103aad:	8b 54 24 08          	mov    0x8(%esp),%edx

	/* TODO: save the old kernel context */
	
    movl 	  %esp,0(%eax)
  103ab1:	89 20                	mov    %esp,(%eax)
	movl      %edi,4(%eax)
  103ab3:	89 78 04             	mov    %edi,0x4(%eax)
    movl       %esi,8(%eax)
  103ab6:	89 70 08             	mov    %esi,0x8(%eax)
    movl      %ebx,12(%eax)
  103ab9:	89 58 0c             	mov    %ebx,0xc(%eax)
    movl      %ebp,16(%eax)
  103abc:	89 68 10             	mov    %ebp,0x10(%eax)
    movl      0(%esp),%ecx
  103abf:	8b 0c 24             	mov    (%esp),%ecx
    movl	  %ecx,20(%eax)
  103ac2:	89 48 14             	mov    %ecx,0x14(%eax)

	/* TODO: load the new kernel context */
	movl	  0(%edx), %esp
  103ac5:	8b 22                	mov    (%edx),%esp
	
	movl       4(%edx),%edi
  103ac7:	8b 7a 04             	mov    0x4(%edx),%edi
    movl       8(%edx),%esi
  103aca:	8b 72 08             	mov    0x8(%edx),%esi
    movl      12(%edx),%ebx
  103acd:	8b 5a 0c             	mov    0xc(%edx),%ebx
    movl      16(%edx),%ebp
  103ad0:	8b 6a 10             	mov    0x10(%edx),%ebp
    movl 	  20(%edx),%ecx
  103ad3:	8b 4a 14             	mov    0x14(%edx),%ecx
    movl	  %ecx,0(%esp)
  103ad6:	89 0c 24             	mov    %ecx,(%esp)
    xor       %ecx,%ecx
  103ad9:	31 c9                	xor    %ecx,%ecx

	xor     %eax, %eax
  103adb:	31 c0                	xor    %eax,%eax
	ret
  103add:	c3                   	ret    
  103ade:	66 90                	xchg   %ax,%ax

00103ae0 <kctx_new>:
 * Don't forget the stack is going down from high address to low.
 * We do not care about the rest of states when a new thread starts.
 * The function returns the child thread (process) id.
 */
unsigned int kctx_new(void *entry, unsigned int id, unsigned int quota)
{
  103ae0:	56                   	push   %esi
  103ae1:	53                   	push   %ebx
  103ae2:	83 ec 0c             	sub    $0xc,%esp
  103ae5:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  // TODO
  unsigned int cid = alloc_mem_quota(id, quota);
  103ae9:	ff 74 24 20          	pushl  0x20(%esp)
  103aed:	53                   	push   %ebx
  kctx_set_eip(cid, entry);
  kctx_set_esp(cid, STACK_LOC[id]);
  103aee:	c1 e3 0c             	shl    $0xc,%ebx
  103af1:	81 c3 00 f0 96 00    	add    $0x96f000,%ebx
 * The function returns the child thread (process) id.
 */
unsigned int kctx_new(void *entry, unsigned int id, unsigned int quota)
{
  // TODO
  unsigned int cid = alloc_mem_quota(id, quota);
  103af7:	e8 e4 fe ff ff       	call   1039e0 <alloc_mem_quota>
  103afc:	89 c6                	mov    %eax,%esi
  kctx_set_eip(cid, entry);
  103afe:	58                   	pop    %eax
  103aff:	5a                   	pop    %edx
  103b00:	ff 74 24 18          	pushl  0x18(%esp)
  103b04:	56                   	push   %esi
  103b05:	e8 56 ff ff ff       	call   103a60 <kctx_set_eip>
  kctx_set_esp(cid, STACK_LOC[id]);
  103b0a:	59                   	pop    %ecx
  103b0b:	58                   	pop    %eax
  103b0c:	53                   	push   %ebx
  103b0d:	56                   	push   %esi
  103b0e:	e8 2d ff ff ff       	call   103a40 <kctx_set_esp>
  
  return cid;
}
  103b13:	83 c4 14             	add    $0x14,%esp
  103b16:	89 f0                	mov    %esi,%eax
  103b18:	5b                   	pop    %ebx
  103b19:	5e                   	pop    %esi
  103b1a:	c3                   	ret    
  103b1b:	66 90                	xchg   %ax,%ax
  103b1d:	66 90                	xchg   %ax,%ax
  103b1f:	90                   	nop

00103b20 <tcb_get_state>:

struct TCB TCBPool[NUM_IDS];


unsigned int tcb_get_state(unsigned int pid)
{
  103b20:	8b 44 24 04          	mov    0x4(%esp),%eax
	return TCBPool[pid].state;
  103b24:	8d 04 40             	lea    (%eax,%eax,2),%eax
  103b27:	8b 04 85 00 36 df 00 	mov    0xdf3600(,%eax,4),%eax
}
  103b2e:	c3                   	ret    
  103b2f:	90                   	nop

00103b30 <tcb_set_state>:

void tcb_set_state(unsigned int pid, unsigned int state)
{
  103b30:	8b 44 24 04          	mov    0x4(%esp),%eax
	TCBPool[pid].state = state;
  103b34:	8b 54 24 08          	mov    0x8(%esp),%edx
  103b38:	8d 04 40             	lea    (%eax,%eax,2),%eax
  103b3b:	89 14 85 00 36 df 00 	mov    %edx,0xdf3600(,%eax,4)
  103b42:	c3                   	ret    
  103b43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103b50 <tcb_get_prev>:
}

unsigned int tcb_get_prev(unsigned int pid)
{
  103b50:	8b 44 24 04          	mov    0x4(%esp),%eax
	return TCBPool[pid].prev;
  103b54:	8d 04 40             	lea    (%eax,%eax,2),%eax
  103b57:	8b 04 85 04 36 df 00 	mov    0xdf3604(,%eax,4),%eax
}
  103b5e:	c3                   	ret    
  103b5f:	90                   	nop

00103b60 <tcb_set_prev>:

void tcb_set_prev(unsigned int pid, unsigned int prev_pid)
{
  103b60:	8b 44 24 04          	mov    0x4(%esp),%eax
	TCBPool[pid].prev = prev_pid;
  103b64:	8b 54 24 08          	mov    0x8(%esp),%edx
  103b68:	8d 04 40             	lea    (%eax,%eax,2),%eax
  103b6b:	89 14 85 04 36 df 00 	mov    %edx,0xdf3604(,%eax,4)
  103b72:	c3                   	ret    
  103b73:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103b80 <tcb_get_next>:
}

unsigned int tcb_get_next(unsigned int pid)
{
  103b80:	8b 44 24 04          	mov    0x4(%esp),%eax
	return TCBPool[pid].next;
  103b84:	8d 04 40             	lea    (%eax,%eax,2),%eax
  103b87:	8b 04 85 08 36 df 00 	mov    0xdf3608(,%eax,4),%eax
}
  103b8e:	c3                   	ret    
  103b8f:	90                   	nop

00103b90 <tcb_set_next>:

void tcb_set_next(unsigned int pid, unsigned int next_pid)
{
  103b90:	8b 44 24 04          	mov    0x4(%esp),%eax
	TCBPool[pid].next = next_pid;
  103b94:	8b 54 24 08          	mov    0x8(%esp),%edx
  103b98:	8d 04 40             	lea    (%eax,%eax,2),%eax
  103b9b:	89 14 85 08 36 df 00 	mov    %edx,0xdf3608(,%eax,4)
  103ba2:	c3                   	ret    
  103ba3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103bb0 <tcb_init_at_id>:
}

void tcb_init_at_id(unsigned int pid)
{
  103bb0:	8b 44 24 04          	mov    0x4(%esp),%eax
	TCBPool[pid].state = TSTATE_DEAD;
  103bb4:	8d 04 40             	lea    (%eax,%eax,2),%eax
  103bb7:	c1 e0 02             	shl    $0x2,%eax
  103bba:	c7 80 00 36 df 00 03 	movl   $0x3,0xdf3600(%eax)
  103bc1:	00 00 00 
	TCBPool[pid].prev = NUM_IDS;
  103bc4:	c7 80 04 36 df 00 40 	movl   $0x40,0xdf3604(%eax)
  103bcb:	00 00 00 
	TCBPool[pid].next = NUM_IDS;
  103bce:	c7 80 08 36 df 00 40 	movl   $0x40,0xdf3608(%eax)
  103bd5:	00 00 00 
  103bd8:	c3                   	ret    
  103bd9:	66 90                	xchg   %ax,%ax
  103bdb:	66 90                	xchg   %ax,%ax
  103bdd:	66 90                	xchg   %ax,%ax
  103bdf:	90                   	nop

00103be0 <tcb_init>:
/**
 * Initializes the TCB for all NUM_IDS threads with the
 * state TSTATE_DEAD, and with two indices being NUM_IDS (which represents NULL).
 */
void tcb_init(unsigned int mbi_addr)
{
  103be0:	53                   	push   %ebx
  // TODO: define your local variables here.

	paging_init(mbi_addr);
	unsigned int i;
	for (i = 0; i < NUM_IDS; ++i)
  103be1:	31 db                	xor    %ebx,%ebx
/**
 * Initializes the TCB for all NUM_IDS threads with the
 * state TSTATE_DEAD, and with two indices being NUM_IDS (which represents NULL).
 */
void tcb_init(unsigned int mbi_addr)
{
  103be3:	83 ec 14             	sub    $0x14,%esp
  // TODO: define your local variables here.

	paging_init(mbi_addr);
  103be6:	ff 74 24 1c          	pushl  0x1c(%esp)
  103bea:	e8 81 fd ff ff       	call   103970 <paging_init>
  103bef:	83 c4 10             	add    $0x10,%esp
  103bf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	unsigned int i;
	for (i = 0; i < NUM_IDS; ++i)
	{
		tcb_init_at_id(i);
  103bf8:	83 ec 0c             	sub    $0xc,%esp
  103bfb:	53                   	push   %ebx
{
  // TODO: define your local variables here.

	paging_init(mbi_addr);
	unsigned int i;
	for (i = 0; i < NUM_IDS; ++i)
  103bfc:	83 c3 01             	add    $0x1,%ebx
	{
		tcb_init_at_id(i);
  103bff:	e8 ac ff ff ff       	call   103bb0 <tcb_init_at_id>
{
  // TODO: define your local variables here.

	paging_init(mbi_addr);
	unsigned int i;
	for (i = 0; i < NUM_IDS; ++i)
  103c04:	83 c4 10             	add    $0x10,%esp
  103c07:	83 fb 40             	cmp    $0x40,%ebx
  103c0a:	75 ec                	jne    103bf8 <tcb_init+0x18>
	{
		tcb_init_at_id(i);
	}
  // TODO
}
  103c0c:	83 c4 08             	add    $0x8,%esp
  103c0f:	5b                   	pop    %ebx
  103c10:	c3                   	ret    
  103c11:	66 90                	xchg   %ax,%ax
  103c13:	66 90                	xchg   %ax,%ax
  103c15:	66 90                	xchg   %ax,%ax
  103c17:	66 90                	xchg   %ax,%ax
  103c19:	66 90                	xchg   %ax,%ax
  103c1b:	66 90                	xchg   %ax,%ax
  103c1d:	66 90                	xchg   %ax,%ax
  103c1f:	90                   	nop

00103c20 <tqueue_get_head>:
 */
struct TQueue TQueuePool[NUM_IDS + 1];

unsigned int tqueue_get_head(unsigned int chid)
{
	return TQueuePool[chid].head;
  103c20:	8b 44 24 04          	mov    0x4(%esp),%eax
  103c24:	8b 04 c5 00 39 df 00 	mov    0xdf3900(,%eax,8),%eax
}
  103c2b:	c3                   	ret    
  103c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103c30 <tqueue_set_head>:

void tqueue_set_head(unsigned int chid, unsigned int head)
{
	TQueuePool[chid].head = head;
  103c30:	8b 54 24 08          	mov    0x8(%esp),%edx
  103c34:	8b 44 24 04          	mov    0x4(%esp),%eax
  103c38:	89 14 c5 00 39 df 00 	mov    %edx,0xdf3900(,%eax,8)
  103c3f:	c3                   	ret    

00103c40 <tqueue_get_tail>:
}

unsigned int tqueue_get_tail(unsigned int chid)
{
	return TQueuePool[chid].tail;
  103c40:	8b 44 24 04          	mov    0x4(%esp),%eax
  103c44:	8b 04 c5 04 39 df 00 	mov    0xdf3904(,%eax,8),%eax
}
  103c4b:	c3                   	ret    
  103c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103c50 <tqueue_set_tail>:

void tqueue_set_tail(unsigned int chid, unsigned int tail)
{
	TQueuePool[chid].tail = tail;
  103c50:	8b 54 24 08          	mov    0x8(%esp),%edx
  103c54:	8b 44 24 04          	mov    0x4(%esp),%eax
  103c58:	89 14 c5 04 39 df 00 	mov    %edx,0xdf3904(,%eax,8)
  103c5f:	c3                   	ret    

00103c60 <tqueue_init_at_id>:
}

void tqueue_init_at_id(unsigned int chid)
{
  103c60:	8b 44 24 04          	mov    0x4(%esp),%eax
	TQueuePool[chid].head = NUM_IDS;
  103c64:	c7 04 c5 00 39 df 00 	movl   $0x40,0xdf3900(,%eax,8)
  103c6b:	40 00 00 00 
	TQueuePool[chid].tail = NUM_IDS;
  103c6f:	c7 04 c5 04 39 df 00 	movl   $0x40,0xdf3904(,%eax,8)
  103c76:	40 00 00 00 
  103c7a:	c3                   	ret    
  103c7b:	66 90                	xchg   %ax,%ax
  103c7d:	66 90                	xchg   %ax,%ax
  103c7f:	90                   	nop

00103c80 <tqueue_init>:
/**
 * Initializes all the thread queues with
 * tqueue_init_at_id.
 */
void tqueue_init(unsigned int mbi_addr)
{
  103c80:	53                   	push   %ebx
  // TODO: define your local variables here.

	tcb_init(mbi_addr);
	unsigned int i;
	for (i = 0; i < NUM_IDS + 1; ++i)
  103c81:	31 db                	xor    %ebx,%ebx
/**
 * Initializes all the thread queues with
 * tqueue_init_at_id.
 */
void tqueue_init(unsigned int mbi_addr)
{
  103c83:	83 ec 14             	sub    $0x14,%esp
  // TODO: define your local variables here.

	tcb_init(mbi_addr);
  103c86:	ff 74 24 1c          	pushl  0x1c(%esp)
  103c8a:	e8 51 ff ff ff       	call   103be0 <tcb_init>
  103c8f:	83 c4 10             	add    $0x10,%esp
  103c92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	unsigned int i;
	for (i = 0; i < NUM_IDS + 1; ++i)
	{
		tqueue_init_at_id(i);
  103c98:	83 ec 0c             	sub    $0xc,%esp
  103c9b:	53                   	push   %ebx
{
  // TODO: define your local variables here.

	tcb_init(mbi_addr);
	unsigned int i;
	for (i = 0; i < NUM_IDS + 1; ++i)
  103c9c:	83 c3 01             	add    $0x1,%ebx
	{
		tqueue_init_at_id(i);
  103c9f:	e8 bc ff ff ff       	call   103c60 <tqueue_init_at_id>
{
  // TODO: define your local variables here.

	tcb_init(mbi_addr);
	unsigned int i;
	for (i = 0; i < NUM_IDS + 1; ++i)
  103ca4:	83 c4 10             	add    $0x10,%esp
  103ca7:	83 fb 41             	cmp    $0x41,%ebx
  103caa:	75 ec                	jne    103c98 <tqueue_init+0x18>
	{
		tqueue_init_at_id(i);
	}
	
}
  103cac:	83 c4 08             	add    $0x8,%esp
  103caf:	5b                   	pop    %ebx
  103cb0:	c3                   	ret    
  103cb1:	eb 0d                	jmp    103cc0 <tqueue_enqueue>
  103cb3:	90                   	nop
  103cb4:	90                   	nop
  103cb5:	90                   	nop
  103cb6:	90                   	nop
  103cb7:	90                   	nop
  103cb8:	90                   	nop
  103cb9:	90                   	nop
  103cba:	90                   	nop
  103cbb:	90                   	nop
  103cbc:	90                   	nop
  103cbd:	90                   	nop
  103cbe:	90                   	nop
  103cbf:	90                   	nop

00103cc0 <tqueue_enqueue>:
 * Recall that the doubly linked list is index based.
 * So you only need to insert the index.
 * Hint: there are multiple cases in this function.
 */
void tqueue_enqueue(unsigned int chid, unsigned int pid)
{	
  103cc0:	57                   	push   %edi
  103cc1:	56                   	push   %esi
  103cc2:	53                   	push   %ebx
  103cc3:	8b 7c 24 10          	mov    0x10(%esp),%edi
  103cc7:	8b 5c 24 14          	mov    0x14(%esp),%ebx
	
	unsigned int old_tail =  tqueue_get_tail(chid);
  103ccb:	83 ec 0c             	sub    $0xc,%esp
  103cce:	57                   	push   %edi
  103ccf:	e8 6c ff ff ff       	call   103c40 <tqueue_get_tail>

	tcb_set_next(old_tail, pid);
  103cd4:	5a                   	pop    %edx
  103cd5:	59                   	pop    %ecx
  103cd6:	53                   	push   %ebx
  103cd7:	50                   	push   %eax
 * Hint: there are multiple cases in this function.
 */
void tqueue_enqueue(unsigned int chid, unsigned int pid)
{	
	
	unsigned int old_tail =  tqueue_get_tail(chid);
  103cd8:	89 c6                	mov    %eax,%esi

	tcb_set_next(old_tail, pid);
  103cda:	e8 b1 fe ff ff       	call   103b90 <tcb_set_next>
	if (old_tail != NUM_IDS)
  103cdf:	83 c4 10             	add    $0x10,%esp
  103ce2:	83 fe 40             	cmp    $0x40,%esi
  103ce5:	74 21                	je     103d08 <tqueue_enqueue+0x48>
	{
		tcb_set_prev(pid, old_tail);
  103ce7:	83 ec 08             	sub    $0x8,%esp
  103cea:	56                   	push   %esi
  103ceb:	53                   	push   %ebx
  103cec:	e8 6f fe ff ff       	call   103b60 <tcb_set_prev>
  103cf1:	83 c4 10             	add    $0x10,%esp
	} else {
		tqueue_set_head(chid, pid);
	}
	
	tqueue_set_tail(chid, pid);
  103cf4:	89 5c 24 14          	mov    %ebx,0x14(%esp)
  103cf8:	89 7c 24 10          	mov    %edi,0x10(%esp)

}
  103cfc:	5b                   	pop    %ebx
  103cfd:	5e                   	pop    %esi
  103cfe:	5f                   	pop    %edi
		tcb_set_prev(pid, old_tail);
	} else {
		tqueue_set_head(chid, pid);
	}
	
	tqueue_set_tail(chid, pid);
  103cff:	e9 4c ff ff ff       	jmp    103c50 <tqueue_set_tail>
  103d04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	tcb_set_next(old_tail, pid);
	if (old_tail != NUM_IDS)
	{
		tcb_set_prev(pid, old_tail);
	} else {
		tqueue_set_head(chid, pid);
  103d08:	83 ec 08             	sub    $0x8,%esp
  103d0b:	53                   	push   %ebx
  103d0c:	57                   	push   %edi
  103d0d:	e8 1e ff ff ff       	call   103c30 <tqueue_set_head>
  103d12:	83 c4 10             	add    $0x10,%esp
	}
	
	tqueue_set_tail(chid, pid);
  103d15:	89 5c 24 14          	mov    %ebx,0x14(%esp)
  103d19:	89 7c 24 10          	mov    %edi,0x10(%esp)

}
  103d1d:	5b                   	pop    %ebx
  103d1e:	5e                   	pop    %esi
  103d1f:	5f                   	pop    %edi
		tcb_set_prev(pid, old_tail);
	} else {
		tqueue_set_head(chid, pid);
	}
	
	tqueue_set_tail(chid, pid);
  103d20:	e9 2b ff ff ff       	jmp    103c50 <tqueue_set_tail>
  103d25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103d30 <tqueue_dequeue>:
 * Reverse action of tqueue_enqueue, i.g., pops a TCB from the head of specified queue.
 * It returns the poped thread's id, or NUM_IDS if the queue is empty.
 * Hint: there are mutiple cases in this function.
 */
unsigned int tqueue_dequeue(unsigned int chid)
{
  103d30:	57                   	push   %edi
  103d31:	56                   	push   %esi
  103d32:	53                   	push   %ebx
  103d33:	8b 74 24 10          	mov    0x10(%esp),%esi
  // TODO
	unsigned int result = tqueue_get_head(chid);
  103d37:	83 ec 0c             	sub    $0xc,%esp
  103d3a:	56                   	push   %esi
  103d3b:	e8 e0 fe ff ff       	call   103c20 <tqueue_get_head>
	unsigned int new_head = tcb_get_next(result);
  103d40:	89 04 24             	mov    %eax,(%esp)
 * Hint: there are mutiple cases in this function.
 */
unsigned int tqueue_dequeue(unsigned int chid)
{
  // TODO
	unsigned int result = tqueue_get_head(chid);
  103d43:	89 c3                	mov    %eax,%ebx
	unsigned int new_head = tcb_get_next(result);
  103d45:	e8 36 fe ff ff       	call   103b80 <tcb_get_next>
	tqueue_set_head(chid, new_head);
  103d4a:	5a                   	pop    %edx
  103d4b:	59                   	pop    %ecx
  103d4c:	50                   	push   %eax
  103d4d:	56                   	push   %esi
 */
unsigned int tqueue_dequeue(unsigned int chid)
{
  // TODO
	unsigned int result = tqueue_get_head(chid);
	unsigned int new_head = tcb_get_next(result);
  103d4e:	89 c7                	mov    %eax,%edi
	tqueue_set_head(chid, new_head);
  103d50:	e8 db fe ff ff       	call   103c30 <tqueue_set_head>
	if (tcb_get_next(new_head) == NUM_IDS)
  103d55:	89 3c 24             	mov    %edi,(%esp)
  103d58:	e8 23 fe ff ff       	call   103b80 <tcb_get_next>
  103d5d:	83 c4 10             	add    $0x10,%esp
  103d60:	83 f8 40             	cmp    $0x40,%eax
  103d63:	74 1b                	je     103d80 <tqueue_dequeue+0x50>
	{
		tqueue_set_tail(chid, new_head);
	}
	tcb_set_next(result, NUM_IDS);
  103d65:	83 ec 08             	sub    $0x8,%esp
  103d68:	6a 40                	push   $0x40
  103d6a:	53                   	push   %ebx
  103d6b:	e8 20 fe ff ff       	call   103b90 <tcb_set_next>

  	return result;
  103d70:	83 c4 10             	add    $0x10,%esp
}
  103d73:	89 d8                	mov    %ebx,%eax
  103d75:	5b                   	pop    %ebx
  103d76:	5e                   	pop    %esi
  103d77:	5f                   	pop    %edi
  103d78:	c3                   	ret    
  103d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	unsigned int result = tqueue_get_head(chid);
	unsigned int new_head = tcb_get_next(result);
	tqueue_set_head(chid, new_head);
	if (tcb_get_next(new_head) == NUM_IDS)
	{
		tqueue_set_tail(chid, new_head);
  103d80:	83 ec 08             	sub    $0x8,%esp
  103d83:	57                   	push   %edi
  103d84:	56                   	push   %esi
  103d85:	e8 c6 fe ff ff       	call   103c50 <tqueue_set_tail>
  103d8a:	83 c4 10             	add    $0x10,%esp
  103d8d:	eb d6                	jmp    103d65 <tqueue_dequeue+0x35>
  103d8f:	90                   	nop

00103d90 <tqueue_remove>:
/**
 * Removes the TCB #pid from the queue #chid.
 * Hint: there are many cases in this function.
 */
void tqueue_remove(unsigned int chid, unsigned int pid)
{
  103d90:	55                   	push   %ebp
  103d91:	57                   	push   %edi
  103d92:	56                   	push   %esi
  103d93:	53                   	push   %ebx
  103d94:	83 ec 18             	sub    $0x18,%esp
  103d97:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  103d9b:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  unsigned int id = tqueue_get_tail(chid);
  103d9f:	57                   	push   %edi
  103da0:	e8 9b fe ff ff       	call   103c40 <tqueue_get_tail>
  while(id != pid) {
  103da5:	83 c4 10             	add    $0x10,%esp
  103da8:	39 d8                	cmp    %ebx,%eax
  103daa:	74 14                	je     103dc0 <tqueue_remove+0x30>
  103dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  	id = tcb_get_next(id);
  103db0:	83 ec 0c             	sub    $0xc,%esp
  103db3:	50                   	push   %eax
  103db4:	e8 c7 fd ff ff       	call   103b80 <tcb_get_next>
 * Hint: there are many cases in this function.
 */
void tqueue_remove(unsigned int chid, unsigned int pid)
{
  unsigned int id = tqueue_get_tail(chid);
  while(id != pid) {
  103db9:	83 c4 10             	add    $0x10,%esp
  103dbc:	39 c3                	cmp    %eax,%ebx
  103dbe:	75 f0                	jne    103db0 <tqueue_remove+0x20>
  	id = tcb_get_next(id);
  }

  unsigned int old_id_next = tcb_get_next(id);
  103dc0:	83 ec 0c             	sub    $0xc,%esp
  103dc3:	53                   	push   %ebx
  103dc4:	e8 b7 fd ff ff       	call   103b80 <tcb_get_next>
  103dc9:	89 c6                	mov    %eax,%esi
  unsigned int old_id_prev = tcb_get_prev(id);
  103dcb:	89 1c 24             	mov    %ebx,(%esp)
  103dce:	e8 7d fd ff ff       	call   103b50 <tcb_get_prev>
  if (old_id_next == NUM_IDS) 
  103dd3:	83 c4 10             	add    $0x10,%esp
  103dd6:	83 fe 40             	cmp    $0x40,%esi
  while(id != pid) {
  	id = tcb_get_next(id);
  }

  unsigned int old_id_next = tcb_get_next(id);
  unsigned int old_id_prev = tcb_get_prev(id);
  103dd9:	89 c5                	mov    %eax,%ebp
  if (old_id_next == NUM_IDS) 
  103ddb:	74 53                	je     103e30 <tqueue_remove+0xa0>
  {
  	tqueue_set_tail(chid, old_id_prev);
  }
  if (old_id_prev == NUM_IDS)
  103ddd:	83 fd 40             	cmp    $0x40,%ebp
  103de0:	74 3e                	je     103e20 <tqueue_remove+0x90>
  {
  	tqueue_set_head(chid, old_id_next);
  }
  
  tcb_set_next(old_id_prev, old_id_next);
  103de2:	83 ec 08             	sub    $0x8,%esp
  103de5:	56                   	push   %esi
  103de6:	55                   	push   %ebp
  103de7:	e8 a4 fd ff ff       	call   103b90 <tcb_set_next>
  tcb_set_prev(old_id_next, old_id_prev);
  103dec:	58                   	pop    %eax
  103ded:	5a                   	pop    %edx
  103dee:	55                   	push   %ebp
  103def:	56                   	push   %esi
  103df0:	e8 6b fd ff ff       	call   103b60 <tcb_set_prev>

  tcb_set_prev(id, NUM_IDS);
  103df5:	59                   	pop    %ecx
  103df6:	5e                   	pop    %esi
  103df7:	6a 40                	push   $0x40
  103df9:	53                   	push   %ebx
  103dfa:	e8 61 fd ff ff       	call   103b60 <tcb_set_prev>
  tcb_set_next(id, NUM_IDS);
  103dff:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  103e03:	c7 44 24 34 40 00 00 	movl   $0x40,0x34(%esp)
  103e0a:	00 

}
  103e0b:	83 c4 1c             	add    $0x1c,%esp
  103e0e:	5b                   	pop    %ebx
  103e0f:	5e                   	pop    %esi
  103e10:	5f                   	pop    %edi
  103e11:	5d                   	pop    %ebp
  
  tcb_set_next(old_id_prev, old_id_next);
  tcb_set_prev(old_id_next, old_id_prev);

  tcb_set_prev(id, NUM_IDS);
  tcb_set_next(id, NUM_IDS);
  103e12:	e9 79 fd ff ff       	jmp    103b90 <tcb_set_next>
  103e17:	89 f6                	mov    %esi,%esi
  103e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  {
  	tqueue_set_tail(chid, old_id_prev);
  }
  if (old_id_prev == NUM_IDS)
  {
  	tqueue_set_head(chid, old_id_next);
  103e20:	83 ec 08             	sub    $0x8,%esp
  103e23:	56                   	push   %esi
  103e24:	57                   	push   %edi
  103e25:	e8 06 fe ff ff       	call   103c30 <tqueue_set_head>
  103e2a:	83 c4 10             	add    $0x10,%esp
  103e2d:	eb b3                	jmp    103de2 <tqueue_remove+0x52>
  103e2f:	90                   	nop

  unsigned int old_id_next = tcb_get_next(id);
  unsigned int old_id_prev = tcb_get_prev(id);
  if (old_id_next == NUM_IDS) 
  {
  	tqueue_set_tail(chid, old_id_prev);
  103e30:	83 ec 08             	sub    $0x8,%esp
  103e33:	50                   	push   %eax
  103e34:	57                   	push   %edi
  103e35:	e8 16 fe ff ff       	call   103c50 <tqueue_set_tail>
  103e3a:	83 c4 10             	add    $0x10,%esp
  103e3d:	eb 9e                	jmp    103ddd <tqueue_remove+0x4d>
  103e3f:	90                   	nop

00103e40 <get_curid>:
unsigned int CURID;

unsigned int get_curid(void)
{
	return CURID;
}
  103e40:	a1 08 3b df 00       	mov    0xdf3b08,%eax
  103e45:	c3                   	ret    
  103e46:	8d 76 00             	lea    0x0(%esi),%esi
  103e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103e50 <set_curid>:

void set_curid(unsigned int curid)
{
	CURID = curid;
  103e50:	8b 44 24 04          	mov    0x4(%esp),%eax
  103e54:	a3 08 3b df 00       	mov    %eax,0xdf3b08
  103e59:	c3                   	ret    
  103e5a:	66 90                	xchg   %ax,%ax
  103e5c:	66 90                	xchg   %ax,%ax
  103e5e:	66 90                	xchg   %ax,%ax

00103e60 <thread_init>:
#include <lib/thread.h>
#include <lib/debug.h>
#include "import.h"

void thread_init(unsigned int mbi_addr)
{
  103e60:	83 ec 18             	sub    $0x18,%esp
	tqueue_init(mbi_addr);
  103e63:	ff 74 24 1c          	pushl  0x1c(%esp)
  103e67:	e8 14 fe ff ff       	call   103c80 <tqueue_init>
	set_curid(0);
  103e6c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  103e73:	e8 d8 ff ff ff       	call   103e50 <set_curid>
	tcb_set_state(0, TSTATE_RUN);
  103e78:	58                   	pop    %eax
  103e79:	5a                   	pop    %edx
  103e7a:	6a 01                	push   $0x1
  103e7c:	6a 00                	push   $0x0
  103e7e:	e8 ad fc ff ff       	call   103b30 <tcb_set_state>
}
  103e83:	83 c4 1c             	add    $0x1c,%esp
  103e86:	c3                   	ret    
  103e87:	89 f6                	mov    %esi,%esi
  103e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103e90 <thread_spawn>:
 * Allocates new child thread context, set the state of the new child thread
 * as ready, and pushes it to the ready queue.
 * It returns the child thread id.
 */
unsigned int thread_spawn(void *entry, unsigned int id, unsigned int quota)
{
  103e90:	53                   	push   %ebx
  103e91:	83 ec 0c             	sub    $0xc,%esp
  // TODO

	unsigned int child_id = kctx_new(entry, id, quota);
  103e94:	ff 74 24 1c          	pushl  0x1c(%esp)
  103e98:	ff 74 24 1c          	pushl  0x1c(%esp)
  103e9c:	ff 74 24 1c          	pushl  0x1c(%esp)
  103ea0:	e8 3b fc ff ff       	call   103ae0 <kctx_new>
  103ea5:	89 c3                	mov    %eax,%ebx
	tcb_set_state(child_id, TSTATE_READY);
  103ea7:	58                   	pop    %eax
  103ea8:	5a                   	pop    %edx
  103ea9:	6a 00                	push   $0x0
  103eab:	53                   	push   %ebx
  103eac:	e8 7f fc ff ff       	call   103b30 <tcb_set_state>
	tqueue_enqueue(NUM_IDS, child_id);
  103eb1:	59                   	pop    %ecx
  103eb2:	58                   	pop    %eax
  103eb3:	53                   	push   %ebx
  103eb4:	6a 40                	push   $0x40
  103eb6:	e8 05 fe ff ff       	call   103cc0 <tqueue_enqueue>
	return child_id;
}
  103ebb:	83 c4 18             	add    $0x18,%esp
  103ebe:	89 d8                	mov    %ebx,%eax
  103ec0:	5b                   	pop    %ebx
  103ec1:	c3                   	ret    
  103ec2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103ed0 <thread_yield>:
 * current thread id, then switches to the new kernel context.
 * Hint: if you are the only thread that is ready to run,
 * do you need to switch to yourself?
 */
void thread_yield(void)
{
  103ed0:	56                   	push   %esi
  103ed1:	53                   	push   %ebx
  103ed2:	83 ec 04             	sub    $0x4,%esp
  // TODO
	unsigned int cur_id = get_curid();
  103ed5:	e8 66 ff ff ff       	call   103e40 <get_curid>
	unsigned int new_id = tqueue_dequeue(NUM_IDS);
  103eda:	83 ec 0c             	sub    $0xc,%esp
 * do you need to switch to yourself?
 */
void thread_yield(void)
{
  // TODO
	unsigned int cur_id = get_curid();
  103edd:	89 c6                	mov    %eax,%esi
	unsigned int new_id = tqueue_dequeue(NUM_IDS);
  103edf:	6a 40                	push   $0x40
  103ee1:	e8 4a fe ff ff       	call   103d30 <tqueue_dequeue>
	if (new_id == NUM_IDS)
  103ee6:	83 c4 10             	add    $0x10,%esp
  103ee9:	83 f8 40             	cmp    $0x40,%eax
  103eec:	74 35                	je     103f23 <thread_yield+0x53>
	{
		return;
	} else {
		
		tcb_set_state(cur_id, TSTATE_READY);
  103eee:	83 ec 08             	sub    $0x8,%esp
  103ef1:	89 c3                	mov    %eax,%ebx
  103ef3:	6a 00                	push   $0x0
  103ef5:	56                   	push   %esi
  103ef6:	e8 35 fc ff ff       	call   103b30 <tcb_set_state>
		tqueue_enqueue(NUM_IDS,cur_id);
  103efb:	58                   	pop    %eax
  103efc:	5a                   	pop    %edx
  103efd:	56                   	push   %esi
  103efe:	6a 40                	push   $0x40
  103f00:	e8 bb fd ff ff       	call   103cc0 <tqueue_enqueue>
		tcb_set_state(new_id,TSTATE_RUN);
  103f05:	59                   	pop    %ecx
  103f06:	58                   	pop    %eax
  103f07:	6a 01                	push   $0x1
  103f09:	53                   	push   %ebx
  103f0a:	e8 21 fc ff ff       	call   103b30 <tcb_set_state>
		set_curid(new_id);
  103f0f:	89 1c 24             	mov    %ebx,(%esp)
  103f12:	e8 39 ff ff ff       	call   103e50 <set_curid>
		kctx_switch(cur_id, new_id);
  103f17:	58                   	pop    %eax
  103f18:	5a                   	pop    %edx
  103f19:	53                   	push   %ebx
  103f1a:	56                   	push   %esi
  103f1b:	e8 60 fb ff ff       	call   103a80 <kctx_switch>
  103f20:	83 c4 10             	add    $0x10,%esp
	}
}
  103f23:	83 c4 04             	add    $0x4,%esp
  103f26:	5b                   	pop    %ebx
  103f27:	5e                   	pop    %esi
  103f28:	c3                   	ret    
  103f29:	66 90                	xchg   %ax,%ax
  103f2b:	66 90                	xchg   %ax,%ax
  103f2d:	66 90                	xchg   %ax,%ax
  103f2f:	90                   	nop

00103f30 <proc_start_user>:

extern tf_t uctx_pool[NUM_IDS];
extern char STACK_LOC[NUM_IDS][PAGESIZE];

void proc_start_user(void)
{
  103f30:	53                   	push   %ebx
  103f31:	83 ec 08             	sub    $0x8,%esp
	unsigned int cur_pid = get_curid();
  103f34:	e8 07 ff ff ff       	call   103e40 <get_curid>
	tss_switch(cur_pid);
  103f39:	83 ec 0c             	sub    $0xc,%esp
extern tf_t uctx_pool[NUM_IDS];
extern char STACK_LOC[NUM_IDS][PAGESIZE];

void proc_start_user(void)
{
	unsigned int cur_pid = get_curid();
  103f3c:	89 c3                	mov    %eax,%ebx
	tss_switch(cur_pid);
  103f3e:	50                   	push   %eax
  103f3f:	e8 91 e4 ff ff       	call   1023d5 <tss_switch>
	set_pdir_base(cur_pid);
  103f44:	89 1c 24             	mov    %ebx,(%esp)

	trap_return((void *) &uctx_pool[cur_pid]);
  103f47:	6b db 44             	imul   $0x44,%ebx,%ebx

void proc_start_user(void)
{
	unsigned int cur_pid = get_curid();
	tss_switch(cur_pid);
	set_pdir_base(cur_pid);
  103f4a:	e8 21 f5 ff ff       	call   103470 <set_pdir_base>

	trap_return((void *) &uctx_pool[cur_pid]);
  103f4f:	81 c3 20 3b df 00    	add    $0xdf3b20,%ebx
  103f55:	89 1c 24             	mov    %ebx,(%esp)
  103f58:	e8 d3 dc ff ff       	call   101c30 <trap_return>
}
  103f5d:	83 c4 18             	add    $0x18,%esp
  103f60:	5b                   	pop    %ebx
  103f61:	c3                   	ret    
  103f62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103f70 <proc_create>:

unsigned int proc_create(void *elf_addr, unsigned int quota)
{
  103f70:	57                   	push   %edi
  103f71:	56                   	push   %esi
  103f72:	53                   	push   %ebx
  103f73:	8b 7c 24 10          	mov    0x10(%esp),%edi
	unsigned int pid, id;

  id = get_curid();
  103f77:	e8 c4 fe ff ff       	call   103e40 <get_curid>
	pid = thread_spawn((void *) proc_start_user, id, quota);
  103f7c:	83 ec 04             	sub    $0x4,%esp
  103f7f:	ff 74 24 18          	pushl  0x18(%esp)
  103f83:	50                   	push   %eax
  103f84:	68 30 3f 10 00       	push   $0x103f30
  103f89:	e8 02 ff ff ff       	call   103e90 <thread_spawn>
  103f8e:	89 c6                	mov    %eax,%esi

	elf_load(elf_addr, pid);
  103f90:	58                   	pop    %eax
  103f91:	5a                   	pop    %edx

  uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  103f92:	6b de 44             	imul   $0x44,%esi,%ebx
	unsigned int pid, id;

  id = get_curid();
	pid = thread_spawn((void *) proc_start_user, id, quota);

	elf_load(elf_addr, pid);
  103f95:	56                   	push   %esi
  103f96:	57                   	push   %edi
  103f97:	e8 7e ed ff ff       	call   102d1a <elf_load>

  uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  103f9c:	b8 23 00 00 00       	mov    $0x23,%eax
  id = get_curid();
	pid = thread_spawn((void *) proc_start_user, id, quota);

	elf_load(elf_addr, pid);

  uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  103fa1:	b9 23 00 00 00       	mov    $0x23,%ecx
  uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  uctx_pool[pid].cs = CPU_GDT_UCODE | 3;
  uctx_pool[pid].ss = CPU_GDT_UDATA | 3;
  uctx_pool[pid].esp = VM_USERHI;
  uctx_pool[pid].eflags = FL_IF;
  uctx_pool[pid].eip = elf_entry(elf_addr);
  103fa6:	89 3c 24             	mov    %edi,(%esp)
	pid = thread_spawn((void *) proc_start_user, id, quota);

	elf_load(elf_addr, pid);

  uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  103fa9:	66 89 83 44 3b df 00 	mov    %ax,0xdf3b44(%ebx)
  uctx_pool[pid].cs = CPU_GDT_UCODE | 3;
  103fb0:	b8 1b 00 00 00       	mov    $0x1b,%eax
  id = get_curid();
	pid = thread_spawn((void *) proc_start_user, id, quota);

	elf_load(elf_addr, pid);

  uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  103fb5:	66 89 8b 40 3b df 00 	mov    %cx,0xdf3b40(%ebx)
  uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  uctx_pool[pid].cs = CPU_GDT_UCODE | 3;
  103fbc:	66 89 83 54 3b df 00 	mov    %ax,0xdf3b54(%ebx)
  uctx_pool[pid].ss = CPU_GDT_UDATA | 3;
  103fc3:	b8 23 00 00 00       	mov    $0x23,%eax
  uctx_pool[pid].esp = VM_USERHI;
  103fc8:	c7 83 5c 3b df 00 00 	movl   $0xf0000000,0xdf3b5c(%ebx)
  103fcf:	00 00 f0 
	elf_load(elf_addr, pid);

  uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  uctx_pool[pid].cs = CPU_GDT_UCODE | 3;
  uctx_pool[pid].ss = CPU_GDT_UDATA | 3;
  103fd2:	66 89 83 60 3b df 00 	mov    %ax,0xdf3b60(%ebx)
  uctx_pool[pid].esp = VM_USERHI;
  uctx_pool[pid].eflags = FL_IF;
  103fd9:	c7 83 58 3b df 00 00 	movl   $0x200,0xdf3b58(%ebx)
  103fe0:	02 00 00 
  uctx_pool[pid].eip = elf_entry(elf_addr);
  103fe3:	e8 f3 ee ff ff       	call   102edb <elf_entry>

	return pid;
  103fe8:	83 c4 10             	add    $0x10,%esp
  uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  uctx_pool[pid].cs = CPU_GDT_UCODE | 3;
  uctx_pool[pid].ss = CPU_GDT_UDATA | 3;
  uctx_pool[pid].esp = VM_USERHI;
  uctx_pool[pid].eflags = FL_IF;
  uctx_pool[pid].eip = elf_entry(elf_addr);
  103feb:	89 83 50 3b df 00    	mov    %eax,0xdf3b50(%ebx)

	return pid;
}
  103ff1:	89 f0                	mov    %esi,%eax
  103ff3:	5b                   	pop    %ebx
  103ff4:	5e                   	pop    %esi
  103ff5:	5f                   	pop    %edi
  103ff6:	c3                   	ret    
  103ff7:	89 f6                	mov    %esi,%esi
  103ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104000 <proc_fork>:

unsigned int proc_fork(void *elf_addr) {
  104000:	57                   	push   %edi
  104001:	56                   	push   %esi
  104002:	53                   	push   %ebx
	unsigned int pid, id;

    id = get_curid();
  104003:	e8 38 fe ff ff       	call   103e40 <get_curid>
    unsigned int usage = container_get_usage(id);
  104008:	83 ec 0c             	sub    $0xc,%esp
}

unsigned int proc_fork(void *elf_addr) {
	unsigned int pid, id;

    id = get_curid();
  10400b:	89 c6                	mov    %eax,%esi
    unsigned int usage = container_get_usage(id);
  10400d:	50                   	push   %eax
  10400e:	e8 2d f3 ff ff       	call   103340 <container_get_usage>
  104013:	89 c3                	mov    %eax,%ebx
    unsigned int quota = container_get_quota(id);
  104015:	89 34 24             	mov    %esi,(%esp)
  104018:	e8 13 f3 ff ff       	call   103330 <container_get_quota>

	pid = thread_spawn((void *) proc_start_user, id, (quota - usage) / 2);
  10401d:	29 d8                	sub    %ebx,%eax
  10401f:	83 c4 0c             	add    $0xc,%esp
  104022:	d1 e8                	shr    %eax
  104024:	50                   	push   %eax
  104025:	56                   	push   %esi
  104026:	68 30 3f 10 00       	push   $0x103f30
  10402b:	e8 60 fe ff ff       	call   103e90 <thread_spawn>
	KERN_DEBUG("before copy page, id is %d,pid is %d \n",id, pid);
  104030:	89 04 24             	mov    %eax,(%esp)
  104033:	56                   	push   %esi

    id = get_curid();
    unsigned int usage = container_get_usage(id);
    unsigned int quota = container_get_quota(id);

	pid = thread_spawn((void *) proc_start_user, id, (quota - usage) / 2);
  104034:	89 c3                	mov    %eax,%ebx
	KERN_DEBUG("before copy page, id is %d,pid is %d \n",id, pid);
  104036:	68 88 54 10 00       	push   $0x105488
  10403b:	6a 32                	push   $0x32
  10403d:	68 af 54 10 00       	push   $0x1054af
  104042:	e8 c4 dd ff ff       	call   101e0b <debug_normal>
	cpy_page(id, pid);
  104047:	83 c4 18             	add    $0x18,%esp
  10404a:	53                   	push   %ebx
  10404b:	56                   	push   %esi
	KERN_DEBUG("after copy page \n");
	elf_load(elf_addr, pid);

  uctx_pool[pid] = uctx_pool[id];
  10404c:	6b f6 44             	imul   $0x44,%esi,%esi
    unsigned int usage = container_get_usage(id);
    unsigned int quota = container_get_quota(id);

	pid = thread_spawn((void *) proc_start_user, id, (quota - usage) / 2);
	KERN_DEBUG("before copy page, id is %d,pid is %d \n",id, pid);
	cpy_page(id, pid);
  10404f:	e8 9c f8 ff ff       	call   1038f0 <cpy_page>
	KERN_DEBUG("after copy page \n");
  104054:	83 c4 0c             	add    $0xc,%esp
  104057:	68 c7 54 10 00       	push   $0x1054c7
  10405c:	6a 34                	push   $0x34
	elf_load(elf_addr, pid);

  uctx_pool[pid] = uctx_pool[id];
  10405e:	81 c6 20 3b df 00    	add    $0xdf3b20,%esi
    unsigned int quota = container_get_quota(id);

	pid = thread_spawn((void *) proc_start_user, id, (quota - usage) / 2);
	KERN_DEBUG("before copy page, id is %d,pid is %d \n",id, pid);
	cpy_page(id, pid);
	KERN_DEBUG("after copy page \n");
  104064:	68 af 54 10 00       	push   $0x1054af
  104069:	e8 9d dd ff ff       	call   101e0b <debug_normal>
	elf_load(elf_addr, pid);
  10406e:	58                   	pop    %eax
  10406f:	5a                   	pop    %edx
  104070:	53                   	push   %ebx
  104071:	ff 74 24 1c          	pushl  0x1c(%esp)
  104075:	e8 a0 ec ff ff       	call   102d1a <elf_load>

  uctx_pool[pid] = uctx_pool[id];
  10407a:	6b c3 44             	imul   $0x44,%ebx,%eax
  10407d:	b9 11 00 00 00       	mov    $0x11,%ecx

	return pid;
  104082:	83 c4 10             	add    $0x10,%esp
	KERN_DEBUG("before copy page, id is %d,pid is %d \n",id, pid);
	cpy_page(id, pid);
	KERN_DEBUG("after copy page \n");
	elf_load(elf_addr, pid);

  uctx_pool[pid] = uctx_pool[id];
  104085:	05 20 3b df 00       	add    $0xdf3b20,%eax
  10408a:	89 c7                	mov    %eax,%edi

	return pid;
}
  10408c:	89 d8                	mov    %ebx,%eax
	KERN_DEBUG("before copy page, id is %d,pid is %d \n",id, pid);
	cpy_page(id, pid);
	KERN_DEBUG("after copy page \n");
	elf_load(elf_addr, pid);

  uctx_pool[pid] = uctx_pool[id];
  10408e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	return pid;
}
  104090:	5b                   	pop    %ebx
  104091:	5e                   	pop    %esi
  104092:	5f                   	pop    %edi
  104093:	c3                   	ret    
  104094:	66 90                	xchg   %ax,%ax
  104096:	66 90                	xchg   %ax,%ax
  104098:	66 90                	xchg   %ax,%ax
  10409a:	66 90                	xchg   %ax,%ax
  10409c:	66 90                	xchg   %ax,%ax
  10409e:	66 90                	xchg   %ax,%ax

001040a0 <syscall_get_arg1>:
 * passed in from the current running process's system call.
 */


unsigned int syscall_get_arg1(void)
{
  1040a0:	83 ec 0c             	sub    $0xc,%esp
  // TODO
	unsigned int result = get_curid();
  1040a3:	e8 98 fd ff ff       	call   103e40 <get_curid>
  	return uctx_pool[result].regs.eax;
  1040a8:	6b c0 44             	imul   $0x44,%eax,%eax
  1040ab:	8b 80 3c 3b df 00    	mov    0xdf3b3c(%eax),%eax
}
  1040b1:	83 c4 0c             	add    $0xc,%esp
  1040b4:	c3                   	ret    
  1040b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1040b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001040c0 <syscall_get_arg2>:

unsigned int syscall_get_arg2(void)
{
  1040c0:	83 ec 0c             	sub    $0xc,%esp
  // TODO
	unsigned int result = get_curid();
  1040c3:	e8 78 fd ff ff       	call   103e40 <get_curid>
  return uctx_pool[result].regs.ebx;
  1040c8:	6b c0 44             	imul   $0x44,%eax,%eax
  1040cb:	8b 80 30 3b df 00    	mov    0xdf3b30(%eax),%eax
}
  1040d1:	83 c4 0c             	add    $0xc,%esp
  1040d4:	c3                   	ret    
  1040d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1040d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001040e0 <syscall_get_arg3>:

unsigned int syscall_get_arg3(void)
{
  1040e0:	83 ec 0c             	sub    $0xc,%esp
  // TODO
	unsigned int result = get_curid();
  1040e3:	e8 58 fd ff ff       	call   103e40 <get_curid>
  return uctx_pool[result].regs.ecx;
  1040e8:	6b c0 44             	imul   $0x44,%eax,%eax
  1040eb:	8b 80 38 3b df 00    	mov    0xdf3b38(%eax),%eax
}
  1040f1:	83 c4 0c             	add    $0xc,%esp
  1040f4:	c3                   	ret    
  1040f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1040f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104100 <syscall_get_arg4>:

unsigned int syscall_get_arg4(void)
{
  104100:	83 ec 0c             	sub    $0xc,%esp
  // TODO
	unsigned int result = get_curid();
  104103:	e8 38 fd ff ff       	call   103e40 <get_curid>
	return uctx_pool[result].regs.edx;
  104108:	6b c0 44             	imul   $0x44,%eax,%eax
  10410b:	8b 80 34 3b df 00    	mov    0xdf3b34(%eax),%eax
}
  104111:	83 c4 0c             	add    $0xc,%esp
  104114:	c3                   	ret    
  104115:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104120 <syscall_get_arg5>:

unsigned int syscall_get_arg5(void)
{
  104120:	83 ec 0c             	sub    $0xc,%esp
  // TODO
	unsigned int result = get_curid();
  104123:	e8 18 fd ff ff       	call   103e40 <get_curid>
  return  uctx_pool[result].regs.esi;
  104128:	6b c0 44             	imul   $0x44,%eax,%eax
  10412b:	8b 80 24 3b df 00    	mov    0xdf3b24(%eax),%eax
}
  104131:	83 c4 0c             	add    $0xc,%esp
  104134:	c3                   	ret    
  104135:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104140 <syscall_get_arg6>:

unsigned int syscall_get_arg6(void)
{
  104140:	83 ec 0c             	sub    $0xc,%esp
  // TODO
	unsigned int result = get_curid();
  104143:	e8 f8 fc ff ff       	call   103e40 <get_curid>
	return uctx_pool[result].regs.edi;
  104148:	6b c0 44             	imul   $0x44,%eax,%eax
  10414b:	8b 80 20 3b df 00    	mov    0xdf3b20(%eax),%eax
}
  104151:	83 c4 0c             	add    $0xc,%esp
  104154:	c3                   	ret    
  104155:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104160 <syscall_set_errno>:
/**
 * Sets the error number in uctx_pool which gets passed
 * to the current running process when we return to it.
 */
void syscall_set_errno(unsigned int errno)
{
  104160:	83 ec 0c             	sub    $0xc,%esp
	unsigned int result = get_curid();
  104163:	e8 d8 fc ff ff       	call   103e40 <get_curid>
	uctx_pool[result].regs.eax = errno;
  104168:	8b 54 24 10          	mov    0x10(%esp),%edx
  10416c:	6b c0 44             	imul   $0x44,%eax,%eax
  10416f:	89 90 3c 3b df 00    	mov    %edx,0xdf3b3c(%eax)
}
  104175:	83 c4 0c             	add    $0xc,%esp
  104178:	c3                   	ret    
  104179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104180 <syscall_set_retval1>:
 * Sets the return values in uctx_pool which gets passed
 * to the current running process when we return to it.
 */

void syscall_set_retval1(unsigned int retval)
{
  104180:	83 ec 0c             	sub    $0xc,%esp
  // TODO
	unsigned int result = get_curid();
  104183:	e8 b8 fc ff ff       	call   103e40 <get_curid>
	uctx_pool[result].regs.ebx = retval;
  104188:	8b 54 24 10          	mov    0x10(%esp),%edx
  10418c:	6b c0 44             	imul   $0x44,%eax,%eax
  10418f:	89 90 30 3b df 00    	mov    %edx,0xdf3b30(%eax)
}
  104195:	83 c4 0c             	add    $0xc,%esp
  104198:	c3                   	ret    
  104199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001041a0 <syscall_set_retval2>:

void syscall_set_retval2(unsigned int retval)
{
  1041a0:	83 ec 0c             	sub    $0xc,%esp
	unsigned int result = get_curid();
  1041a3:	e8 98 fc ff ff       	call   103e40 <get_curid>
  uctx_pool[result].regs.ecx = retval;
  1041a8:	8b 54 24 10          	mov    0x10(%esp),%edx
  1041ac:	6b c0 44             	imul   $0x44,%eax,%eax
  1041af:	89 90 38 3b df 00    	mov    %edx,0xdf3b38(%eax)
}
  1041b5:	83 c4 0c             	add    $0xc,%esp
  1041b8:	c3                   	ret    
  1041b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001041c0 <syscall_set_retval3>:

void syscall_set_retval3(unsigned int retval)
{
  1041c0:	83 ec 0c             	sub    $0xc,%esp
  // TODO
	unsigned int result = get_curid();
  1041c3:	e8 78 fc ff ff       	call   103e40 <get_curid>
	uctx_pool[result].regs.edx = retval;
  1041c8:	8b 54 24 10          	mov    0x10(%esp),%edx
  1041cc:	6b c0 44             	imul   $0x44,%eax,%eax
  1041cf:	89 90 34 3b df 00    	mov    %edx,0xdf3b34(%eax)
}
  1041d5:	83 c4 0c             	add    $0xc,%esp
  1041d8:	c3                   	ret    
  1041d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001041e0 <syscall_set_retval4>:

void syscall_set_retval4(unsigned int retval)
{
  1041e0:	83 ec 0c             	sub    $0xc,%esp
  // TODO
	unsigned int result = get_curid();
  1041e3:	e8 58 fc ff ff       	call   103e40 <get_curid>
	uctx_pool[result].regs.esi = retval;
  1041e8:	8b 54 24 10          	mov    0x10(%esp),%edx
  1041ec:	6b c0 44             	imul   $0x44,%eax,%eax
  1041ef:	89 90 24 3b df 00    	mov    %edx,0xdf3b24(%eax)
}
  1041f5:	83 c4 0c             	add    $0xc,%esp
  1041f8:	c3                   	ret    
  1041f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104200 <syscall_set_retval5>:

void syscall_set_retval5(unsigned int retval)
{
  104200:	83 ec 0c             	sub    $0xc,%esp
  // TODO
	unsigned int result = get_curid();
  104203:	e8 38 fc ff ff       	call   103e40 <get_curid>
	uctx_pool[result].regs.edi = retval;
  104208:	8b 54 24 10          	mov    0x10(%esp),%edx
  10420c:	6b c0 44             	imul   $0x44,%eax,%eax
  10420f:	89 90 20 3b df 00    	mov    %edx,0xdf3b20(%eax)
}
  104215:	83 c4 0c             	add    $0xc,%esp
  104218:	c3                   	ret    
  104219:	66 90                	xchg   %ax,%ax
  10421b:	66 90                	xchg   %ax,%ax
  10421d:	66 90                	xchg   %ax,%ax
  10421f:	90                   	nop

00104220 <sys_puts>:
/**
 * Copies a string from user into buffer and prints it to the screen.
 * This is called by the user level "printf" library as a system call.
 */
void sys_puts(void)
{
  104220:	55                   	push   %ebp
  104221:	57                   	push   %edi
  104222:	56                   	push   %esi
  104223:	53                   	push   %ebx
  104224:	83 ec 1c             	sub    $0x1c,%esp
	unsigned int cur_pid;
	unsigned int str_uva, str_len;
	unsigned int remain, cur_pos, nbytes;

	cur_pid = get_curid();
  104227:	e8 14 fc ff ff       	call   103e40 <get_curid>
  10422c:	89 c5                	mov    %eax,%ebp
	str_uva = syscall_get_arg2();
  10422e:	e8 8d fe ff ff       	call   1040c0 <syscall_get_arg2>
  104233:	89 c6                	mov    %eax,%esi
	str_len = syscall_get_arg3();
  104235:	e8 a6 fe ff ff       	call   1040e0 <syscall_get_arg3>

	if (!(VM_USERLO <= str_uva && str_uva + str_len <= VM_USERHI)) {
  10423a:	81 fe ff ff ff 3f    	cmp    $0x3fffffff,%esi
  104240:	0f 86 9a 00 00 00    	jbe    1042e0 <sys_puts+0xc0>
  104246:	89 c3                	mov    %eax,%ebx
  104248:	8d 04 06             	lea    (%esi,%eax,1),%eax
  10424b:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  104250:	0f 87 8a 00 00 00    	ja     1042e0 <sys_puts+0xc0>
  104256:	89 ef                	mov    %ebp,%edi
  104258:	c1 e7 0c             	shl    $0xc,%edi
  10425b:	81 c7 80 d4 92 00    	add    $0x92d480,%edi
	}

	remain = str_len;
	cur_pos = str_uva;

	while (remain) {
  104261:	85 db                	test   %ebx,%ebx
			      cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
			syscall_set_errno(E_MEM);
			return;
		}

		sys_buf[cur_pid][nbytes] = '\0';
  104263:	89 7c 24 0c          	mov    %edi,0xc(%esp)
	}

	remain = str_len;
	cur_pos = str_uva;

	while (remain) {
  104267:	75 48                	jne    1042b1 <sys_puts+0x91>
  104269:	e9 a6 00 00 00       	jmp    104314 <sys_puts+0xf4>
  10426e:	66 90                	xchg   %ax,%ax
		if (remain < PAGESIZE - 1)
			nbytes = remain;
		else
			nbytes = PAGESIZE - 1;

		if (pt_copyin(cur_pid,
  104270:	68 ff 0f 00 00       	push   $0xfff
  104275:	57                   	push   %edi
  104276:	56                   	push   %esi
  104277:	55                   	push   %ebp
  104278:	e8 3d e8 ff ff       	call   102aba <pt_copyin>
  10427d:	83 c4 10             	add    $0x10,%esp
  104280:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  104285:	75 42                	jne    1042c9 <sys_puts+0xa9>
			      cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
			syscall_set_errno(E_MEM);
			return;
		}

		sys_buf[cur_pid][nbytes] = '\0';
  104287:	8b 44 24 0c          	mov    0xc(%esp),%eax
		KERN_INFO("%s", sys_buf[cur_pid]);
  10428b:	83 ec 08             	sub    $0x8,%esp

		remain -= nbytes;
		cur_pos += nbytes;
  10428e:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
			      cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
			syscall_set_errno(E_MEM);
			return;
		}

		sys_buf[cur_pid][nbytes] = '\0';
  104294:	c6 80 ff 0f 00 00 00 	movb   $0x0,0xfff(%eax)
		KERN_INFO("%s", sys_buf[cur_pid]);
  10429b:	57                   	push   %edi
  10429c:	68 ae 4b 10 00       	push   $0x104bae
  1042a1:	e8 4d db ff ff       	call   101df3 <debug_info>
	}

	remain = str_len;
	cur_pos = str_uva;

	while (remain) {
  1042a6:	83 c4 10             	add    $0x10,%esp
  1042a9:	81 eb ff 0f 00 00    	sub    $0xfff,%ebx
  1042af:	74 63                	je     104314 <sys_puts+0xf4>
		if (remain < PAGESIZE - 1)
  1042b1:	81 fb fe 0f 00 00    	cmp    $0xffe,%ebx
  1042b7:	77 b7                	ja     104270 <sys_puts+0x50>
			nbytes = remain;
		else
			nbytes = PAGESIZE - 1;

		if (pt_copyin(cur_pid,
  1042b9:	53                   	push   %ebx
  1042ba:	57                   	push   %edi
  1042bb:	56                   	push   %esi
  1042bc:	55                   	push   %ebp
  1042bd:	e8 f8 e7 ff ff       	call   102aba <pt_copyin>
  1042c2:	83 c4 10             	add    $0x10,%esp
  1042c5:	39 c3                	cmp    %eax,%ebx
  1042c7:	74 2f                	je     1042f8 <sys_puts+0xd8>
			      cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
			syscall_set_errno(E_MEM);
  1042c9:	83 ec 0c             	sub    $0xc,%esp
  1042cc:	6a 01                	push   $0x1
  1042ce:	e8 8d fe ff ff       	call   104160 <syscall_set_errno>
			return;
  1042d3:	83 c4 10             	add    $0x10,%esp
		remain -= nbytes;
		cur_pos += nbytes;
	}

	syscall_set_errno(E_SUCC);
}
  1042d6:	83 c4 1c             	add    $0x1c,%esp
  1042d9:	5b                   	pop    %ebx
  1042da:	5e                   	pop    %esi
  1042db:	5f                   	pop    %edi
  1042dc:	5d                   	pop    %ebp
  1042dd:	c3                   	ret    
  1042de:	66 90                	xchg   %ax,%ax
	cur_pid = get_curid();
	str_uva = syscall_get_arg2();
	str_len = syscall_get_arg3();

	if (!(VM_USERLO <= str_uva && str_uva + str_len <= VM_USERHI)) {
		syscall_set_errno(E_INVAL_ADDR);
  1042e0:	83 ec 0c             	sub    $0xc,%esp
  1042e3:	6a 04                	push   $0x4
  1042e5:	e8 76 fe ff ff       	call   104160 <syscall_set_errno>
		return;
  1042ea:	83 c4 10             	add    $0x10,%esp
		remain -= nbytes;
		cur_pos += nbytes;
	}

	syscall_set_errno(E_SUCC);
}
  1042ed:	83 c4 1c             	add    $0x1c,%esp
  1042f0:	5b                   	pop    %ebx
  1042f1:	5e                   	pop    %esi
  1042f2:	5f                   	pop    %edi
  1042f3:	5d                   	pop    %ebp
  1042f4:	c3                   	ret    
  1042f5:	8d 76 00             	lea    0x0(%esi),%esi
			syscall_set_errno(E_MEM);
			return;
		}

		sys_buf[cur_pid][nbytes] = '\0';
		KERN_INFO("%s", sys_buf[cur_pid]);
  1042f8:	83 ec 08             	sub    $0x8,%esp
			      cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
			syscall_set_errno(E_MEM);
			return;
		}

		sys_buf[cur_pid][nbytes] = '\0';
  1042fb:	c1 e5 0c             	shl    $0xc,%ebp
		KERN_INFO("%s", sys_buf[cur_pid]);
  1042fe:	57                   	push   %edi
  1042ff:	68 ae 4b 10 00       	push   $0x104bae
			      cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
			syscall_set_errno(E_MEM);
			return;
		}

		sys_buf[cur_pid][nbytes] = '\0';
  104304:	c6 84 2b 80 d4 92 00 	movb   $0x0,0x92d480(%ebx,%ebp,1)
  10430b:	00 
		KERN_INFO("%s", sys_buf[cur_pid]);
  10430c:	e8 e2 da ff ff       	call   101df3 <debug_info>
  104311:	83 c4 10             	add    $0x10,%esp

		remain -= nbytes;
		cur_pos += nbytes;
	}

	syscall_set_errno(E_SUCC);
  104314:	83 ec 0c             	sub    $0xc,%esp
  104317:	6a 00                	push   $0x0
  104319:	e8 42 fe ff ff       	call   104160 <syscall_set_errno>
  10431e:	83 c4 10             	add    $0x10,%esp
  104321:	eb ca                	jmp    1042ed <sys_puts+0xcd>
  104323:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104330 <sys_spawn>:
 * NUM_IDS with the error number E_INVAL_PID. The same error case apply
 * when the proc_create fails.
 * Otherwise, you mark it as successful, and return the new child process id.
 */
void sys_spawn(void)
{
  104330:	53                   	push   %ebx
  104331:	83 ec 08             	sub    $0x8,%esp
  // TODO
	unsigned int quota = syscall_get_arg3();
  104334:	e8 a7 fd ff ff       	call   1040e0 <syscall_get_arg3>
  104339:	89 c3                	mov    %eax,%ebx
	unsigned int elf_id = syscall_get_arg2();
  10433b:	e8 80 fd ff ff       	call   1040c0 <syscall_get_arg2>
	unsigned int pid = 0;
	if (elf_id < 1 || elf_id > 4)
  104340:	8d 50 ff             	lea    -0x1(%eax),%edx
  104343:	83 fa 03             	cmp    $0x3,%edx
  104346:	77 48                	ja     104390 <sys_spawn+0x60>
	{	
		syscall_set_retval1(NUM_IDS);
		syscall_set_errno(E_INVAL_PID);
		return;
	} else if (elf_id == 1)
  104348:	83 f8 01             	cmp    $0x1,%eax
  10434b:	74 63                	je     1043b0 <sys_spawn+0x80>
	{
		pid = proc_create(_binary___obj_user_pingpong_ping_start, quota);
	} else if (elf_id == 2)
  10434d:	83 f8 02             	cmp    $0x2,%eax
  104350:	74 76                	je     1043c8 <sys_spawn+0x98>
	{
		pid = proc_create(_binary___obj_user_pingpong_pong_start, quota);
	} else if (elf_id == 3)
  104352:	83 f8 03             	cmp    $0x3,%eax
  104355:	0f 84 85 00 00 00    	je     1043e0 <sys_spawn+0xb0>
	{
		pid = proc_create(_binary___obj_user_pingpong_ding_start, quota);
	} else if (elf_id == 4)
	{	
		pid = proc_create(_binary___obj_user_fork_fork_start, quota);
  10435b:	83 ec 08             	sub    $0x8,%esp
  10435e:	53                   	push   %ebx
  10435f:	68 70 44 12 00       	push   $0x124470
  104364:	e8 07 fc ff ff       	call   103f70 <proc_create>
  104369:	83 c4 10             	add    $0x10,%esp
	}
	
	syscall_set_retval1(pid);
  10436c:	83 ec 0c             	sub    $0xc,%esp
  10436f:	50                   	push   %eax
  104370:	e8 0b fe ff ff       	call   104180 <syscall_set_retval1>
	syscall_set_errno(E_SUCC);
  104375:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10437c:	e8 df fd ff ff       	call   104160 <syscall_set_errno>
  104381:	83 c4 10             	add    $0x10,%esp
}
  104384:	83 c4 08             	add    $0x8,%esp
  104387:	5b                   	pop    %ebx
  104388:	c3                   	ret    
  104389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	unsigned int quota = syscall_get_arg3();
	unsigned int elf_id = syscall_get_arg2();
	unsigned int pid = 0;
	if (elf_id < 1 || elf_id > 4)
	{	
		syscall_set_retval1(NUM_IDS);
  104390:	83 ec 0c             	sub    $0xc,%esp
  104393:	6a 40                	push   $0x40
  104395:	e8 e6 fd ff ff       	call   104180 <syscall_set_retval1>
		syscall_set_errno(E_INVAL_PID);
  10439a:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  1043a1:	e8 ba fd ff ff       	call   104160 <syscall_set_errno>
		return;
  1043a6:	83 c4 10             	add    $0x10,%esp
		pid = proc_create(_binary___obj_user_fork_fork_start, quota);
	}
	
	syscall_set_retval1(pid);
	syscall_set_errno(E_SUCC);
}
  1043a9:	83 c4 08             	add    $0x8,%esp
  1043ac:	5b                   	pop    %ebx
  1043ad:	c3                   	ret    
  1043ae:	66 90                	xchg   %ax,%ax
		syscall_set_retval1(NUM_IDS);
		syscall_set_errno(E_INVAL_PID);
		return;
	} else if (elf_id == 1)
	{
		pid = proc_create(_binary___obj_user_pingpong_ping_start, quota);
  1043b0:	83 ec 08             	sub    $0x8,%esp
  1043b3:	53                   	push   %ebx
  1043b4:	68 f4 00 11 00       	push   $0x1100f4
  1043b9:	e8 b2 fb ff ff       	call   103f70 <proc_create>
  1043be:	83 c4 10             	add    $0x10,%esp
  1043c1:	eb a9                	jmp    10436c <sys_spawn+0x3c>
  1043c3:	90                   	nop
  1043c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	} else if (elf_id == 2)
	{
		pid = proc_create(_binary___obj_user_pingpong_pong_start, quota);
  1043c8:	83 ec 08             	sub    $0x8,%esp
  1043cb:	53                   	push   %ebx
  1043cc:	68 c8 6c 11 00       	push   $0x116cc8
  1043d1:	e8 9a fb ff ff       	call   103f70 <proc_create>
  1043d6:	83 c4 10             	add    $0x10,%esp
  1043d9:	eb 91                	jmp    10436c <sys_spawn+0x3c>
  1043db:	90                   	nop
  1043dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	} else if (elf_id == 3)
	{
		pid = proc_create(_binary___obj_user_pingpong_ding_start, quota);
  1043e0:	83 ec 08             	sub    $0x8,%esp
  1043e3:	53                   	push   %ebx
  1043e4:	68 9c d8 11 00       	push   $0x11d89c
  1043e9:	e8 82 fb ff ff       	call   103f70 <proc_create>
  1043ee:	83 c4 10             	add    $0x10,%esp
  1043f1:	e9 76 ff ff ff       	jmp    10436c <sys_spawn+0x3c>
  1043f6:	8d 76 00             	lea    0x0(%esi),%esi
  1043f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104400 <sys_yield>:
 * The user level library function sys_yield (defined in user/include/syscall.h)
 * does not take any argument and does not have any return values.
 * Do not forget to set the error number as E_SUCC.
 */
void sys_yield(void)
{
  104400:	83 ec 0c             	sub    $0xc,%esp
  // TODO
	thread_yield();
  104403:	e8 c8 fa ff ff       	call   103ed0 <thread_yield>
	syscall_set_errno(E_SUCC);
  104408:	83 ec 0c             	sub    $0xc,%esp
  10440b:	6a 00                	push   $0x0
  10440d:	e8 4e fd ff ff       	call   104160 <syscall_set_errno>
}
  104412:	83 c4 1c             	add    $0x1c,%esp
  104415:	c3                   	ret    
  104416:	8d 76 00             	lea    0x0(%esi),%esi
  104419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104420 <sys_fork>:

// Your implementation of fork
void sys_fork()
{
  104420:	53                   	push   %ebx
  104421:	83 ec 14             	sub    $0x14,%esp
	unsigned int pid = proc_fork(_binary___obj_user_fork_fork_start);
  104424:	68 70 44 12 00       	push   $0x124470
  104429:	e8 d2 fb ff ff       	call   104000 <proc_fork>
	KERN_DEBUG("after proc_fork,pid is %d \n", pid);
  10442e:	50                   	push   %eax
  10442f:	68 d9 54 10 00       	push   $0x1054d9
}

// Your implementation of fork
void sys_fork()
{
	unsigned int pid = proc_fork(_binary___obj_user_fork_fork_start);
  104434:	89 c3                	mov    %eax,%ebx
	KERN_DEBUG("after proc_fork,pid is %d \n", pid);
  104436:	6a 7b                	push   $0x7b
  104438:	68 f5 54 10 00       	push   $0x1054f5
  10443d:	e8 c9 d9 ff ff       	call   101e0b <debug_normal>
	if (pid == NUM_IDS)
  104442:	83 c4 20             	add    $0x20,%esp
  104445:	83 fb 40             	cmp    $0x40,%ebx
  104448:	74 46                	je     104490 <sys_fork+0x70>
	{	
		syscall_set_retval1(NUM_IDS);
		syscall_set_errno(E_INVAL_PID);
		return;
	}
	set_curid(pid);
  10444a:	83 ec 0c             	sub    $0xc,%esp
  10444d:	53                   	push   %ebx
  10444e:	e8 fd f9 ff ff       	call   103e50 <set_curid>

	syscall_set_retval1(0);
  104453:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10445a:	e8 21 fd ff ff       	call   104180 <syscall_set_retval1>
	syscall_set_errno(E_SUCC);
  10445f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104466:	e8 f5 fc ff ff       	call   104160 <syscall_set_errno>
	KERN_DEBUG("after sys_fork \n");
  10446b:	83 c4 0c             	add    $0xc,%esp
  10446e:	68 13 55 10 00       	push   $0x105513
  104473:	68 86 00 00 00       	push   $0x86
  104478:	68 f5 54 10 00       	push   $0x1054f5
  10447d:	e8 89 d9 ff ff       	call   101e0b <debug_normal>
  104482:	83 c4 10             	add    $0x10,%esp
  104485:	83 c4 08             	add    $0x8,%esp
  104488:	5b                   	pop    %ebx
  104489:	c3                   	ret    
  10448a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
	unsigned int pid = proc_fork(_binary___obj_user_fork_fork_start);
	KERN_DEBUG("after proc_fork,pid is %d \n", pid);
	if (pid == NUM_IDS)
	{	
		syscall_set_retval1(NUM_IDS);
  104490:	83 ec 0c             	sub    $0xc,%esp
  104493:	6a 40                	push   $0x40
  104495:	e8 e6 fc ff ff       	call   104180 <syscall_set_retval1>
		syscall_set_errno(E_INVAL_PID);
  10449a:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  1044a1:	e8 ba fc ff ff       	call   104160 <syscall_set_errno>
		return;
  1044a6:	83 c4 10             	add    $0x10,%esp
	set_curid(pid);

	syscall_set_retval1(0);
	syscall_set_errno(E_SUCC);
	KERN_DEBUG("after sys_fork \n");
  1044a9:	83 c4 08             	add    $0x8,%esp
  1044ac:	5b                   	pop    %ebx
  1044ad:	c3                   	ret    
  1044ae:	66 90                	xchg   %ax,%ax

001044b0 <syscall_dispatch>:
#include <lib/syscall.h>

#include "import.h"

void syscall_dispatch(void)
{
  1044b0:	83 ec 0c             	sub    $0xc,%esp
	unsigned int nr;

	nr = syscall_get_arg1();
  1044b3:	e8 e8 fb ff ff       	call   1040a0 <syscall_get_arg1>

	switch (nr) {
  1044b8:	83 f8 01             	cmp    $0x1,%eax
  1044bb:	74 43                	je     104500 <syscall_dispatch+0x50>
  1044bd:	72 31                	jb     1044f0 <syscall_dispatch+0x40>
  1044bf:	83 f8 02             	cmp    $0x2,%eax
  1044c2:	74 14                	je     1044d8 <syscall_dispatch+0x28>
  1044c4:	83 f8 03             	cmp    $0x3,%eax
  1044c7:	75 17                	jne    1044e0 <syscall_dispatch+0x30>
		sys_fork();
		break;
	default:
		syscall_set_errno(E_INVAL_CALLNR);
	}
}
  1044c9:	83 c4 0c             	add    $0xc,%esp
		 *   None.
		 */
		sys_yield();
		break;
	case SYS_fork:
		sys_fork();
  1044cc:	e9 4f ff ff ff       	jmp    104420 <sys_fork>
  1044d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		break;
	default:
		syscall_set_errno(E_INVAL_CALLNR);
	}
}
  1044d8:	83 c4 0c             	add    $0xc,%esp
		 *   None.
		 *
		 * Error:
		 *   None.
		 */
		sys_yield();
  1044db:	e9 20 ff ff ff       	jmp    104400 <sys_yield>
		break;
	case SYS_fork:
		sys_fork();
		break;
	default:
		syscall_set_errno(E_INVAL_CALLNR);
  1044e0:	83 ec 0c             	sub    $0xc,%esp
  1044e3:	6a 03                	push   $0x3
  1044e5:	e8 76 fc ff ff       	call   104160 <syscall_set_errno>
	}
}
  1044ea:	83 c4 1c             	add    $0x1c,%esp
  1044ed:	c3                   	ret    
  1044ee:	66 90                	xchg   %ax,%ax
  1044f0:	83 c4 0c             	add    $0xc,%esp
		 *   None.
		 *
		 * Error:
		 *   E_MEM
		 */
		sys_puts();
  1044f3:	e9 28 fd ff ff       	jmp    104220 <sys_puts>
  1044f8:	90                   	nop
  1044f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		sys_fork();
		break;
	default:
		syscall_set_errno(E_INVAL_CALLNR);
	}
}
  104500:	83 c4 0c             	add    $0xc,%esp
		 *   the process ID of the process
		 *
		 * Error:
		 *   E_INVAL_PID
		 */
		sys_spawn();
  104503:	e9 28 fe ff ff       	jmp    104330 <sys_spawn>
  104508:	66 90                	xchg   %ax,%ax
  10450a:	66 90                	xchg   %ax,%ax
  10450c:	66 90                	xchg   %ax,%ax
  10450e:	66 90                	xchg   %ax,%ax

00104510 <default_exception_handler>:
	KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->esp, tf->esp);
	KERN_DEBUG("\t%08x:\tss:    \t\t%08x\n", &tf->ss, tf->ss);
}

void default_exception_handler(void)
{
  104510:	56                   	push   %esi
  104511:	53                   	push   %ebx
  104512:	83 ec 04             	sub    $0x4,%esp
	unsigned int cur_pid;

	cur_pid = get_curid();
  104515:	e8 26 f9 ff ff       	call   103e40 <get_curid>
  10451a:	6b d8 44             	imul   $0x44,%eax,%ebx
	trap_dump(&uctx_pool[cur_pid]);
  10451d:	8d b3 20 3b df 00    	lea    0xdf3b20(%ebx),%esi
	if (tf == NULL)
		return;

	uintptr_t base = (uintptr_t) tf;

	KERN_DEBUG("trapframe at %x\n", base);
  104523:	56                   	push   %esi
  104524:	68 24 55 10 00       	push   $0x105524
  104529:	6a 15                	push   $0x15
  10452b:	68 a8 56 10 00       	push   $0x1056a8
  104530:	e8 d6 d8 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\tedi:   \t\t%08x\n", &tf->regs.edi, tf->regs.edi);
  104535:	58                   	pop    %eax
  104536:	ff b3 20 3b df 00    	pushl  0xdf3b20(%ebx)
  10453c:	56                   	push   %esi
  10453d:	68 35 55 10 00       	push   $0x105535
  104542:	6a 16                	push   $0x16
  104544:	68 a8 56 10 00       	push   $0x1056a8
  104549:	e8 bd d8 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\tesi:   \t\t%08x\n", &tf->regs.esi, tf->regs.esi);
  10454e:	8d 83 24 3b df 00    	lea    0xdf3b24(%ebx),%eax
  104554:	83 c4 14             	add    $0x14,%esp
  104557:	ff 76 04             	pushl  0x4(%esi)
  10455a:	50                   	push   %eax
  10455b:	68 4b 55 10 00       	push   $0x10554b
  104560:	6a 17                	push   $0x17
  104562:	68 a8 56 10 00       	push   $0x1056a8
  104567:	e8 9f d8 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\tebp:   \t\t%08x\n", &tf->regs.ebp, tf->regs.ebp);
  10456c:	8d 83 28 3b df 00    	lea    0xdf3b28(%ebx),%eax
  104572:	83 c4 14             	add    $0x14,%esp
  104575:	ff 76 08             	pushl  0x8(%esi)
  104578:	50                   	push   %eax
  104579:	68 61 55 10 00       	push   $0x105561
  10457e:	6a 18                	push   $0x18
  104580:	68 a8 56 10 00       	push   $0x1056a8
  104585:	e8 81 d8 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->regs.oesp, tf->regs.oesp);
  10458a:	8d 83 2c 3b df 00    	lea    0xdf3b2c(%ebx),%eax
  104590:	83 c4 14             	add    $0x14,%esp
  104593:	ff 76 0c             	pushl  0xc(%esi)
  104596:	50                   	push   %eax
  104597:	68 77 55 10 00       	push   $0x105577
  10459c:	6a 19                	push   $0x19
  10459e:	68 a8 56 10 00       	push   $0x1056a8
  1045a3:	e8 63 d8 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\tebx:   \t\t%08x\n", &tf->regs.ebx, tf->regs.ebx);
  1045a8:	8d 83 30 3b df 00    	lea    0xdf3b30(%ebx),%eax
  1045ae:	83 c4 14             	add    $0x14,%esp
  1045b1:	ff 76 10             	pushl  0x10(%esi)
  1045b4:	50                   	push   %eax
  1045b5:	68 8d 55 10 00       	push   $0x10558d
  1045ba:	6a 1a                	push   $0x1a
  1045bc:	68 a8 56 10 00       	push   $0x1056a8
  1045c1:	e8 45 d8 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\tedx:   \t\t%08x\n", &tf->regs.edx, tf->regs.edx);
  1045c6:	8d 83 34 3b df 00    	lea    0xdf3b34(%ebx),%eax
  1045cc:	83 c4 14             	add    $0x14,%esp
  1045cf:	ff 76 14             	pushl  0x14(%esi)
  1045d2:	50                   	push   %eax
  1045d3:	68 a3 55 10 00       	push   $0x1055a3
  1045d8:	6a 1b                	push   $0x1b
  1045da:	68 a8 56 10 00       	push   $0x1056a8
  1045df:	e8 27 d8 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\tecx:   \t\t%08x\n", &tf->regs.ecx, tf->regs.ecx);
  1045e4:	8d 83 38 3b df 00    	lea    0xdf3b38(%ebx),%eax
  1045ea:	83 c4 14             	add    $0x14,%esp
  1045ed:	ff 76 18             	pushl  0x18(%esi)
  1045f0:	50                   	push   %eax
  1045f1:	68 b9 55 10 00       	push   $0x1055b9
  1045f6:	6a 1c                	push   $0x1c
  1045f8:	68 a8 56 10 00       	push   $0x1056a8
  1045fd:	e8 09 d8 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\teax:   \t\t%08x\n", &tf->regs.eax, tf->regs.eax);
  104602:	8d 83 3c 3b df 00    	lea    0xdf3b3c(%ebx),%eax
  104608:	83 c4 14             	add    $0x14,%esp
  10460b:	ff 76 1c             	pushl  0x1c(%esi)
  10460e:	50                   	push   %eax
  10460f:	68 cf 55 10 00       	push   $0x1055cf
  104614:	6a 1d                	push   $0x1d
  104616:	68 a8 56 10 00       	push   $0x1056a8
  10461b:	e8 eb d7 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\tes:    \t\t%08x\n", &tf->es, tf->es);
  104620:	0f b7 46 20          	movzwl 0x20(%esi),%eax
  104624:	83 c4 14             	add    $0x14,%esp
  104627:	50                   	push   %eax
  104628:	8d 83 40 3b df 00    	lea    0xdf3b40(%ebx),%eax
  10462e:	50                   	push   %eax
  10462f:	68 e5 55 10 00       	push   $0x1055e5
  104634:	6a 1e                	push   $0x1e
  104636:	68 a8 56 10 00       	push   $0x1056a8
  10463b:	e8 cb d7 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\tds:    \t\t%08x\n", &tf->ds, tf->ds);
  104640:	0f b7 46 24          	movzwl 0x24(%esi),%eax
  104644:	83 c4 14             	add    $0x14,%esp
  104647:	50                   	push   %eax
  104648:	8d 83 44 3b df 00    	lea    0xdf3b44(%ebx),%eax
  10464e:	50                   	push   %eax
  10464f:	68 fb 55 10 00       	push   $0x1055fb
  104654:	6a 1f                	push   $0x1f
  104656:	68 a8 56 10 00       	push   $0x1056a8
  10465b:	e8 ab d7 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\ttrapno:\t\t%08x\n", &tf->trapno, tf->trapno);
  104660:	8d 83 48 3b df 00    	lea    0xdf3b48(%ebx),%eax
  104666:	83 c4 14             	add    $0x14,%esp
  104669:	ff 76 28             	pushl  0x28(%esi)
  10466c:	50                   	push   %eax
  10466d:	68 11 56 10 00       	push   $0x105611
  104672:	6a 20                	push   $0x20
  104674:	68 a8 56 10 00       	push   $0x1056a8
  104679:	e8 8d d7 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\terr:   \t\t%08x\n", &tf->err, tf->err);
  10467e:	8d 83 4c 3b df 00    	lea    0xdf3b4c(%ebx),%eax
  104684:	83 c4 14             	add    $0x14,%esp
  104687:	ff 76 2c             	pushl  0x2c(%esi)
  10468a:	50                   	push   %eax
  10468b:	68 27 56 10 00       	push   $0x105627
  104690:	6a 21                	push   $0x21
  104692:	68 a8 56 10 00       	push   $0x1056a8
  104697:	e8 6f d7 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\teip:   \t\t%08x\n", &tf->eip, tf->eip);
  10469c:	8d 83 50 3b df 00    	lea    0xdf3b50(%ebx),%eax
  1046a2:	83 c4 14             	add    $0x14,%esp
  1046a5:	ff 76 30             	pushl  0x30(%esi)
  1046a8:	50                   	push   %eax
  1046a9:	68 3d 56 10 00       	push   $0x10563d
  1046ae:	6a 22                	push   $0x22
  1046b0:	68 a8 56 10 00       	push   $0x1056a8
  1046b5:	e8 51 d7 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\tcs:    \t\t%08x\n", &tf->cs, tf->cs);
  1046ba:	0f b7 46 34          	movzwl 0x34(%esi),%eax
  1046be:	83 c4 14             	add    $0x14,%esp
  1046c1:	50                   	push   %eax
  1046c2:	8d 83 54 3b df 00    	lea    0xdf3b54(%ebx),%eax
  1046c8:	50                   	push   %eax
  1046c9:	68 53 56 10 00       	push   $0x105653
  1046ce:	6a 23                	push   $0x23
  1046d0:	68 a8 56 10 00       	push   $0x1056a8
  1046d5:	e8 31 d7 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\teflags:\t\t%08x\n", &tf->eflags, tf->eflags);
  1046da:	8d 83 58 3b df 00    	lea    0xdf3b58(%ebx),%eax
  1046e0:	83 c4 14             	add    $0x14,%esp
  1046e3:	ff 76 38             	pushl  0x38(%esi)
  1046e6:	50                   	push   %eax
  1046e7:	68 69 56 10 00       	push   $0x105669
  1046ec:	6a 24                	push   $0x24
  1046ee:	68 a8 56 10 00       	push   $0x1056a8
  1046f3:	e8 13 d7 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->esp, tf->esp);
  1046f8:	8d 83 5c 3b df 00    	lea    0xdf3b5c(%ebx),%eax
  1046fe:	83 c4 14             	add    $0x14,%esp
  104701:	ff 76 3c             	pushl  0x3c(%esi)
	KERN_DEBUG("\t%08x:\tss:    \t\t%08x\n", &tf->ss, tf->ss);
  104704:	81 c3 60 3b df 00    	add    $0xdf3b60,%ebx
	KERN_DEBUG("\t%08x:\ttrapno:\t\t%08x\n", &tf->trapno, tf->trapno);
	KERN_DEBUG("\t%08x:\terr:   \t\t%08x\n", &tf->err, tf->err);
	KERN_DEBUG("\t%08x:\teip:   \t\t%08x\n", &tf->eip, tf->eip);
	KERN_DEBUG("\t%08x:\tcs:    \t\t%08x\n", &tf->cs, tf->cs);
	KERN_DEBUG("\t%08x:\teflags:\t\t%08x\n", &tf->eflags, tf->eflags);
	KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->esp, tf->esp);
  10470a:	50                   	push   %eax
  10470b:	68 77 55 10 00       	push   $0x105577
  104710:	6a 25                	push   $0x25
  104712:	68 a8 56 10 00       	push   $0x1056a8
  104717:	e8 ef d6 ff ff       	call   101e0b <debug_normal>
	KERN_DEBUG("\t%08x:\tss:    \t\t%08x\n", &tf->ss, tf->ss);
  10471c:	0f b7 46 40          	movzwl 0x40(%esi),%eax
  104720:	83 c4 14             	add    $0x14,%esp
  104723:	50                   	push   %eax
  104724:	53                   	push   %ebx
  104725:	68 7f 56 10 00       	push   $0x10567f
  10472a:	6a 26                	push   $0x26
  10472c:	68 a8 56 10 00       	push   $0x1056a8
  104731:	e8 d5 d6 ff ff       	call   101e0b <debug_normal>
	unsigned int cur_pid;

	cur_pid = get_curid();
	trap_dump(&uctx_pool[cur_pid]);

	KERN_PANIC("Trap %d @ 0x%08x.\n", uctx_pool[cur_pid].trapno, uctx_pool[cur_pid].eip);
  104736:	83 c4 14             	add    $0x14,%esp
  104739:	ff 76 30             	pushl  0x30(%esi)
  10473c:	ff 76 28             	pushl  0x28(%esi)
  10473f:	68 95 56 10 00       	push   $0x105695
  104744:	6a 30                	push   $0x30
  104746:	68 a8 56 10 00       	push   $0x1056a8
  10474b:	e8 e5 d6 ff ff       	call   101e35 <debug_panic>
}
  104750:	83 c4 24             	add    $0x24,%esp
  104753:	5b                   	pop    %ebx
  104754:	5e                   	pop    %esi
  104755:	c3                   	ret    
  104756:	8d 76 00             	lea    0x0(%esi),%esi
  104759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104760 <pgflt_handler>:

void pgflt_handler(void)
{
  104760:	57                   	push   %edi
  104761:	56                   	push   %esi
  104762:	53                   	push   %ebx
	unsigned int cur_pid;
	unsigned int errno;
	unsigned int fault_va;
	unsigned int pte_entry;

	cur_pid = get_curid();
  104763:	e8 d8 f6 ff ff       	call   103e40 <get_curid>
  104768:	89 c6                	mov    %eax,%esi
	errno = uctx_pool[cur_pid].err;
  10476a:	6b c0 44             	imul   $0x44,%eax,%eax
  10476d:	8b 98 4c 3b df 00    	mov    0xdf3b4c(%eax),%ebx
	fault_va = rcr2();
  104773:	e8 2c e0 ff ff       	call   1027a4 <rcr2>
  104778:	89 c7                	mov    %eax,%edi

	if ((errno & 0x3) == 0x3){
  10477a:	89 d8                	mov    %ebx,%eax
  10477c:	83 e0 03             	and    $0x3,%eax
  10477f:	83 f8 03             	cmp    $0x3,%eax
  104782:	74 64                	je     1047e8 <pgflt_handler+0x88>
	}

  //Uncomment this line if you need to see the information of the sequence of page faults occured.
	//KERN_DEBUG("Page fault: VA 0x%08x, errno 0x%08x, process %d, EIP 0x%08x.\n", fault_va, errno, cur_pid, uctx_pool[cur_pid].eip);

	if (errno & PFE_PR) {
  104784:	f6 c3 01             	test   $0x1,%bl
  104787:	75 1f                	jne    1047a8 <pgflt_handler+0x48>
		KERN_PANIC("Permission denied: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);
		return;
	}

	if (alloc_page(cur_pid, fault_va, PTE_W | PTE_U | PTE_P) == MagicNumber)
  104789:	83 ec 04             	sub    $0x4,%esp
  10478c:	6a 07                	push   $0x7
  10478e:	57                   	push   %edi
  10478f:	56                   	push   %esi
  104790:	e8 fb f1 ff ff       	call   103990 <alloc_page>
  104795:	83 c4 10             	add    $0x10,%esp
  104798:	3d 01 00 10 00       	cmp    $0x100001,%eax
  10479d:	74 29                	je     1047c8 <pgflt_handler+0x68>
    KERN_PANIC("Page allocation failed: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);

}
  10479f:	5b                   	pop    %ebx
  1047a0:	5e                   	pop    %esi
  1047a1:	5f                   	pop    %edi
  1047a2:	c3                   	ret    
  1047a3:	90                   	nop
  1047a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  //Uncomment this line if you need to see the information of the sequence of page faults occured.
	//KERN_DEBUG("Page fault: VA 0x%08x, errno 0x%08x, process %d, EIP 0x%08x.\n", fault_va, errno, cur_pid, uctx_pool[cur_pid].eip);

	if (errno & PFE_PR) {
		KERN_PANIC("Permission denied: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);
  1047a8:	83 ec 0c             	sub    $0xc,%esp
  1047ab:	53                   	push   %ebx
  1047ac:	57                   	push   %edi
  1047ad:	68 f4 56 10 00       	push   $0x1056f4
  1047b2:	6a 4e                	push   $0x4e
  1047b4:	68 a8 56 10 00       	push   $0x1056a8
  1047b9:	e8 77 d6 ff ff       	call   101e35 <debug_panic>
		return;
  1047be:	83 c4 20             	add    $0x20,%esp
	}

	if (alloc_page(cur_pid, fault_va, PTE_W | PTE_U | PTE_P) == MagicNumber)
    KERN_PANIC("Page allocation failed: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);

}
  1047c1:	5b                   	pop    %ebx
  1047c2:	5e                   	pop    %esi
  1047c3:	5f                   	pop    %edi
  1047c4:	c3                   	ret    
  1047c5:	8d 76 00             	lea    0x0(%esi),%esi
		KERN_PANIC("Permission denied: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);
		return;
	}

	if (alloc_page(cur_pid, fault_va, PTE_W | PTE_U | PTE_P) == MagicNumber)
    KERN_PANIC("Page allocation failed: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);
  1047c8:	83 ec 0c             	sub    $0xc,%esp
  1047cb:	53                   	push   %ebx
  1047cc:	57                   	push   %edi
  1047cd:	68 28 57 10 00       	push   $0x105728
  1047d2:	6a 53                	push   $0x53
  1047d4:	68 a8 56 10 00       	push   $0x1056a8
  1047d9:	e8 57 d6 ff ff       	call   101e35 <debug_panic>
  1047de:	83 c4 20             	add    $0x20,%esp

}
  1047e1:	5b                   	pop    %ebx
  1047e2:	5e                   	pop    %esi
  1047e3:	5f                   	pop    %edi
  1047e4:	c3                   	ret    
  1047e5:	8d 76 00             	lea    0x0(%esi),%esi
	errno = uctx_pool[cur_pid].err;
	fault_va = rcr2();

	if ((errno & 0x3) == 0x3){
		// error for writing to a read-only page
		pte_entry = get_ptbl_entry_by_va(cur_pid, fault_va);
  1047e8:	83 ec 08             	sub    $0x8,%esp
  1047eb:	57                   	push   %edi
  1047ec:	56                   	push   %esi
  1047ed:	e8 be ed ff ff       	call   1035b0 <get_ptbl_entry_by_va>
		if (pte_entry & PTE_COW){
  1047f2:	83 c4 10             	add    $0x10,%esp
  1047f5:	f6 c4 08             	test   $0x8,%ah
  1047f8:	74 16                	je     104810 <pgflt_handler+0xb0>
			// handling copy-on-write
			// TODO
			cpy_cow(cur_pid, fault_va);
  1047fa:	83 ec 08             	sub    $0x8,%esp
  1047fd:	57                   	push   %edi
  1047fe:	56                   	push   %esi
  1047ff:	e8 ec f1 ff ff       	call   1039f0 <cpy_cow>
  104804:	83 c4 10             	add    $0x10,%esp
  104807:	e9 78 ff ff ff       	jmp    104784 <pgflt_handler+0x24>
  10480c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		}else{
			KERN_PANIC("Writing to read-only page: va = %p\n", fault_va);
  104810:	57                   	push   %edi
  104811:	68 d0 56 10 00       	push   $0x1056d0
  104816:	6a 46                	push   $0x46
  104818:	68 a8 56 10 00       	push   $0x1056a8
  10481d:	e8 13 d6 ff ff       	call   101e35 <debug_panic>
  104822:	83 c4 10             	add    $0x10,%esp
  104825:	e9 5a ff ff ff       	jmp    104784 <pgflt_handler+0x24>
  10482a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104830 <exception_handler>:
/**
 * We currently only handle the page fault exception.
 * All other exceptions should be routed to the default exception handler.
 */
void exception_handler(void)
{
  104830:	83 ec 0c             	sub    $0xc,%esp
  // TODO
	unsigned int pid = get_curid();
  104833:	e8 08 f6 ff ff       	call   103e40 <get_curid>
	uint32_t trapno = uctx_pool[pid].trapno;
  104838:	6b c0 44             	imul   $0x44,%eax,%eax
	if (trapno == T_PGFLT)
  10483b:	83 b8 48 3b df 00 0e 	cmpl   $0xe,0xdf3b48(%eax)
  104842:	74 0c                	je     104850 <exception_handler+0x20>
		pgflt_handler();
	} else {
		default_exception_handler();	
	}
	
}
  104844:	83 c4 0c             	add    $0xc,%esp
	uint32_t trapno = uctx_pool[pid].trapno;
	if (trapno == T_PGFLT)
	{	
		pgflt_handler();
	} else {
		default_exception_handler();	
  104847:	e9 c4 fc ff ff       	jmp    104510 <default_exception_handler>
  10484c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	}
	
}
  104850:	83 c4 0c             	add    $0xc,%esp
  // TODO
	unsigned int pid = get_curid();
	uint32_t trapno = uctx_pool[pid].trapno;
	if (trapno == T_PGFLT)
	{	
		pgflt_handler();
  104853:	e9 08 ff ff ff       	jmp    104760 <pgflt_handler>
  104858:	90                   	nop
  104859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104860 <interrupt_handler>:
/**
 * Any interrupt request except the spurious or timer should be
 * routed to the default interrupt handler.
 */
void interrupt_handler (void)
{
  104860:	83 ec 0c             	sub    $0xc,%esp
	unsigned int pid = get_curid();
  104863:	e8 d8 f5 ff ff       	call   103e40 <get_curid>
	uint32_t trapno = uctx_pool[pid].trapno;
  104868:	6b c0 44             	imul   $0x44,%eax,%eax
	if (trapno == IRQ_SPURIOUS)
  10486b:	83 b8 48 3b df 00 07 	cmpl   $0x7,0xdf3b48(%eax)
  104872:	74 0c                	je     104880 <interrupt_handler+0x20>
		timer_intr_handler();
	} else {
		default_intr_handler();	
	}
    
}
  104874:	83 c4 0c             	add    $0xc,%esp
    return 0;
}

static int timer_intr_handler (void)
{
    intr_eoi ();
  104877:	e9 a5 cc ff ff       	jmp    101521 <intr_eoi>
  10487c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		timer_intr_handler();
	} else {
		default_intr_handler();	
	}
    
}
  104880:	83 c4 0c             	add    $0xc,%esp
  104883:	c3                   	ret    
  104884:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10488a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00104890 <trap>:

void trap (tf_t *tf)
{
  104890:	57                   	push   %edi
  104891:	56                   	push   %esi
  104892:	53                   	push   %ebx
  104893:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    unsigned int cur_pid;

    cur_pid = get_curid ();
  104897:	e8 a4 f5 ff ff       	call   103e40 <get_curid>
    uctx_pool[cur_pid] = *tf; //save the current user context (trap frame).
  10489c:	6b c0 44             	imul   $0x44,%eax,%eax
    set_pdir_base (0); //switch to the kernel's page table.
  10489f:	83 ec 0c             	sub    $0xc,%esp
void trap (tf_t *tf)
{
    unsigned int cur_pid;

    cur_pid = get_curid ();
    uctx_pool[cur_pid] = *tf; //save the current user context (trap frame).
  1048a2:	b9 11 00 00 00       	mov    $0x11,%ecx
  1048a7:	89 de                	mov    %ebx,%esi
  1048a9:	05 20 3b df 00       	add    $0xdf3b20,%eax
  1048ae:	89 c7                	mov    %eax,%edi
  1048b0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    set_pdir_base (0); //switch to the kernel's page table.
  1048b2:	6a 00                	push   $0x0
  1048b4:	e8 b7 eb ff ff       	call   103470 <set_pdir_base>

    if (T_DIVIDE <= tf->trapno && tf->trapno <= T_SECEV)
  1048b9:	8b 43 28             	mov    0x28(%ebx),%eax
  1048bc:	83 c4 10             	add    $0x10,%esp
  1048bf:	83 f8 1e             	cmp    $0x1e,%eax
  1048c2:	76 1c                	jbe    1048e0 <trap+0x50>
        exception_handler ();
    else if (T_IRQ0 + IRQ_TIMER <= tf->trapno && tf->trapno <= T_IRQ0 + IRQ_IDE2)
  1048c4:	8d 50 e0             	lea    -0x20(%eax),%edx
  1048c7:	83 fa 0f             	cmp    $0xf,%edx
  1048ca:	76 24                	jbe    1048f0 <trap+0x60>
        interrupt_handler ();
    else if (tf->trapno == T_SYSCALL)
  1048cc:	83 f8 30             	cmp    $0x30,%eax
  1048cf:	74 2f                	je     104900 <trap+0x70>
        syscall_dispatch ();

    proc_start_user (); //trap handled. jump back to the user. This is where you switch the TSS and page structure back.
}
  1048d1:	5b                   	pop    %ebx
  1048d2:	5e                   	pop    %esi
  1048d3:	5f                   	pop    %edi
    else if (T_IRQ0 + IRQ_TIMER <= tf->trapno && tf->trapno <= T_IRQ0 + IRQ_IDE2)
        interrupt_handler ();
    else if (tf->trapno == T_SYSCALL)
        syscall_dispatch ();

    proc_start_user (); //trap handled. jump back to the user. This is where you switch the TSS and page structure back.
  1048d4:	e9 57 f6 ff ff       	jmp    103f30 <proc_start_user>
  1048d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cur_pid = get_curid ();
    uctx_pool[cur_pid] = *tf; //save the current user context (trap frame).
    set_pdir_base (0); //switch to the kernel's page table.

    if (T_DIVIDE <= tf->trapno && tf->trapno <= T_SECEV)
        exception_handler ();
  1048e0:	e8 4b ff ff ff       	call   104830 <exception_handler>
        interrupt_handler ();
    else if (tf->trapno == T_SYSCALL)
        syscall_dispatch ();

    proc_start_user (); //trap handled. jump back to the user. This is where you switch the TSS and page structure back.
}
  1048e5:	5b                   	pop    %ebx
  1048e6:	5e                   	pop    %esi
  1048e7:	5f                   	pop    %edi
    else if (T_IRQ0 + IRQ_TIMER <= tf->trapno && tf->trapno <= T_IRQ0 + IRQ_IDE2)
        interrupt_handler ();
    else if (tf->trapno == T_SYSCALL)
        syscall_dispatch ();

    proc_start_user (); //trap handled. jump back to the user. This is where you switch the TSS and page structure back.
  1048e8:	e9 43 f6 ff ff       	jmp    103f30 <proc_start_user>
  1048ed:	8d 76 00             	lea    0x0(%esi),%esi
    set_pdir_base (0); //switch to the kernel's page table.

    if (T_DIVIDE <= tf->trapno && tf->trapno <= T_SECEV)
        exception_handler ();
    else if (T_IRQ0 + IRQ_TIMER <= tf->trapno && tf->trapno <= T_IRQ0 + IRQ_IDE2)
        interrupt_handler ();
  1048f0:	e8 6b ff ff ff       	call   104860 <interrupt_handler>
    else if (tf->trapno == T_SYSCALL)
        syscall_dispatch ();

    proc_start_user (); //trap handled. jump back to the user. This is where you switch the TSS and page structure back.
}
  1048f5:	5b                   	pop    %ebx
  1048f6:	5e                   	pop    %esi
  1048f7:	5f                   	pop    %edi
    else if (T_IRQ0 + IRQ_TIMER <= tf->trapno && tf->trapno <= T_IRQ0 + IRQ_IDE2)
        interrupt_handler ();
    else if (tf->trapno == T_SYSCALL)
        syscall_dispatch ();

    proc_start_user (); //trap handled. jump back to the user. This is where you switch the TSS and page structure back.
  1048f8:	e9 33 f6 ff ff       	jmp    103f30 <proc_start_user>
  1048fd:	8d 76 00             	lea    0x0(%esi),%esi
    if (T_DIVIDE <= tf->trapno && tf->trapno <= T_SECEV)
        exception_handler ();
    else if (T_IRQ0 + IRQ_TIMER <= tf->trapno && tf->trapno <= T_IRQ0 + IRQ_IDE2)
        interrupt_handler ();
    else if (tf->trapno == T_SYSCALL)
        syscall_dispatch ();
  104900:	e8 ab fb ff ff       	call   1044b0 <syscall_dispatch>

    proc_start_user (); //trap handled. jump back to the user. This is where you switch the TSS and page structure back.
}
  104905:	5b                   	pop    %ebx
  104906:	5e                   	pop    %esi
  104907:	5f                   	pop    %edi
    else if (T_IRQ0 + IRQ_TIMER <= tf->trapno && tf->trapno <= T_IRQ0 + IRQ_IDE2)
        interrupt_handler ();
    else if (tf->trapno == T_SYSCALL)
        syscall_dispatch ();

    proc_start_user (); //trap handled. jump back to the user. This is where you switch the TSS and page structure back.
  104908:	e9 23 f6 ff ff       	jmp    103f30 <proc_start_user>
  10490d:	66 90                	xchg   %ax,%ax
  10490f:	90                   	nop

00104910 <__udivdi3>:
  104910:	55                   	push   %ebp
  104911:	57                   	push   %edi
  104912:	56                   	push   %esi
  104913:	53                   	push   %ebx
  104914:	83 ec 1c             	sub    $0x1c,%esp
  104917:	8b 74 24 3c          	mov    0x3c(%esp),%esi
  10491b:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  10491f:	8b 4c 24 34          	mov    0x34(%esp),%ecx
  104923:	8b 7c 24 38          	mov    0x38(%esp),%edi
  104927:	85 f6                	test   %esi,%esi
  104929:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  10492d:	89 ca                	mov    %ecx,%edx
  10492f:	89 f8                	mov    %edi,%eax
  104931:	75 3d                	jne    104970 <__udivdi3+0x60>
  104933:	39 cf                	cmp    %ecx,%edi
  104935:	0f 87 c5 00 00 00    	ja     104a00 <__udivdi3+0xf0>
  10493b:	85 ff                	test   %edi,%edi
  10493d:	89 fd                	mov    %edi,%ebp
  10493f:	75 0b                	jne    10494c <__udivdi3+0x3c>
  104941:	b8 01 00 00 00       	mov    $0x1,%eax
  104946:	31 d2                	xor    %edx,%edx
  104948:	f7 f7                	div    %edi
  10494a:	89 c5                	mov    %eax,%ebp
  10494c:	89 c8                	mov    %ecx,%eax
  10494e:	31 d2                	xor    %edx,%edx
  104950:	f7 f5                	div    %ebp
  104952:	89 c1                	mov    %eax,%ecx
  104954:	89 d8                	mov    %ebx,%eax
  104956:	89 cf                	mov    %ecx,%edi
  104958:	f7 f5                	div    %ebp
  10495a:	89 c3                	mov    %eax,%ebx
  10495c:	89 d8                	mov    %ebx,%eax
  10495e:	89 fa                	mov    %edi,%edx
  104960:	83 c4 1c             	add    $0x1c,%esp
  104963:	5b                   	pop    %ebx
  104964:	5e                   	pop    %esi
  104965:	5f                   	pop    %edi
  104966:	5d                   	pop    %ebp
  104967:	c3                   	ret    
  104968:	90                   	nop
  104969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104970:	39 ce                	cmp    %ecx,%esi
  104972:	77 74                	ja     1049e8 <__udivdi3+0xd8>
  104974:	0f bd fe             	bsr    %esi,%edi
  104977:	83 f7 1f             	xor    $0x1f,%edi
  10497a:	0f 84 98 00 00 00    	je     104a18 <__udivdi3+0x108>
  104980:	bb 20 00 00 00       	mov    $0x20,%ebx
  104985:	89 f9                	mov    %edi,%ecx
  104987:	89 c5                	mov    %eax,%ebp
  104989:	29 fb                	sub    %edi,%ebx
  10498b:	d3 e6                	shl    %cl,%esi
  10498d:	89 d9                	mov    %ebx,%ecx
  10498f:	d3 ed                	shr    %cl,%ebp
  104991:	89 f9                	mov    %edi,%ecx
  104993:	d3 e0                	shl    %cl,%eax
  104995:	09 ee                	or     %ebp,%esi
  104997:	89 d9                	mov    %ebx,%ecx
  104999:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10499d:	89 d5                	mov    %edx,%ebp
  10499f:	8b 44 24 08          	mov    0x8(%esp),%eax
  1049a3:	d3 ed                	shr    %cl,%ebp
  1049a5:	89 f9                	mov    %edi,%ecx
  1049a7:	d3 e2                	shl    %cl,%edx
  1049a9:	89 d9                	mov    %ebx,%ecx
  1049ab:	d3 e8                	shr    %cl,%eax
  1049ad:	09 c2                	or     %eax,%edx
  1049af:	89 d0                	mov    %edx,%eax
  1049b1:	89 ea                	mov    %ebp,%edx
  1049b3:	f7 f6                	div    %esi
  1049b5:	89 d5                	mov    %edx,%ebp
  1049b7:	89 c3                	mov    %eax,%ebx
  1049b9:	f7 64 24 0c          	mull   0xc(%esp)
  1049bd:	39 d5                	cmp    %edx,%ebp
  1049bf:	72 10                	jb     1049d1 <__udivdi3+0xc1>
  1049c1:	8b 74 24 08          	mov    0x8(%esp),%esi
  1049c5:	89 f9                	mov    %edi,%ecx
  1049c7:	d3 e6                	shl    %cl,%esi
  1049c9:	39 c6                	cmp    %eax,%esi
  1049cb:	73 07                	jae    1049d4 <__udivdi3+0xc4>
  1049cd:	39 d5                	cmp    %edx,%ebp
  1049cf:	75 03                	jne    1049d4 <__udivdi3+0xc4>
  1049d1:	83 eb 01             	sub    $0x1,%ebx
  1049d4:	31 ff                	xor    %edi,%edi
  1049d6:	89 d8                	mov    %ebx,%eax
  1049d8:	89 fa                	mov    %edi,%edx
  1049da:	83 c4 1c             	add    $0x1c,%esp
  1049dd:	5b                   	pop    %ebx
  1049de:	5e                   	pop    %esi
  1049df:	5f                   	pop    %edi
  1049e0:	5d                   	pop    %ebp
  1049e1:	c3                   	ret    
  1049e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1049e8:	31 ff                	xor    %edi,%edi
  1049ea:	31 db                	xor    %ebx,%ebx
  1049ec:	89 d8                	mov    %ebx,%eax
  1049ee:	89 fa                	mov    %edi,%edx
  1049f0:	83 c4 1c             	add    $0x1c,%esp
  1049f3:	5b                   	pop    %ebx
  1049f4:	5e                   	pop    %esi
  1049f5:	5f                   	pop    %edi
  1049f6:	5d                   	pop    %ebp
  1049f7:	c3                   	ret    
  1049f8:	90                   	nop
  1049f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104a00:	89 d8                	mov    %ebx,%eax
  104a02:	f7 f7                	div    %edi
  104a04:	31 ff                	xor    %edi,%edi
  104a06:	89 c3                	mov    %eax,%ebx
  104a08:	89 d8                	mov    %ebx,%eax
  104a0a:	89 fa                	mov    %edi,%edx
  104a0c:	83 c4 1c             	add    $0x1c,%esp
  104a0f:	5b                   	pop    %ebx
  104a10:	5e                   	pop    %esi
  104a11:	5f                   	pop    %edi
  104a12:	5d                   	pop    %ebp
  104a13:	c3                   	ret    
  104a14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104a18:	39 ce                	cmp    %ecx,%esi
  104a1a:	72 0c                	jb     104a28 <__udivdi3+0x118>
  104a1c:	31 db                	xor    %ebx,%ebx
  104a1e:	3b 44 24 08          	cmp    0x8(%esp),%eax
  104a22:	0f 87 34 ff ff ff    	ja     10495c <__udivdi3+0x4c>
  104a28:	bb 01 00 00 00       	mov    $0x1,%ebx
  104a2d:	e9 2a ff ff ff       	jmp    10495c <__udivdi3+0x4c>
  104a32:	66 90                	xchg   %ax,%ax
  104a34:	66 90                	xchg   %ax,%ax
  104a36:	66 90                	xchg   %ax,%ax
  104a38:	66 90                	xchg   %ax,%ax
  104a3a:	66 90                	xchg   %ax,%ax
  104a3c:	66 90                	xchg   %ax,%ax
  104a3e:	66 90                	xchg   %ax,%ax

00104a40 <__umoddi3>:
  104a40:	55                   	push   %ebp
  104a41:	57                   	push   %edi
  104a42:	56                   	push   %esi
  104a43:	53                   	push   %ebx
  104a44:	83 ec 1c             	sub    $0x1c,%esp
  104a47:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  104a4b:	8b 4c 24 30          	mov    0x30(%esp),%ecx
  104a4f:	8b 74 24 34          	mov    0x34(%esp),%esi
  104a53:	8b 7c 24 38          	mov    0x38(%esp),%edi
  104a57:	85 c0                	test   %eax,%eax
  104a59:	89 44 24 0c          	mov    %eax,0xc(%esp)
  104a5d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  104a61:	89 3c 24             	mov    %edi,(%esp)
  104a64:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  104a68:	89 f2                	mov    %esi,%edx
  104a6a:	75 14                	jne    104a80 <__umoddi3+0x40>
  104a6c:	39 f7                	cmp    %esi,%edi
  104a6e:	76 40                	jbe    104ab0 <__umoddi3+0x70>
  104a70:	89 c8                	mov    %ecx,%eax
  104a72:	f7 f7                	div    %edi
  104a74:	89 d0                	mov    %edx,%eax
  104a76:	31 d2                	xor    %edx,%edx
  104a78:	83 c4 1c             	add    $0x1c,%esp
  104a7b:	5b                   	pop    %ebx
  104a7c:	5e                   	pop    %esi
  104a7d:	5f                   	pop    %edi
  104a7e:	5d                   	pop    %ebp
  104a7f:	c3                   	ret    
  104a80:	39 f0                	cmp    %esi,%eax
  104a82:	89 f3                	mov    %esi,%ebx
  104a84:	77 4a                	ja     104ad0 <__umoddi3+0x90>
  104a86:	0f bd e8             	bsr    %eax,%ebp
  104a89:	83 f5 1f             	xor    $0x1f,%ebp
  104a8c:	75 52                	jne    104ae0 <__umoddi3+0xa0>
  104a8e:	39 f0                	cmp    %esi,%eax
  104a90:	0f 82 da 00 00 00    	jb     104b70 <__umoddi3+0x130>
  104a96:	39 0c 24             	cmp    %ecx,(%esp)
  104a99:	0f 86 d1 00 00 00    	jbe    104b70 <__umoddi3+0x130>
  104a9f:	8b 44 24 04          	mov    0x4(%esp),%eax
  104aa3:	83 c4 1c             	add    $0x1c,%esp
  104aa6:	5b                   	pop    %ebx
  104aa7:	5e                   	pop    %esi
  104aa8:	5f                   	pop    %edi
  104aa9:	5d                   	pop    %ebp
  104aaa:	c3                   	ret    
  104aab:	90                   	nop
  104aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104ab0:	85 ff                	test   %edi,%edi
  104ab2:	89 fd                	mov    %edi,%ebp
  104ab4:	75 0b                	jne    104ac1 <__umoddi3+0x81>
  104ab6:	b8 01 00 00 00       	mov    $0x1,%eax
  104abb:	31 d2                	xor    %edx,%edx
  104abd:	f7 f7                	div    %edi
  104abf:	89 c5                	mov    %eax,%ebp
  104ac1:	89 f0                	mov    %esi,%eax
  104ac3:	31 d2                	xor    %edx,%edx
  104ac5:	f7 f5                	div    %ebp
  104ac7:	89 c8                	mov    %ecx,%eax
  104ac9:	f7 f5                	div    %ebp
  104acb:	eb a7                	jmp    104a74 <__umoddi3+0x34>
  104acd:	8d 76 00             	lea    0x0(%esi),%esi
  104ad0:	89 c8                	mov    %ecx,%eax
  104ad2:	89 f2                	mov    %esi,%edx
  104ad4:	83 c4 1c             	add    $0x1c,%esp
  104ad7:	5b                   	pop    %ebx
  104ad8:	5e                   	pop    %esi
  104ad9:	5f                   	pop    %edi
  104ada:	5d                   	pop    %ebp
  104adb:	c3                   	ret    
  104adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104ae0:	8b 34 24             	mov    (%esp),%esi
  104ae3:	bf 20 00 00 00       	mov    $0x20,%edi
  104ae8:	89 e9                	mov    %ebp,%ecx
  104aea:	29 ef                	sub    %ebp,%edi
  104aec:	d3 e0                	shl    %cl,%eax
  104aee:	89 f9                	mov    %edi,%ecx
  104af0:	89 f2                	mov    %esi,%edx
  104af2:	d3 ea                	shr    %cl,%edx
  104af4:	89 e9                	mov    %ebp,%ecx
  104af6:	09 c2                	or     %eax,%edx
  104af8:	89 d8                	mov    %ebx,%eax
  104afa:	89 14 24             	mov    %edx,(%esp)
  104afd:	89 f2                	mov    %esi,%edx
  104aff:	d3 e2                	shl    %cl,%edx
  104b01:	89 f9                	mov    %edi,%ecx
  104b03:	89 54 24 04          	mov    %edx,0x4(%esp)
  104b07:	8b 54 24 08          	mov    0x8(%esp),%edx
  104b0b:	d3 e8                	shr    %cl,%eax
  104b0d:	89 e9                	mov    %ebp,%ecx
  104b0f:	89 c6                	mov    %eax,%esi
  104b11:	d3 e3                	shl    %cl,%ebx
  104b13:	89 f9                	mov    %edi,%ecx
  104b15:	89 d0                	mov    %edx,%eax
  104b17:	d3 e8                	shr    %cl,%eax
  104b19:	89 e9                	mov    %ebp,%ecx
  104b1b:	09 d8                	or     %ebx,%eax
  104b1d:	89 d3                	mov    %edx,%ebx
  104b1f:	89 f2                	mov    %esi,%edx
  104b21:	f7 34 24             	divl   (%esp)
  104b24:	89 d6                	mov    %edx,%esi
  104b26:	d3 e3                	shl    %cl,%ebx
  104b28:	f7 64 24 04          	mull   0x4(%esp)
  104b2c:	39 d6                	cmp    %edx,%esi
  104b2e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  104b32:	89 d1                	mov    %edx,%ecx
  104b34:	89 c3                	mov    %eax,%ebx
  104b36:	72 08                	jb     104b40 <__umoddi3+0x100>
  104b38:	75 11                	jne    104b4b <__umoddi3+0x10b>
  104b3a:	39 44 24 08          	cmp    %eax,0x8(%esp)
  104b3e:	73 0b                	jae    104b4b <__umoddi3+0x10b>
  104b40:	2b 44 24 04          	sub    0x4(%esp),%eax
  104b44:	1b 14 24             	sbb    (%esp),%edx
  104b47:	89 d1                	mov    %edx,%ecx
  104b49:	89 c3                	mov    %eax,%ebx
  104b4b:	8b 54 24 08          	mov    0x8(%esp),%edx
  104b4f:	29 da                	sub    %ebx,%edx
  104b51:	19 ce                	sbb    %ecx,%esi
  104b53:	89 f9                	mov    %edi,%ecx
  104b55:	89 f0                	mov    %esi,%eax
  104b57:	d3 e0                	shl    %cl,%eax
  104b59:	89 e9                	mov    %ebp,%ecx
  104b5b:	d3 ea                	shr    %cl,%edx
  104b5d:	89 e9                	mov    %ebp,%ecx
  104b5f:	d3 ee                	shr    %cl,%esi
  104b61:	09 d0                	or     %edx,%eax
  104b63:	89 f2                	mov    %esi,%edx
  104b65:	83 c4 1c             	add    $0x1c,%esp
  104b68:	5b                   	pop    %ebx
  104b69:	5e                   	pop    %esi
  104b6a:	5f                   	pop    %edi
  104b6b:	5d                   	pop    %ebp
  104b6c:	c3                   	ret    
  104b6d:	8d 76 00             	lea    0x0(%esi),%esi
  104b70:	89 f2                	mov    %esi,%edx
  104b72:	29 f9                	sub    %edi,%ecx
  104b74:	1b 54 24 0c          	sbb    0xc(%esp),%edx
  104b78:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  104b7c:	e9 1e ff ff ff       	jmp    104a9f <__umoddi3+0x5f>
