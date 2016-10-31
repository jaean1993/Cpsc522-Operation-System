
obj/proc/dummy/dummy:     file format elf32-i386


Disassembly of section .text:

400000a0 <main>:
400000a0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
400000a4:	83 e4 f0             	and    $0xfffffff0,%esp
400000a7:	ff 71 fc             	pushl  -0x4(%ecx)
400000aa:	55                   	push   %ebp
400000ab:	89 e5                	mov    %esp,%ebp
400000ad:	56                   	push   %esi
400000ae:	53                   	push   %ebx
400000af:	51                   	push   %ecx
400000b0:	83 ec 18             	sub    $0x18,%esp
400000b3:	68 7c 15 00 40       	push   $0x4000157c
400000b8:	e8 23 04 00 00       	call   400004e0 <printf>
400000bd:	c7 04 24 b0 15 00 40 	movl   $0x400015b0,(%esp)
400000c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
400000c8:	e8 13 04 00 00       	call   400004e0 <printf>
400000cd:	31 f6                	xor    %esi,%esi
400000cf:	c7 04 24 58 17 00 40 	movl   $0x40001758,(%esp)
400000d6:	e8 05 04 00 00       	call   400004e0 <printf>
400000db:	83 c4 10             	add    $0x10,%esp
400000de:	e8 2d 10 00 00       	call   40001110 <sys_getc>
400000e3:	85 c0                	test   %eax,%eax
400000e5:	74 f7                	je     400000de <main+0x3e>
400000e7:	83 f8 1a             	cmp    $0x1a,%eax
400000ea:	0f 84 50 01 00 00    	je     40000240 <main+0x1a0>
400000f0:	83 f8 0a             	cmp    $0xa,%eax
400000f3:	74 2b                	je     40000120 <main+0x80>
400000f5:	83 f8 0d             	cmp    $0xd,%eax
400000f8:	74 26                	je     40000120 <main+0x80>
400000fa:	8d 50 d0             	lea    -0x30(%eax),%edx
400000fd:	83 fa 09             	cmp    $0x9,%edx
40000100:	77 dc                	ja     400000de <main+0x3e>
40000102:	81 fe 98 99 99 19    	cmp    $0x19999998,%esi
40000108:	0f 86 9a 00 00 00    	jbe    400001a8 <main+0x108>
4000010e:	83 ec 0c             	sub    $0xc,%esp
40000111:	68 97 17 00 40       	push   $0x40001797
40000116:	eb b0                	jmp    400000c8 <main+0x28>
40000118:	90                   	nop
40000119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000120:	83 ec 0c             	sub    $0xc,%esp
40000123:	68 ad 17 00 40       	push   $0x400017ad
40000128:	e8 b3 03 00 00       	call   400004e0 <printf>
4000012d:	58                   	pop    %eax
4000012e:	5a                   	pop    %edx
4000012f:	56                   	push   %esi
40000130:	68 6c 17 00 40       	push   $0x4000176c
40000135:	e8 a6 03 00 00       	call   400004e0 <printf>
4000013a:	c7 04 24 0c 16 00 40 	movl   $0x4000160c,(%esp)
40000141:	e8 9a 03 00 00       	call   400004e0 <printf>
40000146:	83 c4 10             	add    $0x10,%esp
40000149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000150:	e8 bb 0f 00 00       	call   40001110 <sys_getc>
40000155:	84 c0                	test   %al,%al
40000157:	89 c3                	mov    %eax,%ebx
40000159:	74 f5                	je     40000150 <main+0xb0>
4000015b:	83 ec 08             	sub    $0x8,%esp
4000015e:	0f be c0             	movsbl %al,%eax
40000161:	50                   	push   %eax
40000162:	68 81 17 00 40       	push   $0x40001781
40000167:	e8 74 03 00 00       	call   400004e0 <printf>
4000016c:	83 c4 10             	add    $0x10,%esp
4000016f:	80 fb 72             	cmp    $0x72,%bl
40000172:	74 54                	je     400001c8 <main+0x128>
40000174:	80 fb 77             	cmp    $0x77,%bl
40000177:	74 77                	je     400001f0 <main+0x150>
40000179:	83 ec 0c             	sub    $0xc,%esp
4000017c:	68 85 17 00 40       	push   $0x40001785
40000181:	e8 5a 03 00 00       	call   400004e0 <printf>
40000186:	c7 04 24 0c 16 00 40 	movl   $0x4000160c,(%esp)
4000018d:	e8 4e 03 00 00       	call   400004e0 <printf>
40000192:	83 c4 10             	add    $0x10,%esp
40000195:	e8 76 0f 00 00       	call   40001110 <sys_getc>
4000019a:	84 c0                	test   %al,%al
4000019c:	89 c3                	mov    %eax,%ebx
4000019e:	74 b0                	je     40000150 <main+0xb0>
400001a0:	eb b9                	jmp    4000015b <main+0xbb>
400001a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400001a8:	83 ec 08             	sub    $0x8,%esp
400001ab:	8d 14 b6             	lea    (%esi,%esi,4),%edx
400001ae:	50                   	push   %eax
400001af:	68 af 17 00 40       	push   $0x400017af
400001b4:	8d 74 50 d0          	lea    -0x30(%eax,%edx,2),%esi
400001b8:	e8 23 03 00 00       	call   400004e0 <printf>
400001bd:	83 c4 10             	add    $0x10,%esp
400001c0:	e9 19 ff ff ff       	jmp    400000de <main+0x3e>
400001c5:	8d 76 00             	lea    0x0(%esi),%esi
400001c8:	83 ec 04             	sub    $0x4,%esp
400001cb:	ff 36                	pushl  (%esi)
400001cd:	56                   	push   %esi
400001ce:	68 3c 16 00 40       	push   $0x4000163c
400001d3:	e8 08 03 00 00       	call   400004e0 <printf>
400001d8:	83 c4 10             	add    $0x10,%esp
400001db:	83 ec 0c             	sub    $0xc,%esp
400001de:	68 20 17 00 40       	push   $0x40001720
400001e3:	e9 e0 fe ff ff       	jmp    400000c8 <main+0x28>
400001e8:	90                   	nop
400001e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400001f0:	83 ec 0c             	sub    $0xc,%esp
400001f3:	68 64 16 00 40       	push   $0x40001664
400001f8:	e8 e3 02 00 00       	call   400004e0 <printf>
400001fd:	c7 04 24 98 16 00 40 	movl   $0x40001698,(%esp)
40000204:	e8 d7 02 00 00       	call   400004e0 <printf>
40000209:	83 c4 10             	add    $0x10,%esp
4000020c:	e8 ff 0e 00 00       	call   40001110 <sys_getc>
40000211:	8d 58 d0             	lea    -0x30(%eax),%ebx
40000214:	83 fb 09             	cmp    $0x9,%ebx
40000217:	77 f3                	ja     4000020c <main+0x16c>
40000219:	83 ec 08             	sub    $0x8,%esp
4000021c:	50                   	push   %eax
4000021d:	68 81 17 00 40       	push   $0x40001781
40000222:	e8 b9 02 00 00       	call   400004e0 <printf>
40000227:	89 1e                	mov    %ebx,(%esi)
40000229:	c7 04 24 b8 16 00 40 	movl   $0x400016b8,(%esp)
40000230:	e8 ab 02 00 00       	call   400004e0 <printf>
40000235:	83 c4 10             	add    $0x10,%esp
40000238:	eb a1                	jmp    400001db <main+0x13b>
4000023a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000240:	83 ec 0c             	sub    $0xc,%esp
40000243:	68 e8 15 00 40       	push   $0x400015e8
40000248:	e8 93 02 00 00       	call   400004e0 <printf>
4000024d:	83 c4 10             	add    $0x10,%esp
40000250:	8d 65 f4             	lea    -0xc(%ebp),%esp
40000253:	31 c0                	xor    %eax,%eax
40000255:	59                   	pop    %ecx
40000256:	5b                   	pop    %ebx
40000257:	5e                   	pop    %esi
40000258:	5d                   	pop    %ebp
40000259:	8d 61 fc             	lea    -0x4(%ecx),%esp
4000025c:	c3                   	ret    

4000025d <_start>:
4000025d:	60                   	pusha  
4000025e:	e8 7d 0e 00 00       	call   400010e0 <init>
40000263:	e8 38 fe ff ff       	call   400000a0 <main>
40000268:	61                   	popa   
40000269:	c3                   	ret    
4000026a:	66 90                	xchg   %ax,%ax
4000026c:	66 90                	xchg   %ax,%ax
4000026e:	66 90                	xchg   %ax,%ax

40000270 <debug>:
40000270:	83 ec 10             	sub    $0x10,%esp
40000273:	ff 74 24 18          	pushl  0x18(%esp)
40000277:	ff 74 24 18          	pushl  0x18(%esp)
4000027b:	68 e4 13 00 40       	push   $0x400013e4
40000280:	e8 5b 02 00 00       	call   400004e0 <printf>
40000285:	58                   	pop    %eax
40000286:	5a                   	pop    %edx
40000287:	8d 44 24 24          	lea    0x24(%esp),%eax
4000028b:	50                   	push   %eax
4000028c:	ff 74 24 24          	pushl  0x24(%esp)
40000290:	e8 eb 01 00 00       	call   40000480 <vcprintf>
40000295:	83 c4 1c             	add    $0x1c,%esp
40000298:	c3                   	ret    
40000299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

400002a0 <warn>:
400002a0:	83 ec 10             	sub    $0x10,%esp
400002a3:	ff 74 24 18          	pushl  0x18(%esp)
400002a7:	ff 74 24 18          	pushl  0x18(%esp)
400002ab:	68 f0 13 00 40       	push   $0x400013f0
400002b0:	e8 2b 02 00 00       	call   400004e0 <printf>
400002b5:	58                   	pop    %eax
400002b6:	5a                   	pop    %edx
400002b7:	8d 44 24 24          	lea    0x24(%esp),%eax
400002bb:	50                   	push   %eax
400002bc:	ff 74 24 24          	pushl  0x24(%esp)
400002c0:	e8 bb 01 00 00       	call   40000480 <vcprintf>
400002c5:	83 c4 1c             	add    $0x1c,%esp
400002c8:	c3                   	ret    
400002c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

400002d0 <panic>:
400002d0:	83 ec 10             	sub    $0x10,%esp
400002d3:	ff 74 24 18          	pushl  0x18(%esp)
400002d7:	ff 74 24 18          	pushl  0x18(%esp)
400002db:	68 fc 13 00 40       	push   $0x400013fc
400002e0:	e8 fb 01 00 00       	call   400004e0 <printf>
400002e5:	58                   	pop    %eax
400002e6:	5a                   	pop    %edx
400002e7:	8d 44 24 24          	lea    0x24(%esp),%eax
400002eb:	50                   	push   %eax
400002ec:	ff 74 24 24          	pushl  0x24(%esp)
400002f0:	e8 8b 01 00 00       	call   40000480 <vcprintf>
400002f5:	83 c4 10             	add    $0x10,%esp
400002f8:	90                   	nop
400002f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000300:	e8 fb 0d 00 00       	call   40001100 <yield>
40000305:	eb f9                	jmp    40000300 <panic+0x30>
40000307:	66 90                	xchg   %ax,%ax
40000309:	66 90                	xchg   %ax,%ax
4000030b:	66 90                	xchg   %ax,%ax
4000030d:	66 90                	xchg   %ax,%ax
4000030f:	90                   	nop

40000310 <atoi>:
40000310:	55                   	push   %ebp
40000311:	57                   	push   %edi
40000312:	56                   	push   %esi
40000313:	53                   	push   %ebx
40000314:	8b 74 24 14          	mov    0x14(%esp),%esi
40000318:	0f b6 06             	movzbl (%esi),%eax
4000031b:	3c 2b                	cmp    $0x2b,%al
4000031d:	74 51                	je     40000370 <atoi+0x60>
4000031f:	3c 2d                	cmp    $0x2d,%al
40000321:	0f 94 c0             	sete   %al
40000324:	0f b6 c0             	movzbl %al,%eax
40000327:	89 c5                	mov    %eax,%ebp
40000329:	89 c7                	mov    %eax,%edi
4000032b:	0f be 14 06          	movsbl (%esi,%eax,1),%edx
4000032f:	8d 42 d0             	lea    -0x30(%edx),%eax
40000332:	3c 09                	cmp    $0x9,%al
40000334:	77 4a                	ja     40000380 <atoi+0x70>
40000336:	89 f8                	mov    %edi,%eax
40000338:	31 c9                	xor    %ecx,%ecx
4000033a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000340:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
40000343:	83 c0 01             	add    $0x1,%eax
40000346:	8d 4c 4a d0          	lea    -0x30(%edx,%ecx,2),%ecx
4000034a:	0f be 14 06          	movsbl (%esi,%eax,1),%edx
4000034e:	8d 5a d0             	lea    -0x30(%edx),%ebx
40000351:	80 fb 09             	cmp    $0x9,%bl
40000354:	76 ea                	jbe    40000340 <atoi+0x30>
40000356:	39 c7                	cmp    %eax,%edi
40000358:	74 26                	je     40000380 <atoi+0x70>
4000035a:	89 ca                	mov    %ecx,%edx
4000035c:	f7 da                	neg    %edx
4000035e:	85 ed                	test   %ebp,%ebp
40000360:	0f 45 ca             	cmovne %edx,%ecx
40000363:	8b 54 24 18          	mov    0x18(%esp),%edx
40000367:	89 0a                	mov    %ecx,(%edx)
40000369:	5b                   	pop    %ebx
4000036a:	5e                   	pop    %esi
4000036b:	5f                   	pop    %edi
4000036c:	5d                   	pop    %ebp
4000036d:	c3                   	ret    
4000036e:	66 90                	xchg   %ax,%ax
40000370:	b8 01 00 00 00       	mov    $0x1,%eax
40000375:	31 ed                	xor    %ebp,%ebp
40000377:	bf 01 00 00 00       	mov    $0x1,%edi
4000037c:	eb ad                	jmp    4000032b <atoi+0x1b>
4000037e:	66 90                	xchg   %ax,%ax
40000380:	5b                   	pop    %ebx
40000381:	31 c0                	xor    %eax,%eax
40000383:	5e                   	pop    %esi
40000384:	5f                   	pop    %edi
40000385:	5d                   	pop    %ebp
40000386:	c3                   	ret    
40000387:	66 90                	xchg   %ax,%ax
40000389:	66 90                	xchg   %ax,%ax
4000038b:	66 90                	xchg   %ax,%ax
4000038d:	66 90                	xchg   %ax,%ax
4000038f:	90                   	nop

40000390 <putch>:
40000390:	53                   	push   %ebx
40000391:	83 ec 08             	sub    $0x8,%esp
40000394:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40000398:	8b 4c 24 10          	mov    0x10(%esp),%ecx
4000039c:	8b 13                	mov    (%ebx),%edx
4000039e:	8d 42 01             	lea    0x1(%edx),%eax
400003a1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
400003a6:	89 03                	mov    %eax,(%ebx)
400003a8:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
400003ac:	74 12                	je     400003c0 <putch+0x30>
400003ae:	83 43 04 01          	addl   $0x1,0x4(%ebx)
400003b2:	83 c4 08             	add    $0x8,%esp
400003b5:	5b                   	pop    %ebx
400003b6:	c3                   	ret    
400003b7:	89 f6                	mov    %esi,%esi
400003b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
400003c0:	8d 43 08             	lea    0x8(%ebx),%eax
400003c3:	83 ec 08             	sub    $0x8,%esp
400003c6:	c6 83 07 10 00 00 00 	movb   $0x0,0x1007(%ebx)
400003cd:	68 ff 0f 00 00       	push   $0xfff
400003d2:	50                   	push   %eax
400003d3:	e8 48 0d 00 00       	call   40001120 <sys_puts>
400003d8:	83 c4 10             	add    $0x10,%esp
400003db:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
400003e1:	83 43 04 01          	addl   $0x1,0x4(%ebx)
400003e5:	83 c4 08             	add    $0x8,%esp
400003e8:	5b                   	pop    %ebx
400003e9:	c3                   	ret    
400003ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

400003f0 <gets>:
400003f0:	55                   	push   %ebp
400003f1:	57                   	push   %edi
400003f2:	56                   	push   %esi
400003f3:	53                   	push   %ebx
400003f4:	31 db                	xor    %ebx,%ebx
400003f6:	83 ec 2c             	sub    $0x2c,%esp
400003f9:	8b 44 24 44          	mov    0x44(%esp),%eax
400003fd:	8b 74 24 40          	mov    0x40(%esp),%esi
40000401:	8d 7c 24 1e          	lea    0x1e(%esp),%edi
40000405:	c6 44 24 1f 00       	movb   $0x0,0x1f(%esp)
4000040a:	83 e8 01             	sub    $0x1,%eax
4000040d:	83 7c 24 44 01       	cmpl   $0x1,0x44(%esp)
40000412:	89 44 24 0c          	mov    %eax,0xc(%esp)
40000416:	7e 44                	jle    4000045c <gets+0x6c>
40000418:	90                   	nop
40000419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000420:	e8 eb 0c 00 00       	call   40001110 <sys_getc>
40000425:	84 c0                	test   %al,%al
40000427:	89 c5                	mov    %eax,%ebp
40000429:	74 f5                	je     40000420 <gets+0x30>
4000042b:	88 44 24 1e          	mov    %al,0x1e(%esp)
4000042f:	89 44 24 08          	mov    %eax,0x8(%esp)
40000433:	83 ec 08             	sub    $0x8,%esp
40000436:	6a 02                	push   $0x2
40000438:	57                   	push   %edi
40000439:	e8 e2 0c 00 00       	call   40001120 <sys_puts>
4000043e:	89 e8                	mov    %ebp,%eax
40000440:	83 c4 10             	add    $0x10,%esp
40000443:	3c 0a                	cmp    $0xa,%al
40000445:	74 26                	je     4000046d <gets+0x7d>
40000447:	3c 0d                	cmp    $0xd,%al
40000449:	8b 44 24 08          	mov    0x8(%esp),%eax
4000044d:	74 1e                	je     4000046d <gets+0x7d>
4000044f:	83 c3 01             	add    $0x1,%ebx
40000452:	3b 5c 24 0c          	cmp    0xc(%esp),%ebx
40000456:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
4000045a:	75 c4                	jne    40000420 <gets+0x30>
4000045c:	8b 44 24 44          	mov    0x44(%esp),%eax
40000460:	c6 44 06 ff 00       	movb   $0x0,-0x1(%esi,%eax,1)
40000465:	83 c4 2c             	add    $0x2c,%esp
40000468:	5b                   	pop    %ebx
40000469:	5e                   	pop    %esi
4000046a:	5f                   	pop    %edi
4000046b:	5d                   	pop    %ebp
4000046c:	c3                   	ret    
4000046d:	c6 04 1e 00          	movb   $0x0,(%esi,%ebx,1)
40000471:	83 c4 2c             	add    $0x2c,%esp
40000474:	5b                   	pop    %ebx
40000475:	5e                   	pop    %esi
40000476:	5f                   	pop    %edi
40000477:	5d                   	pop    %ebp
40000478:	c3                   	ret    
40000479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000480 <vcprintf>:
40000480:	81 ec 1c 10 00 00    	sub    $0x101c,%esp
40000486:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
4000048d:	00 
4000048e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000495:	00 
40000496:	ff b4 24 24 10 00 00 	pushl  0x1024(%esp)
4000049d:	ff b4 24 24 10 00 00 	pushl  0x1024(%esp)
400004a4:	8d 44 24 10          	lea    0x10(%esp),%eax
400004a8:	50                   	push   %eax
400004a9:	68 90 03 00 40       	push   $0x40000390
400004ae:	e8 6d 01 00 00       	call   40000620 <vprintfmt>
400004b3:	8b 44 24 18          	mov    0x18(%esp),%eax
400004b7:	c6 44 04 20 00       	movb   $0x0,0x20(%esp,%eax,1)
400004bc:	5a                   	pop    %edx
400004bd:	59                   	pop    %ecx
400004be:	50                   	push   %eax
400004bf:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400004c3:	50                   	push   %eax
400004c4:	e8 57 0c 00 00       	call   40001120 <sys_puts>
400004c9:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400004cd:	81 c4 2c 10 00 00    	add    $0x102c,%esp
400004d3:	c3                   	ret    
400004d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400004da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

400004e0 <printf>:
400004e0:	83 ec 14             	sub    $0x14,%esp
400004e3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400004e7:	50                   	push   %eax
400004e8:	ff 74 24 1c          	pushl  0x1c(%esp)
400004ec:	e8 8f ff ff ff       	call   40000480 <vcprintf>
400004f1:	83 c4 1c             	add    $0x1c,%esp
400004f4:	c3                   	ret    
400004f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
400004f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000500 <printf2>:
40000500:	83 ec 14             	sub    $0x14,%esp
40000503:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000507:	50                   	push   %eax
40000508:	ff 74 24 1c          	pushl  0x1c(%esp)
4000050c:	e8 6f ff ff ff       	call   40000480 <vcprintf>
40000511:	83 c4 1c             	add    $0x1c,%esp
40000514:	c3                   	ret    
40000515:	66 90                	xchg   %ax,%ax
40000517:	66 90                	xchg   %ax,%ax
40000519:	66 90                	xchg   %ax,%ax
4000051b:	66 90                	xchg   %ax,%ax
4000051d:	66 90                	xchg   %ax,%ax
4000051f:	90                   	nop

40000520 <printnum>:
40000520:	55                   	push   %ebp
40000521:	57                   	push   %edi
40000522:	89 d7                	mov    %edx,%edi
40000524:	56                   	push   %esi
40000525:	53                   	push   %ebx
40000526:	89 c6                	mov    %eax,%esi
40000528:	83 ec 2c             	sub    $0x2c,%esp
4000052b:	8b 54 24 44          	mov    0x44(%esp),%edx
4000052f:	8b 44 24 40          	mov    0x40(%esp),%eax
40000533:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
4000053a:	00 
4000053b:	8b 6c 24 50          	mov    0x50(%esp),%ebp
4000053f:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
40000543:	89 d1                	mov    %edx,%ecx
40000545:	39 4c 24 0c          	cmp    %ecx,0xc(%esp)
40000549:	89 c2                	mov    %eax,%edx
4000054b:	89 44 24 10          	mov    %eax,0x10(%esp)
4000054f:	8b 44 24 48          	mov    0x48(%esp),%eax
40000553:	89 4c 24 14          	mov    %ecx,0x14(%esp)
40000557:	89 6c 24 1c          	mov    %ebp,0x1c(%esp)
4000055b:	89 44 24 08          	mov    %eax,0x8(%esp)
4000055f:	73 67                	jae    400005c8 <printnum+0xa8>
40000561:	83 ec 0c             	sub    $0xc,%esp
40000564:	83 eb 01             	sub    $0x1,%ebx
40000567:	ff 74 24 28          	pushl  0x28(%esp)
4000056b:	53                   	push   %ebx
4000056c:	50                   	push   %eax
4000056d:	83 ec 08             	sub    $0x8,%esp
40000570:	ff 74 24 2c          	pushl  0x2c(%esp)
40000574:	ff 74 24 2c          	pushl  0x2c(%esp)
40000578:	ff 74 24 3c          	pushl  0x3c(%esp)
4000057c:	ff 74 24 3c          	pushl  0x3c(%esp)
40000580:	e8 eb 0b 00 00       	call   40001170 <__udivdi3>
40000585:	83 c4 18             	add    $0x18,%esp
40000588:	52                   	push   %edx
40000589:	50                   	push   %eax
4000058a:	89 fa                	mov    %edi,%edx
4000058c:	89 f0                	mov    %esi,%eax
4000058e:	e8 8d ff ff ff       	call   40000520 <printnum>
40000593:	83 c4 20             	add    $0x20,%esp
40000596:	89 7c 24 44          	mov    %edi,0x44(%esp)
4000059a:	ff 74 24 0c          	pushl  0xc(%esp)
4000059e:	ff 74 24 0c          	pushl  0xc(%esp)
400005a2:	ff 74 24 1c          	pushl  0x1c(%esp)
400005a6:	ff 74 24 1c          	pushl  0x1c(%esp)
400005aa:	e8 f1 0c 00 00       	call   400012a0 <__umoddi3>
400005af:	0f be 80 08 14 00 40 	movsbl 0x40001408(%eax),%eax
400005b6:	89 44 24 50          	mov    %eax,0x50(%esp)
400005ba:	83 c4 3c             	add    $0x3c,%esp
400005bd:	89 f0                	mov    %esi,%eax
400005bf:	5b                   	pop    %ebx
400005c0:	5e                   	pop    %esi
400005c1:	5f                   	pop    %edi
400005c2:	5d                   	pop    %ebp
400005c3:	ff e0                	jmp    *%eax
400005c5:	8d 76 00             	lea    0x0(%esi),%esi
400005c8:	76 26                	jbe    400005f0 <printnum+0xd0>
400005ca:	83 eb 01             	sub    $0x1,%ebx
400005cd:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
400005d1:	85 db                	test   %ebx,%ebx
400005d3:	7e c1                	jle    40000596 <printnum+0x76>
400005d5:	8d 76 00             	lea    0x0(%esi),%esi
400005d8:	83 ec 08             	sub    $0x8,%esp
400005db:	57                   	push   %edi
400005dc:	55                   	push   %ebp
400005dd:	ff d6                	call   *%esi
400005df:	83 c4 10             	add    $0x10,%esp
400005e2:	83 eb 01             	sub    $0x1,%ebx
400005e5:	75 f1                	jne    400005d8 <printnum+0xb8>
400005e7:	eb ad                	jmp    40000596 <printnum+0x76>
400005e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400005f0:	39 d0                	cmp    %edx,%eax
400005f2:	0f 86 69 ff ff ff    	jbe    40000561 <printnum+0x41>
400005f8:	eb d0                	jmp    400005ca <printnum+0xaa>
400005fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000600 <sprintputch>:
40000600:	8b 44 24 08          	mov    0x8(%esp),%eax
40000604:	83 40 08 01          	addl   $0x1,0x8(%eax)
40000608:	8b 10                	mov    (%eax),%edx
4000060a:	3b 50 04             	cmp    0x4(%eax),%edx
4000060d:	73 0b                	jae    4000061a <sprintputch+0x1a>
4000060f:	8d 4a 01             	lea    0x1(%edx),%ecx
40000612:	89 08                	mov    %ecx,(%eax)
40000614:	8b 44 24 04          	mov    0x4(%esp),%eax
40000618:	88 02                	mov    %al,(%edx)
4000061a:	f3 c3                	repz ret 
4000061c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000620 <vprintfmt>:
40000620:	55                   	push   %ebp
40000621:	57                   	push   %edi
40000622:	56                   	push   %esi
40000623:	53                   	push   %ebx
40000624:	83 ec 2c             	sub    $0x2c,%esp
40000627:	8b 6c 24 40          	mov    0x40(%esp),%ebp
4000062b:	8b 7c 24 44          	mov    0x44(%esp),%edi
4000062f:	8b 74 24 48          	mov    0x48(%esp),%esi
40000633:	0f b6 06             	movzbl (%esi),%eax
40000636:	8d 5e 01             	lea    0x1(%esi),%ebx
40000639:	83 f8 25             	cmp    $0x25,%eax
4000063c:	75 18                	jne    40000656 <vprintfmt+0x36>
4000063e:	eb 28                	jmp    40000668 <vprintfmt+0x48>
40000640:	83 ec 08             	sub    $0x8,%esp
40000643:	83 c3 01             	add    $0x1,%ebx
40000646:	57                   	push   %edi
40000647:	50                   	push   %eax
40000648:	ff d5                	call   *%ebp
4000064a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
4000064e:	83 c4 10             	add    $0x10,%esp
40000651:	83 f8 25             	cmp    $0x25,%eax
40000654:	74 12                	je     40000668 <vprintfmt+0x48>
40000656:	85 c0                	test   %eax,%eax
40000658:	75 e6                	jne    40000640 <vprintfmt+0x20>
4000065a:	83 c4 2c             	add    $0x2c,%esp
4000065d:	5b                   	pop    %ebx
4000065e:	5e                   	pop    %esi
4000065f:	5f                   	pop    %edi
40000660:	5d                   	pop    %ebp
40000661:	c3                   	ret    
40000662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000668:	c6 44 24 10 20       	movb   $0x20,0x10(%esp)
4000066d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
40000674:	00 
40000675:	ba ff ff ff ff       	mov    $0xffffffff,%edx
4000067a:	c7 44 24 04 ff ff ff 	movl   $0xffffffff,0x4(%esp)
40000681:	ff 
40000682:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
40000689:	00 
4000068a:	0f b6 0b             	movzbl (%ebx),%ecx
4000068d:	8d 73 01             	lea    0x1(%ebx),%esi
40000690:	8d 41 dd             	lea    -0x23(%ecx),%eax
40000693:	3c 55                	cmp    $0x55,%al
40000695:	0f 87 7e 02 00 00    	ja     40000919 <vprintfmt+0x2f9>
4000069b:	0f b6 c0             	movzbl %al,%eax
4000069e:	ff 24 85 20 14 00 40 	jmp    *0x40001420(,%eax,4)
400006a5:	89 f3                	mov    %esi,%ebx
400006a7:	c6 44 24 10 30       	movb   $0x30,0x10(%esp)
400006ac:	eb dc                	jmp    4000068a <vprintfmt+0x6a>
400006ae:	0f be 43 01          	movsbl 0x1(%ebx),%eax
400006b2:	0f b6 d1             	movzbl %cl,%edx
400006b5:	89 f3                	mov    %esi,%ebx
400006b7:	83 ea 30             	sub    $0x30,%edx
400006ba:	8d 48 d0             	lea    -0x30(%eax),%ecx
400006bd:	83 f9 09             	cmp    $0x9,%ecx
400006c0:	0f 87 14 02 00 00    	ja     400008da <vprintfmt+0x2ba>
400006c6:	8d 76 00             	lea    0x0(%esi),%esi
400006c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
400006d0:	8d 14 92             	lea    (%edx,%edx,4),%edx
400006d3:	83 c3 01             	add    $0x1,%ebx
400006d6:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
400006da:	0f be 03             	movsbl (%ebx),%eax
400006dd:	8d 48 d0             	lea    -0x30(%eax),%ecx
400006e0:	83 f9 09             	cmp    $0x9,%ecx
400006e3:	76 eb                	jbe    400006d0 <vprintfmt+0xb0>
400006e5:	e9 f0 01 00 00       	jmp    400008da <vprintfmt+0x2ba>
400006ea:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400006ee:	83 ec 08             	sub    $0x8,%esp
400006f1:	57                   	push   %edi
400006f2:	8d 58 04             	lea    0x4(%eax),%ebx
400006f5:	8b 44 24 58          	mov    0x58(%esp),%eax
400006f9:	ff 30                	pushl  (%eax)
400006fb:	ff d5                	call   *%ebp
400006fd:	83 c4 10             	add    $0x10,%esp
40000700:	89 5c 24 4c          	mov    %ebx,0x4c(%esp)
40000704:	e9 2a ff ff ff       	jmp    40000633 <vprintfmt+0x13>
40000709:	83 7c 24 14 01       	cmpl   $0x1,0x14(%esp)
4000070e:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000712:	0f 8e 06 03 00 00    	jle    40000a1e <vprintfmt+0x3fe>
40000718:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
4000071c:	8b 50 04             	mov    0x4(%eax),%edx
4000071f:	8b 00                	mov    (%eax),%eax
40000721:	83 c1 08             	add    $0x8,%ecx
40000724:	89 4c 24 4c          	mov    %ecx,0x4c(%esp)
40000728:	89 d1                	mov    %edx,%ecx
4000072a:	bb 0a 00 00 00       	mov    $0xa,%ebx
4000072f:	89 c2                	mov    %eax,%edx
40000731:	85 c9                	test   %ecx,%ecx
40000733:	0f 88 1f 03 00 00    	js     40000a58 <vprintfmt+0x438>
40000739:	83 ec 0c             	sub    $0xc,%esp
4000073c:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
40000741:	50                   	push   %eax
40000742:	ff 74 24 14          	pushl  0x14(%esp)
40000746:	89 e8                	mov    %ebp,%eax
40000748:	53                   	push   %ebx
40000749:	51                   	push   %ecx
4000074a:	52                   	push   %edx
4000074b:	89 fa                	mov    %edi,%edx
4000074d:	e8 ce fd ff ff       	call   40000520 <printnum>
40000752:	83 c4 20             	add    $0x20,%esp
40000755:	e9 d9 fe ff ff       	jmp    40000633 <vprintfmt+0x13>
4000075a:	83 44 24 14 01       	addl   $0x1,0x14(%esp)
4000075f:	89 f3                	mov    %esi,%ebx
40000761:	e9 24 ff ff ff       	jmp    4000068a <vprintfmt+0x6a>
40000766:	83 ec 08             	sub    $0x8,%esp
40000769:	57                   	push   %edi
4000076a:	6a 58                	push   $0x58
4000076c:	ff d5                	call   *%ebp
4000076e:	5b                   	pop    %ebx
4000076f:	58                   	pop    %eax
40000770:	57                   	push   %edi
40000771:	6a 58                	push   $0x58
40000773:	ff d5                	call   *%ebp
40000775:	58                   	pop    %eax
40000776:	5a                   	pop    %edx
40000777:	57                   	push   %edi
40000778:	6a 58                	push   $0x58
4000077a:	ff d5                	call   *%ebp
4000077c:	83 c4 10             	add    $0x10,%esp
4000077f:	e9 af fe ff ff       	jmp    40000633 <vprintfmt+0x13>
40000784:	83 ec 08             	sub    $0x8,%esp
40000787:	bb 10 00 00 00       	mov    $0x10,%ebx
4000078c:	57                   	push   %edi
4000078d:	6a 30                	push   $0x30
4000078f:	ff d5                	call   *%ebp
40000791:	5a                   	pop    %edx
40000792:	59                   	pop    %ecx
40000793:	57                   	push   %edi
40000794:	6a 78                	push   $0x78
40000796:	ff d5                	call   *%ebp
40000798:	8b 44 24 5c          	mov    0x5c(%esp),%eax
4000079c:	31 c9                	xor    %ecx,%ecx
4000079e:	83 c4 10             	add    $0x10,%esp
400007a1:	8b 10                	mov    (%eax),%edx
400007a3:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400007a7:	83 c0 04             	add    $0x4,%eax
400007aa:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400007ae:	eb 89                	jmp    40000739 <vprintfmt+0x119>
400007b0:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400007b4:	83 c0 04             	add    $0x4,%eax
400007b7:	89 44 24 14          	mov    %eax,0x14(%esp)
400007bb:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400007bf:	8b 00                	mov    (%eax),%eax
400007c1:	85 c0                	test   %eax,%eax
400007c3:	89 44 24 18          	mov    %eax,0x18(%esp)
400007c7:	0f 84 64 02 00 00    	je     40000a31 <vprintfmt+0x411>
400007cd:	8b 4c 24 04          	mov    0x4(%esp),%ecx
400007d1:	85 c9                	test   %ecx,%ecx
400007d3:	7e 0b                	jle    400007e0 <vprintfmt+0x1c0>
400007d5:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
400007da:	0f 85 a5 01 00 00    	jne    40000985 <vprintfmt+0x365>
400007e0:	8b 44 24 18          	mov    0x18(%esp),%eax
400007e4:	0f be 08             	movsbl (%eax),%ecx
400007e7:	8d 58 01             	lea    0x1(%eax),%ebx
400007ea:	85 c9                	test   %ecx,%ecx
400007ec:	89 c8                	mov    %ecx,%eax
400007ee:	0f 84 56 01 00 00    	je     4000094a <vprintfmt+0x32a>
400007f4:	89 7c 24 44          	mov    %edi,0x44(%esp)
400007f8:	89 74 24 48          	mov    %esi,0x48(%esp)
400007fc:	89 df                	mov    %ebx,%edi
400007fe:	8b 74 24 04          	mov    0x4(%esp),%esi
40000802:	89 d3                	mov    %edx,%ebx
40000804:	eb 2c                	jmp    40000832 <vprintfmt+0x212>
40000806:	8d 76 00             	lea    0x0(%esi),%esi
40000809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000810:	83 ec 08             	sub    $0x8,%esp
40000813:	ff 74 24 4c          	pushl  0x4c(%esp)
40000817:	51                   	push   %ecx
40000818:	ff d5                	call   *%ebp
4000081a:	83 c4 10             	add    $0x10,%esp
4000081d:	83 c7 01             	add    $0x1,%edi
40000820:	0f be 47 ff          	movsbl -0x1(%edi),%eax
40000824:	83 ee 01             	sub    $0x1,%esi
40000827:	0f be c8             	movsbl %al,%ecx
4000082a:	85 c9                	test   %ecx,%ecx
4000082c:	0f 84 0c 01 00 00    	je     4000093e <vprintfmt+0x31e>
40000832:	85 db                	test   %ebx,%ebx
40000834:	78 0c                	js     40000842 <vprintfmt+0x222>
40000836:	83 eb 01             	sub    $0x1,%ebx
40000839:	83 fb ff             	cmp    $0xffffffff,%ebx
4000083c:	0f 84 fc 00 00 00    	je     4000093e <vprintfmt+0x31e>
40000842:	8b 54 24 08          	mov    0x8(%esp),%edx
40000846:	85 d2                	test   %edx,%edx
40000848:	74 c6                	je     40000810 <vprintfmt+0x1f0>
4000084a:	83 e8 20             	sub    $0x20,%eax
4000084d:	83 f8 5e             	cmp    $0x5e,%eax
40000850:	76 be                	jbe    40000810 <vprintfmt+0x1f0>
40000852:	83 ec 08             	sub    $0x8,%esp
40000855:	ff 74 24 4c          	pushl  0x4c(%esp)
40000859:	6a 3f                	push   $0x3f
4000085b:	ff d5                	call   *%ebp
4000085d:	83 c4 10             	add    $0x10,%esp
40000860:	eb bb                	jmp    4000081d <vprintfmt+0x1fd>
40000862:	83 7c 24 14 01       	cmpl   $0x1,0x14(%esp)
40000867:	8b 44 24 4c          	mov    0x4c(%esp),%eax
4000086b:	8b 10                	mov    (%eax),%edx
4000086d:	0f 8e 98 01 00 00    	jle    40000a0b <vprintfmt+0x3eb>
40000873:	8b 48 04             	mov    0x4(%eax),%ecx
40000876:	83 c0 08             	add    $0x8,%eax
40000879:	bb 0a 00 00 00       	mov    $0xa,%ebx
4000087e:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000882:	e9 b2 fe ff ff       	jmp    40000739 <vprintfmt+0x119>
40000887:	83 7c 24 14 01       	cmpl   $0x1,0x14(%esp)
4000088c:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000890:	8b 10                	mov    (%eax),%edx
40000892:	0f 8e 60 01 00 00    	jle    400009f8 <vprintfmt+0x3d8>
40000898:	8b 48 04             	mov    0x4(%eax),%ecx
4000089b:	83 c0 08             	add    $0x8,%eax
4000089e:	bb 10 00 00 00       	mov    $0x10,%ebx
400008a3:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400008a7:	e9 8d fe ff ff       	jmp    40000739 <vprintfmt+0x119>
400008ac:	89 f3                	mov    %esi,%ebx
400008ae:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
400008b5:	00 
400008b6:	e9 cf fd ff ff       	jmp    4000068a <vprintfmt+0x6a>
400008bb:	83 ec 08             	sub    $0x8,%esp
400008be:	57                   	push   %edi
400008bf:	6a 25                	push   $0x25
400008c1:	ff d5                	call   *%ebp
400008c3:	83 c4 10             	add    $0x10,%esp
400008c6:	e9 68 fd ff ff       	jmp    40000633 <vprintfmt+0x13>
400008cb:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400008cf:	89 f3                	mov    %esi,%ebx
400008d1:	8b 10                	mov    (%eax),%edx
400008d3:	83 c0 04             	add    $0x4,%eax
400008d6:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400008da:	8b 74 24 04          	mov    0x4(%esp),%esi
400008de:	85 f6                	test   %esi,%esi
400008e0:	0f 89 a4 fd ff ff    	jns    4000068a <vprintfmt+0x6a>
400008e6:	89 54 24 04          	mov    %edx,0x4(%esp)
400008ea:	ba ff ff ff ff       	mov    $0xffffffff,%edx
400008ef:	e9 96 fd ff ff       	jmp    4000068a <vprintfmt+0x6a>
400008f4:	89 f3                	mov    %esi,%ebx
400008f6:	c6 44 24 10 2d       	movb   $0x2d,0x10(%esp)
400008fb:	e9 8a fd ff ff       	jmp    4000068a <vprintfmt+0x6a>
40000900:	8b 44 24 04          	mov    0x4(%esp),%eax
40000904:	b9 00 00 00 00       	mov    $0x0,%ecx
40000909:	89 f3                	mov    %esi,%ebx
4000090b:	85 c0                	test   %eax,%eax
4000090d:	0f 49 c8             	cmovns %eax,%ecx
40000910:	89 4c 24 04          	mov    %ecx,0x4(%esp)
40000914:	e9 71 fd ff ff       	jmp    4000068a <vprintfmt+0x6a>
40000919:	83 ec 08             	sub    $0x8,%esp
4000091c:	89 de                	mov    %ebx,%esi
4000091e:	57                   	push   %edi
4000091f:	6a 25                	push   $0x25
40000921:	ff d5                	call   *%ebp
40000923:	83 c4 10             	add    $0x10,%esp
40000926:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
4000092a:	0f 84 03 fd ff ff    	je     40000633 <vprintfmt+0x13>
40000930:	83 ee 01             	sub    $0x1,%esi
40000933:	80 7e ff 25          	cmpb   $0x25,-0x1(%esi)
40000937:	75 f7                	jne    40000930 <vprintfmt+0x310>
40000939:	e9 f5 fc ff ff       	jmp    40000633 <vprintfmt+0x13>
4000093e:	89 74 24 04          	mov    %esi,0x4(%esp)
40000942:	8b 7c 24 44          	mov    0x44(%esp),%edi
40000946:	8b 74 24 48          	mov    0x48(%esp),%esi
4000094a:	8b 4c 24 04          	mov    0x4(%esp),%ecx
4000094e:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40000952:	85 c9                	test   %ecx,%ecx
40000954:	7e 1a                	jle    40000970 <vprintfmt+0x350>
40000956:	8d 76 00             	lea    0x0(%esi),%esi
40000959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000960:	83 ec 08             	sub    $0x8,%esp
40000963:	57                   	push   %edi
40000964:	6a 20                	push   $0x20
40000966:	ff d5                	call   *%ebp
40000968:	83 c4 10             	add    $0x10,%esp
4000096b:	83 eb 01             	sub    $0x1,%ebx
4000096e:	75 f0                	jne    40000960 <vprintfmt+0x340>
40000970:	8b 44 24 14          	mov    0x14(%esp),%eax
40000974:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000978:	e9 b6 fc ff ff       	jmp    40000633 <vprintfmt+0x13>
4000097d:	c7 44 24 18 19 14 00 	movl   $0x40001419,0x18(%esp)
40000984:	40 
40000985:	83 ec 08             	sub    $0x8,%esp
40000988:	52                   	push   %edx
40000989:	89 54 24 28          	mov    %edx,0x28(%esp)
4000098d:	ff 74 24 24          	pushl  0x24(%esp)
40000991:	e8 6a 02 00 00       	call   40000c00 <strnlen>
40000996:	29 44 24 14          	sub    %eax,0x14(%esp)
4000099a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
4000099e:	83 c4 10             	add    $0x10,%esp
400009a1:	8b 54 24 1c          	mov    0x1c(%esp),%edx
400009a5:	85 c9                	test   %ecx,%ecx
400009a7:	7e 32                	jle    400009db <vprintfmt+0x3bb>
400009a9:	0f be 5c 24 10       	movsbl 0x10(%esp),%ebx
400009ae:	89 74 24 48          	mov    %esi,0x48(%esp)
400009b2:	89 ce                	mov    %ecx,%esi
400009b4:	89 54 24 10          	mov    %edx,0x10(%esp)
400009b8:	90                   	nop
400009b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400009c0:	83 ec 08             	sub    $0x8,%esp
400009c3:	57                   	push   %edi
400009c4:	53                   	push   %ebx
400009c5:	ff d5                	call   *%ebp
400009c7:	83 c4 10             	add    $0x10,%esp
400009ca:	83 ee 01             	sub    $0x1,%esi
400009cd:	75 f1                	jne    400009c0 <vprintfmt+0x3a0>
400009cf:	89 74 24 04          	mov    %esi,0x4(%esp)
400009d3:	8b 54 24 10          	mov    0x10(%esp),%edx
400009d7:	8b 74 24 48          	mov    0x48(%esp),%esi
400009db:	8b 44 24 18          	mov    0x18(%esp),%eax
400009df:	8d 58 01             	lea    0x1(%eax),%ebx
400009e2:	0f be 00             	movsbl (%eax),%eax
400009e5:	0f be c8             	movsbl %al,%ecx
400009e8:	85 c9                	test   %ecx,%ecx
400009ea:	0f 85 04 fe ff ff    	jne    400007f4 <vprintfmt+0x1d4>
400009f0:	e9 7b ff ff ff       	jmp    40000970 <vprintfmt+0x350>
400009f5:	8d 76 00             	lea    0x0(%esi),%esi
400009f8:	83 c0 04             	add    $0x4,%eax
400009fb:	31 c9                	xor    %ecx,%ecx
400009fd:	bb 10 00 00 00       	mov    $0x10,%ebx
40000a02:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000a06:	e9 2e fd ff ff       	jmp    40000739 <vprintfmt+0x119>
40000a0b:	83 c0 04             	add    $0x4,%eax
40000a0e:	31 c9                	xor    %ecx,%ecx
40000a10:	bb 0a 00 00 00       	mov    $0xa,%ebx
40000a15:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000a19:	e9 1b fd ff ff       	jmp    40000739 <vprintfmt+0x119>
40000a1e:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
40000a22:	8b 00                	mov    (%eax),%eax
40000a24:	83 c1 04             	add    $0x4,%ecx
40000a27:	99                   	cltd   
40000a28:	89 4c 24 4c          	mov    %ecx,0x4c(%esp)
40000a2c:	e9 f7 fc ff ff       	jmp    40000728 <vprintfmt+0x108>
40000a31:	8b 44 24 04          	mov    0x4(%esp),%eax
40000a35:	85 c0                	test   %eax,%eax
40000a37:	7e 0b                	jle    40000a44 <vprintfmt+0x424>
40000a39:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
40000a3e:	0f 85 39 ff ff ff    	jne    4000097d <vprintfmt+0x35d>
40000a44:	b8 28 00 00 00       	mov    $0x28,%eax
40000a49:	b9 28 00 00 00       	mov    $0x28,%ecx
40000a4e:	bb 1a 14 00 40       	mov    $0x4000141a,%ebx
40000a53:	e9 9c fd ff ff       	jmp    400007f4 <vprintfmt+0x1d4>
40000a58:	89 44 24 08          	mov    %eax,0x8(%esp)
40000a5c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
40000a60:	83 ec 08             	sub    $0x8,%esp
40000a63:	57                   	push   %edi
40000a64:	6a 2d                	push   $0x2d
40000a66:	ff d5                	call   *%ebp
40000a68:	8b 54 24 18          	mov    0x18(%esp),%edx
40000a6c:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
40000a70:	f7 da                	neg    %edx
40000a72:	83 d1 00             	adc    $0x0,%ecx
40000a75:	83 c4 10             	add    $0x10,%esp
40000a78:	f7 d9                	neg    %ecx
40000a7a:	e9 ba fc ff ff       	jmp    40000739 <vprintfmt+0x119>
40000a7f:	90                   	nop

40000a80 <printfmt>:
40000a80:	83 ec 0c             	sub    $0xc,%esp
40000a83:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000a87:	50                   	push   %eax
40000a88:	ff 74 24 1c          	pushl  0x1c(%esp)
40000a8c:	ff 74 24 1c          	pushl  0x1c(%esp)
40000a90:	ff 74 24 1c          	pushl  0x1c(%esp)
40000a94:	e8 87 fb ff ff       	call   40000620 <vprintfmt>
40000a99:	83 c4 1c             	add    $0x1c,%esp
40000a9c:	c3                   	ret    
40000a9d:	8d 76 00             	lea    0x0(%esi),%esi

40000aa0 <vsprintf>:
40000aa0:	83 ec 1c             	sub    $0x1c,%esp
40000aa3:	8b 44 24 20          	mov    0x20(%esp),%eax
40000aa7:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000aae:	ff 
40000aaf:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000ab6:	00 
40000ab7:	89 44 24 04          	mov    %eax,0x4(%esp)
40000abb:	ff 74 24 28          	pushl  0x28(%esp)
40000abf:	ff 74 24 28          	pushl  0x28(%esp)
40000ac3:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000ac7:	50                   	push   %eax
40000ac8:	68 00 06 00 40       	push   $0x40000600
40000acd:	e8 4e fb ff ff       	call   40000620 <vprintfmt>
40000ad2:	8b 44 24 14          	mov    0x14(%esp),%eax
40000ad6:	c6 00 00             	movb   $0x0,(%eax)
40000ad9:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000add:	83 c4 2c             	add    $0x2c,%esp
40000ae0:	c3                   	ret    
40000ae1:	eb 0d                	jmp    40000af0 <sprintf>
40000ae3:	90                   	nop
40000ae4:	90                   	nop
40000ae5:	90                   	nop
40000ae6:	90                   	nop
40000ae7:	90                   	nop
40000ae8:	90                   	nop
40000ae9:	90                   	nop
40000aea:	90                   	nop
40000aeb:	90                   	nop
40000aec:	90                   	nop
40000aed:	90                   	nop
40000aee:	90                   	nop
40000aef:	90                   	nop

40000af0 <sprintf>:
40000af0:	83 ec 1c             	sub    $0x1c,%esp
40000af3:	8b 44 24 20          	mov    0x20(%esp),%eax
40000af7:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000afe:	ff 
40000aff:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000b06:	00 
40000b07:	89 44 24 04          	mov    %eax,0x4(%esp)
40000b0b:	8d 44 24 28          	lea    0x28(%esp),%eax
40000b0f:	50                   	push   %eax
40000b10:	ff 74 24 28          	pushl  0x28(%esp)
40000b14:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000b18:	50                   	push   %eax
40000b19:	68 00 06 00 40       	push   $0x40000600
40000b1e:	e8 fd fa ff ff       	call   40000620 <vprintfmt>
40000b23:	8b 44 24 14          	mov    0x14(%esp),%eax
40000b27:	c6 00 00             	movb   $0x0,(%eax)
40000b2a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000b2e:	83 c4 2c             	add    $0x2c,%esp
40000b31:	c3                   	ret    
40000b32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000b40 <vsnprintf>:
40000b40:	83 ec 1c             	sub    $0x1c,%esp
40000b43:	8b 44 24 20          	mov    0x20(%esp),%eax
40000b47:	8b 54 24 24          	mov    0x24(%esp),%edx
40000b4b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000b52:	00 
40000b53:	89 44 24 04          	mov    %eax,0x4(%esp)
40000b57:	8d 44 10 ff          	lea    -0x1(%eax,%edx,1),%eax
40000b5b:	89 44 24 08          	mov    %eax,0x8(%esp)
40000b5f:	ff 74 24 2c          	pushl  0x2c(%esp)
40000b63:	ff 74 24 2c          	pushl  0x2c(%esp)
40000b67:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000b6b:	50                   	push   %eax
40000b6c:	68 00 06 00 40       	push   $0x40000600
40000b71:	e8 aa fa ff ff       	call   40000620 <vprintfmt>
40000b76:	8b 44 24 14          	mov    0x14(%esp),%eax
40000b7a:	c6 00 00             	movb   $0x0,(%eax)
40000b7d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000b81:	83 c4 2c             	add    $0x2c,%esp
40000b84:	c3                   	ret    
40000b85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000b90 <snprintf>:
40000b90:	83 ec 1c             	sub    $0x1c,%esp
40000b93:	8b 44 24 20          	mov    0x20(%esp),%eax
40000b97:	8b 54 24 24          	mov    0x24(%esp),%edx
40000b9b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000ba2:	00 
40000ba3:	89 44 24 04          	mov    %eax,0x4(%esp)
40000ba7:	8d 44 10 ff          	lea    -0x1(%eax,%edx,1),%eax
40000bab:	89 44 24 08          	mov    %eax,0x8(%esp)
40000baf:	8d 44 24 2c          	lea    0x2c(%esp),%eax
40000bb3:	50                   	push   %eax
40000bb4:	ff 74 24 2c          	pushl  0x2c(%esp)
40000bb8:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000bbc:	50                   	push   %eax
40000bbd:	68 00 06 00 40       	push   $0x40000600
40000bc2:	e8 59 fa ff ff       	call   40000620 <vprintfmt>
40000bc7:	8b 44 24 14          	mov    0x14(%esp),%eax
40000bcb:	c6 00 00             	movb   $0x0,(%eax)
40000bce:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000bd2:	83 c4 2c             	add    $0x2c,%esp
40000bd5:	c3                   	ret    
40000bd6:	66 90                	xchg   %ax,%ax
40000bd8:	66 90                	xchg   %ax,%ax
40000bda:	66 90                	xchg   %ax,%ax
40000bdc:	66 90                	xchg   %ax,%ax
40000bde:	66 90                	xchg   %ax,%ax

40000be0 <strlen>:
40000be0:	8b 54 24 04          	mov    0x4(%esp),%edx
40000be4:	31 c0                	xor    %eax,%eax
40000be6:	80 3a 00             	cmpb   $0x0,(%edx)
40000be9:	74 10                	je     40000bfb <strlen+0x1b>
40000beb:	90                   	nop
40000bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000bf0:	83 c0 01             	add    $0x1,%eax
40000bf3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
40000bf7:	75 f7                	jne    40000bf0 <strlen+0x10>
40000bf9:	f3 c3                	repz ret 
40000bfb:	f3 c3                	repz ret 
40000bfd:	8d 76 00             	lea    0x0(%esi),%esi

40000c00 <strnlen>:
40000c00:	8b 54 24 08          	mov    0x8(%esp),%edx
40000c04:	31 c0                	xor    %eax,%eax
40000c06:	8b 4c 24 04          	mov    0x4(%esp),%ecx
40000c0a:	85 d2                	test   %edx,%edx
40000c0c:	74 24                	je     40000c32 <strnlen+0x32>
40000c0e:	80 39 00             	cmpb   $0x0,(%ecx)
40000c11:	75 0b                	jne    40000c1e <strnlen+0x1e>
40000c13:	eb 10                	jmp    40000c25 <strnlen+0x25>
40000c15:	8d 76 00             	lea    0x0(%esi),%esi
40000c18:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
40000c1c:	74 12                	je     40000c30 <strnlen+0x30>
40000c1e:	83 c0 01             	add    $0x1,%eax
40000c21:	39 c2                	cmp    %eax,%edx
40000c23:	75 f3                	jne    40000c18 <strnlen+0x18>
40000c25:	f3 c3                	repz ret 
40000c27:	89 f6                	mov    %esi,%esi
40000c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000c30:	f3 c3                	repz ret 
40000c32:	f3 c3                	repz ret 
40000c34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000c3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

40000c40 <strcpy>:
40000c40:	53                   	push   %ebx
40000c41:	8b 44 24 08          	mov    0x8(%esp),%eax
40000c45:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000c49:	89 c2                	mov    %eax,%edx
40000c4b:	90                   	nop
40000c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000c50:	83 c1 01             	add    $0x1,%ecx
40000c53:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
40000c57:	83 c2 01             	add    $0x1,%edx
40000c5a:	84 db                	test   %bl,%bl
40000c5c:	88 5a ff             	mov    %bl,-0x1(%edx)
40000c5f:	75 ef                	jne    40000c50 <strcpy+0x10>
40000c61:	5b                   	pop    %ebx
40000c62:	c3                   	ret    
40000c63:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000c70 <strncpy>:
40000c70:	57                   	push   %edi
40000c71:	56                   	push   %esi
40000c72:	53                   	push   %ebx
40000c73:	8b 74 24 18          	mov    0x18(%esp),%esi
40000c77:	8b 7c 24 10          	mov    0x10(%esp),%edi
40000c7b:	8b 4c 24 14          	mov    0x14(%esp),%ecx
40000c7f:	85 f6                	test   %esi,%esi
40000c81:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
40000c84:	74 1d                	je     40000ca3 <strncpy+0x33>
40000c86:	89 fa                	mov    %edi,%edx
40000c88:	90                   	nop
40000c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000c90:	0f b6 01             	movzbl (%ecx),%eax
40000c93:	83 c2 01             	add    $0x1,%edx
40000c96:	88 42 ff             	mov    %al,-0x1(%edx)
40000c99:	80 39 01             	cmpb   $0x1,(%ecx)
40000c9c:	83 d9 ff             	sbb    $0xffffffff,%ecx
40000c9f:	39 d3                	cmp    %edx,%ebx
40000ca1:	75 ed                	jne    40000c90 <strncpy+0x20>
40000ca3:	89 f8                	mov    %edi,%eax
40000ca5:	5b                   	pop    %ebx
40000ca6:	5e                   	pop    %esi
40000ca7:	5f                   	pop    %edi
40000ca8:	c3                   	ret    
40000ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000cb0 <strlcpy>:
40000cb0:	53                   	push   %ebx
40000cb1:	8b 54 24 10          	mov    0x10(%esp),%edx
40000cb5:	31 c0                	xor    %eax,%eax
40000cb7:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000cbb:	85 d2                	test   %edx,%edx
40000cbd:	74 3f                	je     40000cfe <strlcpy+0x4e>
40000cbf:	89 d0                	mov    %edx,%eax
40000cc1:	83 e8 01             	sub    $0x1,%eax
40000cc4:	74 3a                	je     40000d00 <strlcpy+0x50>
40000cc6:	0f b6 19             	movzbl (%ecx),%ebx
40000cc9:	84 db                	test   %bl,%bl
40000ccb:	74 39                	je     40000d06 <strlcpy+0x56>
40000ccd:	8d 51 01             	lea    0x1(%ecx),%edx
40000cd0:	01 c8                	add    %ecx,%eax
40000cd2:	8b 4c 24 08          	mov    0x8(%esp),%ecx
40000cd6:	eb 13                	jmp    40000ceb <strlcpy+0x3b>
40000cd8:	90                   	nop
40000cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000ce0:	83 c2 01             	add    $0x1,%edx
40000ce3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
40000ce7:	84 db                	test   %bl,%bl
40000ce9:	74 0a                	je     40000cf5 <strlcpy+0x45>
40000ceb:	83 c1 01             	add    $0x1,%ecx
40000cee:	39 c2                	cmp    %eax,%edx
40000cf0:	88 59 ff             	mov    %bl,-0x1(%ecx)
40000cf3:	75 eb                	jne    40000ce0 <strlcpy+0x30>
40000cf5:	89 c8                	mov    %ecx,%eax
40000cf7:	2b 44 24 08          	sub    0x8(%esp),%eax
40000cfb:	c6 01 00             	movb   $0x0,(%ecx)
40000cfe:	5b                   	pop    %ebx
40000cff:	c3                   	ret    
40000d00:	8b 4c 24 08          	mov    0x8(%esp),%ecx
40000d04:	eb f5                	jmp    40000cfb <strlcpy+0x4b>
40000d06:	8b 4c 24 08          	mov    0x8(%esp),%ecx
40000d0a:	31 c0                	xor    %eax,%eax
40000d0c:	eb ed                	jmp    40000cfb <strlcpy+0x4b>
40000d0e:	66 90                	xchg   %ax,%ax

40000d10 <strcmp>:
40000d10:	56                   	push   %esi
40000d11:	53                   	push   %ebx
40000d12:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000d16:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000d1a:	0f b6 02             	movzbl (%edx),%eax
40000d1d:	0f b6 19             	movzbl (%ecx),%ebx
40000d20:	84 c0                	test   %al,%al
40000d22:	75 1f                	jne    40000d43 <strcmp+0x33>
40000d24:	eb 2a                	jmp    40000d50 <strcmp+0x40>
40000d26:	8d 76 00             	lea    0x0(%esi),%esi
40000d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000d30:	83 c2 01             	add    $0x1,%edx
40000d33:	0f b6 02             	movzbl (%edx),%eax
40000d36:	8d 71 01             	lea    0x1(%ecx),%esi
40000d39:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
40000d3d:	84 c0                	test   %al,%al
40000d3f:	74 0f                	je     40000d50 <strcmp+0x40>
40000d41:	89 f1                	mov    %esi,%ecx
40000d43:	38 d8                	cmp    %bl,%al
40000d45:	74 e9                	je     40000d30 <strcmp+0x20>
40000d47:	29 d8                	sub    %ebx,%eax
40000d49:	5b                   	pop    %ebx
40000d4a:	5e                   	pop    %esi
40000d4b:	c3                   	ret    
40000d4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000d50:	31 c0                	xor    %eax,%eax
40000d52:	29 d8                	sub    %ebx,%eax
40000d54:	5b                   	pop    %ebx
40000d55:	5e                   	pop    %esi
40000d56:	c3                   	ret    
40000d57:	89 f6                	mov    %esi,%esi
40000d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000d60 <strncmp>:
40000d60:	57                   	push   %edi
40000d61:	56                   	push   %esi
40000d62:	53                   	push   %ebx
40000d63:	8b 7c 24 18          	mov    0x18(%esp),%edi
40000d67:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000d6b:	8b 74 24 14          	mov    0x14(%esp),%esi
40000d6f:	85 ff                	test   %edi,%edi
40000d71:	74 2f                	je     40000da2 <strncmp+0x42>
40000d73:	0f b6 11             	movzbl (%ecx),%edx
40000d76:	0f b6 1e             	movzbl (%esi),%ebx
40000d79:	84 d2                	test   %dl,%dl
40000d7b:	74 37                	je     40000db4 <strncmp+0x54>
40000d7d:	38 d3                	cmp    %dl,%bl
40000d7f:	75 33                	jne    40000db4 <strncmp+0x54>
40000d81:	01 f7                	add    %esi,%edi
40000d83:	eb 13                	jmp    40000d98 <strncmp+0x38>
40000d85:	8d 76 00             	lea    0x0(%esi),%esi
40000d88:	0f b6 11             	movzbl (%ecx),%edx
40000d8b:	84 d2                	test   %dl,%dl
40000d8d:	74 21                	je     40000db0 <strncmp+0x50>
40000d8f:	0f b6 18             	movzbl (%eax),%ebx
40000d92:	89 c6                	mov    %eax,%esi
40000d94:	38 da                	cmp    %bl,%dl
40000d96:	75 1c                	jne    40000db4 <strncmp+0x54>
40000d98:	8d 46 01             	lea    0x1(%esi),%eax
40000d9b:	83 c1 01             	add    $0x1,%ecx
40000d9e:	39 f8                	cmp    %edi,%eax
40000da0:	75 e6                	jne    40000d88 <strncmp+0x28>
40000da2:	5b                   	pop    %ebx
40000da3:	31 c0                	xor    %eax,%eax
40000da5:	5e                   	pop    %esi
40000da6:	5f                   	pop    %edi
40000da7:	c3                   	ret    
40000da8:	90                   	nop
40000da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000db0:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
40000db4:	0f b6 c2             	movzbl %dl,%eax
40000db7:	29 d8                	sub    %ebx,%eax
40000db9:	5b                   	pop    %ebx
40000dba:	5e                   	pop    %esi
40000dbb:	5f                   	pop    %edi
40000dbc:	c3                   	ret    
40000dbd:	8d 76 00             	lea    0x0(%esi),%esi

40000dc0 <strchr>:
40000dc0:	53                   	push   %ebx
40000dc1:	8b 44 24 08          	mov    0x8(%esp),%eax
40000dc5:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000dc9:	0f b6 10             	movzbl (%eax),%edx
40000dcc:	84 d2                	test   %dl,%dl
40000dce:	74 1e                	je     40000dee <strchr+0x2e>
40000dd0:	38 d3                	cmp    %dl,%bl
40000dd2:	89 d9                	mov    %ebx,%ecx
40000dd4:	75 0e                	jne    40000de4 <strchr+0x24>
40000dd6:	eb 18                	jmp    40000df0 <strchr+0x30>
40000dd8:	90                   	nop
40000dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000de0:	38 ca                	cmp    %cl,%dl
40000de2:	74 0c                	je     40000df0 <strchr+0x30>
40000de4:	83 c0 01             	add    $0x1,%eax
40000de7:	0f b6 10             	movzbl (%eax),%edx
40000dea:	84 d2                	test   %dl,%dl
40000dec:	75 f2                	jne    40000de0 <strchr+0x20>
40000dee:	31 c0                	xor    %eax,%eax
40000df0:	5b                   	pop    %ebx
40000df1:	c3                   	ret    
40000df2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000e00 <strfind>:
40000e00:	53                   	push   %ebx
40000e01:	8b 44 24 08          	mov    0x8(%esp),%eax
40000e05:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000e09:	0f b6 18             	movzbl (%eax),%ebx
40000e0c:	38 d3                	cmp    %dl,%bl
40000e0e:	74 1e                	je     40000e2e <strfind+0x2e>
40000e10:	84 db                	test   %bl,%bl
40000e12:	89 d1                	mov    %edx,%ecx
40000e14:	75 0e                	jne    40000e24 <strfind+0x24>
40000e16:	eb 16                	jmp    40000e2e <strfind+0x2e>
40000e18:	90                   	nop
40000e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000e20:	84 d2                	test   %dl,%dl
40000e22:	74 0a                	je     40000e2e <strfind+0x2e>
40000e24:	83 c0 01             	add    $0x1,%eax
40000e27:	0f b6 10             	movzbl (%eax),%edx
40000e2a:	38 ca                	cmp    %cl,%dl
40000e2c:	75 f2                	jne    40000e20 <strfind+0x20>
40000e2e:	5b                   	pop    %ebx
40000e2f:	c3                   	ret    

40000e30 <strtol>:
40000e30:	55                   	push   %ebp
40000e31:	57                   	push   %edi
40000e32:	56                   	push   %esi
40000e33:	53                   	push   %ebx
40000e34:	83 ec 04             	sub    $0x4,%esp
40000e37:	8b 44 24 20          	mov    0x20(%esp),%eax
40000e3b:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000e3f:	8b 74 24 1c          	mov    0x1c(%esp),%esi
40000e43:	89 04 24             	mov    %eax,(%esp)
40000e46:	0f b6 01             	movzbl (%ecx),%eax
40000e49:	3c 20                	cmp    $0x20,%al
40000e4b:	75 0d                	jne    40000e5a <strtol+0x2a>
40000e4d:	8d 76 00             	lea    0x0(%esi),%esi
40000e50:	83 c1 01             	add    $0x1,%ecx
40000e53:	0f b6 01             	movzbl (%ecx),%eax
40000e56:	3c 20                	cmp    $0x20,%al
40000e58:	74 f6                	je     40000e50 <strtol+0x20>
40000e5a:	3c 09                	cmp    $0x9,%al
40000e5c:	74 f2                	je     40000e50 <strtol+0x20>
40000e5e:	3c 2b                	cmp    $0x2b,%al
40000e60:	0f 84 9a 00 00 00    	je     40000f00 <strtol+0xd0>
40000e66:	31 ff                	xor    %edi,%edi
40000e68:	3c 2d                	cmp    $0x2d,%al
40000e6a:	0f 84 a0 00 00 00    	je     40000f10 <strtol+0xe0>
40000e70:	f7 04 24 ef ff ff ff 	testl  $0xffffffef,(%esp)
40000e77:	0f be 11             	movsbl (%ecx),%edx
40000e7a:	75 19                	jne    40000e95 <strtol+0x65>
40000e7c:	80 fa 30             	cmp    $0x30,%dl
40000e7f:	0f 84 98 00 00 00    	je     40000f1d <strtol+0xed>
40000e85:	8b 1c 24             	mov    (%esp),%ebx
40000e88:	b8 0a 00 00 00       	mov    $0xa,%eax
40000e8d:	85 db                	test   %ebx,%ebx
40000e8f:	0f 45 c3             	cmovne %ebx,%eax
40000e92:	89 04 24             	mov    %eax,(%esp)
40000e95:	31 c0                	xor    %eax,%eax
40000e97:	eb 1c                	jmp    40000eb5 <strtol+0x85>
40000e99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000ea0:	83 ea 30             	sub    $0x30,%edx
40000ea3:	8b 1c 24             	mov    (%esp),%ebx
40000ea6:	39 da                	cmp    %ebx,%edx
40000ea8:	7d 29                	jge    40000ed3 <strtol+0xa3>
40000eaa:	0f af c3             	imul   %ebx,%eax
40000ead:	83 c1 01             	add    $0x1,%ecx
40000eb0:	01 d0                	add    %edx,%eax
40000eb2:	0f be 11             	movsbl (%ecx),%edx
40000eb5:	8d 6a d0             	lea    -0x30(%edx),%ebp
40000eb8:	89 eb                	mov    %ebp,%ebx
40000eba:	80 fb 09             	cmp    $0x9,%bl
40000ebd:	76 e1                	jbe    40000ea0 <strtol+0x70>
40000ebf:	8d 6a 9f             	lea    -0x61(%edx),%ebp
40000ec2:	89 eb                	mov    %ebp,%ebx
40000ec4:	80 fb 19             	cmp    $0x19,%bl
40000ec7:	77 27                	ja     40000ef0 <strtol+0xc0>
40000ec9:	8b 1c 24             	mov    (%esp),%ebx
40000ecc:	83 ea 57             	sub    $0x57,%edx
40000ecf:	39 da                	cmp    %ebx,%edx
40000ed1:	7c d7                	jl     40000eaa <strtol+0x7a>
40000ed3:	85 f6                	test   %esi,%esi
40000ed5:	74 02                	je     40000ed9 <strtol+0xa9>
40000ed7:	89 0e                	mov    %ecx,(%esi)
40000ed9:	89 c2                	mov    %eax,%edx
40000edb:	f7 da                	neg    %edx
40000edd:	85 ff                	test   %edi,%edi
40000edf:	0f 45 c2             	cmovne %edx,%eax
40000ee2:	83 c4 04             	add    $0x4,%esp
40000ee5:	5b                   	pop    %ebx
40000ee6:	5e                   	pop    %esi
40000ee7:	5f                   	pop    %edi
40000ee8:	5d                   	pop    %ebp
40000ee9:	c3                   	ret    
40000eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000ef0:	8d 6a bf             	lea    -0x41(%edx),%ebp
40000ef3:	89 eb                	mov    %ebp,%ebx
40000ef5:	80 fb 19             	cmp    $0x19,%bl
40000ef8:	77 d9                	ja     40000ed3 <strtol+0xa3>
40000efa:	83 ea 37             	sub    $0x37,%edx
40000efd:	eb a4                	jmp    40000ea3 <strtol+0x73>
40000eff:	90                   	nop
40000f00:	83 c1 01             	add    $0x1,%ecx
40000f03:	31 ff                	xor    %edi,%edi
40000f05:	e9 66 ff ff ff       	jmp    40000e70 <strtol+0x40>
40000f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000f10:	83 c1 01             	add    $0x1,%ecx
40000f13:	bf 01 00 00 00       	mov    $0x1,%edi
40000f18:	e9 53 ff ff ff       	jmp    40000e70 <strtol+0x40>
40000f1d:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
40000f21:	3c 78                	cmp    $0x78,%al
40000f23:	74 1d                	je     40000f42 <strtol+0x112>
40000f25:	8b 1c 24             	mov    (%esp),%ebx
40000f28:	85 db                	test   %ebx,%ebx
40000f2a:	0f 85 65 ff ff ff    	jne    40000e95 <strtol+0x65>
40000f30:	83 c1 01             	add    $0x1,%ecx
40000f33:	0f be d0             	movsbl %al,%edx
40000f36:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
40000f3d:	e9 53 ff ff ff       	jmp    40000e95 <strtol+0x65>
40000f42:	0f be 51 02          	movsbl 0x2(%ecx),%edx
40000f46:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
40000f4d:	83 c1 02             	add    $0x2,%ecx
40000f50:	e9 40 ff ff ff       	jmp    40000e95 <strtol+0x65>
40000f55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000f60 <memset>:
40000f60:	57                   	push   %edi
40000f61:	56                   	push   %esi
40000f62:	53                   	push   %ebx
40000f63:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000f67:	8b 7c 24 10          	mov    0x10(%esp),%edi
40000f6b:	85 c9                	test   %ecx,%ecx
40000f6d:	74 14                	je     40000f83 <memset+0x23>
40000f6f:	f7 c7 03 00 00 00    	test   $0x3,%edi
40000f75:	75 05                	jne    40000f7c <memset+0x1c>
40000f77:	f6 c1 03             	test   $0x3,%cl
40000f7a:	74 14                	je     40000f90 <memset+0x30>
40000f7c:	8b 44 24 14          	mov    0x14(%esp),%eax
40000f80:	fc                   	cld    
40000f81:	f3 aa                	rep stos %al,%es:(%edi)
40000f83:	89 f8                	mov    %edi,%eax
40000f85:	5b                   	pop    %ebx
40000f86:	5e                   	pop    %esi
40000f87:	5f                   	pop    %edi
40000f88:	c3                   	ret    
40000f89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000f90:	0f b6 54 24 14       	movzbl 0x14(%esp),%edx
40000f95:	c1 e9 02             	shr    $0x2,%ecx
40000f98:	89 d0                	mov    %edx,%eax
40000f9a:	89 d6                	mov    %edx,%esi
40000f9c:	89 d3                	mov    %edx,%ebx
40000f9e:	c1 e0 18             	shl    $0x18,%eax
40000fa1:	c1 e6 10             	shl    $0x10,%esi
40000fa4:	c1 e3 08             	shl    $0x8,%ebx
40000fa7:	09 f0                	or     %esi,%eax
40000fa9:	09 d0                	or     %edx,%eax
40000fab:	09 d8                	or     %ebx,%eax
40000fad:	fc                   	cld    
40000fae:	f3 ab                	rep stos %eax,%es:(%edi)
40000fb0:	89 f8                	mov    %edi,%eax
40000fb2:	5b                   	pop    %ebx
40000fb3:	5e                   	pop    %esi
40000fb4:	5f                   	pop    %edi
40000fb5:	c3                   	ret    
40000fb6:	8d 76 00             	lea    0x0(%esi),%esi
40000fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000fc0 <memmove>:
40000fc0:	57                   	push   %edi
40000fc1:	56                   	push   %esi
40000fc2:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000fc6:	8b 74 24 10          	mov    0x10(%esp),%esi
40000fca:	8b 4c 24 14          	mov    0x14(%esp),%ecx
40000fce:	39 c6                	cmp    %eax,%esi
40000fd0:	73 26                	jae    40000ff8 <memmove+0x38>
40000fd2:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40000fd5:	39 d0                	cmp    %edx,%eax
40000fd7:	73 1f                	jae    40000ff8 <memmove+0x38>
40000fd9:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
40000fdc:	89 d6                	mov    %edx,%esi
40000fde:	09 fe                	or     %edi,%esi
40000fe0:	83 e6 03             	and    $0x3,%esi
40000fe3:	74 3b                	je     40001020 <memmove+0x60>
40000fe5:	83 ef 01             	sub    $0x1,%edi
40000fe8:	8d 72 ff             	lea    -0x1(%edx),%esi
40000feb:	fd                   	std    
40000fec:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
40000fee:	fc                   	cld    
40000fef:	5e                   	pop    %esi
40000ff0:	5f                   	pop    %edi
40000ff1:	c3                   	ret    
40000ff2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000ff8:	89 f2                	mov    %esi,%edx
40000ffa:	09 c2                	or     %eax,%edx
40000ffc:	83 e2 03             	and    $0x3,%edx
40000fff:	75 0f                	jne    40001010 <memmove+0x50>
40001001:	f6 c1 03             	test   $0x3,%cl
40001004:	75 0a                	jne    40001010 <memmove+0x50>
40001006:	c1 e9 02             	shr    $0x2,%ecx
40001009:	89 c7                	mov    %eax,%edi
4000100b:	fc                   	cld    
4000100c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
4000100e:	eb 05                	jmp    40001015 <memmove+0x55>
40001010:	89 c7                	mov    %eax,%edi
40001012:	fc                   	cld    
40001013:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
40001015:	5e                   	pop    %esi
40001016:	5f                   	pop    %edi
40001017:	c3                   	ret    
40001018:	90                   	nop
40001019:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001020:	f6 c1 03             	test   $0x3,%cl
40001023:	75 c0                	jne    40000fe5 <memmove+0x25>
40001025:	83 ef 04             	sub    $0x4,%edi
40001028:	8d 72 fc             	lea    -0x4(%edx),%esi
4000102b:	c1 e9 02             	shr    $0x2,%ecx
4000102e:	fd                   	std    
4000102f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40001031:	eb bb                	jmp    40000fee <memmove+0x2e>
40001033:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40001040 <memcpy>:
40001040:	e9 7b ff ff ff       	jmp    40000fc0 <memmove>
40001045:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40001050 <memcmp>:
40001050:	57                   	push   %edi
40001051:	56                   	push   %esi
40001052:	53                   	push   %ebx
40001053:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40001057:	8b 74 24 10          	mov    0x10(%esp),%esi
4000105b:	8b 7c 24 14          	mov    0x14(%esp),%edi
4000105f:	85 db                	test   %ebx,%ebx
40001061:	74 29                	je     4000108c <memcmp+0x3c>
40001063:	0f b6 16             	movzbl (%esi),%edx
40001066:	0f b6 0f             	movzbl (%edi),%ecx
40001069:	38 d1                	cmp    %dl,%cl
4000106b:	75 2b                	jne    40001098 <memcmp+0x48>
4000106d:	b8 01 00 00 00       	mov    $0x1,%eax
40001072:	eb 14                	jmp    40001088 <memcmp+0x38>
40001074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001078:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
4000107c:	83 c0 01             	add    $0x1,%eax
4000107f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
40001084:	38 ca                	cmp    %cl,%dl
40001086:	75 10                	jne    40001098 <memcmp+0x48>
40001088:	39 d8                	cmp    %ebx,%eax
4000108a:	75 ec                	jne    40001078 <memcmp+0x28>
4000108c:	5b                   	pop    %ebx
4000108d:	31 c0                	xor    %eax,%eax
4000108f:	5e                   	pop    %esi
40001090:	5f                   	pop    %edi
40001091:	c3                   	ret    
40001092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001098:	0f b6 c2             	movzbl %dl,%eax
4000109b:	5b                   	pop    %ebx
4000109c:	29 c8                	sub    %ecx,%eax
4000109e:	5e                   	pop    %esi
4000109f:	5f                   	pop    %edi
400010a0:	c3                   	ret    
400010a1:	eb 0d                	jmp    400010b0 <memchr>
400010a3:	90                   	nop
400010a4:	90                   	nop
400010a5:	90                   	nop
400010a6:	90                   	nop
400010a7:	90                   	nop
400010a8:	90                   	nop
400010a9:	90                   	nop
400010aa:	90                   	nop
400010ab:	90                   	nop
400010ac:	90                   	nop
400010ad:	90                   	nop
400010ae:	90                   	nop
400010af:	90                   	nop

400010b0 <memchr>:
400010b0:	53                   	push   %ebx
400010b1:	8b 44 24 08          	mov    0x8(%esp),%eax
400010b5:	8b 54 24 10          	mov    0x10(%esp),%edx
400010b9:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
400010bd:	01 c2                	add    %eax,%edx
400010bf:	39 d0                	cmp    %edx,%eax
400010c1:	73 18                	jae    400010db <memchr+0x2b>
400010c3:	38 18                	cmp    %bl,(%eax)
400010c5:	89 d9                	mov    %ebx,%ecx
400010c7:	75 0b                	jne    400010d4 <memchr+0x24>
400010c9:	eb 12                	jmp    400010dd <memchr+0x2d>
400010cb:	90                   	nop
400010cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
400010d0:	38 08                	cmp    %cl,(%eax)
400010d2:	74 09                	je     400010dd <memchr+0x2d>
400010d4:	83 c0 01             	add    $0x1,%eax
400010d7:	39 c2                	cmp    %eax,%edx
400010d9:	75 f5                	jne    400010d0 <memchr+0x20>
400010db:	31 c0                	xor    %eax,%eax
400010dd:	5b                   	pop    %ebx
400010de:	c3                   	ret    
400010df:	90                   	nop

400010e0 <init>:
400010e0:	a1 00 00 00 e0       	mov    0xe0000000,%eax
400010e5:	a3 20 44 00 40       	mov    %eax,0x40004420
400010ea:	a1 04 00 00 e0       	mov    0xe0000004,%eax
400010ef:	a3 00 40 00 40       	mov    %eax,0x40004000
400010f4:	c3                   	ret    
400010f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
400010f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40001100 <yield>:
40001100:	f3 c3                	repz ret 
40001102:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40001110 <sys_getc>:
40001110:	83 ec 0c             	sub    $0xc,%esp
40001113:	ff 15 00 40 00 40    	call   *0x40004000
40001119:	83 c4 0c             	add    $0xc,%esp
4000111c:	0f be c0             	movsbl %al,%eax
4000111f:	c3                   	ret    

40001120 <sys_puts>:
40001120:	56                   	push   %esi
40001121:	53                   	push   %ebx
40001122:	b8 ff 03 00 00       	mov    $0x3ff,%eax
40001127:	83 ec 08             	sub    $0x8,%esp
4000112a:	8b 5c 24 18          	mov    0x18(%esp),%ebx
4000112e:	8b 74 24 14          	mov    0x14(%esp),%esi
40001132:	81 fb ff 03 00 00    	cmp    $0x3ff,%ebx
40001138:	0f 47 d8             	cmova  %eax,%ebx
4000113b:	53                   	push   %ebx
4000113c:	56                   	push   %esi
4000113d:	68 20 40 00 40       	push   $0x40004020
40001142:	e8 29 fb ff ff       	call   40000c70 <strncpy>
40001147:	c6 83 20 40 00 40 00 	movb   $0x0,0x40004020(%ebx)
4000114e:	89 74 24 24          	mov    %esi,0x24(%esp)
40001152:	c7 44 24 20 78 15 00 	movl   $0x40001578,0x20(%esp)
40001159:	40 
4000115a:	83 c4 14             	add    $0x14,%esp
4000115d:	5b                   	pop    %ebx
4000115e:	5e                   	pop    %esi
4000115f:	ff 25 20 44 00 40    	jmp    *0x40004420
40001165:	66 90                	xchg   %ax,%ax
40001167:	66 90                	xchg   %ax,%ax
40001169:	66 90                	xchg   %ax,%ax
4000116b:	66 90                	xchg   %ax,%ax
4000116d:	66 90                	xchg   %ax,%ax
4000116f:	90                   	nop

40001170 <__udivdi3>:
40001170:	55                   	push   %ebp
40001171:	57                   	push   %edi
40001172:	56                   	push   %esi
40001173:	53                   	push   %ebx
40001174:	83 ec 1c             	sub    $0x1c,%esp
40001177:	8b 74 24 3c          	mov    0x3c(%esp),%esi
4000117b:	8b 5c 24 30          	mov    0x30(%esp),%ebx
4000117f:	8b 4c 24 34          	mov    0x34(%esp),%ecx
40001183:	8b 7c 24 38          	mov    0x38(%esp),%edi
40001187:	85 f6                	test   %esi,%esi
40001189:	89 5c 24 08          	mov    %ebx,0x8(%esp)
4000118d:	89 ca                	mov    %ecx,%edx
4000118f:	89 f8                	mov    %edi,%eax
40001191:	75 3d                	jne    400011d0 <__udivdi3+0x60>
40001193:	39 cf                	cmp    %ecx,%edi
40001195:	0f 87 c5 00 00 00    	ja     40001260 <__udivdi3+0xf0>
4000119b:	85 ff                	test   %edi,%edi
4000119d:	89 fd                	mov    %edi,%ebp
4000119f:	75 0b                	jne    400011ac <__udivdi3+0x3c>
400011a1:	b8 01 00 00 00       	mov    $0x1,%eax
400011a6:	31 d2                	xor    %edx,%edx
400011a8:	f7 f7                	div    %edi
400011aa:	89 c5                	mov    %eax,%ebp
400011ac:	89 c8                	mov    %ecx,%eax
400011ae:	31 d2                	xor    %edx,%edx
400011b0:	f7 f5                	div    %ebp
400011b2:	89 c1                	mov    %eax,%ecx
400011b4:	89 d8                	mov    %ebx,%eax
400011b6:	89 cf                	mov    %ecx,%edi
400011b8:	f7 f5                	div    %ebp
400011ba:	89 c3                	mov    %eax,%ebx
400011bc:	89 d8                	mov    %ebx,%eax
400011be:	89 fa                	mov    %edi,%edx
400011c0:	83 c4 1c             	add    $0x1c,%esp
400011c3:	5b                   	pop    %ebx
400011c4:	5e                   	pop    %esi
400011c5:	5f                   	pop    %edi
400011c6:	5d                   	pop    %ebp
400011c7:	c3                   	ret    
400011c8:	90                   	nop
400011c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400011d0:	39 ce                	cmp    %ecx,%esi
400011d2:	77 74                	ja     40001248 <__udivdi3+0xd8>
400011d4:	0f bd fe             	bsr    %esi,%edi
400011d7:	83 f7 1f             	xor    $0x1f,%edi
400011da:	0f 84 98 00 00 00    	je     40001278 <__udivdi3+0x108>
400011e0:	bb 20 00 00 00       	mov    $0x20,%ebx
400011e5:	89 f9                	mov    %edi,%ecx
400011e7:	89 c5                	mov    %eax,%ebp
400011e9:	29 fb                	sub    %edi,%ebx
400011eb:	d3 e6                	shl    %cl,%esi
400011ed:	89 d9                	mov    %ebx,%ecx
400011ef:	d3 ed                	shr    %cl,%ebp
400011f1:	89 f9                	mov    %edi,%ecx
400011f3:	d3 e0                	shl    %cl,%eax
400011f5:	09 ee                	or     %ebp,%esi
400011f7:	89 d9                	mov    %ebx,%ecx
400011f9:	89 44 24 0c          	mov    %eax,0xc(%esp)
400011fd:	89 d5                	mov    %edx,%ebp
400011ff:	8b 44 24 08          	mov    0x8(%esp),%eax
40001203:	d3 ed                	shr    %cl,%ebp
40001205:	89 f9                	mov    %edi,%ecx
40001207:	d3 e2                	shl    %cl,%edx
40001209:	89 d9                	mov    %ebx,%ecx
4000120b:	d3 e8                	shr    %cl,%eax
4000120d:	09 c2                	or     %eax,%edx
4000120f:	89 d0                	mov    %edx,%eax
40001211:	89 ea                	mov    %ebp,%edx
40001213:	f7 f6                	div    %esi
40001215:	89 d5                	mov    %edx,%ebp
40001217:	89 c3                	mov    %eax,%ebx
40001219:	f7 64 24 0c          	mull   0xc(%esp)
4000121d:	39 d5                	cmp    %edx,%ebp
4000121f:	72 10                	jb     40001231 <__udivdi3+0xc1>
40001221:	8b 74 24 08          	mov    0x8(%esp),%esi
40001225:	89 f9                	mov    %edi,%ecx
40001227:	d3 e6                	shl    %cl,%esi
40001229:	39 c6                	cmp    %eax,%esi
4000122b:	73 07                	jae    40001234 <__udivdi3+0xc4>
4000122d:	39 d5                	cmp    %edx,%ebp
4000122f:	75 03                	jne    40001234 <__udivdi3+0xc4>
40001231:	83 eb 01             	sub    $0x1,%ebx
40001234:	31 ff                	xor    %edi,%edi
40001236:	89 d8                	mov    %ebx,%eax
40001238:	89 fa                	mov    %edi,%edx
4000123a:	83 c4 1c             	add    $0x1c,%esp
4000123d:	5b                   	pop    %ebx
4000123e:	5e                   	pop    %esi
4000123f:	5f                   	pop    %edi
40001240:	5d                   	pop    %ebp
40001241:	c3                   	ret    
40001242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001248:	31 ff                	xor    %edi,%edi
4000124a:	31 db                	xor    %ebx,%ebx
4000124c:	89 d8                	mov    %ebx,%eax
4000124e:	89 fa                	mov    %edi,%edx
40001250:	83 c4 1c             	add    $0x1c,%esp
40001253:	5b                   	pop    %ebx
40001254:	5e                   	pop    %esi
40001255:	5f                   	pop    %edi
40001256:	5d                   	pop    %ebp
40001257:	c3                   	ret    
40001258:	90                   	nop
40001259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001260:	89 d8                	mov    %ebx,%eax
40001262:	f7 f7                	div    %edi
40001264:	31 ff                	xor    %edi,%edi
40001266:	89 c3                	mov    %eax,%ebx
40001268:	89 d8                	mov    %ebx,%eax
4000126a:	89 fa                	mov    %edi,%edx
4000126c:	83 c4 1c             	add    $0x1c,%esp
4000126f:	5b                   	pop    %ebx
40001270:	5e                   	pop    %esi
40001271:	5f                   	pop    %edi
40001272:	5d                   	pop    %ebp
40001273:	c3                   	ret    
40001274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001278:	39 ce                	cmp    %ecx,%esi
4000127a:	72 0c                	jb     40001288 <__udivdi3+0x118>
4000127c:	31 db                	xor    %ebx,%ebx
4000127e:	3b 44 24 08          	cmp    0x8(%esp),%eax
40001282:	0f 87 34 ff ff ff    	ja     400011bc <__udivdi3+0x4c>
40001288:	bb 01 00 00 00       	mov    $0x1,%ebx
4000128d:	e9 2a ff ff ff       	jmp    400011bc <__udivdi3+0x4c>
40001292:	66 90                	xchg   %ax,%ax
40001294:	66 90                	xchg   %ax,%ax
40001296:	66 90                	xchg   %ax,%ax
40001298:	66 90                	xchg   %ax,%ax
4000129a:	66 90                	xchg   %ax,%ax
4000129c:	66 90                	xchg   %ax,%ax
4000129e:	66 90                	xchg   %ax,%ax

400012a0 <__umoddi3>:
400012a0:	55                   	push   %ebp
400012a1:	57                   	push   %edi
400012a2:	56                   	push   %esi
400012a3:	53                   	push   %ebx
400012a4:	83 ec 1c             	sub    $0x1c,%esp
400012a7:	8b 44 24 3c          	mov    0x3c(%esp),%eax
400012ab:	8b 4c 24 30          	mov    0x30(%esp),%ecx
400012af:	8b 74 24 34          	mov    0x34(%esp),%esi
400012b3:	8b 7c 24 38          	mov    0x38(%esp),%edi
400012b7:	85 c0                	test   %eax,%eax
400012b9:	89 44 24 0c          	mov    %eax,0xc(%esp)
400012bd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
400012c1:	89 3c 24             	mov    %edi,(%esp)
400012c4:	89 4c 24 04          	mov    %ecx,0x4(%esp)
400012c8:	89 f2                	mov    %esi,%edx
400012ca:	75 14                	jne    400012e0 <__umoddi3+0x40>
400012cc:	39 f7                	cmp    %esi,%edi
400012ce:	76 40                	jbe    40001310 <__umoddi3+0x70>
400012d0:	89 c8                	mov    %ecx,%eax
400012d2:	f7 f7                	div    %edi
400012d4:	89 d0                	mov    %edx,%eax
400012d6:	31 d2                	xor    %edx,%edx
400012d8:	83 c4 1c             	add    $0x1c,%esp
400012db:	5b                   	pop    %ebx
400012dc:	5e                   	pop    %esi
400012dd:	5f                   	pop    %edi
400012de:	5d                   	pop    %ebp
400012df:	c3                   	ret    
400012e0:	39 f0                	cmp    %esi,%eax
400012e2:	89 f3                	mov    %esi,%ebx
400012e4:	77 4a                	ja     40001330 <__umoddi3+0x90>
400012e6:	0f bd e8             	bsr    %eax,%ebp
400012e9:	83 f5 1f             	xor    $0x1f,%ebp
400012ec:	75 52                	jne    40001340 <__umoddi3+0xa0>
400012ee:	39 f0                	cmp    %esi,%eax
400012f0:	0f 82 da 00 00 00    	jb     400013d0 <__umoddi3+0x130>
400012f6:	39 0c 24             	cmp    %ecx,(%esp)
400012f9:	0f 86 d1 00 00 00    	jbe    400013d0 <__umoddi3+0x130>
400012ff:	8b 44 24 04          	mov    0x4(%esp),%eax
40001303:	83 c4 1c             	add    $0x1c,%esp
40001306:	5b                   	pop    %ebx
40001307:	5e                   	pop    %esi
40001308:	5f                   	pop    %edi
40001309:	5d                   	pop    %ebp
4000130a:	c3                   	ret    
4000130b:	90                   	nop
4000130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001310:	85 ff                	test   %edi,%edi
40001312:	89 fd                	mov    %edi,%ebp
40001314:	75 0b                	jne    40001321 <__umoddi3+0x81>
40001316:	b8 01 00 00 00       	mov    $0x1,%eax
4000131b:	31 d2                	xor    %edx,%edx
4000131d:	f7 f7                	div    %edi
4000131f:	89 c5                	mov    %eax,%ebp
40001321:	89 f0                	mov    %esi,%eax
40001323:	31 d2                	xor    %edx,%edx
40001325:	f7 f5                	div    %ebp
40001327:	89 c8                	mov    %ecx,%eax
40001329:	f7 f5                	div    %ebp
4000132b:	eb a7                	jmp    400012d4 <__umoddi3+0x34>
4000132d:	8d 76 00             	lea    0x0(%esi),%esi
40001330:	89 c8                	mov    %ecx,%eax
40001332:	89 f2                	mov    %esi,%edx
40001334:	83 c4 1c             	add    $0x1c,%esp
40001337:	5b                   	pop    %ebx
40001338:	5e                   	pop    %esi
40001339:	5f                   	pop    %edi
4000133a:	5d                   	pop    %ebp
4000133b:	c3                   	ret    
4000133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001340:	8b 34 24             	mov    (%esp),%esi
40001343:	bf 20 00 00 00       	mov    $0x20,%edi
40001348:	89 e9                	mov    %ebp,%ecx
4000134a:	29 ef                	sub    %ebp,%edi
4000134c:	d3 e0                	shl    %cl,%eax
4000134e:	89 f9                	mov    %edi,%ecx
40001350:	89 f2                	mov    %esi,%edx
40001352:	d3 ea                	shr    %cl,%edx
40001354:	89 e9                	mov    %ebp,%ecx
40001356:	09 c2                	or     %eax,%edx
40001358:	89 d8                	mov    %ebx,%eax
4000135a:	89 14 24             	mov    %edx,(%esp)
4000135d:	89 f2                	mov    %esi,%edx
4000135f:	d3 e2                	shl    %cl,%edx
40001361:	89 f9                	mov    %edi,%ecx
40001363:	89 54 24 04          	mov    %edx,0x4(%esp)
40001367:	8b 54 24 08          	mov    0x8(%esp),%edx
4000136b:	d3 e8                	shr    %cl,%eax
4000136d:	89 e9                	mov    %ebp,%ecx
4000136f:	89 c6                	mov    %eax,%esi
40001371:	d3 e3                	shl    %cl,%ebx
40001373:	89 f9                	mov    %edi,%ecx
40001375:	89 d0                	mov    %edx,%eax
40001377:	d3 e8                	shr    %cl,%eax
40001379:	89 e9                	mov    %ebp,%ecx
4000137b:	09 d8                	or     %ebx,%eax
4000137d:	89 d3                	mov    %edx,%ebx
4000137f:	89 f2                	mov    %esi,%edx
40001381:	f7 34 24             	divl   (%esp)
40001384:	89 d6                	mov    %edx,%esi
40001386:	d3 e3                	shl    %cl,%ebx
40001388:	f7 64 24 04          	mull   0x4(%esp)
4000138c:	39 d6                	cmp    %edx,%esi
4000138e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
40001392:	89 d1                	mov    %edx,%ecx
40001394:	89 c3                	mov    %eax,%ebx
40001396:	72 08                	jb     400013a0 <__umoddi3+0x100>
40001398:	75 11                	jne    400013ab <__umoddi3+0x10b>
4000139a:	39 44 24 08          	cmp    %eax,0x8(%esp)
4000139e:	73 0b                	jae    400013ab <__umoddi3+0x10b>
400013a0:	2b 44 24 04          	sub    0x4(%esp),%eax
400013a4:	1b 14 24             	sbb    (%esp),%edx
400013a7:	89 d1                	mov    %edx,%ecx
400013a9:	89 c3                	mov    %eax,%ebx
400013ab:	8b 54 24 08          	mov    0x8(%esp),%edx
400013af:	29 da                	sub    %ebx,%edx
400013b1:	19 ce                	sbb    %ecx,%esi
400013b3:	89 f9                	mov    %edi,%ecx
400013b5:	89 f0                	mov    %esi,%eax
400013b7:	d3 e0                	shl    %cl,%eax
400013b9:	89 e9                	mov    %ebp,%ecx
400013bb:	d3 ea                	shr    %cl,%edx
400013bd:	89 e9                	mov    %ebp,%ecx
400013bf:	d3 ee                	shr    %cl,%esi
400013c1:	09 d0                	or     %edx,%eax
400013c3:	89 f2                	mov    %esi,%edx
400013c5:	83 c4 1c             	add    $0x1c,%esp
400013c8:	5b                   	pop    %ebx
400013c9:	5e                   	pop    %esi
400013ca:	5f                   	pop    %edi
400013cb:	5d                   	pop    %ebp
400013cc:	c3                   	ret    
400013cd:	8d 76 00             	lea    0x0(%esi),%esi
400013d0:	89 f2                	mov    %esi,%edx
400013d2:	29 f9                	sub    %edi,%ecx
400013d4:	1b 54 24 0c          	sbb    0xc(%esp),%edx
400013d8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
400013dc:	e9 1e ff ff ff       	jmp    400012ff <__umoddi3+0x5f>
