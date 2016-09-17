
obj/kern/kernel：     文件格式 elf32-i386


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
  100032:	c7 05 5c 6f 10 00 b4 	movl   $0x3b4,0x106f5c
  100039:	03 00 00 
  10003c:	a1 5c 6f 10 00       	mov    0x106f5c,%eax
  100041:	83 ec 08             	sub    $0x8,%esp
  100044:	50                   	push   %eax
  100045:	68 44 27 10 00       	push   $0x102744
  10004a:	e8 15 14 00 00       	call   101464 <dprintf>
  10004f:	83 c4 10             	add    $0x10,%esp
  100052:	eb 2a                	jmp    10007e <video_init+0x7e>
  100054:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100057:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10005b:	66 89 10             	mov    %dx,(%eax)
  10005e:	c7 05 5c 6f 10 00 d4 	movl   $0x3d4,0x106f5c
  100065:	03 00 00 
  100068:	a1 5c 6f 10 00       	mov    0x106f5c,%eax
  10006d:	83 ec 08             	sub    $0x8,%esp
  100070:	50                   	push   %eax
  100071:	68 44 27 10 00       	push   $0x102744
  100076:	e8 e9 13 00 00       	call   101464 <dprintf>
  10007b:	83 c4 10             	add    $0x10,%esp
  10007e:	a1 5c 6f 10 00       	mov    0x106f5c,%eax
  100083:	83 ec 08             	sub    $0x8,%esp
  100086:	6a 0e                	push   $0xe
  100088:	50                   	push   %eax
  100089:	e8 c8 1f 00 00       	call   102056 <outb>
  10008e:	83 c4 10             	add    $0x10,%esp
  100091:	a1 5c 6f 10 00       	mov    0x106f5c,%eax
  100096:	83 c0 01             	add    $0x1,%eax
  100099:	83 ec 0c             	sub    $0xc,%esp
  10009c:	50                   	push   %eax
  10009d:	e8 79 1f 00 00       	call   10201b <inb>
  1000a2:	83 c4 10             	add    $0x10,%esp
  1000a5:	0f b6 c0             	movzbl %al,%eax
  1000a8:	c1 e0 08             	shl    $0x8,%eax
  1000ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1000ae:	a1 5c 6f 10 00       	mov    0x106f5c,%eax
  1000b3:	83 ec 08             	sub    $0x8,%esp
  1000b6:	6a 0f                	push   $0xf
  1000b8:	50                   	push   %eax
  1000b9:	e8 98 1f 00 00       	call   102056 <outb>
  1000be:	83 c4 10             	add    $0x10,%esp
  1000c1:	a1 5c 6f 10 00       	mov    0x106f5c,%eax
  1000c6:	83 c0 01             	add    $0x1,%eax
  1000c9:	83 ec 0c             	sub    $0xc,%esp
  1000cc:	50                   	push   %eax
  1000cd:	e8 49 1f 00 00       	call   10201b <inb>
  1000d2:	83 c4 10             	add    $0x10,%esp
  1000d5:	0f b6 c0             	movzbl %al,%eax
  1000d8:	09 45 ec             	or     %eax,-0x14(%ebp)
  1000db:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000de:	a3 50 6f 10 00       	mov    %eax,0x106f50
  1000e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1000e6:	66 a3 54 6f 10 00    	mov    %ax,0x106f54
  1000ec:	c7 05 58 6f 10 00 00 	movl   $0x0,0x106f58
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
  10013d:	0f b7 05 54 6f 10 00 	movzwl 0x106f54,%eax
  100144:	66 85 c0             	test   %ax,%ax
  100147:	0f 84 e6 00 00 00    	je     100233 <video_putc+0x13a>
  10014d:	0f b7 05 54 6f 10 00 	movzwl 0x106f54,%eax
  100154:	83 e8 01             	sub    $0x1,%eax
  100157:	66 a3 54 6f 10 00    	mov    %ax,0x106f54
  10015d:	a1 50 6f 10 00       	mov    0x106f50,%eax
  100162:	0f b7 15 54 6f 10 00 	movzwl 0x106f54,%edx
  100169:	0f b7 d2             	movzwl %dx,%edx
  10016c:	01 d2                	add    %edx,%edx
  10016e:	01 d0                	add    %edx,%eax
  100170:	8b 55 08             	mov    0x8(%ebp),%edx
  100173:	b2 00                	mov    $0x0,%dl
  100175:	83 ca 20             	or     $0x20,%edx
  100178:	66 89 10             	mov    %dx,(%eax)
  10017b:	e9 b3 00 00 00       	jmp    100233 <video_putc+0x13a>
  100180:	0f b7 05 54 6f 10 00 	movzwl 0x106f54,%eax
  100187:	83 c0 50             	add    $0x50,%eax
  10018a:	66 a3 54 6f 10 00    	mov    %ax,0x106f54
  100190:	0f b7 1d 54 6f 10 00 	movzwl 0x106f54,%ebx
  100197:	0f b7 0d 54 6f 10 00 	movzwl 0x106f54,%ecx
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
  1001c2:	66 a3 54 6f 10 00    	mov    %ax,0x106f54
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
  10020d:	8b 0d 50 6f 10 00    	mov    0x106f50,%ecx
  100213:	0f b7 05 54 6f 10 00 	movzwl 0x106f54,%eax
  10021a:	8d 50 01             	lea    0x1(%eax),%edx
  10021d:	66 89 15 54 6f 10 00 	mov    %dx,0x106f54
  100224:	0f b7 c0             	movzwl %ax,%eax
  100227:	01 c0                	add    %eax,%eax
  100229:	01 c8                	add    %ecx,%eax
  10022b:	8b 55 08             	mov    0x8(%ebp),%edx
  10022e:	66 89 10             	mov    %dx,(%eax)
  100231:	eb 01                	jmp    100234 <video_putc+0x13b>
  100233:	90                   	nop
  100234:	0f b7 05 54 6f 10 00 	movzwl 0x106f54,%eax
  10023b:	66 3d cf 07          	cmp    $0x7cf,%ax
  10023f:	76 59                	jbe    10029a <video_putc+0x1a1>
  100241:	a1 50 6f 10 00       	mov    0x106f50,%eax
  100246:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10024c:	a1 50 6f 10 00       	mov    0x106f50,%eax
  100251:	83 ec 04             	sub    $0x4,%esp
  100254:	68 00 0f 00 00       	push   $0xf00
  100259:	52                   	push   %edx
  10025a:	50                   	push   %eax
  10025b:	e8 82 0d 00 00       	call   100fe2 <memmove>
  100260:	83 c4 10             	add    $0x10,%esp
  100263:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  10026a:	eb 15                	jmp    100281 <video_putc+0x188>
  10026c:	a1 50 6f 10 00       	mov    0x106f50,%eax
  100271:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100274:	01 d2                	add    %edx,%edx
  100276:	01 d0                	add    %edx,%eax
  100278:	66 c7 00 20 07       	movw   $0x720,(%eax)
  10027d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100281:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  100288:	7e e2                	jle    10026c <video_putc+0x173>
  10028a:	0f b7 05 54 6f 10 00 	movzwl 0x106f54,%eax
  100291:	83 e8 50             	sub    $0x50,%eax
  100294:	66 a3 54 6f 10 00    	mov    %ax,0x106f54
  10029a:	a1 5c 6f 10 00       	mov    0x106f5c,%eax
  10029f:	83 ec 08             	sub    $0x8,%esp
  1002a2:	6a 0e                	push   $0xe
  1002a4:	50                   	push   %eax
  1002a5:	e8 ac 1d 00 00       	call   102056 <outb>
  1002aa:	83 c4 10             	add    $0x10,%esp
  1002ad:	0f b7 05 54 6f 10 00 	movzwl 0x106f54,%eax
  1002b4:	66 c1 e8 08          	shr    $0x8,%ax
  1002b8:	0f b6 c0             	movzbl %al,%eax
  1002bb:	8b 15 5c 6f 10 00    	mov    0x106f5c,%edx
  1002c1:	83 c2 01             	add    $0x1,%edx
  1002c4:	83 ec 08             	sub    $0x8,%esp
  1002c7:	50                   	push   %eax
  1002c8:	52                   	push   %edx
  1002c9:	e8 88 1d 00 00       	call   102056 <outb>
  1002ce:	83 c4 10             	add    $0x10,%esp
  1002d1:	a1 5c 6f 10 00       	mov    0x106f5c,%eax
  1002d6:	83 ec 08             	sub    $0x8,%esp
  1002d9:	6a 0f                	push   $0xf
  1002db:	50                   	push   %eax
  1002dc:	e8 75 1d 00 00       	call   102056 <outb>
  1002e1:	83 c4 10             	add    $0x10,%esp
  1002e4:	0f b7 05 54 6f 10 00 	movzwl 0x106f54,%eax
  1002eb:	0f b6 c0             	movzbl %al,%eax
  1002ee:	8b 15 5c 6f 10 00    	mov    0x106f5c,%edx
  1002f4:	83 c2 01             	add    $0x1,%edx
  1002f7:	83 ec 08             	sub    $0x8,%esp
  1002fa:	50                   	push   %eax
  1002fb:	52                   	push   %edx
  1002fc:	e8 55 1d 00 00       	call   102056 <outb>
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
  100323:	66 a3 54 6f 10 00    	mov    %ax,0x106f54
  100329:	90                   	nop
  10032a:	5d                   	pop    %ebp
  10032b:	c3                   	ret    

0010032c <video_clear_screen>:
  10032c:	55                   	push   %ebp
  10032d:	89 e5                	mov    %esp,%ebp
  10032f:	83 ec 10             	sub    $0x10,%esp
  100332:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100339:	eb 15                	jmp    100350 <video_clear_screen+0x24>
  10033b:	a1 50 6f 10 00       	mov    0x106f50,%eax
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
  10036c:	68 60 6f 10 00       	push   $0x106f60
  100371:	e8 fe 0b 00 00       	call   100f74 <memset>
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
  100396:	a1 64 71 10 00       	mov    0x107164,%eax
  10039b:	8d 50 01             	lea    0x1(%eax),%edx
  10039e:	89 15 64 71 10 00    	mov    %edx,0x107164
  1003a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1003a7:	88 90 60 6f 10 00    	mov    %dl,0x106f60(%eax)
  1003ad:	a1 64 71 10 00       	mov    0x107164,%eax
  1003b2:	3d 00 02 00 00       	cmp    $0x200,%eax
  1003b7:	75 0a                	jne    1003c3 <cons_intr+0x3d>
  1003b9:	c7 05 64 71 10 00 00 	movl   $0x0,0x107164
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
  1003e4:	8b 15 60 71 10 00    	mov    0x107160,%edx
  1003ea:	a1 64 71 10 00       	mov    0x107164,%eax
  1003ef:	39 c2                	cmp    %eax,%edx
  1003f1:	74 36                	je     100429 <cons_getc+0x55>
  1003f3:	a1 60 71 10 00       	mov    0x107160,%eax
  1003f8:	8d 50 01             	lea    0x1(%eax),%edx
  1003fb:	89 15 60 71 10 00    	mov    %edx,0x107160
  100401:	0f b6 80 60 6f 10 00 	movzbl 0x106f60(%eax),%eax
  100408:	0f be c0             	movsbl %al,%eax
  10040b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10040e:	a1 60 71 10 00       	mov    0x107160,%eax
  100413:	3d 00 02 00 00       	cmp    $0x200,%eax
  100418:	75 0a                	jne    100424 <cons_getc+0x50>
  10041a:	c7 05 60 71 10 00 00 	movl   $0x0,0x107160
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
  1004aa:	68 52 27 10 00       	push   $0x102752
  1004af:	e8 b0 0f 00 00       	call   101464 <dprintf>
  1004b4:	83 c4 10             	add    $0x10,%esp
  1004b7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1004be:	e8 9c ff ff ff       	call   10045f <getchar>
  1004c3:	88 45 f3             	mov    %al,-0xd(%ebp)
  1004c6:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  1004ca:	79 1f                	jns    1004eb <readline+0x53>
  1004cc:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
  1004d0:	83 ec 08             	sub    $0x8,%esp
  1004d3:	50                   	push   %eax
  1004d4:	68 55 27 10 00       	push   $0x102755
  1004d9:	e8 86 0f 00 00       	call   101464 <dprintf>
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
  10053c:	88 90 00 60 10 00    	mov    %dl,0x106000(%eax)
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
  100564:	05 00 60 10 00       	add    $0x106000,%eax
  100569:	c6 00 00             	movb   $0x0,(%eax)
  10056c:	b8 00 60 10 00       	mov    $0x106000,%eax
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
  100588:	e8 8e 1a 00 00       	call   10201b <inb>
  10058d:	83 c4 10             	add    $0x10,%esp
  100590:	83 ec 0c             	sub    $0xc,%esp
  100593:	68 84 00 00 00       	push   $0x84
  100598:	e8 7e 1a 00 00       	call   10201b <inb>
  10059d:	83 c4 10             	add    $0x10,%esp
  1005a0:	83 ec 0c             	sub    $0xc,%esp
  1005a3:	68 84 00 00 00       	push   $0x84
  1005a8:	e8 6e 1a 00 00       	call   10201b <inb>
  1005ad:	83 c4 10             	add    $0x10,%esp
  1005b0:	83 ec 0c             	sub    $0xc,%esp
  1005b3:	68 84 00 00 00       	push   $0x84
  1005b8:	e8 5e 1a 00 00       	call   10201b <inb>
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
  1005d1:	e8 45 1a 00 00       	call   10201b <inb>
  1005d6:	83 c4 10             	add    $0x10,%esp
  1005d9:	0f b6 c0             	movzbl %al,%eax
  1005dc:	83 e0 01             	and    $0x1,%eax
  1005df:	85 c0                	test   %eax,%eax
  1005e1:	75 07                	jne    1005ea <serial_proc_data+0x27>
  1005e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005e8:	eb 13                	jmp    1005fd <serial_proc_data+0x3a>
  1005ea:	83 ec 0c             	sub    $0xc,%esp
  1005ed:	68 f8 03 00 00       	push   $0x3f8
  1005f2:	e8 24 1a 00 00       	call   10201b <inb>
  1005f7:	83 c4 10             	add    $0x10,%esp
  1005fa:	0f b6 c0             	movzbl %al,%eax
  1005fd:	c9                   	leave  
  1005fe:	c3                   	ret    

001005ff <serial_intr>:
  1005ff:	55                   	push   %ebp
  100600:	89 e5                	mov    %esp,%ebp
  100602:	83 ec 08             	sub    $0x8,%esp
  100605:	0f b6 05 68 71 10 00 	movzbl 0x107168,%eax
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
  10064c:	e8 05 1a 00 00       	call   102056 <outb>
  100651:	83 c4 10             	add    $0x10,%esp
  100654:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100657:	0f b6 c0             	movzbl %al,%eax
  10065a:	83 ec 08             	sub    $0x8,%esp
  10065d:	50                   	push   %eax
  10065e:	ff 75 0c             	pushl  0xc(%ebp)
  100661:	e8 f0 19 00 00       	call   102056 <outb>
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
  100683:	0f b6 05 68 71 10 00 	movzbl 0x107168,%eax
  10068a:	84 c0                	test   %al,%al
  10068c:	74 68                	je     1006f6 <serial_putc+0x7f>
  10068e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100695:	eb 09                	jmp    1006a0 <serial_putc+0x29>
  100697:	e8 de fe ff ff       	call   10057a <delay>
  10069c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1006a0:	83 ec 0c             	sub    $0xc,%esp
  1006a3:	68 fd 03 00 00       	push   $0x3fd
  1006a8:	e8 6e 19 00 00       	call   10201b <inb>
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
  1006ec:	e8 65 19 00 00       	call   102056 <outb>
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
  100709:	e8 48 19 00 00       	call   102056 <outb>
  10070e:	83 c4 10             	add    $0x10,%esp
  100711:	83 ec 08             	sub    $0x8,%esp
  100714:	68 80 00 00 00       	push   $0x80
  100719:	68 fb 03 00 00       	push   $0x3fb
  10071e:	e8 33 19 00 00       	call   102056 <outb>
  100723:	83 c4 10             	add    $0x10,%esp
  100726:	83 ec 08             	sub    $0x8,%esp
  100729:	6a 01                	push   $0x1
  10072b:	68 f8 03 00 00       	push   $0x3f8
  100730:	e8 21 19 00 00       	call   102056 <outb>
  100735:	83 c4 10             	add    $0x10,%esp
  100738:	83 ec 08             	sub    $0x8,%esp
  10073b:	6a 00                	push   $0x0
  10073d:	68 f9 03 00 00       	push   $0x3f9
  100742:	e8 0f 19 00 00       	call   102056 <outb>
  100747:	83 c4 10             	add    $0x10,%esp
  10074a:	83 ec 08             	sub    $0x8,%esp
  10074d:	6a 03                	push   $0x3
  10074f:	68 fb 03 00 00       	push   $0x3fb
  100754:	e8 fd 18 00 00       	call   102056 <outb>
  100759:	83 c4 10             	add    $0x10,%esp
  10075c:	83 ec 08             	sub    $0x8,%esp
  10075f:	68 c7 00 00 00       	push   $0xc7
  100764:	68 fa 03 00 00       	push   $0x3fa
  100769:	e8 e8 18 00 00       	call   102056 <outb>
  10076e:	83 c4 10             	add    $0x10,%esp
  100771:	83 ec 08             	sub    $0x8,%esp
  100774:	6a 0b                	push   $0xb
  100776:	68 fc 03 00 00       	push   $0x3fc
  10077b:	e8 d6 18 00 00       	call   102056 <outb>
  100780:	83 c4 10             	add    $0x10,%esp
  100783:	83 ec 0c             	sub    $0xc,%esp
  100786:	68 fd 03 00 00       	push   $0x3fd
  10078b:	e8 8b 18 00 00       	call   10201b <inb>
  100790:	83 c4 10             	add    $0x10,%esp
  100793:	3c ff                	cmp    $0xff,%al
  100795:	0f 95 c0             	setne  %al
  100798:	a2 68 71 10 00       	mov    %al,0x107168
  10079d:	83 ec 0c             	sub    $0xc,%esp
  1007a0:	68 fa 03 00 00       	push   $0x3fa
  1007a5:	e8 71 18 00 00       	call   10201b <inb>
  1007aa:	83 c4 10             	add    $0x10,%esp
  1007ad:	83 ec 0c             	sub    $0xc,%esp
  1007b0:	68 f8 03 00 00       	push   $0x3f8
  1007b5:	e8 61 18 00 00       	call   10201b <inb>
  1007ba:	83 c4 10             	add    $0x10,%esp
  1007bd:	90                   	nop
  1007be:	c9                   	leave  
  1007bf:	c3                   	ret    

001007c0 <serial_intenable>:
  1007c0:	55                   	push   %ebp
  1007c1:	89 e5                	mov    %esp,%ebp
  1007c3:	83 ec 08             	sub    $0x8,%esp
  1007c6:	0f b6 05 68 71 10 00 	movzbl 0x107168,%eax
  1007cd:	84 c0                	test   %al,%al
  1007cf:	74 17                	je     1007e8 <serial_intenable+0x28>
  1007d1:	83 ec 08             	sub    $0x8,%esp
  1007d4:	6a 01                	push   $0x1
  1007d6:	68 f9 03 00 00       	push   $0x3f9
  1007db:	e8 76 18 00 00       	call   102056 <outb>
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
  1007f6:	e8 20 18 00 00       	call   10201b <inb>
  1007fb:	83 c4 10             	add    $0x10,%esp
  1007fe:	83 e0 01             	and    $0x1,%eax
  100801:	85 c0                	test   %eax,%eax
  100803:	75 0a                	jne    10080f <kbd_proc_data+0x24>
  100805:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10080a:	e9 55 01 00 00       	jmp    100964 <kbd_proc_data+0x179>
  10080f:	83 ec 0c             	sub    $0xc,%esp
  100812:	6a 60                	push   $0x60
  100814:	e8 02 18 00 00       	call   10201b <inb>
  100819:	83 c4 10             	add    $0x10,%esp
  10081c:	88 45 f3             	mov    %al,-0xd(%ebp)
  10081f:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  100823:	75 17                	jne    10083c <kbd_proc_data+0x51>
  100825:	a1 00 64 10 00       	mov    0x106400,%eax
  10082a:	83 c8 40             	or     $0x40,%eax
  10082d:	a3 00 64 10 00       	mov    %eax,0x106400
  100832:	b8 00 00 00 00       	mov    $0x0,%eax
  100837:	e9 28 01 00 00       	jmp    100964 <kbd_proc_data+0x179>
  10083c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100840:	84 c0                	test   %al,%al
  100842:	79 47                	jns    10088b <kbd_proc_data+0xa0>
  100844:	a1 00 64 10 00       	mov    0x106400,%eax
  100849:	83 e0 40             	and    $0x40,%eax
  10084c:	85 c0                	test   %eax,%eax
  10084e:	75 09                	jne    100859 <kbd_proc_data+0x6e>
  100850:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100854:	83 e0 7f             	and    $0x7f,%eax
  100857:	eb 04                	jmp    10085d <kbd_proc_data+0x72>
  100859:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10085d:	88 45 f3             	mov    %al,-0xd(%ebp)
  100860:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100864:	0f b6 80 00 50 10 00 	movzbl 0x105000(%eax),%eax
  10086b:	83 c8 40             	or     $0x40,%eax
  10086e:	0f b6 c0             	movzbl %al,%eax
  100871:	f7 d0                	not    %eax
  100873:	89 c2                	mov    %eax,%edx
  100875:	a1 00 64 10 00       	mov    0x106400,%eax
  10087a:	21 d0                	and    %edx,%eax
  10087c:	a3 00 64 10 00       	mov    %eax,0x106400
  100881:	b8 00 00 00 00       	mov    $0x0,%eax
  100886:	e9 d9 00 00 00       	jmp    100964 <kbd_proc_data+0x179>
  10088b:	a1 00 64 10 00       	mov    0x106400,%eax
  100890:	83 e0 40             	and    $0x40,%eax
  100893:	85 c0                	test   %eax,%eax
  100895:	74 11                	je     1008a8 <kbd_proc_data+0xbd>
  100897:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
  10089b:	a1 00 64 10 00       	mov    0x106400,%eax
  1008a0:	83 e0 bf             	and    $0xffffffbf,%eax
  1008a3:	a3 00 64 10 00       	mov    %eax,0x106400
  1008a8:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1008ac:	0f b6 80 00 50 10 00 	movzbl 0x105000(%eax),%eax
  1008b3:	0f b6 d0             	movzbl %al,%edx
  1008b6:	a1 00 64 10 00       	mov    0x106400,%eax
  1008bb:	09 d0                	or     %edx,%eax
  1008bd:	a3 00 64 10 00       	mov    %eax,0x106400
  1008c2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1008c6:	0f b6 80 00 51 10 00 	movzbl 0x105100(%eax),%eax
  1008cd:	0f b6 d0             	movzbl %al,%edx
  1008d0:	a1 00 64 10 00       	mov    0x106400,%eax
  1008d5:	31 d0                	xor    %edx,%eax
  1008d7:	a3 00 64 10 00       	mov    %eax,0x106400
  1008dc:	a1 00 64 10 00       	mov    0x106400,%eax
  1008e1:	83 e0 03             	and    $0x3,%eax
  1008e4:	8b 14 85 00 55 10 00 	mov    0x105500(,%eax,4),%edx
  1008eb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1008ef:	01 d0                	add    %edx,%eax
  1008f1:	0f b6 00             	movzbl (%eax),%eax
  1008f4:	0f b6 c0             	movzbl %al,%eax
  1008f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1008fa:	a1 00 64 10 00       	mov    0x106400,%eax
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
  100928:	a1 00 64 10 00       	mov    0x106400,%eax
  10092d:	f7 d0                	not    %eax
  10092f:	83 e0 06             	and    $0x6,%eax
  100932:	85 c0                	test   %eax,%eax
  100934:	75 2b                	jne    100961 <kbd_proc_data+0x176>
  100936:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10093d:	75 22                	jne    100961 <kbd_proc_data+0x176>
  10093f:	83 ec 0c             	sub    $0xc,%esp
  100942:	68 65 27 10 00       	push   $0x102765
  100947:	e8 18 0b 00 00       	call   101464 <dprintf>
  10094c:	83 c4 10             	add    $0x10,%esp
  10094f:	83 ec 08             	sub    $0x8,%esp
  100952:	6a 03                	push   $0x3
  100954:	68 92 00 00 00       	push   $0x92
  100959:	e8 f8 16 00 00       	call   102056 <outb>
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
  100985:	e8 7b 0f 00 00       	call   101905 <seg_init>
  10098a:	e8 52 15 00 00       	call   101ee1 <enable_sse>
  10098f:	e8 c8 f9 ff ff       	call   10035c <cons_init>
  100994:	83 ec 04             	sub    $0x4,%esp
  100997:	68 71 27 10 00       	push   $0x102771
  10099c:	6a 11                	push   $0x11
  10099e:	68 84 27 10 00       	push   $0x102784
  1009a3:	e8 58 08 00 00       	call   101200 <debug_normal>
  1009a8:	83 c4 10             	add    $0x10,%esp
  1009ab:	ff 75 08             	pushl  0x8(%ebp)
  1009ae:	68 97 27 10 00       	push   $0x102797
  1009b3:	6a 12                	push   $0x12
  1009b5:	68 84 27 10 00       	push   $0x102784
  1009ba:	e8 41 08 00 00       	call   101200 <debug_normal>
  1009bf:	83 c4 10             	add    $0x10,%esp
  1009c2:	83 ec 0c             	sub    $0xc,%esp
  1009c5:	ff 75 08             	pushl  0x8(%ebp)
  1009c8:	e8 4c 03 00 00       	call   100d19 <pmmap_init>
  1009cd:	83 c4 10             	add    $0x10,%esp
  1009d0:	90                   	nop
  1009d1:	c9                   	leave  
  1009d2:	c3                   	ret    

001009d3 <pmmap_alloc_slot>:
  1009d3:	55                   	push   %ebp
  1009d4:	89 e5                	mov    %esp,%ebp
  1009d6:	a1 20 6e 10 00       	mov    0x106e20,%eax
  1009db:	3d 80 00 00 00       	cmp    $0x80,%eax
  1009e0:	0f 94 c0             	sete   %al
  1009e3:	0f b6 c0             	movzbl %al,%eax
  1009e6:	85 c0                	test   %eax,%eax
  1009e8:	74 07                	je     1009f1 <pmmap_alloc_slot+0x1e>
  1009ea:	b8 00 00 00 00       	mov    $0x0,%eax
  1009ef:	eb 1d                	jmp    100a0e <pmmap_alloc_slot+0x3b>
  1009f1:	8b 15 20 6e 10 00    	mov    0x106e20,%edx
  1009f7:	8d 42 01             	lea    0x1(%edx),%eax
  1009fa:	a3 20 6e 10 00       	mov    %eax,0x106e20
  1009ff:	89 d0                	mov    %edx,%eax
  100a01:	c1 e0 02             	shl    $0x2,%eax
  100a04:	01 d0                	add    %edx,%eax
  100a06:	c1 e0 02             	shl    $0x2,%eax
  100a09:	05 20 64 10 00       	add    $0x106420,%eax
  100a0e:	5d                   	pop    %ebp
  100a0f:	c3                   	ret    

00100a10 <pmmap_insert>:
  100a10:	55                   	push   %ebp
  100a11:	89 e5                	mov    %esp,%ebp
  100a13:	83 ec 18             	sub    $0x18,%esp
  100a16:	e8 b8 ff ff ff       	call   1009d3 <pmmap_alloc_slot>
  100a1b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100a1e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100a22:	75 17                	jne    100a3b <pmmap_insert+0x2b>
  100a24:	83 ec 04             	sub    $0x4,%esp
  100a27:	68 ac 27 10 00       	push   $0x1027ac
  100a2c:	6a 3d                	push   $0x3d
  100a2e:	68 c9 27 10 00       	push   $0x1027c9
  100a33:	e8 67 08 00 00       	call   10129f <debug_panic>
  100a38:	83 c4 10             	add    $0x10,%esp
  100a3b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a3e:	8b 55 08             	mov    0x8(%ebp),%edx
  100a41:	89 10                	mov    %edx,(%eax)
  100a43:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a46:	8b 55 0c             	mov    0xc(%ebp),%edx
  100a49:	89 50 04             	mov    %edx,0x4(%eax)
  100a4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a4f:	8b 55 10             	mov    0x10(%ebp),%edx
  100a52:	89 50 08             	mov    %edx,0x8(%eax)
  100a55:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  100a5c:	a1 24 6e 10 00       	mov    0x106e24,%eax
  100a61:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a64:	eb 19                	jmp    100a7f <pmmap_insert+0x6f>
  100a66:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a69:	8b 00                	mov    (%eax),%eax
  100a6b:	3b 45 08             	cmp    0x8(%ebp),%eax
  100a6e:	77 17                	ja     100a87 <pmmap_insert+0x77>
  100a70:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a73:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100a76:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a79:	8b 40 0c             	mov    0xc(%eax),%eax
  100a7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a7f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a83:	75 e1                	jne    100a66 <pmmap_insert+0x56>
  100a85:	eb 01                	jmp    100a88 <pmmap_insert+0x78>
  100a87:	90                   	nop
  100a88:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100a8c:	75 16                	jne    100aa4 <pmmap_insert+0x94>
  100a8e:	8b 15 24 6e 10 00    	mov    0x106e24,%edx
  100a94:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a97:	89 50 0c             	mov    %edx,0xc(%eax)
  100a9a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a9d:	a3 24 6e 10 00       	mov    %eax,0x106e24
  100aa2:	eb 15                	jmp    100ab9 <pmmap_insert+0xa9>
  100aa4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100aa7:	8b 50 0c             	mov    0xc(%eax),%edx
  100aaa:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100aad:	89 50 0c             	mov    %edx,0xc(%eax)
  100ab0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ab3:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100ab6:	89 50 0c             	mov    %edx,0xc(%eax)
  100ab9:	90                   	nop
  100aba:	c9                   	leave  
  100abb:	c3                   	ret    

00100abc <pmmap_merge>:
  100abc:	55                   	push   %ebp
  100abd:	89 e5                	mov    %esp,%ebp
  100abf:	83 ec 28             	sub    $0x28,%esp
  100ac2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  100ac9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  100ad0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100ad7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100ade:	a1 24 6e 10 00       	mov    0x106e24,%eax
  100ae3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100ae6:	eb 75                	jmp    100b5d <pmmap_merge+0xa1>
  100ae8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aeb:	8b 40 0c             	mov    0xc(%eax),%eax
  100aee:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100af1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100af5:	74 6e                	je     100b65 <pmmap_merge+0xa9>
  100af7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100afa:	8b 10                	mov    (%eax),%edx
  100afc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100aff:	8b 00                	mov    (%eax),%eax
  100b01:	39 c2                	cmp    %eax,%edx
  100b03:	77 4f                	ja     100b54 <pmmap_merge+0x98>
  100b05:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b08:	8b 50 04             	mov    0x4(%eax),%edx
  100b0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b0e:	8b 00                	mov    (%eax),%eax
  100b10:	39 c2                	cmp    %eax,%edx
  100b12:	72 40                	jb     100b54 <pmmap_merge+0x98>
  100b14:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b17:	8b 50 08             	mov    0x8(%eax),%edx
  100b1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b1d:	8b 40 08             	mov    0x8(%eax),%eax
  100b20:	39 c2                	cmp    %eax,%edx
  100b22:	75 30                	jne    100b54 <pmmap_merge+0x98>
  100b24:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b27:	8b 50 04             	mov    0x4(%eax),%edx
  100b2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b2d:	8b 40 04             	mov    0x4(%eax),%eax
  100b30:	83 ec 08             	sub    $0x8,%esp
  100b33:	52                   	push   %edx
  100b34:	50                   	push   %eax
  100b35:	e8 ca 12 00 00       	call   101e04 <max>
  100b3a:	83 c4 10             	add    $0x10,%esp
  100b3d:	89 c2                	mov    %eax,%edx
  100b3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b42:	89 50 04             	mov    %edx,0x4(%eax)
  100b45:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b48:	8b 40 0c             	mov    0xc(%eax),%eax
  100b4b:	8b 50 0c             	mov    0xc(%eax),%edx
  100b4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b51:	89 50 0c             	mov    %edx,0xc(%eax)
  100b54:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b57:	8b 40 0c             	mov    0xc(%eax),%eax
  100b5a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100b5d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b61:	75 85                	jne    100ae8 <pmmap_merge+0x2c>
  100b63:	eb 01                	jmp    100b66 <pmmap_merge+0xaa>
  100b65:	90                   	nop
  100b66:	a1 24 6e 10 00       	mov    0x106e24,%eax
  100b6b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100b6e:	e9 c9 00 00 00       	jmp    100c3c <pmmap_merge+0x180>
  100b73:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b76:	8b 40 08             	mov    0x8(%eax),%eax
  100b79:	83 f8 01             	cmp    $0x1,%eax
  100b7c:	74 3d                	je     100bbb <pmmap_merge+0xff>
  100b7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b81:	8b 40 08             	mov    0x8(%eax),%eax
  100b84:	83 f8 02             	cmp    $0x2,%eax
  100b87:	74 2b                	je     100bb4 <pmmap_merge+0xf8>
  100b89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b8c:	8b 40 08             	mov    0x8(%eax),%eax
  100b8f:	83 f8 03             	cmp    $0x3,%eax
  100b92:	74 19                	je     100bad <pmmap_merge+0xf1>
  100b94:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b97:	8b 40 08             	mov    0x8(%eax),%eax
  100b9a:	83 f8 04             	cmp    $0x4,%eax
  100b9d:	75 07                	jne    100ba6 <pmmap_merge+0xea>
  100b9f:	b8 03 00 00 00       	mov    $0x3,%eax
  100ba4:	eb 1a                	jmp    100bc0 <pmmap_merge+0x104>
  100ba6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100bab:	eb 13                	jmp    100bc0 <pmmap_merge+0x104>
  100bad:	b8 02 00 00 00       	mov    $0x2,%eax
  100bb2:	eb 0c                	jmp    100bc0 <pmmap_merge+0x104>
  100bb4:	b8 01 00 00 00       	mov    $0x1,%eax
  100bb9:	eb 05                	jmp    100bc0 <pmmap_merge+0x104>
  100bbb:	b8 00 00 00 00       	mov    $0x0,%eax
  100bc0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100bc3:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  100bc7:	75 19                	jne    100be2 <pmmap_merge+0x126>
  100bc9:	68 da 27 10 00       	push   $0x1027da
  100bce:	68 eb 27 10 00       	push   $0x1027eb
  100bd3:	6a 70                	push   $0x70
  100bd5:	68 c9 27 10 00       	push   $0x1027c9
  100bda:	e8 c0 06 00 00       	call   10129f <debug_panic>
  100bdf:	83 c4 10             	add    $0x10,%esp
  100be2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100be5:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100be9:	85 c0                	test   %eax,%eax
  100beb:	74 1f                	je     100c0c <pmmap_merge+0x150>
  100bed:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bf0:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100bf4:	8b 50 10             	mov    0x10(%eax),%edx
  100bf7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bfa:	89 50 10             	mov    %edx,0x10(%eax)
  100bfd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c00:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100c04:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c07:	89 50 10             	mov    %edx,0x10(%eax)
  100c0a:	eb 1d                	jmp    100c29 <pmmap_merge+0x16d>
  100c0c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c0f:	8b 14 85 28 6e 10 00 	mov    0x106e28(,%eax,4),%edx
  100c16:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c19:	89 50 10             	mov    %edx,0x10(%eax)
  100c1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c1f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c22:	89 14 85 28 6e 10 00 	mov    %edx,0x106e28(,%eax,4)
  100c29:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c2c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c2f:	89 54 85 dc          	mov    %edx,-0x24(%ebp,%eax,4)
  100c33:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c36:	8b 40 0c             	mov    0xc(%eax),%eax
  100c39:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c3c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c40:	0f 85 2d ff ff ff    	jne    100b73 <pmmap_merge+0xb7>
  100c46:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100c49:	85 c0                	test   %eax,%eax
  100c4b:	74 0b                	je     100c58 <pmmap_merge+0x19c>
  100c4d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100c50:	8b 40 04             	mov    0x4(%eax),%eax
  100c53:	a3 38 6e 10 00       	mov    %eax,0x106e38
  100c58:	90                   	nop
  100c59:	c9                   	leave  
  100c5a:	c3                   	ret    

00100c5b <pmmap_dump>:
  100c5b:	55                   	push   %ebp
  100c5c:	89 e5                	mov    %esp,%ebp
  100c5e:	83 ec 18             	sub    $0x18,%esp
  100c61:	a1 24 6e 10 00       	mov    0x106e24,%eax
  100c66:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c69:	e9 9e 00 00 00       	jmp    100d0c <pmmap_dump+0xb1>
  100c6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c71:	8b 40 08             	mov    0x8(%eax),%eax
  100c74:	83 f8 01             	cmp    $0x1,%eax
  100c77:	74 3d                	je     100cb6 <pmmap_dump+0x5b>
  100c79:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c7c:	8b 40 08             	mov    0x8(%eax),%eax
  100c7f:	83 f8 02             	cmp    $0x2,%eax
  100c82:	74 2b                	je     100caf <pmmap_dump+0x54>
  100c84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c87:	8b 40 08             	mov    0x8(%eax),%eax
  100c8a:	83 f8 03             	cmp    $0x3,%eax
  100c8d:	74 19                	je     100ca8 <pmmap_dump+0x4d>
  100c8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c92:	8b 40 08             	mov    0x8(%eax),%eax
  100c95:	83 f8 04             	cmp    $0x4,%eax
  100c98:	75 07                	jne    100ca1 <pmmap_dump+0x46>
  100c9a:	ba 08 28 10 00       	mov    $0x102808,%edx
  100c9f:	eb 1a                	jmp    100cbb <pmmap_dump+0x60>
  100ca1:	ba 11 28 10 00       	mov    $0x102811,%edx
  100ca6:	eb 13                	jmp    100cbb <pmmap_dump+0x60>
  100ca8:	ba 19 28 10 00       	mov    $0x102819,%edx
  100cad:	eb 0c                	jmp    100cbb <pmmap_dump+0x60>
  100caf:	ba 23 28 10 00       	mov    $0x102823,%edx
  100cb4:	eb 05                	jmp    100cbb <pmmap_dump+0x60>
  100cb6:	ba 2c 28 10 00       	mov    $0x10282c,%edx
  100cbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cbe:	8b 08                	mov    (%eax),%ecx
  100cc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cc3:	8b 40 04             	mov    0x4(%eax),%eax
  100cc6:	39 c1                	cmp    %eax,%ecx
  100cc8:	75 08                	jne    100cd2 <pmmap_dump+0x77>
  100cca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ccd:	8b 40 04             	mov    0x4(%eax),%eax
  100cd0:	eb 1c                	jmp    100cee <pmmap_dump+0x93>
  100cd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd5:	8b 40 04             	mov    0x4(%eax),%eax
  100cd8:	83 f8 ff             	cmp    $0xffffffff,%eax
  100cdb:	75 08                	jne    100ce5 <pmmap_dump+0x8a>
  100cdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ce0:	8b 40 04             	mov    0x4(%eax),%eax
  100ce3:	eb 09                	jmp    100cee <pmmap_dump+0x93>
  100ce5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ce8:	8b 40 04             	mov    0x4(%eax),%eax
  100ceb:	83 e8 01             	sub    $0x1,%eax
  100cee:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100cf1:	8b 09                	mov    (%ecx),%ecx
  100cf3:	52                   	push   %edx
  100cf4:	50                   	push   %eax
  100cf5:	51                   	push   %ecx
  100cf6:	68 34 28 10 00       	push   $0x102834
  100cfb:	e8 df 04 00 00       	call   1011df <debug_info>
  100d00:	83 c4 10             	add    $0x10,%esp
  100d03:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d06:	8b 40 0c             	mov    0xc(%eax),%eax
  100d09:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d0c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d10:	0f 85 58 ff ff ff    	jne    100c6e <pmmap_dump+0x13>
  100d16:	90                   	nop
  100d17:	c9                   	leave  
  100d18:	c3                   	ret    

00100d19 <pmmap_init>:
  100d19:	55                   	push   %ebp
  100d1a:	89 e5                	mov    %esp,%ebp
  100d1c:	83 ec 28             	sub    $0x28,%esp
  100d1f:	83 ec 0c             	sub    $0xc,%esp
  100d22:	68 55 28 10 00       	push   $0x102855
  100d27:	e8 b3 04 00 00       	call   1011df <debug_info>
  100d2c:	83 c4 10             	add    $0x10,%esp
  100d2f:	8b 45 08             	mov    0x8(%ebp),%eax
  100d32:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100d35:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100d38:	8b 40 30             	mov    0x30(%eax),%eax
  100d3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d3e:	c7 05 24 6e 10 00 00 	movl   $0x0,0x106e24
  100d45:	00 00 00 
  100d48:	c7 05 28 6e 10 00 00 	movl   $0x0,0x106e28
  100d4f:	00 00 00 
  100d52:	c7 05 2c 6e 10 00 00 	movl   $0x0,0x106e2c
  100d59:	00 00 00 
  100d5c:	c7 05 30 6e 10 00 00 	movl   $0x0,0x106e30
  100d63:	00 00 00 
  100d66:	c7 05 34 6e 10 00 00 	movl   $0x0,0x106e34
  100d6d:	00 00 00 
  100d70:	eb 6c                	jmp    100dde <pmmap_init+0xc5>
  100d72:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d75:	8b 40 08             	mov    0x8(%eax),%eax
  100d78:	85 c0                	test   %eax,%eax
  100d7a:	75 58                	jne    100dd4 <pmmap_init+0xbb>
  100d7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d7f:	8b 40 04             	mov    0x4(%eax),%eax
  100d82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100d85:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d88:	8b 40 10             	mov    0x10(%eax),%eax
  100d8b:	85 c0                	test   %eax,%eax
  100d8d:	75 0f                	jne    100d9e <pmmap_init+0x85>
  100d8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d92:	8b 40 0c             	mov    0xc(%eax),%eax
  100d95:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100d98:	f7 d2                	not    %edx
  100d9a:	39 d0                	cmp    %edx,%eax
  100d9c:	72 09                	jb     100da7 <pmmap_init+0x8e>
  100d9e:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
  100da5:	eb 0e                	jmp    100db5 <pmmap_init+0x9c>
  100da7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100daa:	8b 50 0c             	mov    0xc(%eax),%edx
  100dad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100db0:	01 d0                	add    %edx,%eax
  100db2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100db5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100db8:	8b 40 14             	mov    0x14(%eax),%eax
  100dbb:	89 45 e0             	mov    %eax,-0x20(%ebp)
  100dbe:	83 ec 04             	sub    $0x4,%esp
  100dc1:	ff 75 e0             	pushl  -0x20(%ebp)
  100dc4:	ff 75 f0             	pushl  -0x10(%ebp)
  100dc7:	ff 75 e4             	pushl  -0x1c(%ebp)
  100dca:	e8 41 fc ff ff       	call   100a10 <pmmap_insert>
  100dcf:	83 c4 10             	add    $0x10,%esp
  100dd2:	eb 01                	jmp    100dd5 <pmmap_init+0xbc>
  100dd4:	90                   	nop
  100dd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dd8:	83 c0 18             	add    $0x18,%eax
  100ddb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100dde:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100de1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100de4:	8b 40 30             	mov    0x30(%eax),%eax
  100de7:	29 c2                	sub    %eax,%edx
  100de9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100dec:	8b 40 2c             	mov    0x2c(%eax),%eax
  100def:	39 c2                	cmp    %eax,%edx
  100df1:	0f 82 7b ff ff ff    	jb     100d72 <pmmap_init+0x59>
  100df7:	e8 c0 fc ff ff       	call   100abc <pmmap_merge>
  100dfc:	e8 5a fe ff ff       	call   100c5b <pmmap_dump>
  100e01:	a1 24 6e 10 00       	mov    0x106e24,%eax
  100e06:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100e09:	eb 16                	jmp    100e21 <pmmap_init+0x108>
  100e0b:	a1 40 6e 10 00       	mov    0x106e40,%eax
  100e10:	83 c0 01             	add    $0x1,%eax
  100e13:	a3 40 6e 10 00       	mov    %eax,0x106e40
  100e18:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e1b:	8b 40 0c             	mov    0xc(%eax),%eax
  100e1e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100e21:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100e25:	75 e4                	jne    100e0b <pmmap_init+0xf2>
  100e27:	a1 38 6e 10 00       	mov    0x106e38,%eax
  100e2c:	83 ec 08             	sub    $0x8,%esp
  100e2f:	68 00 10 00 00       	push   $0x1000
  100e34:	50                   	push   %eax
  100e35:	e8 e8 0f 00 00       	call   101e22 <rounddown>
  100e3a:	83 c4 10             	add    $0x10,%esp
  100e3d:	c1 e8 0c             	shr    $0xc,%eax
  100e40:	a3 3c 6e 10 00       	mov    %eax,0x106e3c
  100e45:	90                   	nop
  100e46:	c9                   	leave  
  100e47:	c3                   	ret    

00100e48 <get_size>:
  100e48:	55                   	push   %ebp
  100e49:	89 e5                	mov    %esp,%ebp
  100e4b:	a1 40 6e 10 00       	mov    0x106e40,%eax
  100e50:	5d                   	pop    %ebp
  100e51:	c3                   	ret    

00100e52 <get_mms>:
  100e52:	55                   	push   %ebp
  100e53:	89 e5                	mov    %esp,%ebp
  100e55:	83 ec 10             	sub    $0x10,%esp
  100e58:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100e5f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  100e66:	a1 24 6e 10 00       	mov    0x106e24,%eax
  100e6b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100e6e:	eb 15                	jmp    100e85 <get_mms+0x33>
  100e70:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e73:	3b 45 08             	cmp    0x8(%ebp),%eax
  100e76:	74 15                	je     100e8d <get_mms+0x3b>
  100e78:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100e7c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e7f:	8b 40 0c             	mov    0xc(%eax),%eax
  100e82:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100e85:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  100e89:	75 e5                	jne    100e70 <get_mms+0x1e>
  100e8b:	eb 01                	jmp    100e8e <get_mms+0x3c>
  100e8d:	90                   	nop
  100e8e:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  100e92:	74 0a                	je     100e9e <get_mms+0x4c>
  100e94:	a1 40 6e 10 00       	mov    0x106e40,%eax
  100e99:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  100e9c:	75 07                	jne    100ea5 <get_mms+0x53>
  100e9e:	b8 00 00 00 00       	mov    $0x0,%eax
  100ea3:	eb 05                	jmp    100eaa <get_mms+0x58>
  100ea5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100ea8:	8b 00                	mov    (%eax),%eax
  100eaa:	c9                   	leave  
  100eab:	c3                   	ret    

00100eac <get_mml>:
  100eac:	55                   	push   %ebp
  100ead:	89 e5                	mov    %esp,%ebp
  100eaf:	83 ec 10             	sub    $0x10,%esp
  100eb2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100eb9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  100ec0:	a1 24 6e 10 00       	mov    0x106e24,%eax
  100ec5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100ec8:	eb 15                	jmp    100edf <get_mml+0x33>
  100eca:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ecd:	3b 45 08             	cmp    0x8(%ebp),%eax
  100ed0:	74 15                	je     100ee7 <get_mml+0x3b>
  100ed2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100ed6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100ed9:	8b 40 0c             	mov    0xc(%eax),%eax
  100edc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100edf:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  100ee3:	75 e5                	jne    100eca <get_mml+0x1e>
  100ee5:	eb 01                	jmp    100ee8 <get_mml+0x3c>
  100ee7:	90                   	nop
  100ee8:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  100eec:	74 0a                	je     100ef8 <get_mml+0x4c>
  100eee:	a1 40 6e 10 00       	mov    0x106e40,%eax
  100ef3:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  100ef6:	75 07                	jne    100eff <get_mml+0x53>
  100ef8:	b8 00 00 00 00       	mov    $0x0,%eax
  100efd:	eb 0f                	jmp    100f0e <get_mml+0x62>
  100eff:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f02:	8b 50 04             	mov    0x4(%eax),%edx
  100f05:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f08:	8b 00                	mov    (%eax),%eax
  100f0a:	29 c2                	sub    %eax,%edx
  100f0c:	89 d0                	mov    %edx,%eax
  100f0e:	c9                   	leave  
  100f0f:	c3                   	ret    

00100f10 <is_usable>:
  100f10:	55                   	push   %ebp
  100f11:	89 e5                	mov    %esp,%ebp
  100f13:	83 ec 10             	sub    $0x10,%esp
  100f16:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100f1d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  100f24:	a1 24 6e 10 00       	mov    0x106e24,%eax
  100f29:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100f2c:	eb 15                	jmp    100f43 <is_usable+0x33>
  100f2e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f31:	3b 45 08             	cmp    0x8(%ebp),%eax
  100f34:	74 15                	je     100f4b <is_usable+0x3b>
  100f36:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100f3a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f3d:	8b 40 0c             	mov    0xc(%eax),%eax
  100f40:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100f43:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  100f47:	75 e5                	jne    100f2e <is_usable+0x1e>
  100f49:	eb 01                	jmp    100f4c <is_usable+0x3c>
  100f4b:	90                   	nop
  100f4c:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  100f50:	74 0a                	je     100f5c <is_usable+0x4c>
  100f52:	a1 40 6e 10 00       	mov    0x106e40,%eax
  100f57:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  100f5a:	75 07                	jne    100f63 <is_usable+0x53>
  100f5c:	b8 00 00 00 00       	mov    $0x0,%eax
  100f61:	eb 0f                	jmp    100f72 <is_usable+0x62>
  100f63:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f66:	8b 40 08             	mov    0x8(%eax),%eax
  100f69:	83 f8 01             	cmp    $0x1,%eax
  100f6c:	0f 94 c0             	sete   %al
  100f6f:	0f b6 c0             	movzbl %al,%eax
  100f72:	c9                   	leave  
  100f73:	c3                   	ret    

00100f74 <memset>:
  100f74:	55                   	push   %ebp
  100f75:	89 e5                	mov    %esp,%ebp
  100f77:	57                   	push   %edi
  100f78:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  100f7c:	75 05                	jne    100f83 <memset+0xf>
  100f7e:	8b 45 08             	mov    0x8(%ebp),%eax
  100f81:	eb 5c                	jmp    100fdf <memset+0x6b>
  100f83:	8b 45 08             	mov    0x8(%ebp),%eax
  100f86:	83 e0 03             	and    $0x3,%eax
  100f89:	85 c0                	test   %eax,%eax
  100f8b:	75 41                	jne    100fce <memset+0x5a>
  100f8d:	8b 45 10             	mov    0x10(%ebp),%eax
  100f90:	83 e0 03             	and    $0x3,%eax
  100f93:	85 c0                	test   %eax,%eax
  100f95:	75 37                	jne    100fce <memset+0x5a>
  100f97:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
  100f9e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fa1:	c1 e0 18             	shl    $0x18,%eax
  100fa4:	89 c2                	mov    %eax,%edx
  100fa6:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fa9:	c1 e0 10             	shl    $0x10,%eax
  100fac:	09 c2                	or     %eax,%edx
  100fae:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fb1:	c1 e0 08             	shl    $0x8,%eax
  100fb4:	09 d0                	or     %edx,%eax
  100fb6:	09 45 0c             	or     %eax,0xc(%ebp)
  100fb9:	8b 45 10             	mov    0x10(%ebp),%eax
  100fbc:	c1 e8 02             	shr    $0x2,%eax
  100fbf:	89 c1                	mov    %eax,%ecx
  100fc1:	8b 55 08             	mov    0x8(%ebp),%edx
  100fc4:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fc7:	89 d7                	mov    %edx,%edi
  100fc9:	fc                   	cld    
  100fca:	f3 ab                	rep stos %eax,%es:(%edi)
  100fcc:	eb 0e                	jmp    100fdc <memset+0x68>
  100fce:	8b 55 08             	mov    0x8(%ebp),%edx
  100fd1:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fd4:	8b 4d 10             	mov    0x10(%ebp),%ecx
  100fd7:	89 d7                	mov    %edx,%edi
  100fd9:	fc                   	cld    
  100fda:	f3 aa                	rep stos %al,%es:(%edi)
  100fdc:	8b 45 08             	mov    0x8(%ebp),%eax
  100fdf:	5f                   	pop    %edi
  100fe0:	5d                   	pop    %ebp
  100fe1:	c3                   	ret    

00100fe2 <memmove>:
  100fe2:	55                   	push   %ebp
  100fe3:	89 e5                	mov    %esp,%ebp
  100fe5:	57                   	push   %edi
  100fe6:	56                   	push   %esi
  100fe7:	53                   	push   %ebx
  100fe8:	83 ec 10             	sub    $0x10,%esp
  100feb:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fee:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100ff1:	8b 45 08             	mov    0x8(%ebp),%eax
  100ff4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100ff7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ffa:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100ffd:	73 6d                	jae    10106c <memmove+0x8a>
  100fff:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101002:	8b 45 10             	mov    0x10(%ebp),%eax
  101005:	01 d0                	add    %edx,%eax
  101007:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10100a:	76 60                	jbe    10106c <memmove+0x8a>
  10100c:	8b 45 10             	mov    0x10(%ebp),%eax
  10100f:	01 45 f0             	add    %eax,-0x10(%ebp)
  101012:	8b 45 10             	mov    0x10(%ebp),%eax
  101015:	01 45 ec             	add    %eax,-0x14(%ebp)
  101018:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10101b:	83 e0 03             	and    $0x3,%eax
  10101e:	85 c0                	test   %eax,%eax
  101020:	75 2f                	jne    101051 <memmove+0x6f>
  101022:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101025:	83 e0 03             	and    $0x3,%eax
  101028:	85 c0                	test   %eax,%eax
  10102a:	75 25                	jne    101051 <memmove+0x6f>
  10102c:	8b 45 10             	mov    0x10(%ebp),%eax
  10102f:	83 e0 03             	and    $0x3,%eax
  101032:	85 c0                	test   %eax,%eax
  101034:	75 1b                	jne    101051 <memmove+0x6f>
  101036:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101039:	83 e8 04             	sub    $0x4,%eax
  10103c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10103f:	83 ea 04             	sub    $0x4,%edx
  101042:	8b 4d 10             	mov    0x10(%ebp),%ecx
  101045:	c1 e9 02             	shr    $0x2,%ecx
  101048:	89 c7                	mov    %eax,%edi
  10104a:	89 d6                	mov    %edx,%esi
  10104c:	fd                   	std    
  10104d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10104f:	eb 18                	jmp    101069 <memmove+0x87>
  101051:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101054:	8d 50 ff             	lea    -0x1(%eax),%edx
  101057:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10105a:	8d 58 ff             	lea    -0x1(%eax),%ebx
  10105d:	8b 45 10             	mov    0x10(%ebp),%eax
  101060:	89 d7                	mov    %edx,%edi
  101062:	89 de                	mov    %ebx,%esi
  101064:	89 c1                	mov    %eax,%ecx
  101066:	fd                   	std    
  101067:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  101069:	fc                   	cld    
  10106a:	eb 45                	jmp    1010b1 <memmove+0xcf>
  10106c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10106f:	83 e0 03             	and    $0x3,%eax
  101072:	85 c0                	test   %eax,%eax
  101074:	75 2b                	jne    1010a1 <memmove+0xbf>
  101076:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101079:	83 e0 03             	and    $0x3,%eax
  10107c:	85 c0                	test   %eax,%eax
  10107e:	75 21                	jne    1010a1 <memmove+0xbf>
  101080:	8b 45 10             	mov    0x10(%ebp),%eax
  101083:	83 e0 03             	and    $0x3,%eax
  101086:	85 c0                	test   %eax,%eax
  101088:	75 17                	jne    1010a1 <memmove+0xbf>
  10108a:	8b 45 10             	mov    0x10(%ebp),%eax
  10108d:	c1 e8 02             	shr    $0x2,%eax
  101090:	89 c1                	mov    %eax,%ecx
  101092:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101095:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101098:	89 c7                	mov    %eax,%edi
  10109a:	89 d6                	mov    %edx,%esi
  10109c:	fc                   	cld    
  10109d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10109f:	eb 10                	jmp    1010b1 <memmove+0xcf>
  1010a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1010a4:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1010a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1010aa:	89 c7                	mov    %eax,%edi
  1010ac:	89 d6                	mov    %edx,%esi
  1010ae:	fc                   	cld    
  1010af:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1010b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1010b4:	83 c4 10             	add    $0x10,%esp
  1010b7:	5b                   	pop    %ebx
  1010b8:	5e                   	pop    %esi
  1010b9:	5f                   	pop    %edi
  1010ba:	5d                   	pop    %ebp
  1010bb:	c3                   	ret    

001010bc <memcpy>:
  1010bc:	55                   	push   %ebp
  1010bd:	89 e5                	mov    %esp,%ebp
  1010bf:	ff 75 10             	pushl  0x10(%ebp)
  1010c2:	ff 75 0c             	pushl  0xc(%ebp)
  1010c5:	ff 75 08             	pushl  0x8(%ebp)
  1010c8:	e8 15 ff ff ff       	call   100fe2 <memmove>
  1010cd:	83 c4 0c             	add    $0xc,%esp
  1010d0:	c9                   	leave  
  1010d1:	c3                   	ret    

001010d2 <strncmp>:
  1010d2:	55                   	push   %ebp
  1010d3:	89 e5                	mov    %esp,%ebp
  1010d5:	eb 0c                	jmp    1010e3 <strncmp+0x11>
  1010d7:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1010db:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1010df:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  1010e3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1010e7:	74 1a                	je     101103 <strncmp+0x31>
  1010e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1010ec:	0f b6 00             	movzbl (%eax),%eax
  1010ef:	84 c0                	test   %al,%al
  1010f1:	74 10                	je     101103 <strncmp+0x31>
  1010f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f6:	0f b6 10             	movzbl (%eax),%edx
  1010f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1010fc:	0f b6 00             	movzbl (%eax),%eax
  1010ff:	38 c2                	cmp    %al,%dl
  101101:	74 d4                	je     1010d7 <strncmp+0x5>
  101103:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  101107:	75 07                	jne    101110 <strncmp+0x3e>
  101109:	b8 00 00 00 00       	mov    $0x0,%eax
  10110e:	eb 16                	jmp    101126 <strncmp+0x54>
  101110:	8b 45 08             	mov    0x8(%ebp),%eax
  101113:	0f b6 00             	movzbl (%eax),%eax
  101116:	0f b6 d0             	movzbl %al,%edx
  101119:	8b 45 0c             	mov    0xc(%ebp),%eax
  10111c:	0f b6 00             	movzbl (%eax),%eax
  10111f:	0f b6 c0             	movzbl %al,%eax
  101122:	29 c2                	sub    %eax,%edx
  101124:	89 d0                	mov    %edx,%eax
  101126:	5d                   	pop    %ebp
  101127:	c3                   	ret    

00101128 <strnlen>:
  101128:	55                   	push   %ebp
  101129:	89 e5                	mov    %esp,%ebp
  10112b:	83 ec 10             	sub    $0x10,%esp
  10112e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101135:	eb 0c                	jmp    101143 <strnlen+0x1b>
  101137:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10113b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10113f:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
  101143:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  101147:	74 0a                	je     101153 <strnlen+0x2b>
  101149:	8b 45 08             	mov    0x8(%ebp),%eax
  10114c:	0f b6 00             	movzbl (%eax),%eax
  10114f:	84 c0                	test   %al,%al
  101151:	75 e4                	jne    101137 <strnlen+0xf>
  101153:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101156:	c9                   	leave  
  101157:	c3                   	ret    

00101158 <strcmp>:
  101158:	55                   	push   %ebp
  101159:	89 e5                	mov    %esp,%ebp
  10115b:	eb 08                	jmp    101165 <strcmp+0xd>
  10115d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  101161:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  101165:	8b 45 08             	mov    0x8(%ebp),%eax
  101168:	0f b6 00             	movzbl (%eax),%eax
  10116b:	84 c0                	test   %al,%al
  10116d:	74 10                	je     10117f <strcmp+0x27>
  10116f:	8b 45 08             	mov    0x8(%ebp),%eax
  101172:	0f b6 10             	movzbl (%eax),%edx
  101175:	8b 45 0c             	mov    0xc(%ebp),%eax
  101178:	0f b6 00             	movzbl (%eax),%eax
  10117b:	38 c2                	cmp    %al,%dl
  10117d:	74 de                	je     10115d <strcmp+0x5>
  10117f:	8b 45 08             	mov    0x8(%ebp),%eax
  101182:	0f b6 00             	movzbl (%eax),%eax
  101185:	0f b6 d0             	movzbl %al,%edx
  101188:	8b 45 0c             	mov    0xc(%ebp),%eax
  10118b:	0f b6 00             	movzbl (%eax),%eax
  10118e:	0f b6 c0             	movzbl %al,%eax
  101191:	29 c2                	sub    %eax,%edx
  101193:	89 d0                	mov    %edx,%eax
  101195:	5d                   	pop    %ebp
  101196:	c3                   	ret    

00101197 <strchr>:
  101197:	55                   	push   %ebp
  101198:	89 e5                	mov    %esp,%ebp
  10119a:	83 ec 04             	sub    $0x4,%esp
  10119d:	8b 45 0c             	mov    0xc(%ebp),%eax
  1011a0:	88 45 fc             	mov    %al,-0x4(%ebp)
  1011a3:	eb 14                	jmp    1011b9 <strchr+0x22>
  1011a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1011a8:	0f b6 00             	movzbl (%eax),%eax
  1011ab:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1011ae:	75 05                	jne    1011b5 <strchr+0x1e>
  1011b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1011b3:	eb 13                	jmp    1011c8 <strchr+0x31>
  1011b5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1011b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1011bc:	0f b6 00             	movzbl (%eax),%eax
  1011bf:	84 c0                	test   %al,%al
  1011c1:	75 e2                	jne    1011a5 <strchr+0xe>
  1011c3:	b8 00 00 00 00       	mov    $0x0,%eax
  1011c8:	c9                   	leave  
  1011c9:	c3                   	ret    

001011ca <memzero>:
  1011ca:	55                   	push   %ebp
  1011cb:	89 e5                	mov    %esp,%ebp
  1011cd:	ff 75 0c             	pushl  0xc(%ebp)
  1011d0:	6a 00                	push   $0x0
  1011d2:	ff 75 08             	pushl  0x8(%ebp)
  1011d5:	e8 9a fd ff ff       	call   100f74 <memset>
  1011da:	83 c4 0c             	add    $0xc,%esp
  1011dd:	c9                   	leave  
  1011de:	c3                   	ret    

001011df <debug_info>:
  1011df:	55                   	push   %ebp
  1011e0:	89 e5                	mov    %esp,%ebp
  1011e2:	83 ec 18             	sub    $0x18,%esp
  1011e5:	8d 45 0c             	lea    0xc(%ebp),%eax
  1011e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1011eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1011ee:	83 ec 08             	sub    $0x8,%esp
  1011f1:	50                   	push   %eax
  1011f2:	ff 75 08             	pushl  0x8(%ebp)
  1011f5:	e8 08 02 00 00       	call   101402 <vdprintf>
  1011fa:	83 c4 10             	add    $0x10,%esp
  1011fd:	90                   	nop
  1011fe:	c9                   	leave  
  1011ff:	c3                   	ret    

00101200 <debug_normal>:
  101200:	55                   	push   %ebp
  101201:	89 e5                	mov    %esp,%ebp
  101203:	83 ec 18             	sub    $0x18,%esp
  101206:	83 ec 04             	sub    $0x4,%esp
  101209:	ff 75 0c             	pushl  0xc(%ebp)
  10120c:	ff 75 08             	pushl  0x8(%ebp)
  10120f:	68 57 28 10 00       	push   $0x102857
  101214:	e8 4b 02 00 00       	call   101464 <dprintf>
  101219:	83 c4 10             	add    $0x10,%esp
  10121c:	8d 45 14             	lea    0x14(%ebp),%eax
  10121f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101222:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101225:	83 ec 08             	sub    $0x8,%esp
  101228:	50                   	push   %eax
  101229:	ff 75 10             	pushl  0x10(%ebp)
  10122c:	e8 d1 01 00 00       	call   101402 <vdprintf>
  101231:	83 c4 10             	add    $0x10,%esp
  101234:	90                   	nop
  101235:	c9                   	leave  
  101236:	c3                   	ret    

00101237 <debug_trace>:
  101237:	55                   	push   %ebp
  101238:	89 e5                	mov    %esp,%ebp
  10123a:	83 ec 10             	sub    $0x10,%esp
  10123d:	8b 45 08             	mov    0x8(%ebp),%eax
  101240:	89 45 f8             	mov    %eax,-0x8(%ebp)
  101243:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10124a:	eb 23                	jmp    10126f <debug_trace+0x38>
  10124c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10124f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101256:	8b 45 0c             	mov    0xc(%ebp),%eax
  101259:	01 c2                	add    %eax,%edx
  10125b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10125e:	8b 40 04             	mov    0x4(%eax),%eax
  101261:	89 02                	mov    %eax,(%edx)
  101263:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101266:	8b 00                	mov    (%eax),%eax
  101268:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10126b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10126f:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
  101273:	7f 21                	jg     101296 <debug_trace+0x5f>
  101275:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  101279:	75 d1                	jne    10124c <debug_trace+0x15>
  10127b:	eb 19                	jmp    101296 <debug_trace+0x5f>
  10127d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101280:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101287:	8b 45 0c             	mov    0xc(%ebp),%eax
  10128a:	01 d0                	add    %edx,%eax
  10128c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  101292:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101296:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
  10129a:	7e e1                	jle    10127d <debug_trace+0x46>
  10129c:	90                   	nop
  10129d:	c9                   	leave  
  10129e:	c3                   	ret    

0010129f <debug_panic>:
  10129f:	55                   	push   %ebp
  1012a0:	89 e5                	mov    %esp,%ebp
  1012a2:	83 ec 38             	sub    $0x38,%esp
  1012a5:	83 ec 04             	sub    $0x4,%esp
  1012a8:	ff 75 0c             	pushl  0xc(%ebp)
  1012ab:	ff 75 08             	pushl  0x8(%ebp)
  1012ae:	68 63 28 10 00       	push   $0x102863
  1012b3:	e8 ac 01 00 00       	call   101464 <dprintf>
  1012b8:	83 c4 10             	add    $0x10,%esp
  1012bb:	8d 45 14             	lea    0x14(%ebp),%eax
  1012be:	89 45 c8             	mov    %eax,-0x38(%ebp)
  1012c1:	8b 45 c8             	mov    -0x38(%ebp),%eax
  1012c4:	83 ec 08             	sub    $0x8,%esp
  1012c7:	50                   	push   %eax
  1012c8:	ff 75 10             	pushl  0x10(%ebp)
  1012cb:	e8 32 01 00 00       	call   101402 <vdprintf>
  1012d0:	83 c4 10             	add    $0x10,%esp
  1012d3:	e8 7b 0b 00 00       	call   101e53 <read_ebp>
  1012d8:	89 c2                	mov    %eax,%edx
  1012da:	83 ec 08             	sub    $0x8,%esp
  1012dd:	8d 45 cc             	lea    -0x34(%ebp),%eax
  1012e0:	50                   	push   %eax
  1012e1:	52                   	push   %edx
  1012e2:	e8 50 ff ff ff       	call   101237 <debug_trace>
  1012e7:	83 c4 10             	add    $0x10,%esp
  1012ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1012f1:	eb 1c                	jmp    10130f <debug_panic+0x70>
  1012f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1012f6:	8b 44 85 cc          	mov    -0x34(%ebp,%eax,4),%eax
  1012fa:	83 ec 08             	sub    $0x8,%esp
  1012fd:	50                   	push   %eax
  1012fe:	68 6f 28 10 00       	push   $0x10286f
  101303:	e8 5c 01 00 00       	call   101464 <dprintf>
  101308:	83 c4 10             	add    $0x10,%esp
  10130b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10130f:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  101313:	7f 0b                	jg     101320 <debug_panic+0x81>
  101315:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101318:	8b 44 85 cc          	mov    -0x34(%ebp,%eax,4),%eax
  10131c:	85 c0                	test   %eax,%eax
  10131e:	75 d3                	jne    1012f3 <debug_panic+0x54>
  101320:	83 ec 0c             	sub    $0xc,%esp
  101323:	68 7d 28 10 00       	push   $0x10287d
  101328:	e8 37 01 00 00       	call   101464 <dprintf>
  10132d:	83 c4 10             	add    $0x10,%esp
  101330:	e8 8f 0b 00 00       	call   101ec4 <halt>
  101335:	90                   	nop
  101336:	c9                   	leave  
  101337:	c3                   	ret    

00101338 <debug_warn>:
  101338:	55                   	push   %ebp
  101339:	89 e5                	mov    %esp,%ebp
  10133b:	83 ec 18             	sub    $0x18,%esp
  10133e:	83 ec 04             	sub    $0x4,%esp
  101341:	ff 75 0c             	pushl  0xc(%ebp)
  101344:	ff 75 08             	pushl  0x8(%ebp)
  101347:	68 8f 28 10 00       	push   $0x10288f
  10134c:	e8 13 01 00 00       	call   101464 <dprintf>
  101351:	83 c4 10             	add    $0x10,%esp
  101354:	8d 45 14             	lea    0x14(%ebp),%eax
  101357:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10135a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10135d:	83 ec 08             	sub    $0x8,%esp
  101360:	50                   	push   %eax
  101361:	ff 75 10             	pushl  0x10(%ebp)
  101364:	e8 99 00 00 00       	call   101402 <vdprintf>
  101369:	83 c4 10             	add    $0x10,%esp
  10136c:	90                   	nop
  10136d:	c9                   	leave  
  10136e:	c3                   	ret    

0010136f <cputs>:
  10136f:	55                   	push   %ebp
  101370:	89 e5                	mov    %esp,%ebp
  101372:	83 ec 08             	sub    $0x8,%esp
  101375:	eb 19                	jmp    101390 <cputs+0x21>
  101377:	8b 45 08             	mov    0x8(%ebp),%eax
  10137a:	0f b6 00             	movzbl (%eax),%eax
  10137d:	0f be c0             	movsbl %al,%eax
  101380:	83 ec 0c             	sub    $0xc,%esp
  101383:	50                   	push   %eax
  101384:	e8 a7 f0 ff ff       	call   100430 <cons_putc>
  101389:	83 c4 10             	add    $0x10,%esp
  10138c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  101390:	8b 45 08             	mov    0x8(%ebp),%eax
  101393:	0f b6 00             	movzbl (%eax),%eax
  101396:	84 c0                	test   %al,%al
  101398:	75 dd                	jne    101377 <cputs+0x8>
  10139a:	90                   	nop
  10139b:	c9                   	leave  
  10139c:	c3                   	ret    

0010139d <putch>:
  10139d:	55                   	push   %ebp
  10139e:	89 e5                	mov    %esp,%ebp
  1013a0:	83 ec 08             	sub    $0x8,%esp
  1013a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1013a6:	8b 00                	mov    (%eax),%eax
  1013a8:	8d 48 01             	lea    0x1(%eax),%ecx
  1013ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  1013ae:	89 0a                	mov    %ecx,(%edx)
  1013b0:	8b 55 08             	mov    0x8(%ebp),%edx
  1013b3:	89 d1                	mov    %edx,%ecx
  1013b5:	8b 55 0c             	mov    0xc(%ebp),%edx
  1013b8:	88 4c 02 08          	mov    %cl,0x8(%edx,%eax,1)
  1013bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1013bf:	8b 00                	mov    (%eax),%eax
  1013c1:	3d ff 01 00 00       	cmp    $0x1ff,%eax
  1013c6:	75 28                	jne    1013f0 <putch+0x53>
  1013c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1013cb:	8b 00                	mov    (%eax),%eax
  1013cd:	8b 55 0c             	mov    0xc(%ebp),%edx
  1013d0:	c6 44 02 08 00       	movb   $0x0,0x8(%edx,%eax,1)
  1013d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1013d8:	83 c0 08             	add    $0x8,%eax
  1013db:	83 ec 0c             	sub    $0xc,%esp
  1013de:	50                   	push   %eax
  1013df:	e8 8b ff ff ff       	call   10136f <cputs>
  1013e4:	83 c4 10             	add    $0x10,%esp
  1013e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1013ea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1013f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1013f3:	8b 40 04             	mov    0x4(%eax),%eax
  1013f6:	8d 50 01             	lea    0x1(%eax),%edx
  1013f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1013fc:	89 50 04             	mov    %edx,0x4(%eax)
  1013ff:	90                   	nop
  101400:	c9                   	leave  
  101401:	c3                   	ret    

00101402 <vdprintf>:
  101402:	55                   	push   %ebp
  101403:	89 e5                	mov    %esp,%ebp
  101405:	81 ec 18 02 00 00    	sub    $0x218,%esp
  10140b:	c7 85 f0 fd ff ff 00 	movl   $0x0,-0x210(%ebp)
  101412:	00 00 00 
  101415:	c7 85 f4 fd ff ff 00 	movl   $0x0,-0x20c(%ebp)
  10141c:	00 00 00 
  10141f:	ff 75 0c             	pushl  0xc(%ebp)
  101422:	ff 75 08             	pushl  0x8(%ebp)
  101425:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  10142b:	50                   	push   %eax
  10142c:	68 9d 13 10 00       	push   $0x10139d
  101431:	e8 a3 01 00 00       	call   1015d9 <vprintfmt>
  101436:	83 c4 10             	add    $0x10,%esp
  101439:	8b 85 f0 fd ff ff    	mov    -0x210(%ebp),%eax
  10143f:	c6 84 05 f8 fd ff ff 	movb   $0x0,-0x208(%ebp,%eax,1)
  101446:	00 
  101447:	83 ec 0c             	sub    $0xc,%esp
  10144a:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  101450:	83 c0 08             	add    $0x8,%eax
  101453:	50                   	push   %eax
  101454:	e8 16 ff ff ff       	call   10136f <cputs>
  101459:	83 c4 10             	add    $0x10,%esp
  10145c:	8b 85 f4 fd ff ff    	mov    -0x20c(%ebp),%eax
  101462:	c9                   	leave  
  101463:	c3                   	ret    

00101464 <dprintf>:
  101464:	55                   	push   %ebp
  101465:	89 e5                	mov    %esp,%ebp
  101467:	83 ec 18             	sub    $0x18,%esp
  10146a:	8d 45 0c             	lea    0xc(%ebp),%eax
  10146d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101470:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101473:	83 ec 08             	sub    $0x8,%esp
  101476:	50                   	push   %eax
  101477:	ff 75 08             	pushl  0x8(%ebp)
  10147a:	e8 83 ff ff ff       	call   101402 <vdprintf>
  10147f:	83 c4 10             	add    $0x10,%esp
  101482:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101485:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101488:	c9                   	leave  
  101489:	c3                   	ret    

0010148a <printnum>:
  10148a:	55                   	push   %ebp
  10148b:	89 e5                	mov    %esp,%ebp
  10148d:	53                   	push   %ebx
  10148e:	83 ec 14             	sub    $0x14,%esp
  101491:	8b 45 10             	mov    0x10(%ebp),%eax
  101494:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101497:	8b 45 14             	mov    0x14(%ebp),%eax
  10149a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10149d:	8b 45 18             	mov    0x18(%ebp),%eax
  1014a0:	ba 00 00 00 00       	mov    $0x0,%edx
  1014a5:	3b 55 f4             	cmp    -0xc(%ebp),%edx
  1014a8:	77 55                	ja     1014ff <printnum+0x75>
  1014aa:	3b 55 f4             	cmp    -0xc(%ebp),%edx
  1014ad:	72 05                	jb     1014b4 <printnum+0x2a>
  1014af:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  1014b2:	77 4b                	ja     1014ff <printnum+0x75>
  1014b4:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1014b7:	8d 58 ff             	lea    -0x1(%eax),%ebx
  1014ba:	8b 45 18             	mov    0x18(%ebp),%eax
  1014bd:	ba 00 00 00 00       	mov    $0x0,%edx
  1014c2:	52                   	push   %edx
  1014c3:	50                   	push   %eax
  1014c4:	ff 75 f4             	pushl  -0xc(%ebp)
  1014c7:	ff 75 f0             	pushl  -0x10(%ebp)
  1014ca:	e8 01 10 00 00       	call   1024d0 <__udivdi3>
  1014cf:	83 c4 10             	add    $0x10,%esp
  1014d2:	83 ec 04             	sub    $0x4,%esp
  1014d5:	ff 75 20             	pushl  0x20(%ebp)
  1014d8:	53                   	push   %ebx
  1014d9:	ff 75 18             	pushl  0x18(%ebp)
  1014dc:	52                   	push   %edx
  1014dd:	50                   	push   %eax
  1014de:	ff 75 0c             	pushl  0xc(%ebp)
  1014e1:	ff 75 08             	pushl  0x8(%ebp)
  1014e4:	e8 a1 ff ff ff       	call   10148a <printnum>
  1014e9:	83 c4 20             	add    $0x20,%esp
  1014ec:	eb 1b                	jmp    101509 <printnum+0x7f>
  1014ee:	83 ec 08             	sub    $0x8,%esp
  1014f1:	ff 75 0c             	pushl  0xc(%ebp)
  1014f4:	ff 75 20             	pushl  0x20(%ebp)
  1014f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1014fa:	ff d0                	call   *%eax
  1014fc:	83 c4 10             	add    $0x10,%esp
  1014ff:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  101503:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  101507:	7f e5                	jg     1014ee <printnum+0x64>
  101509:	8b 4d 18             	mov    0x18(%ebp),%ecx
  10150c:	bb 00 00 00 00       	mov    $0x0,%ebx
  101511:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101514:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101517:	53                   	push   %ebx
  101518:	51                   	push   %ecx
  101519:	52                   	push   %edx
  10151a:	50                   	push   %eax
  10151b:	e8 e0 10 00 00       	call   102600 <__umoddi3>
  101520:	83 c4 10             	add    $0x10,%esp
  101523:	05 9c 28 10 00       	add    $0x10289c,%eax
  101528:	0f b6 00             	movzbl (%eax),%eax
  10152b:	0f be c0             	movsbl %al,%eax
  10152e:	83 ec 08             	sub    $0x8,%esp
  101531:	ff 75 0c             	pushl  0xc(%ebp)
  101534:	50                   	push   %eax
  101535:	8b 45 08             	mov    0x8(%ebp),%eax
  101538:	ff d0                	call   *%eax
  10153a:	83 c4 10             	add    $0x10,%esp
  10153d:	90                   	nop
  10153e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101541:	c9                   	leave  
  101542:	c3                   	ret    

00101543 <getuint>:
  101543:	55                   	push   %ebp
  101544:	89 e5                	mov    %esp,%ebp
  101546:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10154a:	7e 14                	jle    101560 <getuint+0x1d>
  10154c:	8b 45 08             	mov    0x8(%ebp),%eax
  10154f:	8b 00                	mov    (%eax),%eax
  101551:	8d 48 08             	lea    0x8(%eax),%ecx
  101554:	8b 55 08             	mov    0x8(%ebp),%edx
  101557:	89 0a                	mov    %ecx,(%edx)
  101559:	8b 50 04             	mov    0x4(%eax),%edx
  10155c:	8b 00                	mov    (%eax),%eax
  10155e:	eb 30                	jmp    101590 <getuint+0x4d>
  101560:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  101564:	74 16                	je     10157c <getuint+0x39>
  101566:	8b 45 08             	mov    0x8(%ebp),%eax
  101569:	8b 00                	mov    (%eax),%eax
  10156b:	8d 48 04             	lea    0x4(%eax),%ecx
  10156e:	8b 55 08             	mov    0x8(%ebp),%edx
  101571:	89 0a                	mov    %ecx,(%edx)
  101573:	8b 00                	mov    (%eax),%eax
  101575:	ba 00 00 00 00       	mov    $0x0,%edx
  10157a:	eb 14                	jmp    101590 <getuint+0x4d>
  10157c:	8b 45 08             	mov    0x8(%ebp),%eax
  10157f:	8b 00                	mov    (%eax),%eax
  101581:	8d 48 04             	lea    0x4(%eax),%ecx
  101584:	8b 55 08             	mov    0x8(%ebp),%edx
  101587:	89 0a                	mov    %ecx,(%edx)
  101589:	8b 00                	mov    (%eax),%eax
  10158b:	ba 00 00 00 00       	mov    $0x0,%edx
  101590:	5d                   	pop    %ebp
  101591:	c3                   	ret    

00101592 <getint>:
  101592:	55                   	push   %ebp
  101593:	89 e5                	mov    %esp,%ebp
  101595:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  101599:	7e 14                	jle    1015af <getint+0x1d>
  10159b:	8b 45 08             	mov    0x8(%ebp),%eax
  10159e:	8b 00                	mov    (%eax),%eax
  1015a0:	8d 48 08             	lea    0x8(%eax),%ecx
  1015a3:	8b 55 08             	mov    0x8(%ebp),%edx
  1015a6:	89 0a                	mov    %ecx,(%edx)
  1015a8:	8b 50 04             	mov    0x4(%eax),%edx
  1015ab:	8b 00                	mov    (%eax),%eax
  1015ad:	eb 28                	jmp    1015d7 <getint+0x45>
  1015af:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1015b3:	74 12                	je     1015c7 <getint+0x35>
  1015b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1015b8:	8b 00                	mov    (%eax),%eax
  1015ba:	8d 48 04             	lea    0x4(%eax),%ecx
  1015bd:	8b 55 08             	mov    0x8(%ebp),%edx
  1015c0:	89 0a                	mov    %ecx,(%edx)
  1015c2:	8b 00                	mov    (%eax),%eax
  1015c4:	99                   	cltd   
  1015c5:	eb 10                	jmp    1015d7 <getint+0x45>
  1015c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1015ca:	8b 00                	mov    (%eax),%eax
  1015cc:	8d 48 04             	lea    0x4(%eax),%ecx
  1015cf:	8b 55 08             	mov    0x8(%ebp),%edx
  1015d2:	89 0a                	mov    %ecx,(%edx)
  1015d4:	8b 00                	mov    (%eax),%eax
  1015d6:	99                   	cltd   
  1015d7:	5d                   	pop    %ebp
  1015d8:	c3                   	ret    

001015d9 <vprintfmt>:
  1015d9:	55                   	push   %ebp
  1015da:	89 e5                	mov    %esp,%ebp
  1015dc:	56                   	push   %esi
  1015dd:	53                   	push   %ebx
  1015de:	83 ec 20             	sub    $0x20,%esp
  1015e1:	eb 17                	jmp    1015fa <vprintfmt+0x21>
  1015e3:	85 db                	test   %ebx,%ebx
  1015e5:	0f 84 12 03 00 00    	je     1018fd <vprintfmt+0x324>
  1015eb:	83 ec 08             	sub    $0x8,%esp
  1015ee:	ff 75 0c             	pushl  0xc(%ebp)
  1015f1:	53                   	push   %ebx
  1015f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1015f5:	ff d0                	call   *%eax
  1015f7:	83 c4 10             	add    $0x10,%esp
  1015fa:	8b 45 10             	mov    0x10(%ebp),%eax
  1015fd:	8d 50 01             	lea    0x1(%eax),%edx
  101600:	89 55 10             	mov    %edx,0x10(%ebp)
  101603:	0f b6 00             	movzbl (%eax),%eax
  101606:	0f b6 d8             	movzbl %al,%ebx
  101609:	83 fb 25             	cmp    $0x25,%ebx
  10160c:	75 d5                	jne    1015e3 <vprintfmt+0xa>
  10160e:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
  101612:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  101619:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  101620:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  101627:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  10162e:	8b 45 10             	mov    0x10(%ebp),%eax
  101631:	8d 50 01             	lea    0x1(%eax),%edx
  101634:	89 55 10             	mov    %edx,0x10(%ebp)
  101637:	0f b6 00             	movzbl (%eax),%eax
  10163a:	0f b6 d8             	movzbl %al,%ebx
  10163d:	8d 43 dd             	lea    -0x23(%ebx),%eax
  101640:	83 f8 55             	cmp    $0x55,%eax
  101643:	0f 87 87 02 00 00    	ja     1018d0 <vprintfmt+0x2f7>
  101649:	8b 04 85 b4 28 10 00 	mov    0x1028b4(,%eax,4),%eax
  101650:	ff e0                	jmp    *%eax
  101652:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
  101656:	eb d6                	jmp    10162e <vprintfmt+0x55>
  101658:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
  10165c:	eb d0                	jmp    10162e <vprintfmt+0x55>
  10165e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  101665:	8b 55 e0             	mov    -0x20(%ebp),%edx
  101668:	89 d0                	mov    %edx,%eax
  10166a:	c1 e0 02             	shl    $0x2,%eax
  10166d:	01 d0                	add    %edx,%eax
  10166f:	01 c0                	add    %eax,%eax
  101671:	01 d8                	add    %ebx,%eax
  101673:	83 e8 30             	sub    $0x30,%eax
  101676:	89 45 e0             	mov    %eax,-0x20(%ebp)
  101679:	8b 45 10             	mov    0x10(%ebp),%eax
  10167c:	0f b6 00             	movzbl (%eax),%eax
  10167f:	0f be d8             	movsbl %al,%ebx
  101682:	83 fb 2f             	cmp    $0x2f,%ebx
  101685:	7e 39                	jle    1016c0 <vprintfmt+0xe7>
  101687:	83 fb 39             	cmp    $0x39,%ebx
  10168a:	7f 34                	jg     1016c0 <vprintfmt+0xe7>
  10168c:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  101690:	eb d3                	jmp    101665 <vprintfmt+0x8c>
  101692:	8b 45 14             	mov    0x14(%ebp),%eax
  101695:	8d 50 04             	lea    0x4(%eax),%edx
  101698:	89 55 14             	mov    %edx,0x14(%ebp)
  10169b:	8b 00                	mov    (%eax),%eax
  10169d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1016a0:	eb 1f                	jmp    1016c1 <vprintfmt+0xe8>
  1016a2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1016a6:	79 86                	jns    10162e <vprintfmt+0x55>
  1016a8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1016af:	e9 7a ff ff ff       	jmp    10162e <vprintfmt+0x55>
  1016b4:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
  1016bb:	e9 6e ff ff ff       	jmp    10162e <vprintfmt+0x55>
  1016c0:	90                   	nop
  1016c1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1016c5:	0f 89 63 ff ff ff    	jns    10162e <vprintfmt+0x55>
  1016cb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1016ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1016d1:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  1016d8:	e9 51 ff ff ff       	jmp    10162e <vprintfmt+0x55>
  1016dd:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  1016e1:	e9 48 ff ff ff       	jmp    10162e <vprintfmt+0x55>
  1016e6:	8b 45 14             	mov    0x14(%ebp),%eax
  1016e9:	8d 50 04             	lea    0x4(%eax),%edx
  1016ec:	89 55 14             	mov    %edx,0x14(%ebp)
  1016ef:	8b 00                	mov    (%eax),%eax
  1016f1:	83 ec 08             	sub    $0x8,%esp
  1016f4:	ff 75 0c             	pushl  0xc(%ebp)
  1016f7:	50                   	push   %eax
  1016f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1016fb:	ff d0                	call   *%eax
  1016fd:	83 c4 10             	add    $0x10,%esp
  101700:	e9 f3 01 00 00       	jmp    1018f8 <vprintfmt+0x31f>
  101705:	8b 45 14             	mov    0x14(%ebp),%eax
  101708:	8d 50 04             	lea    0x4(%eax),%edx
  10170b:	89 55 14             	mov    %edx,0x14(%ebp)
  10170e:	8b 30                	mov    (%eax),%esi
  101710:	85 f6                	test   %esi,%esi
  101712:	75 05                	jne    101719 <vprintfmt+0x140>
  101714:	be ad 28 10 00       	mov    $0x1028ad,%esi
  101719:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10171d:	7e 6f                	jle    10178e <vprintfmt+0x1b5>
  10171f:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  101723:	74 69                	je     10178e <vprintfmt+0x1b5>
  101725:	8b 45 e0             	mov    -0x20(%ebp),%eax
  101728:	83 ec 08             	sub    $0x8,%esp
  10172b:	50                   	push   %eax
  10172c:	56                   	push   %esi
  10172d:	e8 f6 f9 ff ff       	call   101128 <strnlen>
  101732:	83 c4 10             	add    $0x10,%esp
  101735:	29 45 e4             	sub    %eax,-0x1c(%ebp)
  101738:	eb 17                	jmp    101751 <vprintfmt+0x178>
  10173a:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  10173e:	83 ec 08             	sub    $0x8,%esp
  101741:	ff 75 0c             	pushl  0xc(%ebp)
  101744:	50                   	push   %eax
  101745:	8b 45 08             	mov    0x8(%ebp),%eax
  101748:	ff d0                	call   *%eax
  10174a:	83 c4 10             	add    $0x10,%esp
  10174d:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  101751:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  101755:	7f e3                	jg     10173a <vprintfmt+0x161>
  101757:	eb 35                	jmp    10178e <vprintfmt+0x1b5>
  101759:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  10175d:	74 1c                	je     10177b <vprintfmt+0x1a2>
  10175f:	83 fb 1f             	cmp    $0x1f,%ebx
  101762:	7e 05                	jle    101769 <vprintfmt+0x190>
  101764:	83 fb 7e             	cmp    $0x7e,%ebx
  101767:	7e 12                	jle    10177b <vprintfmt+0x1a2>
  101769:	83 ec 08             	sub    $0x8,%esp
  10176c:	ff 75 0c             	pushl  0xc(%ebp)
  10176f:	6a 3f                	push   $0x3f
  101771:	8b 45 08             	mov    0x8(%ebp),%eax
  101774:	ff d0                	call   *%eax
  101776:	83 c4 10             	add    $0x10,%esp
  101779:	eb 0f                	jmp    10178a <vprintfmt+0x1b1>
  10177b:	83 ec 08             	sub    $0x8,%esp
  10177e:	ff 75 0c             	pushl  0xc(%ebp)
  101781:	53                   	push   %ebx
  101782:	8b 45 08             	mov    0x8(%ebp),%eax
  101785:	ff d0                	call   *%eax
  101787:	83 c4 10             	add    $0x10,%esp
  10178a:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  10178e:	89 f0                	mov    %esi,%eax
  101790:	8d 70 01             	lea    0x1(%eax),%esi
  101793:	0f b6 00             	movzbl (%eax),%eax
  101796:	0f be d8             	movsbl %al,%ebx
  101799:	85 db                	test   %ebx,%ebx
  10179b:	74 26                	je     1017c3 <vprintfmt+0x1ea>
  10179d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  1017a1:	78 b6                	js     101759 <vprintfmt+0x180>
  1017a3:	83 6d e0 01          	subl   $0x1,-0x20(%ebp)
  1017a7:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  1017ab:	79 ac                	jns    101759 <vprintfmt+0x180>
  1017ad:	eb 14                	jmp    1017c3 <vprintfmt+0x1ea>
  1017af:	83 ec 08             	sub    $0x8,%esp
  1017b2:	ff 75 0c             	pushl  0xc(%ebp)
  1017b5:	6a 20                	push   $0x20
  1017b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1017ba:	ff d0                	call   *%eax
  1017bc:	83 c4 10             	add    $0x10,%esp
  1017bf:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  1017c3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1017c7:	7f e6                	jg     1017af <vprintfmt+0x1d6>
  1017c9:	e9 2a 01 00 00       	jmp    1018f8 <vprintfmt+0x31f>
  1017ce:	83 ec 08             	sub    $0x8,%esp
  1017d1:	ff 75 e8             	pushl  -0x18(%ebp)
  1017d4:	8d 45 14             	lea    0x14(%ebp),%eax
  1017d7:	50                   	push   %eax
  1017d8:	e8 b5 fd ff ff       	call   101592 <getint>
  1017dd:	83 c4 10             	add    $0x10,%esp
  1017e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1017e3:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1017e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1017e9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1017ec:	85 d2                	test   %edx,%edx
  1017ee:	79 23                	jns    101813 <vprintfmt+0x23a>
  1017f0:	83 ec 08             	sub    $0x8,%esp
  1017f3:	ff 75 0c             	pushl  0xc(%ebp)
  1017f6:	6a 2d                	push   $0x2d
  1017f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1017fb:	ff d0                	call   *%eax
  1017fd:	83 c4 10             	add    $0x10,%esp
  101800:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101803:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101806:	f7 d8                	neg    %eax
  101808:	83 d2 00             	adc    $0x0,%edx
  10180b:	f7 da                	neg    %edx
  10180d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101810:	89 55 f4             	mov    %edx,-0xc(%ebp)
  101813:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
  10181a:	eb 7e                	jmp    10189a <vprintfmt+0x2c1>
  10181c:	83 ec 08             	sub    $0x8,%esp
  10181f:	ff 75 e8             	pushl  -0x18(%ebp)
  101822:	8d 45 14             	lea    0x14(%ebp),%eax
  101825:	50                   	push   %eax
  101826:	e8 18 fd ff ff       	call   101543 <getuint>
  10182b:	83 c4 10             	add    $0x10,%esp
  10182e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101831:	89 55 f4             	mov    %edx,-0xc(%ebp)
  101834:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
  10183b:	eb 5d                	jmp    10189a <vprintfmt+0x2c1>
  10183d:	83 ec 08             	sub    $0x8,%esp
  101840:	ff 75 0c             	pushl  0xc(%ebp)
  101843:	6a 30                	push   $0x30
  101845:	8b 45 08             	mov    0x8(%ebp),%eax
  101848:	ff d0                	call   *%eax
  10184a:	83 c4 10             	add    $0x10,%esp
  10184d:	83 ec 08             	sub    $0x8,%esp
  101850:	ff 75 0c             	pushl  0xc(%ebp)
  101853:	6a 78                	push   $0x78
  101855:	8b 45 08             	mov    0x8(%ebp),%eax
  101858:	ff d0                	call   *%eax
  10185a:	83 c4 10             	add    $0x10,%esp
  10185d:	8b 45 14             	mov    0x14(%ebp),%eax
  101860:	8d 50 04             	lea    0x4(%eax),%edx
  101863:	89 55 14             	mov    %edx,0x14(%ebp)
  101866:	8b 00                	mov    (%eax),%eax
  101868:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10186b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101872:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
  101879:	eb 1f                	jmp    10189a <vprintfmt+0x2c1>
  10187b:	83 ec 08             	sub    $0x8,%esp
  10187e:	ff 75 e8             	pushl  -0x18(%ebp)
  101881:	8d 45 14             	lea    0x14(%ebp),%eax
  101884:	50                   	push   %eax
  101885:	e8 b9 fc ff ff       	call   101543 <getuint>
  10188a:	83 c4 10             	add    $0x10,%esp
  10188d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101890:	89 55 f4             	mov    %edx,-0xc(%ebp)
  101893:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
  10189a:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  10189e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1018a1:	83 ec 04             	sub    $0x4,%esp
  1018a4:	52                   	push   %edx
  1018a5:	ff 75 e4             	pushl  -0x1c(%ebp)
  1018a8:	50                   	push   %eax
  1018a9:	ff 75 f4             	pushl  -0xc(%ebp)
  1018ac:	ff 75 f0             	pushl  -0x10(%ebp)
  1018af:	ff 75 0c             	pushl  0xc(%ebp)
  1018b2:	ff 75 08             	pushl  0x8(%ebp)
  1018b5:	e8 d0 fb ff ff       	call   10148a <printnum>
  1018ba:	83 c4 20             	add    $0x20,%esp
  1018bd:	eb 39                	jmp    1018f8 <vprintfmt+0x31f>
  1018bf:	83 ec 08             	sub    $0x8,%esp
  1018c2:	ff 75 0c             	pushl  0xc(%ebp)
  1018c5:	53                   	push   %ebx
  1018c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1018c9:	ff d0                	call   *%eax
  1018cb:	83 c4 10             	add    $0x10,%esp
  1018ce:	eb 28                	jmp    1018f8 <vprintfmt+0x31f>
  1018d0:	83 ec 08             	sub    $0x8,%esp
  1018d3:	ff 75 0c             	pushl  0xc(%ebp)
  1018d6:	6a 25                	push   $0x25
  1018d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1018db:	ff d0                	call   *%eax
  1018dd:	83 c4 10             	add    $0x10,%esp
  1018e0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1018e4:	eb 04                	jmp    1018ea <vprintfmt+0x311>
  1018e6:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1018ea:	8b 45 10             	mov    0x10(%ebp),%eax
  1018ed:	83 e8 01             	sub    $0x1,%eax
  1018f0:	0f b6 00             	movzbl (%eax),%eax
  1018f3:	3c 25                	cmp    $0x25,%al
  1018f5:	75 ef                	jne    1018e6 <vprintfmt+0x30d>
  1018f7:	90                   	nop
  1018f8:	e9 fd fc ff ff       	jmp    1015fa <vprintfmt+0x21>
  1018fd:	90                   	nop
  1018fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
  101901:	5b                   	pop    %ebx
  101902:	5e                   	pop    %esi
  101903:	5d                   	pop    %ebp
  101904:	c3                   	ret    

00101905 <seg_init>:
  101905:	55                   	push   %ebp
  101906:	89 e5                	mov    %esp,%ebp
  101908:	83 ec 18             	sub    $0x18,%esp
  10190b:	ba 00 80 10 00       	mov    $0x108000,%edx
  101910:	b8 28 55 10 00       	mov    $0x105528,%eax
  101915:	29 c2                	sub    %eax,%edx
  101917:	89 d0                	mov    %edx,%eax
  101919:	83 ec 08             	sub    $0x8,%esp
  10191c:	50                   	push   %eax
  10191d:	68 28 55 10 00       	push   $0x105528
  101922:	e8 a3 f8 ff ff       	call   1011ca <memzero>
  101927:	83 c4 10             	add    $0x10,%esp
  10192a:	b8 40 cb 14 00       	mov    $0x14cb40,%eax
  10192f:	2d 00 10 00 00       	sub    $0x1000,%eax
  101934:	ba 00 80 10 00       	mov    $0x108000,%edx
  101939:	29 d0                	sub    %edx,%eax
  10193b:	89 c2                	mov    %eax,%edx
  10193d:	b8 00 90 10 00       	mov    $0x109000,%eax
  101942:	83 ec 08             	sub    $0x8,%esp
  101945:	52                   	push   %edx
  101946:	50                   	push   %eax
  101947:	e8 7e f8 ff ff       	call   1011ca <memzero>
  10194c:	83 c4 10             	add    $0x10,%esp
  10194f:	c7 05 00 90 14 00 00 	movl   $0x0,0x149000
  101956:	00 00 00 
  101959:	c7 05 04 90 14 00 00 	movl   $0x0,0x149004
  101960:	00 00 00 
  101963:	66 c7 05 08 90 14 00 	movw   $0xffff,0x149008
  10196a:	ff ff 
  10196c:	66 c7 05 0a 90 14 00 	movw   $0x0,0x14900a
  101973:	00 00 
  101975:	c6 05 0c 90 14 00 00 	movb   $0x0,0x14900c
  10197c:	0f b6 05 0d 90 14 00 	movzbl 0x14900d,%eax
  101983:	83 e0 f0             	and    $0xfffffff0,%eax
  101986:	83 c8 0a             	or     $0xa,%eax
  101989:	a2 0d 90 14 00       	mov    %al,0x14900d
  10198e:	0f b6 05 0d 90 14 00 	movzbl 0x14900d,%eax
  101995:	83 c8 10             	or     $0x10,%eax
  101998:	a2 0d 90 14 00       	mov    %al,0x14900d
  10199d:	0f b6 05 0d 90 14 00 	movzbl 0x14900d,%eax
  1019a4:	83 e0 9f             	and    $0xffffff9f,%eax
  1019a7:	a2 0d 90 14 00       	mov    %al,0x14900d
  1019ac:	0f b6 05 0d 90 14 00 	movzbl 0x14900d,%eax
  1019b3:	83 c8 80             	or     $0xffffff80,%eax
  1019b6:	a2 0d 90 14 00       	mov    %al,0x14900d
  1019bb:	0f b6 05 0e 90 14 00 	movzbl 0x14900e,%eax
  1019c2:	83 c8 0f             	or     $0xf,%eax
  1019c5:	a2 0e 90 14 00       	mov    %al,0x14900e
  1019ca:	0f b6 05 0e 90 14 00 	movzbl 0x14900e,%eax
  1019d1:	83 e0 ef             	and    $0xffffffef,%eax
  1019d4:	a2 0e 90 14 00       	mov    %al,0x14900e
  1019d9:	0f b6 05 0e 90 14 00 	movzbl 0x14900e,%eax
  1019e0:	83 e0 df             	and    $0xffffffdf,%eax
  1019e3:	a2 0e 90 14 00       	mov    %al,0x14900e
  1019e8:	0f b6 05 0e 90 14 00 	movzbl 0x14900e,%eax
  1019ef:	83 c8 40             	or     $0x40,%eax
  1019f2:	a2 0e 90 14 00       	mov    %al,0x14900e
  1019f7:	0f b6 05 0e 90 14 00 	movzbl 0x14900e,%eax
  1019fe:	83 c8 80             	or     $0xffffff80,%eax
  101a01:	a2 0e 90 14 00       	mov    %al,0x14900e
  101a06:	c6 05 0f 90 14 00 00 	movb   $0x0,0x14900f
  101a0d:	66 c7 05 10 90 14 00 	movw   $0xffff,0x149010
  101a14:	ff ff 
  101a16:	66 c7 05 12 90 14 00 	movw   $0x0,0x149012
  101a1d:	00 00 
  101a1f:	c6 05 14 90 14 00 00 	movb   $0x0,0x149014
  101a26:	0f b6 05 15 90 14 00 	movzbl 0x149015,%eax
  101a2d:	83 e0 f0             	and    $0xfffffff0,%eax
  101a30:	83 c8 02             	or     $0x2,%eax
  101a33:	a2 15 90 14 00       	mov    %al,0x149015
  101a38:	0f b6 05 15 90 14 00 	movzbl 0x149015,%eax
  101a3f:	83 c8 10             	or     $0x10,%eax
  101a42:	a2 15 90 14 00       	mov    %al,0x149015
  101a47:	0f b6 05 15 90 14 00 	movzbl 0x149015,%eax
  101a4e:	83 e0 9f             	and    $0xffffff9f,%eax
  101a51:	a2 15 90 14 00       	mov    %al,0x149015
  101a56:	0f b6 05 15 90 14 00 	movzbl 0x149015,%eax
  101a5d:	83 c8 80             	or     $0xffffff80,%eax
  101a60:	a2 15 90 14 00       	mov    %al,0x149015
  101a65:	0f b6 05 16 90 14 00 	movzbl 0x149016,%eax
  101a6c:	83 c8 0f             	or     $0xf,%eax
  101a6f:	a2 16 90 14 00       	mov    %al,0x149016
  101a74:	0f b6 05 16 90 14 00 	movzbl 0x149016,%eax
  101a7b:	83 e0 ef             	and    $0xffffffef,%eax
  101a7e:	a2 16 90 14 00       	mov    %al,0x149016
  101a83:	0f b6 05 16 90 14 00 	movzbl 0x149016,%eax
  101a8a:	83 e0 df             	and    $0xffffffdf,%eax
  101a8d:	a2 16 90 14 00       	mov    %al,0x149016
  101a92:	0f b6 05 16 90 14 00 	movzbl 0x149016,%eax
  101a99:	83 c8 40             	or     $0x40,%eax
  101a9c:	a2 16 90 14 00       	mov    %al,0x149016
  101aa1:	0f b6 05 16 90 14 00 	movzbl 0x149016,%eax
  101aa8:	83 c8 80             	or     $0xffffff80,%eax
  101aab:	a2 16 90 14 00       	mov    %al,0x149016
  101ab0:	c6 05 17 90 14 00 00 	movb   $0x0,0x149017
  101ab7:	66 c7 05 18 90 14 00 	movw   $0xffff,0x149018
  101abe:	ff ff 
  101ac0:	66 c7 05 1a 90 14 00 	movw   $0x0,0x14901a
  101ac7:	00 00 
  101ac9:	c6 05 1c 90 14 00 00 	movb   $0x0,0x14901c
  101ad0:	0f b6 05 1d 90 14 00 	movzbl 0x14901d,%eax
  101ad7:	83 e0 f0             	and    $0xfffffff0,%eax
  101ada:	83 c8 0a             	or     $0xa,%eax
  101add:	a2 1d 90 14 00       	mov    %al,0x14901d
  101ae2:	0f b6 05 1d 90 14 00 	movzbl 0x14901d,%eax
  101ae9:	83 c8 10             	or     $0x10,%eax
  101aec:	a2 1d 90 14 00       	mov    %al,0x14901d
  101af1:	0f b6 05 1d 90 14 00 	movzbl 0x14901d,%eax
  101af8:	83 c8 60             	or     $0x60,%eax
  101afb:	a2 1d 90 14 00       	mov    %al,0x14901d
  101b00:	0f b6 05 1d 90 14 00 	movzbl 0x14901d,%eax
  101b07:	83 c8 80             	or     $0xffffff80,%eax
  101b0a:	a2 1d 90 14 00       	mov    %al,0x14901d
  101b0f:	0f b6 05 1e 90 14 00 	movzbl 0x14901e,%eax
  101b16:	83 c8 0f             	or     $0xf,%eax
  101b19:	a2 1e 90 14 00       	mov    %al,0x14901e
  101b1e:	0f b6 05 1e 90 14 00 	movzbl 0x14901e,%eax
  101b25:	83 e0 ef             	and    $0xffffffef,%eax
  101b28:	a2 1e 90 14 00       	mov    %al,0x14901e
  101b2d:	0f b6 05 1e 90 14 00 	movzbl 0x14901e,%eax
  101b34:	83 e0 df             	and    $0xffffffdf,%eax
  101b37:	a2 1e 90 14 00       	mov    %al,0x14901e
  101b3c:	0f b6 05 1e 90 14 00 	movzbl 0x14901e,%eax
  101b43:	83 c8 40             	or     $0x40,%eax
  101b46:	a2 1e 90 14 00       	mov    %al,0x14901e
  101b4b:	0f b6 05 1e 90 14 00 	movzbl 0x14901e,%eax
  101b52:	83 c8 80             	or     $0xffffff80,%eax
  101b55:	a2 1e 90 14 00       	mov    %al,0x14901e
  101b5a:	c6 05 1f 90 14 00 00 	movb   $0x0,0x14901f
  101b61:	66 c7 05 20 90 14 00 	movw   $0xffff,0x149020
  101b68:	ff ff 
  101b6a:	66 c7 05 22 90 14 00 	movw   $0x0,0x149022
  101b71:	00 00 
  101b73:	c6 05 24 90 14 00 00 	movb   $0x0,0x149024
  101b7a:	0f b6 05 25 90 14 00 	movzbl 0x149025,%eax
  101b81:	83 e0 f0             	and    $0xfffffff0,%eax
  101b84:	83 c8 02             	or     $0x2,%eax
  101b87:	a2 25 90 14 00       	mov    %al,0x149025
  101b8c:	0f b6 05 25 90 14 00 	movzbl 0x149025,%eax
  101b93:	83 c8 10             	or     $0x10,%eax
  101b96:	a2 25 90 14 00       	mov    %al,0x149025
  101b9b:	0f b6 05 25 90 14 00 	movzbl 0x149025,%eax
  101ba2:	83 c8 60             	or     $0x60,%eax
  101ba5:	a2 25 90 14 00       	mov    %al,0x149025
  101baa:	0f b6 05 25 90 14 00 	movzbl 0x149025,%eax
  101bb1:	83 c8 80             	or     $0xffffff80,%eax
  101bb4:	a2 25 90 14 00       	mov    %al,0x149025
  101bb9:	0f b6 05 26 90 14 00 	movzbl 0x149026,%eax
  101bc0:	83 c8 0f             	or     $0xf,%eax
  101bc3:	a2 26 90 14 00       	mov    %al,0x149026
  101bc8:	0f b6 05 26 90 14 00 	movzbl 0x149026,%eax
  101bcf:	83 e0 ef             	and    $0xffffffef,%eax
  101bd2:	a2 26 90 14 00       	mov    %al,0x149026
  101bd7:	0f b6 05 26 90 14 00 	movzbl 0x149026,%eax
  101bde:	83 e0 df             	and    $0xffffffdf,%eax
  101be1:	a2 26 90 14 00       	mov    %al,0x149026
  101be6:	0f b6 05 26 90 14 00 	movzbl 0x149026,%eax
  101bed:	83 c8 40             	or     $0x40,%eax
  101bf0:	a2 26 90 14 00       	mov    %al,0x149026
  101bf5:	0f b6 05 26 90 14 00 	movzbl 0x149026,%eax
  101bfc:	83 c8 80             	or     $0xffffff80,%eax
  101bff:	a2 26 90 14 00       	mov    %al,0x149026
  101c04:	c6 05 27 90 14 00 00 	movb   $0x0,0x149027
  101c0b:	b8 00 80 10 00       	mov    $0x108000,%eax
  101c10:	05 00 10 00 00       	add    $0x1000,%eax
  101c15:	a3 64 6e 10 00       	mov    %eax,0x106e64
  101c1a:	66 c7 05 68 6e 10 00 	movw   $0x10,0x106e68
  101c21:	10 00 
  101c23:	66 c7 05 28 90 14 00 	movw   $0xeb,0x149028
  101c2a:	eb 00 
  101c2c:	b8 60 6e 10 00       	mov    $0x106e60,%eax
  101c31:	66 a3 2a 90 14 00    	mov    %ax,0x14902a
  101c37:	b8 60 6e 10 00       	mov    $0x106e60,%eax
  101c3c:	c1 e8 10             	shr    $0x10,%eax
  101c3f:	a2 2c 90 14 00       	mov    %al,0x14902c
  101c44:	0f b6 05 2d 90 14 00 	movzbl 0x14902d,%eax
  101c4b:	83 e0 f0             	and    $0xfffffff0,%eax
  101c4e:	83 c8 09             	or     $0x9,%eax
  101c51:	a2 2d 90 14 00       	mov    %al,0x14902d
  101c56:	0f b6 05 2d 90 14 00 	movzbl 0x14902d,%eax
  101c5d:	83 c8 10             	or     $0x10,%eax
  101c60:	a2 2d 90 14 00       	mov    %al,0x14902d
  101c65:	0f b6 05 2d 90 14 00 	movzbl 0x14902d,%eax
  101c6c:	83 e0 9f             	and    $0xffffff9f,%eax
  101c6f:	a2 2d 90 14 00       	mov    %al,0x14902d
  101c74:	0f b6 05 2d 90 14 00 	movzbl 0x14902d,%eax
  101c7b:	83 c8 80             	or     $0xffffff80,%eax
  101c7e:	a2 2d 90 14 00       	mov    %al,0x14902d
  101c83:	0f b6 05 2e 90 14 00 	movzbl 0x14902e,%eax
  101c8a:	83 e0 f0             	and    $0xfffffff0,%eax
  101c8d:	a2 2e 90 14 00       	mov    %al,0x14902e
  101c92:	0f b6 05 2e 90 14 00 	movzbl 0x14902e,%eax
  101c99:	83 e0 ef             	and    $0xffffffef,%eax
  101c9c:	a2 2e 90 14 00       	mov    %al,0x14902e
  101ca1:	0f b6 05 2e 90 14 00 	movzbl 0x14902e,%eax
  101ca8:	83 e0 df             	and    $0xffffffdf,%eax
  101cab:	a2 2e 90 14 00       	mov    %al,0x14902e
  101cb0:	0f b6 05 2e 90 14 00 	movzbl 0x14902e,%eax
  101cb7:	83 c8 40             	or     $0x40,%eax
  101cba:	a2 2e 90 14 00       	mov    %al,0x14902e
  101cbf:	0f b6 05 2e 90 14 00 	movzbl 0x14902e,%eax
  101cc6:	83 e0 7f             	and    $0x7f,%eax
  101cc9:	a2 2e 90 14 00       	mov    %al,0x14902e
  101cce:	b8 60 6e 10 00       	mov    $0x106e60,%eax
  101cd3:	c1 e8 18             	shr    $0x18,%eax
  101cd6:	a2 2f 90 14 00       	mov    %al,0x14902f
  101cdb:	0f b6 05 2d 90 14 00 	movzbl 0x14902d,%eax
  101ce2:	83 e0 ef             	and    $0xffffffef,%eax
  101ce5:	a2 2d 90 14 00       	mov    %al,0x14902d
  101cea:	66 c7 45 ee 2f 00    	movw   $0x2f,-0x12(%ebp)
  101cf0:	b8 00 90 14 00       	mov    $0x149000,%eax
  101cf5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101cf8:	0f 01 55 ee          	lgdtl  -0x12(%ebp)
  101cfc:	b8 10 00 00 00       	mov    $0x10,%eax
  101d01:	8e e8                	mov    %eax,%gs
  101d03:	b8 10 00 00 00       	mov    $0x10,%eax
  101d08:	8e e0                	mov    %eax,%fs
  101d0a:	b8 10 00 00 00       	mov    $0x10,%eax
  101d0f:	8e c0                	mov    %eax,%es
  101d11:	b8 10 00 00 00       	mov    $0x10,%eax
  101d16:	8e d8                	mov    %eax,%ds
  101d18:	b8 10 00 00 00       	mov    $0x10,%eax
  101d1d:	8e d0                	mov    %eax,%ss
  101d1f:	ea 26 1d 10 00 08 00 	ljmp   $0x8,$0x101d26
  101d26:	83 ec 0c             	sub    $0xc,%esp
  101d29:	6a 00                	push   $0x0
  101d2b:	e8 33 01 00 00       	call   101e63 <lldt>
  101d30:	83 c4 10             	add    $0x10,%esp
  101d33:	83 ec 0c             	sub    $0xc,%esp
  101d36:	6a 28                	push   $0x28
  101d38:	e8 70 02 00 00       	call   101fad <ltr>
  101d3d:	83 c4 10             	add    $0x10,%esp
  101d40:	83 ec 08             	sub    $0x8,%esp
  101d43:	68 00 3b 00 00       	push   $0x3b00
  101d48:	68 40 90 14 00       	push   $0x149040
  101d4d:	e8 78 f4 ff ff       	call   1011ca <memzero>
  101d52:	83 c4 10             	add    $0x10,%esp
  101d55:	83 ec 08             	sub    $0x8,%esp
  101d58:	68 00 00 04 00       	push   $0x40000
  101d5d:	68 00 90 10 00       	push   $0x109000
  101d62:	e8 63 f4 ff ff       	call   1011ca <memzero>
  101d67:	83 c4 10             	add    $0x10,%esp
  101d6a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101d71:	e9 81 00 00 00       	jmp    101df7 <seg_init+0x4f2>
  101d76:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101d79:	c1 e0 0c             	shl    $0xc,%eax
  101d7c:	05 00 90 10 00       	add    $0x109000,%eax
  101d81:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
  101d87:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101d8a:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  101d90:	05 44 90 14 00       	add    $0x149044,%eax
  101d95:	89 10                	mov    %edx,(%eax)
  101d97:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101d9a:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  101da0:	05 48 90 14 00       	add    $0x149048,%eax
  101da5:	66 c7 00 10 00       	movw   $0x10,(%eax)
  101daa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101dad:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  101db3:	05 a6 90 14 00       	add    $0x1490a6,%eax
  101db8:	66 c7 00 68 00       	movw   $0x68,(%eax)
  101dbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101dc0:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  101dc6:	83 c0 60             	add    $0x60,%eax
  101dc9:	05 40 90 14 00       	add    $0x149040,%eax
  101dce:	83 c0 08             	add    $0x8,%eax
  101dd1:	83 ec 08             	sub    $0x8,%esp
  101dd4:	68 80 00 00 00       	push   $0x80
  101dd9:	50                   	push   %eax
  101dda:	e8 eb f3 ff ff       	call   1011ca <memzero>
  101ddf:	83 c4 10             	add    $0x10,%esp
  101de2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101de5:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  101deb:	05 28 91 14 00       	add    $0x149128,%eax
  101df0:	c6 00 ff             	movb   $0xff,(%eax)
  101df3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101df7:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
  101dfb:	0f 86 75 ff ff ff    	jbe    101d76 <seg_init+0x471>
  101e01:	90                   	nop
  101e02:	c9                   	leave  
  101e03:	c3                   	ret    

00101e04 <max>:
  101e04:	55                   	push   %ebp
  101e05:	89 e5                	mov    %esp,%ebp
  101e07:	8b 45 08             	mov    0x8(%ebp),%eax
  101e0a:	39 45 0c             	cmp    %eax,0xc(%ebp)
  101e0d:	0f 43 45 0c          	cmovae 0xc(%ebp),%eax
  101e11:	5d                   	pop    %ebp
  101e12:	c3                   	ret    

00101e13 <min>:
  101e13:	55                   	push   %ebp
  101e14:	89 e5                	mov    %esp,%ebp
  101e16:	8b 45 08             	mov    0x8(%ebp),%eax
  101e19:	39 45 0c             	cmp    %eax,0xc(%ebp)
  101e1c:	0f 46 45 0c          	cmovbe 0xc(%ebp),%eax
  101e20:	5d                   	pop    %ebp
  101e21:	c3                   	ret    

00101e22 <rounddown>:
  101e22:	55                   	push   %ebp
  101e23:	89 e5                	mov    %esp,%ebp
  101e25:	8b 45 08             	mov    0x8(%ebp),%eax
  101e28:	ba 00 00 00 00       	mov    $0x0,%edx
  101e2d:	f7 75 0c             	divl   0xc(%ebp)
  101e30:	8b 45 08             	mov    0x8(%ebp),%eax
  101e33:	29 d0                	sub    %edx,%eax
  101e35:	5d                   	pop    %ebp
  101e36:	c3                   	ret    

00101e37 <roundup>:
  101e37:	55                   	push   %ebp
  101e38:	89 e5                	mov    %esp,%ebp
  101e3a:	8b 55 08             	mov    0x8(%ebp),%edx
  101e3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  101e40:	01 d0                	add    %edx,%eax
  101e42:	83 e8 01             	sub    $0x1,%eax
  101e45:	ff 75 0c             	pushl  0xc(%ebp)
  101e48:	50                   	push   %eax
  101e49:	e8 d4 ff ff ff       	call   101e22 <rounddown>
  101e4e:	83 c4 08             	add    $0x8,%esp
  101e51:	c9                   	leave  
  101e52:	c3                   	ret    

00101e53 <read_ebp>:
  101e53:	55                   	push   %ebp
  101e54:	89 e5                	mov    %esp,%ebp
  101e56:	83 ec 10             	sub    $0x10,%esp
  101e59:	89 e8                	mov    %ebp,%eax
  101e5b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101e5e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101e61:	c9                   	leave  
  101e62:	c3                   	ret    

00101e63 <lldt>:
  101e63:	55                   	push   %ebp
  101e64:	89 e5                	mov    %esp,%ebp
  101e66:	83 ec 04             	sub    $0x4,%esp
  101e69:	8b 45 08             	mov    0x8(%ebp),%eax
  101e6c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  101e70:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  101e74:	0f 00 d0             	lldt   %ax
  101e77:	90                   	nop
  101e78:	c9                   	leave  
  101e79:	c3                   	ret    

00101e7a <cli>:
  101e7a:	55                   	push   %ebp
  101e7b:	89 e5                	mov    %esp,%ebp
  101e7d:	fa                   	cli    
  101e7e:	90                   	nop
  101e7f:	5d                   	pop    %ebp
  101e80:	c3                   	ret    

00101e81 <sti>:
  101e81:	55                   	push   %ebp
  101e82:	89 e5                	mov    %esp,%ebp
  101e84:	fb                   	sti    
  101e85:	90                   	nop
  101e86:	90                   	nop
  101e87:	5d                   	pop    %ebp
  101e88:	c3                   	ret    

00101e89 <rdmsr>:
  101e89:	55                   	push   %ebp
  101e8a:	89 e5                	mov    %esp,%ebp
  101e8c:	83 ec 10             	sub    $0x10,%esp
  101e8f:	8b 45 08             	mov    0x8(%ebp),%eax
  101e92:	89 c1                	mov    %eax,%ecx
  101e94:	0f 32                	rdmsr  
  101e96:	89 45 f8             	mov    %eax,-0x8(%ebp)
  101e99:	89 55 fc             	mov    %edx,-0x4(%ebp)
  101e9c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101e9f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101ea2:	c9                   	leave  
  101ea3:	c3                   	ret    

00101ea4 <wrmsr>:
  101ea4:	55                   	push   %ebp
  101ea5:	89 e5                	mov    %esp,%ebp
  101ea7:	83 ec 08             	sub    $0x8,%esp
  101eaa:	8b 45 0c             	mov    0xc(%ebp),%eax
  101ead:	89 45 f8             	mov    %eax,-0x8(%ebp)
  101eb0:	8b 45 10             	mov    0x10(%ebp),%eax
  101eb3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101eb6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101eb9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101ebc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101ebf:	0f 30                	wrmsr  
  101ec1:	90                   	nop
  101ec2:	c9                   	leave  
  101ec3:	c3                   	ret    

00101ec4 <halt>:
  101ec4:	55                   	push   %ebp
  101ec5:	89 e5                	mov    %esp,%ebp
  101ec7:	f4                   	hlt    
  101ec8:	90                   	nop
  101ec9:	5d                   	pop    %ebp
  101eca:	c3                   	ret    

00101ecb <rdtsc>:
  101ecb:	55                   	push   %ebp
  101ecc:	89 e5                	mov    %esp,%ebp
  101ece:	83 ec 10             	sub    $0x10,%esp
  101ed1:	0f 31                	rdtsc  
  101ed3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  101ed6:	89 55 fc             	mov    %edx,-0x4(%ebp)
  101ed9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101edc:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101edf:	c9                   	leave  
  101ee0:	c3                   	ret    

00101ee1 <enable_sse>:
  101ee1:	55                   	push   %ebp
  101ee2:	89 e5                	mov    %esp,%ebp
  101ee4:	83 ec 20             	sub    $0x20,%esp
  101ee7:	0f 20 e0             	mov    %cr4,%eax
  101eea:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101eed:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101ef0:	80 cc 06             	or     $0x6,%ah
  101ef3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101ef6:	0f ae f0             	mfence 
  101ef9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101efc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101eff:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101f02:	0f 22 e0             	mov    %eax,%cr4
  101f05:	0f 20 c0             	mov    %cr0,%eax
  101f08:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101f0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f0e:	83 c8 02             	or     $0x2,%eax
  101f11:	89 45 f8             	mov    %eax,-0x8(%ebp)
  101f14:	0f ae f0             	mfence 
  101f17:	83 65 f8 f3          	andl   $0xfffffff3,-0x8(%ebp)
  101f1b:	90                   	nop
  101f1c:	c9                   	leave  
  101f1d:	c3                   	ret    

00101f1e <cpuid>:
  101f1e:	55                   	push   %ebp
  101f1f:	89 e5                	mov    %esp,%ebp
  101f21:	53                   	push   %ebx
  101f22:	83 ec 10             	sub    $0x10,%esp
  101f25:	8b 45 08             	mov    0x8(%ebp),%eax
  101f28:	0f a2                	cpuid  
  101f2a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  101f2d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  101f30:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  101f33:	89 55 ec             	mov    %edx,-0x14(%ebp)
  101f36:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  101f3a:	74 08                	je     101f44 <cpuid+0x26>
  101f3c:	8b 45 0c             	mov    0xc(%ebp),%eax
  101f3f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  101f42:	89 10                	mov    %edx,(%eax)
  101f44:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  101f48:	74 08                	je     101f52 <cpuid+0x34>
  101f4a:	8b 45 10             	mov    0x10(%ebp),%eax
  101f4d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101f50:	89 10                	mov    %edx,(%eax)
  101f52:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  101f56:	74 08                	je     101f60 <cpuid+0x42>
  101f58:	8b 45 14             	mov    0x14(%ebp),%eax
  101f5b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101f5e:	89 10                	mov    %edx,(%eax)
  101f60:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
  101f64:	74 08                	je     101f6e <cpuid+0x50>
  101f66:	8b 45 18             	mov    0x18(%ebp),%eax
  101f69:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101f6c:	89 10                	mov    %edx,(%eax)
  101f6e:	90                   	nop
  101f6f:	83 c4 10             	add    $0x10,%esp
  101f72:	5b                   	pop    %ebx
  101f73:	5d                   	pop    %ebp
  101f74:	c3                   	ret    

00101f75 <rcr3>:
  101f75:	55                   	push   %ebp
  101f76:	89 e5                	mov    %esp,%ebp
  101f78:	83 ec 10             	sub    $0x10,%esp
  101f7b:	0f 20 d8             	mov    %cr3,%eax
  101f7e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101f81:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101f84:	c9                   	leave  
  101f85:	c3                   	ret    

00101f86 <outl>:
  101f86:	55                   	push   %ebp
  101f87:	89 e5                	mov    %esp,%ebp
  101f89:	8b 45 0c             	mov    0xc(%ebp),%eax
  101f8c:	8b 55 08             	mov    0x8(%ebp),%edx
  101f8f:	ef                   	out    %eax,(%dx)
  101f90:	90                   	nop
  101f91:	5d                   	pop    %ebp
  101f92:	c3                   	ret    

00101f93 <inl>:
  101f93:	55                   	push   %ebp
  101f94:	89 e5                	mov    %esp,%ebp
  101f96:	83 ec 10             	sub    $0x10,%esp
  101f99:	8b 45 08             	mov    0x8(%ebp),%eax
  101f9c:	89 c2                	mov    %eax,%edx
  101f9e:	ed                   	in     (%dx),%eax
  101f9f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101fa2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101fa5:	c9                   	leave  
  101fa6:	c3                   	ret    

00101fa7 <smp_wmb>:
  101fa7:	55                   	push   %ebp
  101fa8:	89 e5                	mov    %esp,%ebp
  101faa:	90                   	nop
  101fab:	5d                   	pop    %ebp
  101fac:	c3                   	ret    

00101fad <ltr>:
  101fad:	55                   	push   %ebp
  101fae:	89 e5                	mov    %esp,%ebp
  101fb0:	83 ec 04             	sub    $0x4,%esp
  101fb3:	8b 45 08             	mov    0x8(%ebp),%eax
  101fb6:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  101fba:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  101fbe:	0f 00 d8             	ltr    %ax
  101fc1:	90                   	nop
  101fc2:	c9                   	leave  
  101fc3:	c3                   	ret    

00101fc4 <lcr0>:
  101fc4:	55                   	push   %ebp
  101fc5:	89 e5                	mov    %esp,%ebp
  101fc7:	8b 45 08             	mov    0x8(%ebp),%eax
  101fca:	0f 22 c0             	mov    %eax,%cr0
  101fcd:	90                   	nop
  101fce:	5d                   	pop    %ebp
  101fcf:	c3                   	ret    

00101fd0 <rcr0>:
  101fd0:	55                   	push   %ebp
  101fd1:	89 e5                	mov    %esp,%ebp
  101fd3:	83 ec 10             	sub    $0x10,%esp
  101fd6:	0f 20 c0             	mov    %cr0,%eax
  101fd9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101fdc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101fdf:	c9                   	leave  
  101fe0:	c3                   	ret    

00101fe1 <rcr2>:
  101fe1:	55                   	push   %ebp
  101fe2:	89 e5                	mov    %esp,%ebp
  101fe4:	83 ec 10             	sub    $0x10,%esp
  101fe7:	0f 20 d0             	mov    %cr2,%eax
  101fea:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101fed:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101ff0:	c9                   	leave  
  101ff1:	c3                   	ret    

00101ff2 <lcr3>:
  101ff2:	55                   	push   %ebp
  101ff3:	89 e5                	mov    %esp,%ebp
  101ff5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ff8:	0f 22 d8             	mov    %eax,%cr3
  101ffb:	90                   	nop
  101ffc:	5d                   	pop    %ebp
  101ffd:	c3                   	ret    

00101ffe <lcr4>:
  101ffe:	55                   	push   %ebp
  101fff:	89 e5                	mov    %esp,%ebp
  102001:	8b 45 08             	mov    0x8(%ebp),%eax
  102004:	0f 22 e0             	mov    %eax,%cr4
  102007:	90                   	nop
  102008:	5d                   	pop    %ebp
  102009:	c3                   	ret    

0010200a <rcr4>:
  10200a:	55                   	push   %ebp
  10200b:	89 e5                	mov    %esp,%ebp
  10200d:	83 ec 10             	sub    $0x10,%esp
  102010:	0f 20 e0             	mov    %cr4,%eax
  102013:	89 45 fc             	mov    %eax,-0x4(%ebp)
  102016:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102019:	c9                   	leave  
  10201a:	c3                   	ret    

0010201b <inb>:
  10201b:	55                   	push   %ebp
  10201c:	89 e5                	mov    %esp,%ebp
  10201e:	83 ec 10             	sub    $0x10,%esp
  102021:	8b 45 08             	mov    0x8(%ebp),%eax
  102024:	89 c2                	mov    %eax,%edx
  102026:	ec                   	in     (%dx),%al
  102027:	88 45 ff             	mov    %al,-0x1(%ebp)
  10202a:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  10202e:	c9                   	leave  
  10202f:	c3                   	ret    

00102030 <insl>:
  102030:	55                   	push   %ebp
  102031:	89 e5                	mov    %esp,%ebp
  102033:	57                   	push   %edi
  102034:	53                   	push   %ebx
  102035:	8b 55 08             	mov    0x8(%ebp),%edx
  102038:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10203b:	8b 45 10             	mov    0x10(%ebp),%eax
  10203e:	89 cb                	mov    %ecx,%ebx
  102040:	89 df                	mov    %ebx,%edi
  102042:	89 c1                	mov    %eax,%ecx
  102044:	fc                   	cld    
  102045:	f2 6d                	repnz insl (%dx),%es:(%edi)
  102047:	89 c8                	mov    %ecx,%eax
  102049:	89 fb                	mov    %edi,%ebx
  10204b:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  10204e:	89 45 10             	mov    %eax,0x10(%ebp)
  102051:	90                   	nop
  102052:	5b                   	pop    %ebx
  102053:	5f                   	pop    %edi
  102054:	5d                   	pop    %ebp
  102055:	c3                   	ret    

00102056 <outb>:
  102056:	55                   	push   %ebp
  102057:	89 e5                	mov    %esp,%ebp
  102059:	83 ec 04             	sub    $0x4,%esp
  10205c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10205f:	88 45 fc             	mov    %al,-0x4(%ebp)
  102062:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  102066:	8b 55 08             	mov    0x8(%ebp),%edx
  102069:	ee                   	out    %al,(%dx)
  10206a:	90                   	nop
  10206b:	c9                   	leave  
  10206c:	c3                   	ret    

0010206d <outsw>:
  10206d:	55                   	push   %ebp
  10206e:	89 e5                	mov    %esp,%ebp
  102070:	56                   	push   %esi
  102071:	53                   	push   %ebx
  102072:	8b 55 08             	mov    0x8(%ebp),%edx
  102075:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  102078:	8b 45 10             	mov    0x10(%ebp),%eax
  10207b:	89 cb                	mov    %ecx,%ebx
  10207d:	89 de                	mov    %ebx,%esi
  10207f:	89 c1                	mov    %eax,%ecx
  102081:	fc                   	cld    
  102082:	f2 66 6f             	repnz outsw %ds:(%esi),(%dx)
  102085:	89 c8                	mov    %ecx,%eax
  102087:	89 f3                	mov    %esi,%ebx
  102089:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  10208c:	89 45 10             	mov    %eax,0x10(%ebp)
  10208f:	90                   	nop
  102090:	5b                   	pop    %ebx
  102091:	5e                   	pop    %esi
  102092:	5d                   	pop    %ebp
  102093:	c3                   	ret    

00102094 <mon_help>:
  102094:	55                   	push   %ebp
  102095:	89 e5                	mov    %esp,%ebp
  102097:	83 ec 18             	sub    $0x18,%esp
  10209a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1020a1:	eb 3c                	jmp    1020df <mon_help+0x4b>
  1020a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1020a6:	89 d0                	mov    %edx,%eax
  1020a8:	01 c0                	add    %eax,%eax
  1020aa:	01 d0                	add    %edx,%eax
  1020ac:	c1 e0 02             	shl    $0x2,%eax
  1020af:	05 14 55 10 00       	add    $0x105514,%eax
  1020b4:	8b 08                	mov    (%eax),%ecx
  1020b6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1020b9:	89 d0                	mov    %edx,%eax
  1020bb:	01 c0                	add    %eax,%eax
  1020bd:	01 d0                	add    %edx,%eax
  1020bf:	c1 e0 02             	shl    $0x2,%eax
  1020c2:	05 10 55 10 00       	add    $0x105510,%eax
  1020c7:	8b 00                	mov    (%eax),%eax
  1020c9:	83 ec 04             	sub    $0x4,%esp
  1020cc:	51                   	push   %ecx
  1020cd:	50                   	push   %eax
  1020ce:	68 5d 2a 10 00       	push   $0x102a5d
  1020d3:	e8 8c f3 ff ff       	call   101464 <dprintf>
  1020d8:	83 c4 10             	add    $0x10,%esp
  1020db:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1020df:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1020e2:	83 f8 01             	cmp    $0x1,%eax
  1020e5:	76 bc                	jbe    1020a3 <mon_help+0xf>
  1020e7:	b8 00 00 00 00       	mov    $0x0,%eax
  1020ec:	c9                   	leave  
  1020ed:	c3                   	ret    

001020ee <mon_kerninfo>:
  1020ee:	55                   	push   %ebp
  1020ef:	89 e5                	mov    %esp,%ebp
  1020f1:	83 ec 18             	sub    $0x18,%esp
  1020f4:	83 ec 0c             	sub    $0xc,%esp
  1020f7:	68 66 2a 10 00       	push   $0x102a66
  1020fc:	e8 63 f3 ff ff       	call   101464 <dprintf>
  102101:	83 c4 10             	add    $0x10,%esp
  102104:	83 ec 08             	sub    $0x8,%esp
  102107:	68 f0 23 10 00       	push   $0x1023f0
  10210c:	68 7f 2a 10 00       	push   $0x102a7f
  102111:	e8 4e f3 ff ff       	call   101464 <dprintf>
  102116:	83 c4 10             	add    $0x10,%esp
  102119:	83 ec 08             	sub    $0x8,%esp
  10211c:	68 41 27 10 00       	push   $0x102741
  102121:	68 8e 2a 10 00       	push   $0x102a8e
  102126:	e8 39 f3 ff ff       	call   101464 <dprintf>
  10212b:	83 c4 10             	add    $0x10,%esp
  10212e:	83 ec 08             	sub    $0x8,%esp
  102131:	68 28 55 10 00       	push   $0x105528
  102136:	68 9d 2a 10 00       	push   $0x102a9d
  10213b:	e8 24 f3 ff ff       	call   101464 <dprintf>
  102140:	83 c4 10             	add    $0x10,%esp
  102143:	83 ec 08             	sub    $0x8,%esp
  102146:	68 40 cb 14 00       	push   $0x14cb40
  10214b:	68 ac 2a 10 00       	push   $0x102aac
  102150:	e8 0f f3 ff ff       	call   101464 <dprintf>
  102155:	83 c4 10             	add    $0x10,%esp
  102158:	ba 40 cb 14 00       	mov    $0x14cb40,%edx
  10215d:	b8 f0 23 10 00       	mov    $0x1023f0,%eax
  102162:	29 c2                	sub    %eax,%edx
  102164:	89 d0                	mov    %edx,%eax
  102166:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102169:	c7 45 f0 00 04 00 00 	movl   $0x400,-0x10(%ebp)
  102170:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102173:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102176:	01 d0                	add    %edx,%eax
  102178:	83 e8 01             	sub    $0x1,%eax
  10217b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10217e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102181:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102184:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102187:	99                   	cltd   
  102188:	f7 7d e8             	idivl  -0x18(%ebp)
  10218b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10218e:	29 d0                	sub    %edx,%eax
  102190:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  102196:	85 c0                	test   %eax,%eax
  102198:	0f 48 c2             	cmovs  %edx,%eax
  10219b:	c1 f8 0a             	sar    $0xa,%eax
  10219e:	83 ec 08             	sub    $0x8,%esp
  1021a1:	50                   	push   %eax
  1021a2:	68 bc 2a 10 00       	push   $0x102abc
  1021a7:	e8 b8 f2 ff ff       	call   101464 <dprintf>
  1021ac:	83 c4 10             	add    $0x10,%esp
  1021af:	b8 00 00 00 00       	mov    $0x0,%eax
  1021b4:	c9                   	leave  
  1021b5:	c3                   	ret    

001021b6 <mon_backtrace>:
  1021b6:	55                   	push   %ebp
  1021b7:	89 e5                	mov    %esp,%ebp
  1021b9:	b8 00 00 00 00       	mov    $0x0,%eax
  1021be:	5d                   	pop    %ebp
  1021bf:	c3                   	ret    

001021c0 <runcmd>:
  1021c0:	55                   	push   %ebp
  1021c1:	89 e5                	mov    %esp,%ebp
  1021c3:	83 ec 58             	sub    $0x58,%esp
  1021c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1021cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1021d0:	c7 44 85 b0 00 00 00 	movl   $0x0,-0x50(%ebp,%eax,4)
  1021d7:	00 
  1021d8:	eb 0c                	jmp    1021e6 <runcmd+0x26>
  1021da:	8b 45 08             	mov    0x8(%ebp),%eax
  1021dd:	8d 50 01             	lea    0x1(%eax),%edx
  1021e0:	89 55 08             	mov    %edx,0x8(%ebp)
  1021e3:	c6 00 00             	movb   $0x0,(%eax)
  1021e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1021e9:	0f b6 00             	movzbl (%eax),%eax
  1021ec:	84 c0                	test   %al,%al
  1021ee:	74 1e                	je     10220e <runcmd+0x4e>
  1021f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1021f3:	0f b6 00             	movzbl (%eax),%eax
  1021f6:	0f be c0             	movsbl %al,%eax
  1021f9:	83 ec 08             	sub    $0x8,%esp
  1021fc:	50                   	push   %eax
  1021fd:	68 e6 2a 10 00       	push   $0x102ae6
  102202:	e8 90 ef ff ff       	call   101197 <strchr>
  102207:	83 c4 10             	add    $0x10,%esp
  10220a:	85 c0                	test   %eax,%eax
  10220c:	75 cc                	jne    1021da <runcmd+0x1a>
  10220e:	8b 45 08             	mov    0x8(%ebp),%eax
  102211:	0f b6 00             	movzbl (%eax),%eax
  102214:	84 c0                	test   %al,%al
  102216:	74 69                	je     102281 <runcmd+0xc1>
  102218:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  10221c:	75 1c                	jne    10223a <runcmd+0x7a>
  10221e:	83 ec 08             	sub    $0x8,%esp
  102221:	6a 10                	push   $0x10
  102223:	68 eb 2a 10 00       	push   $0x102aeb
  102228:	e8 37 f2 ff ff       	call   101464 <dprintf>
  10222d:	83 c4 10             	add    $0x10,%esp
  102230:	b8 00 00 00 00       	mov    $0x0,%eax
  102235:	e9 dc 00 00 00       	jmp    102316 <runcmd+0x156>
  10223a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10223d:	8d 50 01             	lea    0x1(%eax),%edx
  102240:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102243:	8b 55 08             	mov    0x8(%ebp),%edx
  102246:	89 54 85 b0          	mov    %edx,-0x50(%ebp,%eax,4)
  10224a:	eb 04                	jmp    102250 <runcmd+0x90>
  10224c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102250:	8b 45 08             	mov    0x8(%ebp),%eax
  102253:	0f b6 00             	movzbl (%eax),%eax
  102256:	84 c0                	test   %al,%al
  102258:	0f 84 7a ff ff ff    	je     1021d8 <runcmd+0x18>
  10225e:	8b 45 08             	mov    0x8(%ebp),%eax
  102261:	0f b6 00             	movzbl (%eax),%eax
  102264:	0f be c0             	movsbl %al,%eax
  102267:	83 ec 08             	sub    $0x8,%esp
  10226a:	50                   	push   %eax
  10226b:	68 e6 2a 10 00       	push   $0x102ae6
  102270:	e8 22 ef ff ff       	call   101197 <strchr>
  102275:	83 c4 10             	add    $0x10,%esp
  102278:	85 c0                	test   %eax,%eax
  10227a:	74 d0                	je     10224c <runcmd+0x8c>
  10227c:	e9 57 ff ff ff       	jmp    1021d8 <runcmd+0x18>
  102281:	90                   	nop
  102282:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102285:	c7 44 85 b0 00 00 00 	movl   $0x0,-0x50(%ebp,%eax,4)
  10228c:	00 
  10228d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102291:	75 07                	jne    10229a <runcmd+0xda>
  102293:	b8 00 00 00 00       	mov    $0x0,%eax
  102298:	eb 7c                	jmp    102316 <runcmd+0x156>
  10229a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  1022a1:	eb 52                	jmp    1022f5 <runcmd+0x135>
  1022a3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1022a6:	89 d0                	mov    %edx,%eax
  1022a8:	01 c0                	add    %eax,%eax
  1022aa:	01 d0                	add    %edx,%eax
  1022ac:	c1 e0 02             	shl    $0x2,%eax
  1022af:	05 10 55 10 00       	add    $0x105510,%eax
  1022b4:	8b 10                	mov    (%eax),%edx
  1022b6:	8b 45 b0             	mov    -0x50(%ebp),%eax
  1022b9:	83 ec 08             	sub    $0x8,%esp
  1022bc:	52                   	push   %edx
  1022bd:	50                   	push   %eax
  1022be:	e8 95 ee ff ff       	call   101158 <strcmp>
  1022c3:	83 c4 10             	add    $0x10,%esp
  1022c6:	85 c0                	test   %eax,%eax
  1022c8:	75 27                	jne    1022f1 <runcmd+0x131>
  1022ca:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1022cd:	89 d0                	mov    %edx,%eax
  1022cf:	01 c0                	add    %eax,%eax
  1022d1:	01 d0                	add    %edx,%eax
  1022d3:	c1 e0 02             	shl    $0x2,%eax
  1022d6:	05 18 55 10 00       	add    $0x105518,%eax
  1022db:	8b 00                	mov    (%eax),%eax
  1022dd:	83 ec 04             	sub    $0x4,%esp
  1022e0:	ff 75 0c             	pushl  0xc(%ebp)
  1022e3:	8d 55 b0             	lea    -0x50(%ebp),%edx
  1022e6:	52                   	push   %edx
  1022e7:	ff 75 f4             	pushl  -0xc(%ebp)
  1022ea:	ff d0                	call   *%eax
  1022ec:	83 c4 10             	add    $0x10,%esp
  1022ef:	eb 25                	jmp    102316 <runcmd+0x156>
  1022f1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  1022f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1022f8:	83 f8 01             	cmp    $0x1,%eax
  1022fb:	76 a6                	jbe    1022a3 <runcmd+0xe3>
  1022fd:	8b 45 b0             	mov    -0x50(%ebp),%eax
  102300:	83 ec 08             	sub    $0x8,%esp
  102303:	50                   	push   %eax
  102304:	68 08 2b 10 00       	push   $0x102b08
  102309:	e8 56 f1 ff ff       	call   101464 <dprintf>
  10230e:	83 c4 10             	add    $0x10,%esp
  102311:	b8 00 00 00 00       	mov    $0x0,%eax
  102316:	c9                   	leave  
  102317:	c3                   	ret    

00102318 <monitor>:
  102318:	55                   	push   %ebp
  102319:	89 e5                	mov    %esp,%ebp
  10231b:	83 ec 18             	sub    $0x18,%esp
  10231e:	83 ec 0c             	sub    $0xc,%esp
  102321:	68 20 2b 10 00       	push   $0x102b20
  102326:	e8 39 f1 ff ff       	call   101464 <dprintf>
  10232b:	83 c4 10             	add    $0x10,%esp
  10232e:	83 ec 0c             	sub    $0xc,%esp
  102331:	68 4c 2b 10 00       	push   $0x102b4c
  102336:	e8 29 f1 ff ff       	call   101464 <dprintf>
  10233b:	83 c4 10             	add    $0x10,%esp
  10233e:	83 ec 0c             	sub    $0xc,%esp
  102341:	68 20 2b 10 00       	push   $0x102b20
  102346:	e8 19 f1 ff ff       	call   101464 <dprintf>
  10234b:	83 c4 10             	add    $0x10,%esp
  10234e:	83 ec 0c             	sub    $0xc,%esp
  102351:	68 78 2b 10 00       	push   $0x102b78
  102356:	e8 09 f1 ff ff       	call   101464 <dprintf>
  10235b:	83 c4 10             	add    $0x10,%esp
  10235e:	83 ec 0c             	sub    $0xc,%esp
  102361:	68 9d 2b 10 00       	push   $0x102b9d
  102366:	e8 2d e1 ff ff       	call   100498 <readline>
  10236b:	83 c4 10             	add    $0x10,%esp
  10236e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102371:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102375:	74 e7                	je     10235e <monitor+0x46>
  102377:	83 ec 08             	sub    $0x8,%esp
  10237a:	ff 75 08             	pushl  0x8(%ebp)
  10237d:	ff 75 f4             	pushl  -0xc(%ebp)
  102380:	e8 3b fe ff ff       	call   1021c0 <runcmd>
  102385:	83 c4 10             	add    $0x10,%esp
  102388:	85 c0                	test   %eax,%eax
  10238a:	78 02                	js     10238e <monitor+0x76>
  10238c:	eb d0                	jmp    10235e <monitor+0x46>
  10238e:	90                   	nop
  10238f:	90                   	nop
  102390:	c9                   	leave  
  102391:	c3                   	ret    
  102392:	66 90                	xchg   %ax,%ax
  102394:	66 90                	xchg   %ax,%ax
  102396:	66 90                	xchg   %ax,%ax
  102398:	66 90                	xchg   %ax,%ax
  10239a:	66 90                	xchg   %ax,%ax
  10239c:	66 90                	xchg   %ax,%ax
  10239e:	66 90                	xchg   %ax,%ax

001023a0 <kern_init>:
    monitor(NULL);
}

void
kern_init (uintptr_t mbi_addr)
{
  1023a0:	83 ec 18             	sub    $0x18,%esp
    pmem_init (mbi_addr);
  1023a3:	ff 74 24 1c          	pushl  0x1c(%esp)
  1023a7:	e8 e4 00 00 00       	call   102490 <pmem_init>

    KERN_DEBUG("Kernel initialized.\n");
  1023ac:	83 c4 0c             	add    $0xc,%esp
  1023af:	68 a1 2b 10 00       	push   $0x102ba1
  1023b4:	6a 33                	push   $0x33
  1023b6:	68 b6 2b 10 00       	push   $0x102bb6
  1023bb:	e8 40 ee ff ff       	call   101200 <debug_normal>
#endif

static void
kern_main (void)
{
    KERN_DEBUG("In kernel main.\n\n");
  1023c0:	83 c4 0c             	add    $0xc,%esp
  1023c3:	68 c7 2b 10 00       	push   $0x102bc7
  1023c8:	6a 12                	push   $0x12
  1023ca:	68 b6 2b 10 00       	push   $0x102bb6
  1023cf:	e8 2c ee ff ff       	call   101200 <debug_normal>
    else
      dprintf("Test failed.\n");
    dprintf("\n");
    #endif

    monitor(NULL);
  1023d4:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
  1023db:	00 
    pmem_init (mbi_addr);

    KERN_DEBUG("Kernel initialized.\n");

    kern_main ();
}
  1023dc:	83 c4 1c             	add    $0x1c,%esp
    else
      dprintf("Test failed.\n");
    dprintf("\n");
    #endif

    monitor(NULL);
  1023df:	e9 34 ff ff ff       	jmp    102318 <monitor>
  1023e4:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  1023ea:	00 00                	add    %al,(%eax)
  1023ec:	fb                   	sti    
  1023ed:	4f                   	dec    %edi
  1023ee:	52                   	push   %edx
  1023ef:	e4                   	.byte 0xe4

001023f0 <start>:
  1023f0:	fa                   	cli    
  1023f1:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
  1023f6:	75 27                	jne    10241f <spin>
  1023f8:	89 1d 20 24 10 00    	mov    %ebx,0x102420
  1023fe:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
  102405:	34 12 
  102407:	6a 02                	push   $0x2
  102409:	9d                   	popf   
  10240a:	bd 00 00 00 00       	mov    $0x0,%ebp
  10240f:	bc 00 90 10 00       	mov    $0x109000,%esp
  102414:	ff 35 20 24 10 00    	pushl  0x102420
  10241a:	e8 81 ff ff ff       	call   1023a0 <kern_init>

0010241f <spin>:
  10241f:	f4                   	hlt    

00102420 <multiboot_ptr>:
  102420:	00 00                	add    %al,(%eax)
  102422:	00 00                	add    %al,(%eax)
  102424:	66 90                	xchg   %ax,%ax
  102426:	66 90                	xchg   %ax,%ax
  102428:	66 90                	xchg   %ax,%ax
  10242a:	66 90                	xchg   %ax,%ax
  10242c:	66 90                	xchg   %ax,%ax
  10242e:	66 90                	xchg   %ax,%ax

00102430 <get_nps>:
//The getter function for NUM_PAGES.
unsigned int
get_nps(void)
{
	return NUM_PAGES;
}
  102430:	a1 4c 6f 10 00       	mov    0x106f4c,%eax
  102435:	c3                   	ret    
  102436:	8d 76 00             	lea    0x0(%esi),%esi
  102439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102440 <set_nps>:

//The setter function for NUM_PAGES.
void
set_nps(unsigned int nps)
{
	NUM_PAGES = nps;
  102440:	8b 44 24 04          	mov    0x4(%esp),%eax
  102444:	a3 4c 6f 10 00       	mov    %eax,0x106f4c
  102449:	c3                   	ret    
  10244a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00102450 <at_is_norm>:
  102450:	31 c0                	xor    %eax,%eax
  102452:	c3                   	ret    
  102453:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102460 <at_set_perm>:
  102460:	f3 c3                	repz ret 
  102462:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  102469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102470 <at_is_allocated>:
unsigned int
at_is_allocated(unsigned int page_index)
{
  //TODO
  return 0;
}
  102470:	31 c0                	xor    %eax,%eax
  102472:	c3                   	ret    
  102473:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102480 <at_set_allocated>:
 * The setter function for the physical page allocation flag.
 * Set the flag of the page with given index to the given value.
 */
void
at_set_allocated(unsigned int page_index, unsigned int allocated)
{
  102480:	f3 c3                	repz ret 
  102482:	66 90                	xchg   %ax,%ax
  102484:	66 90                	xchg   %ax,%ax
  102486:	66 90                	xchg   %ax,%ax
  102488:	66 90                	xchg   %ax,%ax
  10248a:	66 90                	xchg   %ax,%ax
  10248c:	66 90                	xchg   %ax,%ax
  10248e:	66 90                	xchg   %ax,%ax

00102490 <pmem_init>:
 *    information available in the physical memory map table.
 *    Review import.h in the current directory for the list of avaiable getter and setter functions.
 */
void
pmem_init(unsigned int mbi_addr)
{
  102490:	83 ec 18             	sub    $0x18,%esp

  // TODO: Define your local variables here.

  //Calls the lower layer initializatin primitives.
  //The parameter mbi_addr shell not be used in the further code.
	devinit(mbi_addr);
  102493:	ff 74 24 1c          	pushl  0x1c(%esp)
  102497:	e8 e3 e4 ff ff       	call   10097f <devinit>
   * Hint: Think of it as the highest address possible in the ranges of the memory map table,
   *       divided by the page size.
   */
  // TODO

	set_nps(nps); // Setting the value computed above to NUM_PAGES.
  10249c:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
  1024a3:	00 
   *    But the ranges in the momory map table may not cover the entire available address space.
   *    That means there may be some gaps between the ranges.
   *    You should still set the permission of those pages in allocation table to 0.
   */
  // TODO
}
  1024a4:	83 c4 1c             	add    $0x1c,%esp
   * Hint: Think of it as the highest address possible in the ranges of the memory map table,
   *       divided by the page size.
   */
  // TODO

	set_nps(nps); // Setting the value computed above to NUM_PAGES.
  1024a7:	e9 94 ff ff ff       	jmp    102440 <set_nps>
  1024ac:	66 90                	xchg   %ax,%ax
  1024ae:	66 90                	xchg   %ax,%ax

001024b0 <palloc>:
unsigned int
palloc()
{
  // TODO
  return 0;
} 
  1024b0:	31 c0                	xor    %eax,%eax
  1024b2:	c3                   	ret    
  1024b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1024b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001024c0 <pfree>:
 *
 * Hint: Simple.
 */
void
pfree(unsigned int pfree_index)
{
  1024c0:	f3 c3                	repz ret 
  1024c2:	66 90                	xchg   %ax,%ax
  1024c4:	66 90                	xchg   %ax,%ax
  1024c6:	66 90                	xchg   %ax,%ax
  1024c8:	66 90                	xchg   %ax,%ax
  1024ca:	66 90                	xchg   %ax,%ax
  1024cc:	66 90                	xchg   %ax,%ax
  1024ce:	66 90                	xchg   %ax,%ax

001024d0 <__udivdi3>:
  1024d0:	55                   	push   %ebp
  1024d1:	57                   	push   %edi
  1024d2:	56                   	push   %esi
  1024d3:	53                   	push   %ebx
  1024d4:	83 ec 1c             	sub    $0x1c,%esp
  1024d7:	8b 74 24 3c          	mov    0x3c(%esp),%esi
  1024db:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  1024df:	8b 4c 24 34          	mov    0x34(%esp),%ecx
  1024e3:	8b 7c 24 38          	mov    0x38(%esp),%edi
  1024e7:	85 f6                	test   %esi,%esi
  1024e9:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  1024ed:	89 ca                	mov    %ecx,%edx
  1024ef:	89 f8                	mov    %edi,%eax
  1024f1:	75 3d                	jne    102530 <__udivdi3+0x60>
  1024f3:	39 cf                	cmp    %ecx,%edi
  1024f5:	0f 87 c5 00 00 00    	ja     1025c0 <__udivdi3+0xf0>
  1024fb:	85 ff                	test   %edi,%edi
  1024fd:	89 fd                	mov    %edi,%ebp
  1024ff:	75 0b                	jne    10250c <__udivdi3+0x3c>
  102501:	b8 01 00 00 00       	mov    $0x1,%eax
  102506:	31 d2                	xor    %edx,%edx
  102508:	f7 f7                	div    %edi
  10250a:	89 c5                	mov    %eax,%ebp
  10250c:	89 c8                	mov    %ecx,%eax
  10250e:	31 d2                	xor    %edx,%edx
  102510:	f7 f5                	div    %ebp
  102512:	89 c1                	mov    %eax,%ecx
  102514:	89 d8                	mov    %ebx,%eax
  102516:	89 cf                	mov    %ecx,%edi
  102518:	f7 f5                	div    %ebp
  10251a:	89 c3                	mov    %eax,%ebx
  10251c:	89 d8                	mov    %ebx,%eax
  10251e:	89 fa                	mov    %edi,%edx
  102520:	83 c4 1c             	add    $0x1c,%esp
  102523:	5b                   	pop    %ebx
  102524:	5e                   	pop    %esi
  102525:	5f                   	pop    %edi
  102526:	5d                   	pop    %ebp
  102527:	c3                   	ret    
  102528:	90                   	nop
  102529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  102530:	39 ce                	cmp    %ecx,%esi
  102532:	77 74                	ja     1025a8 <__udivdi3+0xd8>
  102534:	0f bd fe             	bsr    %esi,%edi
  102537:	83 f7 1f             	xor    $0x1f,%edi
  10253a:	0f 84 98 00 00 00    	je     1025d8 <__udivdi3+0x108>
  102540:	bb 20 00 00 00       	mov    $0x20,%ebx
  102545:	89 f9                	mov    %edi,%ecx
  102547:	89 c5                	mov    %eax,%ebp
  102549:	29 fb                	sub    %edi,%ebx
  10254b:	d3 e6                	shl    %cl,%esi
  10254d:	89 d9                	mov    %ebx,%ecx
  10254f:	d3 ed                	shr    %cl,%ebp
  102551:	89 f9                	mov    %edi,%ecx
  102553:	d3 e0                	shl    %cl,%eax
  102555:	09 ee                	or     %ebp,%esi
  102557:	89 d9                	mov    %ebx,%ecx
  102559:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10255d:	89 d5                	mov    %edx,%ebp
  10255f:	8b 44 24 08          	mov    0x8(%esp),%eax
  102563:	d3 ed                	shr    %cl,%ebp
  102565:	89 f9                	mov    %edi,%ecx
  102567:	d3 e2                	shl    %cl,%edx
  102569:	89 d9                	mov    %ebx,%ecx
  10256b:	d3 e8                	shr    %cl,%eax
  10256d:	09 c2                	or     %eax,%edx
  10256f:	89 d0                	mov    %edx,%eax
  102571:	89 ea                	mov    %ebp,%edx
  102573:	f7 f6                	div    %esi
  102575:	89 d5                	mov    %edx,%ebp
  102577:	89 c3                	mov    %eax,%ebx
  102579:	f7 64 24 0c          	mull   0xc(%esp)
  10257d:	39 d5                	cmp    %edx,%ebp
  10257f:	72 10                	jb     102591 <__udivdi3+0xc1>
  102581:	8b 74 24 08          	mov    0x8(%esp),%esi
  102585:	89 f9                	mov    %edi,%ecx
  102587:	d3 e6                	shl    %cl,%esi
  102589:	39 c6                	cmp    %eax,%esi
  10258b:	73 07                	jae    102594 <__udivdi3+0xc4>
  10258d:	39 d5                	cmp    %edx,%ebp
  10258f:	75 03                	jne    102594 <__udivdi3+0xc4>
  102591:	83 eb 01             	sub    $0x1,%ebx
  102594:	31 ff                	xor    %edi,%edi
  102596:	89 d8                	mov    %ebx,%eax
  102598:	89 fa                	mov    %edi,%edx
  10259a:	83 c4 1c             	add    $0x1c,%esp
  10259d:	5b                   	pop    %ebx
  10259e:	5e                   	pop    %esi
  10259f:	5f                   	pop    %edi
  1025a0:	5d                   	pop    %ebp
  1025a1:	c3                   	ret    
  1025a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1025a8:	31 ff                	xor    %edi,%edi
  1025aa:	31 db                	xor    %ebx,%ebx
  1025ac:	89 d8                	mov    %ebx,%eax
  1025ae:	89 fa                	mov    %edi,%edx
  1025b0:	83 c4 1c             	add    $0x1c,%esp
  1025b3:	5b                   	pop    %ebx
  1025b4:	5e                   	pop    %esi
  1025b5:	5f                   	pop    %edi
  1025b6:	5d                   	pop    %ebp
  1025b7:	c3                   	ret    
  1025b8:	90                   	nop
  1025b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1025c0:	89 d8                	mov    %ebx,%eax
  1025c2:	f7 f7                	div    %edi
  1025c4:	31 ff                	xor    %edi,%edi
  1025c6:	89 c3                	mov    %eax,%ebx
  1025c8:	89 d8                	mov    %ebx,%eax
  1025ca:	89 fa                	mov    %edi,%edx
  1025cc:	83 c4 1c             	add    $0x1c,%esp
  1025cf:	5b                   	pop    %ebx
  1025d0:	5e                   	pop    %esi
  1025d1:	5f                   	pop    %edi
  1025d2:	5d                   	pop    %ebp
  1025d3:	c3                   	ret    
  1025d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1025d8:	39 ce                	cmp    %ecx,%esi
  1025da:	72 0c                	jb     1025e8 <__udivdi3+0x118>
  1025dc:	31 db                	xor    %ebx,%ebx
  1025de:	3b 44 24 08          	cmp    0x8(%esp),%eax
  1025e2:	0f 87 34 ff ff ff    	ja     10251c <__udivdi3+0x4c>
  1025e8:	bb 01 00 00 00       	mov    $0x1,%ebx
  1025ed:	e9 2a ff ff ff       	jmp    10251c <__udivdi3+0x4c>
  1025f2:	66 90                	xchg   %ax,%ax
  1025f4:	66 90                	xchg   %ax,%ax
  1025f6:	66 90                	xchg   %ax,%ax
  1025f8:	66 90                	xchg   %ax,%ax
  1025fa:	66 90                	xchg   %ax,%ax
  1025fc:	66 90                	xchg   %ax,%ax
  1025fe:	66 90                	xchg   %ax,%ax

00102600 <__umoddi3>:
  102600:	55                   	push   %ebp
  102601:	57                   	push   %edi
  102602:	56                   	push   %esi
  102603:	53                   	push   %ebx
  102604:	83 ec 1c             	sub    $0x1c,%esp
  102607:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  10260b:	8b 4c 24 30          	mov    0x30(%esp),%ecx
  10260f:	8b 74 24 34          	mov    0x34(%esp),%esi
  102613:	8b 7c 24 38          	mov    0x38(%esp),%edi
  102617:	85 c0                	test   %eax,%eax
  102619:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10261d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  102621:	89 3c 24             	mov    %edi,(%esp)
  102624:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  102628:	89 f2                	mov    %esi,%edx
  10262a:	75 14                	jne    102640 <__umoddi3+0x40>
  10262c:	39 f7                	cmp    %esi,%edi
  10262e:	76 40                	jbe    102670 <__umoddi3+0x70>
  102630:	89 c8                	mov    %ecx,%eax
  102632:	f7 f7                	div    %edi
  102634:	89 d0                	mov    %edx,%eax
  102636:	31 d2                	xor    %edx,%edx
  102638:	83 c4 1c             	add    $0x1c,%esp
  10263b:	5b                   	pop    %ebx
  10263c:	5e                   	pop    %esi
  10263d:	5f                   	pop    %edi
  10263e:	5d                   	pop    %ebp
  10263f:	c3                   	ret    
  102640:	39 f0                	cmp    %esi,%eax
  102642:	89 f3                	mov    %esi,%ebx
  102644:	77 4a                	ja     102690 <__umoddi3+0x90>
  102646:	0f bd e8             	bsr    %eax,%ebp
  102649:	83 f5 1f             	xor    $0x1f,%ebp
  10264c:	75 52                	jne    1026a0 <__umoddi3+0xa0>
  10264e:	39 f0                	cmp    %esi,%eax
  102650:	0f 82 da 00 00 00    	jb     102730 <__umoddi3+0x130>
  102656:	39 0c 24             	cmp    %ecx,(%esp)
  102659:	0f 86 d1 00 00 00    	jbe    102730 <__umoddi3+0x130>
  10265f:	8b 44 24 04          	mov    0x4(%esp),%eax
  102663:	83 c4 1c             	add    $0x1c,%esp
  102666:	5b                   	pop    %ebx
  102667:	5e                   	pop    %esi
  102668:	5f                   	pop    %edi
  102669:	5d                   	pop    %ebp
  10266a:	c3                   	ret    
  10266b:	90                   	nop
  10266c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102670:	85 ff                	test   %edi,%edi
  102672:	89 fd                	mov    %edi,%ebp
  102674:	75 0b                	jne    102681 <__umoddi3+0x81>
  102676:	b8 01 00 00 00       	mov    $0x1,%eax
  10267b:	31 d2                	xor    %edx,%edx
  10267d:	f7 f7                	div    %edi
  10267f:	89 c5                	mov    %eax,%ebp
  102681:	89 f0                	mov    %esi,%eax
  102683:	31 d2                	xor    %edx,%edx
  102685:	f7 f5                	div    %ebp
  102687:	89 c8                	mov    %ecx,%eax
  102689:	f7 f5                	div    %ebp
  10268b:	eb a7                	jmp    102634 <__umoddi3+0x34>
  10268d:	8d 76 00             	lea    0x0(%esi),%esi
  102690:	89 c8                	mov    %ecx,%eax
  102692:	89 f2                	mov    %esi,%edx
  102694:	83 c4 1c             	add    $0x1c,%esp
  102697:	5b                   	pop    %ebx
  102698:	5e                   	pop    %esi
  102699:	5f                   	pop    %edi
  10269a:	5d                   	pop    %ebp
  10269b:	c3                   	ret    
  10269c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1026a0:	8b 34 24             	mov    (%esp),%esi
  1026a3:	bf 20 00 00 00       	mov    $0x20,%edi
  1026a8:	89 e9                	mov    %ebp,%ecx
  1026aa:	29 ef                	sub    %ebp,%edi
  1026ac:	d3 e0                	shl    %cl,%eax
  1026ae:	89 f9                	mov    %edi,%ecx
  1026b0:	89 f2                	mov    %esi,%edx
  1026b2:	d3 ea                	shr    %cl,%edx
  1026b4:	89 e9                	mov    %ebp,%ecx
  1026b6:	09 c2                	or     %eax,%edx
  1026b8:	89 d8                	mov    %ebx,%eax
  1026ba:	89 14 24             	mov    %edx,(%esp)
  1026bd:	89 f2                	mov    %esi,%edx
  1026bf:	d3 e2                	shl    %cl,%edx
  1026c1:	89 f9                	mov    %edi,%ecx
  1026c3:	89 54 24 04          	mov    %edx,0x4(%esp)
  1026c7:	8b 54 24 08          	mov    0x8(%esp),%edx
  1026cb:	d3 e8                	shr    %cl,%eax
  1026cd:	89 e9                	mov    %ebp,%ecx
  1026cf:	89 c6                	mov    %eax,%esi
  1026d1:	d3 e3                	shl    %cl,%ebx
  1026d3:	89 f9                	mov    %edi,%ecx
  1026d5:	89 d0                	mov    %edx,%eax
  1026d7:	d3 e8                	shr    %cl,%eax
  1026d9:	89 e9                	mov    %ebp,%ecx
  1026db:	09 d8                	or     %ebx,%eax
  1026dd:	89 d3                	mov    %edx,%ebx
  1026df:	89 f2                	mov    %esi,%edx
  1026e1:	f7 34 24             	divl   (%esp)
  1026e4:	89 d6                	mov    %edx,%esi
  1026e6:	d3 e3                	shl    %cl,%ebx
  1026e8:	f7 64 24 04          	mull   0x4(%esp)
  1026ec:	39 d6                	cmp    %edx,%esi
  1026ee:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  1026f2:	89 d1                	mov    %edx,%ecx
  1026f4:	89 c3                	mov    %eax,%ebx
  1026f6:	72 08                	jb     102700 <__umoddi3+0x100>
  1026f8:	75 11                	jne    10270b <__umoddi3+0x10b>
  1026fa:	39 44 24 08          	cmp    %eax,0x8(%esp)
  1026fe:	73 0b                	jae    10270b <__umoddi3+0x10b>
  102700:	2b 44 24 04          	sub    0x4(%esp),%eax
  102704:	1b 14 24             	sbb    (%esp),%edx
  102707:	89 d1                	mov    %edx,%ecx
  102709:	89 c3                	mov    %eax,%ebx
  10270b:	8b 54 24 08          	mov    0x8(%esp),%edx
  10270f:	29 da                	sub    %ebx,%edx
  102711:	19 ce                	sbb    %ecx,%esi
  102713:	89 f9                	mov    %edi,%ecx
  102715:	89 f0                	mov    %esi,%eax
  102717:	d3 e0                	shl    %cl,%eax
  102719:	89 e9                	mov    %ebp,%ecx
  10271b:	d3 ea                	shr    %cl,%edx
  10271d:	89 e9                	mov    %ebp,%ecx
  10271f:	d3 ee                	shr    %cl,%esi
  102721:	09 d0                	or     %edx,%eax
  102723:	89 f2                	mov    %esi,%edx
  102725:	83 c4 1c             	add    $0x1c,%esp
  102728:	5b                   	pop    %ebx
  102729:	5e                   	pop    %esi
  10272a:	5f                   	pop    %edi
  10272b:	5d                   	pop    %ebp
  10272c:	c3                   	ret    
  10272d:	8d 76 00             	lea    0x0(%esi),%esi
  102730:	89 f2                	mov    %esi,%edx
  102732:	29 f9                	sub    %edi,%ecx
  102734:	1b 54 24 0c          	sbb    0xc(%esp),%edx
  102738:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  10273c:	e9 1e ff ff ff       	jmp    10265f <__umoddi3+0x5f>
