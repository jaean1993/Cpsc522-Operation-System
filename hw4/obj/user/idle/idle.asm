
obj/user/idle/idle:     file format elf32-i386


Disassembly of section .text:

40000000 <_start>:
_start:
	/*
	 * If there are arguments on the stack, then the current stack will not
	 * be aligned to a nice big power-of-two boundary/
	 */
	testl	$0x0fffffff, %esp
40000000:	f7 c4 ff ff ff 0f    	test   $0xfffffff,%esp
	jnz	args_exist
40000006:	75 04                	jne    4000000c <args_exist>

40000008 <noargs>:

noargs:
	/* If no arguments are on the stack, push two dummy zero. */
	pushl	$0
40000008:	6a 00                	push   $0x0
	pushl	$0
4000000a:	6a 00                	push   $0x0

4000000c <args_exist>:

args_exist:
	/* Jump to the C part. */
	call	main
4000000c:	e8 0a 0b 00 00       	call   40000b1b <main>

	/* When returning, push the return value on the stack. */
	pushl	%eax
40000011:	50                   	push   %eax

40000012 <spin>:
spin:
	/*
	 * TODO: replace yield with exit
	 */
	call	yield
40000012:	e8 28 07 00 00       	call   4000073f <yield>
	jmp	spin
40000017:	eb f9                	jmp    40000012 <spin>

40000019 <debug>:
#include <stdarg.h>
#include <stdio.h>

void
debug(const char *file, int line, const char *fmt, ...)
{
40000019:	83 ec 10             	sub    $0x10,%esp
	va_list ap;
	va_start(ap, fmt);
	printf("[D] %s:%d: ", file, line);
4000001c:	ff 74 24 18          	pushl  0x18(%esp)
40000020:	ff 74 24 18          	pushl  0x18(%esp)
40000024:	68 b4 0e 00 40       	push   $0x40000eb4
40000029:	e8 87 01 00 00       	call   400001b5 <printf>
	vcprintf(fmt, ap);
4000002e:	83 c4 08             	add    $0x8,%esp
40000031:	8d 44 24 24          	lea    0x24(%esp),%eax
40000035:	50                   	push   %eax
40000036:	ff 74 24 24          	pushl  0x24(%esp)
4000003a:	e8 22 01 00 00       	call   40000161 <vcprintf>
	va_end(ap);
}
4000003f:	83 c4 1c             	add    $0x1c,%esp
40000042:	c3                   	ret    

40000043 <warn>:

void
warn(const char *file, int line, const char *fmt, ...)
{
40000043:	83 ec 10             	sub    $0x10,%esp
	va_list ap;
	va_start(ap, fmt);
	printf("[W] %s:%d: ", file, line);
40000046:	ff 74 24 18          	pushl  0x18(%esp)
4000004a:	ff 74 24 18          	pushl  0x18(%esp)
4000004e:	68 c0 0e 00 40       	push   $0x40000ec0
40000053:	e8 5d 01 00 00       	call   400001b5 <printf>
	vcprintf(fmt, ap);
40000058:	83 c4 08             	add    $0x8,%esp
4000005b:	8d 44 24 24          	lea    0x24(%esp),%eax
4000005f:	50                   	push   %eax
40000060:	ff 74 24 24          	pushl  0x24(%esp)
40000064:	e8 f8 00 00 00       	call   40000161 <vcprintf>
	va_end(ap);
}
40000069:	83 c4 1c             	add    $0x1c,%esp
4000006c:	c3                   	ret    

4000006d <panic>:

void
panic(const char *file, int line, const char *fmt, ...)
{
4000006d:	83 ec 10             	sub    $0x10,%esp
	va_list ap;
	va_start(ap, fmt);
	printf("[P] %s:%d: ", file, line);
40000070:	ff 74 24 18          	pushl  0x18(%esp)
40000074:	ff 74 24 18          	pushl  0x18(%esp)
40000078:	68 cc 0e 00 40       	push   $0x40000ecc
4000007d:	e8 33 01 00 00       	call   400001b5 <printf>
	vcprintf(fmt, ap);
40000082:	83 c4 08             	add    $0x8,%esp
40000085:	8d 44 24 24          	lea    0x24(%esp),%eax
40000089:	50                   	push   %eax
4000008a:	ff 74 24 24          	pushl  0x24(%esp)
4000008e:	e8 ce 00 00 00       	call   40000161 <vcprintf>
40000093:	83 c4 10             	add    $0x10,%esp
	va_end(ap);

	while (1)
		yield();
40000096:	e8 a4 06 00 00       	call   4000073f <yield>
4000009b:	eb f9                	jmp    40000096 <panic+0x29>

4000009d <atoi>:
#include <stdlib.h>

int
atoi(const char *buf, int *i)
{
4000009d:	55                   	push   %ebp
4000009e:	57                   	push   %edi
4000009f:	56                   	push   %esi
400000a0:	53                   	push   %ebx
400000a1:	83 ec 04             	sub    $0x4,%esp
400000a4:	8b 44 24 18          	mov    0x18(%esp),%eax
400000a8:	89 04 24             	mov    %eax,(%esp)
	int loc = 0;
	int numstart = 0;
	int acc = 0;
	int negative = 0;
	if (buf[loc] == '+')
400000ab:	0f b6 00             	movzbl (%eax),%eax
400000ae:	3c 2b                	cmp    $0x2b,%al
400000b0:	74 17                	je     400000c9 <atoi+0x2c>
		loc++;
	else if (buf[loc] == '-') {
400000b2:	3c 2d                	cmp    $0x2d,%al
400000b4:	74 1f                	je     400000d5 <atoi+0x38>
atoi(const char *buf, int *i)
{
	int loc = 0;
	int numstart = 0;
	int acc = 0;
	int negative = 0;
400000b6:	bf 00 00 00 00       	mov    $0x0,%edi
#include <stdlib.h>

int
atoi(const char *buf, int *i)
{
	int loc = 0;
400000bb:	be 00 00 00 00       	mov    $0x0,%esi
		negative = 1;
		loc++;
	}
	numstart = loc;
	// no grab the numbers
	while ('0' <= buf[loc] && buf[loc] <= '9') {
400000c0:	89 f0                	mov    %esi,%eax
int
atoi(const char *buf, int *i)
{
	int loc = 0;
	int numstart = 0;
	int acc = 0;
400000c2:	b9 00 00 00 00       	mov    $0x0,%ecx
		negative = 1;
		loc++;
	}
	numstart = loc;
	// no grab the numbers
	while ('0' <= buf[loc] && buf[loc] <= '9') {
400000c7:	eb 29                	jmp    400000f2 <atoi+0x55>
atoi(const char *buf, int *i)
{
	int loc = 0;
	int numstart = 0;
	int acc = 0;
	int negative = 0;
400000c9:	bf 00 00 00 00       	mov    $0x0,%edi
	if (buf[loc] == '+')
		loc++;
400000ce:	be 01 00 00 00       	mov    $0x1,%esi
400000d3:	eb eb                	jmp    400000c0 <atoi+0x23>
	else if (buf[loc] == '-') {
		negative = 1;
400000d5:	bf 01 00 00 00       	mov    $0x1,%edi
		loc++;
400000da:	be 01 00 00 00       	mov    $0x1,%esi
400000df:	eb df                	jmp    400000c0 <atoi+0x23>
	}
	numstart = loc;
	// no grab the numbers
	while ('0' <= buf[loc] && buf[loc] <= '9') {
		acc = acc*10 + (buf[loc]-'0');
400000e1:	8d 2c 89             	lea    (%ecx,%ecx,4),%ebp
400000e4:	8d 4c 2d 00          	lea    0x0(%ebp,%ebp,1),%ecx
400000e8:	0f be d2             	movsbl %dl,%edx
400000eb:	8d 4c 0a d0          	lea    -0x30(%edx,%ecx,1),%ecx
		loc++;
400000ef:	83 c0 01             	add    $0x1,%eax
		negative = 1;
		loc++;
	}
	numstart = loc;
	// no grab the numbers
	while ('0' <= buf[loc] && buf[loc] <= '9') {
400000f2:	8b 1c 24             	mov    (%esp),%ebx
400000f5:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
400000f9:	8d 6a d0             	lea    -0x30(%edx),%ebp
400000fc:	89 eb                	mov    %ebp,%ebx
400000fe:	80 fb 09             	cmp    $0x9,%bl
40000101:	76 de                	jbe    400000e1 <atoi+0x44>
		acc = acc*10 + (buf[loc]-'0');
		loc++;
	}
	if (numstart == loc) {
40000103:	39 c6                	cmp    %eax,%esi
40000105:	74 14                	je     4000011b <atoi+0x7e>
		// no numbers have actually been scanned
		return 0;
	}
	if (negative)
40000107:	85 ff                	test   %edi,%edi
40000109:	74 02                	je     4000010d <atoi+0x70>
		acc = - acc;
4000010b:	f7 d9                	neg    %ecx
	*i = acc;
4000010d:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000111:	89 0a                	mov    %ecx,(%edx)
	return loc;
}
40000113:	83 c4 04             	add    $0x4,%esp
40000116:	5b                   	pop    %ebx
40000117:	5e                   	pop    %esi
40000118:	5f                   	pop    %edi
40000119:	5d                   	pop    %ebp
4000011a:	c3                   	ret    
		acc = acc*10 + (buf[loc]-'0');
		loc++;
	}
	if (numstart == loc) {
		// no numbers have actually been scanned
		return 0;
4000011b:	b8 00 00 00 00       	mov    $0x0,%eax
40000120:	eb f1                	jmp    40000113 <atoi+0x76>

40000122 <putch>:
	char buf[MAX_BUF];
};

static void
putch(int ch, struct printbuf *b)
{
40000122:	53                   	push   %ebx
40000123:	8b 54 24 0c          	mov    0xc(%esp),%edx
	b->buf[b->idx++] = ch;
40000127:	8b 02                	mov    (%edx),%eax
40000129:	8d 48 01             	lea    0x1(%eax),%ecx
4000012c:	89 0a                	mov    %ecx,(%edx)
4000012e:	0f b6 5c 24 08       	movzbl 0x8(%esp),%ebx
40000133:	88 5c 02 08          	mov    %bl,0x8(%edx,%eax,1)
	if (b->idx == MAX_BUF-1) {
40000137:	81 f9 ff 0f 00 00    	cmp    $0xfff,%ecx
4000013d:	74 0b                	je     4000014a <putch+0x28>
		b->buf[b->idx] = 0;
		puts(b->buf, b->idx);
		b->idx = 0;
	}
	b->cnt++;
4000013f:	8b 42 04             	mov    0x4(%edx),%eax
40000142:	83 c0 01             	add    $0x1,%eax
40000145:	89 42 04             	mov    %eax,0x4(%edx)
}
40000148:	5b                   	pop    %ebx
40000149:	c3                   	ret    
static void
putch(int ch, struct printbuf *b)
{
	b->buf[b->idx++] = ch;
	if (b->idx == MAX_BUF-1) {
		b->buf[b->idx] = 0;
4000014a:	c6 44 02 09 00       	movb   $0x0,0x9(%edx,%eax,1)
		puts(b->buf, b->idx);
4000014f:	8d 5a 08             	lea    0x8(%edx),%ebx


static gcc_inline void
sys_puts(const char *s, size_t len)
{
	asm volatile("int %0" :
40000152:	b8 00 00 00 00       	mov    $0x0,%eax
40000157:	cd 30                	int    $0x30
		b->idx = 0;
40000159:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
4000015f:	eb de                	jmp    4000013f <putch+0x1d>

40000161 <vcprintf>:
	b->cnt++;
}

int
vcprintf(const char *fmt, va_list ap)
{
40000161:	53                   	push   %ebx
40000162:	81 ec 18 10 00 00    	sub    $0x1018,%esp
	struct printbuf b;

	b.idx = 0;
40000168:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
4000016f:	00 
	b.cnt = 0;
40000170:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000177:	00 
	vprintfmt((void*)putch, &b, fmt, ap);
40000178:	ff b4 24 24 10 00 00 	pushl  0x1024(%esp)
4000017f:	ff b4 24 24 10 00 00 	pushl  0x1024(%esp)
40000186:	8d 44 24 10          	lea    0x10(%esp),%eax
4000018a:	50                   	push   %eax
4000018b:	68 22 01 00 40       	push   $0x40000122
40000190:	e8 6c 01 00 00       	call   40000301 <vprintfmt>

	b.buf[b.idx] = 0;
40000195:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000199:	c6 44 0c 20 00       	movb   $0x0,0x20(%esp,%ecx,1)
4000019e:	8d 5c 24 20          	lea    0x20(%esp),%ebx
400001a2:	b8 00 00 00 00       	mov    $0x0,%eax
400001a7:	cd 30                	int    $0x30
	puts(b.buf, b.idx);

	return b.cnt;
}
400001a9:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400001ad:	81 c4 28 10 00 00    	add    $0x1028,%esp
400001b3:	5b                   	pop    %ebx
400001b4:	c3                   	ret    

400001b5 <printf>:

int
printf(const char *fmt, ...)
{
400001b5:	83 ec 14             	sub    $0x14,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
	cnt = vcprintf(fmt, ap);
400001b8:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400001bc:	50                   	push   %eax
400001bd:	ff 74 24 1c          	pushl  0x1c(%esp)
400001c1:	e8 9b ff ff ff       	call   40000161 <vcprintf>
	va_end(ap);

	return cnt;
}
400001c6:	83 c4 1c             	add    $0x1c,%esp
400001c9:	c3                   	ret    

400001ca <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
400001ca:	55                   	push   %ebp
400001cb:	57                   	push   %edi
400001cc:	56                   	push   %esi
400001cd:	53                   	push   %ebx
400001ce:	83 ec 1c             	sub    $0x1c,%esp
400001d1:	89 c6                	mov    %eax,%esi
400001d3:	89 d7                	mov    %edx,%edi
400001d5:	8b 44 24 30          	mov    0x30(%esp),%eax
400001d9:	8b 54 24 34          	mov    0x34(%esp),%edx
400001dd:	89 44 24 08          	mov    %eax,0x8(%esp)
400001e1:	89 54 24 0c          	mov    %edx,0xc(%esp)
400001e5:	8b 6c 24 40          	mov    0x40(%esp),%ebp
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
400001e9:	8b 4c 24 38          	mov    0x38(%esp),%ecx
400001ed:	bb 00 00 00 00       	mov    $0x0,%ebx
400001f2:	89 0c 24             	mov    %ecx,(%esp)
400001f5:	89 5c 24 04          	mov    %ebx,0x4(%esp)
400001f9:	39 d3                	cmp    %edx,%ebx
400001fb:	72 06                	jb     40000203 <printnum+0x39>
400001fd:	39 44 24 38          	cmp    %eax,0x38(%esp)
40000201:	77 77                	ja     4000027a <printnum+0xb0>
		printnum(putch, putdat, num / base, base, width - 1, padc);
40000203:	83 ec 0c             	sub    $0xc,%esp
40000206:	55                   	push   %ebp
40000207:	8b 44 24 4c          	mov    0x4c(%esp),%eax
4000020b:	8d 58 ff             	lea    -0x1(%eax),%ebx
4000020e:	53                   	push   %ebx
4000020f:	ff 74 24 4c          	pushl  0x4c(%esp)
40000213:	83 ec 08             	sub    $0x8,%esp
40000216:	ff 74 24 24          	pushl  0x24(%esp)
4000021a:	ff 74 24 24          	pushl  0x24(%esp)
4000021e:	ff 74 24 34          	pushl  0x34(%esp)
40000222:	ff 74 24 34          	pushl  0x34(%esp)
40000226:	e8 15 0a 00 00       	call   40000c40 <__udivdi3>
4000022b:	83 c4 18             	add    $0x18,%esp
4000022e:	52                   	push   %edx
4000022f:	50                   	push   %eax
40000230:	89 fa                	mov    %edi,%edx
40000232:	89 f0                	mov    %esi,%eax
40000234:	e8 91 ff ff ff       	call   400001ca <printnum>
40000239:	83 c4 20             	add    $0x20,%esp
4000023c:	eb 11                	jmp    4000024f <printnum+0x85>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
4000023e:	83 ec 08             	sub    $0x8,%esp
40000241:	57                   	push   %edi
40000242:	55                   	push   %ebp
40000243:	ff d6                	call   *%esi
40000245:	83 c4 10             	add    $0x10,%esp
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
40000248:	83 eb 01             	sub    $0x1,%ebx
4000024b:	85 db                	test   %ebx,%ebx
4000024d:	7f ef                	jg     4000023e <printnum+0x74>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
4000024f:	ff 74 24 04          	pushl  0x4(%esp)
40000253:	ff 74 24 04          	pushl  0x4(%esp)
40000257:	ff 74 24 14          	pushl  0x14(%esp)
4000025b:	ff 74 24 14          	pushl  0x14(%esp)
4000025f:	e8 0c 0b 00 00       	call   40000d70 <__umoddi3>
40000264:	83 c4 08             	add    $0x8,%esp
40000267:	57                   	push   %edi
40000268:	0f be 80 d8 0e 00 40 	movsbl 0x40000ed8(%eax),%eax
4000026f:	50                   	push   %eax
40000270:	ff d6                	call   *%esi
}
40000272:	83 c4 2c             	add    $0x2c,%esp
40000275:	5b                   	pop    %ebx
40000276:	5e                   	pop    %esi
40000277:	5f                   	pop    %edi
40000278:	5d                   	pop    %ebp
40000279:	c3                   	ret    
4000027a:	8b 5c 24 3c          	mov    0x3c(%esp),%ebx
4000027e:	eb c8                	jmp    40000248 <printnum+0x7e>

40000280 <getuint>:
// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
	if (lflag >= 2)
40000280:	83 fa 01             	cmp    $0x1,%edx
40000283:	7e 0d                	jle    40000292 <getuint+0x12>
		return va_arg(*ap, unsigned long long);
40000285:	8b 08                	mov    (%eax),%ecx
40000287:	8d 51 08             	lea    0x8(%ecx),%edx
4000028a:	89 10                	mov    %edx,(%eax)
4000028c:	8b 01                	mov    (%ecx),%eax
4000028e:	8b 51 04             	mov    0x4(%ecx),%edx
40000291:	c3                   	ret    
	else if (lflag)
40000292:	85 d2                	test   %edx,%edx
40000294:	75 0f                	jne    400002a5 <getuint+0x25>
		return va_arg(*ap, unsigned long);
	else
		return va_arg(*ap, unsigned int);
40000296:	8b 08                	mov    (%eax),%ecx
40000298:	8d 51 04             	lea    0x4(%ecx),%edx
4000029b:	89 10                	mov    %edx,(%eax)
4000029d:	8b 01                	mov    (%ecx),%eax
4000029f:	ba 00 00 00 00       	mov    $0x0,%edx
}
400002a4:	c3                   	ret    
getuint(va_list *ap, int lflag)
{
	if (lflag >= 2)
		return va_arg(*ap, unsigned long long);
	else if (lflag)
		return va_arg(*ap, unsigned long);
400002a5:	8b 08                	mov    (%eax),%ecx
400002a7:	8d 51 04             	lea    0x4(%ecx),%edx
400002aa:	89 10                	mov    %edx,(%eax)
400002ac:	8b 01                	mov    (%ecx),%eax
400002ae:	ba 00 00 00 00       	mov    $0x0,%edx
400002b3:	c3                   	ret    

400002b4 <getint>:
// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
	if (lflag >= 2)
400002b4:	83 fa 01             	cmp    $0x1,%edx
400002b7:	7e 0d                	jle    400002c6 <getint+0x12>
		return va_arg(*ap, long long);
400002b9:	8b 08                	mov    (%eax),%ecx
400002bb:	8d 51 08             	lea    0x8(%ecx),%edx
400002be:	89 10                	mov    %edx,(%eax)
400002c0:	8b 01                	mov    (%ecx),%eax
400002c2:	8b 51 04             	mov    0x4(%ecx),%edx
400002c5:	c3                   	ret    
	else if (lflag)
400002c6:	85 d2                	test   %edx,%edx
400002c8:	75 0b                	jne    400002d5 <getint+0x21>
		return va_arg(*ap, long);
	else
		return va_arg(*ap, int);
400002ca:	8b 08                	mov    (%eax),%ecx
400002cc:	8d 51 04             	lea    0x4(%ecx),%edx
400002cf:	89 10                	mov    %edx,(%eax)
400002d1:	8b 01                	mov    (%ecx),%eax
400002d3:	99                   	cltd   
}
400002d4:	c3                   	ret    
getint(va_list *ap, int lflag)
{
	if (lflag >= 2)
		return va_arg(*ap, long long);
	else if (lflag)
		return va_arg(*ap, long);
400002d5:	8b 08                	mov    (%eax),%ecx
400002d7:	8d 51 04             	lea    0x4(%ecx),%edx
400002da:	89 10                	mov    %edx,(%eax)
400002dc:	8b 01                	mov    (%ecx),%eax
400002de:	99                   	cltd   
400002df:	c3                   	ret    

400002e0 <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
400002e0:	8b 44 24 08          	mov    0x8(%esp),%eax
	b->cnt++;
400002e4:	8b 48 08             	mov    0x8(%eax),%ecx
400002e7:	8d 51 01             	lea    0x1(%ecx),%edx
400002ea:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
400002ed:	8b 10                	mov    (%eax),%edx
400002ef:	3b 50 04             	cmp    0x4(%eax),%edx
400002f2:	73 0b                	jae    400002ff <sprintputch+0x1f>
		*b->buf++ = ch;
400002f4:	8d 4a 01             	lea    0x1(%edx),%ecx
400002f7:	89 08                	mov    %ecx,(%eax)
400002f9:	8b 44 24 04          	mov    0x4(%esp),%eax
400002fd:	88 02                	mov    %al,(%edx)
400002ff:	f3 c3                	repz ret 

40000301 <vprintfmt>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
40000301:	55                   	push   %ebp
40000302:	57                   	push   %edi
40000303:	56                   	push   %esi
40000304:	53                   	push   %ebx
40000305:	83 ec 2c             	sub    $0x2c,%esp
40000308:	8b 5c 24 40          	mov    0x40(%esp),%ebx
4000030c:	8b 74 24 44          	mov    0x44(%esp),%esi
40000310:	8b 6c 24 48          	mov    0x48(%esp),%ebp
40000314:	89 f7                	mov    %esi,%edi
40000316:	89 de                	mov    %ebx,%esi
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
40000318:	8d 5d 01             	lea    0x1(%ebp),%ebx
4000031b:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
4000031f:	83 f8 25             	cmp    $0x25,%eax
40000322:	74 16                	je     4000033a <vprintfmt+0x39>
			if (ch == '\0')
40000324:	85 c0                	test   %eax,%eax
40000326:	0f 84 13 03 00 00    	je     4000063f <vprintfmt+0x33e>
				return;
			putch(ch, putdat);
4000032c:	83 ec 08             	sub    $0x8,%esp
4000032f:	57                   	push   %edi
40000330:	50                   	push   %eax
40000331:	ff d6                	call   *%esi
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
40000333:	83 c4 10             	add    $0x10,%esp
40000336:	89 dd                	mov    %ebx,%ebp
40000338:	eb de                	jmp    40000318 <vprintfmt+0x17>
4000033a:	c6 44 24 13 20       	movb   $0x20,0x13(%esp)
4000033f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
40000346:	00 
40000347:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
4000034e:	ff 
4000034f:	c7 44 24 14 ff ff ff 	movl   $0xffffffff,0x14(%esp)
40000356:	ff 
40000357:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
4000035e:	00 
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
4000035f:	8d 6b 01             	lea    0x1(%ebx),%ebp
40000362:	0f b6 13             	movzbl (%ebx),%edx
40000365:	0f b6 c2             	movzbl %dl,%eax
40000368:	83 ea 23             	sub    $0x23,%edx
4000036b:	80 fa 55             	cmp    $0x55,%dl
4000036e:	0f 87 ae 02 00 00    	ja     40000622 <vprintfmt+0x321>
40000374:	0f b6 d2             	movzbl %dl,%edx
40000377:	ff 24 95 f0 0e 00 40 	jmp    *0x40000ef0(,%edx,4)
4000037e:	89 eb                	mov    %ebp,%ebx

			// flag to pad on the right
		case '-':
			padc = '-';
40000380:	c6 44 24 13 2d       	movb   $0x2d,0x13(%esp)
40000385:	eb d8                	jmp    4000035f <vprintfmt+0x5e>
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
40000387:	89 eb                	mov    %ebp,%ebx
			padc = '-';
			goto reswitch;

			// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
40000389:	c6 44 24 13 30       	movb   $0x30,0x13(%esp)
4000038e:	eb cf                	jmp    4000035f <vprintfmt+0x5e>
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
40000390:	89 eb                	mov    %ebp,%ebx
			precision = va_arg(ap, int);
			goto process_precision;

		case '.':
			if (width < 0)
				width = 0;
40000392:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
40000399:	00 
4000039a:	eb c3                	jmp    4000035f <vprintfmt+0x5e>
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
4000039c:	b9 00 00 00 00       	mov    $0x0,%ecx
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
				precision = precision * 10 + ch - '0';
400003a1:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
400003a4:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
400003a7:	8d 4c 10 d0          	lea    -0x30(%eax,%edx,1),%ecx
				ch = *fmt;
400003ab:	0f be 45 00          	movsbl 0x0(%ebp),%eax
				if (ch < '0' || ch > '9')
400003af:	8d 50 d0             	lea    -0x30(%eax),%edx
400003b2:	83 fa 09             	cmp    $0x9,%edx
400003b5:	77 52                	ja     40000409 <vprintfmt+0x108>
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
400003b7:	83 c5 01             	add    $0x1,%ebp
				precision = precision * 10 + ch - '0';
400003ba:	eb e5                	jmp    400003a1 <vprintfmt+0xa0>
					break;
			}
			goto process_precision;

		case '*':
			precision = va_arg(ap, int);
400003bc:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400003c0:	83 c0 04             	add    $0x4,%eax
400003c3:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400003c7:	8b 40 fc             	mov    -0x4(%eax),%eax
400003ca:	89 44 24 1c          	mov    %eax,0x1c(%esp)
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
400003ce:	89 eb                	mov    %ebp,%ebx
		case '#':
			altflag = 1;
			goto reswitch;

		process_precision:
			if (width < 0)
400003d0:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
400003d5:	79 88                	jns    4000035f <vprintfmt+0x5e>
				width = precision, precision = -1;
400003d7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400003db:	89 44 24 14          	mov    %eax,0x14(%esp)
400003df:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
400003e6:	ff 
400003e7:	e9 73 ff ff ff       	jmp    4000035f <vprintfmt+0x5e>
		case '*':
			precision = va_arg(ap, int);
			goto process_precision;

		case '.':
			if (width < 0)
400003ec:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
400003f1:	78 9d                	js     40000390 <vprintfmt+0x8f>
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
400003f3:	89 eb                	mov    %ebp,%ebx
400003f5:	e9 65 ff ff ff       	jmp    4000035f <vprintfmt+0x5e>
400003fa:	89 eb                	mov    %ebp,%ebx
			if (width < 0)
				width = 0;
			goto reswitch;

		case '#':
			altflag = 1;
400003fc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
40000403:	00 
			goto reswitch;
40000404:	e9 56 ff ff ff       	jmp    4000035f <vprintfmt+0x5e>
40000409:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
4000040d:	89 eb                	mov    %ebp,%ebx
4000040f:	eb bf                	jmp    400003d0 <vprintfmt+0xcf>
				width = precision, precision = -1;
			goto reswitch;

			// long flag (doubled for long long)
		case 'l':
			lflag++;
40000411:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
40000416:	89 eb                	mov    %ebp,%ebx
			goto reswitch;

			// long flag (doubled for long long)
		case 'l':
			lflag++;
			goto reswitch;
40000418:	e9 42 ff ff ff       	jmp    4000035f <vprintfmt+0x5e>

			// character
		case 'c':
			putch(va_arg(ap, int), putdat);
4000041d:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000421:	83 c0 04             	add    $0x4,%eax
40000424:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000428:	83 ec 08             	sub    $0x8,%esp
4000042b:	57                   	push   %edi
4000042c:	ff 70 fc             	pushl  -0x4(%eax)
4000042f:	ff d6                	call   *%esi
			break;
40000431:	83 c4 10             	add    $0x10,%esp
40000434:	e9 df fe ff ff       	jmp    40000318 <vprintfmt+0x17>

			// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
40000439:	8b 44 24 4c          	mov    0x4c(%esp),%eax
4000043d:	83 c0 04             	add    $0x4,%eax
40000440:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000444:	8b 58 fc             	mov    -0x4(%eax),%ebx
40000447:	85 db                	test   %ebx,%ebx
40000449:	74 28                	je     40000473 <vprintfmt+0x172>
				p = "(null)";
			if (width > 0 && padc != '-')
4000044b:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
40000450:	0f 9f c2             	setg   %dl
40000453:	80 7c 24 13 2d       	cmpb   $0x2d,0x13(%esp)
40000458:	0f 95 c0             	setne  %al
4000045b:	84 c2                	test   %al,%dl
4000045d:	75 1b                	jne    4000047a <vprintfmt+0x179>
4000045f:	89 d8                	mov    %ebx,%eax
40000461:	89 74 24 40          	mov    %esi,0x40(%esp)
40000465:	8b 74 24 14          	mov    0x14(%esp),%esi
40000469:	89 6c 24 48          	mov    %ebp,0x48(%esp)
4000046d:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
40000471:	eb 62                	jmp    400004d5 <vprintfmt+0x1d4>
			break;

			// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
40000473:	bb e9 0e 00 40       	mov    $0x40000ee9,%ebx
40000478:	eb d1                	jmp    4000044b <vprintfmt+0x14a>
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
4000047a:	83 ec 08             	sub    $0x8,%esp
4000047d:	ff 74 24 24          	pushl  0x24(%esp)
40000481:	53                   	push   %ebx
40000482:	e8 1c 03 00 00       	call   400007a3 <strnlen>
40000487:	29 44 24 24          	sub    %eax,0x24(%esp)
4000048b:	8b 4c 24 24          	mov    0x24(%esp),%ecx
4000048f:	83 c4 10             	add    $0x10,%esp
40000492:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000496:	89 dd                	mov    %ebx,%ebp
40000498:	89 cb                	mov    %ecx,%ebx
4000049a:	eb 12                	jmp    400004ae <vprintfmt+0x1ad>
					putch(padc, putdat);
4000049c:	83 ec 08             	sub    $0x8,%esp
4000049f:	57                   	push   %edi
400004a0:	0f be 44 24 1f       	movsbl 0x1f(%esp),%eax
400004a5:	50                   	push   %eax
400004a6:	ff d6                	call   *%esi
			// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
400004a8:	83 eb 01             	sub    $0x1,%ebx
400004ab:	83 c4 10             	add    $0x10,%esp
400004ae:	85 db                	test   %ebx,%ebx
400004b0:	7f ea                	jg     4000049c <vprintfmt+0x19b>
400004b2:	89 d9                	mov    %ebx,%ecx
400004b4:	89 eb                	mov    %ebp,%ebx
400004b6:	89 d8                	mov    %ebx,%eax
400004b8:	89 74 24 40          	mov    %esi,0x40(%esp)
400004bc:	89 ce                	mov    %ecx,%esi
400004be:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
400004c2:	eb 11                	jmp    400004d5 <vprintfmt+0x1d4>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
400004c4:	83 ec 08             	sub    $0x8,%esp
400004c7:	57                   	push   %edi
400004c8:	52                   	push   %edx
400004c9:	ff 54 24 50          	call   *0x50(%esp)
400004cd:	83 c4 10             	add    $0x10,%esp
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
400004d0:	83 ee 01             	sub    $0x1,%esi
400004d3:	89 d8                	mov    %ebx,%eax
400004d5:	8d 58 01             	lea    0x1(%eax),%ebx
400004d8:	0f b6 00             	movzbl (%eax),%eax
400004db:	0f be d0             	movsbl %al,%edx
400004de:	85 d2                	test   %edx,%edx
400004e0:	74 4d                	je     4000052f <vprintfmt+0x22e>
400004e2:	85 ed                	test   %ebp,%ebp
400004e4:	78 05                	js     400004eb <vprintfmt+0x1ea>
400004e6:	83 ed 01             	sub    $0x1,%ebp
400004e9:	78 21                	js     4000050c <vprintfmt+0x20b>
				if (altflag && (ch < ' ' || ch > '~'))
400004eb:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
400004f0:	74 d2                	je     400004c4 <vprintfmt+0x1c3>
400004f2:	0f be c0             	movsbl %al,%eax
400004f5:	83 e8 20             	sub    $0x20,%eax
400004f8:	83 f8 5e             	cmp    $0x5e,%eax
400004fb:	76 c7                	jbe    400004c4 <vprintfmt+0x1c3>
					putch('?', putdat);
400004fd:	83 ec 08             	sub    $0x8,%esp
40000500:	57                   	push   %edi
40000501:	6a 3f                	push   $0x3f
40000503:	ff 54 24 50          	call   *0x50(%esp)
40000507:	83 c4 10             	add    $0x10,%esp
4000050a:	eb c4                	jmp    400004d0 <vprintfmt+0x1cf>
4000050c:	89 f3                	mov    %esi,%ebx
4000050e:	8b 74 24 40          	mov    0x40(%esp),%esi
40000512:	8b 6c 24 48          	mov    0x48(%esp),%ebp
40000516:	eb 0e                	jmp    40000526 <vprintfmt+0x225>
				else
					putch(ch, putdat);
			for (; width > 0; width--)
				putch(' ', putdat);
40000518:	83 ec 08             	sub    $0x8,%esp
4000051b:	57                   	push   %edi
4000051c:	6a 20                	push   $0x20
4000051e:	ff d6                	call   *%esi
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
40000520:	83 eb 01             	sub    $0x1,%ebx
40000523:	83 c4 10             	add    $0x10,%esp
40000526:	85 db                	test   %ebx,%ebx
40000528:	7f ee                	jg     40000518 <vprintfmt+0x217>
4000052a:	e9 e9 fd ff ff       	jmp    40000318 <vprintfmt+0x17>
4000052f:	89 f3                	mov    %esi,%ebx
40000531:	8b 74 24 40          	mov    0x40(%esp),%esi
40000535:	8b 6c 24 48          	mov    0x48(%esp),%ebp
40000539:	eb eb                	jmp    40000526 <vprintfmt+0x225>
				putch(' ', putdat);
			break;

			// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
4000053b:	8b 54 24 18          	mov    0x18(%esp),%edx
4000053f:	8d 44 24 4c          	lea    0x4c(%esp),%eax
40000543:	e8 6c fd ff ff       	call   400002b4 <getint>
40000548:	89 44 24 08          	mov    %eax,0x8(%esp)
4000054c:	89 54 24 0c          	mov    %edx,0xc(%esp)
			if ((long long) num < 0) {
40000550:	85 d2                	test   %edx,%edx
40000552:	78 07                	js     4000055b <vprintfmt+0x25a>
				putch('-', putdat);
				num = -(long long) num;
			}
			base = 10;
40000554:	bb 0a 00 00 00       	mov    $0xa,%ebx
40000559:	eb 33                	jmp    4000058e <vprintfmt+0x28d>

			// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
			if ((long long) num < 0) {
				putch('-', putdat);
4000055b:	83 ec 08             	sub    $0x8,%esp
4000055e:	57                   	push   %edi
4000055f:	6a 2d                	push   $0x2d
40000561:	ff d6                	call   *%esi
				num = -(long long) num;
40000563:	8b 44 24 18          	mov    0x18(%esp),%eax
40000567:	8b 54 24 1c          	mov    0x1c(%esp),%edx
4000056b:	f7 d8                	neg    %eax
4000056d:	83 d2 00             	adc    $0x0,%edx
40000570:	f7 da                	neg    %edx
40000572:	83 c4 10             	add    $0x10,%esp
			}
			base = 10;
40000575:	bb 0a 00 00 00       	mov    $0xa,%ebx
4000057a:	eb 12                	jmp    4000058e <vprintfmt+0x28d>
			goto number;

			// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
4000057c:	8b 54 24 18          	mov    0x18(%esp),%edx
40000580:	8d 44 24 4c          	lea    0x4c(%esp),%eax
40000584:	e8 f7 fc ff ff       	call   40000280 <getuint>
			base = 10;
40000589:	bb 0a 00 00 00       	mov    $0xa,%ebx
			// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
			base = 16;
		number:
			printnum(putch, putdat, num, base, width, padc);
4000058e:	83 ec 0c             	sub    $0xc,%esp
40000591:	0f be 4c 24 1f       	movsbl 0x1f(%esp),%ecx
40000596:	51                   	push   %ecx
40000597:	ff 74 24 24          	pushl  0x24(%esp)
4000059b:	53                   	push   %ebx
4000059c:	52                   	push   %edx
4000059d:	50                   	push   %eax
4000059e:	89 fa                	mov    %edi,%edx
400005a0:	89 f0                	mov    %esi,%eax
400005a2:	e8 23 fc ff ff       	call   400001ca <printnum>
			break;
400005a7:	83 c4 20             	add    $0x20,%esp
400005aa:	e9 69 fd ff ff       	jmp    40000318 <vprintfmt+0x17>
			num = getuint(&ap, lflag);
			base = 8;
			goto number;
#else
			// Replace this with your code.
			putch('X', putdat);
400005af:	83 ec 08             	sub    $0x8,%esp
400005b2:	57                   	push   %edi
400005b3:	6a 58                	push   $0x58
400005b5:	ff d6                	call   *%esi
			putch('X', putdat);
400005b7:	83 c4 08             	add    $0x8,%esp
400005ba:	57                   	push   %edi
400005bb:	6a 58                	push   $0x58
400005bd:	ff d6                	call   *%esi
			putch('X', putdat);
400005bf:	83 c4 08             	add    $0x8,%esp
400005c2:	57                   	push   %edi
400005c3:	6a 58                	push   $0x58
400005c5:	ff d6                	call   *%esi
			break;
400005c7:	83 c4 10             	add    $0x10,%esp
400005ca:	e9 49 fd ff ff       	jmp    40000318 <vprintfmt+0x17>
#endif

			// pointer
		case 'p':
			putch('0', putdat);
400005cf:	83 ec 08             	sub    $0x8,%esp
400005d2:	57                   	push   %edi
400005d3:	6a 30                	push   $0x30
400005d5:	ff d6                	call   *%esi
			putch('x', putdat);
400005d7:	83 c4 08             	add    $0x8,%esp
400005da:	57                   	push   %edi
400005db:	6a 78                	push   $0x78
400005dd:	ff d6                	call   *%esi
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
400005df:	8b 44 24 5c          	mov    0x5c(%esp),%eax
400005e3:	83 c0 04             	add    $0x4,%eax
400005e6:	89 44 24 5c          	mov    %eax,0x5c(%esp)

			// pointer
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
400005ea:	8b 40 fc             	mov    -0x4(%eax),%eax
400005ed:	ba 00 00 00 00       	mov    $0x0,%edx
				(uintptr_t) va_arg(ap, void *);
			base = 16;
			goto number;
400005f2:	83 c4 10             	add    $0x10,%esp
		case 'p':
			putch('0', putdat);
			putch('x', putdat);
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
			base = 16;
400005f5:	bb 10 00 00 00       	mov    $0x10,%ebx
			goto number;
400005fa:	eb 92                	jmp    4000058e <vprintfmt+0x28d>

			// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
400005fc:	8b 54 24 18          	mov    0x18(%esp),%edx
40000600:	8d 44 24 4c          	lea    0x4c(%esp),%eax
40000604:	e8 77 fc ff ff       	call   40000280 <getuint>
			base = 16;
40000609:	bb 10 00 00 00       	mov    $0x10,%ebx
4000060e:	e9 7b ff ff ff       	jmp    4000058e <vprintfmt+0x28d>
			printnum(putch, putdat, num, base, width, padc);
			break;

			// escaped '%' character
		case '%':
			putch(ch, putdat);
40000613:	83 ec 08             	sub    $0x8,%esp
40000616:	57                   	push   %edi
40000617:	50                   	push   %eax
40000618:	ff d6                	call   *%esi
			break;
4000061a:	83 c4 10             	add    $0x10,%esp
4000061d:	e9 f6 fc ff ff       	jmp    40000318 <vprintfmt+0x17>

			// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
40000622:	83 ec 08             	sub    $0x8,%esp
40000625:	57                   	push   %edi
40000626:	6a 25                	push   $0x25
40000628:	ff d6                	call   *%esi
			for (fmt--; fmt[-1] != '%'; fmt--)
4000062a:	83 c4 10             	add    $0x10,%esp
4000062d:	89 dd                	mov    %ebx,%ebp
4000062f:	eb 03                	jmp    40000634 <vprintfmt+0x333>
40000631:	83 ed 01             	sub    $0x1,%ebp
40000634:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
40000638:	75 f7                	jne    40000631 <vprintfmt+0x330>
4000063a:	e9 d9 fc ff ff       	jmp    40000318 <vprintfmt+0x17>
				/* do nothing */;
			break;
		}
	}
}
4000063f:	83 c4 2c             	add    $0x2c,%esp
40000642:	5b                   	pop    %ebx
40000643:	5e                   	pop    %esi
40000644:	5f                   	pop    %edi
40000645:	5d                   	pop    %ebp
40000646:	c3                   	ret    

40000647 <printfmt>:

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
40000647:	83 ec 0c             	sub    $0xc,%esp
	va_list ap;

	va_start(ap, fmt);
	vprintfmt(putch, putdat, fmt, ap);
4000064a:	8d 44 24 1c          	lea    0x1c(%esp),%eax
4000064e:	50                   	push   %eax
4000064f:	ff 74 24 1c          	pushl  0x1c(%esp)
40000653:	ff 74 24 1c          	pushl  0x1c(%esp)
40000657:	ff 74 24 1c          	pushl  0x1c(%esp)
4000065b:	e8 a1 fc ff ff       	call   40000301 <vprintfmt>
	va_end(ap);
}
40000660:	83 c4 1c             	add    $0x1c,%esp
40000663:	c3                   	ret    

40000664 <vsprintf>:
		*b->buf++ = ch;
}

int
vsprintf(char *buf, const char *fmt, va_list ap)
{
40000664:	83 ec 1c             	sub    $0x1c,%esp
	//assert(buf != NULL);
	struct sprintbuf b = {buf, (char*)(intptr_t)~0, 0};
40000667:	8b 44 24 20          	mov    0x20(%esp),%eax
4000066b:	89 44 24 04          	mov    %eax,0x4(%esp)
4000066f:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000676:	ff 
40000677:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
4000067e:	00 

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
4000067f:	ff 74 24 28          	pushl  0x28(%esp)
40000683:	ff 74 24 28          	pushl  0x28(%esp)
40000687:	8d 44 24 0c          	lea    0xc(%esp),%eax
4000068b:	50                   	push   %eax
4000068c:	68 e0 02 00 40       	push   $0x400002e0
40000691:	e8 6b fc ff ff       	call   40000301 <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
40000696:	8b 44 24 14          	mov    0x14(%esp),%eax
4000069a:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
}
4000069d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400006a1:	83 c4 2c             	add    $0x2c,%esp
400006a4:	c3                   	ret    

400006a5 <sprintf>:

int
sprintf(char *buf, const char *fmt, ...)
{
400006a5:	83 ec 10             	sub    $0x10,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
	rc = vsprintf(buf, fmt, ap);
400006a8:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400006ac:	50                   	push   %eax
400006ad:	ff 74 24 1c          	pushl  0x1c(%esp)
400006b1:	ff 74 24 1c          	pushl  0x1c(%esp)
400006b5:	e8 aa ff ff ff       	call   40000664 <vsprintf>
	va_end(ap);

	return rc;
}
400006ba:	83 c4 1c             	add    $0x1c,%esp
400006bd:	c3                   	ret    

400006be <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
400006be:	83 ec 1c             	sub    $0x1c,%esp
400006c1:	8b 44 24 20          	mov    0x20(%esp),%eax
	//assert(buf != NULL && n > 0);
	struct sprintbuf b = {buf, buf+n-1, 0};
400006c5:	89 44 24 04          	mov    %eax,0x4(%esp)
400006c9:	8b 54 24 24          	mov    0x24(%esp),%edx
400006cd:	8d 44 10 ff          	lea    -0x1(%eax,%edx,1),%eax
400006d1:	89 44 24 08          	mov    %eax,0x8(%esp)
400006d5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400006dc:	00 

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
400006dd:	ff 74 24 2c          	pushl  0x2c(%esp)
400006e1:	ff 74 24 2c          	pushl  0x2c(%esp)
400006e5:	8d 44 24 0c          	lea    0xc(%esp),%eax
400006e9:	50                   	push   %eax
400006ea:	68 e0 02 00 40       	push   $0x400002e0
400006ef:	e8 0d fc ff ff       	call   40000301 <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
400006f4:	8b 44 24 14          	mov    0x14(%esp),%eax
400006f8:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
}
400006fb:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400006ff:	83 c4 2c             	add    $0x2c,%esp
40000702:	c3                   	ret    

40000703 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
40000703:	83 ec 0c             	sub    $0xc,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
	rc = vsnprintf(buf, n, fmt, ap);
40000706:	8d 44 24 1c          	lea    0x1c(%esp),%eax
4000070a:	50                   	push   %eax
4000070b:	ff 74 24 1c          	pushl  0x1c(%esp)
4000070f:	ff 74 24 1c          	pushl  0x1c(%esp)
40000713:	ff 74 24 1c          	pushl  0x1c(%esp)
40000717:	e8 a2 ff ff ff       	call   400006be <vsnprintf>
	va_end(ap);

	return rc;
}
4000071c:	83 c4 1c             	add    $0x1c,%esp
4000071f:	c3                   	ret    

40000720 <spawn>:
#include <syscall.h>
#include <types.h>

pid_t
spawn(uintptr_t exec, unsigned int quota)
{
40000720:	53                   	push   %ebx
sys_spawn(uintptr_t exec, unsigned int quota)
{
	int errno;
	pid_t pid;

	asm volatile("int %2"
40000721:	b8 01 00 00 00       	mov    $0x1,%eax
40000726:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
4000072a:	8b 5c 24 08          	mov    0x8(%esp),%ebx
4000072e:	cd 30                	int    $0x30
		       "a" (SYS_spawn),
		       "b" (exec),
		       "c" (quota)
		     : "cc", "memory");

	return errno ? -1 : pid;
40000730:	85 c0                	test   %eax,%eax
40000732:	75 04                	jne    40000738 <spawn+0x18>
	return sys_spawn(exec, quota);
}
40000734:	89 d8                	mov    %ebx,%eax
40000736:	5b                   	pop    %ebx
40000737:	c3                   	ret    
40000738:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
#include <types.h>

pid_t
spawn(uintptr_t exec, unsigned int quota)
{
	return sys_spawn(exec, quota);
4000073d:	eb f5                	jmp    40000734 <spawn+0x14>

4000073f <yield>:
}

static gcc_inline void
sys_yield(void)
{
	asm volatile("int %0" :
4000073f:	b8 02 00 00 00       	mov    $0x2,%eax
40000744:	cd 30                	int    $0x30
40000746:	c3                   	ret    

40000747 <spinlock_init>:
}

void
spinlock_init(spinlock_t *lk)
{
	*lk = 0;
40000747:	8b 44 24 04          	mov    0x4(%esp),%eax
4000074b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
40000751:	c3                   	ret    

40000752 <spinlock_acquire>:
}

void
spinlock_acquire(spinlock_t *lk)
{
40000752:	8b 54 24 04          	mov    0x4(%esp),%edx
	while(xchg(lk, 1) != 0)
40000756:	eb 02                	jmp    4000075a <spinlock_acquire+0x8>
		asm volatile("pause");
40000758:	f3 90                	pause  
static inline uint32_t
xchg(volatile uint32_t *addr, uint32_t newval)
{
	uint32_t result;

	asm volatile("lock; xchgl %0, %1" :
4000075a:	b8 01 00 00 00       	mov    $0x1,%eax
4000075f:	f0 87 02             	lock xchg %eax,(%edx)
}

void
spinlock_acquire(spinlock_t *lk)
{
	while(xchg(lk, 1) != 0)
40000762:	85 c0                	test   %eax,%eax
40000764:	75 f2                	jne    40000758 <spinlock_acquire+0x6>
		asm volatile("pause");
}
40000766:	f3 c3                	repz ret 

40000768 <spinlock_holding>:

// Check whether this cpu is holding the lock.
bool
spinlock_holding(spinlock_t *lock)
{
	return *lock;
40000768:	8b 44 24 04          	mov    0x4(%esp),%eax
4000076c:	8b 00                	mov    (%eax),%eax
}
4000076e:	c3                   	ret    

4000076f <spinlock_release>:
}

// Release the lock.
void
spinlock_release(spinlock_t *lk)
{
4000076f:	53                   	push   %ebx
40000770:	8b 5c 24 08          	mov    0x8(%esp),%ebx
	if (spinlock_holding(lk) == FALSE)
40000774:	53                   	push   %ebx
40000775:	e8 ee ff ff ff       	call   40000768 <spinlock_holding>
4000077a:	83 c4 04             	add    $0x4,%esp
4000077d:	84 c0                	test   %al,%al
4000077f:	74 08                	je     40000789 <spinlock_release+0x1a>
static inline uint32_t
xchg(volatile uint32_t *addr, uint32_t newval)
{
	uint32_t result;

	asm volatile("lock; xchgl %0, %1" :
40000781:	b8 00 00 00 00       	mov    $0x0,%eax
40000786:	f0 87 03             	lock xchg %eax,(%ebx)
{
	if (spinlock_holding(lk) == FALSE)
		return;

	xchg(lk, 0);
}
40000789:	5b                   	pop    %ebx
4000078a:	c3                   	ret    

4000078b <strlen>:
#include <string.h>
#include <types.h>

int
strlen(const char *s)
{
4000078b:	8b 54 24 04          	mov    0x4(%esp),%edx
	int n;

	for (n = 0; *s != '\0'; s++)
4000078f:	b8 00 00 00 00       	mov    $0x0,%eax
40000794:	eb 06                	jmp    4000079c <strlen+0x11>
		n++;
40000796:	83 c0 01             	add    $0x1,%eax
int
strlen(const char *s)
{
	int n;

	for (n = 0; *s != '\0'; s++)
40000799:	83 c2 01             	add    $0x1,%edx
4000079c:	80 3a 00             	cmpb   $0x0,(%edx)
4000079f:	75 f5                	jne    40000796 <strlen+0xb>
		n++;
	return n;
}
400007a1:	f3 c3                	repz ret 

400007a3 <strnlen>:

int
strnlen(const char *s, size_t size)
{
400007a3:	8b 4c 24 04          	mov    0x4(%esp),%ecx
400007a7:	8b 54 24 08          	mov    0x8(%esp),%edx
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
400007ab:	b8 00 00 00 00       	mov    $0x0,%eax
400007b0:	eb 09                	jmp    400007bb <strnlen+0x18>
		n++;
400007b2:	83 c0 01             	add    $0x1,%eax
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
400007b5:	83 c1 01             	add    $0x1,%ecx
400007b8:	83 ea 01             	sub    $0x1,%edx
400007bb:	85 d2                	test   %edx,%edx
400007bd:	74 05                	je     400007c4 <strnlen+0x21>
400007bf:	80 39 00             	cmpb   $0x0,(%ecx)
400007c2:	75 ee                	jne    400007b2 <strnlen+0xf>
		n++;
	return n;
}
400007c4:	f3 c3                	repz ret 

400007c6 <strcpy>:

char *
strcpy(char *dst, const char *src)
{
400007c6:	53                   	push   %ebx
400007c7:	8b 44 24 08          	mov    0x8(%esp),%eax
400007cb:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
	char *ret;

	ret = dst;
	while ((*dst++ = *src++) != '\0')
400007cf:	89 c2                	mov    %eax,%edx
400007d1:	0f b6 19             	movzbl (%ecx),%ebx
400007d4:	88 1a                	mov    %bl,(%edx)
400007d6:	8d 52 01             	lea    0x1(%edx),%edx
400007d9:	8d 49 01             	lea    0x1(%ecx),%ecx
400007dc:	84 db                	test   %bl,%bl
400007de:	75 f1                	jne    400007d1 <strcpy+0xb>
		/* do nothing */;
	return ret;
}
400007e0:	5b                   	pop    %ebx
400007e1:	c3                   	ret    

400007e2 <strncpy>:

char *
strncpy(char *dst, const char *src, size_t size)
{
400007e2:	55                   	push   %ebp
400007e3:	57                   	push   %edi
400007e4:	56                   	push   %esi
400007e5:	53                   	push   %ebx
400007e6:	8b 6c 24 14          	mov    0x14(%esp),%ebp
400007ea:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400007ee:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
400007f2:	89 e9                	mov    %ebp,%ecx
400007f4:	ba 00 00 00 00       	mov    $0x0,%edx
400007f9:	eb 05                	jmp    40000800 <strncpy+0x1e>
400007fb:	83 c2 01             	add    $0x1,%edx
		*dst++ = *src;
400007fe:	89 f1                	mov    %esi,%ecx
{
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
40000800:	39 fa                	cmp    %edi,%edx
40000802:	73 12                	jae    40000816 <strncpy+0x34>
		*dst++ = *src;
40000804:	8d 71 01             	lea    0x1(%ecx),%esi
40000807:	0f b6 03             	movzbl (%ebx),%eax
4000080a:	88 01                	mov    %al,(%ecx)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
4000080c:	80 3b 00             	cmpb   $0x0,(%ebx)
4000080f:	74 ea                	je     400007fb <strncpy+0x19>
			src++;
40000811:	83 c3 01             	add    $0x1,%ebx
40000814:	eb e5                	jmp    400007fb <strncpy+0x19>
	}
	return ret;
}
40000816:	89 e8                	mov    %ebp,%eax
40000818:	5b                   	pop    %ebx
40000819:	5e                   	pop    %esi
4000081a:	5f                   	pop    %edi
4000081b:	5d                   	pop    %ebp
4000081c:	c3                   	ret    

4000081d <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
4000081d:	56                   	push   %esi
4000081e:	53                   	push   %ebx
4000081f:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000823:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000827:	8b 54 24 14          	mov    0x14(%esp),%edx
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
4000082b:	85 d2                	test   %edx,%edx
4000082d:	74 04                	je     40000833 <strlcpy+0x16>
4000082f:	89 f0                	mov    %esi,%eax
40000831:	eb 0c                	jmp    4000083f <strlcpy+0x22>
40000833:	89 f0                	mov    %esi,%eax
40000835:	eb 17                	jmp    4000084e <strlcpy+0x31>
		while (--size > 0 && *src != '\0')
			*dst++ = *src++;
40000837:	83 c1 01             	add    $0x1,%ecx
4000083a:	88 18                	mov    %bl,(%eax)
4000083c:	8d 40 01             	lea    0x1(%eax),%eax
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
4000083f:	83 ea 01             	sub    $0x1,%edx
40000842:	74 07                	je     4000084b <strlcpy+0x2e>
40000844:	0f b6 19             	movzbl (%ecx),%ebx
40000847:	84 db                	test   %bl,%bl
40000849:	75 ec                	jne    40000837 <strlcpy+0x1a>
			*dst++ = *src++;
		*dst = '\0';
4000084b:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
4000084e:	29 f0                	sub    %esi,%eax
}
40000850:	5b                   	pop    %ebx
40000851:	5e                   	pop    %esi
40000852:	c3                   	ret    

40000853 <strcmp>:

int
strcmp(const char *p, const char *q)
{
40000853:	8b 4c 24 04          	mov    0x4(%esp),%ecx
40000857:	8b 54 24 08          	mov    0x8(%esp),%edx
	while (*p && *p == *q)
4000085b:	eb 06                	jmp    40000863 <strcmp+0x10>
		p++, q++;
4000085d:	83 c1 01             	add    $0x1,%ecx
40000860:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
40000863:	0f b6 01             	movzbl (%ecx),%eax
40000866:	84 c0                	test   %al,%al
40000868:	74 04                	je     4000086e <strcmp+0x1b>
4000086a:	3a 02                	cmp    (%edx),%al
4000086c:	74 ef                	je     4000085d <strcmp+0xa>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
4000086e:	0f b6 c0             	movzbl %al,%eax
40000871:	0f b6 12             	movzbl (%edx),%edx
40000874:	29 d0                	sub    %edx,%eax
}
40000876:	c3                   	ret    

40000877 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
40000877:	53                   	push   %ebx
40000878:	8b 54 24 08          	mov    0x8(%esp),%edx
4000087c:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000880:	8b 44 24 10          	mov    0x10(%esp),%eax
	while (n > 0 && *p && *p == *q)
40000884:	eb 09                	jmp    4000088f <strncmp+0x18>
		n--, p++, q++;
40000886:	83 e8 01             	sub    $0x1,%eax
40000889:	83 c2 01             	add    $0x1,%edx
4000088c:	83 c1 01             	add    $0x1,%ecx
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
4000088f:	85 c0                	test   %eax,%eax
40000891:	74 0b                	je     4000089e <strncmp+0x27>
40000893:	0f b6 1a             	movzbl (%edx),%ebx
40000896:	84 db                	test   %bl,%bl
40000898:	74 04                	je     4000089e <strncmp+0x27>
4000089a:	3a 19                	cmp    (%ecx),%bl
4000089c:	74 e8                	je     40000886 <strncmp+0xf>
		n--, p++, q++;
	if (n == 0)
4000089e:	85 c0                	test   %eax,%eax
400008a0:	74 0a                	je     400008ac <strncmp+0x35>
		return 0;
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
400008a2:	0f b6 02             	movzbl (%edx),%eax
400008a5:	0f b6 11             	movzbl (%ecx),%edx
400008a8:	29 d0                	sub    %edx,%eax
}
400008aa:	5b                   	pop    %ebx
400008ab:	c3                   	ret    
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
		n--, p++, q++;
	if (n == 0)
		return 0;
400008ac:	b8 00 00 00 00       	mov    $0x0,%eax
400008b1:	eb f7                	jmp    400008aa <strncmp+0x33>

400008b3 <strchr>:
		return (int) ((unsigned char) *p - (unsigned char) *q);
}

char *
strchr(const char *s, char c)
{
400008b3:	8b 44 24 04          	mov    0x4(%esp),%eax
400008b7:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
	for (; *s; s++)
400008bc:	0f b6 10             	movzbl (%eax),%edx
400008bf:	84 d2                	test   %dl,%dl
400008c1:	74 09                	je     400008cc <strchr+0x19>
		if (*s == c)
400008c3:	38 ca                	cmp    %cl,%dl
400008c5:	74 0a                	je     400008d1 <strchr+0x1e>
}

char *
strchr(const char *s, char c)
{
	for (; *s; s++)
400008c7:	83 c0 01             	add    $0x1,%eax
400008ca:	eb f0                	jmp    400008bc <strchr+0x9>
		if (*s == c)
			return (char *) s;
	return 0;
400008cc:	b8 00 00 00 00       	mov    $0x0,%eax
}
400008d1:	f3 c3                	repz ret 

400008d3 <strfind>:

char *
strfind(const char *s, char c)
{
400008d3:	8b 44 24 04          	mov    0x4(%esp),%eax
400008d7:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
	for (; *s; s++)
400008dc:	0f b6 10             	movzbl (%eax),%edx
400008df:	84 d2                	test   %dl,%dl
400008e1:	74 09                	je     400008ec <strfind+0x19>
		if (*s == c)
400008e3:	38 ca                	cmp    %cl,%dl
400008e5:	74 05                	je     400008ec <strfind+0x19>
}

char *
strfind(const char *s, char c)
{
	for (; *s; s++)
400008e7:	83 c0 01             	add    $0x1,%eax
400008ea:	eb f0                	jmp    400008dc <strfind+0x9>
		if (*s == c)
			break;
	return (char *) s;
}
400008ec:	f3 c3                	repz ret 

400008ee <strtol>:


long
strtol(const char *s, char **endptr, int base)
{
400008ee:	55                   	push   %ebp
400008ef:	57                   	push   %edi
400008f0:	56                   	push   %esi
400008f1:	53                   	push   %ebx
400008f2:	83 ec 04             	sub    $0x4,%esp
400008f5:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400008f9:	8b 74 24 1c          	mov    0x1c(%esp),%esi
400008fd:	8b 44 24 20          	mov    0x20(%esp),%eax
40000901:	89 04 24             	mov    %eax,(%esp)
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
40000904:	0f b6 01             	movzbl (%ecx),%eax
40000907:	3c 20                	cmp    $0x20,%al
40000909:	0f 94 c3             	sete   %bl
4000090c:	3c 09                	cmp    $0x9,%al
4000090e:	0f 94 c2             	sete   %dl
40000911:	08 d3                	or     %dl,%bl
40000913:	74 05                	je     4000091a <strtol+0x2c>
		s++;
40000915:	83 c1 01             	add    $0x1,%ecx
40000918:	eb ea                	jmp    40000904 <strtol+0x16>

	// plus/minus sign
	if (*s == '+')
4000091a:	3c 2b                	cmp    $0x2b,%al
4000091c:	74 3f                	je     4000095d <strtol+0x6f>
		s++;
	else if (*s == '-')
4000091e:	3c 2d                	cmp    $0x2d,%al
40000920:	74 45                	je     40000967 <strtol+0x79>


long
strtol(const char *s, char **endptr, int base)
{
	int neg = 0;
40000922:	bf 00 00 00 00       	mov    $0x0,%edi
		s++;
	else if (*s == '-')
		s++, neg = 1;

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000927:	8b 04 24             	mov    (%esp),%eax
4000092a:	85 c0                	test   %eax,%eax
4000092c:	0f 94 c2             	sete   %dl
4000092f:	83 f8 10             	cmp    $0x10,%eax
40000932:	0f 94 c0             	sete   %al
40000935:	08 c2                	or     %al,%dl
40000937:	74 05                	je     4000093e <strtol+0x50>
40000939:	80 39 30             	cmpb   $0x30,(%ecx)
4000093c:	74 33                	je     40000971 <strtol+0x83>
		s += 2, base = 16;
	else if (base == 0 && s[0] == '0')
4000093e:	83 3c 24 00          	cmpl   $0x0,(%esp)
40000942:	75 05                	jne    40000949 <strtol+0x5b>
40000944:	80 39 30             	cmpb   $0x30,(%ecx)
40000947:	74 3a                	je     40000983 <strtol+0x95>
		s++, base = 8;
	else if (base == 0)
40000949:	83 3c 24 00          	cmpl   $0x0,(%esp)
4000094d:	75 07                	jne    40000956 <strtol+0x68>
		base = 10;
4000094f:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
40000956:	b8 00 00 00 00       	mov    $0x0,%eax
4000095b:	eb 51                	jmp    400009ae <strtol+0xc0>
	while (*s == ' ' || *s == '\t')
		s++;

	// plus/minus sign
	if (*s == '+')
		s++;
4000095d:	83 c1 01             	add    $0x1,%ecx


long
strtol(const char *s, char **endptr, int base)
{
	int neg = 0;
40000960:	bf 00 00 00 00       	mov    $0x0,%edi
40000965:	eb c0                	jmp    40000927 <strtol+0x39>

	// plus/minus sign
	if (*s == '+')
		s++;
	else if (*s == '-')
		s++, neg = 1;
40000967:	83 c1 01             	add    $0x1,%ecx
4000096a:	bf 01 00 00 00       	mov    $0x1,%edi
4000096f:	eb b6                	jmp    40000927 <strtol+0x39>

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000971:	80 79 01 78          	cmpb   $0x78,0x1(%ecx)
40000975:	75 c7                	jne    4000093e <strtol+0x50>
		s += 2, base = 16;
40000977:	83 c1 02             	add    $0x2,%ecx
4000097a:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
40000981:	eb d3                	jmp    40000956 <strtol+0x68>
	else if (base == 0 && s[0] == '0')
		s++, base = 8;
40000983:	83 c1 01             	add    $0x1,%ecx
40000986:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
4000098d:	eb c7                	jmp    40000956 <strtol+0x68>
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
			dig = *s - '0';
		else if (*s >= 'a' && *s <= 'z')
4000098f:	8d 6a 9f             	lea    -0x61(%edx),%ebp
40000992:	89 eb                	mov    %ebp,%ebx
40000994:	80 fb 19             	cmp    $0x19,%bl
40000997:	77 2a                	ja     400009c3 <strtol+0xd5>
			dig = *s - 'a' + 10;
40000999:	0f be d2             	movsbl %dl,%edx
4000099c:	83 ea 57             	sub    $0x57,%edx
		else if (*s >= 'A' && *s <= 'Z')
			dig = *s - 'A' + 10;
		else
			break;
		if (dig >= base)
4000099f:	8b 1c 24             	mov    (%esp),%ebx
400009a2:	39 da                	cmp    %ebx,%edx
400009a4:	7d 2f                	jge    400009d5 <strtol+0xe7>
			break;
		s++, val = (val * base) + dig;
400009a6:	83 c1 01             	add    $0x1,%ecx
400009a9:	0f af c3             	imul   %ebx,%eax
400009ac:	01 d0                	add    %edx,%eax

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
400009ae:	0f b6 11             	movzbl (%ecx),%edx
400009b1:	8d 6a d0             	lea    -0x30(%edx),%ebp
400009b4:	89 eb                	mov    %ebp,%ebx
400009b6:	80 fb 09             	cmp    $0x9,%bl
400009b9:	77 d4                	ja     4000098f <strtol+0xa1>
			dig = *s - '0';
400009bb:	0f be d2             	movsbl %dl,%edx
400009be:	83 ea 30             	sub    $0x30,%edx
400009c1:	eb dc                	jmp    4000099f <strtol+0xb1>
		else if (*s >= 'a' && *s <= 'z')
			dig = *s - 'a' + 10;
		else if (*s >= 'A' && *s <= 'Z')
400009c3:	8d 6a bf             	lea    -0x41(%edx),%ebp
400009c6:	89 eb                	mov    %ebp,%ebx
400009c8:	80 fb 19             	cmp    $0x19,%bl
400009cb:	77 08                	ja     400009d5 <strtol+0xe7>
			dig = *s - 'A' + 10;
400009cd:	0f be d2             	movsbl %dl,%edx
400009d0:	83 ea 37             	sub    $0x37,%edx
400009d3:	eb ca                	jmp    4000099f <strtol+0xb1>
			break;
		s++, val = (val * base) + dig;
		// we don't properly detect overflow!
	}

	if (endptr)
400009d5:	85 f6                	test   %esi,%esi
400009d7:	74 02                	je     400009db <strtol+0xed>
		*endptr = (char *) s;
400009d9:	89 0e                	mov    %ecx,(%esi)
	return (neg ? -val : val);
400009db:	85 ff                	test   %edi,%edi
400009dd:	74 02                	je     400009e1 <strtol+0xf3>
400009df:	f7 d8                	neg    %eax
}
400009e1:	83 c4 04             	add    $0x4,%esp
400009e4:	5b                   	pop    %ebx
400009e5:	5e                   	pop    %esi
400009e6:	5f                   	pop    %edi
400009e7:	5d                   	pop    %ebp
400009e8:	c3                   	ret    

400009e9 <memset>:

void *
memset(void *v, int c, size_t n)
{
400009e9:	57                   	push   %edi
400009ea:	53                   	push   %ebx
400009eb:	8b 7c 24 0c          	mov    0xc(%esp),%edi
400009ef:	8b 4c 24 14          	mov    0x14(%esp),%ecx
	if (n == 0)
400009f3:	85 c9                	test   %ecx,%ecx
400009f5:	74 14                	je     40000a0b <memset+0x22>
		return v;
	if ((int)v%4 == 0 && n%4 == 0) {
400009f7:	f7 c7 03 00 00 00    	test   $0x3,%edi
400009fd:	75 05                	jne    40000a04 <memset+0x1b>
400009ff:	f6 c1 03             	test   $0x3,%cl
40000a02:	74 0c                	je     40000a10 <memset+0x27>
		c = (c<<24)|(c<<16)|(c<<8)|c;
		asm volatile("cld; rep stosl\n"
			     :: "D" (v), "a" (c), "c" (n/4)
			     : "cc", "memory");
	} else
		asm volatile("cld; rep stosb\n"
40000a04:	8b 44 24 10          	mov    0x10(%esp),%eax
40000a08:	fc                   	cld    
40000a09:	f3 aa                	rep stos %al,%es:(%edi)
			     :: "D" (v), "a" (c), "c" (n)
			     : "cc", "memory");
	return v;
}
40000a0b:	89 f8                	mov    %edi,%eax
40000a0d:	5b                   	pop    %ebx
40000a0e:	5f                   	pop    %edi
40000a0f:	c3                   	ret    
memset(void *v, int c, size_t n)
{
	if (n == 0)
		return v;
	if ((int)v%4 == 0 && n%4 == 0) {
		c &= 0xFF;
40000a10:	0f b6 44 24 10       	movzbl 0x10(%esp),%eax
		c = (c<<24)|(c<<16)|(c<<8)|c;
40000a15:	89 c2                	mov    %eax,%edx
40000a17:	c1 e2 18             	shl    $0x18,%edx
40000a1a:	89 c3                	mov    %eax,%ebx
40000a1c:	c1 e3 10             	shl    $0x10,%ebx
40000a1f:	09 da                	or     %ebx,%edx
40000a21:	89 c3                	mov    %eax,%ebx
40000a23:	c1 e3 08             	shl    $0x8,%ebx
40000a26:	09 da                	or     %ebx,%edx
40000a28:	09 d0                	or     %edx,%eax
		asm volatile("cld; rep stosl\n"
			     :: "D" (v), "a" (c), "c" (n/4)
40000a2a:	c1 e9 02             	shr    $0x2,%ecx
	if (n == 0)
		return v;
	if ((int)v%4 == 0 && n%4 == 0) {
		c &= 0xFF;
		c = (c<<24)|(c<<16)|(c<<8)|c;
		asm volatile("cld; rep stosl\n"
40000a2d:	fc                   	cld    
40000a2e:	f3 ab                	rep stos %eax,%es:(%edi)
40000a30:	eb d9                	jmp    40000a0b <memset+0x22>

40000a32 <memmove>:
	return v;
}

void *
memmove(void *dst, const void *src, size_t n)
{
40000a32:	57                   	push   %edi
40000a33:	56                   	push   %esi
40000a34:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000a38:	8b 74 24 10          	mov    0x10(%esp),%esi
40000a3c:	8b 4c 24 14          	mov    0x14(%esp),%ecx
	const char *s;
	char *d;

	s = src;
	d = dst;
	if (s < d && s + n > d) {
40000a40:	39 c6                	cmp    %eax,%esi
40000a42:	73 36                	jae    40000a7a <memmove+0x48>
40000a44:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40000a47:	39 d0                	cmp    %edx,%eax
40000a49:	73 2f                	jae    40000a7a <memmove+0x48>
		s += n;
		d += n;
40000a4b:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
40000a4e:	f6 c2 03             	test   $0x3,%dl
40000a51:	75 1b                	jne    40000a6e <memmove+0x3c>
40000a53:	f7 c7 03 00 00 00    	test   $0x3,%edi
40000a59:	75 13                	jne    40000a6e <memmove+0x3c>
40000a5b:	f6 c1 03             	test   $0x3,%cl
40000a5e:	75 0e                	jne    40000a6e <memmove+0x3c>
			asm volatile("std; rep movsl\n"
				     :: "D" (d-4), "S" (s-4), "c" (n/4)
40000a60:	83 ef 04             	sub    $0x4,%edi
40000a63:	8d 72 fc             	lea    -0x4(%edx),%esi
40000a66:	c1 e9 02             	shr    $0x2,%ecx
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
			asm volatile("std; rep movsl\n"
40000a69:	fd                   	std    
40000a6a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000a6c:	eb 09                	jmp    40000a77 <memmove+0x45>
				     :: "D" (d-4), "S" (s-4), "c" (n/4)
				     : "cc", "memory");
		else
			asm volatile("std; rep movsb\n"
				     :: "D" (d-1), "S" (s-1), "c" (n)
40000a6e:	83 ef 01             	sub    $0x1,%edi
40000a71:	8d 72 ff             	lea    -0x1(%edx),%esi
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
			asm volatile("std; rep movsl\n"
				     :: "D" (d-4), "S" (s-4), "c" (n/4)
				     : "cc", "memory");
		else
			asm volatile("std; rep movsb\n"
40000a74:	fd                   	std    
40000a75:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
				     :: "D" (d-1), "S" (s-1), "c" (n)
				     : "cc", "memory");
		// Some versions of GCC rely on DF being clear
		asm volatile("cld" ::: "cc");
40000a77:	fc                   	cld    
40000a78:	eb 16                	jmp    40000a90 <memmove+0x5e>
	} else {
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
40000a7a:	f7 c6 03 00 00 00    	test   $0x3,%esi
40000a80:	75 09                	jne    40000a8b <memmove+0x59>
40000a82:	a8 03                	test   $0x3,%al
40000a84:	75 05                	jne    40000a8b <memmove+0x59>
40000a86:	f6 c1 03             	test   $0x3,%cl
40000a89:	74 08                	je     40000a93 <memmove+0x61>
			asm volatile("cld; rep movsl\n"
				     :: "D" (d), "S" (s), "c" (n/4)
				     : "cc", "memory");
		else
			asm volatile("cld; rep movsb\n"
40000a8b:	89 c7                	mov    %eax,%edi
40000a8d:	fc                   	cld    
40000a8e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
				     :: "D" (d), "S" (s), "c" (n)
				     : "cc", "memory");
	}
	return dst;
}
40000a90:	5e                   	pop    %esi
40000a91:	5f                   	pop    %edi
40000a92:	c3                   	ret    
		// Some versions of GCC rely on DF being clear
		asm volatile("cld" ::: "cc");
	} else {
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
			asm volatile("cld; rep movsl\n"
				     :: "D" (d), "S" (s), "c" (n/4)
40000a93:	c1 e9 02             	shr    $0x2,%ecx
				     : "cc", "memory");
		// Some versions of GCC rely on DF being clear
		asm volatile("cld" ::: "cc");
	} else {
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
			asm volatile("cld; rep movsl\n"
40000a96:	89 c7                	mov    %eax,%edi
40000a98:	fc                   	cld    
40000a99:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000a9b:	eb f3                	jmp    40000a90 <memmove+0x5e>

40000a9d <memcpy>:
}

void *
memcpy(void *dst, const void *src, size_t n)
{
	return memmove(dst, src, n);
40000a9d:	ff 74 24 0c          	pushl  0xc(%esp)
40000aa1:	ff 74 24 0c          	pushl  0xc(%esp)
40000aa5:	ff 74 24 0c          	pushl  0xc(%esp)
40000aa9:	e8 84 ff ff ff       	call   40000a32 <memmove>
40000aae:	83 c4 0c             	add    $0xc,%esp
}
40000ab1:	c3                   	ret    

40000ab2 <memcmp>:

int
memcmp(const void *v1, const void *v2, size_t n)
{
40000ab2:	56                   	push   %esi
40000ab3:	53                   	push   %ebx
40000ab4:	8b 44 24 14          	mov    0x14(%esp),%eax
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;
40000ab8:	8b 4c 24 10          	mov    0x10(%esp),%ecx
}

int
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
40000abc:	8b 54 24 0c          	mov    0xc(%esp),%edx
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
40000ac0:	8d 70 ff             	lea    -0x1(%eax),%esi
40000ac3:	85 c0                	test   %eax,%eax
40000ac5:	74 1c                	je     40000ae3 <memcmp+0x31>
		if (*s1 != *s2)
40000ac7:	0f b6 02             	movzbl (%edx),%eax
40000aca:	0f b6 19             	movzbl (%ecx),%ebx
40000acd:	38 d8                	cmp    %bl,%al
40000acf:	75 0a                	jne    40000adb <memcmp+0x29>
			return (int) *s1 - (int) *s2;
		s1++, s2++;
40000ad1:	83 c2 01             	add    $0x1,%edx
40000ad4:	83 c1 01             	add    $0x1,%ecx
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
40000ad7:	89 f0                	mov    %esi,%eax
40000ad9:	eb e5                	jmp    40000ac0 <memcmp+0xe>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
40000adb:	0f b6 c0             	movzbl %al,%eax
40000ade:	0f b6 db             	movzbl %bl,%ebx
40000ae1:	29 d8                	sub    %ebx,%eax
		s1++, s2++;
	}

	return 0;
}
40000ae3:	5b                   	pop    %ebx
40000ae4:	5e                   	pop    %esi
40000ae5:	c3                   	ret    

40000ae6 <memchr>:

void *
memchr(const void *s, int c, size_t n)
{
40000ae6:	8b 44 24 04          	mov    0x4(%esp),%eax
40000aea:	8b 4c 24 08          	mov    0x8(%esp),%ecx
	const void *ends = (const char *) s + n;
40000aee:	89 c2                	mov    %eax,%edx
40000af0:	03 54 24 0c          	add    0xc(%esp),%edx
	for (; s < ends; s++)
40000af4:	39 d0                	cmp    %edx,%eax
40000af6:	73 09                	jae    40000b01 <memchr+0x1b>
		if (*(const unsigned char *) s == (unsigned char) c)
40000af8:	38 08                	cmp    %cl,(%eax)
40000afa:	74 0a                	je     40000b06 <memchr+0x20>

void *
memchr(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
40000afc:	83 c0 01             	add    $0x1,%eax
40000aff:	eb f3                	jmp    40000af4 <memchr+0xe>
		if (*(const unsigned char *) s == (unsigned char) c)
			return (void *) s;
	return NULL;
40000b01:	b8 00 00 00 00       	mov    $0x0,%eax
}
40000b06:	f3 c3                	repz ret 

40000b08 <memzero>:

void *
memzero(void *v, size_t n)
{
	return memset(v, 0, n);
40000b08:	ff 74 24 08          	pushl  0x8(%esp)
40000b0c:	6a 00                	push   $0x0
40000b0e:	ff 74 24 0c          	pushl  0xc(%esp)
40000b12:	e8 d2 fe ff ff       	call   400009e9 <memset>
40000b17:	83 c4 0c             	add    $0xc,%esp
}
40000b1a:	c3                   	ret    

40000b1b <main>:
#include <stdio.h>
#include <syscall.h>
#include <x86.h>

int main (int argc, char **argv)
{
40000b1b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
40000b1f:	83 e4 f0             	and    $0xfffffff0,%esp
40000b22:	ff 71 fc             	pushl  -0x4(%ecx)
40000b25:	55                   	push   %ebp
40000b26:	89 e5                	mov    %esp,%ebp
40000b28:	51                   	push   %ecx
40000b29:	83 ec 10             	sub    $0x10,%esp
    printf ("idle\n");
40000b2c:	68 48 10 00 40       	push   $0x40001048
40000b31:	e8 7f f6 ff ff       	call   400001b5 <printf>

    pid_t ping_pid, pong_pid, ding_pid, fork_pid;

    if ((ping_pid = spawn (1, 1000)) != NUM_IDS)
40000b36:	83 c4 08             	add    $0x8,%esp
40000b39:	68 e8 03 00 00       	push   $0x3e8
40000b3e:	6a 01                	push   $0x1
40000b40:	e8 db fb ff ff       	call   40000720 <spawn>
40000b45:	83 c4 10             	add    $0x10,%esp
40000b48:	83 f8 40             	cmp    $0x40,%eax
40000b4b:	0f 84 9a 00 00 00    	je     40000beb <main+0xd0>
        printf ("ping in process %d.\n", ping_pid);
40000b51:	83 ec 08             	sub    $0x8,%esp
40000b54:	50                   	push   %eax
40000b55:	68 4e 10 00 40       	push   $0x4000104e
40000b5a:	e8 56 f6 ff ff       	call   400001b5 <printf>
40000b5f:	83 c4 10             	add    $0x10,%esp
    else
        printf ("Failed to launch ping.\n");

    if ((pong_pid = spawn (2, 1000)) != NUM_IDS)
40000b62:	83 ec 08             	sub    $0x8,%esp
40000b65:	68 e8 03 00 00       	push   $0x3e8
40000b6a:	6a 02                	push   $0x2
40000b6c:	e8 af fb ff ff       	call   40000720 <spawn>
40000b71:	83 c4 10             	add    $0x10,%esp
40000b74:	83 f8 40             	cmp    $0x40,%eax
40000b77:	0f 84 83 00 00 00    	je     40000c00 <main+0xe5>
        printf ("pong in process %d.\n", pong_pid);
40000b7d:	83 ec 08             	sub    $0x8,%esp
40000b80:	50                   	push   %eax
40000b81:	68 7b 10 00 40       	push   $0x4000107b
40000b86:	e8 2a f6 ff ff       	call   400001b5 <printf>
40000b8b:	83 c4 10             	add    $0x10,%esp
    else
        printf ("Failed to launch pong.\n");

    if ((ding_pid = spawn (3, 1000)) != NUM_IDS)
40000b8e:	83 ec 08             	sub    $0x8,%esp
40000b91:	68 e8 03 00 00       	push   $0x3e8
40000b96:	6a 03                	push   $0x3
40000b98:	e8 83 fb ff ff       	call   40000720 <spawn>
40000b9d:	83 c4 10             	add    $0x10,%esp
40000ba0:	83 f8 40             	cmp    $0x40,%eax
40000ba3:	74 70                	je     40000c15 <main+0xfa>
        printf ("ding in process %d.\n", ding_pid);
40000ba5:	83 ec 08             	sub    $0x8,%esp
40000ba8:	50                   	push   %eax
40000ba9:	68 a8 10 00 40       	push   $0x400010a8
40000bae:	e8 02 f6 ff ff       	call   400001b5 <printf>
40000bb3:	83 c4 10             	add    $0x10,%esp
    else
        printf ("Failed to launch ding.\n");
    if ((fork_pid = spawn(4,1000)) != NUM_IDS)
40000bb6:	83 ec 08             	sub    $0x8,%esp
40000bb9:	68 e8 03 00 00       	push   $0x3e8
40000bbe:	6a 04                	push   $0x4
40000bc0:	e8 5b fb ff ff       	call   40000720 <spawn>
40000bc5:	83 c4 10             	add    $0x10,%esp
40000bc8:	83 f8 40             	cmp    $0x40,%eax
40000bcb:	74 5a                	je     40000c27 <main+0x10c>
    {
        printf("fork in process %d.\n", fork_pid);
40000bcd:	83 ec 08             	sub    $0x8,%esp
40000bd0:	50                   	push   %eax
40000bd1:	68 d5 10 00 40       	push   $0x400010d5
40000bd6:	e8 da f5 ff ff       	call   400001b5 <printf>
40000bdb:	83 c4 10             	add    $0x10,%esp
    } else {
        printf ("Failed to launch fork.\n");
    }

    return 0;
}
40000bde:	b8 00 00 00 00       	mov    $0x0,%eax
40000be3:	8b 4d fc             	mov    -0x4(%ebp),%ecx
40000be6:	c9                   	leave  
40000be7:	8d 61 fc             	lea    -0x4(%ecx),%esp
40000bea:	c3                   	ret    
    pid_t ping_pid, pong_pid, ding_pid, fork_pid;

    if ((ping_pid = spawn (1, 1000)) != NUM_IDS)
        printf ("ping in process %d.\n", ping_pid);
    else
        printf ("Failed to launch ping.\n");
40000beb:	83 ec 0c             	sub    $0xc,%esp
40000bee:	68 63 10 00 40       	push   $0x40001063
40000bf3:	e8 bd f5 ff ff       	call   400001b5 <printf>
40000bf8:	83 c4 10             	add    $0x10,%esp
40000bfb:	e9 62 ff ff ff       	jmp    40000b62 <main+0x47>

    if ((pong_pid = spawn (2, 1000)) != NUM_IDS)
        printf ("pong in process %d.\n", pong_pid);
    else
        printf ("Failed to launch pong.\n");
40000c00:	83 ec 0c             	sub    $0xc,%esp
40000c03:	68 90 10 00 40       	push   $0x40001090
40000c08:	e8 a8 f5 ff ff       	call   400001b5 <printf>
40000c0d:	83 c4 10             	add    $0x10,%esp
40000c10:	e9 79 ff ff ff       	jmp    40000b8e <main+0x73>

    if ((ding_pid = spawn (3, 1000)) != NUM_IDS)
        printf ("ding in process %d.\n", ding_pid);
    else
        printf ("Failed to launch ding.\n");
40000c15:	83 ec 0c             	sub    $0xc,%esp
40000c18:	68 bd 10 00 40       	push   $0x400010bd
40000c1d:	e8 93 f5 ff ff       	call   400001b5 <printf>
40000c22:	83 c4 10             	add    $0x10,%esp
40000c25:	eb 8f                	jmp    40000bb6 <main+0x9b>
    if ((fork_pid = spawn(4,1000)) != NUM_IDS)
    {
        printf("fork in process %d.\n", fork_pid);
    } else {
        printf ("Failed to launch fork.\n");
40000c27:	83 ec 0c             	sub    $0xc,%esp
40000c2a:	68 ea 10 00 40       	push   $0x400010ea
40000c2f:	e8 81 f5 ff ff       	call   400001b5 <printf>
40000c34:	83 c4 10             	add    $0x10,%esp
40000c37:	eb a5                	jmp    40000bde <main+0xc3>
40000c39:	66 90                	xchg   %ax,%ax
40000c3b:	66 90                	xchg   %ax,%ax
40000c3d:	66 90                	xchg   %ax,%ax
40000c3f:	90                   	nop

40000c40 <__udivdi3>:
40000c40:	55                   	push   %ebp
40000c41:	57                   	push   %edi
40000c42:	56                   	push   %esi
40000c43:	53                   	push   %ebx
40000c44:	83 ec 1c             	sub    $0x1c,%esp
40000c47:	8b 74 24 3c          	mov    0x3c(%esp),%esi
40000c4b:	8b 5c 24 30          	mov    0x30(%esp),%ebx
40000c4f:	8b 4c 24 34          	mov    0x34(%esp),%ecx
40000c53:	8b 7c 24 38          	mov    0x38(%esp),%edi
40000c57:	85 f6                	test   %esi,%esi
40000c59:	89 5c 24 08          	mov    %ebx,0x8(%esp)
40000c5d:	89 ca                	mov    %ecx,%edx
40000c5f:	89 f8                	mov    %edi,%eax
40000c61:	75 3d                	jne    40000ca0 <__udivdi3+0x60>
40000c63:	39 cf                	cmp    %ecx,%edi
40000c65:	0f 87 c5 00 00 00    	ja     40000d30 <__udivdi3+0xf0>
40000c6b:	85 ff                	test   %edi,%edi
40000c6d:	89 fd                	mov    %edi,%ebp
40000c6f:	75 0b                	jne    40000c7c <__udivdi3+0x3c>
40000c71:	b8 01 00 00 00       	mov    $0x1,%eax
40000c76:	31 d2                	xor    %edx,%edx
40000c78:	f7 f7                	div    %edi
40000c7a:	89 c5                	mov    %eax,%ebp
40000c7c:	89 c8                	mov    %ecx,%eax
40000c7e:	31 d2                	xor    %edx,%edx
40000c80:	f7 f5                	div    %ebp
40000c82:	89 c1                	mov    %eax,%ecx
40000c84:	89 d8                	mov    %ebx,%eax
40000c86:	89 cf                	mov    %ecx,%edi
40000c88:	f7 f5                	div    %ebp
40000c8a:	89 c3                	mov    %eax,%ebx
40000c8c:	89 d8                	mov    %ebx,%eax
40000c8e:	89 fa                	mov    %edi,%edx
40000c90:	83 c4 1c             	add    $0x1c,%esp
40000c93:	5b                   	pop    %ebx
40000c94:	5e                   	pop    %esi
40000c95:	5f                   	pop    %edi
40000c96:	5d                   	pop    %ebp
40000c97:	c3                   	ret    
40000c98:	90                   	nop
40000c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000ca0:	39 ce                	cmp    %ecx,%esi
40000ca2:	77 74                	ja     40000d18 <__udivdi3+0xd8>
40000ca4:	0f bd fe             	bsr    %esi,%edi
40000ca7:	83 f7 1f             	xor    $0x1f,%edi
40000caa:	0f 84 98 00 00 00    	je     40000d48 <__udivdi3+0x108>
40000cb0:	bb 20 00 00 00       	mov    $0x20,%ebx
40000cb5:	89 f9                	mov    %edi,%ecx
40000cb7:	89 c5                	mov    %eax,%ebp
40000cb9:	29 fb                	sub    %edi,%ebx
40000cbb:	d3 e6                	shl    %cl,%esi
40000cbd:	89 d9                	mov    %ebx,%ecx
40000cbf:	d3 ed                	shr    %cl,%ebp
40000cc1:	89 f9                	mov    %edi,%ecx
40000cc3:	d3 e0                	shl    %cl,%eax
40000cc5:	09 ee                	or     %ebp,%esi
40000cc7:	89 d9                	mov    %ebx,%ecx
40000cc9:	89 44 24 0c          	mov    %eax,0xc(%esp)
40000ccd:	89 d5                	mov    %edx,%ebp
40000ccf:	8b 44 24 08          	mov    0x8(%esp),%eax
40000cd3:	d3 ed                	shr    %cl,%ebp
40000cd5:	89 f9                	mov    %edi,%ecx
40000cd7:	d3 e2                	shl    %cl,%edx
40000cd9:	89 d9                	mov    %ebx,%ecx
40000cdb:	d3 e8                	shr    %cl,%eax
40000cdd:	09 c2                	or     %eax,%edx
40000cdf:	89 d0                	mov    %edx,%eax
40000ce1:	89 ea                	mov    %ebp,%edx
40000ce3:	f7 f6                	div    %esi
40000ce5:	89 d5                	mov    %edx,%ebp
40000ce7:	89 c3                	mov    %eax,%ebx
40000ce9:	f7 64 24 0c          	mull   0xc(%esp)
40000ced:	39 d5                	cmp    %edx,%ebp
40000cef:	72 10                	jb     40000d01 <__udivdi3+0xc1>
40000cf1:	8b 74 24 08          	mov    0x8(%esp),%esi
40000cf5:	89 f9                	mov    %edi,%ecx
40000cf7:	d3 e6                	shl    %cl,%esi
40000cf9:	39 c6                	cmp    %eax,%esi
40000cfb:	73 07                	jae    40000d04 <__udivdi3+0xc4>
40000cfd:	39 d5                	cmp    %edx,%ebp
40000cff:	75 03                	jne    40000d04 <__udivdi3+0xc4>
40000d01:	83 eb 01             	sub    $0x1,%ebx
40000d04:	31 ff                	xor    %edi,%edi
40000d06:	89 d8                	mov    %ebx,%eax
40000d08:	89 fa                	mov    %edi,%edx
40000d0a:	83 c4 1c             	add    $0x1c,%esp
40000d0d:	5b                   	pop    %ebx
40000d0e:	5e                   	pop    %esi
40000d0f:	5f                   	pop    %edi
40000d10:	5d                   	pop    %ebp
40000d11:	c3                   	ret    
40000d12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000d18:	31 ff                	xor    %edi,%edi
40000d1a:	31 db                	xor    %ebx,%ebx
40000d1c:	89 d8                	mov    %ebx,%eax
40000d1e:	89 fa                	mov    %edi,%edx
40000d20:	83 c4 1c             	add    $0x1c,%esp
40000d23:	5b                   	pop    %ebx
40000d24:	5e                   	pop    %esi
40000d25:	5f                   	pop    %edi
40000d26:	5d                   	pop    %ebp
40000d27:	c3                   	ret    
40000d28:	90                   	nop
40000d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000d30:	89 d8                	mov    %ebx,%eax
40000d32:	f7 f7                	div    %edi
40000d34:	31 ff                	xor    %edi,%edi
40000d36:	89 c3                	mov    %eax,%ebx
40000d38:	89 d8                	mov    %ebx,%eax
40000d3a:	89 fa                	mov    %edi,%edx
40000d3c:	83 c4 1c             	add    $0x1c,%esp
40000d3f:	5b                   	pop    %ebx
40000d40:	5e                   	pop    %esi
40000d41:	5f                   	pop    %edi
40000d42:	5d                   	pop    %ebp
40000d43:	c3                   	ret    
40000d44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000d48:	39 ce                	cmp    %ecx,%esi
40000d4a:	72 0c                	jb     40000d58 <__udivdi3+0x118>
40000d4c:	31 db                	xor    %ebx,%ebx
40000d4e:	3b 44 24 08          	cmp    0x8(%esp),%eax
40000d52:	0f 87 34 ff ff ff    	ja     40000c8c <__udivdi3+0x4c>
40000d58:	bb 01 00 00 00       	mov    $0x1,%ebx
40000d5d:	e9 2a ff ff ff       	jmp    40000c8c <__udivdi3+0x4c>
40000d62:	66 90                	xchg   %ax,%ax
40000d64:	66 90                	xchg   %ax,%ax
40000d66:	66 90                	xchg   %ax,%ax
40000d68:	66 90                	xchg   %ax,%ax
40000d6a:	66 90                	xchg   %ax,%ax
40000d6c:	66 90                	xchg   %ax,%ax
40000d6e:	66 90                	xchg   %ax,%ax

40000d70 <__umoddi3>:
40000d70:	55                   	push   %ebp
40000d71:	57                   	push   %edi
40000d72:	56                   	push   %esi
40000d73:	53                   	push   %ebx
40000d74:	83 ec 1c             	sub    $0x1c,%esp
40000d77:	8b 44 24 3c          	mov    0x3c(%esp),%eax
40000d7b:	8b 4c 24 30          	mov    0x30(%esp),%ecx
40000d7f:	8b 74 24 34          	mov    0x34(%esp),%esi
40000d83:	8b 7c 24 38          	mov    0x38(%esp),%edi
40000d87:	85 c0                	test   %eax,%eax
40000d89:	89 44 24 0c          	mov    %eax,0xc(%esp)
40000d8d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
40000d91:	89 3c 24             	mov    %edi,(%esp)
40000d94:	89 4c 24 04          	mov    %ecx,0x4(%esp)
40000d98:	89 f2                	mov    %esi,%edx
40000d9a:	75 14                	jne    40000db0 <__umoddi3+0x40>
40000d9c:	39 f7                	cmp    %esi,%edi
40000d9e:	76 40                	jbe    40000de0 <__umoddi3+0x70>
40000da0:	89 c8                	mov    %ecx,%eax
40000da2:	f7 f7                	div    %edi
40000da4:	89 d0                	mov    %edx,%eax
40000da6:	31 d2                	xor    %edx,%edx
40000da8:	83 c4 1c             	add    $0x1c,%esp
40000dab:	5b                   	pop    %ebx
40000dac:	5e                   	pop    %esi
40000dad:	5f                   	pop    %edi
40000dae:	5d                   	pop    %ebp
40000daf:	c3                   	ret    
40000db0:	39 f0                	cmp    %esi,%eax
40000db2:	89 f3                	mov    %esi,%ebx
40000db4:	77 4a                	ja     40000e00 <__umoddi3+0x90>
40000db6:	0f bd e8             	bsr    %eax,%ebp
40000db9:	83 f5 1f             	xor    $0x1f,%ebp
40000dbc:	75 52                	jne    40000e10 <__umoddi3+0xa0>
40000dbe:	39 f0                	cmp    %esi,%eax
40000dc0:	0f 82 da 00 00 00    	jb     40000ea0 <__umoddi3+0x130>
40000dc6:	39 0c 24             	cmp    %ecx,(%esp)
40000dc9:	0f 86 d1 00 00 00    	jbe    40000ea0 <__umoddi3+0x130>
40000dcf:	8b 44 24 04          	mov    0x4(%esp),%eax
40000dd3:	83 c4 1c             	add    $0x1c,%esp
40000dd6:	5b                   	pop    %ebx
40000dd7:	5e                   	pop    %esi
40000dd8:	5f                   	pop    %edi
40000dd9:	5d                   	pop    %ebp
40000dda:	c3                   	ret    
40000ddb:	90                   	nop
40000ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000de0:	85 ff                	test   %edi,%edi
40000de2:	89 fd                	mov    %edi,%ebp
40000de4:	75 0b                	jne    40000df1 <__umoddi3+0x81>
40000de6:	b8 01 00 00 00       	mov    $0x1,%eax
40000deb:	31 d2                	xor    %edx,%edx
40000ded:	f7 f7                	div    %edi
40000def:	89 c5                	mov    %eax,%ebp
40000df1:	89 f0                	mov    %esi,%eax
40000df3:	31 d2                	xor    %edx,%edx
40000df5:	f7 f5                	div    %ebp
40000df7:	89 c8                	mov    %ecx,%eax
40000df9:	f7 f5                	div    %ebp
40000dfb:	eb a7                	jmp    40000da4 <__umoddi3+0x34>
40000dfd:	8d 76 00             	lea    0x0(%esi),%esi
40000e00:	89 c8                	mov    %ecx,%eax
40000e02:	89 f2                	mov    %esi,%edx
40000e04:	83 c4 1c             	add    $0x1c,%esp
40000e07:	5b                   	pop    %ebx
40000e08:	5e                   	pop    %esi
40000e09:	5f                   	pop    %edi
40000e0a:	5d                   	pop    %ebp
40000e0b:	c3                   	ret    
40000e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000e10:	8b 34 24             	mov    (%esp),%esi
40000e13:	bf 20 00 00 00       	mov    $0x20,%edi
40000e18:	89 e9                	mov    %ebp,%ecx
40000e1a:	29 ef                	sub    %ebp,%edi
40000e1c:	d3 e0                	shl    %cl,%eax
40000e1e:	89 f9                	mov    %edi,%ecx
40000e20:	89 f2                	mov    %esi,%edx
40000e22:	d3 ea                	shr    %cl,%edx
40000e24:	89 e9                	mov    %ebp,%ecx
40000e26:	09 c2                	or     %eax,%edx
40000e28:	89 d8                	mov    %ebx,%eax
40000e2a:	89 14 24             	mov    %edx,(%esp)
40000e2d:	89 f2                	mov    %esi,%edx
40000e2f:	d3 e2                	shl    %cl,%edx
40000e31:	89 f9                	mov    %edi,%ecx
40000e33:	89 54 24 04          	mov    %edx,0x4(%esp)
40000e37:	8b 54 24 08          	mov    0x8(%esp),%edx
40000e3b:	d3 e8                	shr    %cl,%eax
40000e3d:	89 e9                	mov    %ebp,%ecx
40000e3f:	89 c6                	mov    %eax,%esi
40000e41:	d3 e3                	shl    %cl,%ebx
40000e43:	89 f9                	mov    %edi,%ecx
40000e45:	89 d0                	mov    %edx,%eax
40000e47:	d3 e8                	shr    %cl,%eax
40000e49:	89 e9                	mov    %ebp,%ecx
40000e4b:	09 d8                	or     %ebx,%eax
40000e4d:	89 d3                	mov    %edx,%ebx
40000e4f:	89 f2                	mov    %esi,%edx
40000e51:	f7 34 24             	divl   (%esp)
40000e54:	89 d6                	mov    %edx,%esi
40000e56:	d3 e3                	shl    %cl,%ebx
40000e58:	f7 64 24 04          	mull   0x4(%esp)
40000e5c:	39 d6                	cmp    %edx,%esi
40000e5e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
40000e62:	89 d1                	mov    %edx,%ecx
40000e64:	89 c3                	mov    %eax,%ebx
40000e66:	72 08                	jb     40000e70 <__umoddi3+0x100>
40000e68:	75 11                	jne    40000e7b <__umoddi3+0x10b>
40000e6a:	39 44 24 08          	cmp    %eax,0x8(%esp)
40000e6e:	73 0b                	jae    40000e7b <__umoddi3+0x10b>
40000e70:	2b 44 24 04          	sub    0x4(%esp),%eax
40000e74:	1b 14 24             	sbb    (%esp),%edx
40000e77:	89 d1                	mov    %edx,%ecx
40000e79:	89 c3                	mov    %eax,%ebx
40000e7b:	8b 54 24 08          	mov    0x8(%esp),%edx
40000e7f:	29 da                	sub    %ebx,%edx
40000e81:	19 ce                	sbb    %ecx,%esi
40000e83:	89 f9                	mov    %edi,%ecx
40000e85:	89 f0                	mov    %esi,%eax
40000e87:	d3 e0                	shl    %cl,%eax
40000e89:	89 e9                	mov    %ebp,%ecx
40000e8b:	d3 ea                	shr    %cl,%edx
40000e8d:	89 e9                	mov    %ebp,%ecx
40000e8f:	d3 ee                	shr    %cl,%esi
40000e91:	09 d0                	or     %edx,%eax
40000e93:	89 f2                	mov    %esi,%edx
40000e95:	83 c4 1c             	add    $0x1c,%esp
40000e98:	5b                   	pop    %ebx
40000e99:	5e                   	pop    %esi
40000e9a:	5f                   	pop    %edi
40000e9b:	5d                   	pop    %ebp
40000e9c:	c3                   	ret    
40000e9d:	8d 76 00             	lea    0x0(%esi),%esi
40000ea0:	89 f2                	mov    %esi,%edx
40000ea2:	29 f9                	sub    %edi,%ecx
40000ea4:	1b 54 24 0c          	sbb    0xc(%esp),%edx
40000ea8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
40000eac:	e9 1e ff ff ff       	jmp    40000dcf <__umoddi3+0x5f>
