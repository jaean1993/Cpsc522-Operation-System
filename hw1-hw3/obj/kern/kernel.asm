
obj/kern/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <video_init>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 18             	sub    $0x18,%esp
  100006:	c7 45 f4 00 80 0b 00 	movl   $0xb8000,-0xc(%ebp)
  10000d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100010:	0f b7 00             	movzwl (%eax),%eax
  100013:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100017:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10001a:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
  10001f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100022:	0f b7 00             	movzwl (%eax),%eax
  100025:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100029:	74 29                	je     100054 <video_init+0x54>
  10002b:	c7 45 f4 00 00 0b 00 	movl   $0xb0000,-0xc(%ebp)
  100032:	c7 05 8c 04 91 00 b4 	movl   $0x3b4,0x91048c
  100039:	03 00 00 
  10003c:	a1 8c 04 91 00       	mov    0x91048c,%eax
  100041:	83 ec 08             	sub    $0x8,%esp
  100044:	50                   	push   %eax
  100045:	68 d4 5c 10 00       	push   $0x105cd4
  10004a:	e8 7d 28 00 00       	call   1028cc <dprintf>
  10004f:	83 c4 10             	add    $0x10,%esp
  100052:	eb 2a                	jmp    10007e <video_init+0x7e>
  100054:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100057:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10005b:	66 89 10             	mov    %dx,(%eax)
  10005e:	c7 05 8c 04 91 00 d4 	movl   $0x3d4,0x91048c
  100065:	03 00 00 
  100068:	a1 8c 04 91 00       	mov    0x91048c,%eax
  10006d:	83 ec 08             	sub    $0x8,%esp
  100070:	50                   	push   %eax
  100071:	68 d4 5c 10 00       	push   $0x105cd4
  100076:	e8 51 28 00 00       	call   1028cc <dprintf>
  10007b:	83 c4 10             	add    $0x10,%esp
  10007e:	a1 8c 04 91 00       	mov    0x91048c,%eax
  100083:	83 ec 08             	sub    $0x8,%esp
  100086:	6a 0e                	push   $0xe
  100088:	50                   	push   %eax
  100089:	e8 27 34 00 00       	call   1034b5 <outb>
  10008e:	83 c4 10             	add    $0x10,%esp
  100091:	a1 8c 04 91 00       	mov    0x91048c,%eax
  100096:	83 c0 01             	add    $0x1,%eax
  100099:	83 ec 0c             	sub    $0xc,%esp
  10009c:	50                   	push   %eax
  10009d:	e8 d8 33 00 00       	call   10347a <inb>
  1000a2:	83 c4 10             	add    $0x10,%esp
  1000a5:	0f b6 c0             	movzbl %al,%eax
  1000a8:	c1 e0 08             	shl    $0x8,%eax
  1000ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1000ae:	a1 8c 04 91 00       	mov    0x91048c,%eax
  1000b3:	83 ec 08             	sub    $0x8,%esp
  1000b6:	6a 0f                	push   $0xf
  1000b8:	50                   	push   %eax
  1000b9:	e8 f7 33 00 00       	call   1034b5 <outb>
  1000be:	83 c4 10             	add    $0x10,%esp
  1000c1:	a1 8c 04 91 00       	mov    0x91048c,%eax
  1000c6:	83 c0 01             	add    $0x1,%eax
  1000c9:	83 ec 0c             	sub    $0xc,%esp
  1000cc:	50                   	push   %eax
  1000cd:	e8 a8 33 00 00       	call   10347a <inb>
  1000d2:	83 c4 10             	add    $0x10,%esp
  1000d5:	0f b6 c0             	movzbl %al,%eax
  1000d8:	09 45 ec             	or     %eax,-0x14(%ebp)
  1000db:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000de:	a3 80 04 91 00       	mov    %eax,0x910480
  1000e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1000e6:	66 a3 84 04 91 00    	mov    %ax,0x910484
  1000ec:	c7 05 88 04 91 00 00 	movl   $0x0,0x910488
  1000f3:	00 00 00 
  1000f6:	90                   	nop
  1000f7:	c9                   	leave  
  1000f8:	c3                   	ret    

001000f9 <video_putc>:
  1000f9:	55                   	push   %ebp
  1000fa:	89 e5                	mov    %esp,%ebp
  1000fc:	53                   	push   %ebx
  1000fd:	83 ec 14             	sub    $0x14,%esp
  100100:	8b 45 08             	mov    0x8(%ebp),%eax
  100103:	b0 00                	mov    $0x0,%al
  100105:	85 c0                	test   %eax,%eax
  100107:	75 07                	jne    100110 <video_putc+0x17>
  100109:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
  100110:	8b 45 08             	mov    0x8(%ebp),%eax
  100113:	0f b6 c0             	movzbl %al,%eax
  100116:	83 f8 09             	cmp    $0x9,%eax
  100119:	0f 84 ab 00 00 00    	je     1001ca <video_putc+0xd1>
  10011f:	83 f8 09             	cmp    $0x9,%eax
  100122:	7f 0a                	jg     10012e <video_putc+0x35>
  100124:	83 f8 08             	cmp    $0x8,%eax
  100127:	74 14                	je     10013d <video_putc+0x44>
  100129:	e9 df 00 00 00       	jmp    10020d <video_putc+0x114>
  10012e:	83 f8 0a             	cmp    $0xa,%eax
  100131:	74 4d                	je     100180 <video_putc+0x87>
  100133:	83 f8 0d             	cmp    $0xd,%eax
  100136:	74 58                	je     100190 <video_putc+0x97>
  100138:	e9 d0 00 00 00       	jmp    10020d <video_putc+0x114>
  10013d:	0f b7 05 84 04 91 00 	movzwl 0x910484,%eax
  100144:	66 85 c0             	test   %ax,%ax
  100147:	0f 84 e6 00 00 00    	je     100233 <video_putc+0x13a>
  10014d:	0f b7 05 84 04 91 00 	movzwl 0x910484,%eax
  100154:	83 e8 01             	sub    $0x1,%eax
  100157:	66 a3 84 04 91 00    	mov    %ax,0x910484
  10015d:	a1 80 04 91 00       	mov    0x910480,%eax
  100162:	0f b7 15 84 04 91 00 	movzwl 0x910484,%edx
  100169:	0f b7 d2             	movzwl %dx,%edx
  10016c:	01 d2                	add    %edx,%edx
  10016e:	01 d0                	add    %edx,%eax
  100170:	8b 55 08             	mov    0x8(%ebp),%edx
  100173:	b2 00                	mov    $0x0,%dl
  100175:	83 ca 20             	or     $0x20,%edx
  100178:	66 89 10             	mov    %dx,(%eax)
  10017b:	e9 b3 00 00 00       	jmp    100233 <video_putc+0x13a>
  100180:	0f b7 05 84 04 91 00 	movzwl 0x910484,%eax
  100187:	83 c0 50             	add    $0x50,%eax
  10018a:	66 a3 84 04 91 00    	mov    %ax,0x910484
  100190:	0f b7 1d 84 04 91 00 	movzwl 0x910484,%ebx
  100197:	0f b7 0d 84 04 91 00 	movzwl 0x910484,%ecx
  10019e:	0f b7 c1             	movzwl %cx,%eax
  1001a1:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1001a7:	c1 e8 10             	shr    $0x10,%eax
  1001aa:	89 c2                	mov    %eax,%edx
  1001ac:	66 c1 ea 06          	shr    $0x6,%dx
  1001b0:	89 d0                	mov    %edx,%eax
  1001b2:	c1 e0 02             	shl    $0x2,%eax
  1001b5:	01 d0                	add    %edx,%eax
  1001b7:	c1 e0 04             	shl    $0x4,%eax
  1001ba:	29 c1                	sub    %eax,%ecx
  1001bc:	89 ca                	mov    %ecx,%edx
  1001be:	89 d8                	mov    %ebx,%eax
  1001c0:	29 d0                	sub    %edx,%eax
  1001c2:	66 a3 84 04 91 00    	mov    %ax,0x910484
  1001c8:	eb 6a                	jmp    100234 <video_putc+0x13b>
  1001ca:	83 ec 0c             	sub    $0xc,%esp
  1001cd:	6a 20                	push   $0x20
  1001cf:	e8 25 ff ff ff       	call   1000f9 <video_putc>
  1001d4:	83 c4 10             	add    $0x10,%esp
  1001d7:	83 ec 0c             	sub    $0xc,%esp
  1001da:	6a 20                	push   $0x20
  1001dc:	e8 18 ff ff ff       	call   1000f9 <video_putc>
  1001e1:	83 c4 10             	add    $0x10,%esp
  1001e4:	83 ec 0c             	sub    $0xc,%esp
  1001e7:	6a 20                	push   $0x20
  1001e9:	e8 0b ff ff ff       	call   1000f9 <video_putc>
  1001ee:	83 c4 10             	add    $0x10,%esp
  1001f1:	83 ec 0c             	sub    $0xc,%esp
  1001f4:	6a 20                	push   $0x20
  1001f6:	e8 fe fe ff ff       	call   1000f9 <video_putc>
  1001fb:	83 c4 10             	add    $0x10,%esp
  1001fe:	83 ec 0c             	sub    $0xc,%esp
  100201:	6a 20                	push   $0x20
  100203:	e8 f1 fe ff ff       	call   1000f9 <video_putc>
  100208:	83 c4 10             	add    $0x10,%esp
  10020b:	eb 27                	jmp    100234 <video_putc+0x13b>
  10020d:	8b 0d 80 04 91 00    	mov    0x910480,%ecx
  100213:	0f b7 05 84 04 91 00 	movzwl 0x910484,%eax
  10021a:	8d 50 01             	lea    0x1(%eax),%edx
  10021d:	66 89 15 84 04 91 00 	mov    %dx,0x910484
  100224:	0f b7 c0             	movzwl %ax,%eax
  100227:	01 c0                	add    %eax,%eax
  100229:	01 c8                	add    %ecx,%eax
  10022b:	8b 55 08             	mov    0x8(%ebp),%edx
  10022e:	66 89 10             	mov    %dx,(%eax)
  100231:	eb 01                	jmp    100234 <video_putc+0x13b>
  100233:	90                   	nop
  100234:	0f b7 05 84 04 91 00 	movzwl 0x910484,%eax
  10023b:	66 3d cf 07          	cmp    $0x7cf,%ax
  10023f:	76 59                	jbe    10029a <video_putc+0x1a1>
  100241:	a1 80 04 91 00       	mov    0x910480,%eax
  100246:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10024c:	a1 80 04 91 00       	mov    0x910480,%eax
  100251:	83 ec 04             	sub    $0x4,%esp
  100254:	68 00 0f 00 00       	push   $0xf00
  100259:	52                   	push   %edx
  10025a:	50                   	push   %eax
  10025b:	e8 e9 21 00 00       	call   102449 <memmove>
  100260:	83 c4 10             	add    $0x10,%esp
  100263:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  10026a:	eb 15                	jmp    100281 <video_putc+0x188>
  10026c:	a1 80 04 91 00       	mov    0x910480,%eax
  100271:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100274:	01 d2                	add    %edx,%edx
  100276:	01 d0                	add    %edx,%eax
  100278:	66 c7 00 20 07       	movw   $0x720,(%eax)
  10027d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100281:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  100288:	7e e2                	jle    10026c <video_putc+0x173>
  10028a:	0f b7 05 84 04 91 00 	movzwl 0x910484,%eax
  100291:	83 e8 50             	sub    $0x50,%eax
  100294:	66 a3 84 04 91 00    	mov    %ax,0x910484
  10029a:	a1 8c 04 91 00       	mov    0x91048c,%eax
  10029f:	83 ec 08             	sub    $0x8,%esp
  1002a2:	6a 0e                	push   $0xe
  1002a4:	50                   	push   %eax
  1002a5:	e8 0b 32 00 00       	call   1034b5 <outb>
  1002aa:	83 c4 10             	add    $0x10,%esp
  1002ad:	0f b7 05 84 04 91 00 	movzwl 0x910484,%eax
  1002b4:	66 c1 e8 08          	shr    $0x8,%ax
  1002b8:	0f b6 c0             	movzbl %al,%eax
  1002bb:	8b 15 8c 04 91 00    	mov    0x91048c,%edx
  1002c1:	83 c2 01             	add    $0x1,%edx
  1002c4:	83 ec 08             	sub    $0x8,%esp
  1002c7:	50                   	push   %eax
  1002c8:	52                   	push   %edx
  1002c9:	e8 e7 31 00 00       	call   1034b5 <outb>
  1002ce:	83 c4 10             	add    $0x10,%esp
  1002d1:	a1 8c 04 91 00       	mov    0x91048c,%eax
  1002d6:	83 ec 08             	sub    $0x8,%esp
  1002d9:	6a 0f                	push   $0xf
  1002db:	50                   	push   %eax
  1002dc:	e8 d4 31 00 00       	call   1034b5 <outb>
  1002e1:	83 c4 10             	add    $0x10,%esp
  1002e4:	0f b7 05 84 04 91 00 	movzwl 0x910484,%eax
  1002eb:	0f b6 c0             	movzbl %al,%eax
  1002ee:	8b 15 8c 04 91 00    	mov    0x91048c,%edx
  1002f4:	83 c2 01             	add    $0x1,%edx
  1002f7:	83 ec 08             	sub    $0x8,%esp
  1002fa:	50                   	push   %eax
  1002fb:	52                   	push   %edx
  1002fc:	e8 b4 31 00 00       	call   1034b5 <outb>
  100301:	83 c4 10             	add    $0x10,%esp
  100304:	90                   	nop
  100305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100308:	c9                   	leave  
  100309:	c3                   	ret    

0010030a <video_set_cursor>:
  10030a:	55                   	push   %ebp
  10030b:	89 e5                	mov    %esp,%ebp
  10030d:	8b 45 08             	mov    0x8(%ebp),%eax
  100310:	89 c2                	mov    %eax,%edx
  100312:	89 d0                	mov    %edx,%eax
  100314:	c1 e0 02             	shl    $0x2,%eax
  100317:	01 d0                	add    %edx,%eax
  100319:	c1 e0 04             	shl    $0x4,%eax
  10031c:	89 c2                	mov    %eax,%edx
  10031e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100321:	01 d0                	add    %edx,%eax
  100323:	66 a3 84 04 91 00    	mov    %ax,0x910484
  100329:	90                   	nop
  10032a:	5d                   	pop    %ebp
  10032b:	c3                   	ret    

0010032c <video_clear_screen>:
  10032c:	55                   	push   %ebp
  10032d:	89 e5                	mov    %esp,%ebp
  10032f:	83 ec 10             	sub    $0x10,%esp
  100332:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100339:	eb 15                	jmp    100350 <video_clear_screen+0x24>
  10033b:	a1 80 04 91 00       	mov    0x910480,%eax
  100340:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100343:	01 d2                	add    %edx,%edx
  100345:	01 d0                	add    %edx,%eax
  100347:	66 c7 00 20 00       	movw   $0x20,(%eax)
  10034c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100350:	81 7d fc cf 07 00 00 	cmpl   $0x7cf,-0x4(%ebp)
  100357:	7e e2                	jle    10033b <video_clear_screen+0xf>
  100359:	90                   	nop
  10035a:	c9                   	leave  
  10035b:	c3                   	ret    

0010035c <cons_init>:
  10035c:	55                   	push   %ebp
  10035d:	89 e5                	mov    %esp,%ebp
  10035f:	83 ec 08             	sub    $0x8,%esp
  100362:	83 ec 04             	sub    $0x4,%esp
  100365:	68 08 02 00 00       	push   $0x208
  10036a:	6a 00                	push   $0x0
  10036c:	68 a0 04 91 00       	push   $0x9104a0
  100371:	e8 65 20 00 00       	call   1023db <memset>
  100376:	83 c4 10             	add    $0x10,%esp
  100379:	e8 7b 03 00 00       	call   1006f9 <serial_init>
  10037e:	e8 7d fc ff ff       	call   100000 <video_init>
  100383:	90                   	nop
  100384:	c9                   	leave  
  100385:	c3                   	ret    

00100386 <cons_intr>:
  100386:	55                   	push   %ebp
  100387:	89 e5                	mov    %esp,%ebp
  100389:	83 ec 18             	sub    $0x18,%esp
  10038c:	eb 35                	jmp    1003c3 <cons_intr+0x3d>
  10038e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100392:	75 02                	jne    100396 <cons_intr+0x10>
  100394:	eb 2d                	jmp    1003c3 <cons_intr+0x3d>
  100396:	a1 a4 06 91 00       	mov    0x9106a4,%eax
  10039b:	8d 50 01             	lea    0x1(%eax),%edx
  10039e:	89 15 a4 06 91 00    	mov    %edx,0x9106a4
  1003a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1003a7:	88 90 a0 04 91 00    	mov    %dl,0x9104a0(%eax)
  1003ad:	a1 a4 06 91 00       	mov    0x9106a4,%eax
  1003b2:	3d 00 02 00 00       	cmp    $0x200,%eax
  1003b7:	75 0a                	jne    1003c3 <cons_intr+0x3d>
  1003b9:	c7 05 a4 06 91 00 00 	movl   $0x0,0x9106a4
  1003c0:	00 00 00 
  1003c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1003c6:	ff d0                	call   *%eax
  1003c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003cb:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1003cf:	75 bd                	jne    10038e <cons_intr+0x8>
  1003d1:	90                   	nop
  1003d2:	c9                   	leave  
  1003d3:	c3                   	ret    

001003d4 <cons_getc>:
  1003d4:	55                   	push   %ebp
  1003d5:	89 e5                	mov    %esp,%ebp
  1003d7:	83 ec 18             	sub    $0x18,%esp
  1003da:	e8 20 02 00 00       	call   1005ff <serial_intr>
  1003df:	e8 82 05 00 00       	call   100966 <keyboard_intr>
  1003e4:	8b 15 a0 06 91 00    	mov    0x9106a0,%edx
  1003ea:	a1 a4 06 91 00       	mov    0x9106a4,%eax
  1003ef:	39 c2                	cmp    %eax,%edx
  1003f1:	74 36                	je     100429 <cons_getc+0x55>
  1003f3:	a1 a0 06 91 00       	mov    0x9106a0,%eax
  1003f8:	8d 50 01             	lea    0x1(%eax),%edx
  1003fb:	89 15 a0 06 91 00    	mov    %edx,0x9106a0
  100401:	0f b6 80 a0 04 91 00 	movzbl 0x9104a0(%eax),%eax
  100408:	0f be c0             	movsbl %al,%eax
  10040b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10040e:	a1 a0 06 91 00       	mov    0x9106a0,%eax
  100413:	3d 00 02 00 00       	cmp    $0x200,%eax
  100418:	75 0a                	jne    100424 <cons_getc+0x50>
  10041a:	c7 05 a0 06 91 00 00 	movl   $0x0,0x9106a0
  100421:	00 00 00 
  100424:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100427:	eb 05                	jmp    10042e <cons_getc+0x5a>
  100429:	b8 00 00 00 00       	mov    $0x0,%eax
  10042e:	c9                   	leave  
  10042f:	c3                   	ret    

00100430 <cons_putc>:
  100430:	55                   	push   %ebp
  100431:	89 e5                	mov    %esp,%ebp
  100433:	83 ec 18             	sub    $0x18,%esp
  100436:	8b 45 08             	mov    0x8(%ebp),%eax
  100439:	88 45 f4             	mov    %al,-0xc(%ebp)
  10043c:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  100440:	83 ec 0c             	sub    $0xc,%esp
  100443:	50                   	push   %eax
  100444:	e8 2e 02 00 00       	call   100677 <serial_putc>
  100449:	83 c4 10             	add    $0x10,%esp
  10044c:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  100450:	83 ec 0c             	sub    $0xc,%esp
  100453:	50                   	push   %eax
  100454:	e8 a0 fc ff ff       	call   1000f9 <video_putc>
  100459:	83 c4 10             	add    $0x10,%esp
  10045c:	90                   	nop
  10045d:	c9                   	leave  
  10045e:	c3                   	ret    

0010045f <getchar>:
  10045f:	55                   	push   %ebp
  100460:	89 e5                	mov    %esp,%ebp
  100462:	83 ec 18             	sub    $0x18,%esp
  100465:	e8 6a ff ff ff       	call   1003d4 <cons_getc>
  10046a:	88 45 f7             	mov    %al,-0x9(%ebp)
  10046d:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100471:	74 f2                	je     100465 <getchar+0x6>
  100473:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  100477:	c9                   	leave  
  100478:	c3                   	ret    

00100479 <putchar>:
  100479:	55                   	push   %ebp
  10047a:	89 e5                	mov    %esp,%ebp
  10047c:	83 ec 18             	sub    $0x18,%esp
  10047f:	8b 45 08             	mov    0x8(%ebp),%eax
  100482:	88 45 f4             	mov    %al,-0xc(%ebp)
  100485:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  100489:	83 ec 0c             	sub    $0xc,%esp
  10048c:	50                   	push   %eax
  10048d:	e8 9e ff ff ff       	call   100430 <cons_putc>
  100492:	83 c4 10             	add    $0x10,%esp
  100495:	90                   	nop
  100496:	c9                   	leave  
  100497:	c3                   	ret    

00100498 <readline>:
  100498:	55                   	push   %ebp
  100499:	89 e5                	mov    %esp,%ebp
  10049b:	83 ec 18             	sub    $0x18,%esp
  10049e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1004a2:	74 13                	je     1004b7 <readline+0x1f>
  1004a4:	83 ec 08             	sub    $0x8,%esp
  1004a7:	ff 75 08             	pushl  0x8(%ebp)
  1004aa:	68 e2 5c 10 00       	push   $0x105ce2
  1004af:	e8 18 24 00 00       	call   1028cc <dprintf>
  1004b4:	83 c4 10             	add    $0x10,%esp
  1004b7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1004be:	e8 9c ff ff ff       	call   10045f <getchar>
  1004c3:	88 45 f3             	mov    %al,-0xd(%ebp)
  1004c6:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  1004ca:	79 1f                	jns    1004eb <readline+0x53>
  1004cc:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
  1004d0:	83 ec 08             	sub    $0x8,%esp
  1004d3:	50                   	push   %eax
  1004d4:	68 e5 5c 10 00       	push   $0x105ce5
  1004d9:	e8 ee 23 00 00       	call   1028cc <dprintf>
  1004de:	83 c4 10             	add    $0x10,%esp
  1004e1:	b8 00 00 00 00       	mov    $0x0,%eax
  1004e6:	e9 8d 00 00 00       	jmp    100578 <readline+0xe0>
  1004eb:	80 7d f3 08          	cmpb   $0x8,-0xd(%ebp)
  1004ef:	74 06                	je     1004f7 <readline+0x5f>
  1004f1:	80 7d f3 7f          	cmpb   $0x7f,-0xd(%ebp)
  1004f5:	75 19                	jne    100510 <readline+0x78>
  1004f7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004fb:	7e 13                	jle    100510 <readline+0x78>
  1004fd:	83 ec 0c             	sub    $0xc,%esp
  100500:	6a 08                	push   $0x8
  100502:	e8 72 ff ff ff       	call   100479 <putchar>
  100507:	83 c4 10             	add    $0x10,%esp
  10050a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10050e:	eb 63                	jmp    100573 <readline+0xdb>
  100510:	80 7d f3 1f          	cmpb   $0x1f,-0xd(%ebp)
  100514:	7e 2e                	jle    100544 <readline+0xac>
  100516:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  10051d:	7f 25                	jg     100544 <readline+0xac>
  10051f:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
  100523:	83 ec 0c             	sub    $0xc,%esp
  100526:	50                   	push   %eax
  100527:	e8 4d ff ff ff       	call   100479 <putchar>
  10052c:	83 c4 10             	add    $0x10,%esp
  10052f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100532:	8d 50 01             	lea    0x1(%eax),%edx
  100535:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100538:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
  10053c:	88 90 00 f0 10 00    	mov    %dl,0x10f000(%eax)
  100542:	eb 2f                	jmp    100573 <readline+0xdb>
  100544:	80 7d f3 0a          	cmpb   $0xa,-0xd(%ebp)
  100548:	74 0a                	je     100554 <readline+0xbc>
  10054a:	80 7d f3 0d          	cmpb   $0xd,-0xd(%ebp)
  10054e:	0f 85 6a ff ff ff    	jne    1004be <readline+0x26>
  100554:	83 ec 0c             	sub    $0xc,%esp
  100557:	6a 0a                	push   $0xa
  100559:	e8 1b ff ff ff       	call   100479 <putchar>
  10055e:	83 c4 10             	add    $0x10,%esp
  100561:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100564:	05 00 f0 10 00       	add    $0x10f000,%eax
  100569:	c6 00 00             	movb   $0x0,(%eax)
  10056c:	b8 00 f0 10 00       	mov    $0x10f000,%eax
  100571:	eb 05                	jmp    100578 <readline+0xe0>
  100573:	e9 46 ff ff ff       	jmp    1004be <readline+0x26>
  100578:	c9                   	leave  
  100579:	c3                   	ret    

0010057a <delay>:
  10057a:	55                   	push   %ebp
  10057b:	89 e5                	mov    %esp,%ebp
  10057d:	83 ec 08             	sub    $0x8,%esp
  100580:	83 ec 0c             	sub    $0xc,%esp
  100583:	68 84 00 00 00       	push   $0x84
  100588:	e8 ed 2e 00 00       	call   10347a <inb>
  10058d:	83 c4 10             	add    $0x10,%esp
  100590:	83 ec 0c             	sub    $0xc,%esp
  100593:	68 84 00 00 00       	push   $0x84
  100598:	e8 dd 2e 00 00       	call   10347a <inb>
  10059d:	83 c4 10             	add    $0x10,%esp
  1005a0:	83 ec 0c             	sub    $0xc,%esp
  1005a3:	68 84 00 00 00       	push   $0x84
  1005a8:	e8 cd 2e 00 00       	call   10347a <inb>
  1005ad:	83 c4 10             	add    $0x10,%esp
  1005b0:	83 ec 0c             	sub    $0xc,%esp
  1005b3:	68 84 00 00 00       	push   $0x84
  1005b8:	e8 bd 2e 00 00       	call   10347a <inb>
  1005bd:	83 c4 10             	add    $0x10,%esp
  1005c0:	90                   	nop
  1005c1:	c9                   	leave  
  1005c2:	c3                   	ret    

001005c3 <serial_proc_data>:
  1005c3:	55                   	push   %ebp
  1005c4:	89 e5                	mov    %esp,%ebp
  1005c6:	83 ec 08             	sub    $0x8,%esp
  1005c9:	83 ec 0c             	sub    $0xc,%esp
  1005cc:	68 fd 03 00 00       	push   $0x3fd
  1005d1:	e8 a4 2e 00 00       	call   10347a <inb>
  1005d6:	83 c4 10             	add    $0x10,%esp
  1005d9:	0f b6 c0             	movzbl %al,%eax
  1005dc:	83 e0 01             	and    $0x1,%eax
  1005df:	85 c0                	test   %eax,%eax
  1005e1:	75 07                	jne    1005ea <serial_proc_data+0x27>
  1005e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005e8:	eb 13                	jmp    1005fd <serial_proc_data+0x3a>
  1005ea:	83 ec 0c             	sub    $0xc,%esp
  1005ed:	68 f8 03 00 00       	push   $0x3f8
  1005f2:	e8 83 2e 00 00       	call   10347a <inb>
  1005f7:	83 c4 10             	add    $0x10,%esp
  1005fa:	0f b6 c0             	movzbl %al,%eax
  1005fd:	c9                   	leave  
  1005fe:	c3                   	ret    

001005ff <serial_intr>:
  1005ff:	55                   	push   %ebp
  100600:	89 e5                	mov    %esp,%ebp
  100602:	83 ec 08             	sub    $0x8,%esp
  100605:	0f b6 05 a8 06 91 00 	movzbl 0x9106a8,%eax
  10060c:	84 c0                	test   %al,%al
  10060e:	74 10                	je     100620 <serial_intr+0x21>
  100610:	83 ec 0c             	sub    $0xc,%esp
  100613:	68 c3 05 10 00       	push   $0x1005c3
  100618:	e8 69 fd ff ff       	call   100386 <cons_intr>
  10061d:	83 c4 10             	add    $0x10,%esp
  100620:	90                   	nop
  100621:	c9                   	leave  
  100622:	c3                   	ret    

00100623 <serial_reformatnewline>:
  100623:	55                   	push   %ebp
  100624:	89 e5                	mov    %esp,%ebp
  100626:	83 ec 18             	sub    $0x18,%esp
  100629:	c7 45 f4 0d 00 00 00 	movl   $0xd,-0xc(%ebp)
  100630:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  100637:	8b 45 08             	mov    0x8(%ebp),%eax
  10063a:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  10063d:	75 31                	jne    100670 <serial_reformatnewline+0x4d>
  10063f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100642:	0f b6 c0             	movzbl %al,%eax
  100645:	83 ec 08             	sub    $0x8,%esp
  100648:	50                   	push   %eax
  100649:	ff 75 0c             	pushl  0xc(%ebp)
  10064c:	e8 64 2e 00 00       	call   1034b5 <outb>
  100651:	83 c4 10             	add    $0x10,%esp
  100654:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100657:	0f b6 c0             	movzbl %al,%eax
  10065a:	83 ec 08             	sub    $0x8,%esp
  10065d:	50                   	push   %eax
  10065e:	ff 75 0c             	pushl  0xc(%ebp)
  100661:	e8 4f 2e 00 00       	call   1034b5 <outb>
  100666:	83 c4 10             	add    $0x10,%esp
  100669:	b8 01 00 00 00       	mov    $0x1,%eax
  10066e:	eb 05                	jmp    100675 <serial_reformatnewline+0x52>
  100670:	b8 00 00 00 00       	mov    $0x0,%eax
  100675:	c9                   	leave  
  100676:	c3                   	ret    

00100677 <serial_putc>:
  100677:	55                   	push   %ebp
  100678:	89 e5                	mov    %esp,%ebp
  10067a:	83 ec 28             	sub    $0x28,%esp
  10067d:	8b 45 08             	mov    0x8(%ebp),%eax
  100680:	88 45 e4             	mov    %al,-0x1c(%ebp)
  100683:	0f b6 05 a8 06 91 00 	movzbl 0x9106a8,%eax
  10068a:	84 c0                	test   %al,%al
  10068c:	74 68                	je     1006f6 <serial_putc+0x7f>
  10068e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100695:	eb 09                	jmp    1006a0 <serial_putc+0x29>
  100697:	e8 de fe ff ff       	call   10057a <delay>
  10069c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1006a0:	83 ec 0c             	sub    $0xc,%esp
  1006a3:	68 fd 03 00 00       	push   $0x3fd
  1006a8:	e8 cd 2d 00 00       	call   10347a <inb>
  1006ad:	83 c4 10             	add    $0x10,%esp
  1006b0:	0f b6 c0             	movzbl %al,%eax
  1006b3:	83 e0 20             	and    $0x20,%eax
  1006b6:	85 c0                	test   %eax,%eax
  1006b8:	75 09                	jne    1006c3 <serial_putc+0x4c>
  1006ba:	81 7d f4 ff 31 00 00 	cmpl   $0x31ff,-0xc(%ebp)
  1006c1:	7e d4                	jle    100697 <serial_putc+0x20>
  1006c3:	0f be 45 e4          	movsbl -0x1c(%ebp),%eax
  1006c7:	83 ec 08             	sub    $0x8,%esp
  1006ca:	68 f8 03 00 00       	push   $0x3f8
  1006cf:	50                   	push   %eax
  1006d0:	e8 4e ff ff ff       	call   100623 <serial_reformatnewline>
  1006d5:	83 c4 10             	add    $0x10,%esp
  1006d8:	85 c0                	test   %eax,%eax
  1006da:	75 1b                	jne    1006f7 <serial_putc+0x80>
  1006dc:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  1006e0:	0f b6 c0             	movzbl %al,%eax
  1006e3:	83 ec 08             	sub    $0x8,%esp
  1006e6:	50                   	push   %eax
  1006e7:	68 f8 03 00 00       	push   $0x3f8
  1006ec:	e8 c4 2d 00 00       	call   1034b5 <outb>
  1006f1:	83 c4 10             	add    $0x10,%esp
  1006f4:	eb 01                	jmp    1006f7 <serial_putc+0x80>
  1006f6:	90                   	nop
  1006f7:	c9                   	leave  
  1006f8:	c3                   	ret    

001006f9 <serial_init>:
  1006f9:	55                   	push   %ebp
  1006fa:	89 e5                	mov    %esp,%ebp
  1006fc:	83 ec 08             	sub    $0x8,%esp
  1006ff:	83 ec 08             	sub    $0x8,%esp
  100702:	6a 00                	push   $0x0
  100704:	68 f9 03 00 00       	push   $0x3f9
  100709:	e8 a7 2d 00 00       	call   1034b5 <outb>
  10070e:	83 c4 10             	add    $0x10,%esp
  100711:	83 ec 08             	sub    $0x8,%esp
  100714:	68 80 00 00 00       	push   $0x80
  100719:	68 fb 03 00 00       	push   $0x3fb
  10071e:	e8 92 2d 00 00       	call   1034b5 <outb>
  100723:	83 c4 10             	add    $0x10,%esp
  100726:	83 ec 08             	sub    $0x8,%esp
  100729:	6a 01                	push   $0x1
  10072b:	68 f8 03 00 00       	push   $0x3f8
  100730:	e8 80 2d 00 00       	call   1034b5 <outb>
  100735:	83 c4 10             	add    $0x10,%esp
  100738:	83 ec 08             	sub    $0x8,%esp
  10073b:	6a 00                	push   $0x0
  10073d:	68 f9 03 00 00       	push   $0x3f9
  100742:	e8 6e 2d 00 00       	call   1034b5 <outb>
  100747:	83 c4 10             	add    $0x10,%esp
  10074a:	83 ec 08             	sub    $0x8,%esp
  10074d:	6a 03                	push   $0x3
  10074f:	68 fb 03 00 00       	push   $0x3fb
  100754:	e8 5c 2d 00 00       	call   1034b5 <outb>
  100759:	83 c4 10             	add    $0x10,%esp
  10075c:	83 ec 08             	sub    $0x8,%esp
  10075f:	68 c7 00 00 00       	push   $0xc7
  100764:	68 fa 03 00 00       	push   $0x3fa
  100769:	e8 47 2d 00 00       	call   1034b5 <outb>
  10076e:	83 c4 10             	add    $0x10,%esp
  100771:	83 ec 08             	sub    $0x8,%esp
  100774:	6a 0b                	push   $0xb
  100776:	68 fc 03 00 00       	push   $0x3fc
  10077b:	e8 35 2d 00 00       	call   1034b5 <outb>
  100780:	83 c4 10             	add    $0x10,%esp
  100783:	83 ec 0c             	sub    $0xc,%esp
  100786:	68 fd 03 00 00       	push   $0x3fd
  10078b:	e8 ea 2c 00 00       	call   10347a <inb>
  100790:	83 c4 10             	add    $0x10,%esp
  100793:	3c ff                	cmp    $0xff,%al
  100795:	0f 95 c0             	setne  %al
  100798:	a2 a8 06 91 00       	mov    %al,0x9106a8
  10079d:	83 ec 0c             	sub    $0xc,%esp
  1007a0:	68 fa 03 00 00       	push   $0x3fa
  1007a5:	e8 d0 2c 00 00       	call   10347a <inb>
  1007aa:	83 c4 10             	add    $0x10,%esp
  1007ad:	83 ec 0c             	sub    $0xc,%esp
  1007b0:	68 f8 03 00 00       	push   $0x3f8
  1007b5:	e8 c0 2c 00 00       	call   10347a <inb>
  1007ba:	83 c4 10             	add    $0x10,%esp
  1007bd:	90                   	nop
  1007be:	c9                   	leave  
  1007bf:	c3                   	ret    

001007c0 <serial_intenable>:
  1007c0:	55                   	push   %ebp
  1007c1:	89 e5                	mov    %esp,%ebp
  1007c3:	83 ec 08             	sub    $0x8,%esp
  1007c6:	0f b6 05 a8 06 91 00 	movzbl 0x9106a8,%eax
  1007cd:	84 c0                	test   %al,%al
  1007cf:	74 17                	je     1007e8 <serial_intenable+0x28>
  1007d1:	83 ec 08             	sub    $0x8,%esp
  1007d4:	6a 01                	push   $0x1
  1007d6:	68 f9 03 00 00       	push   $0x3f9
  1007db:	e8 d5 2c 00 00       	call   1034b5 <outb>
  1007e0:	83 c4 10             	add    $0x10,%esp
  1007e3:	e8 17 fe ff ff       	call   1005ff <serial_intr>
  1007e8:	90                   	nop
  1007e9:	c9                   	leave  
  1007ea:	c3                   	ret    

001007eb <kbd_proc_data>:
  1007eb:	55                   	push   %ebp
  1007ec:	89 e5                	mov    %esp,%ebp
  1007ee:	83 ec 18             	sub    $0x18,%esp
  1007f1:	83 ec 0c             	sub    $0xc,%esp
  1007f4:	6a 64                	push   $0x64
  1007f6:	e8 7f 2c 00 00       	call   10347a <inb>
  1007fb:	83 c4 10             	add    $0x10,%esp
  1007fe:	83 e0 01             	and    $0x1,%eax
  100801:	85 c0                	test   %eax,%eax
  100803:	75 0a                	jne    10080f <kbd_proc_data+0x24>
  100805:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10080a:	e9 55 01 00 00       	jmp    100964 <kbd_proc_data+0x179>
  10080f:	83 ec 0c             	sub    $0xc,%esp
  100812:	6a 60                	push   $0x60
  100814:	e8 61 2c 00 00       	call   10347a <inb>
  100819:	83 c4 10             	add    $0x10,%esp
  10081c:	88 45 f3             	mov    %al,-0xd(%ebp)
  10081f:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  100823:	75 17                	jne    10083c <kbd_proc_data+0x51>
  100825:	a1 00 f4 10 00       	mov    0x10f400,%eax
  10082a:	83 c8 40             	or     $0x40,%eax
  10082d:	a3 00 f4 10 00       	mov    %eax,0x10f400
  100832:	b8 00 00 00 00       	mov    $0x0,%eax
  100837:	e9 28 01 00 00       	jmp    100964 <kbd_proc_data+0x179>
  10083c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100840:	84 c0                	test   %al,%al
  100842:	79 47                	jns    10088b <kbd_proc_data+0xa0>
  100844:	a1 00 f4 10 00       	mov    0x10f400,%eax
  100849:	83 e0 40             	and    $0x40,%eax
  10084c:	85 c0                	test   %eax,%eax
  10084e:	75 09                	jne    100859 <kbd_proc_data+0x6e>
  100850:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100854:	83 e0 7f             	and    $0x7f,%eax
  100857:	eb 04                	jmp    10085d <kbd_proc_data+0x72>
  100859:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10085d:	88 45 f3             	mov    %al,-0xd(%ebp)
  100860:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100864:	0f b6 80 00 a0 10 00 	movzbl 0x10a000(%eax),%eax
  10086b:	83 c8 40             	or     $0x40,%eax
  10086e:	0f b6 c0             	movzbl %al,%eax
  100871:	f7 d0                	not    %eax
  100873:	89 c2                	mov    %eax,%edx
  100875:	a1 00 f4 10 00       	mov    0x10f400,%eax
  10087a:	21 d0                	and    %edx,%eax
  10087c:	a3 00 f4 10 00       	mov    %eax,0x10f400
  100881:	b8 00 00 00 00       	mov    $0x0,%eax
  100886:	e9 d9 00 00 00       	jmp    100964 <kbd_proc_data+0x179>
  10088b:	a1 00 f4 10 00       	mov    0x10f400,%eax
  100890:	83 e0 40             	and    $0x40,%eax
  100893:	85 c0                	test   %eax,%eax
  100895:	74 11                	je     1008a8 <kbd_proc_data+0xbd>
  100897:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
  10089b:	a1 00 f4 10 00       	mov    0x10f400,%eax
  1008a0:	83 e0 bf             	and    $0xffffffbf,%eax
  1008a3:	a3 00 f4 10 00       	mov    %eax,0x10f400
  1008a8:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1008ac:	0f b6 80 00 a0 10 00 	movzbl 0x10a000(%eax),%eax
  1008b3:	0f b6 d0             	movzbl %al,%edx
  1008b6:	a1 00 f4 10 00       	mov    0x10f400,%eax
  1008bb:	09 d0                	or     %edx,%eax
  1008bd:	a3 00 f4 10 00       	mov    %eax,0x10f400
  1008c2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1008c6:	0f b6 80 00 a1 10 00 	movzbl 0x10a100(%eax),%eax
  1008cd:	0f b6 d0             	movzbl %al,%edx
  1008d0:	a1 00 f4 10 00       	mov    0x10f400,%eax
  1008d5:	31 d0                	xor    %edx,%eax
  1008d7:	a3 00 f4 10 00       	mov    %eax,0x10f400
  1008dc:	a1 00 f4 10 00       	mov    0x10f400,%eax
  1008e1:	83 e0 03             	and    $0x3,%eax
  1008e4:	8b 14 85 00 a5 10 00 	mov    0x10a500(,%eax,4),%edx
  1008eb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1008ef:	01 d0                	add    %edx,%eax
  1008f1:	0f b6 00             	movzbl (%eax),%eax
  1008f4:	0f b6 c0             	movzbl %al,%eax
  1008f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1008fa:	a1 00 f4 10 00       	mov    0x10f400,%eax
  1008ff:	83 e0 08             	and    $0x8,%eax
  100902:	85 c0                	test   %eax,%eax
  100904:	74 22                	je     100928 <kbd_proc_data+0x13d>
  100906:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  10090a:	7e 0c                	jle    100918 <kbd_proc_data+0x12d>
  10090c:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  100910:	7f 06                	jg     100918 <kbd_proc_data+0x12d>
  100912:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  100916:	eb 10                	jmp    100928 <kbd_proc_data+0x13d>
  100918:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  10091c:	7e 0a                	jle    100928 <kbd_proc_data+0x13d>
  10091e:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  100922:	7f 04                	jg     100928 <kbd_proc_data+0x13d>
  100924:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
  100928:	a1 00 f4 10 00       	mov    0x10f400,%eax
  10092d:	f7 d0                	not    %eax
  10092f:	83 e0 06             	and    $0x6,%eax
  100932:	85 c0                	test   %eax,%eax
  100934:	75 2b                	jne    100961 <kbd_proc_data+0x176>
  100936:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10093d:	75 22                	jne    100961 <kbd_proc_data+0x176>
  10093f:	83 ec 0c             	sub    $0xc,%esp
  100942:	68 f5 5c 10 00       	push   $0x105cf5
  100947:	e8 80 1f 00 00       	call   1028cc <dprintf>
  10094c:	83 c4 10             	add    $0x10,%esp
  10094f:	83 ec 08             	sub    $0x8,%esp
  100952:	6a 03                	push   $0x3
  100954:	68 92 00 00 00       	push   $0x92
  100959:	e8 57 2b 00 00       	call   1034b5 <outb>
  10095e:	83 c4 10             	add    $0x10,%esp
  100961:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100964:	c9                   	leave  
  100965:	c3                   	ret    

00100966 <keyboard_intr>:
  100966:	55                   	push   %ebp
  100967:	89 e5                	mov    %esp,%ebp
  100969:	83 ec 08             	sub    $0x8,%esp
  10096c:	83 ec 0c             	sub    $0xc,%esp
  10096f:	68 eb 07 10 00       	push   $0x1007eb
  100974:	e8 0d fa ff ff       	call   100386 <cons_intr>
  100979:	83 c4 10             	add    $0x10,%esp
  10097c:	90                   	nop
  10097d:	c9                   	leave  
  10097e:	c3                   	ret    

0010097f <devinit>:
  10097f:	55                   	push   %ebp
  100980:	89 e5                	mov    %esp,%ebp
  100982:	83 ec 08             	sub    $0x8,%esp
  100985:	e8 e3 23 00 00       	call   102d6d <seg_init>
  10098a:	e8 b1 29 00 00       	call   103340 <enable_sse>
  10098f:	e8 c8 f9 ff ff       	call   10035c <cons_init>
  100994:	83 ec 04             	sub    $0x4,%esp
  100997:	68 01 5d 10 00       	push   $0x105d01
  10099c:	6a 13                	push   $0x13
  10099e:	68 14 5d 10 00       	push   $0x105d14
  1009a3:	e8 bf 1c 00 00       	call   102667 <debug_normal>
  1009a8:	83 c4 10             	add    $0x10,%esp
  1009ab:	ff 75 08             	pushl  0x8(%ebp)
  1009ae:	68 27 5d 10 00       	push   $0x105d27
  1009b3:	6a 14                	push   $0x14
  1009b5:	68 14 5d 10 00       	push   $0x105d14
  1009ba:	e8 a8 1c 00 00       	call   102667 <debug_normal>
  1009bf:	83 c4 10             	add    $0x10,%esp
  1009c2:	e8 51 18 00 00       	call   102218 <intr_init>
  1009c7:	83 ec 0c             	sub    $0xc,%esp
  1009ca:	ff 75 08             	pushl  0x8(%ebp)
  1009cd:	e8 4c 03 00 00       	call   100d1e <pmmap_init>
  1009d2:	83 c4 10             	add    $0x10,%esp
  1009d5:	90                   	nop
  1009d6:	c9                   	leave  
  1009d7:	c3                   	ret    

001009d8 <pmmap_alloc_slot>:
  1009d8:	55                   	push   %ebp
  1009d9:	89 e5                	mov    %esp,%ebp
  1009db:	a1 20 fe 10 00       	mov    0x10fe20,%eax
  1009e0:	3d 80 00 00 00       	cmp    $0x80,%eax
  1009e5:	0f 94 c0             	sete   %al
  1009e8:	0f b6 c0             	movzbl %al,%eax
  1009eb:	85 c0                	test   %eax,%eax
  1009ed:	74 07                	je     1009f6 <pmmap_alloc_slot+0x1e>
  1009ef:	b8 00 00 00 00       	mov    $0x0,%eax
  1009f4:	eb 1d                	jmp    100a13 <pmmap_alloc_slot+0x3b>
  1009f6:	8b 15 20 fe 10 00    	mov    0x10fe20,%edx
  1009fc:	8d 42 01             	lea    0x1(%edx),%eax
  1009ff:	a3 20 fe 10 00       	mov    %eax,0x10fe20
  100a04:	89 d0                	mov    %edx,%eax
  100a06:	c1 e0 02             	shl    $0x2,%eax
  100a09:	01 d0                	add    %edx,%eax
  100a0b:	c1 e0 02             	shl    $0x2,%eax
  100a0e:	05 20 f4 10 00       	add    $0x10f420,%eax
  100a13:	5d                   	pop    %ebp
  100a14:	c3                   	ret    

00100a15 <pmmap_insert>:
  100a15:	55                   	push   %ebp
  100a16:	89 e5                	mov    %esp,%ebp
  100a18:	83 ec 18             	sub    $0x18,%esp
  100a1b:	e8 b8 ff ff ff       	call   1009d8 <pmmap_alloc_slot>
  100a20:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100a23:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100a27:	75 17                	jne    100a40 <pmmap_insert+0x2b>
  100a29:	83 ec 04             	sub    $0x4,%esp
  100a2c:	68 3c 5d 10 00       	push   $0x105d3c
  100a31:	6a 3e                	push   $0x3e
  100a33:	68 59 5d 10 00       	push   $0x105d59
  100a38:	e8 c9 1c 00 00       	call   102706 <debug_panic>
  100a3d:	83 c4 10             	add    $0x10,%esp
  100a40:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a43:	8b 55 08             	mov    0x8(%ebp),%edx
  100a46:	89 10                	mov    %edx,(%eax)
  100a48:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  100a4e:	89 50 04             	mov    %edx,0x4(%eax)
  100a51:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a54:	8b 55 10             	mov    0x10(%ebp),%edx
  100a57:	89 50 08             	mov    %edx,0x8(%eax)
  100a5a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  100a61:	a1 24 fe 10 00       	mov    0x10fe24,%eax
  100a66:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a69:	eb 19                	jmp    100a84 <pmmap_insert+0x6f>
  100a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a6e:	8b 00                	mov    (%eax),%eax
  100a70:	3b 45 08             	cmp    0x8(%ebp),%eax
  100a73:	77 17                	ja     100a8c <pmmap_insert+0x77>
  100a75:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a78:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100a7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a7e:	8b 40 0c             	mov    0xc(%eax),%eax
  100a81:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a84:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a88:	75 e1                	jne    100a6b <pmmap_insert+0x56>
  100a8a:	eb 01                	jmp    100a8d <pmmap_insert+0x78>
  100a8c:	90                   	nop
  100a8d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100a91:	75 16                	jne    100aa9 <pmmap_insert+0x94>
  100a93:	8b 15 24 fe 10 00    	mov    0x10fe24,%edx
  100a99:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a9c:	89 50 0c             	mov    %edx,0xc(%eax)
  100a9f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100aa2:	a3 24 fe 10 00       	mov    %eax,0x10fe24
  100aa7:	eb 15                	jmp    100abe <pmmap_insert+0xa9>
  100aa9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100aac:	8b 50 0c             	mov    0xc(%eax),%edx
  100aaf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100ab2:	89 50 0c             	mov    %edx,0xc(%eax)
  100ab5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ab8:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100abb:	89 50 0c             	mov    %edx,0xc(%eax)
  100abe:	90                   	nop
  100abf:	c9                   	leave  
  100ac0:	c3                   	ret    

00100ac1 <pmmap_merge>:
  100ac1:	55                   	push   %ebp
  100ac2:	89 e5                	mov    %esp,%ebp
  100ac4:	83 ec 28             	sub    $0x28,%esp
  100ac7:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  100ace:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  100ad5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100adc:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100ae3:	a1 24 fe 10 00       	mov    0x10fe24,%eax
  100ae8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100aeb:	eb 75                	jmp    100b62 <pmmap_merge+0xa1>
  100aed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100af0:	8b 40 0c             	mov    0xc(%eax),%eax
  100af3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100af6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100afa:	74 6e                	je     100b6a <pmmap_merge+0xa9>
  100afc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aff:	8b 10                	mov    (%eax),%edx
  100b01:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b04:	8b 00                	mov    (%eax),%eax
  100b06:	39 c2                	cmp    %eax,%edx
  100b08:	77 4f                	ja     100b59 <pmmap_merge+0x98>
  100b0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b0d:	8b 50 04             	mov    0x4(%eax),%edx
  100b10:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b13:	8b 00                	mov    (%eax),%eax
  100b15:	39 c2                	cmp    %eax,%edx
  100b17:	72 40                	jb     100b59 <pmmap_merge+0x98>
  100b19:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b1c:	8b 50 08             	mov    0x8(%eax),%edx
  100b1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b22:	8b 40 08             	mov    0x8(%eax),%eax
  100b25:	39 c2                	cmp    %eax,%edx
  100b27:	75 30                	jne    100b59 <pmmap_merge+0x98>
  100b29:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b2c:	8b 50 04             	mov    0x4(%eax),%edx
  100b2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b32:	8b 40 04             	mov    0x4(%eax),%eax
  100b35:	83 ec 08             	sub    $0x8,%esp
  100b38:	52                   	push   %edx
  100b39:	50                   	push   %eax
  100b3a:	e8 34 27 00 00       	call   103273 <max>
  100b3f:	83 c4 10             	add    $0x10,%esp
  100b42:	89 c2                	mov    %eax,%edx
  100b44:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b47:	89 50 04             	mov    %edx,0x4(%eax)
  100b4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b4d:	8b 40 0c             	mov    0xc(%eax),%eax
  100b50:	8b 50 0c             	mov    0xc(%eax),%edx
  100b53:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b56:	89 50 0c             	mov    %edx,0xc(%eax)
  100b59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b5c:	8b 40 0c             	mov    0xc(%eax),%eax
  100b5f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100b62:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b66:	75 85                	jne    100aed <pmmap_merge+0x2c>
  100b68:	eb 01                	jmp    100b6b <pmmap_merge+0xaa>
  100b6a:	90                   	nop
  100b6b:	a1 24 fe 10 00       	mov    0x10fe24,%eax
  100b70:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100b73:	e9 c9 00 00 00       	jmp    100c41 <pmmap_merge+0x180>
  100b78:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b7b:	8b 40 08             	mov    0x8(%eax),%eax
  100b7e:	83 f8 01             	cmp    $0x1,%eax
  100b81:	74 3d                	je     100bc0 <pmmap_merge+0xff>
  100b83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b86:	8b 40 08             	mov    0x8(%eax),%eax
  100b89:	83 f8 02             	cmp    $0x2,%eax
  100b8c:	74 2b                	je     100bb9 <pmmap_merge+0xf8>
  100b8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b91:	8b 40 08             	mov    0x8(%eax),%eax
  100b94:	83 f8 03             	cmp    $0x3,%eax
  100b97:	74 19                	je     100bb2 <pmmap_merge+0xf1>
  100b99:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b9c:	8b 40 08             	mov    0x8(%eax),%eax
  100b9f:	83 f8 04             	cmp    $0x4,%eax
  100ba2:	75 07                	jne    100bab <pmmap_merge+0xea>
  100ba4:	b8 03 00 00 00       	mov    $0x3,%eax
  100ba9:	eb 1a                	jmp    100bc5 <pmmap_merge+0x104>
  100bab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100bb0:	eb 13                	jmp    100bc5 <pmmap_merge+0x104>
  100bb2:	b8 02 00 00 00       	mov    $0x2,%eax
  100bb7:	eb 0c                	jmp    100bc5 <pmmap_merge+0x104>
  100bb9:	b8 01 00 00 00       	mov    $0x1,%eax
  100bbe:	eb 05                	jmp    100bc5 <pmmap_merge+0x104>
  100bc0:	b8 00 00 00 00       	mov    $0x0,%eax
  100bc5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100bc8:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  100bcc:	75 19                	jne    100be7 <pmmap_merge+0x126>
  100bce:	68 6a 5d 10 00       	push   $0x105d6a
  100bd3:	68 7b 5d 10 00       	push   $0x105d7b
  100bd8:	6a 71                	push   $0x71
  100bda:	68 59 5d 10 00       	push   $0x105d59
  100bdf:	e8 22 1b 00 00       	call   102706 <debug_panic>
  100be4:	83 c4 10             	add    $0x10,%esp
  100be7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bea:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100bee:	85 c0                	test   %eax,%eax
  100bf0:	74 1f                	je     100c11 <pmmap_merge+0x150>
  100bf2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bf5:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100bf9:	8b 50 10             	mov    0x10(%eax),%edx
  100bfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bff:	89 50 10             	mov    %edx,0x10(%eax)
  100c02:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c05:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100c09:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c0c:	89 50 10             	mov    %edx,0x10(%eax)
  100c0f:	eb 1d                	jmp    100c2e <pmmap_merge+0x16d>
  100c11:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c14:	8b 14 85 28 fe 10 00 	mov    0x10fe28(,%eax,4),%edx
  100c1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c1e:	89 50 10             	mov    %edx,0x10(%eax)
  100c21:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c24:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c27:	89 14 85 28 fe 10 00 	mov    %edx,0x10fe28(,%eax,4)
  100c2e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c31:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c34:	89 54 85 dc          	mov    %edx,-0x24(%ebp,%eax,4)
  100c38:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c3b:	8b 40 0c             	mov    0xc(%eax),%eax
  100c3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c41:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c45:	0f 85 2d ff ff ff    	jne    100b78 <pmmap_merge+0xb7>
  100c4b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100c4e:	85 c0                	test   %eax,%eax
  100c50:	74 0b                	je     100c5d <pmmap_merge+0x19c>
  100c52:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100c55:	8b 40 04             	mov    0x4(%eax),%eax
  100c58:	a3 38 fe 10 00       	mov    %eax,0x10fe38
  100c5d:	90                   	nop
  100c5e:	c9                   	leave  
  100c5f:	c3                   	ret    

00100c60 <pmmap_dump>:
  100c60:	55                   	push   %ebp
  100c61:	89 e5                	mov    %esp,%ebp
  100c63:	83 ec 18             	sub    $0x18,%esp
  100c66:	a1 24 fe 10 00       	mov    0x10fe24,%eax
  100c6b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c6e:	e9 9e 00 00 00       	jmp    100d11 <pmmap_dump+0xb1>
  100c73:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c76:	8b 40 08             	mov    0x8(%eax),%eax
  100c79:	83 f8 01             	cmp    $0x1,%eax
  100c7c:	74 3d                	je     100cbb <pmmap_dump+0x5b>
  100c7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c81:	8b 40 08             	mov    0x8(%eax),%eax
  100c84:	83 f8 02             	cmp    $0x2,%eax
  100c87:	74 2b                	je     100cb4 <pmmap_dump+0x54>
  100c89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c8c:	8b 40 08             	mov    0x8(%eax),%eax
  100c8f:	83 f8 03             	cmp    $0x3,%eax
  100c92:	74 19                	je     100cad <pmmap_dump+0x4d>
  100c94:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c97:	8b 40 08             	mov    0x8(%eax),%eax
  100c9a:	83 f8 04             	cmp    $0x4,%eax
  100c9d:	75 07                	jne    100ca6 <pmmap_dump+0x46>
  100c9f:	ba 98 5d 10 00       	mov    $0x105d98,%edx
  100ca4:	eb 1a                	jmp    100cc0 <pmmap_dump+0x60>
  100ca6:	ba a1 5d 10 00       	mov    $0x105da1,%edx
  100cab:	eb 13                	jmp    100cc0 <pmmap_dump+0x60>
  100cad:	ba a9 5d 10 00       	mov    $0x105da9,%edx
  100cb2:	eb 0c                	jmp    100cc0 <pmmap_dump+0x60>
  100cb4:	ba b3 5d 10 00       	mov    $0x105db3,%edx
  100cb9:	eb 05                	jmp    100cc0 <pmmap_dump+0x60>
  100cbb:	ba bc 5d 10 00       	mov    $0x105dbc,%edx
  100cc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cc3:	8b 08                	mov    (%eax),%ecx
  100cc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cc8:	8b 40 04             	mov    0x4(%eax),%eax
  100ccb:	39 c1                	cmp    %eax,%ecx
  100ccd:	75 08                	jne    100cd7 <pmmap_dump+0x77>
  100ccf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd2:	8b 40 04             	mov    0x4(%eax),%eax
  100cd5:	eb 1c                	jmp    100cf3 <pmmap_dump+0x93>
  100cd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cda:	8b 40 04             	mov    0x4(%eax),%eax
  100cdd:	83 f8 ff             	cmp    $0xffffffff,%eax
  100ce0:	75 08                	jne    100cea <pmmap_dump+0x8a>
  100ce2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ce5:	8b 40 04             	mov    0x4(%eax),%eax
  100ce8:	eb 09                	jmp    100cf3 <pmmap_dump+0x93>
  100cea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ced:	8b 40 04             	mov    0x4(%eax),%eax
  100cf0:	83 e8 01             	sub    $0x1,%eax
  100cf3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100cf6:	8b 09                	mov    (%ecx),%ecx
  100cf8:	52                   	push   %edx
  100cf9:	50                   	push   %eax
  100cfa:	51                   	push   %ecx
  100cfb:	68 c4 5d 10 00       	push   $0x105dc4
  100d00:	e8 41 19 00 00       	call   102646 <debug_info>
  100d05:	83 c4 10             	add    $0x10,%esp
  100d08:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d0b:	8b 40 0c             	mov    0xc(%eax),%eax
  100d0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d11:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d15:	0f 85 58 ff ff ff    	jne    100c73 <pmmap_dump+0x13>
  100d1b:	90                   	nop
  100d1c:	c9                   	leave  
  100d1d:	c3                   	ret    

00100d1e <pmmap_init>:
  100d1e:	55                   	push   %ebp
  100d1f:	89 e5                	mov    %esp,%ebp
  100d21:	83 ec 28             	sub    $0x28,%esp
  100d24:	83 ec 0c             	sub    $0xc,%esp
  100d27:	68 e5 5d 10 00       	push   $0x105de5
  100d2c:	e8 15 19 00 00       	call   102646 <debug_info>
  100d31:	83 c4 10             	add    $0x10,%esp
  100d34:	8b 45 08             	mov    0x8(%ebp),%eax
  100d37:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100d3a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100d3d:	8b 40 30             	mov    0x30(%eax),%eax
  100d40:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d43:	c7 05 24 fe 10 00 00 	movl   $0x0,0x10fe24
  100d4a:	00 00 00 
  100d4d:	c7 05 28 fe 10 00 00 	movl   $0x0,0x10fe28
  100d54:	00 00 00 
  100d57:	c7 05 2c fe 10 00 00 	movl   $0x0,0x10fe2c
  100d5e:	00 00 00 
  100d61:	c7 05 30 fe 10 00 00 	movl   $0x0,0x10fe30
  100d68:	00 00 00 
  100d6b:	c7 05 34 fe 10 00 00 	movl   $0x0,0x10fe34
  100d72:	00 00 00 
  100d75:	eb 6c                	jmp    100de3 <pmmap_init+0xc5>
  100d77:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d7a:	8b 40 08             	mov    0x8(%eax),%eax
  100d7d:	85 c0                	test   %eax,%eax
  100d7f:	75 58                	jne    100dd9 <pmmap_init+0xbb>
  100d81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d84:	8b 40 04             	mov    0x4(%eax),%eax
  100d87:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100d8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d8d:	8b 40 10             	mov    0x10(%eax),%eax
  100d90:	85 c0                	test   %eax,%eax
  100d92:	75 0f                	jne    100da3 <pmmap_init+0x85>
  100d94:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d97:	8b 40 0c             	mov    0xc(%eax),%eax
  100d9a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100d9d:	f7 d2                	not    %edx
  100d9f:	39 d0                	cmp    %edx,%eax
  100da1:	72 09                	jb     100dac <pmmap_init+0x8e>
  100da3:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
  100daa:	eb 0e                	jmp    100dba <pmmap_init+0x9c>
  100dac:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100daf:	8b 50 0c             	mov    0xc(%eax),%edx
  100db2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100db5:	01 d0                	add    %edx,%eax
  100db7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100dba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dbd:	8b 40 14             	mov    0x14(%eax),%eax
  100dc0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  100dc3:	83 ec 04             	sub    $0x4,%esp
  100dc6:	ff 75 e0             	pushl  -0x20(%ebp)
  100dc9:	ff 75 f0             	pushl  -0x10(%ebp)
  100dcc:	ff 75 e4             	pushl  -0x1c(%ebp)
  100dcf:	e8 41 fc ff ff       	call   100a15 <pmmap_insert>
  100dd4:	83 c4 10             	add    $0x10,%esp
  100dd7:	eb 01                	jmp    100dda <pmmap_init+0xbc>
  100dd9:	90                   	nop
  100dda:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ddd:	83 c0 18             	add    $0x18,%eax
  100de0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100de3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100de6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100de9:	8b 40 30             	mov    0x30(%eax),%eax
  100dec:	29 c2                	sub    %eax,%edx
  100dee:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100df1:	8b 40 2c             	mov    0x2c(%eax),%eax
  100df4:	39 c2                	cmp    %eax,%edx
  100df6:	0f 82 7b ff ff ff    	jb     100d77 <pmmap_init+0x59>
  100dfc:	e8 c0 fc ff ff       	call   100ac1 <pmmap_merge>
  100e01:	e8 5a fe ff ff       	call   100c60 <pmmap_dump>
  100e06:	a1 24 fe 10 00       	mov    0x10fe24,%eax
  100e0b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100e0e:	eb 16                	jmp    100e26 <pmmap_init+0x108>
  100e10:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  100e15:	83 c0 01             	add    $0x1,%eax
  100e18:	a3 40 fe 10 00       	mov    %eax,0x10fe40
  100e1d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e20:	8b 40 0c             	mov    0xc(%eax),%eax
  100e23:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100e26:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100e2a:	75 e4                	jne    100e10 <pmmap_init+0xf2>
  100e2c:	a1 38 fe 10 00       	mov    0x10fe38,%eax
  100e31:	83 ec 08             	sub    $0x8,%esp
  100e34:	68 00 10 00 00       	push   $0x1000
  100e39:	50                   	push   %eax
  100e3a:	e8 52 24 00 00       	call   103291 <rounddown>
  100e3f:	83 c4 10             	add    $0x10,%esp
  100e42:	c1 e8 0c             	shr    $0xc,%eax
  100e45:	a3 3c fe 10 00       	mov    %eax,0x10fe3c
  100e4a:	90                   	nop
  100e4b:	c9                   	leave  
  100e4c:	c3                   	ret    

00100e4d <get_size>:
  100e4d:	55                   	push   %ebp
  100e4e:	89 e5                	mov    %esp,%ebp
  100e50:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  100e55:	5d                   	pop    %ebp
  100e56:	c3                   	ret    

00100e57 <get_mms>:
  100e57:	55                   	push   %ebp
  100e58:	89 e5                	mov    %esp,%ebp
  100e5a:	83 ec 10             	sub    $0x10,%esp
  100e5d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100e64:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  100e6b:	a1 24 fe 10 00       	mov    0x10fe24,%eax
  100e70:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100e73:	eb 15                	jmp    100e8a <get_mms+0x33>
  100e75:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e78:	3b 45 08             	cmp    0x8(%ebp),%eax
  100e7b:	74 15                	je     100e92 <get_mms+0x3b>
  100e7d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100e81:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e84:	8b 40 0c             	mov    0xc(%eax),%eax
  100e87:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100e8a:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  100e8e:	75 e5                	jne    100e75 <get_mms+0x1e>
  100e90:	eb 01                	jmp    100e93 <get_mms+0x3c>
  100e92:	90                   	nop
  100e93:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  100e97:	74 0a                	je     100ea3 <get_mms+0x4c>
  100e99:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  100e9e:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  100ea1:	75 07                	jne    100eaa <get_mms+0x53>
  100ea3:	b8 00 00 00 00       	mov    $0x0,%eax
  100ea8:	eb 05                	jmp    100eaf <get_mms+0x58>
  100eaa:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100ead:	8b 00                	mov    (%eax),%eax
  100eaf:	c9                   	leave  
  100eb0:	c3                   	ret    

00100eb1 <get_mml>:
  100eb1:	55                   	push   %ebp
  100eb2:	89 e5                	mov    %esp,%ebp
  100eb4:	83 ec 10             	sub    $0x10,%esp
  100eb7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100ebe:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  100ec5:	a1 24 fe 10 00       	mov    0x10fe24,%eax
  100eca:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100ecd:	eb 15                	jmp    100ee4 <get_mml+0x33>
  100ecf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ed2:	3b 45 08             	cmp    0x8(%ebp),%eax
  100ed5:	74 15                	je     100eec <get_mml+0x3b>
  100ed7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100edb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100ede:	8b 40 0c             	mov    0xc(%eax),%eax
  100ee1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100ee4:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  100ee8:	75 e5                	jne    100ecf <get_mml+0x1e>
  100eea:	eb 01                	jmp    100eed <get_mml+0x3c>
  100eec:	90                   	nop
  100eed:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  100ef1:	74 0a                	je     100efd <get_mml+0x4c>
  100ef3:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  100ef8:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  100efb:	75 07                	jne    100f04 <get_mml+0x53>
  100efd:	b8 00 00 00 00       	mov    $0x0,%eax
  100f02:	eb 0f                	jmp    100f13 <get_mml+0x62>
  100f04:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f07:	8b 50 04             	mov    0x4(%eax),%edx
  100f0a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f0d:	8b 00                	mov    (%eax),%eax
  100f0f:	29 c2                	sub    %eax,%edx
  100f11:	89 d0                	mov    %edx,%eax
  100f13:	c9                   	leave  
  100f14:	c3                   	ret    

00100f15 <is_usable>:
  100f15:	55                   	push   %ebp
  100f16:	89 e5                	mov    %esp,%ebp
  100f18:	83 ec 10             	sub    $0x10,%esp
  100f1b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100f22:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  100f29:	a1 24 fe 10 00       	mov    0x10fe24,%eax
  100f2e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100f31:	eb 15                	jmp    100f48 <is_usable+0x33>
  100f33:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f36:	3b 45 08             	cmp    0x8(%ebp),%eax
  100f39:	74 15                	je     100f50 <is_usable+0x3b>
  100f3b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100f3f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f42:	8b 40 0c             	mov    0xc(%eax),%eax
  100f45:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100f48:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  100f4c:	75 e5                	jne    100f33 <is_usable+0x1e>
  100f4e:	eb 01                	jmp    100f51 <is_usable+0x3c>
  100f50:	90                   	nop
  100f51:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  100f55:	74 0a                	je     100f61 <is_usable+0x4c>
  100f57:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  100f5c:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  100f5f:	75 07                	jne    100f68 <is_usable+0x53>
  100f61:	b8 00 00 00 00       	mov    $0x0,%eax
  100f66:	eb 0f                	jmp    100f77 <is_usable+0x62>
  100f68:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f6b:	8b 40 08             	mov    0x8(%eax),%eax
  100f6e:	83 f8 01             	cmp    $0x1,%eax
  100f71:	0f 94 c0             	sete   %al
  100f74:	0f b6 c0             	movzbl %al,%eax
  100f77:	c9                   	leave  
  100f78:	c3                   	ret    

00100f79 <set_cr3>:
  100f79:	55                   	push   %ebp
  100f7a:	89 e5                	mov    %esp,%ebp
  100f7c:	83 ec 08             	sub    $0x8,%esp
  100f7f:	8b 45 08             	mov    0x8(%ebp),%eax
  100f82:	83 ec 0c             	sub    $0xc,%esp
  100f85:	50                   	push   %eax
  100f86:	e8 c6 24 00 00       	call   103451 <lcr3>
  100f8b:	83 c4 10             	add    $0x10,%esp
  100f8e:	90                   	nop
  100f8f:	c9                   	leave  
  100f90:	c3                   	ret    

00100f91 <enable_paging>:
  100f91:	55                   	push   %ebp
  100f92:	89 e5                	mov    %esp,%ebp
  100f94:	83 ec 18             	sub    $0x18,%esp
  100f97:	e8 cd 24 00 00       	call   103469 <rcr4>
  100f9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100f9f:	81 4d f4 80 00 00 00 	orl    $0x80,-0xc(%ebp)
  100fa6:	83 ec 0c             	sub    $0xc,%esp
  100fa9:	ff 75 f4             	pushl  -0xc(%ebp)
  100fac:	e8 ac 24 00 00       	call   10345d <lcr4>
  100fb1:	83 c4 10             	add    $0x10,%esp
  100fb4:	e8 76 24 00 00       	call   10342f <rcr0>
  100fb9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100fbc:	81 4d f0 23 00 05 80 	orl    $0x80050023,-0x10(%ebp)
  100fc3:	83 65 f0 f3          	andl   $0xfffffff3,-0x10(%ebp)
  100fc7:	83 ec 0c             	sub    $0xc,%esp
  100fca:	ff 75 f0             	pushl  -0x10(%ebp)
  100fcd:	e8 51 24 00 00       	call   103423 <lcr0>
  100fd2:	83 c4 10             	add    $0x10,%esp
  100fd5:	90                   	nop
  100fd6:	c9                   	leave  
  100fd7:	c3                   	ret    

00100fd8 <intr_init_idt>:
  100fd8:	55                   	push   %ebp
  100fd9:	89 e5                	mov    %esp,%ebp
  100fdb:	83 ec 10             	sub    $0x10,%esp
  100fde:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fe5:	e9 b9 00 00 00       	jmp    1010a3 <intr_init_idt+0xcb>
  100fea:	b8 9e 23 10 00       	mov    $0x10239e,%eax
  100fef:	89 c2                	mov    %eax,%edx
  100ff1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ff4:	66 89 14 c5 c0 06 91 	mov    %dx,0x9106c0(,%eax,8)
  100ffb:	00 
  100ffc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100fff:	66 c7 04 c5 c2 06 91 	movw   $0x8,0x9106c2(,%eax,8)
  101006:	00 08 00 
  101009:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10100c:	0f b6 14 c5 c4 06 91 	movzbl 0x9106c4(,%eax,8),%edx
  101013:	00 
  101014:	83 e2 e0             	and    $0xffffffe0,%edx
  101017:	88 14 c5 c4 06 91 00 	mov    %dl,0x9106c4(,%eax,8)
  10101e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101021:	0f b6 14 c5 c4 06 91 	movzbl 0x9106c4(,%eax,8),%edx
  101028:	00 
  101029:	83 e2 1f             	and    $0x1f,%edx
  10102c:	88 14 c5 c4 06 91 00 	mov    %dl,0x9106c4(,%eax,8)
  101033:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101036:	0f b6 14 c5 c5 06 91 	movzbl 0x9106c5(,%eax,8),%edx
  10103d:	00 
  10103e:	83 e2 f0             	and    $0xfffffff0,%edx
  101041:	83 ca 0e             	or     $0xe,%edx
  101044:	88 14 c5 c5 06 91 00 	mov    %dl,0x9106c5(,%eax,8)
  10104b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10104e:	0f b6 14 c5 c5 06 91 	movzbl 0x9106c5(,%eax,8),%edx
  101055:	00 
  101056:	83 e2 ef             	and    $0xffffffef,%edx
  101059:	88 14 c5 c5 06 91 00 	mov    %dl,0x9106c5(,%eax,8)
  101060:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101063:	0f b6 14 c5 c5 06 91 	movzbl 0x9106c5(,%eax,8),%edx
  10106a:	00 
  10106b:	83 e2 9f             	and    $0xffffff9f,%edx
  10106e:	88 14 c5 c5 06 91 00 	mov    %dl,0x9106c5(,%eax,8)
  101075:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101078:	0f b6 14 c5 c5 06 91 	movzbl 0x9106c5(,%eax,8),%edx
  10107f:	00 
  101080:	83 ca 80             	or     $0xffffff80,%edx
  101083:	88 14 c5 c5 06 91 00 	mov    %dl,0x9106c5(,%eax,8)
  10108a:	b8 9e 23 10 00       	mov    $0x10239e,%eax
  10108f:	c1 e8 10             	shr    $0x10,%eax
  101092:	89 c2                	mov    %eax,%edx
  101094:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101097:	66 89 14 c5 c6 06 91 	mov    %dx,0x9106c6(,%eax,8)
  10109e:	00 
  10109f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1010a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1010a6:	3d ff 00 00 00       	cmp    $0xff,%eax
  1010ab:	0f 86 39 ff ff ff    	jbe    100fea <intr_init_idt+0x12>
  1010b1:	b8 40 22 10 00       	mov    $0x102240,%eax
  1010b6:	66 a3 c0 06 91 00    	mov    %ax,0x9106c0
  1010bc:	66 c7 05 c2 06 91 00 	movw   $0x8,0x9106c2
  1010c3:	08 00 
  1010c5:	0f b6 05 c4 06 91 00 	movzbl 0x9106c4,%eax
  1010cc:	83 e0 e0             	and    $0xffffffe0,%eax
  1010cf:	a2 c4 06 91 00       	mov    %al,0x9106c4
  1010d4:	0f b6 05 c4 06 91 00 	movzbl 0x9106c4,%eax
  1010db:	83 e0 1f             	and    $0x1f,%eax
  1010de:	a2 c4 06 91 00       	mov    %al,0x9106c4
  1010e3:	0f b6 05 c5 06 91 00 	movzbl 0x9106c5,%eax
  1010ea:	83 e0 f0             	and    $0xfffffff0,%eax
  1010ed:	83 c8 0e             	or     $0xe,%eax
  1010f0:	a2 c5 06 91 00       	mov    %al,0x9106c5
  1010f5:	0f b6 05 c5 06 91 00 	movzbl 0x9106c5,%eax
  1010fc:	83 e0 ef             	and    $0xffffffef,%eax
  1010ff:	a2 c5 06 91 00       	mov    %al,0x9106c5
  101104:	0f b6 05 c5 06 91 00 	movzbl 0x9106c5,%eax
  10110b:	83 e0 9f             	and    $0xffffff9f,%eax
  10110e:	a2 c5 06 91 00       	mov    %al,0x9106c5
  101113:	0f b6 05 c5 06 91 00 	movzbl 0x9106c5,%eax
  10111a:	83 c8 80             	or     $0xffffff80,%eax
  10111d:	a2 c5 06 91 00       	mov    %al,0x9106c5
  101122:	b8 40 22 10 00       	mov    $0x102240,%eax
  101127:	c1 e8 10             	shr    $0x10,%eax
  10112a:	66 a3 c6 06 91 00    	mov    %ax,0x9106c6
  101130:	b8 4a 22 10 00       	mov    $0x10224a,%eax
  101135:	66 a3 c8 06 91 00    	mov    %ax,0x9106c8
  10113b:	66 c7 05 ca 06 91 00 	movw   $0x8,0x9106ca
  101142:	08 00 
  101144:	0f b6 05 cc 06 91 00 	movzbl 0x9106cc,%eax
  10114b:	83 e0 e0             	and    $0xffffffe0,%eax
  10114e:	a2 cc 06 91 00       	mov    %al,0x9106cc
  101153:	0f b6 05 cc 06 91 00 	movzbl 0x9106cc,%eax
  10115a:	83 e0 1f             	and    $0x1f,%eax
  10115d:	a2 cc 06 91 00       	mov    %al,0x9106cc
  101162:	0f b6 05 cd 06 91 00 	movzbl 0x9106cd,%eax
  101169:	83 e0 f0             	and    $0xfffffff0,%eax
  10116c:	83 c8 0e             	or     $0xe,%eax
  10116f:	a2 cd 06 91 00       	mov    %al,0x9106cd
  101174:	0f b6 05 cd 06 91 00 	movzbl 0x9106cd,%eax
  10117b:	83 e0 ef             	and    $0xffffffef,%eax
  10117e:	a2 cd 06 91 00       	mov    %al,0x9106cd
  101183:	0f b6 05 cd 06 91 00 	movzbl 0x9106cd,%eax
  10118a:	83 e0 9f             	and    $0xffffff9f,%eax
  10118d:	a2 cd 06 91 00       	mov    %al,0x9106cd
  101192:	0f b6 05 cd 06 91 00 	movzbl 0x9106cd,%eax
  101199:	83 c8 80             	or     $0xffffff80,%eax
  10119c:	a2 cd 06 91 00       	mov    %al,0x9106cd
  1011a1:	b8 4a 22 10 00       	mov    $0x10224a,%eax
  1011a6:	c1 e8 10             	shr    $0x10,%eax
  1011a9:	66 a3 ce 06 91 00    	mov    %ax,0x9106ce
  1011af:	b8 54 22 10 00       	mov    $0x102254,%eax
  1011b4:	66 a3 d0 06 91 00    	mov    %ax,0x9106d0
  1011ba:	66 c7 05 d2 06 91 00 	movw   $0x8,0x9106d2
  1011c1:	08 00 
  1011c3:	0f b6 05 d4 06 91 00 	movzbl 0x9106d4,%eax
  1011ca:	83 e0 e0             	and    $0xffffffe0,%eax
  1011cd:	a2 d4 06 91 00       	mov    %al,0x9106d4
  1011d2:	0f b6 05 d4 06 91 00 	movzbl 0x9106d4,%eax
  1011d9:	83 e0 1f             	and    $0x1f,%eax
  1011dc:	a2 d4 06 91 00       	mov    %al,0x9106d4
  1011e1:	0f b6 05 d5 06 91 00 	movzbl 0x9106d5,%eax
  1011e8:	83 e0 f0             	and    $0xfffffff0,%eax
  1011eb:	83 c8 0e             	or     $0xe,%eax
  1011ee:	a2 d5 06 91 00       	mov    %al,0x9106d5
  1011f3:	0f b6 05 d5 06 91 00 	movzbl 0x9106d5,%eax
  1011fa:	83 e0 ef             	and    $0xffffffef,%eax
  1011fd:	a2 d5 06 91 00       	mov    %al,0x9106d5
  101202:	0f b6 05 d5 06 91 00 	movzbl 0x9106d5,%eax
  101209:	83 e0 9f             	and    $0xffffff9f,%eax
  10120c:	a2 d5 06 91 00       	mov    %al,0x9106d5
  101211:	0f b6 05 d5 06 91 00 	movzbl 0x9106d5,%eax
  101218:	83 c8 80             	or     $0xffffff80,%eax
  10121b:	a2 d5 06 91 00       	mov    %al,0x9106d5
  101220:	b8 54 22 10 00       	mov    $0x102254,%eax
  101225:	c1 e8 10             	shr    $0x10,%eax
  101228:	66 a3 d6 06 91 00    	mov    %ax,0x9106d6
  10122e:	b8 5e 22 10 00       	mov    $0x10225e,%eax
  101233:	66 a3 d8 06 91 00    	mov    %ax,0x9106d8
  101239:	66 c7 05 da 06 91 00 	movw   $0x8,0x9106da
  101240:	08 00 
  101242:	0f b6 05 dc 06 91 00 	movzbl 0x9106dc,%eax
  101249:	83 e0 e0             	and    $0xffffffe0,%eax
  10124c:	a2 dc 06 91 00       	mov    %al,0x9106dc
  101251:	0f b6 05 dc 06 91 00 	movzbl 0x9106dc,%eax
  101258:	83 e0 1f             	and    $0x1f,%eax
  10125b:	a2 dc 06 91 00       	mov    %al,0x9106dc
  101260:	0f b6 05 dd 06 91 00 	movzbl 0x9106dd,%eax
  101267:	83 e0 f0             	and    $0xfffffff0,%eax
  10126a:	83 c8 0e             	or     $0xe,%eax
  10126d:	a2 dd 06 91 00       	mov    %al,0x9106dd
  101272:	0f b6 05 dd 06 91 00 	movzbl 0x9106dd,%eax
  101279:	83 e0 ef             	and    $0xffffffef,%eax
  10127c:	a2 dd 06 91 00       	mov    %al,0x9106dd
  101281:	0f b6 05 dd 06 91 00 	movzbl 0x9106dd,%eax
  101288:	83 c8 60             	or     $0x60,%eax
  10128b:	a2 dd 06 91 00       	mov    %al,0x9106dd
  101290:	0f b6 05 dd 06 91 00 	movzbl 0x9106dd,%eax
  101297:	83 c8 80             	or     $0xffffff80,%eax
  10129a:	a2 dd 06 91 00       	mov    %al,0x9106dd
  10129f:	b8 5e 22 10 00       	mov    $0x10225e,%eax
  1012a4:	c1 e8 10             	shr    $0x10,%eax
  1012a7:	66 a3 de 06 91 00    	mov    %ax,0x9106de
  1012ad:	b8 68 22 10 00       	mov    $0x102268,%eax
  1012b2:	66 a3 e0 06 91 00    	mov    %ax,0x9106e0
  1012b8:	66 c7 05 e2 06 91 00 	movw   $0x8,0x9106e2
  1012bf:	08 00 
  1012c1:	0f b6 05 e4 06 91 00 	movzbl 0x9106e4,%eax
  1012c8:	83 e0 e0             	and    $0xffffffe0,%eax
  1012cb:	a2 e4 06 91 00       	mov    %al,0x9106e4
  1012d0:	0f b6 05 e4 06 91 00 	movzbl 0x9106e4,%eax
  1012d7:	83 e0 1f             	and    $0x1f,%eax
  1012da:	a2 e4 06 91 00       	mov    %al,0x9106e4
  1012df:	0f b6 05 e5 06 91 00 	movzbl 0x9106e5,%eax
  1012e6:	83 e0 f0             	and    $0xfffffff0,%eax
  1012e9:	83 c8 0e             	or     $0xe,%eax
  1012ec:	a2 e5 06 91 00       	mov    %al,0x9106e5
  1012f1:	0f b6 05 e5 06 91 00 	movzbl 0x9106e5,%eax
  1012f8:	83 e0 ef             	and    $0xffffffef,%eax
  1012fb:	a2 e5 06 91 00       	mov    %al,0x9106e5
  101300:	0f b6 05 e5 06 91 00 	movzbl 0x9106e5,%eax
  101307:	83 c8 60             	or     $0x60,%eax
  10130a:	a2 e5 06 91 00       	mov    %al,0x9106e5
  10130f:	0f b6 05 e5 06 91 00 	movzbl 0x9106e5,%eax
  101316:	83 c8 80             	or     $0xffffff80,%eax
  101319:	a2 e5 06 91 00       	mov    %al,0x9106e5
  10131e:	b8 68 22 10 00       	mov    $0x102268,%eax
  101323:	c1 e8 10             	shr    $0x10,%eax
  101326:	66 a3 e6 06 91 00    	mov    %ax,0x9106e6
  10132c:	b8 72 22 10 00       	mov    $0x102272,%eax
  101331:	66 a3 e8 06 91 00    	mov    %ax,0x9106e8
  101337:	66 c7 05 ea 06 91 00 	movw   $0x8,0x9106ea
  10133e:	08 00 
  101340:	0f b6 05 ec 06 91 00 	movzbl 0x9106ec,%eax
  101347:	83 e0 e0             	and    $0xffffffe0,%eax
  10134a:	a2 ec 06 91 00       	mov    %al,0x9106ec
  10134f:	0f b6 05 ec 06 91 00 	movzbl 0x9106ec,%eax
  101356:	83 e0 1f             	and    $0x1f,%eax
  101359:	a2 ec 06 91 00       	mov    %al,0x9106ec
  10135e:	0f b6 05 ed 06 91 00 	movzbl 0x9106ed,%eax
  101365:	83 e0 f0             	and    $0xfffffff0,%eax
  101368:	83 c8 0e             	or     $0xe,%eax
  10136b:	a2 ed 06 91 00       	mov    %al,0x9106ed
  101370:	0f b6 05 ed 06 91 00 	movzbl 0x9106ed,%eax
  101377:	83 e0 ef             	and    $0xffffffef,%eax
  10137a:	a2 ed 06 91 00       	mov    %al,0x9106ed
  10137f:	0f b6 05 ed 06 91 00 	movzbl 0x9106ed,%eax
  101386:	83 e0 9f             	and    $0xffffff9f,%eax
  101389:	a2 ed 06 91 00       	mov    %al,0x9106ed
  10138e:	0f b6 05 ed 06 91 00 	movzbl 0x9106ed,%eax
  101395:	83 c8 80             	or     $0xffffff80,%eax
  101398:	a2 ed 06 91 00       	mov    %al,0x9106ed
  10139d:	b8 72 22 10 00       	mov    $0x102272,%eax
  1013a2:	c1 e8 10             	shr    $0x10,%eax
  1013a5:	66 a3 ee 06 91 00    	mov    %ax,0x9106ee
  1013ab:	b8 7c 22 10 00       	mov    $0x10227c,%eax
  1013b0:	66 a3 f0 06 91 00    	mov    %ax,0x9106f0
  1013b6:	66 c7 05 f2 06 91 00 	movw   $0x8,0x9106f2
  1013bd:	08 00 
  1013bf:	0f b6 05 f4 06 91 00 	movzbl 0x9106f4,%eax
  1013c6:	83 e0 e0             	and    $0xffffffe0,%eax
  1013c9:	a2 f4 06 91 00       	mov    %al,0x9106f4
  1013ce:	0f b6 05 f4 06 91 00 	movzbl 0x9106f4,%eax
  1013d5:	83 e0 1f             	and    $0x1f,%eax
  1013d8:	a2 f4 06 91 00       	mov    %al,0x9106f4
  1013dd:	0f b6 05 f5 06 91 00 	movzbl 0x9106f5,%eax
  1013e4:	83 e0 f0             	and    $0xfffffff0,%eax
  1013e7:	83 c8 0e             	or     $0xe,%eax
  1013ea:	a2 f5 06 91 00       	mov    %al,0x9106f5
  1013ef:	0f b6 05 f5 06 91 00 	movzbl 0x9106f5,%eax
  1013f6:	83 e0 ef             	and    $0xffffffef,%eax
  1013f9:	a2 f5 06 91 00       	mov    %al,0x9106f5
  1013fe:	0f b6 05 f5 06 91 00 	movzbl 0x9106f5,%eax
  101405:	83 e0 9f             	and    $0xffffff9f,%eax
  101408:	a2 f5 06 91 00       	mov    %al,0x9106f5
  10140d:	0f b6 05 f5 06 91 00 	movzbl 0x9106f5,%eax
  101414:	83 c8 80             	or     $0xffffff80,%eax
  101417:	a2 f5 06 91 00       	mov    %al,0x9106f5
  10141c:	b8 7c 22 10 00       	mov    $0x10227c,%eax
  101421:	c1 e8 10             	shr    $0x10,%eax
  101424:	66 a3 f6 06 91 00    	mov    %ax,0x9106f6
  10142a:	b8 86 22 10 00       	mov    $0x102286,%eax
  10142f:	66 a3 f8 06 91 00    	mov    %ax,0x9106f8
  101435:	66 c7 05 fa 06 91 00 	movw   $0x8,0x9106fa
  10143c:	08 00 
  10143e:	0f b6 05 fc 06 91 00 	movzbl 0x9106fc,%eax
  101445:	83 e0 e0             	and    $0xffffffe0,%eax
  101448:	a2 fc 06 91 00       	mov    %al,0x9106fc
  10144d:	0f b6 05 fc 06 91 00 	movzbl 0x9106fc,%eax
  101454:	83 e0 1f             	and    $0x1f,%eax
  101457:	a2 fc 06 91 00       	mov    %al,0x9106fc
  10145c:	0f b6 05 fd 06 91 00 	movzbl 0x9106fd,%eax
  101463:	83 e0 f0             	and    $0xfffffff0,%eax
  101466:	83 c8 0e             	or     $0xe,%eax
  101469:	a2 fd 06 91 00       	mov    %al,0x9106fd
  10146e:	0f b6 05 fd 06 91 00 	movzbl 0x9106fd,%eax
  101475:	83 e0 ef             	and    $0xffffffef,%eax
  101478:	a2 fd 06 91 00       	mov    %al,0x9106fd
  10147d:	0f b6 05 fd 06 91 00 	movzbl 0x9106fd,%eax
  101484:	83 e0 9f             	and    $0xffffff9f,%eax
  101487:	a2 fd 06 91 00       	mov    %al,0x9106fd
  10148c:	0f b6 05 fd 06 91 00 	movzbl 0x9106fd,%eax
  101493:	83 c8 80             	or     $0xffffff80,%eax
  101496:	a2 fd 06 91 00       	mov    %al,0x9106fd
  10149b:	b8 86 22 10 00       	mov    $0x102286,%eax
  1014a0:	c1 e8 10             	shr    $0x10,%eax
  1014a3:	66 a3 fe 06 91 00    	mov    %ax,0x9106fe
  1014a9:	b8 90 22 10 00       	mov    $0x102290,%eax
  1014ae:	66 a3 00 07 91 00    	mov    %ax,0x910700
  1014b4:	66 c7 05 02 07 91 00 	movw   $0x8,0x910702
  1014bb:	08 00 
  1014bd:	0f b6 05 04 07 91 00 	movzbl 0x910704,%eax
  1014c4:	83 e0 e0             	and    $0xffffffe0,%eax
  1014c7:	a2 04 07 91 00       	mov    %al,0x910704
  1014cc:	0f b6 05 04 07 91 00 	movzbl 0x910704,%eax
  1014d3:	83 e0 1f             	and    $0x1f,%eax
  1014d6:	a2 04 07 91 00       	mov    %al,0x910704
  1014db:	0f b6 05 05 07 91 00 	movzbl 0x910705,%eax
  1014e2:	83 e0 f0             	and    $0xfffffff0,%eax
  1014e5:	83 c8 0e             	or     $0xe,%eax
  1014e8:	a2 05 07 91 00       	mov    %al,0x910705
  1014ed:	0f b6 05 05 07 91 00 	movzbl 0x910705,%eax
  1014f4:	83 e0 ef             	and    $0xffffffef,%eax
  1014f7:	a2 05 07 91 00       	mov    %al,0x910705
  1014fc:	0f b6 05 05 07 91 00 	movzbl 0x910705,%eax
  101503:	83 e0 9f             	and    $0xffffff9f,%eax
  101506:	a2 05 07 91 00       	mov    %al,0x910705
  10150b:	0f b6 05 05 07 91 00 	movzbl 0x910705,%eax
  101512:	83 c8 80             	or     $0xffffff80,%eax
  101515:	a2 05 07 91 00       	mov    %al,0x910705
  10151a:	b8 90 22 10 00       	mov    $0x102290,%eax
  10151f:	c1 e8 10             	shr    $0x10,%eax
  101522:	66 a3 06 07 91 00    	mov    %ax,0x910706
  101528:	b8 a2 22 10 00       	mov    $0x1022a2,%eax
  10152d:	66 a3 10 07 91 00    	mov    %ax,0x910710
  101533:	66 c7 05 12 07 91 00 	movw   $0x8,0x910712
  10153a:	08 00 
  10153c:	0f b6 05 14 07 91 00 	movzbl 0x910714,%eax
  101543:	83 e0 e0             	and    $0xffffffe0,%eax
  101546:	a2 14 07 91 00       	mov    %al,0x910714
  10154b:	0f b6 05 14 07 91 00 	movzbl 0x910714,%eax
  101552:	83 e0 1f             	and    $0x1f,%eax
  101555:	a2 14 07 91 00       	mov    %al,0x910714
  10155a:	0f b6 05 15 07 91 00 	movzbl 0x910715,%eax
  101561:	83 e0 f0             	and    $0xfffffff0,%eax
  101564:	83 c8 0e             	or     $0xe,%eax
  101567:	a2 15 07 91 00       	mov    %al,0x910715
  10156c:	0f b6 05 15 07 91 00 	movzbl 0x910715,%eax
  101573:	83 e0 ef             	and    $0xffffffef,%eax
  101576:	a2 15 07 91 00       	mov    %al,0x910715
  10157b:	0f b6 05 15 07 91 00 	movzbl 0x910715,%eax
  101582:	83 e0 9f             	and    $0xffffff9f,%eax
  101585:	a2 15 07 91 00       	mov    %al,0x910715
  10158a:	0f b6 05 15 07 91 00 	movzbl 0x910715,%eax
  101591:	83 c8 80             	or     $0xffffff80,%eax
  101594:	a2 15 07 91 00       	mov    %al,0x910715
  101599:	b8 a2 22 10 00       	mov    $0x1022a2,%eax
  10159e:	c1 e8 10             	shr    $0x10,%eax
  1015a1:	66 a3 16 07 91 00    	mov    %ax,0x910716
  1015a7:	b8 aa 22 10 00       	mov    $0x1022aa,%eax
  1015ac:	66 a3 18 07 91 00    	mov    %ax,0x910718
  1015b2:	66 c7 05 1a 07 91 00 	movw   $0x8,0x91071a
  1015b9:	08 00 
  1015bb:	0f b6 05 1c 07 91 00 	movzbl 0x91071c,%eax
  1015c2:	83 e0 e0             	and    $0xffffffe0,%eax
  1015c5:	a2 1c 07 91 00       	mov    %al,0x91071c
  1015ca:	0f b6 05 1c 07 91 00 	movzbl 0x91071c,%eax
  1015d1:	83 e0 1f             	and    $0x1f,%eax
  1015d4:	a2 1c 07 91 00       	mov    %al,0x91071c
  1015d9:	0f b6 05 1d 07 91 00 	movzbl 0x91071d,%eax
  1015e0:	83 e0 f0             	and    $0xfffffff0,%eax
  1015e3:	83 c8 0e             	or     $0xe,%eax
  1015e6:	a2 1d 07 91 00       	mov    %al,0x91071d
  1015eb:	0f b6 05 1d 07 91 00 	movzbl 0x91071d,%eax
  1015f2:	83 e0 ef             	and    $0xffffffef,%eax
  1015f5:	a2 1d 07 91 00       	mov    %al,0x91071d
  1015fa:	0f b6 05 1d 07 91 00 	movzbl 0x91071d,%eax
  101601:	83 e0 9f             	and    $0xffffff9f,%eax
  101604:	a2 1d 07 91 00       	mov    %al,0x91071d
  101609:	0f b6 05 1d 07 91 00 	movzbl 0x91071d,%eax
  101610:	83 c8 80             	or     $0xffffff80,%eax
  101613:	a2 1d 07 91 00       	mov    %al,0x91071d
  101618:	b8 aa 22 10 00       	mov    $0x1022aa,%eax
  10161d:	c1 e8 10             	shr    $0x10,%eax
  101620:	66 a3 1e 07 91 00    	mov    %ax,0x91071e
  101626:	b8 b2 22 10 00       	mov    $0x1022b2,%eax
  10162b:	66 a3 20 07 91 00    	mov    %ax,0x910720
  101631:	66 c7 05 22 07 91 00 	movw   $0x8,0x910722
  101638:	08 00 
  10163a:	0f b6 05 24 07 91 00 	movzbl 0x910724,%eax
  101641:	83 e0 e0             	and    $0xffffffe0,%eax
  101644:	a2 24 07 91 00       	mov    %al,0x910724
  101649:	0f b6 05 24 07 91 00 	movzbl 0x910724,%eax
  101650:	83 e0 1f             	and    $0x1f,%eax
  101653:	a2 24 07 91 00       	mov    %al,0x910724
  101658:	0f b6 05 25 07 91 00 	movzbl 0x910725,%eax
  10165f:	83 e0 f0             	and    $0xfffffff0,%eax
  101662:	83 c8 0e             	or     $0xe,%eax
  101665:	a2 25 07 91 00       	mov    %al,0x910725
  10166a:	0f b6 05 25 07 91 00 	movzbl 0x910725,%eax
  101671:	83 e0 ef             	and    $0xffffffef,%eax
  101674:	a2 25 07 91 00       	mov    %al,0x910725
  101679:	0f b6 05 25 07 91 00 	movzbl 0x910725,%eax
  101680:	83 e0 9f             	and    $0xffffff9f,%eax
  101683:	a2 25 07 91 00       	mov    %al,0x910725
  101688:	0f b6 05 25 07 91 00 	movzbl 0x910725,%eax
  10168f:	83 c8 80             	or     $0xffffff80,%eax
  101692:	a2 25 07 91 00       	mov    %al,0x910725
  101697:	b8 b2 22 10 00       	mov    $0x1022b2,%eax
  10169c:	c1 e8 10             	shr    $0x10,%eax
  10169f:	66 a3 26 07 91 00    	mov    %ax,0x910726
  1016a5:	b8 ba 22 10 00       	mov    $0x1022ba,%eax
  1016aa:	66 a3 28 07 91 00    	mov    %ax,0x910728
  1016b0:	66 c7 05 2a 07 91 00 	movw   $0x8,0x91072a
  1016b7:	08 00 
  1016b9:	0f b6 05 2c 07 91 00 	movzbl 0x91072c,%eax
  1016c0:	83 e0 e0             	and    $0xffffffe0,%eax
  1016c3:	a2 2c 07 91 00       	mov    %al,0x91072c
  1016c8:	0f b6 05 2c 07 91 00 	movzbl 0x91072c,%eax
  1016cf:	83 e0 1f             	and    $0x1f,%eax
  1016d2:	a2 2c 07 91 00       	mov    %al,0x91072c
  1016d7:	0f b6 05 2d 07 91 00 	movzbl 0x91072d,%eax
  1016de:	83 e0 f0             	and    $0xfffffff0,%eax
  1016e1:	83 c8 0e             	or     $0xe,%eax
  1016e4:	a2 2d 07 91 00       	mov    %al,0x91072d
  1016e9:	0f b6 05 2d 07 91 00 	movzbl 0x91072d,%eax
  1016f0:	83 e0 ef             	and    $0xffffffef,%eax
  1016f3:	a2 2d 07 91 00       	mov    %al,0x91072d
  1016f8:	0f b6 05 2d 07 91 00 	movzbl 0x91072d,%eax
  1016ff:	83 e0 9f             	and    $0xffffff9f,%eax
  101702:	a2 2d 07 91 00       	mov    %al,0x91072d
  101707:	0f b6 05 2d 07 91 00 	movzbl 0x91072d,%eax
  10170e:	83 c8 80             	or     $0xffffff80,%eax
  101711:	a2 2d 07 91 00       	mov    %al,0x91072d
  101716:	b8 ba 22 10 00       	mov    $0x1022ba,%eax
  10171b:	c1 e8 10             	shr    $0x10,%eax
  10171e:	66 a3 2e 07 91 00    	mov    %ax,0x91072e
  101724:	b8 c2 22 10 00       	mov    $0x1022c2,%eax
  101729:	66 a3 30 07 91 00    	mov    %ax,0x910730
  10172f:	66 c7 05 32 07 91 00 	movw   $0x8,0x910732
  101736:	08 00 
  101738:	0f b6 05 34 07 91 00 	movzbl 0x910734,%eax
  10173f:	83 e0 e0             	and    $0xffffffe0,%eax
  101742:	a2 34 07 91 00       	mov    %al,0x910734
  101747:	0f b6 05 34 07 91 00 	movzbl 0x910734,%eax
  10174e:	83 e0 1f             	and    $0x1f,%eax
  101751:	a2 34 07 91 00       	mov    %al,0x910734
  101756:	0f b6 05 35 07 91 00 	movzbl 0x910735,%eax
  10175d:	83 e0 f0             	and    $0xfffffff0,%eax
  101760:	83 c8 0e             	or     $0xe,%eax
  101763:	a2 35 07 91 00       	mov    %al,0x910735
  101768:	0f b6 05 35 07 91 00 	movzbl 0x910735,%eax
  10176f:	83 e0 ef             	and    $0xffffffef,%eax
  101772:	a2 35 07 91 00       	mov    %al,0x910735
  101777:	0f b6 05 35 07 91 00 	movzbl 0x910735,%eax
  10177e:	83 e0 9f             	and    $0xffffff9f,%eax
  101781:	a2 35 07 91 00       	mov    %al,0x910735
  101786:	0f b6 05 35 07 91 00 	movzbl 0x910735,%eax
  10178d:	83 c8 80             	or     $0xffffff80,%eax
  101790:	a2 35 07 91 00       	mov    %al,0x910735
  101795:	b8 c2 22 10 00       	mov    $0x1022c2,%eax
  10179a:	c1 e8 10             	shr    $0x10,%eax
  10179d:	66 a3 36 07 91 00    	mov    %ax,0x910736
  1017a3:	b8 d4 22 10 00       	mov    $0x1022d4,%eax
  1017a8:	66 a3 40 07 91 00    	mov    %ax,0x910740
  1017ae:	66 c7 05 42 07 91 00 	movw   $0x8,0x910742
  1017b5:	08 00 
  1017b7:	0f b6 05 44 07 91 00 	movzbl 0x910744,%eax
  1017be:	83 e0 e0             	and    $0xffffffe0,%eax
  1017c1:	a2 44 07 91 00       	mov    %al,0x910744
  1017c6:	0f b6 05 44 07 91 00 	movzbl 0x910744,%eax
  1017cd:	83 e0 1f             	and    $0x1f,%eax
  1017d0:	a2 44 07 91 00       	mov    %al,0x910744
  1017d5:	0f b6 05 45 07 91 00 	movzbl 0x910745,%eax
  1017dc:	83 e0 f0             	and    $0xfffffff0,%eax
  1017df:	83 c8 0e             	or     $0xe,%eax
  1017e2:	a2 45 07 91 00       	mov    %al,0x910745
  1017e7:	0f b6 05 45 07 91 00 	movzbl 0x910745,%eax
  1017ee:	83 e0 ef             	and    $0xffffffef,%eax
  1017f1:	a2 45 07 91 00       	mov    %al,0x910745
  1017f6:	0f b6 05 45 07 91 00 	movzbl 0x910745,%eax
  1017fd:	83 e0 9f             	and    $0xffffff9f,%eax
  101800:	a2 45 07 91 00       	mov    %al,0x910745
  101805:	0f b6 05 45 07 91 00 	movzbl 0x910745,%eax
  10180c:	83 c8 80             	or     $0xffffff80,%eax
  10180f:	a2 45 07 91 00       	mov    %al,0x910745
  101814:	b8 d4 22 10 00       	mov    $0x1022d4,%eax
  101819:	c1 e8 10             	shr    $0x10,%eax
  10181c:	66 a3 46 07 91 00    	mov    %ax,0x910746
  101822:	b8 de 22 10 00       	mov    $0x1022de,%eax
  101827:	66 a3 48 07 91 00    	mov    %ax,0x910748
  10182d:	66 c7 05 4a 07 91 00 	movw   $0x8,0x91074a
  101834:	08 00 
  101836:	0f b6 05 4c 07 91 00 	movzbl 0x91074c,%eax
  10183d:	83 e0 e0             	and    $0xffffffe0,%eax
  101840:	a2 4c 07 91 00       	mov    %al,0x91074c
  101845:	0f b6 05 4c 07 91 00 	movzbl 0x91074c,%eax
  10184c:	83 e0 1f             	and    $0x1f,%eax
  10184f:	a2 4c 07 91 00       	mov    %al,0x91074c
  101854:	0f b6 05 4d 07 91 00 	movzbl 0x91074d,%eax
  10185b:	83 e0 f0             	and    $0xfffffff0,%eax
  10185e:	83 c8 0e             	or     $0xe,%eax
  101861:	a2 4d 07 91 00       	mov    %al,0x91074d
  101866:	0f b6 05 4d 07 91 00 	movzbl 0x91074d,%eax
  10186d:	83 e0 ef             	and    $0xffffffef,%eax
  101870:	a2 4d 07 91 00       	mov    %al,0x91074d
  101875:	0f b6 05 4d 07 91 00 	movzbl 0x91074d,%eax
  10187c:	83 e0 9f             	and    $0xffffff9f,%eax
  10187f:	a2 4d 07 91 00       	mov    %al,0x91074d
  101884:	0f b6 05 4d 07 91 00 	movzbl 0x91074d,%eax
  10188b:	83 c8 80             	or     $0xffffff80,%eax
  10188e:	a2 4d 07 91 00       	mov    %al,0x91074d
  101893:	b8 de 22 10 00       	mov    $0x1022de,%eax
  101898:	c1 e8 10             	shr    $0x10,%eax
  10189b:	66 a3 4e 07 91 00    	mov    %ax,0x91074e
  1018a1:	b8 e6 22 10 00       	mov    $0x1022e6,%eax
  1018a6:	66 a3 50 07 91 00    	mov    %ax,0x910750
  1018ac:	66 c7 05 52 07 91 00 	movw   $0x8,0x910752
  1018b3:	08 00 
  1018b5:	0f b6 05 54 07 91 00 	movzbl 0x910754,%eax
  1018bc:	83 e0 e0             	and    $0xffffffe0,%eax
  1018bf:	a2 54 07 91 00       	mov    %al,0x910754
  1018c4:	0f b6 05 54 07 91 00 	movzbl 0x910754,%eax
  1018cb:	83 e0 1f             	and    $0x1f,%eax
  1018ce:	a2 54 07 91 00       	mov    %al,0x910754
  1018d3:	0f b6 05 55 07 91 00 	movzbl 0x910755,%eax
  1018da:	83 e0 f0             	and    $0xfffffff0,%eax
  1018dd:	83 c8 0e             	or     $0xe,%eax
  1018e0:	a2 55 07 91 00       	mov    %al,0x910755
  1018e5:	0f b6 05 55 07 91 00 	movzbl 0x910755,%eax
  1018ec:	83 e0 ef             	and    $0xffffffef,%eax
  1018ef:	a2 55 07 91 00       	mov    %al,0x910755
  1018f4:	0f b6 05 55 07 91 00 	movzbl 0x910755,%eax
  1018fb:	83 e0 9f             	and    $0xffffff9f,%eax
  1018fe:	a2 55 07 91 00       	mov    %al,0x910755
  101903:	0f b6 05 55 07 91 00 	movzbl 0x910755,%eax
  10190a:	83 c8 80             	or     $0xffffff80,%eax
  10190d:	a2 55 07 91 00       	mov    %al,0x910755
  101912:	b8 e6 22 10 00       	mov    $0x1022e6,%eax
  101917:	c1 e8 10             	shr    $0x10,%eax
  10191a:	66 a3 56 07 91 00    	mov    %ax,0x910756
  101920:	b8 f0 22 10 00       	mov    $0x1022f0,%eax
  101925:	66 a3 c0 07 91 00    	mov    %ax,0x9107c0
  10192b:	66 c7 05 c2 07 91 00 	movw   $0x8,0x9107c2
  101932:	08 00 
  101934:	0f b6 05 c4 07 91 00 	movzbl 0x9107c4,%eax
  10193b:	83 e0 e0             	and    $0xffffffe0,%eax
  10193e:	a2 c4 07 91 00       	mov    %al,0x9107c4
  101943:	0f b6 05 c4 07 91 00 	movzbl 0x9107c4,%eax
  10194a:	83 e0 1f             	and    $0x1f,%eax
  10194d:	a2 c4 07 91 00       	mov    %al,0x9107c4
  101952:	0f b6 05 c5 07 91 00 	movzbl 0x9107c5,%eax
  101959:	83 e0 f0             	and    $0xfffffff0,%eax
  10195c:	83 c8 0e             	or     $0xe,%eax
  10195f:	a2 c5 07 91 00       	mov    %al,0x9107c5
  101964:	0f b6 05 c5 07 91 00 	movzbl 0x9107c5,%eax
  10196b:	83 e0 ef             	and    $0xffffffef,%eax
  10196e:	a2 c5 07 91 00       	mov    %al,0x9107c5
  101973:	0f b6 05 c5 07 91 00 	movzbl 0x9107c5,%eax
  10197a:	83 e0 9f             	and    $0xffffff9f,%eax
  10197d:	a2 c5 07 91 00       	mov    %al,0x9107c5
  101982:	0f b6 05 c5 07 91 00 	movzbl 0x9107c5,%eax
  101989:	83 c8 80             	or     $0xffffff80,%eax
  10198c:	a2 c5 07 91 00       	mov    %al,0x9107c5
  101991:	b8 f0 22 10 00       	mov    $0x1022f0,%eax
  101996:	c1 e8 10             	shr    $0x10,%eax
  101999:	66 a3 c6 07 91 00    	mov    %ax,0x9107c6
  10199f:	b8 fa 22 10 00       	mov    $0x1022fa,%eax
  1019a4:	66 a3 c8 07 91 00    	mov    %ax,0x9107c8
  1019aa:	66 c7 05 ca 07 91 00 	movw   $0x8,0x9107ca
  1019b1:	08 00 
  1019b3:	0f b6 05 cc 07 91 00 	movzbl 0x9107cc,%eax
  1019ba:	83 e0 e0             	and    $0xffffffe0,%eax
  1019bd:	a2 cc 07 91 00       	mov    %al,0x9107cc
  1019c2:	0f b6 05 cc 07 91 00 	movzbl 0x9107cc,%eax
  1019c9:	83 e0 1f             	and    $0x1f,%eax
  1019cc:	a2 cc 07 91 00       	mov    %al,0x9107cc
  1019d1:	0f b6 05 cd 07 91 00 	movzbl 0x9107cd,%eax
  1019d8:	83 e0 f0             	and    $0xfffffff0,%eax
  1019db:	83 c8 0e             	or     $0xe,%eax
  1019de:	a2 cd 07 91 00       	mov    %al,0x9107cd
  1019e3:	0f b6 05 cd 07 91 00 	movzbl 0x9107cd,%eax
  1019ea:	83 e0 ef             	and    $0xffffffef,%eax
  1019ed:	a2 cd 07 91 00       	mov    %al,0x9107cd
  1019f2:	0f b6 05 cd 07 91 00 	movzbl 0x9107cd,%eax
  1019f9:	83 e0 9f             	and    $0xffffff9f,%eax
  1019fc:	a2 cd 07 91 00       	mov    %al,0x9107cd
  101a01:	0f b6 05 cd 07 91 00 	movzbl 0x9107cd,%eax
  101a08:	83 c8 80             	or     $0xffffff80,%eax
  101a0b:	a2 cd 07 91 00       	mov    %al,0x9107cd
  101a10:	b8 fa 22 10 00       	mov    $0x1022fa,%eax
  101a15:	c1 e8 10             	shr    $0x10,%eax
  101a18:	66 a3 ce 07 91 00    	mov    %ax,0x9107ce
  101a1e:	b8 04 23 10 00       	mov    $0x102304,%eax
  101a23:	66 a3 d0 07 91 00    	mov    %ax,0x9107d0
  101a29:	66 c7 05 d2 07 91 00 	movw   $0x8,0x9107d2
  101a30:	08 00 
  101a32:	0f b6 05 d4 07 91 00 	movzbl 0x9107d4,%eax
  101a39:	83 e0 e0             	and    $0xffffffe0,%eax
  101a3c:	a2 d4 07 91 00       	mov    %al,0x9107d4
  101a41:	0f b6 05 d4 07 91 00 	movzbl 0x9107d4,%eax
  101a48:	83 e0 1f             	and    $0x1f,%eax
  101a4b:	a2 d4 07 91 00       	mov    %al,0x9107d4
  101a50:	0f b6 05 d5 07 91 00 	movzbl 0x9107d5,%eax
  101a57:	83 e0 f0             	and    $0xfffffff0,%eax
  101a5a:	83 c8 0e             	or     $0xe,%eax
  101a5d:	a2 d5 07 91 00       	mov    %al,0x9107d5
  101a62:	0f b6 05 d5 07 91 00 	movzbl 0x9107d5,%eax
  101a69:	83 e0 ef             	and    $0xffffffef,%eax
  101a6c:	a2 d5 07 91 00       	mov    %al,0x9107d5
  101a71:	0f b6 05 d5 07 91 00 	movzbl 0x9107d5,%eax
  101a78:	83 e0 9f             	and    $0xffffff9f,%eax
  101a7b:	a2 d5 07 91 00       	mov    %al,0x9107d5
  101a80:	0f b6 05 d5 07 91 00 	movzbl 0x9107d5,%eax
  101a87:	83 c8 80             	or     $0xffffff80,%eax
  101a8a:	a2 d5 07 91 00       	mov    %al,0x9107d5
  101a8f:	b8 04 23 10 00       	mov    $0x102304,%eax
  101a94:	c1 e8 10             	shr    $0x10,%eax
  101a97:	66 a3 d6 07 91 00    	mov    %ax,0x9107d6
  101a9d:	b8 0e 23 10 00       	mov    $0x10230e,%eax
  101aa2:	66 a3 d8 07 91 00    	mov    %ax,0x9107d8
  101aa8:	66 c7 05 da 07 91 00 	movw   $0x8,0x9107da
  101aaf:	08 00 
  101ab1:	0f b6 05 dc 07 91 00 	movzbl 0x9107dc,%eax
  101ab8:	83 e0 e0             	and    $0xffffffe0,%eax
  101abb:	a2 dc 07 91 00       	mov    %al,0x9107dc
  101ac0:	0f b6 05 dc 07 91 00 	movzbl 0x9107dc,%eax
  101ac7:	83 e0 1f             	and    $0x1f,%eax
  101aca:	a2 dc 07 91 00       	mov    %al,0x9107dc
  101acf:	0f b6 05 dd 07 91 00 	movzbl 0x9107dd,%eax
  101ad6:	83 e0 f0             	and    $0xfffffff0,%eax
  101ad9:	83 c8 0e             	or     $0xe,%eax
  101adc:	a2 dd 07 91 00       	mov    %al,0x9107dd
  101ae1:	0f b6 05 dd 07 91 00 	movzbl 0x9107dd,%eax
  101ae8:	83 e0 ef             	and    $0xffffffef,%eax
  101aeb:	a2 dd 07 91 00       	mov    %al,0x9107dd
  101af0:	0f b6 05 dd 07 91 00 	movzbl 0x9107dd,%eax
  101af7:	83 e0 9f             	and    $0xffffff9f,%eax
  101afa:	a2 dd 07 91 00       	mov    %al,0x9107dd
  101aff:	0f b6 05 dd 07 91 00 	movzbl 0x9107dd,%eax
  101b06:	83 c8 80             	or     $0xffffff80,%eax
  101b09:	a2 dd 07 91 00       	mov    %al,0x9107dd
  101b0e:	b8 0e 23 10 00       	mov    $0x10230e,%eax
  101b13:	c1 e8 10             	shr    $0x10,%eax
  101b16:	66 a3 de 07 91 00    	mov    %ax,0x9107de
  101b1c:	b8 18 23 10 00       	mov    $0x102318,%eax
  101b21:	66 a3 e0 07 91 00    	mov    %ax,0x9107e0
  101b27:	66 c7 05 e2 07 91 00 	movw   $0x8,0x9107e2
  101b2e:	08 00 
  101b30:	0f b6 05 e4 07 91 00 	movzbl 0x9107e4,%eax
  101b37:	83 e0 e0             	and    $0xffffffe0,%eax
  101b3a:	a2 e4 07 91 00       	mov    %al,0x9107e4
  101b3f:	0f b6 05 e4 07 91 00 	movzbl 0x9107e4,%eax
  101b46:	83 e0 1f             	and    $0x1f,%eax
  101b49:	a2 e4 07 91 00       	mov    %al,0x9107e4
  101b4e:	0f b6 05 e5 07 91 00 	movzbl 0x9107e5,%eax
  101b55:	83 e0 f0             	and    $0xfffffff0,%eax
  101b58:	83 c8 0e             	or     $0xe,%eax
  101b5b:	a2 e5 07 91 00       	mov    %al,0x9107e5
  101b60:	0f b6 05 e5 07 91 00 	movzbl 0x9107e5,%eax
  101b67:	83 e0 ef             	and    $0xffffffef,%eax
  101b6a:	a2 e5 07 91 00       	mov    %al,0x9107e5
  101b6f:	0f b6 05 e5 07 91 00 	movzbl 0x9107e5,%eax
  101b76:	83 e0 9f             	and    $0xffffff9f,%eax
  101b79:	a2 e5 07 91 00       	mov    %al,0x9107e5
  101b7e:	0f b6 05 e5 07 91 00 	movzbl 0x9107e5,%eax
  101b85:	83 c8 80             	or     $0xffffff80,%eax
  101b88:	a2 e5 07 91 00       	mov    %al,0x9107e5
  101b8d:	b8 18 23 10 00       	mov    $0x102318,%eax
  101b92:	c1 e8 10             	shr    $0x10,%eax
  101b95:	66 a3 e6 07 91 00    	mov    %ax,0x9107e6
  101b9b:	b8 22 23 10 00       	mov    $0x102322,%eax
  101ba0:	66 a3 e8 07 91 00    	mov    %ax,0x9107e8
  101ba6:	66 c7 05 ea 07 91 00 	movw   $0x8,0x9107ea
  101bad:	08 00 
  101baf:	0f b6 05 ec 07 91 00 	movzbl 0x9107ec,%eax
  101bb6:	83 e0 e0             	and    $0xffffffe0,%eax
  101bb9:	a2 ec 07 91 00       	mov    %al,0x9107ec
  101bbe:	0f b6 05 ec 07 91 00 	movzbl 0x9107ec,%eax
  101bc5:	83 e0 1f             	and    $0x1f,%eax
  101bc8:	a2 ec 07 91 00       	mov    %al,0x9107ec
  101bcd:	0f b6 05 ed 07 91 00 	movzbl 0x9107ed,%eax
  101bd4:	83 e0 f0             	and    $0xfffffff0,%eax
  101bd7:	83 c8 0e             	or     $0xe,%eax
  101bda:	a2 ed 07 91 00       	mov    %al,0x9107ed
  101bdf:	0f b6 05 ed 07 91 00 	movzbl 0x9107ed,%eax
  101be6:	83 e0 ef             	and    $0xffffffef,%eax
  101be9:	a2 ed 07 91 00       	mov    %al,0x9107ed
  101bee:	0f b6 05 ed 07 91 00 	movzbl 0x9107ed,%eax
  101bf5:	83 e0 9f             	and    $0xffffff9f,%eax
  101bf8:	a2 ed 07 91 00       	mov    %al,0x9107ed
  101bfd:	0f b6 05 ed 07 91 00 	movzbl 0x9107ed,%eax
  101c04:	83 c8 80             	or     $0xffffff80,%eax
  101c07:	a2 ed 07 91 00       	mov    %al,0x9107ed
  101c0c:	b8 22 23 10 00       	mov    $0x102322,%eax
  101c11:	c1 e8 10             	shr    $0x10,%eax
  101c14:	66 a3 ee 07 91 00    	mov    %ax,0x9107ee
  101c1a:	b8 2c 23 10 00       	mov    $0x10232c,%eax
  101c1f:	66 a3 f0 07 91 00    	mov    %ax,0x9107f0
  101c25:	66 c7 05 f2 07 91 00 	movw   $0x8,0x9107f2
  101c2c:	08 00 
  101c2e:	0f b6 05 f4 07 91 00 	movzbl 0x9107f4,%eax
  101c35:	83 e0 e0             	and    $0xffffffe0,%eax
  101c38:	a2 f4 07 91 00       	mov    %al,0x9107f4
  101c3d:	0f b6 05 f4 07 91 00 	movzbl 0x9107f4,%eax
  101c44:	83 e0 1f             	and    $0x1f,%eax
  101c47:	a2 f4 07 91 00       	mov    %al,0x9107f4
  101c4c:	0f b6 05 f5 07 91 00 	movzbl 0x9107f5,%eax
  101c53:	83 e0 f0             	and    $0xfffffff0,%eax
  101c56:	83 c8 0e             	or     $0xe,%eax
  101c59:	a2 f5 07 91 00       	mov    %al,0x9107f5
  101c5e:	0f b6 05 f5 07 91 00 	movzbl 0x9107f5,%eax
  101c65:	83 e0 ef             	and    $0xffffffef,%eax
  101c68:	a2 f5 07 91 00       	mov    %al,0x9107f5
  101c6d:	0f b6 05 f5 07 91 00 	movzbl 0x9107f5,%eax
  101c74:	83 e0 9f             	and    $0xffffff9f,%eax
  101c77:	a2 f5 07 91 00       	mov    %al,0x9107f5
  101c7c:	0f b6 05 f5 07 91 00 	movzbl 0x9107f5,%eax
  101c83:	83 c8 80             	or     $0xffffff80,%eax
  101c86:	a2 f5 07 91 00       	mov    %al,0x9107f5
  101c8b:	b8 2c 23 10 00       	mov    $0x10232c,%eax
  101c90:	c1 e8 10             	shr    $0x10,%eax
  101c93:	66 a3 f6 07 91 00    	mov    %ax,0x9107f6
  101c99:	b8 32 23 10 00       	mov    $0x102332,%eax
  101c9e:	66 a3 f8 07 91 00    	mov    %ax,0x9107f8
  101ca4:	66 c7 05 fa 07 91 00 	movw   $0x8,0x9107fa
  101cab:	08 00 
  101cad:	0f b6 05 fc 07 91 00 	movzbl 0x9107fc,%eax
  101cb4:	83 e0 e0             	and    $0xffffffe0,%eax
  101cb7:	a2 fc 07 91 00       	mov    %al,0x9107fc
  101cbc:	0f b6 05 fc 07 91 00 	movzbl 0x9107fc,%eax
  101cc3:	83 e0 1f             	and    $0x1f,%eax
  101cc6:	a2 fc 07 91 00       	mov    %al,0x9107fc
  101ccb:	0f b6 05 fd 07 91 00 	movzbl 0x9107fd,%eax
  101cd2:	83 e0 f0             	and    $0xfffffff0,%eax
  101cd5:	83 c8 0e             	or     $0xe,%eax
  101cd8:	a2 fd 07 91 00       	mov    %al,0x9107fd
  101cdd:	0f b6 05 fd 07 91 00 	movzbl 0x9107fd,%eax
  101ce4:	83 e0 ef             	and    $0xffffffef,%eax
  101ce7:	a2 fd 07 91 00       	mov    %al,0x9107fd
  101cec:	0f b6 05 fd 07 91 00 	movzbl 0x9107fd,%eax
  101cf3:	83 e0 9f             	and    $0xffffff9f,%eax
  101cf6:	a2 fd 07 91 00       	mov    %al,0x9107fd
  101cfb:	0f b6 05 fd 07 91 00 	movzbl 0x9107fd,%eax
  101d02:	83 c8 80             	or     $0xffffff80,%eax
  101d05:	a2 fd 07 91 00       	mov    %al,0x9107fd
  101d0a:	b8 32 23 10 00       	mov    $0x102332,%eax
  101d0f:	c1 e8 10             	shr    $0x10,%eax
  101d12:	66 a3 fe 07 91 00    	mov    %ax,0x9107fe
  101d18:	b8 38 23 10 00       	mov    $0x102338,%eax
  101d1d:	66 a3 00 08 91 00    	mov    %ax,0x910800
  101d23:	66 c7 05 02 08 91 00 	movw   $0x8,0x910802
  101d2a:	08 00 
  101d2c:	0f b6 05 04 08 91 00 	movzbl 0x910804,%eax
  101d33:	83 e0 e0             	and    $0xffffffe0,%eax
  101d36:	a2 04 08 91 00       	mov    %al,0x910804
  101d3b:	0f b6 05 04 08 91 00 	movzbl 0x910804,%eax
  101d42:	83 e0 1f             	and    $0x1f,%eax
  101d45:	a2 04 08 91 00       	mov    %al,0x910804
  101d4a:	0f b6 05 05 08 91 00 	movzbl 0x910805,%eax
  101d51:	83 e0 f0             	and    $0xfffffff0,%eax
  101d54:	83 c8 0e             	or     $0xe,%eax
  101d57:	a2 05 08 91 00       	mov    %al,0x910805
  101d5c:	0f b6 05 05 08 91 00 	movzbl 0x910805,%eax
  101d63:	83 e0 ef             	and    $0xffffffef,%eax
  101d66:	a2 05 08 91 00       	mov    %al,0x910805
  101d6b:	0f b6 05 05 08 91 00 	movzbl 0x910805,%eax
  101d72:	83 e0 9f             	and    $0xffffff9f,%eax
  101d75:	a2 05 08 91 00       	mov    %al,0x910805
  101d7a:	0f b6 05 05 08 91 00 	movzbl 0x910805,%eax
  101d81:	83 c8 80             	or     $0xffffff80,%eax
  101d84:	a2 05 08 91 00       	mov    %al,0x910805
  101d89:	b8 38 23 10 00       	mov    $0x102338,%eax
  101d8e:	c1 e8 10             	shr    $0x10,%eax
  101d91:	66 a3 06 08 91 00    	mov    %ax,0x910806
  101d97:	b8 3e 23 10 00       	mov    $0x10233e,%eax
  101d9c:	66 a3 08 08 91 00    	mov    %ax,0x910808
  101da2:	66 c7 05 0a 08 91 00 	movw   $0x8,0x91080a
  101da9:	08 00 
  101dab:	0f b6 05 0c 08 91 00 	movzbl 0x91080c,%eax
  101db2:	83 e0 e0             	and    $0xffffffe0,%eax
  101db5:	a2 0c 08 91 00       	mov    %al,0x91080c
  101dba:	0f b6 05 0c 08 91 00 	movzbl 0x91080c,%eax
  101dc1:	83 e0 1f             	and    $0x1f,%eax
  101dc4:	a2 0c 08 91 00       	mov    %al,0x91080c
  101dc9:	0f b6 05 0d 08 91 00 	movzbl 0x91080d,%eax
  101dd0:	83 e0 f0             	and    $0xfffffff0,%eax
  101dd3:	83 c8 0e             	or     $0xe,%eax
  101dd6:	a2 0d 08 91 00       	mov    %al,0x91080d
  101ddb:	0f b6 05 0d 08 91 00 	movzbl 0x91080d,%eax
  101de2:	83 e0 ef             	and    $0xffffffef,%eax
  101de5:	a2 0d 08 91 00       	mov    %al,0x91080d
  101dea:	0f b6 05 0d 08 91 00 	movzbl 0x91080d,%eax
  101df1:	83 e0 9f             	and    $0xffffff9f,%eax
  101df4:	a2 0d 08 91 00       	mov    %al,0x91080d
  101df9:	0f b6 05 0d 08 91 00 	movzbl 0x91080d,%eax
  101e00:	83 c8 80             	or     $0xffffff80,%eax
  101e03:	a2 0d 08 91 00       	mov    %al,0x91080d
  101e08:	b8 3e 23 10 00       	mov    $0x10233e,%eax
  101e0d:	c1 e8 10             	shr    $0x10,%eax
  101e10:	66 a3 0e 08 91 00    	mov    %ax,0x91080e
  101e16:	b8 44 23 10 00       	mov    $0x102344,%eax
  101e1b:	66 a3 10 08 91 00    	mov    %ax,0x910810
  101e21:	66 c7 05 12 08 91 00 	movw   $0x8,0x910812
  101e28:	08 00 
  101e2a:	0f b6 05 14 08 91 00 	movzbl 0x910814,%eax
  101e31:	83 e0 e0             	and    $0xffffffe0,%eax
  101e34:	a2 14 08 91 00       	mov    %al,0x910814
  101e39:	0f b6 05 14 08 91 00 	movzbl 0x910814,%eax
  101e40:	83 e0 1f             	and    $0x1f,%eax
  101e43:	a2 14 08 91 00       	mov    %al,0x910814
  101e48:	0f b6 05 15 08 91 00 	movzbl 0x910815,%eax
  101e4f:	83 e0 f0             	and    $0xfffffff0,%eax
  101e52:	83 c8 0e             	or     $0xe,%eax
  101e55:	a2 15 08 91 00       	mov    %al,0x910815
  101e5a:	0f b6 05 15 08 91 00 	movzbl 0x910815,%eax
  101e61:	83 e0 ef             	and    $0xffffffef,%eax
  101e64:	a2 15 08 91 00       	mov    %al,0x910815
  101e69:	0f b6 05 15 08 91 00 	movzbl 0x910815,%eax
  101e70:	83 e0 9f             	and    $0xffffff9f,%eax
  101e73:	a2 15 08 91 00       	mov    %al,0x910815
  101e78:	0f b6 05 15 08 91 00 	movzbl 0x910815,%eax
  101e7f:	83 c8 80             	or     $0xffffff80,%eax
  101e82:	a2 15 08 91 00       	mov    %al,0x910815
  101e87:	b8 44 23 10 00       	mov    $0x102344,%eax
  101e8c:	c1 e8 10             	shr    $0x10,%eax
  101e8f:	66 a3 16 08 91 00    	mov    %ax,0x910816
  101e95:	b8 4a 23 10 00       	mov    $0x10234a,%eax
  101e9a:	66 a3 18 08 91 00    	mov    %ax,0x910818
  101ea0:	66 c7 05 1a 08 91 00 	movw   $0x8,0x91081a
  101ea7:	08 00 
  101ea9:	0f b6 05 1c 08 91 00 	movzbl 0x91081c,%eax
  101eb0:	83 e0 e0             	and    $0xffffffe0,%eax
  101eb3:	a2 1c 08 91 00       	mov    %al,0x91081c
  101eb8:	0f b6 05 1c 08 91 00 	movzbl 0x91081c,%eax
  101ebf:	83 e0 1f             	and    $0x1f,%eax
  101ec2:	a2 1c 08 91 00       	mov    %al,0x91081c
  101ec7:	0f b6 05 1d 08 91 00 	movzbl 0x91081d,%eax
  101ece:	83 e0 f0             	and    $0xfffffff0,%eax
  101ed1:	83 c8 0e             	or     $0xe,%eax
  101ed4:	a2 1d 08 91 00       	mov    %al,0x91081d
  101ed9:	0f b6 05 1d 08 91 00 	movzbl 0x91081d,%eax
  101ee0:	83 e0 ef             	and    $0xffffffef,%eax
  101ee3:	a2 1d 08 91 00       	mov    %al,0x91081d
  101ee8:	0f b6 05 1d 08 91 00 	movzbl 0x91081d,%eax
  101eef:	83 e0 9f             	and    $0xffffff9f,%eax
  101ef2:	a2 1d 08 91 00       	mov    %al,0x91081d
  101ef7:	0f b6 05 1d 08 91 00 	movzbl 0x91081d,%eax
  101efe:	83 c8 80             	or     $0xffffff80,%eax
  101f01:	a2 1d 08 91 00       	mov    %al,0x91081d
  101f06:	b8 4a 23 10 00       	mov    $0x10234a,%eax
  101f0b:	c1 e8 10             	shr    $0x10,%eax
  101f0e:	66 a3 1e 08 91 00    	mov    %ax,0x91081e
  101f14:	b8 50 23 10 00       	mov    $0x102350,%eax
  101f19:	66 a3 20 08 91 00    	mov    %ax,0x910820
  101f1f:	66 c7 05 22 08 91 00 	movw   $0x8,0x910822
  101f26:	08 00 
  101f28:	0f b6 05 24 08 91 00 	movzbl 0x910824,%eax
  101f2f:	83 e0 e0             	and    $0xffffffe0,%eax
  101f32:	a2 24 08 91 00       	mov    %al,0x910824
  101f37:	0f b6 05 24 08 91 00 	movzbl 0x910824,%eax
  101f3e:	83 e0 1f             	and    $0x1f,%eax
  101f41:	a2 24 08 91 00       	mov    %al,0x910824
  101f46:	0f b6 05 25 08 91 00 	movzbl 0x910825,%eax
  101f4d:	83 e0 f0             	and    $0xfffffff0,%eax
  101f50:	83 c8 0e             	or     $0xe,%eax
  101f53:	a2 25 08 91 00       	mov    %al,0x910825
  101f58:	0f b6 05 25 08 91 00 	movzbl 0x910825,%eax
  101f5f:	83 e0 ef             	and    $0xffffffef,%eax
  101f62:	a2 25 08 91 00       	mov    %al,0x910825
  101f67:	0f b6 05 25 08 91 00 	movzbl 0x910825,%eax
  101f6e:	83 e0 9f             	and    $0xffffff9f,%eax
  101f71:	a2 25 08 91 00       	mov    %al,0x910825
  101f76:	0f b6 05 25 08 91 00 	movzbl 0x910825,%eax
  101f7d:	83 c8 80             	or     $0xffffff80,%eax
  101f80:	a2 25 08 91 00       	mov    %al,0x910825
  101f85:	b8 50 23 10 00       	mov    $0x102350,%eax
  101f8a:	c1 e8 10             	shr    $0x10,%eax
  101f8d:	66 a3 26 08 91 00    	mov    %ax,0x910826
  101f93:	b8 56 23 10 00       	mov    $0x102356,%eax
  101f98:	66 a3 28 08 91 00    	mov    %ax,0x910828
  101f9e:	66 c7 05 2a 08 91 00 	movw   $0x8,0x91082a
  101fa5:	08 00 
  101fa7:	0f b6 05 2c 08 91 00 	movzbl 0x91082c,%eax
  101fae:	83 e0 e0             	and    $0xffffffe0,%eax
  101fb1:	a2 2c 08 91 00       	mov    %al,0x91082c
  101fb6:	0f b6 05 2c 08 91 00 	movzbl 0x91082c,%eax
  101fbd:	83 e0 1f             	and    $0x1f,%eax
  101fc0:	a2 2c 08 91 00       	mov    %al,0x91082c
  101fc5:	0f b6 05 2d 08 91 00 	movzbl 0x91082d,%eax
  101fcc:	83 e0 f0             	and    $0xfffffff0,%eax
  101fcf:	83 c8 0e             	or     $0xe,%eax
  101fd2:	a2 2d 08 91 00       	mov    %al,0x91082d
  101fd7:	0f b6 05 2d 08 91 00 	movzbl 0x91082d,%eax
  101fde:	83 e0 ef             	and    $0xffffffef,%eax
  101fe1:	a2 2d 08 91 00       	mov    %al,0x91082d
  101fe6:	0f b6 05 2d 08 91 00 	movzbl 0x91082d,%eax
  101fed:	83 e0 9f             	and    $0xffffff9f,%eax
  101ff0:	a2 2d 08 91 00       	mov    %al,0x91082d
  101ff5:	0f b6 05 2d 08 91 00 	movzbl 0x91082d,%eax
  101ffc:	83 c8 80             	or     $0xffffff80,%eax
  101fff:	a2 2d 08 91 00       	mov    %al,0x91082d
  102004:	b8 56 23 10 00       	mov    $0x102356,%eax
  102009:	c1 e8 10             	shr    $0x10,%eax
  10200c:	66 a3 2e 08 91 00    	mov    %ax,0x91082e
  102012:	b8 5c 23 10 00       	mov    $0x10235c,%eax
  102017:	66 a3 30 08 91 00    	mov    %ax,0x910830
  10201d:	66 c7 05 32 08 91 00 	movw   $0x8,0x910832
  102024:	08 00 
  102026:	0f b6 05 34 08 91 00 	movzbl 0x910834,%eax
  10202d:	83 e0 e0             	and    $0xffffffe0,%eax
  102030:	a2 34 08 91 00       	mov    %al,0x910834
  102035:	0f b6 05 34 08 91 00 	movzbl 0x910834,%eax
  10203c:	83 e0 1f             	and    $0x1f,%eax
  10203f:	a2 34 08 91 00       	mov    %al,0x910834
  102044:	0f b6 05 35 08 91 00 	movzbl 0x910835,%eax
  10204b:	83 e0 f0             	and    $0xfffffff0,%eax
  10204e:	83 c8 0e             	or     $0xe,%eax
  102051:	a2 35 08 91 00       	mov    %al,0x910835
  102056:	0f b6 05 35 08 91 00 	movzbl 0x910835,%eax
  10205d:	83 e0 ef             	and    $0xffffffef,%eax
  102060:	a2 35 08 91 00       	mov    %al,0x910835
  102065:	0f b6 05 35 08 91 00 	movzbl 0x910835,%eax
  10206c:	83 e0 9f             	and    $0xffffff9f,%eax
  10206f:	a2 35 08 91 00       	mov    %al,0x910835
  102074:	0f b6 05 35 08 91 00 	movzbl 0x910835,%eax
  10207b:	83 c8 80             	or     $0xffffff80,%eax
  10207e:	a2 35 08 91 00       	mov    %al,0x910835
  102083:	b8 5c 23 10 00       	mov    $0x10235c,%eax
  102088:	c1 e8 10             	shr    $0x10,%eax
  10208b:	66 a3 36 08 91 00    	mov    %ax,0x910836
  102091:	b8 62 23 10 00       	mov    $0x102362,%eax
  102096:	66 a3 38 08 91 00    	mov    %ax,0x910838
  10209c:	66 c7 05 3a 08 91 00 	movw   $0x8,0x91083a
  1020a3:	08 00 
  1020a5:	0f b6 05 3c 08 91 00 	movzbl 0x91083c,%eax
  1020ac:	83 e0 e0             	and    $0xffffffe0,%eax
  1020af:	a2 3c 08 91 00       	mov    %al,0x91083c
  1020b4:	0f b6 05 3c 08 91 00 	movzbl 0x91083c,%eax
  1020bb:	83 e0 1f             	and    $0x1f,%eax
  1020be:	a2 3c 08 91 00       	mov    %al,0x91083c
  1020c3:	0f b6 05 3d 08 91 00 	movzbl 0x91083d,%eax
  1020ca:	83 e0 f0             	and    $0xfffffff0,%eax
  1020cd:	83 c8 0e             	or     $0xe,%eax
  1020d0:	a2 3d 08 91 00       	mov    %al,0x91083d
  1020d5:	0f b6 05 3d 08 91 00 	movzbl 0x91083d,%eax
  1020dc:	83 e0 ef             	and    $0xffffffef,%eax
  1020df:	a2 3d 08 91 00       	mov    %al,0x91083d
  1020e4:	0f b6 05 3d 08 91 00 	movzbl 0x91083d,%eax
  1020eb:	83 e0 9f             	and    $0xffffff9f,%eax
  1020ee:	a2 3d 08 91 00       	mov    %al,0x91083d
  1020f3:	0f b6 05 3d 08 91 00 	movzbl 0x91083d,%eax
  1020fa:	83 c8 80             	or     $0xffffff80,%eax
  1020fd:	a2 3d 08 91 00       	mov    %al,0x91083d
  102102:	b8 62 23 10 00       	mov    $0x102362,%eax
  102107:	c1 e8 10             	shr    $0x10,%eax
  10210a:	66 a3 3e 08 91 00    	mov    %ax,0x91083e
  102110:	b8 98 23 10 00       	mov    $0x102398,%eax
  102115:	66 a3 40 08 91 00    	mov    %ax,0x910840
  10211b:	66 c7 05 42 08 91 00 	movw   $0x8,0x910842
  102122:	08 00 
  102124:	0f b6 05 44 08 91 00 	movzbl 0x910844,%eax
  10212b:	83 e0 e0             	and    $0xffffffe0,%eax
  10212e:	a2 44 08 91 00       	mov    %al,0x910844
  102133:	0f b6 05 44 08 91 00 	movzbl 0x910844,%eax
  10213a:	83 e0 1f             	and    $0x1f,%eax
  10213d:	a2 44 08 91 00       	mov    %al,0x910844
  102142:	0f b6 05 45 08 91 00 	movzbl 0x910845,%eax
  102149:	83 e0 f0             	and    $0xfffffff0,%eax
  10214c:	83 c8 0e             	or     $0xe,%eax
  10214f:	a2 45 08 91 00       	mov    %al,0x910845
  102154:	0f b6 05 45 08 91 00 	movzbl 0x910845,%eax
  10215b:	83 e0 ef             	and    $0xffffffef,%eax
  10215e:	a2 45 08 91 00       	mov    %al,0x910845
  102163:	0f b6 05 45 08 91 00 	movzbl 0x910845,%eax
  10216a:	83 c8 60             	or     $0x60,%eax
  10216d:	a2 45 08 91 00       	mov    %al,0x910845
  102172:	0f b6 05 45 08 91 00 	movzbl 0x910845,%eax
  102179:	83 c8 80             	or     $0xffffff80,%eax
  10217c:	a2 45 08 91 00       	mov    %al,0x910845
  102181:	b8 98 23 10 00       	mov    $0x102398,%eax
  102186:	c1 e8 10             	shr    $0x10,%eax
  102189:	66 a3 46 08 91 00    	mov    %ax,0x910846
  10218f:	b8 9e 23 10 00       	mov    $0x10239e,%eax
  102194:	66 a3 b0 0e 91 00    	mov    %ax,0x910eb0
  10219a:	66 c7 05 b2 0e 91 00 	movw   $0x8,0x910eb2
  1021a1:	08 00 
  1021a3:	0f b6 05 b4 0e 91 00 	movzbl 0x910eb4,%eax
  1021aa:	83 e0 e0             	and    $0xffffffe0,%eax
  1021ad:	a2 b4 0e 91 00       	mov    %al,0x910eb4
  1021b2:	0f b6 05 b4 0e 91 00 	movzbl 0x910eb4,%eax
  1021b9:	83 e0 1f             	and    $0x1f,%eax
  1021bc:	a2 b4 0e 91 00       	mov    %al,0x910eb4
  1021c1:	0f b6 05 b5 0e 91 00 	movzbl 0x910eb5,%eax
  1021c8:	83 e0 f0             	and    $0xfffffff0,%eax
  1021cb:	83 c8 0e             	or     $0xe,%eax
  1021ce:	a2 b5 0e 91 00       	mov    %al,0x910eb5
  1021d3:	0f b6 05 b5 0e 91 00 	movzbl 0x910eb5,%eax
  1021da:	83 e0 ef             	and    $0xffffffef,%eax
  1021dd:	a2 b5 0e 91 00       	mov    %al,0x910eb5
  1021e2:	0f b6 05 b5 0e 91 00 	movzbl 0x910eb5,%eax
  1021e9:	83 e0 9f             	and    $0xffffff9f,%eax
  1021ec:	a2 b5 0e 91 00       	mov    %al,0x910eb5
  1021f1:	0f b6 05 b5 0e 91 00 	movzbl 0x910eb5,%eax
  1021f8:	83 c8 80             	or     $0xffffff80,%eax
  1021fb:	a2 b5 0e 91 00       	mov    %al,0x910eb5
  102200:	b8 9e 23 10 00       	mov    $0x10239e,%eax
  102205:	c1 e8 10             	shr    $0x10,%eax
  102208:	66 a3 b6 0e 91 00    	mov    %ax,0x910eb6
  10220e:	0f 01 1d 10 a5 10 00 	lidtl  0x10a510
  102215:	90                   	nop
  102216:	c9                   	leave  
  102217:	c3                   	ret    

00102218 <intr_init>:
  102218:	55                   	push   %ebp
  102219:	89 e5                	mov    %esp,%ebp
  10221b:	0f b6 05 44 fe 10 00 	movzbl 0x10fe44,%eax
  102222:	3c 01                	cmp    $0x1,%al
  102224:	74 0e                	je     102234 <intr_init+0x1c>
  102226:	e8 ad ed ff ff       	call   100fd8 <intr_init_idt>
  10222b:	c6 05 44 fe 10 00 01 	movb   $0x1,0x10fe44
  102232:	eb 01                	jmp    102235 <intr_init+0x1d>
  102234:	90                   	nop
  102235:	5d                   	pop    %ebp
  102236:	c3                   	ret    
  102237:	66 90                	xchg   %ax,%ax
  102239:	66 90                	xchg   %ax,%ax
  10223b:	66 90                	xchg   %ax,%ax
  10223d:	66 90                	xchg   %ax,%ax
  10223f:	90                   	nop

00102240 <Xdivide>:
  102240:	6a 00                	push   $0x0
  102242:	6a 00                	push   $0x0
  102244:	e9 67 01 00 00       	jmp    1023b0 <_alltraps>
  102249:	90                   	nop

0010224a <Xdebug>:
  10224a:	6a 00                	push   $0x0
  10224c:	6a 01                	push   $0x1
  10224e:	e9 5d 01 00 00       	jmp    1023b0 <_alltraps>
  102253:	90                   	nop

00102254 <Xnmi>:
  102254:	6a 00                	push   $0x0
  102256:	6a 02                	push   $0x2
  102258:	e9 53 01 00 00       	jmp    1023b0 <_alltraps>
  10225d:	90                   	nop

0010225e <Xbrkpt>:
  10225e:	6a 00                	push   $0x0
  102260:	6a 03                	push   $0x3
  102262:	e9 49 01 00 00       	jmp    1023b0 <_alltraps>
  102267:	90                   	nop

00102268 <Xoflow>:
  102268:	6a 00                	push   $0x0
  10226a:	6a 04                	push   $0x4
  10226c:	e9 3f 01 00 00       	jmp    1023b0 <_alltraps>
  102271:	90                   	nop

00102272 <Xbound>:
  102272:	6a 00                	push   $0x0
  102274:	6a 05                	push   $0x5
  102276:	e9 35 01 00 00       	jmp    1023b0 <_alltraps>
  10227b:	90                   	nop

0010227c <Xillop>:
  10227c:	6a 00                	push   $0x0
  10227e:	6a 06                	push   $0x6
  102280:	e9 2b 01 00 00       	jmp    1023b0 <_alltraps>
  102285:	90                   	nop

00102286 <Xdevice>:
  102286:	6a 00                	push   $0x0
  102288:	6a 07                	push   $0x7
  10228a:	e9 21 01 00 00       	jmp    1023b0 <_alltraps>
  10228f:	90                   	nop

00102290 <Xdblflt>:
  102290:	6a 08                	push   $0x8
  102292:	e9 19 01 00 00       	jmp    1023b0 <_alltraps>
  102297:	90                   	nop

00102298 <Xcoproc>:
  102298:	6a 00                	push   $0x0
  10229a:	6a 09                	push   $0x9
  10229c:	e9 0f 01 00 00       	jmp    1023b0 <_alltraps>
  1022a1:	90                   	nop

001022a2 <Xtss>:
  1022a2:	6a 0a                	push   $0xa
  1022a4:	e9 07 01 00 00       	jmp    1023b0 <_alltraps>
  1022a9:	90                   	nop

001022aa <Xsegnp>:
  1022aa:	6a 0b                	push   $0xb
  1022ac:	e9 ff 00 00 00       	jmp    1023b0 <_alltraps>
  1022b1:	90                   	nop

001022b2 <Xstack>:
  1022b2:	6a 0c                	push   $0xc
  1022b4:	e9 f7 00 00 00       	jmp    1023b0 <_alltraps>
  1022b9:	90                   	nop

001022ba <Xgpflt>:
  1022ba:	6a 0d                	push   $0xd
  1022bc:	e9 ef 00 00 00       	jmp    1023b0 <_alltraps>
  1022c1:	90                   	nop

001022c2 <Xpgflt>:
  1022c2:	6a 0e                	push   $0xe
  1022c4:	e9 e7 00 00 00       	jmp    1023b0 <_alltraps>
  1022c9:	90                   	nop

001022ca <Xres>:
  1022ca:	6a 00                	push   $0x0
  1022cc:	6a 0f                	push   $0xf
  1022ce:	e9 dd 00 00 00       	jmp    1023b0 <_alltraps>
  1022d3:	90                   	nop

001022d4 <Xfperr>:
  1022d4:	6a 00                	push   $0x0
  1022d6:	6a 10                	push   $0x10
  1022d8:	e9 d3 00 00 00       	jmp    1023b0 <_alltraps>
  1022dd:	90                   	nop

001022de <Xalign>:
  1022de:	6a 11                	push   $0x11
  1022e0:	e9 cb 00 00 00       	jmp    1023b0 <_alltraps>
  1022e5:	90                   	nop

001022e6 <Xmchk>:
  1022e6:	6a 00                	push   $0x0
  1022e8:	6a 12                	push   $0x12
  1022ea:	e9 c1 00 00 00       	jmp    1023b0 <_alltraps>
  1022ef:	90                   	nop

001022f0 <Xirq_timer>:
  1022f0:	6a 00                	push   $0x0
  1022f2:	6a 20                	push   $0x20
  1022f4:	e9 b7 00 00 00       	jmp    1023b0 <_alltraps>
  1022f9:	90                   	nop

001022fa <Xirq_kbd>:
  1022fa:	6a 00                	push   $0x0
  1022fc:	6a 21                	push   $0x21
  1022fe:	e9 ad 00 00 00       	jmp    1023b0 <_alltraps>
  102303:	90                   	nop

00102304 <Xirq_slave>:
  102304:	6a 00                	push   $0x0
  102306:	6a 22                	push   $0x22
  102308:	e9 a3 00 00 00       	jmp    1023b0 <_alltraps>
  10230d:	90                   	nop

0010230e <Xirq_serial2>:
  10230e:	6a 00                	push   $0x0
  102310:	6a 23                	push   $0x23
  102312:	e9 99 00 00 00       	jmp    1023b0 <_alltraps>
  102317:	90                   	nop

00102318 <Xirq_serial1>:
  102318:	6a 00                	push   $0x0
  10231a:	6a 24                	push   $0x24
  10231c:	e9 8f 00 00 00       	jmp    1023b0 <_alltraps>
  102321:	90                   	nop

00102322 <Xirq_lpt>:
  102322:	6a 00                	push   $0x0
  102324:	6a 25                	push   $0x25
  102326:	e9 85 00 00 00       	jmp    1023b0 <_alltraps>
  10232b:	90                   	nop

0010232c <Xirq_floppy>:
  10232c:	6a 00                	push   $0x0
  10232e:	6a 26                	push   $0x26
  102330:	eb 7e                	jmp    1023b0 <_alltraps>

00102332 <Xirq_spurious>:
  102332:	6a 00                	push   $0x0
  102334:	6a 27                	push   $0x27
  102336:	eb 78                	jmp    1023b0 <_alltraps>

00102338 <Xirq_rtc>:
  102338:	6a 00                	push   $0x0
  10233a:	6a 28                	push   $0x28
  10233c:	eb 72                	jmp    1023b0 <_alltraps>

0010233e <Xirq9>:
  10233e:	6a 00                	push   $0x0
  102340:	6a 29                	push   $0x29
  102342:	eb 6c                	jmp    1023b0 <_alltraps>

00102344 <Xirq10>:
  102344:	6a 00                	push   $0x0
  102346:	6a 2a                	push   $0x2a
  102348:	eb 66                	jmp    1023b0 <_alltraps>

0010234a <Xirq11>:
  10234a:	6a 00                	push   $0x0
  10234c:	6a 2b                	push   $0x2b
  10234e:	eb 60                	jmp    1023b0 <_alltraps>

00102350 <Xirq_mouse>:
  102350:	6a 00                	push   $0x0
  102352:	6a 2c                	push   $0x2c
  102354:	eb 5a                	jmp    1023b0 <_alltraps>

00102356 <Xirq_coproc>:
  102356:	6a 00                	push   $0x0
  102358:	6a 2d                	push   $0x2d
  10235a:	eb 54                	jmp    1023b0 <_alltraps>

0010235c <Xirq_ide1>:
  10235c:	6a 00                	push   $0x0
  10235e:	6a 2e                	push   $0x2e
  102360:	eb 4e                	jmp    1023b0 <_alltraps>

00102362 <Xirq_ide2>:
  102362:	6a 00                	push   $0x0
  102364:	6a 2f                	push   $0x2f
  102366:	eb 48                	jmp    1023b0 <_alltraps>

00102368 <Xirq_ehci1>:
  102368:	6a 00                	push   $0x0
  10236a:	6a 30                	push   $0x30
  10236c:	eb 42                	jmp    1023b0 <_alltraps>

0010236e <Xirq17>:
  10236e:	6a 00                	push   $0x0
  102370:	6a 31                	push   $0x31
  102372:	eb 3c                	jmp    1023b0 <_alltraps>

00102374 <Xirq18>:
  102374:	6a 00                	push   $0x0
  102376:	6a 32                	push   $0x32
  102378:	eb 36                	jmp    1023b0 <_alltraps>

0010237a <Xirq19>:
  10237a:	6a 00                	push   $0x0
  10237c:	6a 33                	push   $0x33
  10237e:	eb 30                	jmp    1023b0 <_alltraps>

00102380 <Xirq20>:
  102380:	6a 00                	push   $0x0
  102382:	6a 34                	push   $0x34
  102384:	eb 2a                	jmp    1023b0 <_alltraps>

00102386 <Xirq21>:
  102386:	6a 00                	push   $0x0
  102388:	6a 35                	push   $0x35
  10238a:	eb 24                	jmp    1023b0 <_alltraps>

0010238c <Xirq22>:
  10238c:	6a 00                	push   $0x0
  10238e:	6a 36                	push   $0x36
  102390:	eb 1e                	jmp    1023b0 <_alltraps>

00102392 <Xirq_ehci2>:
  102392:	6a 00                	push   $0x0
  102394:	6a 37                	push   $0x37
  102396:	eb 18                	jmp    1023b0 <_alltraps>

00102398 <Xsyscall>:
  102398:	6a 00                	push   $0x0
  10239a:	6a 30                	push   $0x30
  10239c:	eb 12                	jmp    1023b0 <_alltraps>

0010239e <Xdefault>:
  10239e:	68 fe 00 00 00       	push   $0xfe
  1023a3:	eb 0b                	jmp    1023b0 <_alltraps>
  1023a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1023a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001023b0 <_alltraps>:
  1023b0:	fa                   	cli    
  1023b1:	1e                   	push   %ds
  1023b2:	06                   	push   %es
  1023b3:	60                   	pusha  
  1023b4:	b8 10 00 00 00       	mov    $0x10,%eax
  1023b9:	8e d8                	mov    %eax,%ds
  1023bb:	8e c0                	mov    %eax,%es
  1023bd:	54                   	push   %esp
  1023be:	e8 4e 1d 00 00       	call   104111 <trap>
  1023c3:	f4                   	hlt    
  1023c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1023ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

001023d0 <trap_return>:
  1023d0:	8b 64 24 04          	mov    0x4(%esp),%esp
  1023d4:	61                   	popa   
  1023d5:	07                   	pop    %es
  1023d6:	1f                   	pop    %ds
  1023d7:	83 c4 08             	add    $0x8,%esp
  1023da:	c3                   	ret    

001023db <memset>:
  1023db:	55                   	push   %ebp
  1023dc:	89 e5                	mov    %esp,%ebp
  1023de:	57                   	push   %edi
  1023df:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1023e3:	75 05                	jne    1023ea <memset+0xf>
  1023e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1023e8:	eb 5c                	jmp    102446 <memset+0x6b>
  1023ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1023ed:	83 e0 03             	and    $0x3,%eax
  1023f0:	85 c0                	test   %eax,%eax
  1023f2:	75 41                	jne    102435 <memset+0x5a>
  1023f4:	8b 45 10             	mov    0x10(%ebp),%eax
  1023f7:	83 e0 03             	and    $0x3,%eax
  1023fa:	85 c0                	test   %eax,%eax
  1023fc:	75 37                	jne    102435 <memset+0x5a>
  1023fe:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
  102405:	8b 45 0c             	mov    0xc(%ebp),%eax
  102408:	c1 e0 18             	shl    $0x18,%eax
  10240b:	89 c2                	mov    %eax,%edx
  10240d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102410:	c1 e0 10             	shl    $0x10,%eax
  102413:	09 c2                	or     %eax,%edx
  102415:	8b 45 0c             	mov    0xc(%ebp),%eax
  102418:	c1 e0 08             	shl    $0x8,%eax
  10241b:	09 d0                	or     %edx,%eax
  10241d:	09 45 0c             	or     %eax,0xc(%ebp)
  102420:	8b 45 10             	mov    0x10(%ebp),%eax
  102423:	c1 e8 02             	shr    $0x2,%eax
  102426:	89 c1                	mov    %eax,%ecx
  102428:	8b 55 08             	mov    0x8(%ebp),%edx
  10242b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10242e:	89 d7                	mov    %edx,%edi
  102430:	fc                   	cld    
  102431:	f3 ab                	rep stos %eax,%es:(%edi)
  102433:	eb 0e                	jmp    102443 <memset+0x68>
  102435:	8b 55 08             	mov    0x8(%ebp),%edx
  102438:	8b 45 0c             	mov    0xc(%ebp),%eax
  10243b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  10243e:	89 d7                	mov    %edx,%edi
  102440:	fc                   	cld    
  102441:	f3 aa                	rep stos %al,%es:(%edi)
  102443:	8b 45 08             	mov    0x8(%ebp),%eax
  102446:	5f                   	pop    %edi
  102447:	5d                   	pop    %ebp
  102448:	c3                   	ret    

00102449 <memmove>:
  102449:	55                   	push   %ebp
  10244a:	89 e5                	mov    %esp,%ebp
  10244c:	57                   	push   %edi
  10244d:	56                   	push   %esi
  10244e:	53                   	push   %ebx
  10244f:	83 ec 10             	sub    $0x10,%esp
  102452:	8b 45 0c             	mov    0xc(%ebp),%eax
  102455:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102458:	8b 45 08             	mov    0x8(%ebp),%eax
  10245b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10245e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102461:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102464:	73 6d                	jae    1024d3 <memmove+0x8a>
  102466:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102469:	8b 45 10             	mov    0x10(%ebp),%eax
  10246c:	01 d0                	add    %edx,%eax
  10246e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102471:	76 60                	jbe    1024d3 <memmove+0x8a>
  102473:	8b 45 10             	mov    0x10(%ebp),%eax
  102476:	01 45 f0             	add    %eax,-0x10(%ebp)
  102479:	8b 45 10             	mov    0x10(%ebp),%eax
  10247c:	01 45 ec             	add    %eax,-0x14(%ebp)
  10247f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102482:	83 e0 03             	and    $0x3,%eax
  102485:	85 c0                	test   %eax,%eax
  102487:	75 2f                	jne    1024b8 <memmove+0x6f>
  102489:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10248c:	83 e0 03             	and    $0x3,%eax
  10248f:	85 c0                	test   %eax,%eax
  102491:	75 25                	jne    1024b8 <memmove+0x6f>
  102493:	8b 45 10             	mov    0x10(%ebp),%eax
  102496:	83 e0 03             	and    $0x3,%eax
  102499:	85 c0                	test   %eax,%eax
  10249b:	75 1b                	jne    1024b8 <memmove+0x6f>
  10249d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1024a0:	83 e8 04             	sub    $0x4,%eax
  1024a3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1024a6:	83 ea 04             	sub    $0x4,%edx
  1024a9:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1024ac:	c1 e9 02             	shr    $0x2,%ecx
  1024af:	89 c7                	mov    %eax,%edi
  1024b1:	89 d6                	mov    %edx,%esi
  1024b3:	fd                   	std    
  1024b4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1024b6:	eb 18                	jmp    1024d0 <memmove+0x87>
  1024b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1024bb:	8d 50 ff             	lea    -0x1(%eax),%edx
  1024be:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1024c1:	8d 58 ff             	lea    -0x1(%eax),%ebx
  1024c4:	8b 45 10             	mov    0x10(%ebp),%eax
  1024c7:	89 d7                	mov    %edx,%edi
  1024c9:	89 de                	mov    %ebx,%esi
  1024cb:	89 c1                	mov    %eax,%ecx
  1024cd:	fd                   	std    
  1024ce:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1024d0:	fc                   	cld    
  1024d1:	eb 45                	jmp    102518 <memmove+0xcf>
  1024d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1024d6:	83 e0 03             	and    $0x3,%eax
  1024d9:	85 c0                	test   %eax,%eax
  1024db:	75 2b                	jne    102508 <memmove+0xbf>
  1024dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1024e0:	83 e0 03             	and    $0x3,%eax
  1024e3:	85 c0                	test   %eax,%eax
  1024e5:	75 21                	jne    102508 <memmove+0xbf>
  1024e7:	8b 45 10             	mov    0x10(%ebp),%eax
  1024ea:	83 e0 03             	and    $0x3,%eax
  1024ed:	85 c0                	test   %eax,%eax
  1024ef:	75 17                	jne    102508 <memmove+0xbf>
  1024f1:	8b 45 10             	mov    0x10(%ebp),%eax
  1024f4:	c1 e8 02             	shr    $0x2,%eax
  1024f7:	89 c1                	mov    %eax,%ecx
  1024f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1024fc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1024ff:	89 c7                	mov    %eax,%edi
  102501:	89 d6                	mov    %edx,%esi
  102503:	fc                   	cld    
  102504:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102506:	eb 10                	jmp    102518 <memmove+0xcf>
  102508:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10250b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10250e:	8b 4d 10             	mov    0x10(%ebp),%ecx
  102511:	89 c7                	mov    %eax,%edi
  102513:	89 d6                	mov    %edx,%esi
  102515:	fc                   	cld    
  102516:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102518:	8b 45 08             	mov    0x8(%ebp),%eax
  10251b:	83 c4 10             	add    $0x10,%esp
  10251e:	5b                   	pop    %ebx
  10251f:	5e                   	pop    %esi
  102520:	5f                   	pop    %edi
  102521:	5d                   	pop    %ebp
  102522:	c3                   	ret    

00102523 <memcpy>:
  102523:	55                   	push   %ebp
  102524:	89 e5                	mov    %esp,%ebp
  102526:	ff 75 10             	pushl  0x10(%ebp)
  102529:	ff 75 0c             	pushl  0xc(%ebp)
  10252c:	ff 75 08             	pushl  0x8(%ebp)
  10252f:	e8 15 ff ff ff       	call   102449 <memmove>
  102534:	83 c4 0c             	add    $0xc,%esp
  102537:	c9                   	leave  
  102538:	c3                   	ret    

00102539 <strncmp>:
  102539:	55                   	push   %ebp
  10253a:	89 e5                	mov    %esp,%ebp
  10253c:	eb 0c                	jmp    10254a <strncmp+0x11>
  10253e:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102542:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102546:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  10254a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10254e:	74 1a                	je     10256a <strncmp+0x31>
  102550:	8b 45 08             	mov    0x8(%ebp),%eax
  102553:	0f b6 00             	movzbl (%eax),%eax
  102556:	84 c0                	test   %al,%al
  102558:	74 10                	je     10256a <strncmp+0x31>
  10255a:	8b 45 08             	mov    0x8(%ebp),%eax
  10255d:	0f b6 10             	movzbl (%eax),%edx
  102560:	8b 45 0c             	mov    0xc(%ebp),%eax
  102563:	0f b6 00             	movzbl (%eax),%eax
  102566:	38 c2                	cmp    %al,%dl
  102568:	74 d4                	je     10253e <strncmp+0x5>
  10256a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10256e:	75 07                	jne    102577 <strncmp+0x3e>
  102570:	b8 00 00 00 00       	mov    $0x0,%eax
  102575:	eb 16                	jmp    10258d <strncmp+0x54>
  102577:	8b 45 08             	mov    0x8(%ebp),%eax
  10257a:	0f b6 00             	movzbl (%eax),%eax
  10257d:	0f b6 d0             	movzbl %al,%edx
  102580:	8b 45 0c             	mov    0xc(%ebp),%eax
  102583:	0f b6 00             	movzbl (%eax),%eax
  102586:	0f b6 c0             	movzbl %al,%eax
  102589:	29 c2                	sub    %eax,%edx
  10258b:	89 d0                	mov    %edx,%eax
  10258d:	5d                   	pop    %ebp
  10258e:	c3                   	ret    

0010258f <strnlen>:
  10258f:	55                   	push   %ebp
  102590:	89 e5                	mov    %esp,%ebp
  102592:	83 ec 10             	sub    $0x10,%esp
  102595:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10259c:	eb 0c                	jmp    1025aa <strnlen+0x1b>
  10259e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1025a2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1025a6:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
  1025aa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1025ae:	74 0a                	je     1025ba <strnlen+0x2b>
  1025b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1025b3:	0f b6 00             	movzbl (%eax),%eax
  1025b6:	84 c0                	test   %al,%al
  1025b8:	75 e4                	jne    10259e <strnlen+0xf>
  1025ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1025bd:	c9                   	leave  
  1025be:	c3                   	ret    

001025bf <strcmp>:
  1025bf:	55                   	push   %ebp
  1025c0:	89 e5                	mov    %esp,%ebp
  1025c2:	eb 08                	jmp    1025cc <strcmp+0xd>
  1025c4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1025c8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  1025cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1025cf:	0f b6 00             	movzbl (%eax),%eax
  1025d2:	84 c0                	test   %al,%al
  1025d4:	74 10                	je     1025e6 <strcmp+0x27>
  1025d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1025d9:	0f b6 10             	movzbl (%eax),%edx
  1025dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1025df:	0f b6 00             	movzbl (%eax),%eax
  1025e2:	38 c2                	cmp    %al,%dl
  1025e4:	74 de                	je     1025c4 <strcmp+0x5>
  1025e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1025e9:	0f b6 00             	movzbl (%eax),%eax
  1025ec:	0f b6 d0             	movzbl %al,%edx
  1025ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1025f2:	0f b6 00             	movzbl (%eax),%eax
  1025f5:	0f b6 c0             	movzbl %al,%eax
  1025f8:	29 c2                	sub    %eax,%edx
  1025fa:	89 d0                	mov    %edx,%eax
  1025fc:	5d                   	pop    %ebp
  1025fd:	c3                   	ret    

001025fe <strchr>:
  1025fe:	55                   	push   %ebp
  1025ff:	89 e5                	mov    %esp,%ebp
  102601:	83 ec 04             	sub    $0x4,%esp
  102604:	8b 45 0c             	mov    0xc(%ebp),%eax
  102607:	88 45 fc             	mov    %al,-0x4(%ebp)
  10260a:	eb 14                	jmp    102620 <strchr+0x22>
  10260c:	8b 45 08             	mov    0x8(%ebp),%eax
  10260f:	0f b6 00             	movzbl (%eax),%eax
  102612:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102615:	75 05                	jne    10261c <strchr+0x1e>
  102617:	8b 45 08             	mov    0x8(%ebp),%eax
  10261a:	eb 13                	jmp    10262f <strchr+0x31>
  10261c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102620:	8b 45 08             	mov    0x8(%ebp),%eax
  102623:	0f b6 00             	movzbl (%eax),%eax
  102626:	84 c0                	test   %al,%al
  102628:	75 e2                	jne    10260c <strchr+0xe>
  10262a:	b8 00 00 00 00       	mov    $0x0,%eax
  10262f:	c9                   	leave  
  102630:	c3                   	ret    

00102631 <memzero>:
  102631:	55                   	push   %ebp
  102632:	89 e5                	mov    %esp,%ebp
  102634:	ff 75 0c             	pushl  0xc(%ebp)
  102637:	6a 00                	push   $0x0
  102639:	ff 75 08             	pushl  0x8(%ebp)
  10263c:	e8 9a fd ff ff       	call   1023db <memset>
  102641:	83 c4 0c             	add    $0xc,%esp
  102644:	c9                   	leave  
  102645:	c3                   	ret    

00102646 <debug_info>:
  102646:	55                   	push   %ebp
  102647:	89 e5                	mov    %esp,%ebp
  102649:	83 ec 18             	sub    $0x18,%esp
  10264c:	8d 45 0c             	lea    0xc(%ebp),%eax
  10264f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102652:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102655:	83 ec 08             	sub    $0x8,%esp
  102658:	50                   	push   %eax
  102659:	ff 75 08             	pushl  0x8(%ebp)
  10265c:	e8 09 02 00 00       	call   10286a <vdprintf>
  102661:	83 c4 10             	add    $0x10,%esp
  102664:	90                   	nop
  102665:	c9                   	leave  
  102666:	c3                   	ret    

00102667 <debug_normal>:
  102667:	55                   	push   %ebp
  102668:	89 e5                	mov    %esp,%ebp
  10266a:	83 ec 18             	sub    $0x18,%esp
  10266d:	83 ec 04             	sub    $0x4,%esp
  102670:	ff 75 0c             	pushl  0xc(%ebp)
  102673:	ff 75 08             	pushl  0x8(%ebp)
  102676:	68 e7 5d 10 00       	push   $0x105de7
  10267b:	e8 4c 02 00 00       	call   1028cc <dprintf>
  102680:	83 c4 10             	add    $0x10,%esp
  102683:	8d 45 14             	lea    0x14(%ebp),%eax
  102686:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102689:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10268c:	83 ec 08             	sub    $0x8,%esp
  10268f:	50                   	push   %eax
  102690:	ff 75 10             	pushl  0x10(%ebp)
  102693:	e8 d2 01 00 00       	call   10286a <vdprintf>
  102698:	83 c4 10             	add    $0x10,%esp
  10269b:	90                   	nop
  10269c:	c9                   	leave  
  10269d:	c3                   	ret    

0010269e <debug_trace>:
  10269e:	55                   	push   %ebp
  10269f:	89 e5                	mov    %esp,%ebp
  1026a1:	83 ec 10             	sub    $0x10,%esp
  1026a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1026a7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1026aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1026b1:	eb 23                	jmp    1026d6 <debug_trace+0x38>
  1026b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1026b6:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1026bd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1026c0:	01 c2                	add    %eax,%edx
  1026c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1026c5:	8b 40 04             	mov    0x4(%eax),%eax
  1026c8:	89 02                	mov    %eax,(%edx)
  1026ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1026cd:	8b 00                	mov    (%eax),%eax
  1026cf:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1026d2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1026d6:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
  1026da:	7f 21                	jg     1026fd <debug_trace+0x5f>
  1026dc:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  1026e0:	75 d1                	jne    1026b3 <debug_trace+0x15>
  1026e2:	eb 19                	jmp    1026fd <debug_trace+0x5f>
  1026e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1026e7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1026ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  1026f1:	01 d0                	add    %edx,%eax
  1026f3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1026f9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1026fd:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
  102701:	7e e1                	jle    1026e4 <debug_trace+0x46>
  102703:	90                   	nop
  102704:	c9                   	leave  
  102705:	c3                   	ret    

00102706 <debug_panic>:
  102706:	55                   	push   %ebp
  102707:	89 e5                	mov    %esp,%ebp
  102709:	83 ec 48             	sub    $0x48,%esp
  10270c:	83 ec 04             	sub    $0x4,%esp
  10270f:	ff 75 0c             	pushl  0xc(%ebp)
  102712:	ff 75 08             	pushl  0x8(%ebp)
  102715:	68 f3 5d 10 00       	push   $0x105df3
  10271a:	e8 ad 01 00 00       	call   1028cc <dprintf>
  10271f:	83 c4 10             	add    $0x10,%esp
  102722:	8d 45 14             	lea    0x14(%ebp),%eax
  102725:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  102728:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  10272b:	83 ec 08             	sub    $0x8,%esp
  10272e:	50                   	push   %eax
  10272f:	ff 75 10             	pushl  0x10(%ebp)
  102732:	e8 33 01 00 00       	call   10286a <vdprintf>
  102737:	83 c4 10             	add    $0x10,%esp
  10273a:	89 e8                	mov    %ebp,%eax
  10273c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10273f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102742:	83 ec 08             	sub    $0x8,%esp
  102745:	8d 55 c8             	lea    -0x38(%ebp),%edx
  102748:	52                   	push   %edx
  102749:	50                   	push   %eax
  10274a:	e8 4f ff ff ff       	call   10269e <debug_trace>
  10274f:	83 c4 10             	add    $0x10,%esp
  102752:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102759:	eb 1c                	jmp    102777 <debug_panic+0x71>
  10275b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10275e:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
  102762:	83 ec 08             	sub    $0x8,%esp
  102765:	50                   	push   %eax
  102766:	68 ff 5d 10 00       	push   $0x105dff
  10276b:	e8 5c 01 00 00       	call   1028cc <dprintf>
  102770:	83 c4 10             	add    $0x10,%esp
  102773:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  102777:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  10277b:	7f 0b                	jg     102788 <debug_panic+0x82>
  10277d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102780:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
  102784:	85 c0                	test   %eax,%eax
  102786:	75 d3                	jne    10275b <debug_panic+0x55>
  102788:	83 ec 0c             	sub    $0xc,%esp
  10278b:	68 0d 5e 10 00       	push   $0x105e0d
  102790:	e8 37 01 00 00       	call   1028cc <dprintf>
  102795:	83 c4 10             	add    $0x10,%esp
  102798:	e8 86 0b 00 00       	call   103323 <halt>
  10279d:	90                   	nop
  10279e:	c9                   	leave  
  10279f:	c3                   	ret    

001027a0 <debug_warn>:
  1027a0:	55                   	push   %ebp
  1027a1:	89 e5                	mov    %esp,%ebp
  1027a3:	83 ec 18             	sub    $0x18,%esp
  1027a6:	83 ec 04             	sub    $0x4,%esp
  1027a9:	ff 75 0c             	pushl  0xc(%ebp)
  1027ac:	ff 75 08             	pushl  0x8(%ebp)
  1027af:	68 1f 5e 10 00       	push   $0x105e1f
  1027b4:	e8 13 01 00 00       	call   1028cc <dprintf>
  1027b9:	83 c4 10             	add    $0x10,%esp
  1027bc:	8d 45 14             	lea    0x14(%ebp),%eax
  1027bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1027c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1027c5:	83 ec 08             	sub    $0x8,%esp
  1027c8:	50                   	push   %eax
  1027c9:	ff 75 10             	pushl  0x10(%ebp)
  1027cc:	e8 99 00 00 00       	call   10286a <vdprintf>
  1027d1:	83 c4 10             	add    $0x10,%esp
  1027d4:	90                   	nop
  1027d5:	c9                   	leave  
  1027d6:	c3                   	ret    

001027d7 <cputs>:
  1027d7:	55                   	push   %ebp
  1027d8:	89 e5                	mov    %esp,%ebp
  1027da:	83 ec 08             	sub    $0x8,%esp
  1027dd:	eb 19                	jmp    1027f8 <cputs+0x21>
  1027df:	8b 45 08             	mov    0x8(%ebp),%eax
  1027e2:	0f b6 00             	movzbl (%eax),%eax
  1027e5:	0f be c0             	movsbl %al,%eax
  1027e8:	83 ec 0c             	sub    $0xc,%esp
  1027eb:	50                   	push   %eax
  1027ec:	e8 3f dc ff ff       	call   100430 <cons_putc>
  1027f1:	83 c4 10             	add    $0x10,%esp
  1027f4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1027f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1027fb:	0f b6 00             	movzbl (%eax),%eax
  1027fe:	84 c0                	test   %al,%al
  102800:	75 dd                	jne    1027df <cputs+0x8>
  102802:	90                   	nop
  102803:	c9                   	leave  
  102804:	c3                   	ret    

00102805 <putch>:
  102805:	55                   	push   %ebp
  102806:	89 e5                	mov    %esp,%ebp
  102808:	83 ec 08             	sub    $0x8,%esp
  10280b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10280e:	8b 00                	mov    (%eax),%eax
  102810:	8d 48 01             	lea    0x1(%eax),%ecx
  102813:	8b 55 0c             	mov    0xc(%ebp),%edx
  102816:	89 0a                	mov    %ecx,(%edx)
  102818:	8b 55 08             	mov    0x8(%ebp),%edx
  10281b:	89 d1                	mov    %edx,%ecx
  10281d:	8b 55 0c             	mov    0xc(%ebp),%edx
  102820:	88 4c 02 08          	mov    %cl,0x8(%edx,%eax,1)
  102824:	8b 45 0c             	mov    0xc(%ebp),%eax
  102827:	8b 00                	mov    (%eax),%eax
  102829:	3d ff 01 00 00       	cmp    $0x1ff,%eax
  10282e:	75 28                	jne    102858 <putch+0x53>
  102830:	8b 45 0c             	mov    0xc(%ebp),%eax
  102833:	8b 00                	mov    (%eax),%eax
  102835:	8b 55 0c             	mov    0xc(%ebp),%edx
  102838:	c6 44 02 08 00       	movb   $0x0,0x8(%edx,%eax,1)
  10283d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102840:	83 c0 08             	add    $0x8,%eax
  102843:	83 ec 0c             	sub    $0xc,%esp
  102846:	50                   	push   %eax
  102847:	e8 8b ff ff ff       	call   1027d7 <cputs>
  10284c:	83 c4 10             	add    $0x10,%esp
  10284f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102852:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  102858:	8b 45 0c             	mov    0xc(%ebp),%eax
  10285b:	8b 40 04             	mov    0x4(%eax),%eax
  10285e:	8d 50 01             	lea    0x1(%eax),%edx
  102861:	8b 45 0c             	mov    0xc(%ebp),%eax
  102864:	89 50 04             	mov    %edx,0x4(%eax)
  102867:	90                   	nop
  102868:	c9                   	leave  
  102869:	c3                   	ret    

0010286a <vdprintf>:
  10286a:	55                   	push   %ebp
  10286b:	89 e5                	mov    %esp,%ebp
  10286d:	81 ec 18 02 00 00    	sub    $0x218,%esp
  102873:	c7 85 f0 fd ff ff 00 	movl   $0x0,-0x210(%ebp)
  10287a:	00 00 00 
  10287d:	c7 85 f4 fd ff ff 00 	movl   $0x0,-0x20c(%ebp)
  102884:	00 00 00 
  102887:	ff 75 0c             	pushl  0xc(%ebp)
  10288a:	ff 75 08             	pushl  0x8(%ebp)
  10288d:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  102893:	50                   	push   %eax
  102894:	68 05 28 10 00       	push   $0x102805
  102899:	e8 a3 01 00 00       	call   102a41 <vprintfmt>
  10289e:	83 c4 10             	add    $0x10,%esp
  1028a1:	8b 85 f0 fd ff ff    	mov    -0x210(%ebp),%eax
  1028a7:	c6 84 05 f8 fd ff ff 	movb   $0x0,-0x208(%ebp,%eax,1)
  1028ae:	00 
  1028af:	83 ec 0c             	sub    $0xc,%esp
  1028b2:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  1028b8:	83 c0 08             	add    $0x8,%eax
  1028bb:	50                   	push   %eax
  1028bc:	e8 16 ff ff ff       	call   1027d7 <cputs>
  1028c1:	83 c4 10             	add    $0x10,%esp
  1028c4:	8b 85 f4 fd ff ff    	mov    -0x20c(%ebp),%eax
  1028ca:	c9                   	leave  
  1028cb:	c3                   	ret    

001028cc <dprintf>:
  1028cc:	55                   	push   %ebp
  1028cd:	89 e5                	mov    %esp,%ebp
  1028cf:	83 ec 18             	sub    $0x18,%esp
  1028d2:	8d 45 0c             	lea    0xc(%ebp),%eax
  1028d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1028d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028db:	83 ec 08             	sub    $0x8,%esp
  1028de:	50                   	push   %eax
  1028df:	ff 75 08             	pushl  0x8(%ebp)
  1028e2:	e8 83 ff ff ff       	call   10286a <vdprintf>
  1028e7:	83 c4 10             	add    $0x10,%esp
  1028ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1028ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1028f0:	c9                   	leave  
  1028f1:	c3                   	ret    

001028f2 <printnum>:
  1028f2:	55                   	push   %ebp
  1028f3:	89 e5                	mov    %esp,%ebp
  1028f5:	53                   	push   %ebx
  1028f6:	83 ec 14             	sub    $0x14,%esp
  1028f9:	8b 45 10             	mov    0x10(%ebp),%eax
  1028fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1028ff:	8b 45 14             	mov    0x14(%ebp),%eax
  102902:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102905:	8b 45 18             	mov    0x18(%ebp),%eax
  102908:	ba 00 00 00 00       	mov    $0x0,%edx
  10290d:	3b 55 f4             	cmp    -0xc(%ebp),%edx
  102910:	77 55                	ja     102967 <printnum+0x75>
  102912:	3b 55 f4             	cmp    -0xc(%ebp),%edx
  102915:	72 05                	jb     10291c <printnum+0x2a>
  102917:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  10291a:	77 4b                	ja     102967 <printnum+0x75>
  10291c:	8b 45 1c             	mov    0x1c(%ebp),%eax
  10291f:	8d 58 ff             	lea    -0x1(%eax),%ebx
  102922:	8b 45 18             	mov    0x18(%ebp),%eax
  102925:	ba 00 00 00 00       	mov    $0x0,%edx
  10292a:	52                   	push   %edx
  10292b:	50                   	push   %eax
  10292c:	ff 75 f4             	pushl  -0xc(%ebp)
  10292f:	ff 75 f0             	pushl  -0x10(%ebp)
  102932:	e8 29 31 00 00       	call   105a60 <__udivdi3>
  102937:	83 c4 10             	add    $0x10,%esp
  10293a:	83 ec 04             	sub    $0x4,%esp
  10293d:	ff 75 20             	pushl  0x20(%ebp)
  102940:	53                   	push   %ebx
  102941:	ff 75 18             	pushl  0x18(%ebp)
  102944:	52                   	push   %edx
  102945:	50                   	push   %eax
  102946:	ff 75 0c             	pushl  0xc(%ebp)
  102949:	ff 75 08             	pushl  0x8(%ebp)
  10294c:	e8 a1 ff ff ff       	call   1028f2 <printnum>
  102951:	83 c4 20             	add    $0x20,%esp
  102954:	eb 1b                	jmp    102971 <printnum+0x7f>
  102956:	83 ec 08             	sub    $0x8,%esp
  102959:	ff 75 0c             	pushl  0xc(%ebp)
  10295c:	ff 75 20             	pushl  0x20(%ebp)
  10295f:	8b 45 08             	mov    0x8(%ebp),%eax
  102962:	ff d0                	call   *%eax
  102964:	83 c4 10             	add    $0x10,%esp
  102967:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  10296b:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  10296f:	7f e5                	jg     102956 <printnum+0x64>
  102971:	8b 4d 18             	mov    0x18(%ebp),%ecx
  102974:	bb 00 00 00 00       	mov    $0x0,%ebx
  102979:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10297c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10297f:	53                   	push   %ebx
  102980:	51                   	push   %ecx
  102981:	52                   	push   %edx
  102982:	50                   	push   %eax
  102983:	e8 08 32 00 00       	call   105b90 <__umoddi3>
  102988:	83 c4 10             	add    $0x10,%esp
  10298b:	05 2c 5e 10 00       	add    $0x105e2c,%eax
  102990:	0f b6 00             	movzbl (%eax),%eax
  102993:	0f be c0             	movsbl %al,%eax
  102996:	83 ec 08             	sub    $0x8,%esp
  102999:	ff 75 0c             	pushl  0xc(%ebp)
  10299c:	50                   	push   %eax
  10299d:	8b 45 08             	mov    0x8(%ebp),%eax
  1029a0:	ff d0                	call   *%eax
  1029a2:	83 c4 10             	add    $0x10,%esp
  1029a5:	90                   	nop
  1029a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1029a9:	c9                   	leave  
  1029aa:	c3                   	ret    

001029ab <getuint>:
  1029ab:	55                   	push   %ebp
  1029ac:	89 e5                	mov    %esp,%ebp
  1029ae:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1029b2:	7e 14                	jle    1029c8 <getuint+0x1d>
  1029b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1029b7:	8b 00                	mov    (%eax),%eax
  1029b9:	8d 48 08             	lea    0x8(%eax),%ecx
  1029bc:	8b 55 08             	mov    0x8(%ebp),%edx
  1029bf:	89 0a                	mov    %ecx,(%edx)
  1029c1:	8b 50 04             	mov    0x4(%eax),%edx
  1029c4:	8b 00                	mov    (%eax),%eax
  1029c6:	eb 30                	jmp    1029f8 <getuint+0x4d>
  1029c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1029cc:	74 16                	je     1029e4 <getuint+0x39>
  1029ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1029d1:	8b 00                	mov    (%eax),%eax
  1029d3:	8d 48 04             	lea    0x4(%eax),%ecx
  1029d6:	8b 55 08             	mov    0x8(%ebp),%edx
  1029d9:	89 0a                	mov    %ecx,(%edx)
  1029db:	8b 00                	mov    (%eax),%eax
  1029dd:	ba 00 00 00 00       	mov    $0x0,%edx
  1029e2:	eb 14                	jmp    1029f8 <getuint+0x4d>
  1029e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1029e7:	8b 00                	mov    (%eax),%eax
  1029e9:	8d 48 04             	lea    0x4(%eax),%ecx
  1029ec:	8b 55 08             	mov    0x8(%ebp),%edx
  1029ef:	89 0a                	mov    %ecx,(%edx)
  1029f1:	8b 00                	mov    (%eax),%eax
  1029f3:	ba 00 00 00 00       	mov    $0x0,%edx
  1029f8:	5d                   	pop    %ebp
  1029f9:	c3                   	ret    

001029fa <getint>:
  1029fa:	55                   	push   %ebp
  1029fb:	89 e5                	mov    %esp,%ebp
  1029fd:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102a01:	7e 14                	jle    102a17 <getint+0x1d>
  102a03:	8b 45 08             	mov    0x8(%ebp),%eax
  102a06:	8b 00                	mov    (%eax),%eax
  102a08:	8d 48 08             	lea    0x8(%eax),%ecx
  102a0b:	8b 55 08             	mov    0x8(%ebp),%edx
  102a0e:	89 0a                	mov    %ecx,(%edx)
  102a10:	8b 50 04             	mov    0x4(%eax),%edx
  102a13:	8b 00                	mov    (%eax),%eax
  102a15:	eb 28                	jmp    102a3f <getint+0x45>
  102a17:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102a1b:	74 12                	je     102a2f <getint+0x35>
  102a1d:	8b 45 08             	mov    0x8(%ebp),%eax
  102a20:	8b 00                	mov    (%eax),%eax
  102a22:	8d 48 04             	lea    0x4(%eax),%ecx
  102a25:	8b 55 08             	mov    0x8(%ebp),%edx
  102a28:	89 0a                	mov    %ecx,(%edx)
  102a2a:	8b 00                	mov    (%eax),%eax
  102a2c:	99                   	cltd   
  102a2d:	eb 10                	jmp    102a3f <getint+0x45>
  102a2f:	8b 45 08             	mov    0x8(%ebp),%eax
  102a32:	8b 00                	mov    (%eax),%eax
  102a34:	8d 48 04             	lea    0x4(%eax),%ecx
  102a37:	8b 55 08             	mov    0x8(%ebp),%edx
  102a3a:	89 0a                	mov    %ecx,(%edx)
  102a3c:	8b 00                	mov    (%eax),%eax
  102a3e:	99                   	cltd   
  102a3f:	5d                   	pop    %ebp
  102a40:	c3                   	ret    

00102a41 <vprintfmt>:
  102a41:	55                   	push   %ebp
  102a42:	89 e5                	mov    %esp,%ebp
  102a44:	56                   	push   %esi
  102a45:	53                   	push   %ebx
  102a46:	83 ec 20             	sub    $0x20,%esp
  102a49:	eb 17                	jmp    102a62 <vprintfmt+0x21>
  102a4b:	85 db                	test   %ebx,%ebx
  102a4d:	0f 84 12 03 00 00    	je     102d65 <vprintfmt+0x324>
  102a53:	83 ec 08             	sub    $0x8,%esp
  102a56:	ff 75 0c             	pushl  0xc(%ebp)
  102a59:	53                   	push   %ebx
  102a5a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a5d:	ff d0                	call   *%eax
  102a5f:	83 c4 10             	add    $0x10,%esp
  102a62:	8b 45 10             	mov    0x10(%ebp),%eax
  102a65:	8d 50 01             	lea    0x1(%eax),%edx
  102a68:	89 55 10             	mov    %edx,0x10(%ebp)
  102a6b:	0f b6 00             	movzbl (%eax),%eax
  102a6e:	0f b6 d8             	movzbl %al,%ebx
  102a71:	83 fb 25             	cmp    $0x25,%ebx
  102a74:	75 d5                	jne    102a4b <vprintfmt+0xa>
  102a76:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
  102a7a:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102a81:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  102a88:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  102a8f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102a96:	8b 45 10             	mov    0x10(%ebp),%eax
  102a99:	8d 50 01             	lea    0x1(%eax),%edx
  102a9c:	89 55 10             	mov    %edx,0x10(%ebp)
  102a9f:	0f b6 00             	movzbl (%eax),%eax
  102aa2:	0f b6 d8             	movzbl %al,%ebx
  102aa5:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102aa8:	83 f8 55             	cmp    $0x55,%eax
  102aab:	0f 87 87 02 00 00    	ja     102d38 <vprintfmt+0x2f7>
  102ab1:	8b 04 85 44 5e 10 00 	mov    0x105e44(,%eax,4),%eax
  102ab8:	ff e0                	jmp    *%eax
  102aba:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
  102abe:	eb d6                	jmp    102a96 <vprintfmt+0x55>
  102ac0:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
  102ac4:	eb d0                	jmp    102a96 <vprintfmt+0x55>
  102ac6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  102acd:	8b 55 e0             	mov    -0x20(%ebp),%edx
  102ad0:	89 d0                	mov    %edx,%eax
  102ad2:	c1 e0 02             	shl    $0x2,%eax
  102ad5:	01 d0                	add    %edx,%eax
  102ad7:	01 c0                	add    %eax,%eax
  102ad9:	01 d8                	add    %ebx,%eax
  102adb:	83 e8 30             	sub    $0x30,%eax
  102ade:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102ae1:	8b 45 10             	mov    0x10(%ebp),%eax
  102ae4:	0f b6 00             	movzbl (%eax),%eax
  102ae7:	0f be d8             	movsbl %al,%ebx
  102aea:	83 fb 2f             	cmp    $0x2f,%ebx
  102aed:	7e 39                	jle    102b28 <vprintfmt+0xe7>
  102aef:	83 fb 39             	cmp    $0x39,%ebx
  102af2:	7f 34                	jg     102b28 <vprintfmt+0xe7>
  102af4:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  102af8:	eb d3                	jmp    102acd <vprintfmt+0x8c>
  102afa:	8b 45 14             	mov    0x14(%ebp),%eax
  102afd:	8d 50 04             	lea    0x4(%eax),%edx
  102b00:	89 55 14             	mov    %edx,0x14(%ebp)
  102b03:	8b 00                	mov    (%eax),%eax
  102b05:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102b08:	eb 1f                	jmp    102b29 <vprintfmt+0xe8>
  102b0a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102b0e:	79 86                	jns    102a96 <vprintfmt+0x55>
  102b10:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  102b17:	e9 7a ff ff ff       	jmp    102a96 <vprintfmt+0x55>
  102b1c:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
  102b23:	e9 6e ff ff ff       	jmp    102a96 <vprintfmt+0x55>
  102b28:	90                   	nop
  102b29:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102b2d:	0f 89 63 ff ff ff    	jns    102a96 <vprintfmt+0x55>
  102b33:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b36:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102b39:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  102b40:	e9 51 ff ff ff       	jmp    102a96 <vprintfmt+0x55>
  102b45:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  102b49:	e9 48 ff ff ff       	jmp    102a96 <vprintfmt+0x55>
  102b4e:	8b 45 14             	mov    0x14(%ebp),%eax
  102b51:	8d 50 04             	lea    0x4(%eax),%edx
  102b54:	89 55 14             	mov    %edx,0x14(%ebp)
  102b57:	8b 00                	mov    (%eax),%eax
  102b59:	83 ec 08             	sub    $0x8,%esp
  102b5c:	ff 75 0c             	pushl  0xc(%ebp)
  102b5f:	50                   	push   %eax
  102b60:	8b 45 08             	mov    0x8(%ebp),%eax
  102b63:	ff d0                	call   *%eax
  102b65:	83 c4 10             	add    $0x10,%esp
  102b68:	e9 f3 01 00 00       	jmp    102d60 <vprintfmt+0x31f>
  102b6d:	8b 45 14             	mov    0x14(%ebp),%eax
  102b70:	8d 50 04             	lea    0x4(%eax),%edx
  102b73:	89 55 14             	mov    %edx,0x14(%ebp)
  102b76:	8b 30                	mov    (%eax),%esi
  102b78:	85 f6                	test   %esi,%esi
  102b7a:	75 05                	jne    102b81 <vprintfmt+0x140>
  102b7c:	be 3d 5e 10 00       	mov    $0x105e3d,%esi
  102b81:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102b85:	7e 6f                	jle    102bf6 <vprintfmt+0x1b5>
  102b87:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102b8b:	74 69                	je     102bf6 <vprintfmt+0x1b5>
  102b8d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b90:	83 ec 08             	sub    $0x8,%esp
  102b93:	50                   	push   %eax
  102b94:	56                   	push   %esi
  102b95:	e8 f5 f9 ff ff       	call   10258f <strnlen>
  102b9a:	83 c4 10             	add    $0x10,%esp
  102b9d:	29 45 e4             	sub    %eax,-0x1c(%ebp)
  102ba0:	eb 17                	jmp    102bb9 <vprintfmt+0x178>
  102ba2:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102ba6:	83 ec 08             	sub    $0x8,%esp
  102ba9:	ff 75 0c             	pushl  0xc(%ebp)
  102bac:	50                   	push   %eax
  102bad:	8b 45 08             	mov    0x8(%ebp),%eax
  102bb0:	ff d0                	call   *%eax
  102bb2:	83 c4 10             	add    $0x10,%esp
  102bb5:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102bb9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102bbd:	7f e3                	jg     102ba2 <vprintfmt+0x161>
  102bbf:	eb 35                	jmp    102bf6 <vprintfmt+0x1b5>
  102bc1:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102bc5:	74 1c                	je     102be3 <vprintfmt+0x1a2>
  102bc7:	83 fb 1f             	cmp    $0x1f,%ebx
  102bca:	7e 05                	jle    102bd1 <vprintfmt+0x190>
  102bcc:	83 fb 7e             	cmp    $0x7e,%ebx
  102bcf:	7e 12                	jle    102be3 <vprintfmt+0x1a2>
  102bd1:	83 ec 08             	sub    $0x8,%esp
  102bd4:	ff 75 0c             	pushl  0xc(%ebp)
  102bd7:	6a 3f                	push   $0x3f
  102bd9:	8b 45 08             	mov    0x8(%ebp),%eax
  102bdc:	ff d0                	call   *%eax
  102bde:	83 c4 10             	add    $0x10,%esp
  102be1:	eb 0f                	jmp    102bf2 <vprintfmt+0x1b1>
  102be3:	83 ec 08             	sub    $0x8,%esp
  102be6:	ff 75 0c             	pushl  0xc(%ebp)
  102be9:	53                   	push   %ebx
  102bea:	8b 45 08             	mov    0x8(%ebp),%eax
  102bed:	ff d0                	call   *%eax
  102bef:	83 c4 10             	add    $0x10,%esp
  102bf2:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102bf6:	89 f0                	mov    %esi,%eax
  102bf8:	8d 70 01             	lea    0x1(%eax),%esi
  102bfb:	0f b6 00             	movzbl (%eax),%eax
  102bfe:	0f be d8             	movsbl %al,%ebx
  102c01:	85 db                	test   %ebx,%ebx
  102c03:	74 26                	je     102c2b <vprintfmt+0x1ea>
  102c05:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  102c09:	78 b6                	js     102bc1 <vprintfmt+0x180>
  102c0b:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
  102c0f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  102c13:	79 ac                	jns    102bc1 <vprintfmt+0x180>
  102c15:	eb 14                	jmp    102c2b <vprintfmt+0x1ea>
  102c17:	83 ec 08             	sub    $0x8,%esp
  102c1a:	ff 75 0c             	pushl  0xc(%ebp)
  102c1d:	6a 20                	push   $0x20
  102c1f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c22:	ff d0                	call   *%eax
  102c24:	83 c4 10             	add    $0x10,%esp
  102c27:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102c2b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102c2f:	7f e6                	jg     102c17 <vprintfmt+0x1d6>
  102c31:	e9 2a 01 00 00       	jmp    102d60 <vprintfmt+0x31f>
  102c36:	83 ec 08             	sub    $0x8,%esp
  102c39:	ff 75 e8             	pushl  -0x18(%ebp)
  102c3c:	8d 45 14             	lea    0x14(%ebp),%eax
  102c3f:	50                   	push   %eax
  102c40:	e8 b5 fd ff ff       	call   1029fa <getint>
  102c45:	83 c4 10             	add    $0x10,%esp
  102c48:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c4b:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102c4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c51:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c54:	85 d2                	test   %edx,%edx
  102c56:	79 23                	jns    102c7b <vprintfmt+0x23a>
  102c58:	83 ec 08             	sub    $0x8,%esp
  102c5b:	ff 75 0c             	pushl  0xc(%ebp)
  102c5e:	6a 2d                	push   $0x2d
  102c60:	8b 45 08             	mov    0x8(%ebp),%eax
  102c63:	ff d0                	call   *%eax
  102c65:	83 c4 10             	add    $0x10,%esp
  102c68:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c6b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c6e:	f7 d8                	neg    %eax
  102c70:	83 d2 00             	adc    $0x0,%edx
  102c73:	f7 da                	neg    %edx
  102c75:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c78:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102c7b:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
  102c82:	eb 7e                	jmp    102d02 <vprintfmt+0x2c1>
  102c84:	83 ec 08             	sub    $0x8,%esp
  102c87:	ff 75 e8             	pushl  -0x18(%ebp)
  102c8a:	8d 45 14             	lea    0x14(%ebp),%eax
  102c8d:	50                   	push   %eax
  102c8e:	e8 18 fd ff ff       	call   1029ab <getuint>
  102c93:	83 c4 10             	add    $0x10,%esp
  102c96:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c99:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102c9c:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
  102ca3:	eb 5d                	jmp    102d02 <vprintfmt+0x2c1>
  102ca5:	83 ec 08             	sub    $0x8,%esp
  102ca8:	ff 75 0c             	pushl  0xc(%ebp)
  102cab:	6a 30                	push   $0x30
  102cad:	8b 45 08             	mov    0x8(%ebp),%eax
  102cb0:	ff d0                	call   *%eax
  102cb2:	83 c4 10             	add    $0x10,%esp
  102cb5:	83 ec 08             	sub    $0x8,%esp
  102cb8:	ff 75 0c             	pushl  0xc(%ebp)
  102cbb:	6a 78                	push   $0x78
  102cbd:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc0:	ff d0                	call   *%eax
  102cc2:	83 c4 10             	add    $0x10,%esp
  102cc5:	8b 45 14             	mov    0x14(%ebp),%eax
  102cc8:	8d 50 04             	lea    0x4(%eax),%edx
  102ccb:	89 55 14             	mov    %edx,0x14(%ebp)
  102cce:	8b 00                	mov    (%eax),%eax
  102cd0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102cd3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102cda:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
  102ce1:	eb 1f                	jmp    102d02 <vprintfmt+0x2c1>
  102ce3:	83 ec 08             	sub    $0x8,%esp
  102ce6:	ff 75 e8             	pushl  -0x18(%ebp)
  102ce9:	8d 45 14             	lea    0x14(%ebp),%eax
  102cec:	50                   	push   %eax
  102ced:	e8 b9 fc ff ff       	call   1029ab <getuint>
  102cf2:	83 c4 10             	add    $0x10,%esp
  102cf5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102cf8:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102cfb:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
  102d02:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102d06:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102d09:	83 ec 04             	sub    $0x4,%esp
  102d0c:	52                   	push   %edx
  102d0d:	ff 75 e4             	pushl  -0x1c(%ebp)
  102d10:	50                   	push   %eax
  102d11:	ff 75 f4             	pushl  -0xc(%ebp)
  102d14:	ff 75 f0             	pushl  -0x10(%ebp)
  102d17:	ff 75 0c             	pushl  0xc(%ebp)
  102d1a:	ff 75 08             	pushl  0x8(%ebp)
  102d1d:	e8 d0 fb ff ff       	call   1028f2 <printnum>
  102d22:	83 c4 20             	add    $0x20,%esp
  102d25:	eb 39                	jmp    102d60 <vprintfmt+0x31f>
  102d27:	83 ec 08             	sub    $0x8,%esp
  102d2a:	ff 75 0c             	pushl  0xc(%ebp)
  102d2d:	53                   	push   %ebx
  102d2e:	8b 45 08             	mov    0x8(%ebp),%eax
  102d31:	ff d0                	call   *%eax
  102d33:	83 c4 10             	add    $0x10,%esp
  102d36:	eb 28                	jmp    102d60 <vprintfmt+0x31f>
  102d38:	83 ec 08             	sub    $0x8,%esp
  102d3b:	ff 75 0c             	pushl  0xc(%ebp)
  102d3e:	6a 25                	push   $0x25
  102d40:	8b 45 08             	mov    0x8(%ebp),%eax
  102d43:	ff d0                	call   *%eax
  102d45:	83 c4 10             	add    $0x10,%esp
  102d48:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102d4c:	eb 04                	jmp    102d52 <vprintfmt+0x311>
  102d4e:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102d52:	8b 45 10             	mov    0x10(%ebp),%eax
  102d55:	83 e8 01             	sub    $0x1,%eax
  102d58:	0f b6 00             	movzbl (%eax),%eax
  102d5b:	3c 25                	cmp    $0x25,%al
  102d5d:	75 ef                	jne    102d4e <vprintfmt+0x30d>
  102d5f:	90                   	nop
  102d60:	e9 fd fc ff ff       	jmp    102a62 <vprintfmt+0x21>
  102d65:	90                   	nop
  102d66:	8d 65 f8             	lea    -0x8(%ebp),%esp
  102d69:	5b                   	pop    %ebx
  102d6a:	5e                   	pop    %esi
  102d6b:	5d                   	pop    %ebp
  102d6c:	c3                   	ret    

00102d6d <seg_init>:
  102d6d:	55                   	push   %ebp
  102d6e:	89 e5                	mov    %esp,%ebp
  102d70:	83 ec 18             	sub    $0x18,%esp
  102d73:	ba 00 10 91 00       	mov    $0x911000,%edx
  102d78:	b8 08 e7 10 00       	mov    $0x10e708,%eax
  102d7d:	29 c2                	sub    %eax,%edx
  102d7f:	89 d0                	mov    %edx,%eax
  102d81:	83 ec 08             	sub    $0x8,%esp
  102d84:	50                   	push   %eax
  102d85:	68 08 e7 10 00       	push   $0x10e708
  102d8a:	e8 a2 f8 ff ff       	call   102631 <memzero>
  102d8f:	83 c4 10             	add    $0x10,%esp
  102d92:	b8 00 60 d9 00       	mov    $0xd96000,%eax
  102d97:	2d 00 10 00 00       	sub    $0x1000,%eax
  102d9c:	ba 00 10 91 00       	mov    $0x911000,%edx
  102da1:	29 d0                	sub    %edx,%eax
  102da3:	89 c2                	mov    %eax,%edx
  102da5:	b8 00 20 91 00       	mov    $0x912000,%eax
  102daa:	83 ec 08             	sub    $0x8,%esp
  102dad:	52                   	push   %edx
  102dae:	50                   	push   %eax
  102daf:	e8 7d f8 ff ff       	call   102631 <memzero>
  102db4:	83 c4 10             	add    $0x10,%esp
  102db7:	c7 05 00 20 95 00 00 	movl   $0x0,0x952000
  102dbe:	00 00 00 
  102dc1:	c7 05 04 20 95 00 00 	movl   $0x0,0x952004
  102dc8:	00 00 00 
  102dcb:	66 c7 05 08 20 95 00 	movw   $0xffff,0x952008
  102dd2:	ff ff 
  102dd4:	66 c7 05 0a 20 95 00 	movw   $0x0,0x95200a
  102ddb:	00 00 
  102ddd:	c6 05 0c 20 95 00 00 	movb   $0x0,0x95200c
  102de4:	0f b6 05 0d 20 95 00 	movzbl 0x95200d,%eax
  102deb:	83 e0 f0             	and    $0xfffffff0,%eax
  102dee:	83 c8 0a             	or     $0xa,%eax
  102df1:	a2 0d 20 95 00       	mov    %al,0x95200d
  102df6:	0f b6 05 0d 20 95 00 	movzbl 0x95200d,%eax
  102dfd:	83 c8 10             	or     $0x10,%eax
  102e00:	a2 0d 20 95 00       	mov    %al,0x95200d
  102e05:	0f b6 05 0d 20 95 00 	movzbl 0x95200d,%eax
  102e0c:	83 e0 9f             	and    $0xffffff9f,%eax
  102e0f:	a2 0d 20 95 00       	mov    %al,0x95200d
  102e14:	0f b6 05 0d 20 95 00 	movzbl 0x95200d,%eax
  102e1b:	83 c8 80             	or     $0xffffff80,%eax
  102e1e:	a2 0d 20 95 00       	mov    %al,0x95200d
  102e23:	0f b6 05 0e 20 95 00 	movzbl 0x95200e,%eax
  102e2a:	83 c8 0f             	or     $0xf,%eax
  102e2d:	a2 0e 20 95 00       	mov    %al,0x95200e
  102e32:	0f b6 05 0e 20 95 00 	movzbl 0x95200e,%eax
  102e39:	83 e0 ef             	and    $0xffffffef,%eax
  102e3c:	a2 0e 20 95 00       	mov    %al,0x95200e
  102e41:	0f b6 05 0e 20 95 00 	movzbl 0x95200e,%eax
  102e48:	83 e0 df             	and    $0xffffffdf,%eax
  102e4b:	a2 0e 20 95 00       	mov    %al,0x95200e
  102e50:	0f b6 05 0e 20 95 00 	movzbl 0x95200e,%eax
  102e57:	83 c8 40             	or     $0x40,%eax
  102e5a:	a2 0e 20 95 00       	mov    %al,0x95200e
  102e5f:	0f b6 05 0e 20 95 00 	movzbl 0x95200e,%eax
  102e66:	83 c8 80             	or     $0xffffff80,%eax
  102e69:	a2 0e 20 95 00       	mov    %al,0x95200e
  102e6e:	c6 05 0f 20 95 00 00 	movb   $0x0,0x95200f
  102e75:	66 c7 05 10 20 95 00 	movw   $0xffff,0x952010
  102e7c:	ff ff 
  102e7e:	66 c7 05 12 20 95 00 	movw   $0x0,0x952012
  102e85:	00 00 
  102e87:	c6 05 14 20 95 00 00 	movb   $0x0,0x952014
  102e8e:	0f b6 05 15 20 95 00 	movzbl 0x952015,%eax
  102e95:	83 e0 f0             	and    $0xfffffff0,%eax
  102e98:	83 c8 02             	or     $0x2,%eax
  102e9b:	a2 15 20 95 00       	mov    %al,0x952015
  102ea0:	0f b6 05 15 20 95 00 	movzbl 0x952015,%eax
  102ea7:	83 c8 10             	or     $0x10,%eax
  102eaa:	a2 15 20 95 00       	mov    %al,0x952015
  102eaf:	0f b6 05 15 20 95 00 	movzbl 0x952015,%eax
  102eb6:	83 e0 9f             	and    $0xffffff9f,%eax
  102eb9:	a2 15 20 95 00       	mov    %al,0x952015
  102ebe:	0f b6 05 15 20 95 00 	movzbl 0x952015,%eax
  102ec5:	83 c8 80             	or     $0xffffff80,%eax
  102ec8:	a2 15 20 95 00       	mov    %al,0x952015
  102ecd:	0f b6 05 16 20 95 00 	movzbl 0x952016,%eax
  102ed4:	83 c8 0f             	or     $0xf,%eax
  102ed7:	a2 16 20 95 00       	mov    %al,0x952016
  102edc:	0f b6 05 16 20 95 00 	movzbl 0x952016,%eax
  102ee3:	83 e0 ef             	and    $0xffffffef,%eax
  102ee6:	a2 16 20 95 00       	mov    %al,0x952016
  102eeb:	0f b6 05 16 20 95 00 	movzbl 0x952016,%eax
  102ef2:	83 e0 df             	and    $0xffffffdf,%eax
  102ef5:	a2 16 20 95 00       	mov    %al,0x952016
  102efa:	0f b6 05 16 20 95 00 	movzbl 0x952016,%eax
  102f01:	83 c8 40             	or     $0x40,%eax
  102f04:	a2 16 20 95 00       	mov    %al,0x952016
  102f09:	0f b6 05 16 20 95 00 	movzbl 0x952016,%eax
  102f10:	83 c8 80             	or     $0xffffff80,%eax
  102f13:	a2 16 20 95 00       	mov    %al,0x952016
  102f18:	c6 05 17 20 95 00 00 	movb   $0x0,0x952017
  102f1f:	66 c7 05 18 20 95 00 	movw   $0xffff,0x952018
  102f26:	ff ff 
  102f28:	66 c7 05 1a 20 95 00 	movw   $0x0,0x95201a
  102f2f:	00 00 
  102f31:	c6 05 1c 20 95 00 00 	movb   $0x0,0x95201c
  102f38:	0f b6 05 1d 20 95 00 	movzbl 0x95201d,%eax
  102f3f:	83 e0 f0             	and    $0xfffffff0,%eax
  102f42:	83 c8 0a             	or     $0xa,%eax
  102f45:	a2 1d 20 95 00       	mov    %al,0x95201d
  102f4a:	0f b6 05 1d 20 95 00 	movzbl 0x95201d,%eax
  102f51:	83 c8 10             	or     $0x10,%eax
  102f54:	a2 1d 20 95 00       	mov    %al,0x95201d
  102f59:	0f b6 05 1d 20 95 00 	movzbl 0x95201d,%eax
  102f60:	83 c8 60             	or     $0x60,%eax
  102f63:	a2 1d 20 95 00       	mov    %al,0x95201d
  102f68:	0f b6 05 1d 20 95 00 	movzbl 0x95201d,%eax
  102f6f:	83 c8 80             	or     $0xffffff80,%eax
  102f72:	a2 1d 20 95 00       	mov    %al,0x95201d
  102f77:	0f b6 05 1e 20 95 00 	movzbl 0x95201e,%eax
  102f7e:	83 c8 0f             	or     $0xf,%eax
  102f81:	a2 1e 20 95 00       	mov    %al,0x95201e
  102f86:	0f b6 05 1e 20 95 00 	movzbl 0x95201e,%eax
  102f8d:	83 e0 ef             	and    $0xffffffef,%eax
  102f90:	a2 1e 20 95 00       	mov    %al,0x95201e
  102f95:	0f b6 05 1e 20 95 00 	movzbl 0x95201e,%eax
  102f9c:	83 e0 df             	and    $0xffffffdf,%eax
  102f9f:	a2 1e 20 95 00       	mov    %al,0x95201e
  102fa4:	0f b6 05 1e 20 95 00 	movzbl 0x95201e,%eax
  102fab:	83 c8 40             	or     $0x40,%eax
  102fae:	a2 1e 20 95 00       	mov    %al,0x95201e
  102fb3:	0f b6 05 1e 20 95 00 	movzbl 0x95201e,%eax
  102fba:	83 c8 80             	or     $0xffffff80,%eax
  102fbd:	a2 1e 20 95 00       	mov    %al,0x95201e
  102fc2:	c6 05 1f 20 95 00 00 	movb   $0x0,0x95201f
  102fc9:	66 c7 05 20 20 95 00 	movw   $0xffff,0x952020
  102fd0:	ff ff 
  102fd2:	66 c7 05 22 20 95 00 	movw   $0x0,0x952022
  102fd9:	00 00 
  102fdb:	c6 05 24 20 95 00 00 	movb   $0x0,0x952024
  102fe2:	0f b6 05 25 20 95 00 	movzbl 0x952025,%eax
  102fe9:	83 e0 f0             	and    $0xfffffff0,%eax
  102fec:	83 c8 02             	or     $0x2,%eax
  102fef:	a2 25 20 95 00       	mov    %al,0x952025
  102ff4:	0f b6 05 25 20 95 00 	movzbl 0x952025,%eax
  102ffb:	83 c8 10             	or     $0x10,%eax
  102ffe:	a2 25 20 95 00       	mov    %al,0x952025
  103003:	0f b6 05 25 20 95 00 	movzbl 0x952025,%eax
  10300a:	83 c8 60             	or     $0x60,%eax
  10300d:	a2 25 20 95 00       	mov    %al,0x952025
  103012:	0f b6 05 25 20 95 00 	movzbl 0x952025,%eax
  103019:	83 c8 80             	or     $0xffffff80,%eax
  10301c:	a2 25 20 95 00       	mov    %al,0x952025
  103021:	0f b6 05 26 20 95 00 	movzbl 0x952026,%eax
  103028:	83 c8 0f             	or     $0xf,%eax
  10302b:	a2 26 20 95 00       	mov    %al,0x952026
  103030:	0f b6 05 26 20 95 00 	movzbl 0x952026,%eax
  103037:	83 e0 ef             	and    $0xffffffef,%eax
  10303a:	a2 26 20 95 00       	mov    %al,0x952026
  10303f:	0f b6 05 26 20 95 00 	movzbl 0x952026,%eax
  103046:	83 e0 df             	and    $0xffffffdf,%eax
  103049:	a2 26 20 95 00       	mov    %al,0x952026
  10304e:	0f b6 05 26 20 95 00 	movzbl 0x952026,%eax
  103055:	83 c8 40             	or     $0x40,%eax
  103058:	a2 26 20 95 00       	mov    %al,0x952026
  10305d:	0f b6 05 26 20 95 00 	movzbl 0x952026,%eax
  103064:	83 c8 80             	or     $0xffffff80,%eax
  103067:	a2 26 20 95 00       	mov    %al,0x952026
  10306c:	c6 05 27 20 95 00 00 	movb   $0x0,0x952027
  103073:	b8 00 10 91 00       	mov    $0x911000,%eax
  103078:	05 00 10 00 00       	add    $0x1000,%eax
  10307d:	a3 64 fe 10 00       	mov    %eax,0x10fe64
  103082:	66 c7 05 68 fe 10 00 	movw   $0x10,0x10fe68
  103089:	10 00 
  10308b:	66 c7 05 28 20 95 00 	movw   $0xeb,0x952028
  103092:	eb 00 
  103094:	b8 60 fe 10 00       	mov    $0x10fe60,%eax
  103099:	66 a3 2a 20 95 00    	mov    %ax,0x95202a
  10309f:	b8 60 fe 10 00       	mov    $0x10fe60,%eax
  1030a4:	c1 e8 10             	shr    $0x10,%eax
  1030a7:	a2 2c 20 95 00       	mov    %al,0x95202c
  1030ac:	0f b6 05 2d 20 95 00 	movzbl 0x95202d,%eax
  1030b3:	83 e0 f0             	and    $0xfffffff0,%eax
  1030b6:	83 c8 09             	or     $0x9,%eax
  1030b9:	a2 2d 20 95 00       	mov    %al,0x95202d
  1030be:	0f b6 05 2d 20 95 00 	movzbl 0x95202d,%eax
  1030c5:	83 c8 10             	or     $0x10,%eax
  1030c8:	a2 2d 20 95 00       	mov    %al,0x95202d
  1030cd:	0f b6 05 2d 20 95 00 	movzbl 0x95202d,%eax
  1030d4:	83 e0 9f             	and    $0xffffff9f,%eax
  1030d7:	a2 2d 20 95 00       	mov    %al,0x95202d
  1030dc:	0f b6 05 2d 20 95 00 	movzbl 0x95202d,%eax
  1030e3:	83 c8 80             	or     $0xffffff80,%eax
  1030e6:	a2 2d 20 95 00       	mov    %al,0x95202d
  1030eb:	0f b6 05 2e 20 95 00 	movzbl 0x95202e,%eax
  1030f2:	83 e0 f0             	and    $0xfffffff0,%eax
  1030f5:	a2 2e 20 95 00       	mov    %al,0x95202e
  1030fa:	0f b6 05 2e 20 95 00 	movzbl 0x95202e,%eax
  103101:	83 e0 ef             	and    $0xffffffef,%eax
  103104:	a2 2e 20 95 00       	mov    %al,0x95202e
  103109:	0f b6 05 2e 20 95 00 	movzbl 0x95202e,%eax
  103110:	83 e0 df             	and    $0xffffffdf,%eax
  103113:	a2 2e 20 95 00       	mov    %al,0x95202e
  103118:	0f b6 05 2e 20 95 00 	movzbl 0x95202e,%eax
  10311f:	83 c8 40             	or     $0x40,%eax
  103122:	a2 2e 20 95 00       	mov    %al,0x95202e
  103127:	0f b6 05 2e 20 95 00 	movzbl 0x95202e,%eax
  10312e:	83 e0 7f             	and    $0x7f,%eax
  103131:	a2 2e 20 95 00       	mov    %al,0x95202e
  103136:	b8 60 fe 10 00       	mov    $0x10fe60,%eax
  10313b:	c1 e8 18             	shr    $0x18,%eax
  10313e:	a2 2f 20 95 00       	mov    %al,0x95202f
  103143:	0f b6 05 2d 20 95 00 	movzbl 0x95202d,%eax
  10314a:	83 e0 ef             	and    $0xffffffef,%eax
  10314d:	a2 2d 20 95 00       	mov    %al,0x95202d
  103152:	66 c7 45 ee 2f 00    	movw   $0x2f,-0x12(%ebp)
  103158:	b8 00 20 95 00       	mov    $0x952000,%eax
  10315d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103160:	0f 01 55 ee          	lgdtl  -0x12(%ebp)
  103164:	b8 10 00 00 00       	mov    $0x10,%eax
  103169:	8e e8                	mov    %eax,%gs
  10316b:	b8 10 00 00 00       	mov    $0x10,%eax
  103170:	8e e0                	mov    %eax,%fs
  103172:	b8 10 00 00 00       	mov    $0x10,%eax
  103177:	8e c0                	mov    %eax,%es
  103179:	b8 10 00 00 00       	mov    $0x10,%eax
  10317e:	8e d8                	mov    %eax,%ds
  103180:	b8 10 00 00 00       	mov    $0x10,%eax
  103185:	8e d0                	mov    %eax,%ss
  103187:	ea 8e 31 10 00 08 00 	ljmp   $0x8,$0x10318e
  10318e:	83 ec 0c             	sub    $0xc,%esp
  103191:	6a 00                	push   $0x0
  103193:	e8 2a 01 00 00       	call   1032c2 <lldt>
  103198:	83 c4 10             	add    $0x10,%esp
  10319b:	83 ec 0c             	sub    $0xc,%esp
  10319e:	6a 28                	push   $0x28
  1031a0:	e8 67 02 00 00       	call   10340c <ltr>
  1031a5:	83 c4 10             	add    $0x10,%esp
  1031a8:	0f 01 1d 10 a5 10 00 	lidtl  0x10a510
  1031af:	83 ec 08             	sub    $0x8,%esp
  1031b2:	68 00 3b 00 00       	push   $0x3b00
  1031b7:	68 40 20 95 00       	push   $0x952040
  1031bc:	e8 70 f4 ff ff       	call   102631 <memzero>
  1031c1:	83 c4 10             	add    $0x10,%esp
  1031c4:	83 ec 08             	sub    $0x8,%esp
  1031c7:	68 00 00 04 00       	push   $0x40000
  1031cc:	68 00 20 91 00       	push   $0x912000
  1031d1:	e8 5b f4 ff ff       	call   102631 <memzero>
  1031d6:	83 c4 10             	add    $0x10,%esp
  1031d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1031e0:	e9 81 00 00 00       	jmp    103266 <seg_init+0x4f9>
  1031e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1031e8:	c1 e0 0c             	shl    $0xc,%eax
  1031eb:	05 00 20 91 00       	add    $0x912000,%eax
  1031f0:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
  1031f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1031f9:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  1031ff:	05 44 20 95 00       	add    $0x952044,%eax
  103204:	89 10                	mov    %edx,(%eax)
  103206:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103209:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  10320f:	05 48 20 95 00       	add    $0x952048,%eax
  103214:	66 c7 00 10 00       	movw   $0x10,(%eax)
  103219:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10321c:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103222:	05 a6 20 95 00       	add    $0x9520a6,%eax
  103227:	66 c7 00 68 00       	movw   $0x68,(%eax)
  10322c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10322f:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103235:	83 c0 60             	add    $0x60,%eax
  103238:	05 40 20 95 00       	add    $0x952040,%eax
  10323d:	83 c0 08             	add    $0x8,%eax
  103240:	83 ec 08             	sub    $0x8,%esp
  103243:	68 80 00 00 00       	push   $0x80
  103248:	50                   	push   %eax
  103249:	e8 e3 f3 ff ff       	call   102631 <memzero>
  10324e:	83 c4 10             	add    $0x10,%esp
  103251:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103254:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  10325a:	05 28 21 95 00       	add    $0x952128,%eax
  10325f:	c6 00 ff             	movb   $0xff,(%eax)
  103262:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103266:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
  10326a:	0f 86 75 ff ff ff    	jbe    1031e5 <seg_init+0x478>
  103270:	90                   	nop
  103271:	c9                   	leave  
  103272:	c3                   	ret    

00103273 <max>:
  103273:	55                   	push   %ebp
  103274:	89 e5                	mov    %esp,%ebp
  103276:	8b 45 08             	mov    0x8(%ebp),%eax
  103279:	39 45 0c             	cmp    %eax,0xc(%ebp)
  10327c:	0f 43 45 0c          	cmovae 0xc(%ebp),%eax
  103280:	5d                   	pop    %ebp
  103281:	c3                   	ret    

00103282 <min>:
  103282:	55                   	push   %ebp
  103283:	89 e5                	mov    %esp,%ebp
  103285:	8b 45 08             	mov    0x8(%ebp),%eax
  103288:	39 45 0c             	cmp    %eax,0xc(%ebp)
  10328b:	0f 46 45 0c          	cmovbe 0xc(%ebp),%eax
  10328f:	5d                   	pop    %ebp
  103290:	c3                   	ret    

00103291 <rounddown>:
  103291:	55                   	push   %ebp
  103292:	89 e5                	mov    %esp,%ebp
  103294:	8b 45 08             	mov    0x8(%ebp),%eax
  103297:	ba 00 00 00 00       	mov    $0x0,%edx
  10329c:	f7 75 0c             	divl   0xc(%ebp)
  10329f:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a2:	29 d0                	sub    %edx,%eax
  1032a4:	5d                   	pop    %ebp
  1032a5:	c3                   	ret    

001032a6 <roundup>:
  1032a6:	55                   	push   %ebp
  1032a7:	89 e5                	mov    %esp,%ebp
  1032a9:	8b 55 08             	mov    0x8(%ebp),%edx
  1032ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032af:	01 d0                	add    %edx,%eax
  1032b1:	83 e8 01             	sub    $0x1,%eax
  1032b4:	ff 75 0c             	pushl  0xc(%ebp)
  1032b7:	50                   	push   %eax
  1032b8:	e8 d4 ff ff ff       	call   103291 <rounddown>
  1032bd:	83 c4 08             	add    $0x8,%esp
  1032c0:	c9                   	leave  
  1032c1:	c3                   	ret    

001032c2 <lldt>:
  1032c2:	55                   	push   %ebp
  1032c3:	89 e5                	mov    %esp,%ebp
  1032c5:	83 ec 04             	sub    $0x4,%esp
  1032c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1032cb:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  1032cf:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  1032d3:	0f 00 d0             	lldt   %ax
  1032d6:	90                   	nop
  1032d7:	c9                   	leave  
  1032d8:	c3                   	ret    

001032d9 <cli>:
  1032d9:	55                   	push   %ebp
  1032da:	89 e5                	mov    %esp,%ebp
  1032dc:	fa                   	cli    
  1032dd:	90                   	nop
  1032de:	5d                   	pop    %ebp
  1032df:	c3                   	ret    

001032e0 <sti>:
  1032e0:	55                   	push   %ebp
  1032e1:	89 e5                	mov    %esp,%ebp
  1032e3:	fb                   	sti    
  1032e4:	90                   	nop
  1032e5:	90                   	nop
  1032e6:	5d                   	pop    %ebp
  1032e7:	c3                   	ret    

001032e8 <rdmsr>:
  1032e8:	55                   	push   %ebp
  1032e9:	89 e5                	mov    %esp,%ebp
  1032eb:	83 ec 10             	sub    $0x10,%esp
  1032ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f1:	89 c1                	mov    %eax,%ecx
  1032f3:	0f 32                	rdmsr  
  1032f5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1032f8:	89 55 fc             	mov    %edx,-0x4(%ebp)
  1032fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1032fe:	8b 55 fc             	mov    -0x4(%ebp),%edx
  103301:	c9                   	leave  
  103302:	c3                   	ret    

00103303 <wrmsr>:
  103303:	55                   	push   %ebp
  103304:	89 e5                	mov    %esp,%ebp
  103306:	83 ec 08             	sub    $0x8,%esp
  103309:	8b 45 0c             	mov    0xc(%ebp),%eax
  10330c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10330f:	8b 45 10             	mov    0x10(%ebp),%eax
  103312:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103315:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103318:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10331b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10331e:	0f 30                	wrmsr  
  103320:	90                   	nop
  103321:	c9                   	leave  
  103322:	c3                   	ret    

00103323 <halt>:
  103323:	55                   	push   %ebp
  103324:	89 e5                	mov    %esp,%ebp
  103326:	f4                   	hlt    
  103327:	90                   	nop
  103328:	5d                   	pop    %ebp
  103329:	c3                   	ret    

0010332a <rdtsc>:
  10332a:	55                   	push   %ebp
  10332b:	89 e5                	mov    %esp,%ebp
  10332d:	83 ec 10             	sub    $0x10,%esp
  103330:	0f 31                	rdtsc  
  103332:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103335:	89 55 fc             	mov    %edx,-0x4(%ebp)
  103338:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10333b:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10333e:	c9                   	leave  
  10333f:	c3                   	ret    

00103340 <enable_sse>:
  103340:	55                   	push   %ebp
  103341:	89 e5                	mov    %esp,%ebp
  103343:	83 ec 20             	sub    $0x20,%esp
  103346:	0f 20 e0             	mov    %cr4,%eax
  103349:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10334c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10334f:	80 cc 06             	or     $0x6,%ah
  103352:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103355:	0f ae f0             	mfence 
  103358:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10335b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10335e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103361:	0f 22 e0             	mov    %eax,%cr4
  103364:	0f 20 c0             	mov    %cr0,%eax
  103367:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10336a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10336d:	83 c8 02             	or     $0x2,%eax
  103370:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103373:	0f ae f0             	mfence 
  103376:	83 65 f8 f3          	andl   $0xfffffff3,-0x8(%ebp)
  10337a:	90                   	nop
  10337b:	c9                   	leave  
  10337c:	c3                   	ret    

0010337d <cpuid>:
  10337d:	55                   	push   %ebp
  10337e:	89 e5                	mov    %esp,%ebp
  103380:	53                   	push   %ebx
  103381:	83 ec 10             	sub    $0x10,%esp
  103384:	8b 45 08             	mov    0x8(%ebp),%eax
  103387:	0f a2                	cpuid  
  103389:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10338c:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  10338f:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  103392:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103395:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103399:	74 08                	je     1033a3 <cpuid+0x26>
  10339b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10339e:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1033a1:	89 10                	mov    %edx,(%eax)
  1033a3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1033a7:	74 08                	je     1033b1 <cpuid+0x34>
  1033a9:	8b 45 10             	mov    0x10(%ebp),%eax
  1033ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033af:	89 10                	mov    %edx,(%eax)
  1033b1:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  1033b5:	74 08                	je     1033bf <cpuid+0x42>
  1033b7:	8b 45 14             	mov    0x14(%ebp),%eax
  1033ba:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1033bd:	89 10                	mov    %edx,(%eax)
  1033bf:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
  1033c3:	74 08                	je     1033cd <cpuid+0x50>
  1033c5:	8b 45 18             	mov    0x18(%ebp),%eax
  1033c8:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1033cb:	89 10                	mov    %edx,(%eax)
  1033cd:	90                   	nop
  1033ce:	83 c4 10             	add    $0x10,%esp
  1033d1:	5b                   	pop    %ebx
  1033d2:	5d                   	pop    %ebp
  1033d3:	c3                   	ret    

001033d4 <rcr3>:
  1033d4:	55                   	push   %ebp
  1033d5:	89 e5                	mov    %esp,%ebp
  1033d7:	83 ec 10             	sub    $0x10,%esp
  1033da:	0f 20 d8             	mov    %cr3,%eax
  1033dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1033e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1033e3:	c9                   	leave  
  1033e4:	c3                   	ret    

001033e5 <outl>:
  1033e5:	55                   	push   %ebp
  1033e6:	89 e5                	mov    %esp,%ebp
  1033e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033eb:	8b 55 08             	mov    0x8(%ebp),%edx
  1033ee:	ef                   	out    %eax,(%dx)
  1033ef:	90                   	nop
  1033f0:	5d                   	pop    %ebp
  1033f1:	c3                   	ret    

001033f2 <inl>:
  1033f2:	55                   	push   %ebp
  1033f3:	89 e5                	mov    %esp,%ebp
  1033f5:	83 ec 10             	sub    $0x10,%esp
  1033f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1033fb:	89 c2                	mov    %eax,%edx
  1033fd:	ed                   	in     (%dx),%eax
  1033fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103401:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103404:	c9                   	leave  
  103405:	c3                   	ret    

00103406 <smp_wmb>:
  103406:	55                   	push   %ebp
  103407:	89 e5                	mov    %esp,%ebp
  103409:	90                   	nop
  10340a:	5d                   	pop    %ebp
  10340b:	c3                   	ret    

0010340c <ltr>:
  10340c:	55                   	push   %ebp
  10340d:	89 e5                	mov    %esp,%ebp
  10340f:	83 ec 04             	sub    $0x4,%esp
  103412:	8b 45 08             	mov    0x8(%ebp),%eax
  103415:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  103419:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  10341d:	0f 00 d8             	ltr    %ax
  103420:	90                   	nop
  103421:	c9                   	leave  
  103422:	c3                   	ret    

00103423 <lcr0>:
  103423:	55                   	push   %ebp
  103424:	89 e5                	mov    %esp,%ebp
  103426:	8b 45 08             	mov    0x8(%ebp),%eax
  103429:	0f 22 c0             	mov    %eax,%cr0
  10342c:	90                   	nop
  10342d:	5d                   	pop    %ebp
  10342e:	c3                   	ret    

0010342f <rcr0>:
  10342f:	55                   	push   %ebp
  103430:	89 e5                	mov    %esp,%ebp
  103432:	83 ec 10             	sub    $0x10,%esp
  103435:	0f 20 c0             	mov    %cr0,%eax
  103438:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10343b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10343e:	c9                   	leave  
  10343f:	c3                   	ret    

00103440 <rcr2>:
  103440:	55                   	push   %ebp
  103441:	89 e5                	mov    %esp,%ebp
  103443:	83 ec 10             	sub    $0x10,%esp
  103446:	0f 20 d0             	mov    %cr2,%eax
  103449:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10344c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10344f:	c9                   	leave  
  103450:	c3                   	ret    

00103451 <lcr3>:
  103451:	55                   	push   %ebp
  103452:	89 e5                	mov    %esp,%ebp
  103454:	8b 45 08             	mov    0x8(%ebp),%eax
  103457:	0f 22 d8             	mov    %eax,%cr3
  10345a:	90                   	nop
  10345b:	5d                   	pop    %ebp
  10345c:	c3                   	ret    

0010345d <lcr4>:
  10345d:	55                   	push   %ebp
  10345e:	89 e5                	mov    %esp,%ebp
  103460:	8b 45 08             	mov    0x8(%ebp),%eax
  103463:	0f 22 e0             	mov    %eax,%cr4
  103466:	90                   	nop
  103467:	5d                   	pop    %ebp
  103468:	c3                   	ret    

00103469 <rcr4>:
  103469:	55                   	push   %ebp
  10346a:	89 e5                	mov    %esp,%ebp
  10346c:	83 ec 10             	sub    $0x10,%esp
  10346f:	0f 20 e0             	mov    %cr4,%eax
  103472:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103475:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103478:	c9                   	leave  
  103479:	c3                   	ret    

0010347a <inb>:
  10347a:	55                   	push   %ebp
  10347b:	89 e5                	mov    %esp,%ebp
  10347d:	83 ec 10             	sub    $0x10,%esp
  103480:	8b 45 08             	mov    0x8(%ebp),%eax
  103483:	89 c2                	mov    %eax,%edx
  103485:	ec                   	in     (%dx),%al
  103486:	88 45 ff             	mov    %al,-0x1(%ebp)
  103489:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  10348d:	c9                   	leave  
  10348e:	c3                   	ret    

0010348f <insl>:
  10348f:	55                   	push   %ebp
  103490:	89 e5                	mov    %esp,%ebp
  103492:	57                   	push   %edi
  103493:	53                   	push   %ebx
  103494:	8b 55 08             	mov    0x8(%ebp),%edx
  103497:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10349a:	8b 45 10             	mov    0x10(%ebp),%eax
  10349d:	89 cb                	mov    %ecx,%ebx
  10349f:	89 df                	mov    %ebx,%edi
  1034a1:	89 c1                	mov    %eax,%ecx
  1034a3:	fc                   	cld    
  1034a4:	f2 6d                	repnz insl (%dx),%es:(%edi)
  1034a6:	89 c8                	mov    %ecx,%eax
  1034a8:	89 fb                	mov    %edi,%ebx
  1034aa:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  1034ad:	89 45 10             	mov    %eax,0x10(%ebp)
  1034b0:	90                   	nop
  1034b1:	5b                   	pop    %ebx
  1034b2:	5f                   	pop    %edi
  1034b3:	5d                   	pop    %ebp
  1034b4:	c3                   	ret    

001034b5 <outb>:
  1034b5:	55                   	push   %ebp
  1034b6:	89 e5                	mov    %esp,%ebp
  1034b8:	83 ec 04             	sub    $0x4,%esp
  1034bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034be:	88 45 fc             	mov    %al,-0x4(%ebp)
  1034c1:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  1034c5:	8b 55 08             	mov    0x8(%ebp),%edx
  1034c8:	ee                   	out    %al,(%dx)
  1034c9:	90                   	nop
  1034ca:	c9                   	leave  
  1034cb:	c3                   	ret    

001034cc <outsw>:
  1034cc:	55                   	push   %ebp
  1034cd:	89 e5                	mov    %esp,%ebp
  1034cf:	56                   	push   %esi
  1034d0:	53                   	push   %ebx
  1034d1:	8b 55 08             	mov    0x8(%ebp),%edx
  1034d4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1034d7:	8b 45 10             	mov    0x10(%ebp),%eax
  1034da:	89 cb                	mov    %ecx,%ebx
  1034dc:	89 de                	mov    %ebx,%esi
  1034de:	89 c1                	mov    %eax,%ecx
  1034e0:	fc                   	cld    
  1034e1:	f2 66 6f             	repnz outsw %ds:(%esi),(%dx)
  1034e4:	89 c8                	mov    %ecx,%eax
  1034e6:	89 f3                	mov    %esi,%ebx
  1034e8:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  1034eb:	89 45 10             	mov    %eax,0x10(%ebp)
  1034ee:	90                   	nop
  1034ef:	5b                   	pop    %ebx
  1034f0:	5e                   	pop    %esi
  1034f1:	5d                   	pop    %ebp
  1034f2:	c3                   	ret    

001034f3 <mon_start_user>:
  1034f3:	55                   	push   %ebp
  1034f4:	89 e5                	mov    %esp,%ebp
  1034f6:	83 ec 18             	sub    $0x18,%esp
  1034f9:	a1 4c ff 10 00       	mov    0x10ff4c,%eax
  1034fe:	85 c0                	test   %eax,%eax
  103500:	74 17                	je     103519 <mon_start_user+0x26>
  103502:	83 ec 0c             	sub    $0xc,%esp
  103505:	68 10 60 10 00       	push   $0x106010
  10350a:	e8 bd f3 ff ff       	call   1028cc <dprintf>
  10350f:	83 c4 10             	add    $0x10,%esp
  103512:	b8 00 00 00 00       	mov    $0x0,%eax
  103517:	eb 71                	jmp    10358a <mon_start_user+0x97>
  103519:	c7 45 f4 00 c0 10 00 	movl   $0x10c000,-0xc(%ebp)
  103520:	83 ec 08             	sub    $0x8,%esp
  103523:	68 00 00 10 00       	push   $0x100000
  103528:	6a 00                	push   $0x0
  10352a:	e8 51 24 00 00       	call   105980 <alloc_mem_quota>
  10352f:	83 c4 10             	add    $0x10,%esp
  103532:	a3 4c ff 10 00       	mov    %eax,0x10ff4c
  103537:	a1 4c ff 10 00       	mov    0x10ff4c,%eax
  10353c:	83 ec 08             	sub    $0x8,%esp
  10353f:	50                   	push   %eax
  103540:	ff 75 f4             	pushl  -0xc(%ebp)
  103543:	e8 06 06 00 00       	call   103b4e <elf_load>
  103548:	83 c4 10             	add    $0x10,%esp
  10354b:	83 ec 08             	sub    $0x8,%esp
  10354e:	ff 75 f4             	pushl  -0xc(%ebp)
  103551:	68 6c 60 10 00       	push   $0x10606c
  103556:	e8 71 f3 ff ff       	call   1028cc <dprintf>
  10355b:	83 c4 10             	add    $0x10,%esp
  10355e:	a1 4c ff 10 00       	mov    0x10ff4c,%eax
  103563:	83 ec 0c             	sub    $0xc,%esp
  103566:	50                   	push   %eax
  103567:	e8 84 19 00 00       	call   104ef0 <set_pdir_base>
  10356c:	83 c4 10             	add    $0x10,%esp
  10356f:	83 ec 0c             	sub    $0xc,%esp
  103572:	ff 75 f4             	pushl  -0xc(%ebp)
  103575:	e8 72 08 00 00       	call   103dec <elf_entry>
  10357a:	83 c4 10             	add    $0x10,%esp
  10357d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103580:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103583:	ff d0                	call   *%eax
  103585:	b8 00 00 00 00       	mov    $0x0,%eax
  10358a:	c9                   	leave  
  10358b:	c3                   	ret    

0010358c <mon_help>:
  10358c:	55                   	push   %ebp
  10358d:	89 e5                	mov    %esp,%ebp
  10358f:	83 ec 18             	sub    $0x18,%esp
  103592:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103599:	eb 3c                	jmp    1035d7 <mon_help+0x4b>
  10359b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10359e:	89 d0                	mov    %edx,%eax
  1035a0:	01 c0                	add    %eax,%eax
  1035a2:	01 d0                	add    %edx,%eax
  1035a4:	c1 e0 02             	shl    $0x2,%eax
  1035a7:	05 24 a5 10 00       	add    $0x10a524,%eax
  1035ac:	8b 08                	mov    (%eax),%ecx
  1035ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1035b1:	89 d0                	mov    %edx,%eax
  1035b3:	01 c0                	add    %eax,%eax
  1035b5:	01 d0                	add    %edx,%eax
  1035b7:	c1 e0 02             	shl    $0x2,%eax
  1035ba:	05 20 a5 10 00       	add    $0x10a520,%eax
  1035bf:	8b 00                	mov    (%eax),%eax
  1035c1:	83 ec 04             	sub    $0x4,%esp
  1035c4:	51                   	push   %ecx
  1035c5:	50                   	push   %eax
  1035c6:	68 87 60 10 00       	push   $0x106087
  1035cb:	e8 fc f2 ff ff       	call   1028cc <dprintf>
  1035d0:	83 c4 10             	add    $0x10,%esp
  1035d3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1035d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1035da:	83 f8 02             	cmp    $0x2,%eax
  1035dd:	76 bc                	jbe    10359b <mon_help+0xf>
  1035df:	b8 00 00 00 00       	mov    $0x0,%eax
  1035e4:	c9                   	leave  
  1035e5:	c3                   	ret    

001035e6 <mon_kerninfo>:
  1035e6:	55                   	push   %ebp
  1035e7:	89 e5                	mov    %esp,%ebp
  1035e9:	83 ec 18             	sub    $0x18,%esp
  1035ec:	83 ec 0c             	sub    $0xc,%esp
  1035ef:	68 90 60 10 00       	push   $0x106090
  1035f4:	e8 d3 f2 ff ff       	call   1028cc <dprintf>
  1035f9:	83 c4 10             	add    $0x10,%esp
  1035fc:	83 ec 08             	sub    $0x8,%esp
  1035ff:	68 e4 43 10 00       	push   $0x1043e4
  103604:	68 a9 60 10 00       	push   $0x1060a9
  103609:	e8 be f2 ff ff       	call   1028cc <dprintf>
  10360e:	83 c4 10             	add    $0x10,%esp
  103611:	83 ec 08             	sub    $0x8,%esp
  103614:	68 d1 5c 10 00       	push   $0x105cd1
  103619:	68 b8 60 10 00       	push   $0x1060b8
  10361e:	e8 a9 f2 ff ff       	call   1028cc <dprintf>
  103623:	83 c4 10             	add    $0x10,%esp
  103626:	83 ec 08             	sub    $0x8,%esp
  103629:	68 08 e7 10 00       	push   $0x10e708
  10362e:	68 c7 60 10 00       	push   $0x1060c7
  103633:	e8 94 f2 ff ff       	call   1028cc <dprintf>
  103638:	83 c4 10             	add    $0x10,%esp
  10363b:	83 ec 08             	sub    $0x8,%esp
  10363e:	68 00 60 d9 00       	push   $0xd96000
  103643:	68 d6 60 10 00       	push   $0x1060d6
  103648:	e8 7f f2 ff ff       	call   1028cc <dprintf>
  10364d:	83 c4 10             	add    $0x10,%esp
  103650:	ba 00 60 d9 00       	mov    $0xd96000,%edx
  103655:	b8 e4 43 10 00       	mov    $0x1043e4,%eax
  10365a:	29 c2                	sub    %eax,%edx
  10365c:	89 d0                	mov    %edx,%eax
  10365e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103661:	c7 45 f0 00 04 00 00 	movl   $0x400,-0x10(%ebp)
  103668:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10366b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10366e:	01 d0                	add    %edx,%eax
  103670:	83 e8 01             	sub    $0x1,%eax
  103673:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103676:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103679:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10367c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10367f:	99                   	cltd   
  103680:	f7 7d e8             	idivl  -0x18(%ebp)
  103683:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103686:	29 d0                	sub    %edx,%eax
  103688:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10368e:	85 c0                	test   %eax,%eax
  103690:	0f 48 c2             	cmovs  %edx,%eax
  103693:	c1 f8 0a             	sar    $0xa,%eax
  103696:	83 ec 08             	sub    $0x8,%esp
  103699:	50                   	push   %eax
  10369a:	68 e8 60 10 00       	push   $0x1060e8
  10369f:	e8 28 f2 ff ff       	call   1028cc <dprintf>
  1036a4:	83 c4 10             	add    $0x10,%esp
  1036a7:	b8 00 00 00 00       	mov    $0x0,%eax
  1036ac:	c9                   	leave  
  1036ad:	c3                   	ret    

001036ae <mon_backtrace>:
  1036ae:	55                   	push   %ebp
  1036af:	89 e5                	mov    %esp,%ebp
  1036b1:	b8 00 00 00 00       	mov    $0x0,%eax
  1036b6:	5d                   	pop    %ebp
  1036b7:	c3                   	ret    

001036b8 <runcmd>:
  1036b8:	55                   	push   %ebp
  1036b9:	89 e5                	mov    %esp,%ebp
  1036bb:	83 ec 58             	sub    $0x58,%esp
  1036be:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1036c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1036c8:	c7 44 85 b0 00 00 00 	movl   $0x0,-0x50(%ebp,%eax,4)
  1036cf:	00 
  1036d0:	eb 0c                	jmp    1036de <runcmd+0x26>
  1036d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1036d5:	8d 50 01             	lea    0x1(%eax),%edx
  1036d8:	89 55 08             	mov    %edx,0x8(%ebp)
  1036db:	c6 00 00             	movb   $0x0,(%eax)
  1036de:	8b 45 08             	mov    0x8(%ebp),%eax
  1036e1:	0f b6 00             	movzbl (%eax),%eax
  1036e4:	84 c0                	test   %al,%al
  1036e6:	74 1e                	je     103706 <runcmd+0x4e>
  1036e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1036eb:	0f b6 00             	movzbl (%eax),%eax
  1036ee:	0f be c0             	movsbl %al,%eax
  1036f1:	83 ec 08             	sub    $0x8,%esp
  1036f4:	50                   	push   %eax
  1036f5:	68 12 61 10 00       	push   $0x106112
  1036fa:	e8 ff ee ff ff       	call   1025fe <strchr>
  1036ff:	83 c4 10             	add    $0x10,%esp
  103702:	85 c0                	test   %eax,%eax
  103704:	75 cc                	jne    1036d2 <runcmd+0x1a>
  103706:	8b 45 08             	mov    0x8(%ebp),%eax
  103709:	0f b6 00             	movzbl (%eax),%eax
  10370c:	84 c0                	test   %al,%al
  10370e:	74 69                	je     103779 <runcmd+0xc1>
  103710:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  103714:	75 1c                	jne    103732 <runcmd+0x7a>
  103716:	83 ec 08             	sub    $0x8,%esp
  103719:	6a 10                	push   $0x10
  10371b:	68 17 61 10 00       	push   $0x106117
  103720:	e8 a7 f1 ff ff       	call   1028cc <dprintf>
  103725:	83 c4 10             	add    $0x10,%esp
  103728:	b8 00 00 00 00       	mov    $0x0,%eax
  10372d:	e9 dc 00 00 00       	jmp    10380e <runcmd+0x156>
  103732:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103735:	8d 50 01             	lea    0x1(%eax),%edx
  103738:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10373b:	8b 55 08             	mov    0x8(%ebp),%edx
  10373e:	89 54 85 b0          	mov    %edx,-0x50(%ebp,%eax,4)
  103742:	eb 04                	jmp    103748 <runcmd+0x90>
  103744:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103748:	8b 45 08             	mov    0x8(%ebp),%eax
  10374b:	0f b6 00             	movzbl (%eax),%eax
  10374e:	84 c0                	test   %al,%al
  103750:	0f 84 7a ff ff ff    	je     1036d0 <runcmd+0x18>
  103756:	8b 45 08             	mov    0x8(%ebp),%eax
  103759:	0f b6 00             	movzbl (%eax),%eax
  10375c:	0f be c0             	movsbl %al,%eax
  10375f:	83 ec 08             	sub    $0x8,%esp
  103762:	50                   	push   %eax
  103763:	68 12 61 10 00       	push   $0x106112
  103768:	e8 91 ee ff ff       	call   1025fe <strchr>
  10376d:	83 c4 10             	add    $0x10,%esp
  103770:	85 c0                	test   %eax,%eax
  103772:	74 d0                	je     103744 <runcmd+0x8c>
  103774:	e9 57 ff ff ff       	jmp    1036d0 <runcmd+0x18>
  103779:	90                   	nop
  10377a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10377d:	c7 44 85 b0 00 00 00 	movl   $0x0,-0x50(%ebp,%eax,4)
  103784:	00 
  103785:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103789:	75 07                	jne    103792 <runcmd+0xda>
  10378b:	b8 00 00 00 00       	mov    $0x0,%eax
  103790:	eb 7c                	jmp    10380e <runcmd+0x156>
  103792:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  103799:	eb 52                	jmp    1037ed <runcmd+0x135>
  10379b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10379e:	89 d0                	mov    %edx,%eax
  1037a0:	01 c0                	add    %eax,%eax
  1037a2:	01 d0                	add    %edx,%eax
  1037a4:	c1 e0 02             	shl    $0x2,%eax
  1037a7:	05 20 a5 10 00       	add    $0x10a520,%eax
  1037ac:	8b 10                	mov    (%eax),%edx
  1037ae:	8b 45 b0             	mov    -0x50(%ebp),%eax
  1037b1:	83 ec 08             	sub    $0x8,%esp
  1037b4:	52                   	push   %edx
  1037b5:	50                   	push   %eax
  1037b6:	e8 04 ee ff ff       	call   1025bf <strcmp>
  1037bb:	83 c4 10             	add    $0x10,%esp
  1037be:	85 c0                	test   %eax,%eax
  1037c0:	75 27                	jne    1037e9 <runcmd+0x131>
  1037c2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1037c5:	89 d0                	mov    %edx,%eax
  1037c7:	01 c0                	add    %eax,%eax
  1037c9:	01 d0                	add    %edx,%eax
  1037cb:	c1 e0 02             	shl    $0x2,%eax
  1037ce:	05 28 a5 10 00       	add    $0x10a528,%eax
  1037d3:	8b 00                	mov    (%eax),%eax
  1037d5:	83 ec 04             	sub    $0x4,%esp
  1037d8:	ff 75 0c             	pushl  0xc(%ebp)
  1037db:	8d 55 b0             	lea    -0x50(%ebp),%edx
  1037de:	52                   	push   %edx
  1037df:	ff 75 f4             	pushl  -0xc(%ebp)
  1037e2:	ff d0                	call   *%eax
  1037e4:	83 c4 10             	add    $0x10,%esp
  1037e7:	eb 25                	jmp    10380e <runcmd+0x156>
  1037e9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  1037ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1037f0:	83 f8 02             	cmp    $0x2,%eax
  1037f3:	76 a6                	jbe    10379b <runcmd+0xe3>
  1037f5:	8b 45 b0             	mov    -0x50(%ebp),%eax
  1037f8:	83 ec 08             	sub    $0x8,%esp
  1037fb:	50                   	push   %eax
  1037fc:	68 34 61 10 00       	push   $0x106134
  103801:	e8 c6 f0 ff ff       	call   1028cc <dprintf>
  103806:	83 c4 10             	add    $0x10,%esp
  103809:	b8 00 00 00 00       	mov    $0x0,%eax
  10380e:	c9                   	leave  
  10380f:	c3                   	ret    

00103810 <monitor>:
  103810:	55                   	push   %ebp
  103811:	89 e5                	mov    %esp,%ebp
  103813:	83 ec 18             	sub    $0x18,%esp
  103816:	83 ec 0c             	sub    $0xc,%esp
  103819:	68 4c 61 10 00       	push   $0x10614c
  10381e:	e8 a9 f0 ff ff       	call   1028cc <dprintf>
  103823:	83 c4 10             	add    $0x10,%esp
  103826:	83 ec 0c             	sub    $0xc,%esp
  103829:	68 78 61 10 00       	push   $0x106178
  10382e:	e8 99 f0 ff ff       	call   1028cc <dprintf>
  103833:	83 c4 10             	add    $0x10,%esp
  103836:	83 ec 0c             	sub    $0xc,%esp
  103839:	68 4c 61 10 00       	push   $0x10614c
  10383e:	e8 89 f0 ff ff       	call   1028cc <dprintf>
  103843:	83 c4 10             	add    $0x10,%esp
  103846:	83 ec 0c             	sub    $0xc,%esp
  103849:	68 a4 61 10 00       	push   $0x1061a4
  10384e:	e8 79 f0 ff ff       	call   1028cc <dprintf>
  103853:	83 c4 10             	add    $0x10,%esp
  103856:	83 ec 0c             	sub    $0xc,%esp
  103859:	68 c9 61 10 00       	push   $0x1061c9
  10385e:	e8 35 cc ff ff       	call   100498 <readline>
  103863:	83 c4 10             	add    $0x10,%esp
  103866:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103869:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10386d:	74 e7                	je     103856 <monitor+0x46>
  10386f:	83 ec 08             	sub    $0x8,%esp
  103872:	ff 75 08             	pushl  0x8(%ebp)
  103875:	ff 75 f4             	pushl  -0xc(%ebp)
  103878:	e8 3b fe ff ff       	call   1036b8 <runcmd>
  10387d:	83 c4 10             	add    $0x10,%esp
  103880:	85 c0                	test   %eax,%eax
  103882:	78 02                	js     103886 <monitor+0x76>
  103884:	eb d0                	jmp    103856 <monitor+0x46>
  103886:	90                   	nop
  103887:	90                   	nop
  103888:	c9                   	leave  
  103889:	c3                   	ret    

0010388a <pt_copyin>:
  10388a:	55                   	push   %ebp
  10388b:	89 e5                	mov    %esp,%ebp
  10388d:	83 ec 18             	sub    $0x18,%esp
  103890:	81 7d 0c ff ff ff 3f 	cmpl   $0x3fffffff,0xc(%ebp)
  103897:	76 0f                	jbe    1038a8 <pt_copyin+0x1e>
  103899:	8b 55 0c             	mov    0xc(%ebp),%edx
  10389c:	8b 45 14             	mov    0x14(%ebp),%eax
  10389f:	01 d0                	add    %edx,%eax
  1038a1:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  1038a6:	76 0a                	jbe    1038b2 <pt_copyin+0x28>
  1038a8:	b8 00 00 00 00       	mov    $0x0,%eax
  1038ad:	e9 d5 00 00 00       	jmp    103987 <pt_copyin+0xfd>
  1038b2:	8b 55 10             	mov    0x10(%ebp),%edx
  1038b5:	8b 45 14             	mov    0x14(%ebp),%eax
  1038b8:	01 d0                	add    %edx,%eax
  1038ba:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  1038bf:	76 0a                	jbe    1038cb <pt_copyin+0x41>
  1038c1:	b8 00 00 00 00       	mov    $0x0,%eax
  1038c6:	e9 bc 00 00 00       	jmp    103987 <pt_copyin+0xfd>
  1038cb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1038d2:	e9 a3 00 00 00       	jmp    10397a <pt_copyin+0xf0>
  1038d7:	83 ec 08             	sub    $0x8,%esp
  1038da:	ff 75 0c             	pushl  0xc(%ebp)
  1038dd:	ff 75 08             	pushl  0x8(%ebp)
  1038e0:	e8 2b 19 00 00       	call   105210 <get_ptbl_entry_by_va>
  1038e5:	83 c4 10             	add    $0x10,%esp
  1038e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1038eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1038ee:	83 e0 01             	and    $0x1,%eax
  1038f1:	85 c0                	test   %eax,%eax
  1038f3:	75 27                	jne    10391c <pt_copyin+0x92>
  1038f5:	83 ec 04             	sub    $0x4,%esp
  1038f8:	6a 07                	push   $0x7
  1038fa:	ff 75 0c             	pushl  0xc(%ebp)
  1038fd:	ff 75 08             	pushl  0x8(%ebp)
  103900:	e8 2b 20 00 00       	call   105930 <alloc_page>
  103905:	83 c4 10             	add    $0x10,%esp
  103908:	83 ec 08             	sub    $0x8,%esp
  10390b:	ff 75 0c             	pushl  0xc(%ebp)
  10390e:	ff 75 08             	pushl  0x8(%ebp)
  103911:	e8 fa 18 00 00       	call   105210 <get_ptbl_entry_by_va>
  103916:	83 c4 10             	add    $0x10,%esp
  103919:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10391c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10391f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  103924:	89 c2                	mov    %eax,%edx
  103926:	8b 45 0c             	mov    0xc(%ebp),%eax
  103929:	25 ff 0f 00 00       	and    $0xfff,%eax
  10392e:	09 d0                	or     %edx,%eax
  103930:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103933:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103936:	25 ff 0f 00 00       	and    $0xfff,%eax
  10393b:	ba 00 10 00 00       	mov    $0x1000,%edx
  103940:	29 c2                	sub    %eax,%edx
  103942:	8b 45 14             	mov    0x14(%ebp),%eax
  103945:	39 c2                	cmp    %eax,%edx
  103947:	0f 46 c2             	cmovbe %edx,%eax
  10394a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10394d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103950:	83 ec 04             	sub    $0x4,%esp
  103953:	ff 75 ec             	pushl  -0x14(%ebp)
  103956:	50                   	push   %eax
  103957:	ff 75 10             	pushl  0x10(%ebp)
  10395a:	e8 c4 eb ff ff       	call   102523 <memcpy>
  10395f:	83 c4 10             	add    $0x10,%esp
  103962:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103965:	29 45 14             	sub    %eax,0x14(%ebp)
  103968:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10396b:	01 45 0c             	add    %eax,0xc(%ebp)
  10396e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103971:	01 45 10             	add    %eax,0x10(%ebp)
  103974:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103977:	01 45 f4             	add    %eax,-0xc(%ebp)
  10397a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  10397e:	0f 85 53 ff ff ff    	jne    1038d7 <pt_copyin+0x4d>
  103984:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103987:	c9                   	leave  
  103988:	c3                   	ret    

00103989 <pt_copyout>:
  103989:	55                   	push   %ebp
  10398a:	89 e5                	mov    %esp,%ebp
  10398c:	83 ec 18             	sub    $0x18,%esp
  10398f:	81 7d 10 ff ff ff 3f 	cmpl   $0x3fffffff,0x10(%ebp)
  103996:	76 0f                	jbe    1039a7 <pt_copyout+0x1e>
  103998:	8b 55 10             	mov    0x10(%ebp),%edx
  10399b:	8b 45 14             	mov    0x14(%ebp),%eax
  10399e:	01 d0                	add    %edx,%eax
  1039a0:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  1039a5:	76 0a                	jbe    1039b1 <pt_copyout+0x28>
  1039a7:	b8 00 00 00 00       	mov    $0x0,%eax
  1039ac:	e9 d5 00 00 00       	jmp    103a86 <pt_copyout+0xfd>
  1039b1:	8b 55 08             	mov    0x8(%ebp),%edx
  1039b4:	8b 45 14             	mov    0x14(%ebp),%eax
  1039b7:	01 d0                	add    %edx,%eax
  1039b9:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  1039be:	76 0a                	jbe    1039ca <pt_copyout+0x41>
  1039c0:	b8 00 00 00 00       	mov    $0x0,%eax
  1039c5:	e9 bc 00 00 00       	jmp    103a86 <pt_copyout+0xfd>
  1039ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1039d1:	e9 a3 00 00 00       	jmp    103a79 <pt_copyout+0xf0>
  1039d6:	83 ec 08             	sub    $0x8,%esp
  1039d9:	ff 75 10             	pushl  0x10(%ebp)
  1039dc:	ff 75 0c             	pushl  0xc(%ebp)
  1039df:	e8 2c 18 00 00       	call   105210 <get_ptbl_entry_by_va>
  1039e4:	83 c4 10             	add    $0x10,%esp
  1039e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1039ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1039ed:	83 e0 01             	and    $0x1,%eax
  1039f0:	85 c0                	test   %eax,%eax
  1039f2:	75 27                	jne    103a1b <pt_copyout+0x92>
  1039f4:	83 ec 04             	sub    $0x4,%esp
  1039f7:	6a 07                	push   $0x7
  1039f9:	ff 75 10             	pushl  0x10(%ebp)
  1039fc:	ff 75 0c             	pushl  0xc(%ebp)
  1039ff:	e8 2c 1f 00 00       	call   105930 <alloc_page>
  103a04:	83 c4 10             	add    $0x10,%esp
  103a07:	83 ec 08             	sub    $0x8,%esp
  103a0a:	ff 75 10             	pushl  0x10(%ebp)
  103a0d:	ff 75 0c             	pushl  0xc(%ebp)
  103a10:	e8 fb 17 00 00       	call   105210 <get_ptbl_entry_by_va>
  103a15:	83 c4 10             	add    $0x10,%esp
  103a18:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103a1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103a1e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  103a23:	89 c2                	mov    %eax,%edx
  103a25:	8b 45 10             	mov    0x10(%ebp),%eax
  103a28:	25 ff 0f 00 00       	and    $0xfff,%eax
  103a2d:	09 d0                	or     %edx,%eax
  103a2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103a32:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103a35:	25 ff 0f 00 00       	and    $0xfff,%eax
  103a3a:	ba 00 10 00 00       	mov    $0x1000,%edx
  103a3f:	29 c2                	sub    %eax,%edx
  103a41:	8b 45 14             	mov    0x14(%ebp),%eax
  103a44:	39 c2                	cmp    %eax,%edx
  103a46:	0f 46 c2             	cmovbe %edx,%eax
  103a49:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103a4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103a4f:	83 ec 04             	sub    $0x4,%esp
  103a52:	ff 75 ec             	pushl  -0x14(%ebp)
  103a55:	ff 75 08             	pushl  0x8(%ebp)
  103a58:	50                   	push   %eax
  103a59:	e8 c5 ea ff ff       	call   102523 <memcpy>
  103a5e:	83 c4 10             	add    $0x10,%esp
  103a61:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103a64:	29 45 14             	sub    %eax,0x14(%ebp)
  103a67:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103a6a:	01 45 10             	add    %eax,0x10(%ebp)
  103a6d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103a70:	01 45 08             	add    %eax,0x8(%ebp)
  103a73:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103a76:	01 45 f4             	add    %eax,-0xc(%ebp)
  103a79:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  103a7d:	0f 85 53 ff ff ff    	jne    1039d6 <pt_copyout+0x4d>
  103a83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103a86:	c9                   	leave  
  103a87:	c3                   	ret    

00103a88 <pt_memset>:
  103a88:	55                   	push   %ebp
  103a89:	89 e5                	mov    %esp,%ebp
  103a8b:	83 ec 28             	sub    $0x28,%esp
  103a8e:	8b 45 10             	mov    0x10(%ebp),%eax
  103a91:	88 45 e4             	mov    %al,-0x1c(%ebp)
  103a94:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103a9b:	e9 9f 00 00 00       	jmp    103b3f <pt_memset+0xb7>
  103aa0:	83 ec 08             	sub    $0x8,%esp
  103aa3:	ff 75 0c             	pushl  0xc(%ebp)
  103aa6:	ff 75 08             	pushl  0x8(%ebp)
  103aa9:	e8 62 17 00 00       	call   105210 <get_ptbl_entry_by_va>
  103aae:	83 c4 10             	add    $0x10,%esp
  103ab1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103ab4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103ab7:	83 e0 01             	and    $0x1,%eax
  103aba:	85 c0                	test   %eax,%eax
  103abc:	75 27                	jne    103ae5 <pt_memset+0x5d>
  103abe:	83 ec 04             	sub    $0x4,%esp
  103ac1:	6a 07                	push   $0x7
  103ac3:	ff 75 0c             	pushl  0xc(%ebp)
  103ac6:	ff 75 08             	pushl  0x8(%ebp)
  103ac9:	e8 62 1e 00 00       	call   105930 <alloc_page>
  103ace:	83 c4 10             	add    $0x10,%esp
  103ad1:	83 ec 08             	sub    $0x8,%esp
  103ad4:	ff 75 0c             	pushl  0xc(%ebp)
  103ad7:	ff 75 08             	pushl  0x8(%ebp)
  103ada:	e8 31 17 00 00       	call   105210 <get_ptbl_entry_by_va>
  103adf:	83 c4 10             	add    $0x10,%esp
  103ae2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103ae5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103ae8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  103aed:	89 c2                	mov    %eax,%edx
  103aef:	8b 45 0c             	mov    0xc(%ebp),%eax
  103af2:	25 ff 0f 00 00       	and    $0xfff,%eax
  103af7:	09 d0                	or     %edx,%eax
  103af9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103afc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103aff:	25 ff 0f 00 00       	and    $0xfff,%eax
  103b04:	ba 00 10 00 00       	mov    $0x1000,%edx
  103b09:	29 c2                	sub    %eax,%edx
  103b0b:	8b 45 14             	mov    0x14(%ebp),%eax
  103b0e:	39 c2                	cmp    %eax,%edx
  103b10:	0f 46 c2             	cmovbe %edx,%eax
  103b13:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103b16:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
  103b1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103b1d:	83 ec 04             	sub    $0x4,%esp
  103b20:	ff 75 ec             	pushl  -0x14(%ebp)
  103b23:	52                   	push   %edx
  103b24:	50                   	push   %eax
  103b25:	e8 b1 e8 ff ff       	call   1023db <memset>
  103b2a:	83 c4 10             	add    $0x10,%esp
  103b2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103b30:	29 45 14             	sub    %eax,0x14(%ebp)
  103b33:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103b36:	01 45 0c             	add    %eax,0xc(%ebp)
  103b39:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103b3c:	01 45 f4             	add    %eax,-0xc(%ebp)
  103b3f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  103b43:	0f 85 57 ff ff ff    	jne    103aa0 <pt_memset+0x18>
  103b49:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103b4c:	c9                   	leave  
  103b4d:	c3                   	ret    

00103b4e <elf_load>:
  103b4e:	55                   	push   %ebp
  103b4f:	89 e5                	mov    %esp,%ebp
  103b51:	83 ec 38             	sub    $0x38,%esp
  103b54:	8b 45 08             	mov    0x8(%ebp),%eax
  103b57:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103b5a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103b5d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103b60:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103b63:	8b 00                	mov    (%eax),%eax
  103b65:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  103b6a:	74 19                	je     103b85 <elf_load+0x37>
  103b6c:	68 d0 61 10 00       	push   $0x1061d0
  103b71:	68 e9 61 10 00       	push   $0x1061e9
  103b76:	6a 25                	push   $0x25
  103b78:	68 06 62 10 00       	push   $0x106206
  103b7d:	e8 84 eb ff ff       	call   102706 <debug_panic>
  103b82:	83 c4 10             	add    $0x10,%esp
  103b85:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103b88:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  103b8c:	66 85 c0             	test   %ax,%ax
  103b8f:	75 19                	jne    103baa <elf_load+0x5c>
  103b91:	68 18 62 10 00       	push   $0x106218
  103b96:	68 e9 61 10 00       	push   $0x1061e9
  103b9b:	6a 26                	push   $0x26
  103b9d:	68 06 62 10 00       	push   $0x106206
  103ba2:	e8 5f eb ff ff       	call   102706 <debug_panic>
  103ba7:	83 c4 10             	add    $0x10,%esp
  103baa:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103bad:	8b 50 20             	mov    0x20(%eax),%edx
  103bb0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103bb3:	01 d0                	add    %edx,%eax
  103bb5:	89 45 dc             	mov    %eax,-0x24(%ebp)
  103bb8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103bbb:	0f b7 40 30          	movzwl 0x30(%eax),%eax
  103bbf:	0f b7 d0             	movzwl %ax,%edx
  103bc2:	89 d0                	mov    %edx,%eax
  103bc4:	c1 e0 02             	shl    $0x2,%eax
  103bc7:	01 d0                	add    %edx,%eax
  103bc9:	c1 e0 03             	shl    $0x3,%eax
  103bcc:	89 c2                	mov    %eax,%edx
  103bce:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103bd1:	01 d0                	add    %edx,%eax
  103bd3:	89 45 d8             	mov    %eax,-0x28(%ebp)
  103bd6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103bd9:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  103bdd:	0f b7 d0             	movzwl %ax,%edx
  103be0:	89 d0                	mov    %edx,%eax
  103be2:	c1 e0 02             	shl    $0x2,%eax
  103be5:	01 d0                	add    %edx,%eax
  103be7:	c1 e0 03             	shl    $0x3,%eax
  103bea:	89 c2                	mov    %eax,%edx
  103bec:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103bef:	01 d0                	add    %edx,%eax
  103bf1:	8b 50 10             	mov    0x10(%eax),%edx
  103bf4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103bf7:	01 d0                	add    %edx,%eax
  103bf9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  103bfc:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103bff:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  103c03:	0f b7 d0             	movzwl %ax,%edx
  103c06:	89 d0                	mov    %edx,%eax
  103c08:	c1 e0 02             	shl    $0x2,%eax
  103c0b:	01 d0                	add    %edx,%eax
  103c0d:	c1 e0 03             	shl    $0x3,%eax
  103c10:	89 c2                	mov    %eax,%edx
  103c12:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103c15:	01 d0                	add    %edx,%eax
  103c17:	8b 40 04             	mov    0x4(%eax),%eax
  103c1a:	83 f8 03             	cmp    $0x3,%eax
  103c1d:	74 19                	je     103c38 <elf_load+0xea>
  103c1f:	68 38 62 10 00       	push   $0x106238
  103c24:	68 e9 61 10 00       	push   $0x1061e9
  103c29:	6a 2c                	push   $0x2c
  103c2b:	68 06 62 10 00       	push   $0x106206
  103c30:	e8 d1 ea ff ff       	call   102706 <debug_panic>
  103c35:	83 c4 10             	add    $0x10,%esp
  103c38:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103c3b:	8b 50 1c             	mov    0x1c(%eax),%edx
  103c3e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103c41:	01 d0                	add    %edx,%eax
  103c43:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103c46:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103c49:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  103c4d:	0f b7 c0             	movzwl %ax,%eax
  103c50:	c1 e0 05             	shl    $0x5,%eax
  103c53:	89 c2                	mov    %eax,%edx
  103c55:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103c58:	01 d0                	add    %edx,%eax
  103c5a:	89 45 d0             	mov    %eax,-0x30(%ebp)
  103c5d:	e9 60 01 00 00       	jmp    103dc2 <elf_load+0x274>
  103c62:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103c65:	8b 00                	mov    (%eax),%eax
  103c67:	83 f8 01             	cmp    $0x1,%eax
  103c6a:	0f 85 4d 01 00 00    	jne    103dbd <elf_load+0x26f>
  103c70:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103c73:	8b 40 04             	mov    0x4(%eax),%eax
  103c76:	83 ec 08             	sub    $0x8,%esp
  103c79:	68 00 10 00 00       	push   $0x1000
  103c7e:	50                   	push   %eax
  103c7f:	e8 0d f6 ff ff       	call   103291 <rounddown>
  103c84:	83 c4 10             	add    $0x10,%esp
  103c87:	89 c2                	mov    %eax,%edx
  103c89:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103c8c:	01 d0                	add    %edx,%eax
  103c8e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103c91:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103c94:	8b 40 08             	mov    0x8(%eax),%eax
  103c97:	83 ec 08             	sub    $0x8,%esp
  103c9a:	68 00 10 00 00       	push   $0x1000
  103c9f:	50                   	push   %eax
  103ca0:	e8 ec f5 ff ff       	call   103291 <rounddown>
  103ca5:	83 c4 10             	add    $0x10,%esp
  103ca8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103cab:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103cae:	8b 50 08             	mov    0x8(%eax),%edx
  103cb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103cb4:	8b 40 10             	mov    0x10(%eax),%eax
  103cb7:	01 d0                	add    %edx,%eax
  103cb9:	89 45 cc             	mov    %eax,-0x34(%ebp)
  103cbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103cbf:	8b 50 08             	mov    0x8(%eax),%edx
  103cc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103cc5:	8b 40 14             	mov    0x14(%eax),%eax
  103cc8:	01 d0                	add    %edx,%eax
  103cca:	83 ec 08             	sub    $0x8,%esp
  103ccd:	68 00 10 00 00       	push   $0x1000
  103cd2:	50                   	push   %eax
  103cd3:	e8 ce f5 ff ff       	call   1032a6 <roundup>
  103cd8:	83 c4 10             	add    $0x10,%esp
  103cdb:	89 45 c8             	mov    %eax,-0x38(%ebp)
  103cde:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
  103ce5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103ce8:	8b 40 18             	mov    0x18(%eax),%eax
  103ceb:	83 e0 02             	and    $0x2,%eax
  103cee:	85 c0                	test   %eax,%eax
  103cf0:	0f 84 b9 00 00 00    	je     103daf <elf_load+0x261>
  103cf6:	83 4d e8 02          	orl    $0x2,-0x18(%ebp)
  103cfa:	e9 b0 00 00 00       	jmp    103daf <elf_load+0x261>
  103cff:	83 ec 04             	sub    $0x4,%esp
  103d02:	ff 75 e8             	pushl  -0x18(%ebp)
  103d05:	ff 75 ec             	pushl  -0x14(%ebp)
  103d08:	ff 75 0c             	pushl  0xc(%ebp)
  103d0b:	e8 20 1c 00 00       	call   105930 <alloc_page>
  103d10:	83 c4 10             	add    $0x10,%esp
  103d13:	83 ec 08             	sub    $0x8,%esp
  103d16:	68 00 10 00 00       	push   $0x1000
  103d1b:	ff 75 cc             	pushl  -0x34(%ebp)
  103d1e:	e8 6e f5 ff ff       	call   103291 <rounddown>
  103d23:	83 c4 10             	add    $0x10,%esp
  103d26:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  103d29:	76 1a                	jbe    103d45 <elf_load+0x1f7>
  103d2b:	8b 55 0c             	mov    0xc(%ebp),%edx
  103d2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103d31:	68 00 10 00 00       	push   $0x1000
  103d36:	ff 75 ec             	pushl  -0x14(%ebp)
  103d39:	52                   	push   %edx
  103d3a:	50                   	push   %eax
  103d3b:	e8 49 fc ff ff       	call   103989 <pt_copyout>
  103d40:	83 c4 10             	add    $0x10,%esp
  103d43:	eb 5c                	jmp    103da1 <elf_load+0x253>
  103d45:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103d48:	3b 45 cc             	cmp    -0x34(%ebp),%eax
  103d4b:	73 3e                	jae    103d8b <elf_load+0x23d>
  103d4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103d50:	8b 40 10             	mov    0x10(%eax),%eax
  103d53:	85 c0                	test   %eax,%eax
  103d55:	74 34                	je     103d8b <elf_load+0x23d>
  103d57:	8b 45 0c             	mov    0xc(%ebp),%eax
  103d5a:	68 00 10 00 00       	push   $0x1000
  103d5f:	6a 00                	push   $0x0
  103d61:	ff 75 ec             	pushl  -0x14(%ebp)
  103d64:	50                   	push   %eax
  103d65:	e8 1e fd ff ff       	call   103a88 <pt_memset>
  103d6a:	83 c4 10             	add    $0x10,%esp
  103d6d:	8b 45 cc             	mov    -0x34(%ebp),%eax
  103d70:	2b 45 ec             	sub    -0x14(%ebp),%eax
  103d73:	89 c1                	mov    %eax,%ecx
  103d75:	8b 55 0c             	mov    0xc(%ebp),%edx
  103d78:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103d7b:	51                   	push   %ecx
  103d7c:	ff 75 ec             	pushl  -0x14(%ebp)
  103d7f:	52                   	push   %edx
  103d80:	50                   	push   %eax
  103d81:	e8 03 fc ff ff       	call   103989 <pt_copyout>
  103d86:	83 c4 10             	add    $0x10,%esp
  103d89:	eb 16                	jmp    103da1 <elf_load+0x253>
  103d8b:	8b 45 0c             	mov    0xc(%ebp),%eax
  103d8e:	68 00 10 00 00       	push   $0x1000
  103d93:	6a 00                	push   $0x0
  103d95:	ff 75 ec             	pushl  -0x14(%ebp)
  103d98:	50                   	push   %eax
  103d99:	e8 ea fc ff ff       	call   103a88 <pt_memset>
  103d9e:	83 c4 10             	add    $0x10,%esp
  103da1:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
  103da8:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
  103daf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103db2:	3b 45 c8             	cmp    -0x38(%ebp),%eax
  103db5:	0f 82 44 ff ff ff    	jb     103cff <elf_load+0x1b1>
  103dbb:	eb 01                	jmp    103dbe <elf_load+0x270>
  103dbd:	90                   	nop
  103dbe:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
  103dc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103dc5:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  103dc8:	0f 82 94 fe ff ff    	jb     103c62 <elf_load+0x114>
  103dce:	8b 45 0c             	mov    0xc(%ebp),%eax
  103dd1:	68 00 10 00 00       	push   $0x1000
  103dd6:	68 00 00 00 e0       	push   $0xe0000000
  103ddb:	50                   	push   %eax
  103ddc:	68 00 b0 10 00       	push   $0x10b000
  103de1:	e8 a3 fb ff ff       	call   103989 <pt_copyout>
  103de6:	83 c4 10             	add    $0x10,%esp
  103de9:	90                   	nop
  103dea:	c9                   	leave  
  103deb:	c3                   	ret    

00103dec <elf_entry>:
  103dec:	55                   	push   %ebp
  103ded:	89 e5                	mov    %esp,%ebp
  103def:	83 ec 18             	sub    $0x18,%esp
  103df2:	8b 45 08             	mov    0x8(%ebp),%eax
  103df5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103df8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103dfb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103dfe:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103e01:	8b 00                	mov    (%eax),%eax
  103e03:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  103e08:	74 19                	je     103e23 <elf_entry+0x37>
  103e0a:	68 d0 61 10 00       	push   $0x1061d0
  103e0f:	68 e9 61 10 00       	push   $0x1061e9
  103e14:	6a 62                	push   $0x62
  103e16:	68 06 62 10 00       	push   $0x106206
  103e1b:	e8 e6 e8 ff ff       	call   102706 <debug_panic>
  103e20:	83 c4 10             	add    $0x10,%esp
  103e23:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103e26:	8b 40 18             	mov    0x18(%eax),%eax
  103e29:	c9                   	leave  
  103e2a:	c3                   	ret    

00103e2b <trap_dump>:
  103e2b:	55                   	push   %ebp
  103e2c:	89 e5                	mov    %esp,%ebp
  103e2e:	83 ec 18             	sub    $0x18,%esp
  103e31:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103e35:	0f 84 29 02 00 00    	je     104064 <trap_dump+0x239>
  103e3b:	8b 45 08             	mov    0x8(%ebp),%eax
  103e3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103e41:	ff 75 f4             	pushl  -0xc(%ebp)
  103e44:	68 68 62 10 00       	push   $0x106268
  103e49:	6a 11                	push   $0x11
  103e4b:	68 79 62 10 00       	push   $0x106279
  103e50:	e8 12 e8 ff ff       	call   102667 <debug_normal>
  103e55:	83 c4 10             	add    $0x10,%esp
  103e58:	8b 45 08             	mov    0x8(%ebp),%eax
  103e5b:	8b 10                	mov    (%eax),%edx
  103e5d:	8b 45 08             	mov    0x8(%ebp),%eax
  103e60:	83 ec 04             	sub    $0x4,%esp
  103e63:	52                   	push   %edx
  103e64:	50                   	push   %eax
  103e65:	68 89 62 10 00       	push   $0x106289
  103e6a:	e8 d7 e7 ff ff       	call   102646 <debug_info>
  103e6f:	83 c4 10             	add    $0x10,%esp
  103e72:	8b 45 08             	mov    0x8(%ebp),%eax
  103e75:	8b 40 04             	mov    0x4(%eax),%eax
  103e78:	8b 55 08             	mov    0x8(%ebp),%edx
  103e7b:	83 c2 04             	add    $0x4,%edx
  103e7e:	83 ec 04             	sub    $0x4,%esp
  103e81:	50                   	push   %eax
  103e82:	52                   	push   %edx
  103e83:	68 9f 62 10 00       	push   $0x10629f
  103e88:	e8 b9 e7 ff ff       	call   102646 <debug_info>
  103e8d:	83 c4 10             	add    $0x10,%esp
  103e90:	8b 45 08             	mov    0x8(%ebp),%eax
  103e93:	8b 40 08             	mov    0x8(%eax),%eax
  103e96:	8b 55 08             	mov    0x8(%ebp),%edx
  103e99:	83 c2 08             	add    $0x8,%edx
  103e9c:	83 ec 04             	sub    $0x4,%esp
  103e9f:	50                   	push   %eax
  103ea0:	52                   	push   %edx
  103ea1:	68 b5 62 10 00       	push   $0x1062b5
  103ea6:	e8 9b e7 ff ff       	call   102646 <debug_info>
  103eab:	83 c4 10             	add    $0x10,%esp
  103eae:	8b 45 08             	mov    0x8(%ebp),%eax
  103eb1:	8b 40 0c             	mov    0xc(%eax),%eax
  103eb4:	8b 55 08             	mov    0x8(%ebp),%edx
  103eb7:	83 c2 0c             	add    $0xc,%edx
  103eba:	83 ec 04             	sub    $0x4,%esp
  103ebd:	50                   	push   %eax
  103ebe:	52                   	push   %edx
  103ebf:	68 cb 62 10 00       	push   $0x1062cb
  103ec4:	e8 7d e7 ff ff       	call   102646 <debug_info>
  103ec9:	83 c4 10             	add    $0x10,%esp
  103ecc:	8b 45 08             	mov    0x8(%ebp),%eax
  103ecf:	8b 40 10             	mov    0x10(%eax),%eax
  103ed2:	8b 55 08             	mov    0x8(%ebp),%edx
  103ed5:	83 c2 10             	add    $0x10,%edx
  103ed8:	83 ec 04             	sub    $0x4,%esp
  103edb:	50                   	push   %eax
  103edc:	52                   	push   %edx
  103edd:	68 e1 62 10 00       	push   $0x1062e1
  103ee2:	e8 5f e7 ff ff       	call   102646 <debug_info>
  103ee7:	83 c4 10             	add    $0x10,%esp
  103eea:	8b 45 08             	mov    0x8(%ebp),%eax
  103eed:	8b 40 14             	mov    0x14(%eax),%eax
  103ef0:	8b 55 08             	mov    0x8(%ebp),%edx
  103ef3:	83 c2 14             	add    $0x14,%edx
  103ef6:	83 ec 04             	sub    $0x4,%esp
  103ef9:	50                   	push   %eax
  103efa:	52                   	push   %edx
  103efb:	68 f7 62 10 00       	push   $0x1062f7
  103f00:	e8 41 e7 ff ff       	call   102646 <debug_info>
  103f05:	83 c4 10             	add    $0x10,%esp
  103f08:	8b 45 08             	mov    0x8(%ebp),%eax
  103f0b:	8b 40 18             	mov    0x18(%eax),%eax
  103f0e:	8b 55 08             	mov    0x8(%ebp),%edx
  103f11:	83 c2 18             	add    $0x18,%edx
  103f14:	83 ec 04             	sub    $0x4,%esp
  103f17:	50                   	push   %eax
  103f18:	52                   	push   %edx
  103f19:	68 0d 63 10 00       	push   $0x10630d
  103f1e:	e8 23 e7 ff ff       	call   102646 <debug_info>
  103f23:	83 c4 10             	add    $0x10,%esp
  103f26:	8b 45 08             	mov    0x8(%ebp),%eax
  103f29:	8b 40 1c             	mov    0x1c(%eax),%eax
  103f2c:	8b 55 08             	mov    0x8(%ebp),%edx
  103f2f:	83 c2 1c             	add    $0x1c,%edx
  103f32:	83 ec 04             	sub    $0x4,%esp
  103f35:	50                   	push   %eax
  103f36:	52                   	push   %edx
  103f37:	68 23 63 10 00       	push   $0x106323
  103f3c:	e8 05 e7 ff ff       	call   102646 <debug_info>
  103f41:	83 c4 10             	add    $0x10,%esp
  103f44:	8b 45 08             	mov    0x8(%ebp),%eax
  103f47:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  103f4b:	0f b7 c0             	movzwl %ax,%eax
  103f4e:	8b 55 08             	mov    0x8(%ebp),%edx
  103f51:	83 c2 20             	add    $0x20,%edx
  103f54:	83 ec 04             	sub    $0x4,%esp
  103f57:	50                   	push   %eax
  103f58:	52                   	push   %edx
  103f59:	68 39 63 10 00       	push   $0x106339
  103f5e:	e8 e3 e6 ff ff       	call   102646 <debug_info>
  103f63:	83 c4 10             	add    $0x10,%esp
  103f66:	8b 45 08             	mov    0x8(%ebp),%eax
  103f69:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  103f6d:	0f b7 c0             	movzwl %ax,%eax
  103f70:	8b 55 08             	mov    0x8(%ebp),%edx
  103f73:	83 c2 24             	add    $0x24,%edx
  103f76:	83 ec 04             	sub    $0x4,%esp
  103f79:	50                   	push   %eax
  103f7a:	52                   	push   %edx
  103f7b:	68 4f 63 10 00       	push   $0x10634f
  103f80:	e8 c1 e6 ff ff       	call   102646 <debug_info>
  103f85:	83 c4 10             	add    $0x10,%esp
  103f88:	8b 45 08             	mov    0x8(%ebp),%eax
  103f8b:	8b 40 28             	mov    0x28(%eax),%eax
  103f8e:	8b 55 08             	mov    0x8(%ebp),%edx
  103f91:	83 c2 28             	add    $0x28,%edx
  103f94:	83 ec 04             	sub    $0x4,%esp
  103f97:	50                   	push   %eax
  103f98:	52                   	push   %edx
  103f99:	68 65 63 10 00       	push   $0x106365
  103f9e:	e8 a3 e6 ff ff       	call   102646 <debug_info>
  103fa3:	83 c4 10             	add    $0x10,%esp
  103fa6:	8b 45 08             	mov    0x8(%ebp),%eax
  103fa9:	8b 40 2c             	mov    0x2c(%eax),%eax
  103fac:	8b 55 08             	mov    0x8(%ebp),%edx
  103faf:	83 c2 2c             	add    $0x2c,%edx
  103fb2:	83 ec 04             	sub    $0x4,%esp
  103fb5:	50                   	push   %eax
  103fb6:	52                   	push   %edx
  103fb7:	68 7b 63 10 00       	push   $0x10637b
  103fbc:	e8 85 e6 ff ff       	call   102646 <debug_info>
  103fc1:	83 c4 10             	add    $0x10,%esp
  103fc4:	8b 45 08             	mov    0x8(%ebp),%eax
  103fc7:	8b 40 30             	mov    0x30(%eax),%eax
  103fca:	8b 55 08             	mov    0x8(%ebp),%edx
  103fcd:	83 c2 30             	add    $0x30,%edx
  103fd0:	83 ec 04             	sub    $0x4,%esp
  103fd3:	50                   	push   %eax
  103fd4:	52                   	push   %edx
  103fd5:	68 91 63 10 00       	push   $0x106391
  103fda:	e8 67 e6 ff ff       	call   102646 <debug_info>
  103fdf:	83 c4 10             	add    $0x10,%esp
  103fe2:	8b 45 08             	mov    0x8(%ebp),%eax
  103fe5:	0f b7 40 34          	movzwl 0x34(%eax),%eax
  103fe9:	0f b7 c0             	movzwl %ax,%eax
  103fec:	8b 55 08             	mov    0x8(%ebp),%edx
  103fef:	83 c2 34             	add    $0x34,%edx
  103ff2:	83 ec 04             	sub    $0x4,%esp
  103ff5:	50                   	push   %eax
  103ff6:	52                   	push   %edx
  103ff7:	68 a7 63 10 00       	push   $0x1063a7
  103ffc:	e8 45 e6 ff ff       	call   102646 <debug_info>
  104001:	83 c4 10             	add    $0x10,%esp
  104004:	8b 45 08             	mov    0x8(%ebp),%eax
  104007:	8b 40 38             	mov    0x38(%eax),%eax
  10400a:	8b 55 08             	mov    0x8(%ebp),%edx
  10400d:	83 c2 38             	add    $0x38,%edx
  104010:	83 ec 04             	sub    $0x4,%esp
  104013:	50                   	push   %eax
  104014:	52                   	push   %edx
  104015:	68 bd 63 10 00       	push   $0x1063bd
  10401a:	e8 27 e6 ff ff       	call   102646 <debug_info>
  10401f:	83 c4 10             	add    $0x10,%esp
  104022:	8b 45 08             	mov    0x8(%ebp),%eax
  104025:	8b 40 3c             	mov    0x3c(%eax),%eax
  104028:	8b 55 08             	mov    0x8(%ebp),%edx
  10402b:	83 c2 3c             	add    $0x3c,%edx
  10402e:	83 ec 04             	sub    $0x4,%esp
  104031:	50                   	push   %eax
  104032:	52                   	push   %edx
  104033:	68 cb 62 10 00       	push   $0x1062cb
  104038:	e8 09 e6 ff ff       	call   102646 <debug_info>
  10403d:	83 c4 10             	add    $0x10,%esp
  104040:	8b 45 08             	mov    0x8(%ebp),%eax
  104043:	0f b7 40 40          	movzwl 0x40(%eax),%eax
  104047:	0f b7 c0             	movzwl %ax,%eax
  10404a:	8b 55 08             	mov    0x8(%ebp),%edx
  10404d:	83 c2 40             	add    $0x40,%edx
  104050:	83 ec 04             	sub    $0x4,%esp
  104053:	50                   	push   %eax
  104054:	52                   	push   %edx
  104055:	68 d3 63 10 00       	push   $0x1063d3
  10405a:	e8 e7 e5 ff ff       	call   102646 <debug_info>
  10405f:	83 c4 10             	add    $0x10,%esp
  104062:	eb 01                	jmp    104065 <trap_dump+0x23a>
  104064:	90                   	nop
  104065:	c9                   	leave  
  104066:	c3                   	ret    

00104067 <pgflt_handler>:
  104067:	55                   	push   %ebp
  104068:	89 e5                	mov    %esp,%ebp
  10406a:	83 ec 18             	sub    $0x18,%esp
  10406d:	8b 45 08             	mov    0x8(%ebp),%eax
  104070:	8b 40 2c             	mov    0x2c(%eax),%eax
  104073:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104076:	e8 c5 f3 ff ff       	call   103440 <rcr2>
  10407b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10407e:	8b 45 08             	mov    0x8(%ebp),%eax
  104081:	8b 50 30             	mov    0x30(%eax),%edx
  104084:	a1 4c ff 10 00       	mov    0x10ff4c,%eax
  104089:	83 ec 0c             	sub    $0xc,%esp
  10408c:	52                   	push   %edx
  10408d:	50                   	push   %eax
  10408e:	ff 75 f4             	pushl  -0xc(%ebp)
  104091:	ff 75 f0             	pushl  -0x10(%ebp)
  104094:	68 ec 63 10 00       	push   $0x1063ec
  104099:	e8 2e e8 ff ff       	call   1028cc <dprintf>
  10409e:	83 c4 20             	add    $0x20,%esp
  1040a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1040a4:	8b 40 2c             	mov    0x2c(%eax),%eax
  1040a7:	83 e0 01             	and    $0x1,%eax
  1040aa:	85 c0                	test   %eax,%eax
  1040ac:	74 1f                	je     1040cd <pgflt_handler+0x66>
  1040ae:	83 ec 0c             	sub    $0xc,%esp
  1040b1:	ff 75 f4             	pushl  -0xc(%ebp)
  1040b4:	ff 75 f0             	pushl  -0x10(%ebp)
  1040b7:	68 30 64 10 00       	push   $0x106430
  1040bc:	6a 35                	push   $0x35
  1040be:	68 79 62 10 00       	push   $0x106279
  1040c3:	e8 3e e6 ff ff       	call   102706 <debug_panic>
  1040c8:	83 c4 20             	add    $0x20,%esp
  1040cb:	eb 29                	jmp    1040f6 <pgflt_handler+0x8f>
  1040cd:	83 ec 08             	sub    $0x8,%esp
  1040d0:	68 00 10 00 00       	push   $0x1000
  1040d5:	ff 75 f0             	pushl  -0x10(%ebp)
  1040d8:	e8 b4 f1 ff ff       	call   103291 <rounddown>
  1040dd:	83 c4 10             	add    $0x10,%esp
  1040e0:	89 c2                	mov    %eax,%edx
  1040e2:	a1 4c ff 10 00       	mov    0x10ff4c,%eax
  1040e7:	83 ec 04             	sub    $0x4,%esp
  1040ea:	6a 07                	push   $0x7
  1040ec:	52                   	push   %edx
  1040ed:	50                   	push   %eax
  1040ee:	e8 3d 18 00 00       	call   105930 <alloc_page>
  1040f3:	83 c4 10             	add    $0x10,%esp
  1040f6:	c9                   	leave  
  1040f7:	c3                   	ret    

001040f8 <checkpoint>:
  1040f8:	55                   	push   %ebp
  1040f9:	89 e5                	mov    %esp,%ebp
  1040fb:	83 ec 08             	sub    $0x8,%esp
  1040fe:	83 ec 0c             	sub    $0xc,%esp
  104101:	68 61 64 10 00       	push   $0x106461
  104106:	e8 3b e5 ff ff       	call   102646 <debug_info>
  10410b:	83 c4 10             	add    $0x10,%esp
  10410e:	90                   	nop
  10410f:	c9                   	leave  
  104110:	c3                   	ret    

00104111 <trap>:
  104111:	55                   	push   %ebp
  104112:	89 e5                	mov    %esp,%ebp
  104114:	83 ec 08             	sub    $0x8,%esp
  104117:	8b 45 08             	mov    0x8(%ebp),%eax
  10411a:	8b 40 28             	mov    0x28(%eax),%eax
  10411d:	83 f8 0e             	cmp    $0xe,%eax
  104120:	75 1d                	jne    10413f <trap+0x2e>
  104122:	83 ec 0c             	sub    $0xc,%esp
  104125:	6a 00                	push   $0x0
  104127:	e8 c4 0d 00 00       	call   104ef0 <set_pdir_base>
  10412c:	83 c4 10             	add    $0x10,%esp
  10412f:	83 ec 0c             	sub    $0xc,%esp
  104132:	ff 75 08             	pushl  0x8(%ebp)
  104135:	e8 2d ff ff ff       	call   104067 <pgflt_handler>
  10413a:	83 c4 10             	add    $0x10,%esp
  10413d:	eb 40                	jmp    10417f <trap+0x6e>
  10413f:	8b 45 08             	mov    0x8(%ebp),%eax
  104142:	8b 40 28             	mov    0x28(%eax),%eax
  104145:	50                   	push   %eax
  104146:	68 6e 64 10 00       	push   $0x10646e
  10414b:	6a 4e                	push   $0x4e
  10414d:	68 79 62 10 00       	push   $0x106279
  104152:	e8 10 e5 ff ff       	call   102667 <debug_normal>
  104157:	83 c4 10             	add    $0x10,%esp
  10415a:	83 ec 0c             	sub    $0xc,%esp
  10415d:	ff 75 08             	pushl  0x8(%ebp)
  104160:	e8 c6 fc ff ff       	call   103e2b <trap_dump>
  104165:	83 c4 10             	add    $0x10,%esp
  104168:	83 ec 04             	sub    $0x4,%esp
  10416b:	68 82 64 10 00       	push   $0x106482
  104170:	6a 50                	push   $0x50
  104172:	68 79 62 10 00       	push   $0x106279
  104177:	e8 8a e5 ff ff       	call   102706 <debug_panic>
  10417c:	83 c4 10             	add    $0x10,%esp
  10417f:	a1 4c ff 10 00       	mov    0x10ff4c,%eax
  104184:	83 ec 0c             	sub    $0xc,%esp
  104187:	50                   	push   %eax
  104188:	e8 63 0d 00 00       	call   104ef0 <set_pdir_base>
  10418d:	83 c4 10             	add    $0x10,%esp
  104190:	83 ec 0c             	sub    $0xc,%esp
  104193:	ff 75 08             	pushl  0x8(%ebp)
  104196:	e8 35 e2 ff ff       	call   1023d0 <trap_return>
  10419b:	83 c4 10             	add    $0x10,%esp
  10419e:	90                   	nop
  10419f:	c9                   	leave  
  1041a0:	c3                   	ret    
  1041a1:	66 90                	xchg   %ax,%ax
  1041a3:	66 90                	xchg   %ax,%ax
  1041a5:	66 90                	xchg   %ax,%ax
  1041a7:	66 90                	xchg   %ax,%ax
  1041a9:	66 90                	xchg   %ax,%ax
  1041ab:	66 90                	xchg   %ax,%ax
  1041ad:	66 90                	xchg   %ax,%ax
  1041af:	90                   	nop

001041b0 <kern_init>:
    #endif
}

void
kern_init (uintptr_t mbi_addr)
{
  1041b0:	83 ec 18             	sub    $0x18,%esp
    #ifdef TEST
    pdir_init_kern(mbi_addr);
  1041b3:	ff 74 24 1c          	pushl  0x1c(%esp)
  1041b7:	e8 04 15 00 00       	call   1056c0 <pdir_init_kern>
    #else
    paging_init (mbi_addr);
    #endif

    KERN_DEBUG("Kernel initialized.\n");
  1041bc:	83 c4 0c             	add    $0xc,%esp
  1041bf:	68 89 64 10 00       	push   $0x106489
  1041c4:	6a 50                	push   $0x50
  1041c6:	68 9e 64 10 00       	push   $0x10649e
  1041cb:	e8 97 e4 ff ff       	call   102667 <debug_normal>
#endif

static void
kern_main (void)
{
    KERN_DEBUG("In kernel main.\n\n");
  1041d0:	83 c4 0c             	add    $0xc,%esp
  1041d3:	68 af 64 10 00       	push   $0x1064af
  1041d8:	6a 16                	push   $0x16
  1041da:	68 9e 64 10 00       	push   $0x10649e
  1041df:	e8 83 e4 ff ff       	call   102667 <debug_normal>

    #ifdef TEST
    dprintf("Testing the MContainer layer...\n");
  1041e4:	c7 04 24 58 65 10 00 	movl   $0x106558,(%esp)
  1041eb:	e8 dc e6 ff ff       	call   1028cc <dprintf>
    if(test_MContainer() == 0)
  1041f0:	e8 db 0c 00 00       	call   104ed0 <test_MContainer>
  1041f5:	83 c4 10             	add    $0x10,%esp
  1041f8:	84 c0                	test   %al,%al
  1041fa:	0f 85 40 01 00 00    	jne    104340 <kern_init+0x190>
      dprintf("All tests passed.\n");
  104200:	83 ec 0c             	sub    $0xc,%esp
  104203:	68 c1 64 10 00       	push   $0x1064c1
  104208:	e8 bf e6 ff ff       	call   1028cc <dprintf>
  10420d:	83 c4 10             	add    $0x10,%esp
    else
      dprintf("Test failed.\n");
    dprintf("\n");
  104210:	83 ec 0c             	sub    $0xc,%esp
  104213:	68 bf 64 10 00       	push   $0x1064bf
  104218:	e8 af e6 ff ff       	call   1028cc <dprintf>

    dprintf("Testing the MPTIntro layer...\n");
  10421d:	c7 04 24 7c 65 10 00 	movl   $0x10657c,(%esp)
  104224:	e8 a3 e6 ff ff       	call   1028cc <dprintf>
    if(test_MPTIntro() == 0)
  104229:	e8 c2 0f 00 00       	call   1051f0 <test_MPTIntro>
  10422e:	83 c4 10             	add    $0x10,%esp
  104231:	84 c0                	test   %al,%al
  104233:	0f 85 67 01 00 00    	jne    1043a0 <kern_init+0x1f0>
      dprintf("All tests passed.\n");
  104239:	83 ec 0c             	sub    $0xc,%esp
  10423c:	68 c1 64 10 00       	push   $0x1064c1
  104241:	e8 86 e6 ff ff       	call   1028cc <dprintf>
  104246:	83 c4 10             	add    $0x10,%esp
    else
      dprintf("Test failed.\n");
    dprintf("\n");
  104249:	83 ec 0c             	sub    $0xc,%esp
  10424c:	68 bf 64 10 00       	push   $0x1064bf
  104251:	e8 76 e6 ff ff       	call   1028cc <dprintf>

    dprintf("Testing the MPTOp layer...\n");
  104256:	c7 04 24 e2 64 10 00 	movl   $0x1064e2,(%esp)
  10425d:	e8 6a e6 ff ff       	call   1028cc <dprintf>
    if(test_MPTOp() == 0)
  104262:	e8 e9 11 00 00       	call   105450 <test_MPTOp>
  104267:	83 c4 10             	add    $0x10,%esp
  10426a:	84 c0                	test   %al,%al
  10426c:	0f 85 16 01 00 00    	jne    104388 <kern_init+0x1d8>
      dprintf("All tests passed.\n");
  104272:	83 ec 0c             	sub    $0xc,%esp
  104275:	68 c1 64 10 00       	push   $0x1064c1
  10427a:	e8 4d e6 ff ff       	call   1028cc <dprintf>
  10427f:	83 c4 10             	add    $0x10,%esp
    else
      dprintf("Test failed.\n");
    dprintf("\n");
  104282:	83 ec 0c             	sub    $0xc,%esp
  104285:	68 bf 64 10 00       	push   $0x1064bf
  10428a:	e8 3d e6 ff ff       	call   1028cc <dprintf>

    dprintf("Testing the MPTComm layer...\n");
  10428f:	c7 04 24 fe 64 10 00 	movl   $0x1064fe,(%esp)
  104296:	e8 31 e6 ff ff       	call   1028cc <dprintf>
    if(test_MPTComm() == 0)
  10429b:	e8 00 14 00 00       	call   1056a0 <test_MPTComm>
  1042a0:	83 c4 10             	add    $0x10,%esp
  1042a3:	84 c0                	test   %al,%al
  1042a5:	0f 85 c5 00 00 00    	jne    104370 <kern_init+0x1c0>
      dprintf("All tests passed.\n");
  1042ab:	83 ec 0c             	sub    $0xc,%esp
  1042ae:	68 c1 64 10 00       	push   $0x1064c1
  1042b3:	e8 14 e6 ff ff       	call   1028cc <dprintf>
  1042b8:	83 c4 10             	add    $0x10,%esp
    else
      dprintf("Test failed.\n");
    dprintf("\n");
  1042bb:	83 ec 0c             	sub    $0xc,%esp
  1042be:	68 bf 64 10 00       	push   $0x1064bf
  1042c3:	e8 04 e6 ff ff       	call   1028cc <dprintf>

    dprintf("Testing the MPTKern layer...\n");
  1042c8:	c7 04 24 1c 65 10 00 	movl   $0x10651c,(%esp)
  1042cf:	e8 f8 e5 ff ff       	call   1028cc <dprintf>
    if(test_MPTKern() == 0)
  1042d4:	e8 17 16 00 00       	call   1058f0 <test_MPTKern>
  1042d9:	83 c4 10             	add    $0x10,%esp
  1042dc:	84 c0                	test   %al,%al
  1042de:	75 78                	jne    104358 <kern_init+0x1a8>
      dprintf("All tests passed.\n");
  1042e0:	83 ec 0c             	sub    $0xc,%esp
  1042e3:	68 c1 64 10 00       	push   $0x1064c1
  1042e8:	e8 df e5 ff ff       	call   1028cc <dprintf>
  1042ed:	83 c4 10             	add    $0x10,%esp
    else
      dprintf("Test failed.\n");
    dprintf("\n");
  1042f0:	83 ec 0c             	sub    $0xc,%esp
  1042f3:	68 bf 64 10 00       	push   $0x1064bf
  1042f8:	e8 cf e5 ff ff       	call   1028cc <dprintf>

    dprintf("Testing the MPTNew layer...\n");
  1042fd:	c7 04 24 3a 65 10 00 	movl   $0x10653a,(%esp)
  104304:	e8 c3 e5 ff ff       	call   1028cc <dprintf>
    if(test_MPTNew() == 0)
  104309:	e8 42 17 00 00       	call   105a50 <test_MPTNew>
  10430e:	83 c4 10             	add    $0x10,%esp
  104311:	84 c0                	test   %al,%al
  104313:	0f 84 9f 00 00 00    	je     1043b8 <kern_init+0x208>
      dprintf("All tests passed.\n");
    else
      dprintf("Test failed.\n");
  104319:	83 ec 0c             	sub    $0xc,%esp
  10431c:	68 d4 64 10 00       	push   $0x1064d4
  104321:	e8 a6 e5 ff ff       	call   1028cc <dprintf>
  104326:	83 c4 10             	add    $0x10,%esp
    dprintf("\nTest complete. Please Use Ctrl-a x to exit qemu.");
  104329:	c7 44 24 10 9c 65 10 	movl   $0x10659c,0x10(%esp)
  104330:	00 
    #endif

    KERN_DEBUG("Kernel initialized.\n");

    kern_main ();
}
  104331:	83 c4 0c             	add    $0xc,%esp
    dprintf("Testing the MPTNew layer...\n");
    if(test_MPTNew() == 0)
      dprintf("All tests passed.\n");
    else
      dprintf("Test failed.\n");
    dprintf("\nTest complete. Please Use Ctrl-a x to exit qemu.");
  104334:	e9 93 e5 ff ff       	jmp    1028cc <dprintf>
  104339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    #ifdef TEST
    dprintf("Testing the MContainer layer...\n");
    if(test_MContainer() == 0)
      dprintf("All tests passed.\n");
    else
      dprintf("Test failed.\n");
  104340:	83 ec 0c             	sub    $0xc,%esp
  104343:	68 d4 64 10 00       	push   $0x1064d4
  104348:	e8 7f e5 ff ff       	call   1028cc <dprintf>
  10434d:	83 c4 10             	add    $0x10,%esp
  104350:	e9 bb fe ff ff       	jmp    104210 <kern_init+0x60>
  104355:	8d 76 00             	lea    0x0(%esi),%esi

    dprintf("Testing the MPTKern layer...\n");
    if(test_MPTKern() == 0)
      dprintf("All tests passed.\n");
    else
      dprintf("Test failed.\n");
  104358:	83 ec 0c             	sub    $0xc,%esp
  10435b:	68 d4 64 10 00       	push   $0x1064d4
  104360:	e8 67 e5 ff ff       	call   1028cc <dprintf>
  104365:	83 c4 10             	add    $0x10,%esp
  104368:	eb 86                	jmp    1042f0 <kern_init+0x140>
  10436a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    dprintf("Testing the MPTComm layer...\n");
    if(test_MPTComm() == 0)
      dprintf("All tests passed.\n");
    else
      dprintf("Test failed.\n");
  104370:	83 ec 0c             	sub    $0xc,%esp
  104373:	68 d4 64 10 00       	push   $0x1064d4
  104378:	e8 4f e5 ff ff       	call   1028cc <dprintf>
  10437d:	83 c4 10             	add    $0x10,%esp
  104380:	e9 36 ff ff ff       	jmp    1042bb <kern_init+0x10b>
  104385:	8d 76 00             	lea    0x0(%esi),%esi

    dprintf("Testing the MPTOp layer...\n");
    if(test_MPTOp() == 0)
      dprintf("All tests passed.\n");
    else
      dprintf("Test failed.\n");
  104388:	83 ec 0c             	sub    $0xc,%esp
  10438b:	68 d4 64 10 00       	push   $0x1064d4
  104390:	e8 37 e5 ff ff       	call   1028cc <dprintf>
  104395:	83 c4 10             	add    $0x10,%esp
  104398:	e9 e5 fe ff ff       	jmp    104282 <kern_init+0xd2>
  10439d:	8d 76 00             	lea    0x0(%esi),%esi

    dprintf("Testing the MPTIntro layer...\n");
    if(test_MPTIntro() == 0)
      dprintf("All tests passed.\n");
    else
      dprintf("Test failed.\n");
  1043a0:	83 ec 0c             	sub    $0xc,%esp
  1043a3:	68 d4 64 10 00       	push   $0x1064d4
  1043a8:	e8 1f e5 ff ff       	call   1028cc <dprintf>
  1043ad:	83 c4 10             	add    $0x10,%esp
  1043b0:	e9 94 fe ff ff       	jmp    104249 <kern_init+0x99>
  1043b5:	8d 76 00             	lea    0x0(%esi),%esi
      dprintf("Test failed.\n");
    dprintf("\n");

    dprintf("Testing the MPTNew layer...\n");
    if(test_MPTNew() == 0)
      dprintf("All tests passed.\n");
  1043b8:	83 ec 0c             	sub    $0xc,%esp
  1043bb:	68 c1 64 10 00       	push   $0x1064c1
  1043c0:	e8 07 e5 ff ff       	call   1028cc <dprintf>
  1043c5:	83 c4 10             	add    $0x10,%esp
    else
      dprintf("Test failed.\n");
    dprintf("\nTest complete. Please Use Ctrl-a x to exit qemu.");
  1043c8:	c7 44 24 10 9c 65 10 	movl   $0x10659c,0x10(%esp)
  1043cf:	00 
    #endif

    KERN_DEBUG("Kernel initialized.\n");

    kern_main ();
}
  1043d0:	83 c4 0c             	add    $0xc,%esp
    dprintf("Testing the MPTNew layer...\n");
    if(test_MPTNew() == 0)
      dprintf("All tests passed.\n");
    else
      dprintf("Test failed.\n");
    dprintf("\nTest complete. Please Use Ctrl-a x to exit qemu.");
  1043d3:	e9 f4 e4 ff ff       	jmp    1028cc <dprintf>
  1043d8:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  1043de:	00 00                	add    %al,(%eax)
  1043e0:	fb                   	sti    
  1043e1:	4f                   	dec    %edi
  1043e2:	52                   	push   %edx
  1043e3:	e4                   	.byte 0xe4

001043e4 <start>:
  1043e4:	fa                   	cli    
  1043e5:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
  1043ea:	75 27                	jne    104413 <spin>
  1043ec:	89 1d 14 44 10 00    	mov    %ebx,0x104414
  1043f2:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
  1043f9:	34 12 
  1043fb:	6a 02                	push   $0x2
  1043fd:	9d                   	popf   
  1043fe:	bd 00 00 00 00       	mov    $0x0,%ebp
  104403:	bc 00 20 91 00       	mov    $0x912000,%esp
  104408:	ff 35 14 44 10 00    	pushl  0x104414
  10440e:	e8 9d fd ff ff       	call   1041b0 <kern_init>

00104413 <spin>:
  104413:	f4                   	hlt    

00104414 <multiboot_ptr>:
  104414:	00 00                	add    %al,(%eax)
  104416:	00 00                	add    %al,(%eax)
  104418:	66 90                	xchg   %ax,%ax
  10441a:	66 90                	xchg   %ax,%ax
  10441c:	66 90                	xchg   %ax,%ax
  10441e:	66 90                	xchg   %ax,%ax

00104420 <get_nps>:
//The getter function for NUM_PAGES.
unsigned int
get_nps(void)
{
	return NUM_PAGES;
}
  104420:	a1 60 ff 90 00       	mov    0x90ff60,%eax
  104425:	c3                   	ret    
  104426:	8d 76 00             	lea    0x0(%esi),%esi
  104429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104430 <set_nps>:

//The setter function for NUM_PAGES.
void
set_nps(unsigned int nps)
{
	NUM_PAGES = nps;
  104430:	8b 44 24 04          	mov    0x4(%esp),%eax
  104434:	a3 60 ff 90 00       	mov    %eax,0x90ff60
  104439:	c3                   	ret    
  10443a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104440 <at_is_norm>:
 * If the page with the given index has the normal permission,
 * then returns 1, otherwise returns 0.
 */
unsigned int
at_is_norm(unsigned int page_index)
{   
  104440:	8b 54 24 04          	mov    0x4(%esp),%edx
  104444:	31 c0                	xor    %eax,%eax
    if (page_index >= (1 << 20))
  104446:	81 fa ff ff 0f 00    	cmp    $0xfffff,%edx
  10444c:	77 0b                	ja     104459 <at_is_norm+0x19>
    {
      return 0;
    }
    if(AT[page_index].perm > 1) {
  10444e:	83 3c d5 60 ff 10 00 	cmpl   $0x1,0x10ff60(,%edx,8)
  104455:	01 
  104456:	0f 97 c0             	seta   %al
  104459:	0f b6 c0             	movzbl %al,%eax
        return 1;
    }
    return 0;
}
  10445c:	c3                   	ret    
  10445d:	8d 76 00             	lea    0x0(%esi),%esi

00104460 <at_set_perm>:
 * Sets the permission of the page with given index.
 * It also marks the page as unallocated.
 */
void
at_set_perm(unsigned int page_index, unsigned int norm_val)
{   
  104460:	8b 44 24 04          	mov    0x4(%esp),%eax
    if (page_index >= (1 << 20))
  104464:	3d ff ff 0f 00       	cmp    $0xfffff,%eax
  104469:	77 0b                	ja     104476 <at_set_perm+0x16>
    {
      return;
    }
    AT[page_index].perm = norm_val;
  10446b:	8b 54 24 08          	mov    0x8(%esp),%edx
  10446f:	89 14 c5 60 ff 10 00 	mov    %edx,0x10ff60(,%eax,8)
  104476:	f3 c3                	repz ret 
  104478:	90                   	nop
  104479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104480 <at_is_allocated>:
 * The getter function for the physical page allocation flag.
 * Returns 0 if the page is not allocated. O.w., returns 1.
 */
unsigned int
at_is_allocated(unsigned int page_index)
{   
  104480:	8b 54 24 04          	mov    0x4(%esp),%edx
  104484:	31 c0                	xor    %eax,%eax
    if (page_index >= (1 << 20))
  104486:	81 fa ff ff 0f 00    	cmp    $0xfffff,%edx
  10448c:	77 0c                	ja     10449a <at_is_allocated+0x1a>
    {
      return 0;
    }
    if (AT[page_index].allocated > 0) {
  10448e:	8b 04 d5 64 ff 10 00 	mov    0x10ff64(,%edx,8),%eax
  104495:	85 c0                	test   %eax,%eax
  104497:	0f 95 c0             	setne  %al
  10449a:	0f b6 c0             	movzbl %al,%eax
        return 1;
    }
  return 0;
}
  10449d:	c3                   	ret    
  10449e:	66 90                	xchg   %ax,%ax

001044a0 <at_set_allocated>:
 * The setter function for the physical page allocation flag.
 * Set the flag of the page with given index to the given value.
 */
void
at_set_allocated(unsigned int page_index, unsigned int allocated)
{   
  1044a0:	8b 44 24 04          	mov    0x4(%esp),%eax
    if (page_index >= (1 << 20))
  1044a4:	3d ff ff 0f 00       	cmp    $0xfffff,%eax
  1044a9:	77 0b                	ja     1044b6 <at_set_allocated+0x16>
    {
      return;
    }
    AT[page_index].allocated = allocated;
  1044ab:	8b 54 24 08          	mov    0x8(%esp),%edx
  1044af:	89 14 c5 64 ff 10 00 	mov    %edx,0x10ff64(,%eax,8)
  1044b6:	f3 c3                	repz ret 
  1044b8:	66 90                	xchg   %ax,%ax
  1044ba:	66 90                	xchg   %ax,%ax
  1044bc:	66 90                	xchg   %ax,%ax
  1044be:	66 90                	xchg   %ax,%ax

001044c0 <MATIntro_test1>:
#include <lib/debug.h>
#include "export.h"

int MATIntro_test1()
{
  1044c0:	55                   	push   %ebp
  1044c1:	57                   	push   %edi
  1044c2:	56                   	push   %esi
  1044c3:	53                   	push   %ebx
  int rn10[] = {1,3,5,6,78,3576,32,8,0,100};
  int i;
  int nps = get_nps();
  1044c4:	be 01 00 00 00       	mov    $0x1,%esi
#include <lib/debug.h>
#include "export.h"

int MATIntro_test1()
{
  1044c9:	83 ec 3c             	sub    $0x3c,%esp
  int rn10[] = {1,3,5,6,78,3576,32,8,0,100};
  1044cc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  1044d3:	00 
  1044d4:	c7 44 24 0c 03 00 00 	movl   $0x3,0xc(%esp)
  1044db:	00 
  1044dc:	8d 5c 24 0c          	lea    0xc(%esp),%ebx
  1044e0:	c7 44 24 10 05 00 00 	movl   $0x5,0x10(%esp)
  1044e7:	00 
  1044e8:	c7 44 24 14 06 00 00 	movl   $0x6,0x14(%esp)
  1044ef:	00 
  1044f0:	8d 7c 24 30          	lea    0x30(%esp),%edi
  1044f4:	c7 44 24 18 4e 00 00 	movl   $0x4e,0x18(%esp)
  1044fb:	00 
  1044fc:	c7 44 24 1c f8 0d 00 	movl   $0xdf8,0x1c(%esp)
  104503:	00 
  104504:	c7 44 24 20 20 00 00 	movl   $0x20,0x20(%esp)
  10450b:	00 
  10450c:	c7 44 24 24 08 00 00 	movl   $0x8,0x24(%esp)
  104513:	00 
  104514:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  10451b:	00 
  10451c:	c7 44 24 2c 64 00 00 	movl   $0x64,0x2c(%esp)
  104523:	00 
  int i;
  int nps = get_nps();
  104524:	e8 f7 fe ff ff       	call   104420 <get_nps>
  104529:	89 c5                	mov    %eax,%ebp
  10452b:	eb 08                	jmp    104535 <MATIntro_test1+0x75>
  10452d:	8d 76 00             	lea    0x0(%esi),%esi
  104530:	8b 33                	mov    (%ebx),%esi
  104532:	83 c3 04             	add    $0x4,%ebx
  for(i = 0; i< 10; i++) {
    set_nps(rn10[i]);
  104535:	83 ec 0c             	sub    $0xc,%esp
  104538:	56                   	push   %esi
  104539:	e8 f2 fe ff ff       	call   104430 <set_nps>
    if (get_nps() != rn10[i]) {
  10453e:	e8 dd fe ff ff       	call   104420 <get_nps>
  104543:	83 c4 10             	add    $0x10,%esp
  104546:	39 c6                	cmp    %eax,%esi
  104548:	75 26                	jne    104570 <MATIntro_test1+0xb0>
int MATIntro_test1()
{
  int rn10[] = {1,3,5,6,78,3576,32,8,0,100};
  int i;
  int nps = get_nps();
  for(i = 0; i< 10; i++) {
  10454a:	39 fb                	cmp    %edi,%ebx
  10454c:	75 e2                	jne    104530 <MATIntro_test1+0x70>
      set_nps(nps);
      dprintf("test 1 failed.\n");
      return 1;
    }
  }
  set_nps(nps);
  10454e:	83 ec 0c             	sub    $0xc,%esp
  104551:	55                   	push   %ebp
  104552:	e8 d9 fe ff ff       	call   104430 <set_nps>
  dprintf("test 1 passed.\n");
  104557:	c7 04 24 de 65 10 00 	movl   $0x1065de,(%esp)
  10455e:	e8 69 e3 ff ff       	call   1028cc <dprintf>
  return 0;
  104563:	83 c4 10             	add    $0x10,%esp
  104566:	31 c0                	xor    %eax,%eax
}
  104568:	83 c4 3c             	add    $0x3c,%esp
  10456b:	5b                   	pop    %ebx
  10456c:	5e                   	pop    %esi
  10456d:	5f                   	pop    %edi
  10456e:	5d                   	pop    %ebp
  10456f:	c3                   	ret    
  int i;
  int nps = get_nps();
  for(i = 0; i< 10; i++) {
    set_nps(rn10[i]);
    if (get_nps() != rn10[i]) {
      set_nps(nps);
  104570:	83 ec 0c             	sub    $0xc,%esp
  104573:	55                   	push   %ebp
  104574:	e8 b7 fe ff ff       	call   104430 <set_nps>
      dprintf("test 1 failed.\n");
  104579:	c7 04 24 ce 65 10 00 	movl   $0x1065ce,(%esp)
  104580:	e8 47 e3 ff ff       	call   1028cc <dprintf>
      return 1;
  104585:	83 c4 10             	add    $0x10,%esp
  104588:	b8 01 00 00 00       	mov    $0x1,%eax
    }
  }
  set_nps(nps);
  dprintf("test 1 passed.\n");
  return 0;
}
  10458d:	83 c4 3c             	add    $0x3c,%esp
  104590:	5b                   	pop    %ebx
  104591:	5e                   	pop    %esi
  104592:	5f                   	pop    %edi
  104593:	5d                   	pop    %ebp
  104594:	c3                   	ret    
  104595:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001045a0 <MATIntro_test2>:

int MATIntro_test2()
{
  1045a0:	83 ec 14             	sub    $0x14,%esp
  at_set_perm(0, 0);
  1045a3:	6a 00                	push   $0x0
  1045a5:	6a 00                	push   $0x0
  1045a7:	e8 b4 fe ff ff       	call   104460 <at_set_perm>
  if (at_is_norm(0) != 0 || at_is_allocated(0) != 0) {
  1045ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1045b3:	e8 88 fe ff ff       	call   104440 <at_is_norm>
  1045b8:	83 c4 10             	add    $0x10,%esp
  1045bb:	85 c0                	test   %eax,%eax
  1045bd:	75 11                	jne    1045d0 <MATIntro_test2+0x30>
  1045bf:	83 ec 0c             	sub    $0xc,%esp
  1045c2:	6a 00                	push   $0x0
  1045c4:	e8 b7 fe ff ff       	call   104480 <at_is_allocated>
  1045c9:	83 c4 10             	add    $0x10,%esp
  1045cc:	85 c0                	test   %eax,%eax
  1045ce:	74 28                	je     1045f8 <MATIntro_test2+0x58>
    at_set_perm(0, 0);
  1045d0:	83 ec 08             	sub    $0x8,%esp
  1045d3:	6a 00                	push   $0x0
  1045d5:	6a 00                	push   $0x0
  1045d7:	e8 84 fe ff ff       	call   104460 <at_set_perm>
    dprintf("test 2 failed.\n");
  1045dc:	c7 04 24 ee 65 10 00 	movl   $0x1065ee,(%esp)
  1045e3:	e8 e4 e2 ff ff       	call   1028cc <dprintf>
    return 1;
  1045e8:	83 c4 10             	add    $0x10,%esp
  1045eb:	b8 01 00 00 00       	mov    $0x1,%eax
    return 1;
  }
  at_set_perm(0, 0);
  dprintf("test 2 passed.\n");
  return 0;
}
  1045f0:	83 c4 0c             	add    $0xc,%esp
  1045f3:	c3                   	ret    
  1045f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (at_is_norm(0) != 0 || at_is_allocated(0) != 0) {
    at_set_perm(0, 0);
    dprintf("test 2 failed.\n");
    return 1;
  }
  at_set_perm(0, 1);
  1045f8:	83 ec 08             	sub    $0x8,%esp
  1045fb:	6a 01                	push   $0x1
  1045fd:	6a 00                	push   $0x0
  1045ff:	e8 5c fe ff ff       	call   104460 <at_set_perm>
  if (at_is_norm(0) != 0 || at_is_allocated(0) != 0) {
  104604:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10460b:	e8 30 fe ff ff       	call   104440 <at_is_norm>
  104610:	83 c4 10             	add    $0x10,%esp
  104613:	85 c0                	test   %eax,%eax
  104615:	75 b9                	jne    1045d0 <MATIntro_test2+0x30>
  104617:	83 ec 0c             	sub    $0xc,%esp
  10461a:	6a 00                	push   $0x0
  10461c:	e8 5f fe ff ff       	call   104480 <at_is_allocated>
  104621:	83 c4 10             	add    $0x10,%esp
  104624:	85 c0                	test   %eax,%eax
  104626:	75 a8                	jne    1045d0 <MATIntro_test2+0x30>
    at_set_perm(0, 0);
    dprintf("test 2 failed.\n");
    return 1;
  }
  at_set_perm(0, 2);
  104628:	83 ec 08             	sub    $0x8,%esp
  10462b:	6a 02                	push   $0x2
  10462d:	6a 00                	push   $0x0
  10462f:	e8 2c fe ff ff       	call   104460 <at_set_perm>
  if (at_is_norm(0) != 1 || at_is_allocated(0) != 0) {
  104634:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10463b:	e8 00 fe ff ff       	call   104440 <at_is_norm>
  104640:	83 c4 10             	add    $0x10,%esp
  104643:	83 f8 01             	cmp    $0x1,%eax
  104646:	75 88                	jne    1045d0 <MATIntro_test2+0x30>
  104648:	83 ec 0c             	sub    $0xc,%esp
  10464b:	6a 00                	push   $0x0
  10464d:	e8 2e fe ff ff       	call   104480 <at_is_allocated>
  104652:	83 c4 10             	add    $0x10,%esp
  104655:	85 c0                	test   %eax,%eax
  104657:	0f 85 73 ff ff ff    	jne    1045d0 <MATIntro_test2+0x30>
    at_set_perm(0, 0);
    dprintf("test 2 failed.\n");
    return 1;
  }
  at_set_perm(0, 100);
  10465d:	83 ec 08             	sub    $0x8,%esp
  104660:	6a 64                	push   $0x64
  104662:	6a 00                	push   $0x0
  104664:	e8 f7 fd ff ff       	call   104460 <at_set_perm>
  if (at_is_norm(0) != 1 || at_is_allocated(0) != 0) {
  104669:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104670:	e8 cb fd ff ff       	call   104440 <at_is_norm>
  104675:	83 c4 10             	add    $0x10,%esp
  104678:	83 f8 01             	cmp    $0x1,%eax
  10467b:	0f 85 4f ff ff ff    	jne    1045d0 <MATIntro_test2+0x30>
  104681:	83 ec 0c             	sub    $0xc,%esp
  104684:	6a 00                	push   $0x0
  104686:	e8 f5 fd ff ff       	call   104480 <at_is_allocated>
  10468b:	83 c4 10             	add    $0x10,%esp
  10468e:	85 c0                	test   %eax,%eax
  104690:	0f 85 3a ff ff ff    	jne    1045d0 <MATIntro_test2+0x30>
    at_set_perm(0, 0);
    dprintf("test 2 failed.\n");
    return 1;
  }
  at_set_perm(0, 0);
  104696:	83 ec 08             	sub    $0x8,%esp
  104699:	6a 00                	push   $0x0
  10469b:	6a 00                	push   $0x0
  10469d:	e8 be fd ff ff       	call   104460 <at_set_perm>
  dprintf("test 2 passed.\n");
  1046a2:	c7 04 24 fe 65 10 00 	movl   $0x1065fe,(%esp)
  1046a9:	e8 1e e2 ff ff       	call   1028cc <dprintf>
  1046ae:	83 c4 10             	add    $0x10,%esp
  return 0;
  1046b1:	31 c0                	xor    %eax,%eax
  1046b3:	e9 38 ff ff ff       	jmp    1045f0 <MATIntro_test2+0x50>
  1046b8:	90                   	nop
  1046b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001046c0 <MATIntro_test3>:
}

int MATIntro_test3()
{
  1046c0:	83 ec 14             	sub    $0x14,%esp
  at_set_allocated(1, 0);
  1046c3:	6a 00                	push   $0x0
  1046c5:	6a 01                	push   $0x1
  1046c7:	e8 d4 fd ff ff       	call   1044a0 <at_set_allocated>
  if (at_is_allocated(1) != 0) {
  1046cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1046d3:	e8 a8 fd ff ff       	call   104480 <at_is_allocated>
  1046d8:	83 c4 10             	add    $0x10,%esp
  1046db:	85 c0                	test   %eax,%eax
  1046dd:	75 20                	jne    1046ff <MATIntro_test3+0x3f>
    at_set_allocated(1, 0);
    dprintf("test 3 failed.\n");
    return 1;
  }
  at_set_allocated(1, 1);
  1046df:	83 ec 08             	sub    $0x8,%esp
  1046e2:	6a 01                	push   $0x1
  1046e4:	6a 01                	push   $0x1
  1046e6:	e8 b5 fd ff ff       	call   1044a0 <at_set_allocated>
  if (at_is_allocated(1) != 1) {
  1046eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1046f2:	e8 89 fd ff ff       	call   104480 <at_is_allocated>
  1046f7:	83 c4 10             	add    $0x10,%esp
  1046fa:	83 f8 01             	cmp    $0x1,%eax
  1046fd:	74 29                	je     104728 <MATIntro_test3+0x68>

int MATIntro_test3()
{
  at_set_allocated(1, 0);
  if (at_is_allocated(1) != 0) {
    at_set_allocated(1, 0);
  1046ff:	83 ec 08             	sub    $0x8,%esp
  104702:	6a 00                	push   $0x0
  104704:	6a 01                	push   $0x1
  104706:	e8 95 fd ff ff       	call   1044a0 <at_set_allocated>
    dprintf("test 3 failed.\n");
  10470b:	c7 04 24 0e 66 10 00 	movl   $0x10660e,(%esp)
  104712:	e8 b5 e1 ff ff       	call   1028cc <dprintf>
    return 1;
  104717:	83 c4 10             	add    $0x10,%esp
  10471a:	b8 01 00 00 00       	mov    $0x1,%eax
    return 1;
  }
  at_set_allocated(1, 0);
  dprintf("test 3 passed.\n");
  return 0;
}
  10471f:	83 c4 0c             	add    $0xc,%esp
  104722:	c3                   	ret    
  104723:	90                   	nop
  104724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (at_is_allocated(1) != 1) {
    at_set_allocated(1, 0);
    dprintf("test 3 failed.\n");
    return 1;
  }
  at_set_allocated(1, 100);
  104728:	83 ec 08             	sub    $0x8,%esp
  10472b:	6a 64                	push   $0x64
  10472d:	6a 01                	push   $0x1
  10472f:	e8 6c fd ff ff       	call   1044a0 <at_set_allocated>
  if (at_is_allocated(1) != 1) {
  104734:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10473b:	e8 40 fd ff ff       	call   104480 <at_is_allocated>
  104740:	83 c4 10             	add    $0x10,%esp
  104743:	83 f8 01             	cmp    $0x1,%eax
  104746:	75 b7                	jne    1046ff <MATIntro_test3+0x3f>
    at_set_allocated(1, 0);
    dprintf("test 3 failed.\n");
    return 1;
  }
  at_set_allocated(1, 0);
  104748:	83 ec 08             	sub    $0x8,%esp
  10474b:	6a 00                	push   $0x0
  10474d:	6a 01                	push   $0x1
  10474f:	e8 4c fd ff ff       	call   1044a0 <at_set_allocated>
  dprintf("test 3 passed.\n");
  104754:	c7 04 24 1e 66 10 00 	movl   $0x10661e,(%esp)
  10475b:	e8 6c e1 ff ff       	call   1028cc <dprintf>
  104760:	83 c4 10             	add    $0x10,%esp
  return 0;
  104763:	31 c0                	xor    %eax,%eax
  104765:	eb b8                	jmp    10471f <MATIntro_test3+0x5f>
  104767:	89 f6                	mov    %esi,%esi
  104769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104770 <MATIntro_test_own>:
int MATIntro_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  104770:	31 c0                	xor    %eax,%eax
  104772:	c3                   	ret    
  104773:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104780 <test_MATIntro>:

int test_MATIntro()
{
  104780:	53                   	push   %ebx
  104781:	83 ec 08             	sub    $0x8,%esp
  return MATIntro_test1() + MATIntro_test2() + MATIntro_test3() + MATIntro_test_own();
  104784:	e8 37 fd ff ff       	call   1044c0 <MATIntro_test1>
  104789:	89 c3                	mov    %eax,%ebx
  10478b:	e8 10 fe ff ff       	call   1045a0 <MATIntro_test2>
  104790:	01 c3                	add    %eax,%ebx
  104792:	e8 29 ff ff ff       	call   1046c0 <MATIntro_test3>
}
  104797:	83 c4 08             	add    $0x8,%esp
  return 0;
}

int test_MATIntro()
{
  return MATIntro_test1() + MATIntro_test2() + MATIntro_test3() + MATIntro_test_own();
  10479a:	01 d8                	add    %ebx,%eax
}
  10479c:	5b                   	pop    %ebx
  10479d:	c3                   	ret    
  10479e:	66 90                	xchg   %ax,%ax

001047a0 <pmem_init>:
 *    information available in the physical memory map table.
 *    Review import.h in the current directory for the list of avaiable getter and setter functions.
 */
void
pmem_init(unsigned int mbi_addr)
{
  1047a0:	55                   	push   %ebp
  1047a1:	57                   	push   %edi
   * Hint: Think of it as the highest address possible in the ranges of the memory map table,
   *       divided by the page size.
   */
    nps = (0xFFFFFFFF / PAGESIZE);

	set_nps(nps); // Setting the value computed above to NUM_PAGES.
  1047a2:	bd 01 00 00 00       	mov    $0x1,%ebp
 *    information available in the physical memory map table.
 *    Review import.h in the current directory for the list of avaiable getter and setter functions.
 */
void
pmem_init(unsigned int mbi_addr)
{
  1047a7:	56                   	push   %esi
  1047a8:	53                   	push   %ebx
  1047a9:	83 ec 28             	sub    $0x28,%esp

  // TODO: Define your local variables here.

  //Calls the lower layer initializatin primitives.
  //The parameter mbi_addr shell not be used in the further code.
	devinit(mbi_addr);
  1047ac:	ff 74 24 3c          	pushl  0x3c(%esp)
  1047b0:	e8 ca c1 ff ff       	call   10097f <devinit>
   * Hint: Think of it as the highest address possible in the ranges of the memory map table,
   *       divided by the page size.
   */
    nps = (0xFFFFFFFF / PAGESIZE);

	set_nps(nps); // Setting the value computed above to NUM_PAGES.
  1047b5:	c7 04 24 ff ff 0f 00 	movl   $0xfffff,(%esp)
  1047bc:	e8 6f fc ff ff       	call   104430 <set_nps>
  1047c1:	83 c4 10             	add    $0x10,%esp
  1047c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1047c8:	8d 45 ff             	lea    -0x1(%ebp),%eax
  1047cb:	89 44 24 0c          	mov    %eax,0xc(%esp)
   *    But the ranges in the momory map table may not cover the entire available address space.
   *    That means there may be some gaps between the ranges.
   *    You should still set the permission of those pages in allocation table to 0.
   */
    for(int i = 0;i < nps; i++) {
        if (i < VM_USERLO_PI || i >= VM_USERHI_PI) {
  1047cf:	8d 85 ff ff fb ff    	lea    -0x40001(%ebp),%eax
  1047d5:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  1047da:	0f 87 ab 00 00 00    	ja     10488b <pmem_init+0xeb>
  1047e0:	8d b5 ff ff 0f 00    	lea    0xfffff(%ebp),%esi
  1047e6:	31 db                	xor    %ebx,%ebx
  1047e8:	c1 e6 0c             	shl    $0xc,%esi
  1047eb:	8d 86 00 10 00 00    	lea    0x1000(%esi),%eax
  1047f1:	89 44 24 08          	mov    %eax,0x8(%esp)
  1047f5:	eb 0c                	jmp    104803 <pmem_init+0x63>
  1047f7:	89 f6                	mov    %esi,%esi
  1047f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
            at_set_perm(i,1);
        }else{
            int contain = 0;
            for(int j = 0; j < get_size();j++) {
  104800:	83 c3 01             	add    $0x1,%ebx
  104803:	e8 45 c6 ff ff       	call   100e4d <get_size>
  104808:	39 d8                	cmp    %ebx,%eax
  10480a:	76 6c                	jbe    104878 <pmem_init+0xd8>
              if ( is_usable(j) && get_mms(j) <= i * 4096 && (get_mms(j) + get_mml(j)) > (i+1)*4096)
  10480c:	83 ec 0c             	sub    $0xc,%esp
  10480f:	53                   	push   %ebx
  104810:	e8 00 c7 ff ff       	call   100f15 <is_usable>
  104815:	83 c4 10             	add    $0x10,%esp
  104818:	85 c0                	test   %eax,%eax
  10481a:	74 e4                	je     104800 <pmem_init+0x60>
  10481c:	83 ec 0c             	sub    $0xc,%esp
  10481f:	53                   	push   %ebx
  104820:	e8 32 c6 ff ff       	call   100e57 <get_mms>
  104825:	83 c4 10             	add    $0x10,%esp
  104828:	39 f0                	cmp    %esi,%eax
  10482a:	77 d4                	ja     104800 <pmem_init+0x60>
  10482c:	83 ec 0c             	sub    $0xc,%esp
  10482f:	53                   	push   %ebx
  104830:	e8 22 c6 ff ff       	call   100e57 <get_mms>
  104835:	89 1c 24             	mov    %ebx,(%esp)
  104838:	89 c7                	mov    %eax,%edi
  10483a:	e8 72 c6 ff ff       	call   100eb1 <get_mml>
  10483f:	83 c4 10             	add    $0x10,%esp
  104842:	01 c7                	add    %eax,%edi
  104844:	3b 7c 24 08          	cmp    0x8(%esp),%edi
  104848:	76 b6                	jbe    104800 <pmem_init+0x60>
                contain = 1;
                break;
              }
            }
            if (contain == 1) {
                at_set_perm(i,2);
  10484a:	83 ec 08             	sub    $0x8,%esp
  10484d:	6a 02                	push   $0x2
  10484f:	ff 74 24 18          	pushl  0x18(%esp)
  104853:	e8 08 fc ff ff       	call   104460 <at_set_perm>
  104858:	83 c4 10             	add    $0x10,%esp
  10485b:	83 c5 01             	add    $0x1,%ebp
   * 4. Every page in the allocation table shold be initialized.
   *    But the ranges in the momory map table may not cover the entire available address space.
   *    That means there may be some gaps between the ranges.
   *    You should still set the permission of those pages in allocation table to 0.
   */
    for(int i = 0;i < nps; i++) {
  10485e:	81 fd 00 00 10 00    	cmp    $0x100000,%ebp
  104864:	0f 85 5e ff ff ff    	jne    1047c8 <pmem_init+0x28>
        }
        
    }
    
    
}
  10486a:	83 c4 1c             	add    $0x1c,%esp
  10486d:	5b                   	pop    %ebx
  10486e:	5e                   	pop    %esi
  10486f:	5f                   	pop    %edi
  104870:	5d                   	pop    %ebp
  104871:	c3                   	ret    
  104872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
              }
            }
            if (contain == 1) {
                at_set_perm(i,2);
            }else{
                at_set_perm(i,0);
  104878:	83 ec 08             	sub    $0x8,%esp
  10487b:	6a 00                	push   $0x0
  10487d:	ff 74 24 18          	pushl  0x18(%esp)
  104881:	e8 da fb ff ff       	call   104460 <at_set_perm>
  104886:	83 c4 10             	add    $0x10,%esp
  104889:	eb d0                	jmp    10485b <pmem_init+0xbb>
   *    That means there may be some gaps between the ranges.
   *    You should still set the permission of those pages in allocation table to 0.
   */
    for(int i = 0;i < nps; i++) {
        if (i < VM_USERLO_PI || i >= VM_USERHI_PI) {
            at_set_perm(i,1);
  10488b:	83 ec 08             	sub    $0x8,%esp
  10488e:	6a 01                	push   $0x1
  104890:	ff 74 24 18          	pushl  0x18(%esp)
  104894:	e8 c7 fb ff ff       	call   104460 <at_set_perm>
  104899:	83 c4 10             	add    $0x10,%esp
  10489c:	eb bd                	jmp    10485b <pmem_init+0xbb>
  10489e:	66 90                	xchg   %ax,%ax

001048a0 <MATInit_test1>:
#include <lib/debug.h>
#include <pmm/MATIntro/export.h>

int MATInit_test1()
{
  1048a0:	56                   	push   %esi
  1048a1:	53                   	push   %ebx
  1048a2:	31 db                	xor    %ebx,%ebx
  1048a4:	83 ec 04             	sub    $0x4,%esp
  int i;
  int nps = get_nps();
  1048a7:	e8 74 fb ff ff       	call   104420 <get_nps>
  if (nps <= 1000) {
  1048ac:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  1048b1:	89 c6                	mov    %eax,%esi
  1048b3:	0f 8e a7 00 00 00    	jle    104960 <MATInit_test1+0xc0>
  1048b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1 failed.\n");
    return 1;
  }
  for(i = 0; i < nps; i ++) {
    if (at_is_allocated(i) != 0) {
  1048c0:	83 ec 0c             	sub    $0xc,%esp
  1048c3:	53                   	push   %ebx
  1048c4:	e8 b7 fb ff ff       	call   104480 <at_is_allocated>
  1048c9:	83 c4 10             	add    $0x10,%esp
  1048cc:	85 c0                	test   %eax,%eax
  1048ce:	75 40                	jne    104910 <MATInit_test1+0x70>
      dprintf("allocated: %d: %d\n", i, at_is_allocated(i));
      dprintf("test 1 failed.\n");
      return 1;
    }
    if ((i < 0x40000000/4096 || i >= 0xF0000000/4096) && at_is_norm(i) != 0) {
  1048d0:	8d 83 00 00 fc ff    	lea    -0x40000(%ebx),%eax
  1048d6:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  1048db:	76 10                	jbe    1048ed <MATInit_test1+0x4d>
  1048dd:	83 ec 0c             	sub    $0xc,%esp
  1048e0:	53                   	push   %ebx
  1048e1:	e8 5a fb ff ff       	call   104440 <at_is_norm>
  1048e6:	83 c4 10             	add    $0x10,%esp
  1048e9:	85 c0                	test   %eax,%eax
  1048eb:	75 5b                	jne    104948 <MATInit_test1+0xa8>
  int nps = get_nps();
  if (nps <= 1000) {
    dprintf("test 1 failed.\n");
    return 1;
  }
  for(i = 0; i < nps; i ++) {
  1048ed:	83 c3 01             	add    $0x1,%ebx
  1048f0:	39 de                	cmp    %ebx,%esi
  1048f2:	75 cc                	jne    1048c0 <MATInit_test1+0x20>
      dprintf("norm: %d: %d\n", i, at_is_norm(i));
      dprintf("test 1 failed.\n");
      return 1;
    }
  }
  dprintf("test 1 passed.\n");
  1048f4:	83 ec 0c             	sub    $0xc,%esp
  1048f7:	68 de 65 10 00       	push   $0x1065de
  1048fc:	e8 cb df ff ff       	call   1028cc <dprintf>
  return 0;
  104901:	83 c4 10             	add    $0x10,%esp
  104904:	31 c0                	xor    %eax,%eax
}
  104906:	83 c4 04             	add    $0x4,%esp
  104909:	5b                   	pop    %ebx
  10490a:	5e                   	pop    %esi
  10490b:	c3                   	ret    
  10490c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1 failed.\n");
    return 1;
  }
  for(i = 0; i < nps; i ++) {
    if (at_is_allocated(i) != 0) {
      dprintf("allocated: %d: %d\n", i, at_is_allocated(i));
  104910:	83 ec 0c             	sub    $0xc,%esp
  104913:	53                   	push   %ebx
  104914:	e8 67 fb ff ff       	call   104480 <at_is_allocated>
  104919:	83 c4 0c             	add    $0xc,%esp
  10491c:	50                   	push   %eax
  10491d:	53                   	push   %ebx
  10491e:	68 2e 66 10 00       	push   $0x10662e
      dprintf("test 1 failed.\n");
      return 1;
    }
    if ((i < 0x40000000/4096 || i >= 0xF0000000/4096) && at_is_norm(i) != 0) {
      dprintf("norm: %d: %d\n", i, at_is_norm(i));
  104923:	e8 a4 df ff ff       	call   1028cc <dprintf>
      dprintf("test 1 failed.\n");
  104928:	c7 04 24 ce 65 10 00 	movl   $0x1065ce,(%esp)
  10492f:	e8 98 df ff ff       	call   1028cc <dprintf>
      return 1;
  104934:	83 c4 10             	add    $0x10,%esp
  104937:	b8 01 00 00 00       	mov    $0x1,%eax
    }
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  10493c:	83 c4 04             	add    $0x4,%esp
  10493f:	5b                   	pop    %ebx
  104940:	5e                   	pop    %esi
  104941:	c3                   	ret    
  104942:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      dprintf("allocated: %d: %d\n", i, at_is_allocated(i));
      dprintf("test 1 failed.\n");
      return 1;
    }
    if ((i < 0x40000000/4096 || i >= 0xF0000000/4096) && at_is_norm(i) != 0) {
      dprintf("norm: %d: %d\n", i, at_is_norm(i));
  104948:	83 ec 0c             	sub    $0xc,%esp
  10494b:	53                   	push   %ebx
  10494c:	e8 ef fa ff ff       	call   104440 <at_is_norm>
  104951:	83 c4 0c             	add    $0xc,%esp
  104954:	50                   	push   %eax
  104955:	53                   	push   %ebx
  104956:	68 41 66 10 00       	push   $0x106641
  10495b:	eb c6                	jmp    104923 <MATInit_test1+0x83>
  10495d:	8d 76 00             	lea    0x0(%esi),%esi
int MATInit_test1()
{
  int i;
  int nps = get_nps();
  if (nps <= 1000) {
    dprintf("test 1 failed.\n");
  104960:	83 ec 0c             	sub    $0xc,%esp
  104963:	68 ce 65 10 00       	push   $0x1065ce
  104968:	e8 5f df ff ff       	call   1028cc <dprintf>
    return 1;
  10496d:	83 c4 10             	add    $0x10,%esp
  104970:	b8 01 00 00 00       	mov    $0x1,%eax
      return 1;
    }
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  104975:	83 c4 04             	add    $0x4,%esp
  104978:	5b                   	pop    %ebx
  104979:	5e                   	pop    %esi
  10497a:	c3                   	ret    
  10497b:	90                   	nop
  10497c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104980 <MATInit_test_own>:
int MATInit_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  104980:	31 c0                	xor    %eax,%eax
  104982:	c3                   	ret    
  104983:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104990 <test_MATInit>:

int test_MATInit()
{
  return MATInit_test1() + MATInit_test_own();
  104990:	e9 0b ff ff ff       	jmp    1048a0 <MATInit_test1>
  104995:	66 90                	xchg   %ax,%ax
  104997:	66 90                	xchg   %ax,%ax
  104999:	66 90                	xchg   %ax,%ax
  10499b:	66 90                	xchg   %ax,%ax
  10499d:	66 90                	xchg   %ax,%ax
  10499f:	90                   	nop

001049a0 <palloc>:
 * 2. Optimize the code with the memorization techniques so that you do not have to
 *    scan the allocation table from scratch every time.
 */
unsigned int
palloc()
{ 
  1049a0:	56                   	push   %esi
  1049a1:	53                   	push   %ebx
  1049a2:	bb 00 00 04 00       	mov    $0x40000,%ebx
  1049a7:	83 ec 04             	sub    $0x4,%esp
  if (test != 0)
  1049aa:	8b 35 64 ff 90 00    	mov    0x90ff64,%esi
  1049b0:	85 f6                	test   %esi,%esi
  1049b2:	74 17                	je     1049cb <palloc+0x2b>
  1049b4:	eb 52                	jmp    104a08 <palloc+0x68>
  1049b6:	8d 76 00             	lea    0x0(%esi),%esi
  1049b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  	unsigned int temp = test;
  	test = 0;
  	return temp;	
  }
 
  for (int i = 0x40000000 / 4096; i <= 0xF0000000 / 4096; i++)
  1049c0:	83 c3 01             	add    $0x1,%ebx
  1049c3:	81 fb 01 00 0f 00    	cmp    $0xf0001,%ebx
  1049c9:	74 31                	je     1049fc <palloc+0x5c>
  {
  	if (at_is_norm(i) == 1 && at_is_allocated(i) == 0)
  1049cb:	83 ec 0c             	sub    $0xc,%esp
  1049ce:	53                   	push   %ebx
  1049cf:	e8 6c fa ff ff       	call   104440 <at_is_norm>
  1049d4:	83 c4 10             	add    $0x10,%esp
  1049d7:	83 f8 01             	cmp    $0x1,%eax
  1049da:	75 e4                	jne    1049c0 <palloc+0x20>
  1049dc:	83 ec 0c             	sub    $0xc,%esp
  1049df:	53                   	push   %ebx
  1049e0:	e8 9b fa ff ff       	call   104480 <at_is_allocated>
  1049e5:	83 c4 10             	add    $0x10,%esp
  1049e8:	85 c0                	test   %eax,%eax
  1049ea:	75 d4                	jne    1049c0 <palloc+0x20>
  	{	
  		at_set_allocated(i,1);
  1049ec:	83 ec 08             	sub    $0x8,%esp
  		return i;
  1049ef:	89 de                	mov    %ebx,%esi
 
  for (int i = 0x40000000 / 4096; i <= 0xF0000000 / 4096; i++)
  {
  	if (at_is_norm(i) == 1 && at_is_allocated(i) == 0)
  	{	
  		at_set_allocated(i,1);
  1049f1:	6a 01                	push   $0x1
  1049f3:	53                   	push   %ebx
  1049f4:	e8 a7 fa ff ff       	call   1044a0 <at_set_allocated>
  		return i;
  1049f9:	83 c4 10             	add    $0x10,%esp
  
  	}
  }
  return 0;
}
  1049fc:	83 c4 04             	add    $0x4,%esp
  1049ff:	89 f0                	mov    %esi,%eax
  104a01:	5b                   	pop    %ebx
  104a02:	5e                   	pop    %esi
  104a03:	c3                   	ret    
  104a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
palloc()
{ 
  if (test != 0)
  {
  	unsigned int temp = test;
  	test = 0;
  104a08:	c7 05 64 ff 90 00 00 	movl   $0x0,0x90ff64
  104a0f:	00 00 00 
  		return i;
  
  	}
  }
  return 0;
}
  104a12:	83 c4 04             	add    $0x4,%esp
  104a15:	89 f0                	mov    %esi,%eax
  104a17:	5b                   	pop    %ebx
  104a18:	5e                   	pop    %esi
  104a19:	c3                   	ret    
  104a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104a20 <pfree>:
 *
 * Hint: Simple.
 */
void
pfree(unsigned int pfree_index)
{
  104a20:	53                   	push   %ebx
  104a21:	83 ec 10             	sub    $0x10,%esp
  104a24:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  at_set_allocated(pfree_index,0);
  104a28:	6a 00                	push   $0x0
  104a2a:	53                   	push   %ebx
  104a2b:	e8 70 fa ff ff       	call   1044a0 <at_set_allocated>
  test = pfree_index;
  104a30:	89 1d 64 ff 90 00    	mov    %ebx,0x90ff64
}
  104a36:	83 c4 18             	add    $0x18,%esp
  104a39:	5b                   	pop    %ebx
  104a3a:	c3                   	ret    
  104a3b:	66 90                	xchg   %ax,%ax
  104a3d:	66 90                	xchg   %ax,%ax
  104a3f:	90                   	nop

00104a40 <MATOp_test1>:
#include <lib/debug.h>
#include <pmm/MATIntro/export.h>
#include "export.h"

int MATOp_test1()
{
  104a40:	53                   	push   %ebx
  104a41:	83 ec 08             	sub    $0x8,%esp
  int page_index = palloc();
  104a44:	e8 57 ff ff ff       	call   1049a0 <palloc>
  if (page_index < 262144) {
  104a49:	3d ff ff 03 00       	cmp    $0x3ffff,%eax
#include <pmm/MATIntro/export.h>
#include "export.h"

int MATOp_test1()
{
  int page_index = palloc();
  104a4e:	89 c3                	mov    %eax,%ebx
  if (page_index < 262144) {
  104a50:	7e 11                	jle    104a63 <MATOp_test1+0x23>
    pfree(page_index);
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (at_is_norm(page_index) != 1) {
  104a52:	83 ec 0c             	sub    $0xc,%esp
  104a55:	50                   	push   %eax
  104a56:	e8 e5 f9 ff ff       	call   104440 <at_is_norm>
  104a5b:	83 c4 10             	add    $0x10,%esp
  104a5e:	83 f8 01             	cmp    $0x1,%eax
  104a61:	74 25                	je     104a88 <MATOp_test1+0x48>
    pfree(page_index);
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (at_is_allocated(page_index) != 1) {
    pfree(page_index);
  104a63:	83 ec 0c             	sub    $0xc,%esp
  104a66:	53                   	push   %ebx
  104a67:	e8 b4 ff ff ff       	call   104a20 <pfree>
    dprintf("test 1 failed.\n");
  104a6c:	c7 04 24 ce 65 10 00 	movl   $0x1065ce,(%esp)
  104a73:	e8 54 de ff ff       	call   1028cc <dprintf>
    return 1;
  104a78:	83 c4 10             	add    $0x10,%esp
  104a7b:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  104a80:	83 c4 08             	add    $0x8,%esp
  104a83:	5b                   	pop    %ebx
  104a84:	c3                   	ret    
  104a85:	8d 76 00             	lea    0x0(%esi),%esi
  if (at_is_norm(page_index) != 1) {
    pfree(page_index);
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (at_is_allocated(page_index) != 1) {
  104a88:	83 ec 0c             	sub    $0xc,%esp
  104a8b:	53                   	push   %ebx
  104a8c:	e8 ef f9 ff ff       	call   104480 <at_is_allocated>
  104a91:	83 c4 10             	add    $0x10,%esp
  104a94:	83 f8 01             	cmp    $0x1,%eax
  104a97:	75 ca                	jne    104a63 <MATOp_test1+0x23>
    pfree(page_index);
    dprintf("test 1 failed.\n");
    return 1;
  }
  pfree(page_index);
  104a99:	83 ec 0c             	sub    $0xc,%esp
  104a9c:	53                   	push   %ebx
  104a9d:	e8 7e ff ff ff       	call   104a20 <pfree>
  if (at_is_allocated(page_index) != 0) {
  104aa2:	89 1c 24             	mov    %ebx,(%esp)
  104aa5:	e8 d6 f9 ff ff       	call   104480 <at_is_allocated>
  104aaa:	83 c4 10             	add    $0x10,%esp
  104aad:	85 c0                	test   %eax,%eax
  104aaf:	75 17                	jne    104ac8 <MATOp_test1+0x88>
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  104ab1:	83 ec 0c             	sub    $0xc,%esp
  104ab4:	68 de 65 10 00       	push   $0x1065de
  104ab9:	e8 0e de ff ff       	call   1028cc <dprintf>
  return 0;
  104abe:	83 c4 10             	add    $0x10,%esp
  104ac1:	31 c0                	xor    %eax,%eax
  104ac3:	eb bb                	jmp    104a80 <MATOp_test1+0x40>
  104ac5:	8d 76 00             	lea    0x0(%esi),%esi
    dprintf("test 1 failed.\n");
    return 1;
  }
  pfree(page_index);
  if (at_is_allocated(page_index) != 0) {
    dprintf("test 1 failed.\n");
  104ac8:	83 ec 0c             	sub    $0xc,%esp
  104acb:	68 ce 65 10 00       	push   $0x1065ce
  104ad0:	e8 f7 dd ff ff       	call   1028cc <dprintf>
    return 1;
  104ad5:	83 c4 10             	add    $0x10,%esp
  104ad8:	b8 01 00 00 00       	mov    $0x1,%eax
  104add:	eb a1                	jmp    104a80 <MATOp_test1+0x40>
  104adf:	90                   	nop

00104ae0 <MATOp_test_own>:
int MATOp_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  104ae0:	31 c0                	xor    %eax,%eax
  104ae2:	c3                   	ret    
  104ae3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104af0 <test_MATOp>:

int test_MATOp()
{
  return MATOp_test1() + MATOp_test_own();
  104af0:	e9 4b ff ff ff       	jmp    104a40 <MATOp_test1>
  104af5:	66 90                	xchg   %ax,%ax
  104af7:	66 90                	xchg   %ax,%ax
  104af9:	66 90                	xchg   %ax,%ax
  104afb:	66 90                	xchg   %ax,%ax
  104afd:	66 90                	xchg   %ax,%ax
  104aff:	90                   	nop

00104b00 <container_init>:
/**
 * Initializes the container data for the root process (the one with index 0).
 * The root process is the one that gets spawned first by the kernel.
 */
void container_init(unsigned int mbi_addr)
{
  104b00:	56                   	push   %esi
  104b01:	53                   	push   %ebx
  unsigned int real_quota;
  // TODO: define your local variables here.
  
  pmem_init(mbi_addr);
  real_quota = 0;
  104b02:	31 f6                	xor    %esi,%esi
  /**
   * TODO: compute the available quota and store it into the variable real_quota.
   * It should be the number of the unallocated pages with the normal permission
   * in the physical memory allocation table.
   */
    for (int i = 0; i < get_nps(); i++) {
  104b04:	31 db                	xor    %ebx,%ebx
/**
 * Initializes the container data for the root process (the one with index 0).
 * The root process is the one that gets spawned first by the kernel.
 */
void container_init(unsigned int mbi_addr)
{
  104b06:	83 ec 10             	sub    $0x10,%esp
  unsigned int real_quota;
  // TODO: define your local variables here.
  
  pmem_init(mbi_addr);
  104b09:	ff 74 24 1c          	pushl  0x1c(%esp)
  104b0d:	e8 8e fc ff ff       	call   1047a0 <pmem_init>
  /**
   * TODO: compute the available quota and store it into the variable real_quota.
   * It should be the number of the unallocated pages with the normal permission
   * in the physical memory allocation table.
   */
    for (int i = 0; i < get_nps(); i++) {
  104b12:	83 c4 10             	add    $0x10,%esp
  104b15:	eb 0c                	jmp    104b23 <container_init+0x23>
  104b17:	89 f6                	mov    %esi,%esi
  104b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  104b20:	83 c3 01             	add    $0x1,%ebx
  104b23:	e8 f8 f8 ff ff       	call   104420 <get_nps>
  104b28:	39 d8                	cmp    %ebx,%eax
  104b2a:	76 2c                	jbe    104b58 <container_init+0x58>
        if(at_is_allocated(i) == 0 && at_is_norm(i) == 1) {
  104b2c:	83 ec 0c             	sub    $0xc,%esp
  104b2f:	53                   	push   %ebx
  104b30:	e8 4b f9 ff ff       	call   104480 <at_is_allocated>
  104b35:	83 c4 10             	add    $0x10,%esp
  104b38:	85 c0                	test   %eax,%eax
  104b3a:	75 e4                	jne    104b20 <container_init+0x20>
  104b3c:	83 ec 0c             	sub    $0xc,%esp
  104b3f:	53                   	push   %ebx
  104b40:	e8 fb f8 ff ff       	call   104440 <at_is_norm>
  104b45:	83 c4 10             	add    $0x10,%esp
            real_quota++;
  104b48:	83 f8 01             	cmp    $0x1,%eax
  104b4b:	0f 94 c0             	sete   %al
  104b4e:	0f b6 c0             	movzbl %al,%eax
  104b51:	01 c6                	add    %eax,%esi
  104b53:	eb cb                	jmp    104b20 <container_init+0x20>
  104b55:	8d 76 00             	lea    0x0(%esi),%esi
        }
    }
  KERN_DEBUG("\nreal quota: %d\n\n", real_quota);
  104b58:	56                   	push   %esi
  104b59:	68 4f 66 10 00       	push   $0x10664f
  104b5e:	6a 27                	push   $0x27
  104b60:	68 64 66 10 00       	push   $0x106664
  104b65:	e8 fd da ff ff       	call   102667 <debug_normal>

  CONTAINER[0].quota = real_quota;
  104b6a:	89 35 80 ff 90 00    	mov    %esi,0x90ff80
  CONTAINER[0].usage = 0;
  104b70:	c7 05 84 ff 90 00 00 	movl   $0x0,0x90ff84
  104b77:	00 00 00 
  CONTAINER[0].parent = 0;
  104b7a:	c7 05 88 ff 90 00 00 	movl   $0x0,0x90ff88
  104b81:	00 00 00 
  CONTAINER[0].nchildren = 0;
  104b84:	c7 05 8c ff 90 00 00 	movl   $0x0,0x90ff8c
  104b8b:	00 00 00 
  CONTAINER[0].used = 1;
  104b8e:	c7 05 90 ff 90 00 01 	movl   $0x1,0x90ff90
  104b95:	00 00 00 
}
  104b98:	83 c4 14             	add    $0x14,%esp
  104b9b:	5b                   	pop    %ebx
  104b9c:	5e                   	pop    %esi
  104b9d:	c3                   	ret    
  104b9e:	66 90                	xchg   %ax,%ax

00104ba0 <container_get_parent>:


// get the id of parent process of process # [id]
unsigned int container_get_parent(unsigned int id)
{
  104ba0:	8b 54 24 04          	mov    0x4(%esp),%edx
  104ba4:	31 c0                	xor    %eax,%eax
    if (id > NUM_IDS) {
  104ba6:	83 fa 40             	cmp    $0x40,%edx
  104ba9:	77 0a                	ja     104bb5 <container_get_parent+0x15>
        return 0;
    }
  return CONTAINER[id].parent;
  104bab:	8d 04 92             	lea    (%edx,%edx,4),%eax
  104bae:	8b 04 85 88 ff 90 00 	mov    0x90ff88(,%eax,4),%eax
}
  104bb5:	f3 c3                	repz ret 
  104bb7:	89 f6                	mov    %esi,%esi
  104bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104bc0 <container_get_nchildren>:


// get the number of children of process # [id]
unsigned int container_get_nchildren(unsigned int id)
{
  104bc0:	8b 54 24 04          	mov    0x4(%esp),%edx
  104bc4:	31 c0                	xor    %eax,%eax
    if (id > NUM_IDS) {
  104bc6:	83 fa 40             	cmp    $0x40,%edx
  104bc9:	77 0a                	ja     104bd5 <container_get_nchildren+0x15>
        return 0;
    }
  return CONTAINER[id].nchildren;
  104bcb:	8d 04 92             	lea    (%edx,%edx,4),%eax
  104bce:	8b 04 85 8c ff 90 00 	mov    0x90ff8c(,%eax,4),%eax
}
  104bd5:	f3 c3                	repz ret 
  104bd7:	89 f6                	mov    %esi,%esi
  104bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104be0 <container_get_quota>:


// get the maximum memory quota of process # [id]
unsigned int container_get_quota(unsigned int id)
{
  104be0:	8b 54 24 04          	mov    0x4(%esp),%edx
  104be4:	31 c0                	xor    %eax,%eax
    if (id > NUM_IDS) {
  104be6:	83 fa 40             	cmp    $0x40,%edx
  104be9:	77 0a                	ja     104bf5 <container_get_quota+0x15>
        return 0;
    }
    return CONTAINER[id].quota;
  104beb:	8d 04 92             	lea    (%edx,%edx,4),%eax
  104bee:	8b 04 85 80 ff 90 00 	mov    0x90ff80(,%eax,4),%eax
}
  104bf5:	f3 c3                	repz ret 
  104bf7:	89 f6                	mov    %esi,%esi
  104bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104c00 <container_get_usage>:


// get the current memory usage of process # [id]
unsigned int container_get_usage(unsigned int id)
{
  104c00:	8b 54 24 04          	mov    0x4(%esp),%edx
  104c04:	31 c0                	xor    %eax,%eax
    if (id > NUM_IDS) {
  104c06:	83 fa 40             	cmp    $0x40,%edx
  104c09:	77 0a                	ja     104c15 <container_get_usage+0x15>
        return 0;
    }
    return CONTAINER[id].usage;
  104c0b:	8d 04 92             	lea    (%edx,%edx,4),%eax
  104c0e:	8b 04 85 84 ff 90 00 	mov    0x90ff84(,%eax,4),%eax
}
  104c15:	f3 c3                	repz ret 
  104c17:	89 f6                	mov    %esi,%esi
  104c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104c20 <container_can_consume>:


// determines whether the process # [id] can consume extra
// [n] pages of memory. If so, returns 1, o.w., returns 0.
unsigned int container_can_consume(unsigned int id, unsigned int n)
{
  104c20:	8b 54 24 04          	mov    0x4(%esp),%edx


// get the current memory usage of process # [id]
unsigned int container_get_usage(unsigned int id)
{
    if (id > NUM_IDS) {
  104c24:	31 c0                	xor    %eax,%eax
  104c26:	83 fa 40             	cmp    $0x40,%edx
  104c29:	77 11                	ja     104c3c <container_can_consume+0x1c>
unsigned int container_get_quota(unsigned int id)
{
    if (id > NUM_IDS) {
        return 0;
    }
    return CONTAINER[id].quota;
  104c2b:	8d 14 92             	lea    (%edx,%edx,4),%edx
  104c2e:	8b 04 95 80 ff 90 00 	mov    0x90ff80(,%edx,4),%eax
  104c35:	2b 04 95 84 ff 90 00 	sub    0x90ff84(,%edx,4),%eax
// [n] pages of memory. If so, returns 1, o.w., returns 0.
unsigned int container_can_consume(unsigned int id, unsigned int n)
{
    int usage = container_get_usage(id);
    int quota = container_get_quota(id);
    if (quota - usage >= n) {
  104c3c:	39 44 24 08          	cmp    %eax,0x8(%esp)
  104c40:	0f 96 c0             	setbe  %al
  104c43:	0f b6 c0             	movzbl %al,%eax
        return 1;
    }else {
        return 0;
    }
}
  104c46:	c3                   	ret    
  104c47:	89 f6                	mov    %esi,%esi
  104c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104c50 <container_split>:
 * dedicates [quota] pages of memory for a new child process.
 * you can assume it is safe to allocate [quota] pages (i.e., the check is already done outside before calling this function)
 * returns the container index for the new child process.
 */
unsigned int container_split(unsigned int id, unsigned int quota)
{
  104c50:	56                   	push   %esi
  104c51:	53                   	push   %ebx
  104c52:	31 c0                	xor    %eax,%eax
  104c54:	8b 74 24 0c          	mov    0xc(%esp),%esi
  104c58:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  unsigned int child, nc;
  
    if (id >= NUM_IDS) {
  104c5c:	83 fe 3f             	cmp    $0x3f,%esi
  104c5f:	77 76                	ja     104cd7 <container_split+0x87>
        return 0;
    }
    
  nc = CONTAINER[id].nchildren;
  104c61:	8d 14 b6             	lea    (%esi,%esi,4),%edx
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process
  104c64:	8d 44 76 01          	lea    0x1(%esi,%esi,2),%eax
  
    if (id >= NUM_IDS) {
        return 0;
    }
    
  nc = CONTAINER[id].nchildren;
  104c68:	8d 14 95 80 ff 90 00 	lea    0x90ff80(,%edx,4),%edx
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process
  104c6f:	8b 4a 0c             	mov    0xc(%edx),%ecx
   * TODO: update the container structure of both parent and child process appropriately.
   */
    int temp = id;
    while (1) {
        CONTAINER[temp].nchildren += 1;
        CONTAINER[temp].usage += quota;
  104c72:	01 5a 04             	add    %ebx,0x4(%edx)
    if (id >= NUM_IDS) {
        return 0;
    }
    
  nc = CONTAINER[id].nchildren;
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process
  104c75:	01 c8                	add    %ecx,%eax
  /**
   * TODO: update the container structure of both parent and child process appropriately.
   */
    int temp = id;
    while (1) {
        CONTAINER[temp].nchildren += 1;
  104c77:	83 c1 01             	add    $0x1,%ecx
        CONTAINER[temp].usage += quota;
        if (temp == 0) {
  104c7a:	85 f6                	test   %esi,%esi
  /**
   * TODO: update the container structure of both parent and child process appropriately.
   */
    int temp = id;
    while (1) {
        CONTAINER[temp].nchildren += 1;
  104c7c:	89 4a 0c             	mov    %ecx,0xc(%edx)
        CONTAINER[temp].usage += quota;
        if (temp == 0) {
  104c7f:	89 f2                	mov    %esi,%edx
  104c81:	74 24                	je     104ca7 <container_split+0x57>
  104c83:	90                   	nop
  104c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            break;
        }
        temp = CONTAINER[temp].parent;
  104c88:	8d 14 92             	lea    (%edx,%edx,4),%edx
  104c8b:	8b 14 95 88 ff 90 00 	mov    0x90ff88(,%edx,4),%edx
  /**
   * TODO: update the container structure of both parent and child process appropriately.
   */
    int temp = id;
    while (1) {
        CONTAINER[temp].nchildren += 1;
  104c92:	8d 0c 92             	lea    (%edx,%edx,4),%ecx
  104c95:	8d 0c 8d 80 ff 90 00 	lea    0x90ff80(,%ecx,4),%ecx
  104c9c:	83 41 0c 01          	addl   $0x1,0xc(%ecx)
        CONTAINER[temp].usage += quota;
  104ca0:	01 59 04             	add    %ebx,0x4(%ecx)
        if (temp == 0) {
  104ca3:	85 d2                	test   %edx,%edx
  104ca5:	75 e1                	jne    104c88 <container_split+0x38>
            break;
        }
        temp = CONTAINER[temp].parent;
    }
    CONTAINER[child].nchildren = 0;
  104ca7:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  104caa:	c1 e1 02             	shl    $0x2,%ecx
  104cad:	c7 81 8c ff 90 00 00 	movl   $0x0,0x90ff8c(%ecx)
  104cb4:	00 00 00 
    CONTAINER[child].usage = 0;
  104cb7:	c7 81 84 ff 90 00 00 	movl   $0x0,0x90ff84(%ecx)
  104cbe:	00 00 00 
    CONTAINER[child].quota = quota;
  104cc1:	89 99 80 ff 90 00    	mov    %ebx,0x90ff80(%ecx)
    CONTAINER[child].parent = id;
  104cc7:	89 b1 88 ff 90 00    	mov    %esi,0x90ff88(%ecx)
    CONTAINER[child].used = 1;
  104ccd:	c7 81 90 ff 90 00 01 	movl   $0x1,0x90ff90(%ecx)
  104cd4:	00 00 00 

  return child;
}
  104cd7:	5b                   	pop    %ebx
  104cd8:	5e                   	pop    %esi
  104cd9:	c3                   	ret    
  104cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104ce0 <container_alloc>:
 * allocates one more page for process # [id], given that its usage would not exceed the quota.
 * the container structure should be updated accordingly after the allocation.
 * returns the page index of the allocated page, or 0 in the case of failure.
 */
unsigned int container_alloc(unsigned int id)
{
  104ce0:	53                   	push   %ebx
    if (id >= NUM_IDS || CONTAINER[id].usage == CONTAINER[id].quota) {
        return 0;
  104ce1:	31 c0                	xor    %eax,%eax
 * allocates one more page for process # [id], given that its usage would not exceed the quota.
 * the container structure should be updated accordingly after the allocation.
 * returns the page index of the allocated page, or 0 in the case of failure.
 */
unsigned int container_alloc(unsigned int id)
{
  104ce3:	83 ec 08             	sub    $0x8,%esp
  104ce6:	8b 54 24 10          	mov    0x10(%esp),%edx
    if (id >= NUM_IDS || CONTAINER[id].usage == CONTAINER[id].quota) {
  104cea:	83 fa 3f             	cmp    $0x3f,%edx
  104ced:	77 23                	ja     104d12 <container_alloc+0x32>
  104cef:	8d 14 92             	lea    (%edx,%edx,4),%edx
  104cf2:	c1 e2 02             	shl    $0x2,%edx
  104cf5:	8b 8a 80 ff 90 00    	mov    0x90ff80(%edx),%ecx
  104cfb:	39 8a 84 ff 90 00    	cmp    %ecx,0x90ff84(%edx)
  104d01:	8d 9a 80 ff 90 00    	lea    0x90ff80(%edx),%ebx
  104d07:	74 09                	je     104d12 <container_alloc+0x32>
        return 0;
    }
    int page = palloc();
  104d09:	e8 92 fc ff ff       	call   1049a0 <palloc>
    CONTAINER[id].usage += 1;
  104d0e:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  /*
   * TODO: implement the function here.
   */
    
  return page;
}
  104d12:	83 c4 08             	add    $0x8,%esp
  104d15:	5b                   	pop    %ebx
  104d16:	c3                   	ret    
  104d17:	89 f6                	mov    %esi,%esi
  104d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104d20 <container_free>:

// frees the physical page and reduces the usage by 1.
void container_free(unsigned int id, unsigned int page_index)
{   
  104d20:	53                   	push   %ebx
  104d21:	83 ec 08             	sub    $0x8,%esp
  104d24:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    if (id >= NUM_IDS) {
  104d28:	83 fb 3f             	cmp    $0x3f,%ebx
  104d2b:	77 1a                	ja     104d47 <container_free+0x27>
        return 0;
    }
    pfree(page_index);
  104d2d:	83 ec 0c             	sub    $0xc,%esp
  104d30:	ff 74 24 20          	pushl  0x20(%esp)
  104d34:	e8 e7 fc ff ff       	call   104a20 <pfree>
    CONTAINER[id].usage -= 1;
  104d39:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
  104d3c:	83 c4 10             	add    $0x10,%esp
  104d3f:	83 2c 85 84 ff 90 00 	subl   $0x1,0x90ff84(,%eax,4)
  104d46:	01 
}
  104d47:	83 c4 08             	add    $0x8,%esp
  104d4a:	5b                   	pop    %ebx
  104d4b:	c3                   	ret    
  104d4c:	66 90                	xchg   %ax,%ax
  104d4e:	66 90                	xchg   %ax,%ax

00104d50 <MContainer_test1>:
#include <lib/debug.h>
#include "export.h"

int MContainer_test1()
{
  104d50:	83 ec 18             	sub    $0x18,%esp
  if (container_get_quota(0) <= 10000) {
  104d53:	6a 00                	push   $0x0
  104d55:	e8 86 fe ff ff       	call   104be0 <container_get_quota>
  104d5a:	83 c4 10             	add    $0x10,%esp
  104d5d:	3d 10 27 00 00       	cmp    $0x2710,%eax
  104d62:	76 17                	jbe    104d7b <MContainer_test1+0x2b>
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (container_can_consume(0, 10000) != 1) {
  104d64:	83 ec 08             	sub    $0x8,%esp
  104d67:	68 10 27 00 00       	push   $0x2710
  104d6c:	6a 00                	push   $0x0
  104d6e:	e8 ad fe ff ff       	call   104c20 <container_can_consume>
  104d73:	83 c4 10             	add    $0x10,%esp
  104d76:	83 f8 01             	cmp    $0x1,%eax
  104d79:	74 1d                	je     104d98 <MContainer_test1+0x48>
#include "export.h"

int MContainer_test1()
{
  if (container_get_quota(0) <= 10000) {
    dprintf("test 1 failed.\n");
  104d7b:	83 ec 0c             	sub    $0xc,%esp
  104d7e:	68 ce 65 10 00       	push   $0x1065ce
  104d83:	e8 44 db ff ff       	call   1028cc <dprintf>
    return 1;
  104d88:	83 c4 10             	add    $0x10,%esp
  104d8b:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  104d90:	83 c4 0c             	add    $0xc,%esp
  104d93:	c3                   	ret    
  104d94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
  if (container_can_consume(0, 10000) != 1) {
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (container_can_consume(0, 10000000) != 0) {
  104d98:	83 ec 08             	sub    $0x8,%esp
  104d9b:	68 80 96 98 00       	push   $0x989680
  104da0:	6a 00                	push   $0x0
  104da2:	e8 79 fe ff ff       	call   104c20 <container_can_consume>
  104da7:	83 c4 10             	add    $0x10,%esp
  104daa:	85 c0                	test   %eax,%eax
  104dac:	75 cd                	jne    104d7b <MContainer_test1+0x2b>
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  104dae:	83 ec 0c             	sub    $0xc,%esp
  104db1:	68 de 65 10 00       	push   $0x1065de
  104db6:	e8 11 db ff ff       	call   1028cc <dprintf>
  104dbb:	83 c4 10             	add    $0x10,%esp
  return 0;
  104dbe:	31 c0                	xor    %eax,%eax
}
  104dc0:	83 c4 0c             	add    $0xc,%esp
  104dc3:	c3                   	ret    
  104dc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104dca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00104dd0 <MContainer_test2>:


int MContainer_test2()
{
  104dd0:	57                   	push   %edi
  104dd1:	56                   	push   %esi
  104dd2:	53                   	push   %ebx
  unsigned int old_usage = container_get_usage(0);
  104dd3:	83 ec 0c             	sub    $0xc,%esp
  104dd6:	6a 00                	push   $0x0
  104dd8:	e8 23 fe ff ff       	call   104c00 <container_get_usage>
  unsigned int old_nchildren = container_get_nchildren(0);
  104ddd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
}


int MContainer_test2()
{
  unsigned int old_usage = container_get_usage(0);
  104de4:	89 c6                	mov    %eax,%esi
  unsigned int old_nchildren = container_get_nchildren(0);
  104de6:	e8 d5 fd ff ff       	call   104bc0 <container_get_nchildren>
  104deb:	89 c7                	mov    %eax,%edi
  unsigned int chid = container_split(0, 100);
  104ded:	58                   	pop    %eax
  104dee:	5a                   	pop    %edx
  104def:	6a 64                	push   $0x64
  104df1:	6a 00                	push   $0x0
  104df3:	e8 58 fe ff ff       	call   104c50 <container_split>
  if (container_get_quota(chid) != 100 || container_get_parent(chid) != 0 ||
  104df8:	89 04 24             	mov    %eax,(%esp)

int MContainer_test2()
{
  unsigned int old_usage = container_get_usage(0);
  unsigned int old_nchildren = container_get_nchildren(0);
  unsigned int chid = container_split(0, 100);
  104dfb:	89 c3                	mov    %eax,%ebx
  if (container_get_quota(chid) != 100 || container_get_parent(chid) != 0 ||
  104dfd:	e8 de fd ff ff       	call   104be0 <container_get_quota>
  104e02:	83 c4 10             	add    $0x10,%esp
  104e05:	83 f8 64             	cmp    $0x64,%eax
  104e08:	74 1e                	je     104e28 <MContainer_test2+0x58>
      container_get_usage(chid) != 0 || container_get_nchildren(chid) != 0 ||
      container_get_usage(0) != old_usage + 100 || container_get_nchildren(0) != old_nchildren + 1) {
    dprintf("test 2 failed.\n");
  104e0a:	83 ec 0c             	sub    $0xc,%esp
  104e0d:	68 ee 65 10 00       	push   $0x1065ee
  104e12:	e8 b5 da ff ff       	call   1028cc <dprintf>
    return 1;
  104e17:	83 c4 10             	add    $0x10,%esp
  104e1a:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 2 failed.\n");
    return 1;
  }
  dprintf("test 2 passed.\n");
  return 0;
}
  104e1f:	5b                   	pop    %ebx
  104e20:	5e                   	pop    %esi
  104e21:	5f                   	pop    %edi
  104e22:	c3                   	ret    
  104e23:	90                   	nop
  104e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int MContainer_test2()
{
  unsigned int old_usage = container_get_usage(0);
  unsigned int old_nchildren = container_get_nchildren(0);
  unsigned int chid = container_split(0, 100);
  if (container_get_quota(chid) != 100 || container_get_parent(chid) != 0 ||
  104e28:	83 ec 0c             	sub    $0xc,%esp
  104e2b:	53                   	push   %ebx
  104e2c:	e8 6f fd ff ff       	call   104ba0 <container_get_parent>
  104e31:	83 c4 10             	add    $0x10,%esp
  104e34:	85 c0                	test   %eax,%eax
  104e36:	75 d2                	jne    104e0a <MContainer_test2+0x3a>
      container_get_usage(chid) != 0 || container_get_nchildren(chid) != 0 ||
  104e38:	83 ec 0c             	sub    $0xc,%esp
  104e3b:	53                   	push   %ebx
  104e3c:	e8 bf fd ff ff       	call   104c00 <container_get_usage>
int MContainer_test2()
{
  unsigned int old_usage = container_get_usage(0);
  unsigned int old_nchildren = container_get_nchildren(0);
  unsigned int chid = container_split(0, 100);
  if (container_get_quota(chid) != 100 || container_get_parent(chid) != 0 ||
  104e41:	83 c4 10             	add    $0x10,%esp
  104e44:	85 c0                	test   %eax,%eax
  104e46:	75 c2                	jne    104e0a <MContainer_test2+0x3a>
      container_get_usage(chid) != 0 || container_get_nchildren(chid) != 0 ||
  104e48:	83 ec 0c             	sub    $0xc,%esp
  104e4b:	53                   	push   %ebx
  104e4c:	e8 6f fd ff ff       	call   104bc0 <container_get_nchildren>
  104e51:	83 c4 10             	add    $0x10,%esp
  104e54:	85 c0                	test   %eax,%eax
  104e56:	75 b2                	jne    104e0a <MContainer_test2+0x3a>
      container_get_usage(0) != old_usage + 100 || container_get_nchildren(0) != old_nchildren + 1) {
  104e58:	83 ec 0c             	sub    $0xc,%esp
  104e5b:	83 c6 64             	add    $0x64,%esi
  104e5e:	6a 00                	push   $0x0
  104e60:	e8 9b fd ff ff       	call   104c00 <container_get_usage>
{
  unsigned int old_usage = container_get_usage(0);
  unsigned int old_nchildren = container_get_nchildren(0);
  unsigned int chid = container_split(0, 100);
  if (container_get_quota(chid) != 100 || container_get_parent(chid) != 0 ||
      container_get_usage(chid) != 0 || container_get_nchildren(chid) != 0 ||
  104e65:	83 c4 10             	add    $0x10,%esp
  104e68:	39 f0                	cmp    %esi,%eax
  104e6a:	75 9e                	jne    104e0a <MContainer_test2+0x3a>
      container_get_usage(0) != old_usage + 100 || container_get_nchildren(0) != old_nchildren + 1) {
  104e6c:	83 ec 0c             	sub    $0xc,%esp
  104e6f:	83 c7 01             	add    $0x1,%edi
  104e72:	6a 00                	push   $0x0
  104e74:	e8 47 fd ff ff       	call   104bc0 <container_get_nchildren>
  104e79:	83 c4 10             	add    $0x10,%esp
  104e7c:	39 f8                	cmp    %edi,%eax
  104e7e:	75 8a                	jne    104e0a <MContainer_test2+0x3a>
    dprintf("test 2 failed.\n");
    return 1;
  }
  container_alloc(chid);
  104e80:	83 ec 0c             	sub    $0xc,%esp
  104e83:	53                   	push   %ebx
  104e84:	e8 57 fe ff ff       	call   104ce0 <container_alloc>
  if (container_get_usage(chid) != 1) {
  104e89:	89 1c 24             	mov    %ebx,(%esp)
  104e8c:	e8 6f fd ff ff       	call   104c00 <container_get_usage>
  104e91:	83 c4 10             	add    $0x10,%esp
  104e94:	83 e8 01             	sub    $0x1,%eax
  104e97:	0f 85 6d ff ff ff    	jne    104e0a <MContainer_test2+0x3a>
    dprintf("test 2 failed.\n");
    return 1;
  }
  dprintf("test 2 passed.\n");
  104e9d:	83 ec 0c             	sub    $0xc,%esp
  104ea0:	68 fe 65 10 00       	push   $0x1065fe
  104ea5:	e8 22 da ff ff       	call   1028cc <dprintf>
  return 0;
  104eaa:	83 c4 10             	add    $0x10,%esp
  104ead:	31 c0                	xor    %eax,%eax
  104eaf:	e9 6b ff ff ff       	jmp    104e1f <MContainer_test2+0x4f>
  104eb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104eba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00104ec0 <MContainer_test_own>:
int MContainer_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  104ec0:	31 c0                	xor    %eax,%eax
  104ec2:	c3                   	ret    
  104ec3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104ed0 <test_MContainer>:

int test_MContainer()
{
  104ed0:	53                   	push   %ebx
  104ed1:	83 ec 08             	sub    $0x8,%esp
  return MContainer_test1() + MContainer_test2() + MContainer_test_own();
  104ed4:	e8 77 fe ff ff       	call   104d50 <MContainer_test1>
  104ed9:	89 c3                	mov    %eax,%ebx
  104edb:	e8 f0 fe ff ff       	call   104dd0 <MContainer_test2>
}
  104ee0:	83 c4 08             	add    $0x8,%esp
  return 0;
}

int test_MContainer()
{
  return MContainer_test1() + MContainer_test2() + MContainer_test_own();
  104ee3:	01 d8                	add    %ebx,%eax
}
  104ee5:	5b                   	pop    %ebx
  104ee6:	c3                   	ret    
  104ee7:	66 90                	xchg   %ax,%ax
  104ee9:	66 90                	xchg   %ax,%ax
  104eeb:	66 90                	xchg   %ax,%ax
  104eed:	66 90                	xchg   %ax,%ax
  104eef:	90                   	nop

00104ef0 <set_pdir_base>:


// sets the CR3 register with the start address of the page structure for process # [index]
void set_pdir_base(unsigned int index)
{
    set_cr3(&*PDirPool[index]);
  104ef0:	8b 44 24 04          	mov    0x4(%esp),%eax
  104ef4:	c1 e0 0c             	shl    $0xc,%eax
  104ef7:	05 00 60 d5 00       	add    $0xd56000,%eax
  104efc:	89 44 24 04          	mov    %eax,0x4(%esp)
  104f00:	e9 74 c0 ff ff       	jmp    100f79 <set_cr3>
  104f05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104f10 <get_pdir_entry>:

// returns the page directory entry # [pde_index] of the process # [proc_index]
// this can be used to test whether the page directory entry is mapped
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
    return (unsigned int)(PDirPool[proc_index][pde_index]);
  104f10:	8b 44 24 04          	mov    0x4(%esp),%eax
  104f14:	c1 e0 0a             	shl    $0xa,%eax
  104f17:	03 44 24 08          	add    0x8(%esp),%eax
  104f1b:	8b 04 85 00 60 d5 00 	mov    0xd56000(,%eax,4),%eax
    
}   
  104f22:	c3                   	ret    
  104f23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104f30 <set_pdir_entry>:
// you should also set the permissions PTE_P, PTE_W, and PTE_U
void set_pdir_entry(unsigned int proc_index, unsigned int pde_index, unsigned int page_index)
{
    // TODO

    PDirPool[proc_index][pde_index] = page_index * 4096 | PT_PERM_PTU;
  104f30:	8b 44 24 04          	mov    0x4(%esp),%eax
  104f34:	8b 54 24 0c          	mov    0xc(%esp),%edx
  104f38:	c1 e0 0a             	shl    $0xa,%eax
  104f3b:	03 44 24 08          	add    0x8(%esp),%eax
  104f3f:	c1 e2 0c             	shl    $0xc,%edx
  104f42:	83 ca 07             	or     $0x7,%edx
  104f45:	89 14 85 00 60 d5 00 	mov    %edx,0xd56000(,%eax,4)
  104f4c:	c3                   	ret    
  104f4d:	8d 76 00             	lea    0x0(%esi),%esi

00104f50 <set_pdir_entry_identity>:
// this will be used to map the page directory entry to identity page table.
void set_pdir_entry_identity(unsigned int proc_index, unsigned int pde_index)
{   
    // TODO

    PDirPool[proc_index][pde_index] = (unsigned int)IDPTbl[pde_index] | PT_PERM_PTU ;
  104f50:	8b 54 24 04          	mov    0x4(%esp),%edx
// sets the page directory entry # [pde_index] for the process # [proc_index]
// with the initial address of page directory # [pde_index] in IDPTbl
// you should also set the permissions PTE_P, PTE_W, and PTE_U
// this will be used to map the page directory entry to identity page table.
void set_pdir_entry_identity(unsigned int proc_index, unsigned int pde_index)
{   
  104f54:	8b 44 24 08          	mov    0x8(%esp),%eax
    // TODO

    PDirPool[proc_index][pde_index] = (unsigned int)IDPTbl[pde_index] | PT_PERM_PTU ;
  104f58:	c1 e2 0a             	shl    $0xa,%edx
  104f5b:	01 c2                	add    %eax,%edx
  104f5d:	c1 e0 0c             	shl    $0xc,%eax
  104f60:	05 00 60 95 00       	add    $0x956000,%eax
  104f65:	83 c8 07             	or     $0x7,%eax
  104f68:	89 04 95 00 60 d5 00 	mov    %eax,0xd56000(,%edx,4)
  104f6f:	c3                   	ret    

00104f70 <rmv_pdir_entry>:
// removes specified page directory entry (set the page directory entry to 0).
// don't forget to cast the value to (char *).
void rmv_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
    // TODO
    PDirPool[proc_index][pde_index] = (char *) (0);
  104f70:	8b 44 24 04          	mov    0x4(%esp),%eax
  104f74:	c1 e0 0a             	shl    $0xa,%eax
  104f77:	03 44 24 08          	add    0x8(%esp),%eax
  104f7b:	c7 04 85 00 60 d5 00 	movl   $0x0,0xd56000(,%eax,4)
  104f82:	00 00 00 00 
  104f86:	c3                   	ret    
  104f87:	89 f6                	mov    %esi,%esi
  104f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104f90 <get_ptbl_entry>:

// returns the page directory entry # [pde_index] of the process # [proc_index]
// this can be used to test whether the page directory entry is mapped
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
    return (unsigned int)(PDirPool[proc_index][pde_index]);
  104f90:	8b 44 24 04          	mov    0x4(%esp),%eax
  104f94:	c1 e0 0a             	shl    $0xa,%eax
  104f97:	03 44 24 08          	add    0x8(%esp),%eax
  104f9b:	8b 04 85 00 60 d5 00 	mov    0xd56000(,%eax,4),%eax
// returns the specified page table entry.
// do not forget that the permission info is also stored in the page directory entries.
unsigned int get_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{   
    // TODO
    if (get_pdir_entry(proc_index, pde_index) == 0) return 0;
  104fa2:	85 c0                	test   %eax,%eax
  104fa4:	74 0e                	je     104fb4 <get_ptbl_entry+0x24>
    unsigned int* temp = ((unsigned int)(PDirPool[proc_index][pde_index]) >> 12) << 12 + pte_index;
  104fa6:	8b 54 24 0c          	mov    0xc(%esp),%edx
  104faa:	c1 e8 0c             	shr    $0xc,%eax
  104fad:	8d 4a 0c             	lea    0xc(%edx),%ecx
  104fb0:	d3 e0                	shl    %cl,%eax
    return *temp;
  104fb2:	8b 00                	mov    (%eax),%eax
}
  104fb4:	f3 c3                	repz ret 
  104fb6:	8d 76 00             	lea    0x0(%esi),%esi
  104fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104fc0 <set_ptbl_entry>:
// sets specified page table entry with the start address of physical page # [page_index]
// you should also set the given permission
void set_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index, unsigned int page_index, unsigned int perm)
{   
    // TODO
    unsigned int* temp = ((unsigned int)(PDirPool[proc_index][pde_index]) >> 12) << 12 + pte_index;
  104fc0:	8b 44 24 04          	mov    0x4(%esp),%eax
    
    *temp = (page_index << 12) | perm;
  104fc4:	8b 54 24 10          	mov    0x10(%esp),%edx
// sets specified page table entry with the start address of physical page # [page_index]
// you should also set the given permission
void set_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index, unsigned int page_index, unsigned int perm)
{   
    // TODO
    unsigned int* temp = ((unsigned int)(PDirPool[proc_index][pde_index]) >> 12) << 12 + pte_index;
  104fc8:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  104fcc:	c1 e0 0a             	shl    $0xa,%eax
  104fcf:	03 44 24 08          	add    0x8(%esp),%eax
    
    *temp = (page_index << 12) | perm;
  104fd3:	c1 e2 0c             	shl    $0xc,%edx
  104fd6:	0b 54 24 14          	or     0x14(%esp),%edx
// sets specified page table entry with the start address of physical page # [page_index]
// you should also set the given permission
void set_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index, unsigned int page_index, unsigned int perm)
{   
    // TODO
    unsigned int* temp = ((unsigned int)(PDirPool[proc_index][pde_index]) >> 12) << 12 + pte_index;
  104fda:	83 c1 0c             	add    $0xc,%ecx
  104fdd:	8b 04 85 00 60 d5 00 	mov    0xd56000(,%eax,4),%eax
  104fe4:	c1 e8 0c             	shr    $0xc,%eax
  104fe7:	d3 e0                	shl    %cl,%eax
    
    *temp = (page_index << 12) | perm;
  104fe9:	89 10                	mov    %edx,(%eax)
  104feb:	c3                   	ret    
  104fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104ff0 <set_ptbl_entry_identity>:
}   

// sets the specified page table entry in IDPTbl as the identity map.
// you should also set the given permission
void set_ptbl_entry_identity(unsigned int pde_index, unsigned int pte_index, unsigned int perm)
{
  104ff0:	8b 54 24 04          	mov    0x4(%esp),%edx
  104ff4:	8b 44 24 08          	mov    0x8(%esp),%eax
    IDPTbl[pde_index][pte_index] = pde_index << 22 | pte_index << 12 | perm;
  104ff8:	89 d1                	mov    %edx,%ecx
  104ffa:	c1 e2 16             	shl    $0x16,%edx
  104ffd:	c1 e1 0a             	shl    $0xa,%ecx
  105000:	01 c1                	add    %eax,%ecx
  105002:	c1 e0 0c             	shl    $0xc,%eax
  105005:	0b 44 24 0c          	or     0xc(%esp),%eax
  105009:	09 d0                	or     %edx,%eax
  10500b:	89 04 8d 00 60 95 00 	mov    %eax,0x956000(,%ecx,4)
  105012:	c3                   	ret    
  105013:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105020 <rmv_ptbl_entry>:
}

// sets the specified page table entry to 0
void rmv_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{
    unsigned int* temp = (((unsigned int)PDirPool[proc_index][pde_index]) >> 12) << 12 + pte_index;
  105020:	8b 44 24 04          	mov    0x4(%esp),%eax
  105024:	8b 54 24 0c          	mov    0xc(%esp),%edx
  105028:	c1 e0 0a             	shl    $0xa,%eax
  10502b:	03 44 24 08          	add    0x8(%esp),%eax
  10502f:	8d 4a 0c             	lea    0xc(%edx),%ecx
  105032:	8b 04 85 00 60 d5 00 	mov    0xd56000(,%eax,4),%eax
  105039:	c1 e8 0c             	shr    $0xc,%eax
  10503c:	d3 e0                	shl    %cl,%eax
    *temp = 0;
  10503e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  105044:	c3                   	ret    
  105045:	66 90                	xchg   %ax,%ax
  105047:	66 90                	xchg   %ax,%ax
  105049:	66 90                	xchg   %ax,%ax
  10504b:	66 90                	xchg   %ax,%ax
  10504d:	66 90                	xchg   %ax,%ax
  10504f:	90                   	nop

00105050 <MPTIntro_test1>:

extern char * PDirPool[NUM_IDS][1024];
extern unsigned int IDPTbl[1024][1024];

int MPTIntro_test1()
{
  105050:	83 ec 18             	sub    $0x18,%esp
  set_pdir_base(0);
  105053:	6a 00                	push   $0x0
  105055:	e8 96 fe ff ff       	call   104ef0 <set_pdir_base>
  if ((unsigned int)PDirPool[0] != rcr3()) {
  10505a:	e8 75 e3 ff ff       	call   1033d4 <rcr3>
  10505f:	83 c4 10             	add    $0x10,%esp
  105062:	3d 00 60 d5 00       	cmp    $0xd56000,%eax
  105067:	74 1f                	je     105088 <MPTIntro_test1+0x38>
    dprintf("test 1 failed.\n");
  105069:	83 ec 0c             	sub    $0xc,%esp
  10506c:	68 ce 65 10 00       	push   $0x1065ce
  105071:	e8 56 d8 ff ff       	call   1028cc <dprintf>
    return 1;
  105076:	83 c4 10             	add    $0x10,%esp
  105079:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  10507e:	83 c4 0c             	add    $0xc,%esp
  105081:	c3                   	ret    
  105082:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  set_pdir_base(0);
  if ((unsigned int)PDirPool[0] != rcr3()) {
    dprintf("test 1 failed.\n");
    return 1;
  }
  set_pdir_entry_identity(1, 1);
  105088:	83 ec 08             	sub    $0x8,%esp
  10508b:	6a 01                	push   $0x1
  10508d:	6a 01                	push   $0x1
  10508f:	e8 bc fe ff ff       	call   104f50 <set_pdir_entry_identity>
  set_pdir_entry(1, 2, 100);
  105094:	83 c4 0c             	add    $0xc,%esp
  105097:	6a 64                	push   $0x64
  105099:	6a 02                	push   $0x2
  10509b:	6a 01                	push   $0x1
  10509d:	e8 8e fe ff ff       	call   104f30 <set_pdir_entry>
  if (get_pdir_entry(1, 1) != (unsigned int)IDPTbl[1] +   7) {
  1050a2:	58                   	pop    %eax
  1050a3:	5a                   	pop    %edx
  1050a4:	6a 01                	push   $0x1
  1050a6:	6a 01                	push   $0x1
  1050a8:	e8 63 fe ff ff       	call   104f10 <get_pdir_entry>
  1050ad:	83 c4 10             	add    $0x10,%esp
  1050b0:	3d 07 70 95 00       	cmp    $0x957007,%eax
  1050b5:	75 b2                	jne    105069 <MPTIntro_test1+0x19>
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (get_pdir_entry(1, 2) != 409607) {
  1050b7:	83 ec 08             	sub    $0x8,%esp
  1050ba:	6a 02                	push   $0x2
  1050bc:	6a 01                	push   $0x1
  1050be:	e8 4d fe ff ff       	call   104f10 <get_pdir_entry>
  1050c3:	83 c4 10             	add    $0x10,%esp
  1050c6:	3d 07 40 06 00       	cmp    $0x64007,%eax
  1050cb:	75 9c                	jne    105069 <MPTIntro_test1+0x19>
    dprintf("test 1 failed.\n");
    return 1;
  }
  rmv_pdir_entry(1, 1);
  1050cd:	83 ec 08             	sub    $0x8,%esp
  1050d0:	6a 01                	push   $0x1
  1050d2:	6a 01                	push   $0x1
  1050d4:	e8 97 fe ff ff       	call   104f70 <rmv_pdir_entry>
  rmv_pdir_entry(1, 2);
  1050d9:	58                   	pop    %eax
  1050da:	5a                   	pop    %edx
  1050db:	6a 02                	push   $0x2
  1050dd:	6a 01                	push   $0x1
  1050df:	e8 8c fe ff ff       	call   104f70 <rmv_pdir_entry>
  if (get_pdir_entry(1, 1) != 0 || get_pdir_entry(1, 2) != 0) {
  1050e4:	59                   	pop    %ecx
  1050e5:	58                   	pop    %eax
  1050e6:	6a 01                	push   $0x1
  1050e8:	6a 01                	push   $0x1
  1050ea:	e8 21 fe ff ff       	call   104f10 <get_pdir_entry>
  1050ef:	83 c4 10             	add    $0x10,%esp
  1050f2:	85 c0                	test   %eax,%eax
  1050f4:	0f 85 6f ff ff ff    	jne    105069 <MPTIntro_test1+0x19>
  1050fa:	83 ec 08             	sub    $0x8,%esp
  1050fd:	6a 02                	push   $0x2
  1050ff:	6a 01                	push   $0x1
  105101:	e8 0a fe ff ff       	call   104f10 <get_pdir_entry>
  105106:	83 c4 10             	add    $0x10,%esp
  105109:	85 c0                	test   %eax,%eax
  10510b:	0f 85 58 ff ff ff    	jne    105069 <MPTIntro_test1+0x19>
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  105111:	83 ec 0c             	sub    $0xc,%esp
  105114:	68 de 65 10 00       	push   $0x1065de
  105119:	e8 ae d7 ff ff       	call   1028cc <dprintf>
  10511e:	83 c4 10             	add    $0x10,%esp
  return 0;
  105121:	31 c0                	xor    %eax,%eax
  105123:	e9 56 ff ff ff       	jmp    10507e <MPTIntro_test1+0x2e>
  105128:	90                   	nop
  105129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105130 <MPTIntro_test2>:
}

int MPTIntro_test2()
{
  105130:	83 ec 10             	sub    $0x10,%esp
  set_pdir_entry(1, 1, 10000);
  105133:	68 10 27 00 00       	push   $0x2710
  105138:	6a 01                	push   $0x1
  10513a:	6a 01                	push   $0x1
  10513c:	e8 ef fd ff ff       	call   104f30 <set_pdir_entry>
  set_ptbl_entry(1, 1, 1, 10000, 259);
  105141:	c7 04 24 03 01 00 00 	movl   $0x103,(%esp)
  105148:	68 10 27 00 00       	push   $0x2710
  10514d:	6a 01                	push   $0x1
  10514f:	6a 01                	push   $0x1
  105151:	6a 01                	push   $0x1
  105153:	e8 68 fe ff ff       	call   104fc0 <set_ptbl_entry>
  if (get_ptbl_entry(1, 1, 1) != 40960259) {
  105158:	83 c4 1c             	add    $0x1c,%esp
  10515b:	6a 01                	push   $0x1
  10515d:	6a 01                	push   $0x1
  10515f:	6a 01                	push   $0x1
  105161:	e8 2a fe ff ff       	call   104f90 <get_ptbl_entry>
  105166:	83 c4 10             	add    $0x10,%esp
  105169:	3d 03 01 71 02       	cmp    $0x2710103,%eax
  10516e:	74 20                	je     105190 <MPTIntro_test2+0x60>
    dprintf("test 2 failed.\n");
  105170:	83 ec 0c             	sub    $0xc,%esp
  105173:	68 ee 65 10 00       	push   $0x1065ee
  105178:	e8 4f d7 ff ff       	call   1028cc <dprintf>
    return 1;
  10517d:	83 c4 10             	add    $0x10,%esp
  105180:	b8 01 00 00 00       	mov    $0x1,%eax
    return 1;
  }
  rmv_pdir_entry(1, 1);
  dprintf("test 2 passed.\n");
  return 0;
}
  105185:	83 c4 0c             	add    $0xc,%esp
  105188:	c3                   	ret    
  105189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  set_ptbl_entry(1, 1, 1, 10000, 259);
  if (get_ptbl_entry(1, 1, 1) != 40960259) {
    dprintf("test 2 failed.\n");
    return 1;
  }
  rmv_ptbl_entry(1, 1, 1);
  105190:	83 ec 04             	sub    $0x4,%esp
  105193:	6a 01                	push   $0x1
  105195:	6a 01                	push   $0x1
  105197:	6a 01                	push   $0x1
  105199:	e8 82 fe ff ff       	call   105020 <rmv_ptbl_entry>
  if (get_ptbl_entry(1, 1, 1) != 0) {
  10519e:	83 c4 0c             	add    $0xc,%esp
  1051a1:	6a 01                	push   $0x1
  1051a3:	6a 01                	push   $0x1
  1051a5:	6a 01                	push   $0x1
  1051a7:	e8 e4 fd ff ff       	call   104f90 <get_ptbl_entry>
  1051ac:	83 c4 10             	add    $0x10,%esp
  1051af:	85 c0                	test   %eax,%eax
  1051b1:	75 bd                	jne    105170 <MPTIntro_test2+0x40>
    dprintf("test 2 failed.\n");
    return 1;
  }
  rmv_pdir_entry(1, 1);
  1051b3:	83 ec 08             	sub    $0x8,%esp
  1051b6:	6a 01                	push   $0x1
  1051b8:	6a 01                	push   $0x1
  1051ba:	e8 b1 fd ff ff       	call   104f70 <rmv_pdir_entry>
  dprintf("test 2 passed.\n");
  1051bf:	c7 04 24 fe 65 10 00 	movl   $0x1065fe,(%esp)
  1051c6:	e8 01 d7 ff ff       	call   1028cc <dprintf>
  1051cb:	83 c4 10             	add    $0x10,%esp
  1051ce:	31 c0                	xor    %eax,%eax
  return 0;
}
  1051d0:	83 c4 0c             	add    $0xc,%esp
  1051d3:	c3                   	ret    
  1051d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1051da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

001051e0 <MPTIntro_test_own>:
int MPTIntro_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  1051e0:	31 c0                	xor    %eax,%eax
  1051e2:	c3                   	ret    
  1051e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1051e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001051f0 <test_MPTIntro>:

int test_MPTIntro()
{
  1051f0:	53                   	push   %ebx
  1051f1:	83 ec 08             	sub    $0x8,%esp
  return MPTIntro_test1() + MPTIntro_test2() + MPTIntro_test_own();
  1051f4:	e8 57 fe ff ff       	call   105050 <MPTIntro_test1>
  1051f9:	89 c3                	mov    %eax,%ebx
  1051fb:	e8 30 ff ff ff       	call   105130 <MPTIntro_test2>
}
  105200:	83 c4 08             	add    $0x8,%esp
  return 0;
}

int test_MPTIntro()
{
  return MPTIntro_test1() + MPTIntro_test2() + MPTIntro_test_own();
  105203:	01 d8                	add    %ebx,%eax
}
  105205:	5b                   	pop    %ebx
  105206:	c3                   	ret    
  105207:	66 90                	xchg   %ax,%ax
  105209:	66 90                	xchg   %ax,%ax
  10520b:	66 90                	xchg   %ax,%ax
  10520d:	66 90                	xchg   %ax,%ax
  10520f:	90                   	nop

00105210 <get_ptbl_entry_by_va>:
 * Returns the page table entry corresponding to the virtual address,
 * according to the page structure of process # [proc_index].
 * Returns 0 if the mapping does not exist.
 */
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{   
  105210:	83 ec 10             	sub    $0x10,%esp
  105213:	8b 44 24 18          	mov    0x18(%esp),%eax

    unsigned int pde_index = vaddr >> 22;
    unsigned int pte_index = (vaddr >> 12) & 0x3ff;
  105217:	89 c2                	mov    %eax,%edx
 * Returns 0 if the mapping does not exist.
 */
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{   

    unsigned int pde_index = vaddr >> 22;
  105219:	c1 e8 16             	shr    $0x16,%eax
    unsigned int pte_index = (vaddr >> 12) & 0x3ff;
  10521c:	c1 ea 0c             	shr    $0xc,%edx
  10521f:	81 e2 ff 03 00 00    	and    $0x3ff,%edx

    unsigned int temp1 = get_ptbl_entry(proc_index, pde_index, pte_index);
  105225:	52                   	push   %edx
  105226:	50                   	push   %eax
  105227:	ff 74 24 1c          	pushl  0x1c(%esp)
  10522b:	e8 60 fd ff ff       	call   104f90 <get_ptbl_entry>
    
    return temp1;
}         
  105230:	83 c4 1c             	add    $0x1c,%esp
  105233:	c3                   	ret    
  105234:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10523a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00105240 <get_pdir_entry_by_va>:
unsigned int get_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
    // TODO
    unsigned int pde_index = vaddr >> 22;

    unsigned int temp = get_pdir_entry(proc_index, pde_index);
  105240:	c1 6c 24 08 16       	shrl   $0x16,0x8(%esp)
  105245:	e9 c6 fc ff ff       	jmp    104f10 <get_pdir_entry>
  10524a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105250 <rmv_ptbl_entry_by_va>:
    return temp;
}

// removes the page table entry for the given virtual address
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  105250:	83 ec 10             	sub    $0x10,%esp
  105253:	8b 44 24 18          	mov    0x18(%esp),%eax
    // TODO
    unsigned int pde_index = vaddr >> 22;
    unsigned int pte_index = (vaddr >> 12) & 0x3ff;
  105257:	89 c2                	mov    %eax,%edx

// removes the page table entry for the given virtual address
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
    // TODO
    unsigned int pde_index = vaddr >> 22;
  105259:	c1 e8 16             	shr    $0x16,%eax
    unsigned int pte_index = (vaddr >> 12) & 0x3ff;
  10525c:	c1 ea 0c             	shr    $0xc,%edx
  10525f:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
    rmv_ptbl_entry(proc_index, pde_index, pte_index);
  105265:	52                   	push   %edx
  105266:	50                   	push   %eax
  105267:	ff 74 24 1c          	pushl  0x1c(%esp)
  10526b:	e8 b0 fd ff ff       	call   105020 <rmv_ptbl_entry>
}
  105270:	83 c4 1c             	add    $0x1c,%esp
  105273:	c3                   	ret    
  105274:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10527a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00105280 <rmv_pdir_entry_by_va>:
// removes the page directory entry for the given virtual address
void rmv_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
    // TODO
    unsigned int pde_index = vaddr >> 22;
    rmv_pdir_entry(proc_index, pde_index);
  105280:	c1 6c 24 08 16       	shrl   $0x16,0x8(%esp)
  105285:	e9 e6 fc ff ff       	jmp    104f70 <rmv_pdir_entry>
  10528a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105290 <set_ptbl_entry_by_va>:
}

// maps the virtual address [vaddr] to the physical page # [page_index] with permission [perm]
// you do not need to worry about the page directory entry. just map the page table entry.
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index, unsigned int perm)
{
  105290:	83 ec 18             	sub    $0x18,%esp
  105293:	8b 44 24 20          	mov    0x20(%esp),%eax
    // TODO
    unsigned int pde_index = vaddr >> 22;
    unsigned int pte_index = (vaddr >> 12) & 0x3ff;
    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  105297:	ff 74 24 28          	pushl  0x28(%esp)
  10529b:	ff 74 24 28          	pushl  0x28(%esp)
// you do not need to worry about the page directory entry. just map the page table entry.
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index, unsigned int perm)
{
    // TODO
    unsigned int pde_index = vaddr >> 22;
    unsigned int pte_index = (vaddr >> 12) & 0x3ff;
  10529f:	89 c2                	mov    %eax,%edx
// maps the virtual address [vaddr] to the physical page # [page_index] with permission [perm]
// you do not need to worry about the page directory entry. just map the page table entry.
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index, unsigned int perm)
{
    // TODO
    unsigned int pde_index = vaddr >> 22;
  1052a1:	c1 e8 16             	shr    $0x16,%eax
    unsigned int pte_index = (vaddr >> 12) & 0x3ff;
  1052a4:	c1 ea 0c             	shr    $0xc,%edx
  1052a7:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  1052ad:	52                   	push   %edx
  1052ae:	50                   	push   %eax
  1052af:	ff 74 24 2c          	pushl  0x2c(%esp)
  1052b3:	e8 08 fd ff ff       	call   104fc0 <set_ptbl_entry>

}
  1052b8:	83 c4 2c             	add    $0x2c,%esp
  1052bb:	c3                   	ret    
  1052bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001052c0 <set_pdir_entry_by_va>:

// registers the mapping from [vaddr] to physical page # [page_index] in the page directory
void set_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index)
{
    // TODO
    unsigned int pde_index = vaddr >> 22;
  1052c0:	8b 44 24 08          	mov    0x8(%esp),%eax
  1052c4:	c1 e8 16             	shr    $0x16,%eax
    set_pdir_entry(proc_index, pde_index, page_index);
  1052c7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1052cb:	e9 60 fc ff ff       	jmp    104f30 <set_pdir_entry>

001052d0 <idptbl_init>:

// initializes the identity page table
// the permission for the kernel memory should be PTE_P, PTE_W, and PTE_G,
// while the permission for the rest should be PTE_P and PTE_W.
void idptbl_init(unsigned int mbi_adr)
{
  1052d0:	57                   	push   %edi
  1052d1:	56                   	push   %esi
    // TODO: define your local variables here.
    //
    container_init(mbi_adr);
    for (int i = 0; i < 1024; ++i)
  1052d2:	31 f6                	xor    %esi,%esi

// initializes the identity page table
// the permission for the kernel memory should be PTE_P, PTE_W, and PTE_G,
// while the permission for the rest should be PTE_P and PTE_W.
void idptbl_init(unsigned int mbi_adr)
{
  1052d4:	53                   	push   %ebx
    // TODO: define your local variables here.
    //
    container_init(mbi_adr);
  1052d5:	83 ec 0c             	sub    $0xc,%esp
  1052d8:	ff 74 24 1c          	pushl  0x1c(%esp)
  1052dc:	e8 1f f8 ff ff       	call   104b00 <container_init>
  1052e1:	83 c4 10             	add    $0x10,%esp
  1052e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1052e8:	8d be 00 ff ff ff    	lea    -0x100(%esi),%edi

// initializes the identity page table
// the permission for the kernel memory should be PTE_P, PTE_W, and PTE_G,
// while the permission for the rest should be PTE_P and PTE_W.
void idptbl_init(unsigned int mbi_adr)
{
  1052ee:	31 db                	xor    %ebx,%ebx
    for (int i = 0; i < 1024; ++i)
    {
        for (int j = 0; j < 1024; ++j)
        {   

            if (i < 256 || i >= 960)
  1052f0:	81 ff bf 02 00 00    	cmp    $0x2bf,%edi
  1052f6:	77 29                	ja     105321 <idptbl_init+0x51>
            {
                set_ptbl_entry_identity(i, j, PTE_P | PTE_W | PTE_G);
            }else {
                set_ptbl_entry_identity(i, j, PTE_P | PTE_W);
  1052f8:	83 ec 04             	sub    $0x4,%esp
  1052fb:	6a 03                	push   $0x3
  1052fd:	53                   	push   %ebx
  1052fe:	56                   	push   %esi
  1052ff:	e8 ec fc ff ff       	call   104ff0 <set_ptbl_entry_identity>
  105304:	83 c4 10             	add    $0x10,%esp
    // TODO: define your local variables here.
    //
    container_init(mbi_adr);
    for (int i = 0; i < 1024; ++i)
    {
        for (int j = 0; j < 1024; ++j)
  105307:	83 c3 01             	add    $0x1,%ebx
  10530a:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
  105310:	75 de                	jne    1052f0 <idptbl_init+0x20>
void idptbl_init(unsigned int mbi_adr)
{
    // TODO: define your local variables here.
    //
    container_init(mbi_adr);
    for (int i = 0; i < 1024; ++i)
  105312:	83 c6 01             	add    $0x1,%esi
  105315:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  10531b:	75 cb                	jne    1052e8 <idptbl_init+0x18>
            }
            
        }
    } 
    // TODO
}
  10531d:	5b                   	pop    %ebx
  10531e:	5e                   	pop    %esi
  10531f:	5f                   	pop    %edi
  105320:	c3                   	ret    
        for (int j = 0; j < 1024; ++j)
        {   

            if (i < 256 || i >= 960)
            {
                set_ptbl_entry_identity(i, j, PTE_P | PTE_W | PTE_G);
  105321:	83 ec 04             	sub    $0x4,%esp
  105324:	68 03 01 00 00       	push   $0x103
  105329:	53                   	push   %ebx
  10532a:	56                   	push   %esi
  10532b:	e8 c0 fc ff ff       	call   104ff0 <set_ptbl_entry_identity>
  105330:	83 c4 10             	add    $0x10,%esp
  105333:	eb d2                	jmp    105307 <idptbl_init+0x37>
  105335:	66 90                	xchg   %ax,%ax
  105337:	66 90                	xchg   %ax,%ax
  105339:	66 90                	xchg   %ax,%ax
  10533b:	66 90                	xchg   %ax,%ax
  10533d:	66 90                	xchg   %ax,%ax
  10533f:	90                   	nop

00105340 <MPTOp_test1>:
#include <lib/debug.h>
#include "export.h"

int MPTOp_test1()
{
  105340:	83 ec 14             	sub    $0x14,%esp
  unsigned int vaddr = 4096*1024*300;
  if (get_ptbl_entry_by_va(10, vaddr) != 0) {
  105343:	68 00 00 00 4b       	push   $0x4b000000
  105348:	6a 0a                	push   $0xa
  10534a:	e8 c1 fe ff ff       	call   105210 <get_ptbl_entry_by_va>
  10534f:	83 c4 10             	add    $0x10,%esp
  105352:	85 c0                	test   %eax,%eax
  105354:	0f 85 c6 00 00 00    	jne    105420 <MPTOp_test1+0xe0>
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (get_pdir_entry_by_va(10, vaddr) != 0) {
  10535a:	83 ec 08             	sub    $0x8,%esp
  10535d:	68 00 00 00 4b       	push   $0x4b000000
  105362:	6a 0a                	push   $0xa
  105364:	e8 d7 fe ff ff       	call   105240 <get_pdir_entry_by_va>
  105369:	83 c4 10             	add    $0x10,%esp
  10536c:	85 c0                	test   %eax,%eax
  10536e:	0f 85 ac 00 00 00    	jne    105420 <MPTOp_test1+0xe0>
    dprintf("test 1 failed.\n");
    return 1;
  }
  set_pdir_entry_by_va(10, vaddr, 100);
  105374:	83 ec 04             	sub    $0x4,%esp
  105377:	6a 64                	push   $0x64
  105379:	68 00 00 00 4b       	push   $0x4b000000
  10537e:	6a 0a                	push   $0xa
  105380:	e8 3b ff ff ff       	call   1052c0 <set_pdir_entry_by_va>
  set_ptbl_entry_by_va(10, vaddr, 100, 259);
  105385:	68 03 01 00 00       	push   $0x103
  10538a:	6a 64                	push   $0x64
  10538c:	68 00 00 00 4b       	push   $0x4b000000
  105391:	6a 0a                	push   $0xa
  105393:	e8 f8 fe ff ff       	call   105290 <set_ptbl_entry_by_va>
  if (get_ptbl_entry_by_va(10, vaddr) == 0) {
  105398:	83 c4 18             	add    $0x18,%esp
  10539b:	68 00 00 00 4b       	push   $0x4b000000
  1053a0:	6a 0a                	push   $0xa
  1053a2:	e8 69 fe ff ff       	call   105210 <get_ptbl_entry_by_va>
  1053a7:	83 c4 10             	add    $0x10,%esp
  1053aa:	85 c0                	test   %eax,%eax
  1053ac:	74 72                	je     105420 <MPTOp_test1+0xe0>
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (get_pdir_entry_by_va(10, vaddr) == 0) {
  1053ae:	83 ec 08             	sub    $0x8,%esp
  1053b1:	68 00 00 00 4b       	push   $0x4b000000
  1053b6:	6a 0a                	push   $0xa
  1053b8:	e8 83 fe ff ff       	call   105240 <get_pdir_entry_by_va>
  1053bd:	83 c4 10             	add    $0x10,%esp
  1053c0:	85 c0                	test   %eax,%eax
  1053c2:	74 5c                	je     105420 <MPTOp_test1+0xe0>
    dprintf("test 1 failed.\n");
    return 1;
  }
  rmv_ptbl_entry_by_va(10, vaddr);
  1053c4:	83 ec 08             	sub    $0x8,%esp
  1053c7:	68 00 00 00 4b       	push   $0x4b000000
  1053cc:	6a 0a                	push   $0xa
  1053ce:	e8 7d fe ff ff       	call   105250 <rmv_ptbl_entry_by_va>
  rmv_pdir_entry_by_va(10, vaddr);
  1053d3:	58                   	pop    %eax
  1053d4:	5a                   	pop    %edx
  1053d5:	68 00 00 00 4b       	push   $0x4b000000
  1053da:	6a 0a                	push   $0xa
  1053dc:	e8 9f fe ff ff       	call   105280 <rmv_pdir_entry_by_va>
  if (get_ptbl_entry_by_va(10, vaddr) != 0) {
  1053e1:	59                   	pop    %ecx
  1053e2:	58                   	pop    %eax
  1053e3:	68 00 00 00 4b       	push   $0x4b000000
  1053e8:	6a 0a                	push   $0xa
  1053ea:	e8 21 fe ff ff       	call   105210 <get_ptbl_entry_by_va>
  1053ef:	83 c4 10             	add    $0x10,%esp
  1053f2:	85 c0                	test   %eax,%eax
  1053f4:	75 2a                	jne    105420 <MPTOp_test1+0xe0>
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (get_pdir_entry_by_va(10, vaddr) != 0) {
  1053f6:	83 ec 08             	sub    $0x8,%esp
  1053f9:	68 00 00 00 4b       	push   $0x4b000000
  1053fe:	6a 0a                	push   $0xa
  105400:	e8 3b fe ff ff       	call   105240 <get_pdir_entry_by_va>
  105405:	83 c4 10             	add    $0x10,%esp
  105408:	85 c0                	test   %eax,%eax
  10540a:	75 14                	jne    105420 <MPTOp_test1+0xe0>
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  10540c:	83 ec 0c             	sub    $0xc,%esp
  10540f:	68 de 65 10 00       	push   $0x1065de
  105414:	e8 b3 d4 ff ff       	call   1028cc <dprintf>
  105419:	83 c4 10             	add    $0x10,%esp
  return 0;
  10541c:	31 c0                	xor    %eax,%eax
  10541e:	eb 15                	jmp    105435 <MPTOp_test1+0xf5>

int MPTOp_test1()
{
  unsigned int vaddr = 4096*1024*300;
  if (get_ptbl_entry_by_va(10, vaddr) != 0) {
    dprintf("test 1 failed.\n");
  105420:	83 ec 0c             	sub    $0xc,%esp
  105423:	68 ce 65 10 00       	push   $0x1065ce
  105428:	e8 9f d4 ff ff       	call   1028cc <dprintf>
    return 1;
  10542d:	83 c4 10             	add    $0x10,%esp
  105430:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  105435:	83 c4 0c             	add    $0xc,%esp
  105438:	c3                   	ret    
  105439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105440 <MPTOp_test_own>:
int MPTOp_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  105440:	31 c0                	xor    %eax,%eax
  105442:	c3                   	ret    
  105443:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105450 <test_MPTOp>:

int test_MPTOp()
{
  return MPTOp_test1() + MPTOp_test_own();
  105450:	e9 eb fe ff ff       	jmp    105340 <MPTOp_test1>
  105455:	66 90                	xchg   %ax,%ax
  105457:	66 90                	xchg   %ax,%ax
  105459:	66 90                	xchg   %ax,%ax
  10545b:	66 90                	xchg   %ax,%ax
  10545d:	66 90                	xchg   %ax,%ax
  10545f:	90                   	nop

00105460 <pdir_init>:
 * For each process from id 0 to NUM_IDS -1,
 * set the page directory entries sothat the kernel portion of the map as identity map,
 * and the rest of page directories are unmmaped.
 */
void pdir_init(unsigned int mbi_adr)
{
  105460:	56                   	push   %esi
  105461:	53                   	push   %ebx
    // TODO: define your local variables here.

    idptbl_init(mbi_adr);

    for (int i = 0; i < NUM_IDS; ++i)
  105462:	31 f6                	xor    %esi,%esi
 * For each process from id 0 to NUM_IDS -1,
 * set the page directory entries sothat the kernel portion of the map as identity map,
 * and the rest of page directories are unmmaped.
 */
void pdir_init(unsigned int mbi_adr)
{
  105464:	83 ec 10             	sub    $0x10,%esp
    // TODO: define your local variables here.

    idptbl_init(mbi_adr);
  105467:	ff 74 24 1c          	pushl  0x1c(%esp)
  10546b:	e8 60 fe ff ff       	call   1052d0 <idptbl_init>
  105470:	83 c4 10             	add    $0x10,%esp
  105473:	90                   	nop
  105474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 * For each process from id 0 to NUM_IDS -1,
 * set the page directory entries sothat the kernel portion of the map as identity map,
 * and the rest of page directories are unmmaped.
 */
void pdir_init(unsigned int mbi_adr)
{
  105478:	31 db                	xor    %ebx,%ebx
  10547a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    {	
    		
    		for (int j = 0; j < 1024; ++j)
    		{	
    			
    			if (j >= 256 && j < 960)
  105480:	8d 83 00 ff ff ff    	lea    -0x100(%ebx),%eax
  105486:	3d bf 02 00 00       	cmp    $0x2bf,%eax
  10548b:	76 26                	jbe    1054b3 <pdir_init+0x53>
    			{
    					rmv_pdir_entry(i, j);
    			}else {
    				set_pdir_entry_identity(i, j);
  10548d:	83 ec 08             	sub    $0x8,%esp
  105490:	53                   	push   %ebx
  105491:	56                   	push   %esi
  105492:	e8 b9 fa ff ff       	call   104f50 <set_pdir_entry_identity>
  105497:	83 c4 10             	add    $0x10,%esp
    idptbl_init(mbi_adr);

    for (int i = 0; i < NUM_IDS; ++i)
    {	
    		
    		for (int j = 0; j < 1024; ++j)
  10549a:	83 c3 01             	add    $0x1,%ebx
  10549d:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
  1054a3:	75 db                	jne    105480 <pdir_init+0x20>
{
    // TODO: define your local variables here.

    idptbl_init(mbi_adr);

    for (int i = 0; i < NUM_IDS; ++i)
  1054a5:	83 c6 01             	add    $0x1,%esi
  1054a8:	83 fe 40             	cmp    $0x40,%esi
  1054ab:	75 cb                	jne    105478 <pdir_init+0x18>
    			
    				
    		}
    }
    // TODO
}
  1054ad:	83 c4 04             	add    $0x4,%esp
  1054b0:	5b                   	pop    %ebx
  1054b1:	5e                   	pop    %esi
  1054b2:	c3                   	ret    
    		for (int j = 0; j < 1024; ++j)
    		{	
    			
    			if (j >= 256 && j < 960)
    			{
    					rmv_pdir_entry(i, j);
  1054b3:	83 ec 08             	sub    $0x8,%esp
  1054b6:	53                   	push   %ebx
  1054b7:	56                   	push   %esi
  1054b8:	e8 b3 fa ff ff       	call   104f70 <rmv_pdir_entry>
  1054bd:	83 c4 10             	add    $0x10,%esp
  1054c0:	eb d8                	jmp    10549a <pdir_init+0x3a>
  1054c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1054c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001054d0 <alloc_ptbl>:
 * and clears (set to 0) the whole page table entries for this newly mapped page table.
 * It returns the page index of the newly allocated physical page.
 * In the case when there's no physical page available, it returns 0.
 */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vadr)
{
  1054d0:	55                   	push   %ebp
  1054d1:	57                   	push   %edi
  1054d2:	56                   	push   %esi
  1054d3:	53                   	push   %ebx
  1054d4:	83 ec 18             	sub    $0x18,%esp
  1054d7:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  // TODO
  int page_index = container_alloc(proc_index);
  1054db:	56                   	push   %esi
  1054dc:	e8 ff f7 ff ff       	call   104ce0 <container_alloc>
  if (page_index == 0)
  1054e1:	83 c4 10             	add    $0x10,%esp
  1054e4:	85 c0                	test   %eax,%eax
 * In the case when there's no physical page available, it returns 0.
 */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vadr)
{
  // TODO
  int page_index = container_alloc(proc_index);
  1054e6:	89 c5                	mov    %eax,%ebp
  if (page_index == 0)
  1054e8:	75 0e                	jne    1054f8 <alloc_ptbl+0x28>
	{	
		rmv_ptbl_entry(proc_index, vadr >> 22, i);
	}
  
  return page_index;
}
  1054ea:	83 c4 0c             	add    $0xc,%esp
  1054ed:	89 e8                	mov    %ebp,%eax
  1054ef:	5b                   	pop    %ebx
  1054f0:	5e                   	pop    %esi
  1054f1:	5f                   	pop    %edi
  1054f2:	5d                   	pop    %ebp
  1054f3:	c3                   	ret    
  1054f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int page_index = container_alloc(proc_index);
  if (page_index == 0)
  {
  	return 0;
  }
  set_pdir_entry_by_va(proc_index, vadr, page_index);
  1054f8:	83 ec 04             	sub    $0x4,%esp
  for (int i = 0; i < 1024; ++i)
  1054fb:	31 db                	xor    %ebx,%ebx
  int page_index = container_alloc(proc_index);
  if (page_index == 0)
  {
  	return 0;
  }
  set_pdir_entry_by_va(proc_index, vadr, page_index);
  1054fd:	50                   	push   %eax
  1054fe:	ff 74 24 2c          	pushl  0x2c(%esp)
  105502:	56                   	push   %esi
  105503:	e8 b8 fd ff ff       	call   1052c0 <set_pdir_entry_by_va>
  105508:	8b 7c 24 34          	mov    0x34(%esp),%edi
  10550c:	83 c4 10             	add    $0x10,%esp
  10550f:	c1 ef 16             	shr    $0x16,%edi
  105512:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for (int i = 0; i < 1024; ++i)
	{	
		rmv_ptbl_entry(proc_index, vadr >> 22, i);
  105518:	83 ec 04             	sub    $0x4,%esp
  10551b:	53                   	push   %ebx
  10551c:	57                   	push   %edi
  if (page_index == 0)
  {
  	return 0;
  }
  set_pdir_entry_by_va(proc_index, vadr, page_index);
  for (int i = 0; i < 1024; ++i)
  10551d:	83 c3 01             	add    $0x1,%ebx
	{	
		rmv_ptbl_entry(proc_index, vadr >> 22, i);
  105520:	56                   	push   %esi
  105521:	e8 fa fa ff ff       	call   105020 <rmv_ptbl_entry>
  if (page_index == 0)
  {
  	return 0;
  }
  set_pdir_entry_by_va(proc_index, vadr, page_index);
  for (int i = 0; i < 1024; ++i)
  105526:	83 c4 10             	add    $0x10,%esp
  105529:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
  10552f:	75 e7                	jne    105518 <alloc_ptbl+0x48>
	{	
		rmv_ptbl_entry(proc_index, vadr >> 22, i);
	}
  
  return page_index;
}
  105531:	83 c4 0c             	add    $0xc,%esp
  105534:	89 e8                	mov    %ebp,%eax
  105536:	5b                   	pop    %ebx
  105537:	5e                   	pop    %esi
  105538:	5f                   	pop    %edi
  105539:	5d                   	pop    %ebp
  10553a:	c3                   	ret    
  10553b:	90                   	nop
  10553c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105540 <free_ptbl>:

// Reverse operation of alloc_ptbl.
// Removes corresponding page directory entry,
// and frees the page for the page table entries (with container_free).
void free_ptbl(unsigned int proc_index, unsigned int vadr)
{	
  105540:	56                   	push   %esi
  105541:	53                   	push   %ebx
  105542:	83 ec 0c             	sub    $0xc,%esp
  105545:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  105549:	8b 74 24 1c          	mov    0x1c(%esp),%esi
	unsigned int temp = get_ptbl_entry_by_va(proc_index, vadr);
  10554d:	56                   	push   %esi
  10554e:	53                   	push   %ebx
  10554f:	e8 bc fc ff ff       	call   105210 <get_ptbl_entry_by_va>
	container_free(proc_index, temp >> 12);
  105554:	5a                   	pop    %edx
  105555:	59                   	pop    %ecx
  105556:	c1 e8 0c             	shr    $0xc,%eax
  105559:	50                   	push   %eax
  10555a:	53                   	push   %ebx
  10555b:	e8 c0 f7 ff ff       	call   104d20 <container_free>
	rmv_pdir_entry_by_va(proc_index, vadr);
  105560:	89 74 24 24          	mov    %esi,0x24(%esp)
  105564:	89 5c 24 20          	mov    %ebx,0x20(%esp)
}
  105568:	83 c4 14             	add    $0x14,%esp
  10556b:	5b                   	pop    %ebx
  10556c:	5e                   	pop    %esi
// and frees the page for the page table entries (with container_free).
void free_ptbl(unsigned int proc_index, unsigned int vadr)
{	
	unsigned int temp = get_ptbl_entry_by_va(proc_index, vadr);
	container_free(proc_index, temp >> 12);
	rmv_pdir_entry_by_va(proc_index, vadr);
  10556d:	e9 0e fd ff ff       	jmp    105280 <rmv_pdir_entry_by_va>
  105572:	66 90                	xchg   %ax,%ax
  105574:	66 90                	xchg   %ax,%ax
  105576:	66 90                	xchg   %ax,%ax
  105578:	66 90                	xchg   %ax,%ax
  10557a:	66 90                	xchg   %ax,%ax
  10557c:	66 90                	xchg   %ax,%ax
  10557e:	66 90                	xchg   %ax,%ax

00105580 <MPTComm_test1>:
#include <pmm/MContainer/export.h>
#include <vmm/MPTOp/export.h>
#include "export.h"

int MPTComm_test1()
{
  105580:	56                   	push   %esi
  105581:	53                   	push   %ebx
  105582:	be 03 01 00 00       	mov    $0x103,%esi
  105587:	bb 00 ff ff ff       	mov    $0xffffff00,%ebx
  10558c:	83 ec 04             	sub    $0x4,%esp
  10558f:	90                   	nop
  int i;
  for (i = 0; i < 1024; i ++) {
    if (i < 256 || i >= 960) {
  105590:	81 fb bf 02 00 00    	cmp    $0x2bf,%ebx
  105596:	77 29                	ja     1055c1 <MPTComm_test1+0x41>
  105598:	83 c3 01             	add    $0x1,%ebx
  10559b:	81 c6 00 00 40 00    	add    $0x400000,%esi
#include "export.h"

int MPTComm_test1()
{
  int i;
  for (i = 0; i < 1024; i ++) {
  1055a1:	81 fb 00 03 00 00    	cmp    $0x300,%ebx
  1055a7:	75 e7                	jne    105590 <MPTComm_test1+0x10>
        dprintf("test 1 failed.\n");
        return 1;
      }
    }
  }
  dprintf("test 1 passed.\n");
  1055a9:	83 ec 0c             	sub    $0xc,%esp
  1055ac:	68 de 65 10 00       	push   $0x1065de
  1055b1:	e8 16 d3 ff ff       	call   1028cc <dprintf>
  return 0;
  1055b6:	83 c4 10             	add    $0x10,%esp
  1055b9:	31 c0                	xor    %eax,%eax
}
  1055bb:	83 c4 04             	add    $0x4,%esp
  1055be:	5b                   	pop    %ebx
  1055bf:	5e                   	pop    %esi
  1055c0:	c3                   	ret    
int MPTComm_test1()
{
  int i;
  for (i = 0; i < 1024; i ++) {
    if (i < 256 || i >= 960) {
      if (get_ptbl_entry_by_va(10, i * 4096 * 1024) != i * 4096 * 1024 + 259) {
  1055c1:	8d 86 fd fe ff ff    	lea    -0x103(%esi),%eax
  1055c7:	83 ec 08             	sub    $0x8,%esp
  1055ca:	50                   	push   %eax
  1055cb:	6a 0a                	push   $0xa
  1055cd:	e8 3e fc ff ff       	call   105210 <get_ptbl_entry_by_va>
  1055d2:	83 c4 10             	add    $0x10,%esp
  1055d5:	39 f0                	cmp    %esi,%eax
  1055d7:	74 bf                	je     105598 <MPTComm_test1+0x18>
        dprintf("test 1 failed.\n");
  1055d9:	83 ec 0c             	sub    $0xc,%esp
  1055dc:	68 ce 65 10 00       	push   $0x1065ce
  1055e1:	e8 e6 d2 ff ff       	call   1028cc <dprintf>
        return 1;
  1055e6:	83 c4 10             	add    $0x10,%esp
  1055e9:	b8 01 00 00 00       	mov    $0x1,%eax
  1055ee:	eb cb                	jmp    1055bb <MPTComm_test1+0x3b>

001055f0 <MPTComm_test2>:
  dprintf("test 1 passed.\n");
  return 0;
}

int MPTComm_test2()
{
  1055f0:	83 ec 14             	sub    $0x14,%esp
  unsigned int vaddr = 300 * 4096 * 1024;
  container_split(0, 100);
  1055f3:	6a 64                	push   $0x64
  1055f5:	6a 00                	push   $0x0
  1055f7:	e8 54 f6 ff ff       	call   104c50 <container_split>
  alloc_ptbl(1, vaddr);
  1055fc:	59                   	pop    %ecx
  1055fd:	58                   	pop    %eax
  1055fe:	68 00 00 00 4b       	push   $0x4b000000
  105603:	6a 01                	push   $0x1
  105605:	e8 c6 fe ff ff       	call   1054d0 <alloc_ptbl>
  if (get_pdir_entry_by_va(1, vaddr) == 0) {
  10560a:	58                   	pop    %eax
  10560b:	5a                   	pop    %edx
  10560c:	68 00 00 00 4b       	push   $0x4b000000
  105611:	6a 01                	push   $0x1
  105613:	e8 28 fc ff ff       	call   105240 <get_pdir_entry_by_va>
  105618:	83 c4 10             	add    $0x10,%esp
  10561b:	85 c0                	test   %eax,%eax
  10561d:	74 51                	je     105670 <MPTComm_test2+0x80>
    dprintf("test 2 failed.\n");
    return 1;
  }
  if(get_ptbl_entry_by_va(1, vaddr) != 0) {
  10561f:	83 ec 08             	sub    $0x8,%esp
  105622:	68 00 00 00 4b       	push   $0x4b000000
  105627:	6a 01                	push   $0x1
  105629:	e8 e2 fb ff ff       	call   105210 <get_ptbl_entry_by_va>
  10562e:	83 c4 10             	add    $0x10,%esp
  105631:	85 c0                	test   %eax,%eax
  105633:	75 3b                	jne    105670 <MPTComm_test2+0x80>
    dprintf("test 2 failed.\n");
    return 1;
  }
  free_ptbl(1, vaddr);
  105635:	83 ec 08             	sub    $0x8,%esp
  105638:	68 00 00 00 4b       	push   $0x4b000000
  10563d:	6a 01                	push   $0x1
  10563f:	e8 fc fe ff ff       	call   105540 <free_ptbl>
  if (get_pdir_entry_by_va(1, vaddr) != 0) {
  105644:	58                   	pop    %eax
  105645:	5a                   	pop    %edx
  105646:	68 00 00 00 4b       	push   $0x4b000000
  10564b:	6a 01                	push   $0x1
  10564d:	e8 ee fb ff ff       	call   105240 <get_pdir_entry_by_va>
  105652:	83 c4 10             	add    $0x10,%esp
  105655:	85 c0                	test   %eax,%eax
  105657:	75 17                	jne    105670 <MPTComm_test2+0x80>
    dprintf("test 2 failed.\n");
    return 1;
  }
  dprintf("test 2 passed.\n");
  105659:	83 ec 0c             	sub    $0xc,%esp
  10565c:	68 fe 65 10 00       	push   $0x1065fe
  105661:	e8 66 d2 ff ff       	call   1028cc <dprintf>
  105666:	83 c4 10             	add    $0x10,%esp
  return 0;
  105669:	31 c0                	xor    %eax,%eax
}
  10566b:	83 c4 0c             	add    $0xc,%esp
  10566e:	c3                   	ret    
  10566f:	90                   	nop
{
  unsigned int vaddr = 300 * 4096 * 1024;
  container_split(0, 100);
  alloc_ptbl(1, vaddr);
  if (get_pdir_entry_by_va(1, vaddr) == 0) {
    dprintf("test 2 failed.\n");
  105670:	83 ec 0c             	sub    $0xc,%esp
  105673:	68 ee 65 10 00       	push   $0x1065ee
  105678:	e8 4f d2 ff ff       	call   1028cc <dprintf>
    return 1;
  10567d:	83 c4 10             	add    $0x10,%esp
  105680:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 2 failed.\n");
    return 1;
  }
  dprintf("test 2 passed.\n");
  return 0;
}
  105685:	83 c4 0c             	add    $0xc,%esp
  105688:	c3                   	ret    
  105689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105690 <MPTComm_test_own>:
int MPTComm_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  105690:	31 c0                	xor    %eax,%eax
  105692:	c3                   	ret    
  105693:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001056a0 <test_MPTComm>:

int test_MPTComm()
{
  1056a0:	53                   	push   %ebx
  1056a1:	83 ec 08             	sub    $0x8,%esp
  return MPTComm_test1() + MPTComm_test2() + MPTComm_test_own();
  1056a4:	e8 d7 fe ff ff       	call   105580 <MPTComm_test1>
  1056a9:	89 c3                	mov    %eax,%ebx
  1056ab:	e8 40 ff ff ff       	call   1055f0 <MPTComm_test2>
}
  1056b0:	83 c4 08             	add    $0x8,%esp
  return 0;
}

int test_MPTComm()
{
  return MPTComm_test1() + MPTComm_test2() + MPTComm_test_own();
  1056b3:	01 d8                	add    %ebx,%eax
}
  1056b5:	5b                   	pop    %ebx
  1056b6:	c3                   	ret    
  1056b7:	66 90                	xchg   %ax,%ax
  1056b9:	66 90                	xchg   %ax,%ax
  1056bb:	66 90                	xchg   %ax,%ax
  1056bd:	66 90                	xchg   %ax,%ax
  1056bf:	90                   	nop

001056c0 <pdir_init_kern>:
/**
 * Sets the entire page map for process 0 as identity map.
 * Note that part of the task is already completed by pdir_init.
 */
void pdir_init_kern(unsigned int mbi_adr)
{
  1056c0:	53                   	push   %ebx
    // TODO: define your local variables here.

    pdir_init(mbi_adr);
    for (int i = 0; i < 1024; ++i)
  1056c1:	31 db                	xor    %ebx,%ebx
/**
 * Sets the entire page map for process 0 as identity map.
 * Note that part of the task is already completed by pdir_init.
 */
void pdir_init_kern(unsigned int mbi_adr)
{
  1056c3:	83 ec 14             	sub    $0x14,%esp
    // TODO: define your local variables here.

    pdir_init(mbi_adr);
  1056c6:	ff 74 24 1c          	pushl  0x1c(%esp)
  1056ca:	e8 91 fd ff ff       	call   105460 <pdir_init>
  1056cf:	83 c4 10             	add    $0x10,%esp
  1056d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for (int i = 0; i < 1024; ++i)
    {
    	set_pdir_entry_identity(0,i);
  1056d8:	83 ec 08             	sub    $0x8,%esp
  1056db:	53                   	push   %ebx
  1056dc:	6a 00                	push   $0x0
void pdir_init_kern(unsigned int mbi_adr)
{
    // TODO: define your local variables here.

    pdir_init(mbi_adr);
    for (int i = 0; i < 1024; ++i)
  1056de:	83 c3 01             	add    $0x1,%ebx
    {
    	set_pdir_entry_identity(0,i);
  1056e1:	e8 6a f8 ff ff       	call   104f50 <set_pdir_entry_identity>
void pdir_init_kern(unsigned int mbi_adr)
{
    // TODO: define your local variables here.

    pdir_init(mbi_adr);
    for (int i = 0; i < 1024; ++i)
  1056e6:	83 c4 10             	add    $0x10,%esp
  1056e9:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
  1056ef:	75 e7                	jne    1056d8 <pdir_init_kern+0x18>
    {
    	set_pdir_entry_identity(0,i);
    }
    //TODO
}
  1056f1:	83 c4 08             	add    $0x8,%esp
  1056f4:	5b                   	pop    %ebx
  1056f5:	c3                   	ret    
  1056f6:	8d 76 00             	lea    0x0(%esi),%esi
  1056f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105700 <map_page>:
 * In the case of error, it returns the constant MagicNumber defined in lib/x86.h,
 * otherwise, it returns the physical page index registered in the page directory,
 * e.g., the return value of get_pdir_entry_by_va or alloc_ptbl.
 */
unsigned int map_page(unsigned int proc_index, unsigned int vadr, unsigned int page_index, unsigned int perm)
{   
  105700:	56                   	push   %esi
  105701:	53                   	push   %ebx
  105702:	83 ec 1c             	sub    $0x1c,%esp
  105705:	8b 5c 24 28          	mov    0x28(%esp),%ebx
  105709:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  // TODO
	unsigned int temp = get_pdir_entry_by_va(proc_index, vadr);
  10570d:	56                   	push   %esi
  10570e:	53                   	push   %ebx
  10570f:	e8 2c fb ff ff       	call   105240 <get_pdir_entry_by_va>
	if (temp == 0)
  105714:	83 c4 10             	add    $0x10,%esp
  105717:	85 c0                	test   %eax,%eax
  105719:	75 25                	jne    105740 <map_page+0x40>
	{
		unsigned int alloc = alloc_ptbl(proc_index, vadr);
  10571b:	83 ec 08             	sub    $0x8,%esp
  10571e:	56                   	push   %esi
  10571f:	53                   	push   %ebx
  105720:	e8 ab fd ff ff       	call   1054d0 <alloc_ptbl>
		if (alloc == 0)
  105725:	83 c4 10             	add    $0x10,%esp
  105728:	85 c0                	test   %eax,%eax
  10572a:	75 14                	jne    105740 <map_page+0x40>
		}
		temp = alloc;
	}
  set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
  return temp;
}
  10572c:	83 c4 14             	add    $0x14,%esp
	if (temp == 0)
	{
		unsigned int alloc = alloc_ptbl(proc_index, vadr);
		if (alloc == 0)
		{
			return MagicNumber;
  10572f:	b8 01 00 10 00       	mov    $0x100001,%eax
		}
		temp = alloc;
	}
  set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
  return temp;
}
  105734:	5b                   	pop    %ebx
  105735:	5e                   	pop    %esi
  105736:	c3                   	ret    
  105737:	89 f6                	mov    %esi,%esi
  105739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  105740:	89 44 24 0c          	mov    %eax,0xc(%esp)
		{
			return MagicNumber;
		}
		temp = alloc;
	}
  set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
  105744:	ff 74 24 2c          	pushl  0x2c(%esp)
  105748:	ff 74 24 2c          	pushl  0x2c(%esp)
  10574c:	56                   	push   %esi
  10574d:	53                   	push   %ebx
  10574e:	e8 3d fb ff ff       	call   105290 <set_ptbl_entry_by_va>
  return temp;
  105753:	83 c4 10             	add    $0x10,%esp
  105756:	8b 44 24 0c          	mov    0xc(%esp),%eax
}
  10575a:	83 c4 14             	add    $0x14,%esp
  10575d:	5b                   	pop    %ebx
  10575e:	5e                   	pop    %esi
  10575f:	c3                   	ret    

00105760 <unmap_page>:
 * Nothing should be done if the mapping no longer exists.
 * You do not need to unmap the page table from the page directory.
 * It should return the corresponding page table entry.
 */
unsigned int unmap_page(unsigned int proc_index, unsigned int vadr)
{
  105760:	56                   	push   %esi
  105761:	53                   	push   %ebx
  105762:	83 ec 1c             	sub    $0x1c,%esp
  105765:	8b 5c 24 28          	mov    0x28(%esp),%ebx
  105769:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  // TODO
  unsigned int temp = get_ptbl_entry_by_va(proc_index, vadr);
  10576d:	56                   	push   %esi
  10576e:	53                   	push   %ebx
  10576f:	e8 9c fa ff ff       	call   105210 <get_ptbl_entry_by_va>
  if(temp == 0) {
  105774:	83 c4 10             	add    $0x10,%esp
  105777:	85 c0                	test   %eax,%eax
  105779:	74 15                	je     105790 <unmap_page+0x30>
  10577b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  	return 0;
  }
  rmv_ptbl_entry_by_va(proc_index, vadr);
  10577f:	83 ec 08             	sub    $0x8,%esp
  105782:	56                   	push   %esi
  105783:	53                   	push   %ebx
  105784:	e8 c7 fa ff ff       	call   105250 <rmv_ptbl_entry_by_va>
  return temp;
  105789:	83 c4 10             	add    $0x10,%esp
  10578c:	8b 44 24 0c          	mov    0xc(%esp),%eax
}   
  105790:	83 c4 14             	add    $0x14,%esp
  105793:	5b                   	pop    %ebx
  105794:	5e                   	pop    %esi
  105795:	c3                   	ret    
  105796:	66 90                	xchg   %ax,%ax
  105798:	66 90                	xchg   %ax,%ax
  10579a:	66 90                	xchg   %ax,%ax
  10579c:	66 90                	xchg   %ax,%ax
  10579e:	66 90                	xchg   %ax,%ax

001057a0 <MPTKern_test1>:
#include <pmm/MContainer/export.h>
#include <vmm/MPTOp/export.h>
#include "export.h"

int MPTKern_test1()
{
  1057a0:	83 ec 14             	sub    $0x14,%esp
  unsigned int vaddr = 4096*1024*300;
  container_split(0, 100);
  1057a3:	6a 64                	push   $0x64
  1057a5:	6a 00                	push   $0x0
  1057a7:	e8 a4 f4 ff ff       	call   104c50 <container_split>
  if (get_ptbl_entry_by_va(1, vaddr) != 0) {
  1057ac:	58                   	pop    %eax
  1057ad:	5a                   	pop    %edx
  1057ae:	68 00 00 00 4b       	push   $0x4b000000
  1057b3:	6a 01                	push   $0x1
  1057b5:	e8 56 fa ff ff       	call   105210 <get_ptbl_entry_by_va>
  1057ba:	83 c4 10             	add    $0x10,%esp
  1057bd:	85 c0                	test   %eax,%eax
  1057bf:	0f 85 8b 00 00 00    	jne    105850 <MPTKern_test1+0xb0>
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (get_pdir_entry_by_va(1, vaddr) != 0) {
  1057c5:	83 ec 08             	sub    $0x8,%esp
  1057c8:	68 00 00 00 4b       	push   $0x4b000000
  1057cd:	6a 01                	push   $0x1
  1057cf:	e8 6c fa ff ff       	call   105240 <get_pdir_entry_by_va>
  1057d4:	83 c4 10             	add    $0x10,%esp
  1057d7:	85 c0                	test   %eax,%eax
  1057d9:	75 75                	jne    105850 <MPTKern_test1+0xb0>
    dprintf("test 1 failed.\n");
    return 1;
  }
  map_page(1, vaddr, 100, 7);
  1057db:	6a 07                	push   $0x7
  1057dd:	6a 64                	push   $0x64
  1057df:	68 00 00 00 4b       	push   $0x4b000000
  1057e4:	6a 01                	push   $0x1
  1057e6:	e8 15 ff ff ff       	call   105700 <map_page>
  if (get_ptbl_entry_by_va(1, vaddr) == 0) {
  1057eb:	59                   	pop    %ecx
  1057ec:	58                   	pop    %eax
  1057ed:	68 00 00 00 4b       	push   $0x4b000000
  1057f2:	6a 01                	push   $0x1
  1057f4:	e8 17 fa ff ff       	call   105210 <get_ptbl_entry_by_va>
  1057f9:	83 c4 10             	add    $0x10,%esp
  1057fc:	85 c0                	test   %eax,%eax
  1057fe:	74 50                	je     105850 <MPTKern_test1+0xb0>
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (get_pdir_entry_by_va(1, vaddr) == 0) {
  105800:	83 ec 08             	sub    $0x8,%esp
  105803:	68 00 00 00 4b       	push   $0x4b000000
  105808:	6a 01                	push   $0x1
  10580a:	e8 31 fa ff ff       	call   105240 <get_pdir_entry_by_va>
  10580f:	83 c4 10             	add    $0x10,%esp
  105812:	85 c0                	test   %eax,%eax
  105814:	74 3a                	je     105850 <MPTKern_test1+0xb0>
    dprintf("test 1 failed.\n");
    return 1;
  }
  unmap_page(1, vaddr);
  105816:	83 ec 08             	sub    $0x8,%esp
  105819:	68 00 00 00 4b       	push   $0x4b000000
  10581e:	6a 01                	push   $0x1
  105820:	e8 3b ff ff ff       	call   105760 <unmap_page>
  if (get_ptbl_entry_by_va(1, vaddr) != 0) {
  105825:	58                   	pop    %eax
  105826:	5a                   	pop    %edx
  105827:	68 00 00 00 4b       	push   $0x4b000000
  10582c:	6a 01                	push   $0x1
  10582e:	e8 dd f9 ff ff       	call   105210 <get_ptbl_entry_by_va>
  105833:	83 c4 10             	add    $0x10,%esp
  105836:	85 c0                	test   %eax,%eax
  105838:	75 16                	jne    105850 <MPTKern_test1+0xb0>
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  10583a:	83 ec 0c             	sub    $0xc,%esp
  10583d:	68 de 65 10 00       	push   $0x1065de
  105842:	e8 85 d0 ff ff       	call   1028cc <dprintf>
  105847:	83 c4 10             	add    $0x10,%esp
  return 0;
  10584a:	31 c0                	xor    %eax,%eax
  10584c:	eb 17                	jmp    105865 <MPTKern_test1+0xc5>
  10584e:	66 90                	xchg   %ax,%ax
int MPTKern_test1()
{
  unsigned int vaddr = 4096*1024*300;
  container_split(0, 100);
  if (get_ptbl_entry_by_va(1, vaddr) != 0) {
    dprintf("test 1 failed.\n");
  105850:	83 ec 0c             	sub    $0xc,%esp
  105853:	68 ce 65 10 00       	push   $0x1065ce
  105858:	e8 6f d0 ff ff       	call   1028cc <dprintf>
    return 1;
  10585d:	83 c4 10             	add    $0x10,%esp
  105860:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  105865:	83 c4 0c             	add    $0xc,%esp
  105868:	c3                   	ret    
  105869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105870 <MPTKern_test2>:

int MPTKern_test2()
{
  105870:	53                   	push   %ebx
  105871:	bb 00 00 00 40       	mov    $0x40000000,%ebx
  105876:	83 ec 08             	sub    $0x8,%esp
  105879:	eb 13                	jmp    10588e <MPTKern_test2+0x1e>
  10587b:	90                   	nop
  10587c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105880:	81 c3 00 00 40 00    	add    $0x400000,%ebx
  unsigned int i;
  for (i = 256; i < 960; i ++) {
  105886:	81 fb 00 00 00 f0    	cmp    $0xf0000000,%ebx
  10588c:	74 32                	je     1058c0 <MPTKern_test2+0x50>
    if (get_ptbl_entry_by_va(0, i * 4096 * 1024L) != i * 4096 * 1024L + 3) {
  10588e:	83 ec 08             	sub    $0x8,%esp
  105891:	53                   	push   %ebx
  105892:	6a 00                	push   $0x0
  105894:	e8 77 f9 ff ff       	call   105210 <get_ptbl_entry_by_va>
  105899:	8d 53 03             	lea    0x3(%ebx),%edx
  10589c:	83 c4 10             	add    $0x10,%esp
  10589f:	39 d0                	cmp    %edx,%eax
  1058a1:	74 dd                	je     105880 <MPTKern_test2+0x10>
      dprintf("test 2 failed.\n");
  1058a3:	83 ec 0c             	sub    $0xc,%esp
  1058a6:	68 ee 65 10 00       	push   $0x1065ee
  1058ab:	e8 1c d0 ff ff       	call   1028cc <dprintf>
      return 1;
  1058b0:	83 c4 10             	add    $0x10,%esp
  1058b3:	b8 01 00 00 00       	mov    $0x1,%eax
    }
  }
  dprintf("test 2 passed.\n");
  return 0;
}
  1058b8:	83 c4 08             	add    $0x8,%esp
  1058bb:	5b                   	pop    %ebx
  1058bc:	c3                   	ret    
  1058bd:	8d 76 00             	lea    0x0(%esi),%esi
    if (get_ptbl_entry_by_va(0, i * 4096 * 1024L) != i * 4096 * 1024L + 3) {
      dprintf("test 2 failed.\n");
      return 1;
    }
  }
  dprintf("test 2 passed.\n");
  1058c0:	83 ec 0c             	sub    $0xc,%esp
  1058c3:	68 fe 65 10 00       	push   $0x1065fe
  1058c8:	e8 ff cf ff ff       	call   1028cc <dprintf>
  return 0;
  1058cd:	83 c4 10             	add    $0x10,%esp
  1058d0:	31 c0                	xor    %eax,%eax
}
  1058d2:	83 c4 08             	add    $0x8,%esp
  1058d5:	5b                   	pop    %ebx
  1058d6:	c3                   	ret    
  1058d7:	89 f6                	mov    %esi,%esi
  1058d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001058e0 <MPTKern_test_own>:
int MPTKern_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  1058e0:	31 c0                	xor    %eax,%eax
  1058e2:	c3                   	ret    
  1058e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1058e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001058f0 <test_MPTKern>:

int test_MPTKern()
{
  1058f0:	53                   	push   %ebx
  1058f1:	83 ec 08             	sub    $0x8,%esp
  return MPTKern_test1() + MPTKern_test2() + MPTKern_test_own();
  1058f4:	e8 a7 fe ff ff       	call   1057a0 <MPTKern_test1>
  1058f9:	89 c3                	mov    %eax,%ebx
  1058fb:	e8 70 ff ff ff       	call   105870 <MPTKern_test2>
}
  105900:	83 c4 08             	add    $0x8,%esp
  return 0;
}

int test_MPTKern()
{
  return MPTKern_test1() + MPTKern_test2() + MPTKern_test_own();
  105903:	01 d8                	add    %ebx,%eax
}
  105905:	5b                   	pop    %ebx
  105906:	c3                   	ret    
  105907:	66 90                	xchg   %ax,%ax
  105909:	66 90                	xchg   %ax,%ax
  10590b:	66 90                	xchg   %ax,%ax
  10590d:	66 90                	xchg   %ax,%ax
  10590f:	90                   	nop

00105910 <paging_init>:
 * Initializes the page structures,
 * move to the page structure # 0 (kernel).
 * and turn on the paging.
 */
void paging_init(unsigned int mbi_addr)
{
  105910:	83 ec 18             	sub    $0x18,%esp
	pdir_init_kern(mbi_addr);
  105913:	ff 74 24 1c          	pushl  0x1c(%esp)
  105917:	e8 a4 fd ff ff       	call   1056c0 <pdir_init_kern>
	set_pdir_base(0);
  10591c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105923:	e8 c8 f5 ff ff       	call   104ef0 <set_pdir_base>
	enable_paging();
}
  105928:	83 c4 1c             	add    $0x1c,%esp
 */
void paging_init(unsigned int mbi_addr)
{
	pdir_init_kern(mbi_addr);
	set_pdir_base(0);
	enable_paging();
  10592b:	e9 61 b6 ff ff       	jmp    100f91 <enable_paging>

00105930 <alloc_page>:
 * It should return the physical page index registered in the page directory, i.e., the
 * return value from map_page.
 * In the case of error, it should return the MagicNumber.
 */
unsigned int alloc_page (unsigned int proc_index, unsigned int vaddr, unsigned int perm)
{
  105930:	53                   	push   %ebx
  105931:	83 ec 14             	sub    $0x14,%esp
  105934:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
	// TODO
	unsigned int page_index = container_alloc(proc_index);
  105938:	53                   	push   %ebx
  105939:	e8 a2 f3 ff ff       	call   104ce0 <container_alloc>
	if (page_index == 0)
  10593e:	83 c4 10             	add    $0x10,%esp
  105941:	85 c0                	test   %eax,%eax
  105943:	ba 01 00 10 00       	mov    $0x100001,%edx
  105948:	75 0e                	jne    105958 <alloc_page+0x28>
	{
		return MagicNumber;
	}
	unsigned int result = map_page(proc_index, vaddr, page_index, perm);
	return result;
}
  10594a:	83 c4 08             	add    $0x8,%esp
  10594d:	89 d0                	mov    %edx,%eax
  10594f:	5b                   	pop    %ebx
  105950:	c3                   	ret    
  105951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	unsigned int page_index = container_alloc(proc_index);
	if (page_index == 0)
	{
		return MagicNumber;
	}
	unsigned int result = map_page(proc_index, vaddr, page_index, perm);
  105958:	ff 74 24 18          	pushl  0x18(%esp)
  10595c:	50                   	push   %eax
  10595d:	ff 74 24 1c          	pushl  0x1c(%esp)
  105961:	53                   	push   %ebx
  105962:	e8 99 fd ff ff       	call   105700 <map_page>
	return result;
  105967:	83 c4 10             	add    $0x10,%esp
	unsigned int page_index = container_alloc(proc_index);
	if (page_index == 0)
	{
		return MagicNumber;
	}
	unsigned int result = map_page(proc_index, vaddr, page_index, perm);
  10596a:	89 c2                	mov    %eax,%edx
	return result;
}
  10596c:	83 c4 08             	add    $0x8,%esp
  10596f:	89 d0                	mov    %edx,%eax
  105971:	5b                   	pop    %ebx
  105972:	c3                   	ret    
  105973:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105980 <alloc_mem_quota>:
 * Designate some memory quota for the next child process.
 */
unsigned int alloc_mem_quota (unsigned int id, unsigned int quota)
{
	unsigned int child;
	child = container_split (id, quota);
  105980:	e9 cb f2 ff ff       	jmp    104c50 <container_split>
  105985:	66 90                	xchg   %ax,%ax
  105987:	66 90                	xchg   %ax,%ax
  105989:	66 90                	xchg   %ax,%ax
  10598b:	66 90                	xchg   %ax,%ax
  10598d:	66 90                	xchg   %ax,%ax
  10598f:	90                   	nop

00105990 <MPTNew_test1>:
#include <lib/debug.h>
#include "export.h"

int MPTNew_test1()
{
  105990:	53                   	push   %ebx
  105991:	83 ec 10             	sub    $0x10,%esp
  unsigned int vaddr = 4096*1024*400;
  container_split(0, 100);
  105994:	6a 64                	push   $0x64
  105996:	6a 00                	push   $0x0
  105998:	e8 b3 f2 ff ff       	call   104c50 <container_split>
  if (get_ptbl_entry_by_va(1, vaddr) != 0) {
  10599d:	59                   	pop    %ecx
  10599e:	5b                   	pop    %ebx
  10599f:	68 00 00 00 64       	push   $0x64000000
  1059a4:	6a 01                	push   $0x1
  1059a6:	e8 65 f8 ff ff       	call   105210 <get_ptbl_entry_by_va>
  1059ab:	83 c4 10             	add    $0x10,%esp
  1059ae:	85 c0                	test   %eax,%eax
  1059b0:	75 6e                	jne    105a20 <MPTNew_test1+0x90>
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (get_pdir_entry_by_va(1, vaddr) != 0) {
  1059b2:	83 ec 08             	sub    $0x8,%esp
  1059b5:	68 00 00 00 64       	push   $0x64000000
  1059ba:	6a 01                	push   $0x1
  1059bc:	e8 7f f8 ff ff       	call   105240 <get_pdir_entry_by_va>
  1059c1:	83 c4 10             	add    $0x10,%esp
  1059c4:	85 c0                	test   %eax,%eax
  1059c6:	89 c3                	mov    %eax,%ebx
  1059c8:	75 56                	jne    105a20 <MPTNew_test1+0x90>
    dprintf("test 1 failed.\n");
    return 1;
  }
  alloc_page(1, vaddr, 7);
  1059ca:	83 ec 04             	sub    $0x4,%esp
  1059cd:	6a 07                	push   $0x7
  1059cf:	68 00 00 00 64       	push   $0x64000000
  1059d4:	6a 01                	push   $0x1
  1059d6:	e8 55 ff ff ff       	call   105930 <alloc_page>
  if (get_ptbl_entry_by_va(1, vaddr) == 0) {
  1059db:	58                   	pop    %eax
  1059dc:	5a                   	pop    %edx
  1059dd:	68 00 00 00 64       	push   $0x64000000
  1059e2:	6a 01                	push   $0x1
  1059e4:	e8 27 f8 ff ff       	call   105210 <get_ptbl_entry_by_va>
  1059e9:	83 c4 10             	add    $0x10,%esp
  1059ec:	85 c0                	test   %eax,%eax
  1059ee:	74 30                	je     105a20 <MPTNew_test1+0x90>
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (get_pdir_entry_by_va(1, vaddr) == 0) {
  1059f0:	83 ec 08             	sub    $0x8,%esp
  1059f3:	68 00 00 00 64       	push   $0x64000000
  1059f8:	6a 01                	push   $0x1
  1059fa:	e8 41 f8 ff ff       	call   105240 <get_pdir_entry_by_va>
  1059ff:	83 c4 10             	add    $0x10,%esp
  105a02:	85 c0                	test   %eax,%eax
  105a04:	74 1a                	je     105a20 <MPTNew_test1+0x90>
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  105a06:	83 ec 0c             	sub    $0xc,%esp
  105a09:	68 de 65 10 00       	push   $0x1065de
  105a0e:	e8 b9 ce ff ff       	call   1028cc <dprintf>
  105a13:	83 c4 10             	add    $0x10,%esp
  return 0;
}
  105a16:	89 d8                	mov    %ebx,%eax
  105a18:	83 c4 08             	add    $0x8,%esp
  105a1b:	5b                   	pop    %ebx
  105a1c:	c3                   	ret    
  105a1d:	8d 76 00             	lea    0x0(%esi),%esi
int MPTNew_test1()
{
  unsigned int vaddr = 4096*1024*400;
  container_split(0, 100);
  if (get_ptbl_entry_by_va(1, vaddr) != 0) {
    dprintf("test 1 failed.\n");
  105a20:	83 ec 0c             	sub    $0xc,%esp
    return 1;
  105a23:	bb 01 00 00 00       	mov    $0x1,%ebx
int MPTNew_test1()
{
  unsigned int vaddr = 4096*1024*400;
  container_split(0, 100);
  if (get_ptbl_entry_by_va(1, vaddr) != 0) {
    dprintf("test 1 failed.\n");
  105a28:	68 ce 65 10 00       	push   $0x1065ce
  105a2d:	e8 9a ce ff ff       	call   1028cc <dprintf>
    return 1;
  105a32:	83 c4 10             	add    $0x10,%esp
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  105a35:	89 d8                	mov    %ebx,%eax
  105a37:	83 c4 08             	add    $0x8,%esp
  105a3a:	5b                   	pop    %ebx
  105a3b:	c3                   	ret    
  105a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105a40 <MPTNew_test_own>:
int MPTNew_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  105a40:	31 c0                	xor    %eax,%eax
  105a42:	c3                   	ret    
  105a43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105a50 <test_MPTNew>:

int test_MPTNew()
{
  return MPTNew_test1() + MPTNew_test_own();
  105a50:	e9 3b ff ff ff       	jmp    105990 <MPTNew_test1>
  105a55:	66 90                	xchg   %ax,%ax
  105a57:	66 90                	xchg   %ax,%ax
  105a59:	66 90                	xchg   %ax,%ax
  105a5b:	66 90                	xchg   %ax,%ax
  105a5d:	66 90                	xchg   %ax,%ax
  105a5f:	90                   	nop

00105a60 <__udivdi3>:
  105a60:	55                   	push   %ebp
  105a61:	57                   	push   %edi
  105a62:	56                   	push   %esi
  105a63:	53                   	push   %ebx
  105a64:	83 ec 1c             	sub    $0x1c,%esp
  105a67:	8b 74 24 3c          	mov    0x3c(%esp),%esi
  105a6b:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  105a6f:	8b 4c 24 34          	mov    0x34(%esp),%ecx
  105a73:	8b 7c 24 38          	mov    0x38(%esp),%edi
  105a77:	85 f6                	test   %esi,%esi
  105a79:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  105a7d:	89 ca                	mov    %ecx,%edx
  105a7f:	89 f8                	mov    %edi,%eax
  105a81:	75 3d                	jne    105ac0 <__udivdi3+0x60>
  105a83:	39 cf                	cmp    %ecx,%edi
  105a85:	0f 87 c5 00 00 00    	ja     105b50 <__udivdi3+0xf0>
  105a8b:	85 ff                	test   %edi,%edi
  105a8d:	89 fd                	mov    %edi,%ebp
  105a8f:	75 0b                	jne    105a9c <__udivdi3+0x3c>
  105a91:	b8 01 00 00 00       	mov    $0x1,%eax
  105a96:	31 d2                	xor    %edx,%edx
  105a98:	f7 f7                	div    %edi
  105a9a:	89 c5                	mov    %eax,%ebp
  105a9c:	89 c8                	mov    %ecx,%eax
  105a9e:	31 d2                	xor    %edx,%edx
  105aa0:	f7 f5                	div    %ebp
  105aa2:	89 c1                	mov    %eax,%ecx
  105aa4:	89 d8                	mov    %ebx,%eax
  105aa6:	89 cf                	mov    %ecx,%edi
  105aa8:	f7 f5                	div    %ebp
  105aaa:	89 c3                	mov    %eax,%ebx
  105aac:	89 d8                	mov    %ebx,%eax
  105aae:	89 fa                	mov    %edi,%edx
  105ab0:	83 c4 1c             	add    $0x1c,%esp
  105ab3:	5b                   	pop    %ebx
  105ab4:	5e                   	pop    %esi
  105ab5:	5f                   	pop    %edi
  105ab6:	5d                   	pop    %ebp
  105ab7:	c3                   	ret    
  105ab8:	90                   	nop
  105ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105ac0:	39 ce                	cmp    %ecx,%esi
  105ac2:	77 74                	ja     105b38 <__udivdi3+0xd8>
  105ac4:	0f bd fe             	bsr    %esi,%edi
  105ac7:	83 f7 1f             	xor    $0x1f,%edi
  105aca:	0f 84 98 00 00 00    	je     105b68 <__udivdi3+0x108>
  105ad0:	bb 20 00 00 00       	mov    $0x20,%ebx
  105ad5:	89 f9                	mov    %edi,%ecx
  105ad7:	89 c5                	mov    %eax,%ebp
  105ad9:	29 fb                	sub    %edi,%ebx
  105adb:	d3 e6                	shl    %cl,%esi
  105add:	89 d9                	mov    %ebx,%ecx
  105adf:	d3 ed                	shr    %cl,%ebp
  105ae1:	89 f9                	mov    %edi,%ecx
  105ae3:	d3 e0                	shl    %cl,%eax
  105ae5:	09 ee                	or     %ebp,%esi
  105ae7:	89 d9                	mov    %ebx,%ecx
  105ae9:	89 44 24 0c          	mov    %eax,0xc(%esp)
  105aed:	89 d5                	mov    %edx,%ebp
  105aef:	8b 44 24 08          	mov    0x8(%esp),%eax
  105af3:	d3 ed                	shr    %cl,%ebp
  105af5:	89 f9                	mov    %edi,%ecx
  105af7:	d3 e2                	shl    %cl,%edx
  105af9:	89 d9                	mov    %ebx,%ecx
  105afb:	d3 e8                	shr    %cl,%eax
  105afd:	09 c2                	or     %eax,%edx
  105aff:	89 d0                	mov    %edx,%eax
  105b01:	89 ea                	mov    %ebp,%edx
  105b03:	f7 f6                	div    %esi
  105b05:	89 d5                	mov    %edx,%ebp
  105b07:	89 c3                	mov    %eax,%ebx
  105b09:	f7 64 24 0c          	mull   0xc(%esp)
  105b0d:	39 d5                	cmp    %edx,%ebp
  105b0f:	72 10                	jb     105b21 <__udivdi3+0xc1>
  105b11:	8b 74 24 08          	mov    0x8(%esp),%esi
  105b15:	89 f9                	mov    %edi,%ecx
  105b17:	d3 e6                	shl    %cl,%esi
  105b19:	39 c6                	cmp    %eax,%esi
  105b1b:	73 07                	jae    105b24 <__udivdi3+0xc4>
  105b1d:	39 d5                	cmp    %edx,%ebp
  105b1f:	75 03                	jne    105b24 <__udivdi3+0xc4>
  105b21:	83 eb 01             	sub    $0x1,%ebx
  105b24:	31 ff                	xor    %edi,%edi
  105b26:	89 d8                	mov    %ebx,%eax
  105b28:	89 fa                	mov    %edi,%edx
  105b2a:	83 c4 1c             	add    $0x1c,%esp
  105b2d:	5b                   	pop    %ebx
  105b2e:	5e                   	pop    %esi
  105b2f:	5f                   	pop    %edi
  105b30:	5d                   	pop    %ebp
  105b31:	c3                   	ret    
  105b32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105b38:	31 ff                	xor    %edi,%edi
  105b3a:	31 db                	xor    %ebx,%ebx
  105b3c:	89 d8                	mov    %ebx,%eax
  105b3e:	89 fa                	mov    %edi,%edx
  105b40:	83 c4 1c             	add    $0x1c,%esp
  105b43:	5b                   	pop    %ebx
  105b44:	5e                   	pop    %esi
  105b45:	5f                   	pop    %edi
  105b46:	5d                   	pop    %ebp
  105b47:	c3                   	ret    
  105b48:	90                   	nop
  105b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105b50:	89 d8                	mov    %ebx,%eax
  105b52:	f7 f7                	div    %edi
  105b54:	31 ff                	xor    %edi,%edi
  105b56:	89 c3                	mov    %eax,%ebx
  105b58:	89 d8                	mov    %ebx,%eax
  105b5a:	89 fa                	mov    %edi,%edx
  105b5c:	83 c4 1c             	add    $0x1c,%esp
  105b5f:	5b                   	pop    %ebx
  105b60:	5e                   	pop    %esi
  105b61:	5f                   	pop    %edi
  105b62:	5d                   	pop    %ebp
  105b63:	c3                   	ret    
  105b64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105b68:	39 ce                	cmp    %ecx,%esi
  105b6a:	72 0c                	jb     105b78 <__udivdi3+0x118>
  105b6c:	31 db                	xor    %ebx,%ebx
  105b6e:	3b 44 24 08          	cmp    0x8(%esp),%eax
  105b72:	0f 87 34 ff ff ff    	ja     105aac <__udivdi3+0x4c>
  105b78:	bb 01 00 00 00       	mov    $0x1,%ebx
  105b7d:	e9 2a ff ff ff       	jmp    105aac <__udivdi3+0x4c>
  105b82:	66 90                	xchg   %ax,%ax
  105b84:	66 90                	xchg   %ax,%ax
  105b86:	66 90                	xchg   %ax,%ax
  105b88:	66 90                	xchg   %ax,%ax
  105b8a:	66 90                	xchg   %ax,%ax
  105b8c:	66 90                	xchg   %ax,%ax
  105b8e:	66 90                	xchg   %ax,%ax

00105b90 <__umoddi3>:
  105b90:	55                   	push   %ebp
  105b91:	57                   	push   %edi
  105b92:	56                   	push   %esi
  105b93:	53                   	push   %ebx
  105b94:	83 ec 1c             	sub    $0x1c,%esp
  105b97:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  105b9b:	8b 4c 24 30          	mov    0x30(%esp),%ecx
  105b9f:	8b 74 24 34          	mov    0x34(%esp),%esi
  105ba3:	8b 7c 24 38          	mov    0x38(%esp),%edi
  105ba7:	85 c0                	test   %eax,%eax
  105ba9:	89 44 24 0c          	mov    %eax,0xc(%esp)
  105bad:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  105bb1:	89 3c 24             	mov    %edi,(%esp)
  105bb4:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  105bb8:	89 f2                	mov    %esi,%edx
  105bba:	75 14                	jne    105bd0 <__umoddi3+0x40>
  105bbc:	39 f7                	cmp    %esi,%edi
  105bbe:	76 40                	jbe    105c00 <__umoddi3+0x70>
  105bc0:	89 c8                	mov    %ecx,%eax
  105bc2:	f7 f7                	div    %edi
  105bc4:	89 d0                	mov    %edx,%eax
  105bc6:	31 d2                	xor    %edx,%edx
  105bc8:	83 c4 1c             	add    $0x1c,%esp
  105bcb:	5b                   	pop    %ebx
  105bcc:	5e                   	pop    %esi
  105bcd:	5f                   	pop    %edi
  105bce:	5d                   	pop    %ebp
  105bcf:	c3                   	ret    
  105bd0:	39 f0                	cmp    %esi,%eax
  105bd2:	89 f3                	mov    %esi,%ebx
  105bd4:	77 4a                	ja     105c20 <__umoddi3+0x90>
  105bd6:	0f bd e8             	bsr    %eax,%ebp
  105bd9:	83 f5 1f             	xor    $0x1f,%ebp
  105bdc:	75 52                	jne    105c30 <__umoddi3+0xa0>
  105bde:	39 f0                	cmp    %esi,%eax
  105be0:	0f 82 da 00 00 00    	jb     105cc0 <__umoddi3+0x130>
  105be6:	39 0c 24             	cmp    %ecx,(%esp)
  105be9:	0f 86 d1 00 00 00    	jbe    105cc0 <__umoddi3+0x130>
  105bef:	8b 44 24 04          	mov    0x4(%esp),%eax
  105bf3:	83 c4 1c             	add    $0x1c,%esp
  105bf6:	5b                   	pop    %ebx
  105bf7:	5e                   	pop    %esi
  105bf8:	5f                   	pop    %edi
  105bf9:	5d                   	pop    %ebp
  105bfa:	c3                   	ret    
  105bfb:	90                   	nop
  105bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105c00:	85 ff                	test   %edi,%edi
  105c02:	89 fd                	mov    %edi,%ebp
  105c04:	75 0b                	jne    105c11 <__umoddi3+0x81>
  105c06:	b8 01 00 00 00       	mov    $0x1,%eax
  105c0b:	31 d2                	xor    %edx,%edx
  105c0d:	f7 f7                	div    %edi
  105c0f:	89 c5                	mov    %eax,%ebp
  105c11:	89 f0                	mov    %esi,%eax
  105c13:	31 d2                	xor    %edx,%edx
  105c15:	f7 f5                	div    %ebp
  105c17:	89 c8                	mov    %ecx,%eax
  105c19:	f7 f5                	div    %ebp
  105c1b:	eb a7                	jmp    105bc4 <__umoddi3+0x34>
  105c1d:	8d 76 00             	lea    0x0(%esi),%esi
  105c20:	89 c8                	mov    %ecx,%eax
  105c22:	89 f2                	mov    %esi,%edx
  105c24:	83 c4 1c             	add    $0x1c,%esp
  105c27:	5b                   	pop    %ebx
  105c28:	5e                   	pop    %esi
  105c29:	5f                   	pop    %edi
  105c2a:	5d                   	pop    %ebp
  105c2b:	c3                   	ret    
  105c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105c30:	8b 34 24             	mov    (%esp),%esi
  105c33:	bf 20 00 00 00       	mov    $0x20,%edi
  105c38:	89 e9                	mov    %ebp,%ecx
  105c3a:	29 ef                	sub    %ebp,%edi
  105c3c:	d3 e0                	shl    %cl,%eax
  105c3e:	89 f9                	mov    %edi,%ecx
  105c40:	89 f2                	mov    %esi,%edx
  105c42:	d3 ea                	shr    %cl,%edx
  105c44:	89 e9                	mov    %ebp,%ecx
  105c46:	09 c2                	or     %eax,%edx
  105c48:	89 d8                	mov    %ebx,%eax
  105c4a:	89 14 24             	mov    %edx,(%esp)
  105c4d:	89 f2                	mov    %esi,%edx
  105c4f:	d3 e2                	shl    %cl,%edx
  105c51:	89 f9                	mov    %edi,%ecx
  105c53:	89 54 24 04          	mov    %edx,0x4(%esp)
  105c57:	8b 54 24 08          	mov    0x8(%esp),%edx
  105c5b:	d3 e8                	shr    %cl,%eax
  105c5d:	89 e9                	mov    %ebp,%ecx
  105c5f:	89 c6                	mov    %eax,%esi
  105c61:	d3 e3                	shl    %cl,%ebx
  105c63:	89 f9                	mov    %edi,%ecx
  105c65:	89 d0                	mov    %edx,%eax
  105c67:	d3 e8                	shr    %cl,%eax
  105c69:	89 e9                	mov    %ebp,%ecx
  105c6b:	09 d8                	or     %ebx,%eax
  105c6d:	89 d3                	mov    %edx,%ebx
  105c6f:	89 f2                	mov    %esi,%edx
  105c71:	f7 34 24             	divl   (%esp)
  105c74:	89 d6                	mov    %edx,%esi
  105c76:	d3 e3                	shl    %cl,%ebx
  105c78:	f7 64 24 04          	mull   0x4(%esp)
  105c7c:	39 d6                	cmp    %edx,%esi
  105c7e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  105c82:	89 d1                	mov    %edx,%ecx
  105c84:	89 c3                	mov    %eax,%ebx
  105c86:	72 08                	jb     105c90 <__umoddi3+0x100>
  105c88:	75 11                	jne    105c9b <__umoddi3+0x10b>
  105c8a:	39 44 24 08          	cmp    %eax,0x8(%esp)
  105c8e:	73 0b                	jae    105c9b <__umoddi3+0x10b>
  105c90:	2b 44 24 04          	sub    0x4(%esp),%eax
  105c94:	1b 14 24             	sbb    (%esp),%edx
  105c97:	89 d1                	mov    %edx,%ecx
  105c99:	89 c3                	mov    %eax,%ebx
  105c9b:	8b 54 24 08          	mov    0x8(%esp),%edx
  105c9f:	29 da                	sub    %ebx,%edx
  105ca1:	19 ce                	sbb    %ecx,%esi
  105ca3:	89 f9                	mov    %edi,%ecx
  105ca5:	89 f0                	mov    %esi,%eax
  105ca7:	d3 e0                	shl    %cl,%eax
  105ca9:	89 e9                	mov    %ebp,%ecx
  105cab:	d3 ea                	shr    %cl,%edx
  105cad:	89 e9                	mov    %ebp,%ecx
  105caf:	d3 ee                	shr    %cl,%esi
  105cb1:	09 d0                	or     %edx,%eax
  105cb3:	89 f2                	mov    %esi,%edx
  105cb5:	83 c4 1c             	add    $0x1c,%esp
  105cb8:	5b                   	pop    %ebx
  105cb9:	5e                   	pop    %esi
  105cba:	5f                   	pop    %edi
  105cbb:	5d                   	pop    %ebp
  105cbc:	c3                   	ret    
  105cbd:	8d 76 00             	lea    0x0(%esi),%esi
  105cc0:	89 f2                	mov    %esi,%edx
  105cc2:	29 f9                	sub    %edi,%ecx
  105cc4:	1b 54 24 0c          	sbb    0xc(%esp),%edx
  105cc8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  105ccc:	e9 1e ff ff ff       	jmp    105bef <__umoddi3+0x5f>
