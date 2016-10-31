
obj/boot/boot1.elf:     file format elf32-i386


Disassembly of section .text:

00007e00 <start>:
	.set SMAP_SIG, 0x0534D4150	# "SMAP"

	.globl start
start:
	.code16
	cli
    7e00:	fa                   	cli    
	cld
    7e01:	fc                   	cld    

00007e02 <seta20.1>:

	/* enable A20 */
seta20.1:
	inb	$0x64, %al
    7e02:	e4 64                	in     $0x64,%al
	testb	$0x2, %al
    7e04:	a8 02                	test   $0x2,%al
	jnz	seta20.1
    7e06:	75 fa                	jne    7e02 <seta20.1>
	movb	$0xd1, %al
    7e08:	b0 d1                	mov    $0xd1,%al
	outb	%al, $0x64
    7e0a:	e6 64                	out    %al,$0x64

00007e0c <seta20.2>:
seta20.2:
	inb	$0x64, %al
    7e0c:	e4 64                	in     $0x64,%al
	testb	$0x2, %al
    7e0e:	a8 02                	test   $0x2,%al
	jnz	seta20.2
    7e10:	75 fa                	jne    7e0c <seta20.2>
	movb	$0xdf, %al
    7e12:	b0 df                	mov    $0xdf,%al
	outb	%al, $0x60
    7e14:	e6 60                	out    %al,$0x60

00007e16 <set_video_mode.2>:

	/*
	 * print starting message
	 */
set_video_mode.2:
	movw	$STARTUP_MSG, %si
    7e16:	be ab 7e e8 81       	mov    $0x81e87eab,%esi
	call	putstr
    7e1b:	00 66 31             	add    %ah,0x31(%esi)

00007e1c <e820>:

	/*
	 * detect the physical memory map
	 */
e820:
	xorl	%ebx, %ebx		# ebx must be 0 when first calling e820
    7e1c:	66 31 db             	xor    %bx,%bx
	movl	$SMAP_SIG, %edx		# edx must be 'SMAP' when calling e820
    7e1f:	66 ba 50 41          	mov    $0x4150,%dx
    7e23:	4d                   	dec    %ebp
    7e24:	53                   	push   %ebx
	movw	$(smap+4), %di		# set the address of the output buffer
    7e25:	bf 2a 7f 66 b9       	mov    $0xb9667f2a,%edi

00007e28 <e820.1>:
e820.1:
	movl	$20, %ecx		# set the size of the output buffer
    7e28:	66 b9 14 00          	mov    $0x14,%cx
    7e2c:	00 00                	add    %al,(%eax)
	movl	$0xe820, %eax		# set the BIOS service code
    7e2e:	66 b8 20 e8          	mov    $0xe820,%ax
    7e32:	00 00                	add    %al,(%eax)
	int	$0x15			# call BIOS service e820h
    7e34:	cd 15                	int    $0x15

00007e36 <e820.2>:
e820.2:
	jc	e820.fail		# error during e820h
    7e36:	72 24                	jb     7e5c <e820.fail>
	cmpl	$SMAP_SIG, %eax		# check eax, which should be 'SMAP'
    7e38:	66 3d 50 41          	cmp    $0x4150,%ax
    7e3c:	4d                   	dec    %ebp
    7e3d:	53                   	push   %ebx
	jne	e820.fail
    7e3e:	75 1c                	jne    7e5c <e820.fail>

00007e40 <e820.3>:
e820.3:
	movl	$20, -4(%di)
    7e40:	66 c7 45 fc 14 00    	movw   $0x14,-0x4(%ebp)
    7e46:	00 00                	add    %al,(%eax)
	addw	$24, %di
    7e48:	83 c7 18             	add    $0x18,%edi
	cmpl	$0x0, %ebx		# whether it's the last descriptor
    7e4b:	66 83 fb 00          	cmp    $0x0,%bx
	je	e820.4
    7e4f:	74 02                	je     7e53 <e820.4>
	jmp	e820.1
    7e51:	eb d5                	jmp    7e28 <e820.1>

00007e53 <e820.4>:
e820.4:					# zero the descriptor after the last one
	xorb	%al, %al
    7e53:	30 c0                	xor    %al,%al
	movw	$20, %cx
    7e55:	b9 14 00 f3 aa       	mov    $0xaaf30014,%ecx
	rep	stosb
	jmp	switch_prot
    7e5a:	eb 09                	jmp    7e65 <switch_prot>

00007e5c <e820.fail>:
e820.fail:
	movw	$E820_FAIL_MSG, %si
    7e5c:	be bd 7e e8 3b       	mov    $0x3be87ebd,%esi
	call	putstr
    7e61:	00 eb                	add    %ch,%bl
	jmp	spin16
    7e63:	00 f4                	add    %dh,%ah

00007e64 <spin16>:

spin16:
	hlt
    7e64:	f4                   	hlt    

00007e65 <switch_prot>:

	/*
	 * load the bootstrap GDT
	 */
switch_prot:
	lgdt	gdtdesc
    7e65:	0f 01 16             	lgdtl  (%esi)
    7e68:	20 7f 0f             	and    %bh,0xf(%edi)
	movl	%cr0, %eax
    7e6b:	20 c0                	and    %al,%al
	orl	$CR0_PE_ON, %eax
    7e6d:	66 83 c8 01          	or     $0x1,%ax
	movl	%eax, %cr0
    7e71:	0f 22 c0             	mov    %eax,%cr0
	/*
	 * switch to the protected mode
	 */
	ljmp	$PROT_MODE_CSEG, $protcseg
    7e74:	ea 79 7e 08 00 66 b8 	ljmp   $0xb866,$0x87e79

00007e79 <protcseg>:

	.code32
protcseg:
	movw	$PROT_MODE_DSEG, %ax
    7e79:	66 b8 10 00          	mov    $0x10,%ax
	movw	%ax, %ds
    7e7d:	8e d8                	mov    %eax,%ds
	movw	%ax, %es
    7e7f:	8e c0                	mov    %eax,%es
	movw	%ax, %fs
    7e81:	8e e0                	mov    %eax,%fs
	movw	%ax, %gs
    7e83:	8e e8                	mov    %eax,%gs
	movw	%ax, %ss
    7e85:	8e d0                	mov    %eax,%ss

	/*
	 * jump to the C part
	 * (dev, lba, smap)
	 */
	pushl	$smap
    7e87:	68 26 7f 00 00       	push   $0x7f26
	pushl	$BOOT0
    7e8c:	68 00 7c 00 00       	push   $0x7c00
	movl	(BOOT0-4), %eax
    7e91:	a1 fc 7b 00 00       	mov    0x7bfc,%eax
	pushl	%eax
    7e96:	50                   	push   %eax
	call	boot1main
    7e97:	e8 bd 0f 00 00       	call   8e59 <boot1main>

00007e9c <spin>:

spin:
	hlt
    7e9c:	f4                   	hlt    

00007e9d <putstr>:
/*
 * print a string (@ %si) to the screen
 */
	.globl putstr
putstr:
	pusha
    7e9d:	60                   	pusha  
	movb	$0xe, %ah
    7e9e:	b4 0e                	mov    $0xe,%ah

00007ea0 <putstr.1>:
putstr.1:
	lodsb
    7ea0:	ac                   	lods   %ds:(%esi),%al
	cmp	$0, %al
    7ea1:	3c 00                	cmp    $0x0,%al
	je	putstr.2
    7ea3:	74 04                	je     7ea9 <putstr.2>
	int	$0x10
    7ea5:	cd 10                	int    $0x10
	jmp	putstr.1
    7ea7:	eb f7                	jmp    7ea0 <putstr.1>

00007ea9 <putstr.2>:
putstr.2:
	popa
    7ea9:	61                   	popa   
	ret
    7eaa:	c3                   	ret    

00007eab <STARTUP_MSG>:
    7eab:	53                   	push   %ebx
    7eac:	74 61                	je     7f0f <gdt+0x17>
    7eae:	72 74                	jb     7f24 <gdtdesc+0x4>
    7eb0:	20 62 6f             	and    %ah,0x6f(%edx)
    7eb3:	6f                   	outsl  %ds:(%esi),(%dx)
    7eb4:	74 31                	je     7ee7 <NO_BOOTABLE_MSG+0x8>
    7eb6:	20 2e                	and    %ch,(%esi)
    7eb8:	2e 2e 0d 0a 00 65 72 	cs cs or $0x7265000a,%eax

00007ebd <E820_FAIL_MSG>:
    7ebd:	65 72 72             	gs jb  7f32 <smap+0xc>
    7ec0:	6f                   	outsl  %ds:(%esi),(%dx)
    7ec1:	72 20                	jb     7ee3 <NO_BOOTABLE_MSG+0x4>
    7ec3:	77 68                	ja     7f2d <smap+0x7>
    7ec5:	65 6e                	outsb  %gs:(%esi),(%dx)
    7ec7:	20 64 65 74          	and    %ah,0x74(%ebp,%eiz,2)
    7ecb:	65 63 74 69 6e       	arpl   %si,%gs:0x6e(%ecx,%ebp,2)
    7ed0:	67 20 6d 65          	and    %ch,0x65(%di)
    7ed4:	6d                   	insl   (%dx),%es:(%edi)
    7ed5:	6f                   	outsl  %ds:(%esi),(%dx)
    7ed6:	72 79                	jb     7f51 <smap+0x2b>
    7ed8:	20 6d 61             	and    %ch,0x61(%ebp)
    7edb:	70 0d                	jo     7eea <NO_BOOTABLE_MSG+0xb>
    7edd:	0a 00                	or     (%eax),%al

00007edf <NO_BOOTABLE_MSG>:
    7edf:	4e                   	dec    %esi
    7ee0:	6f                   	outsl  %ds:(%esi),(%dx)
    7ee1:	20 62 6f             	and    %ah,0x6f(%edx)
    7ee4:	6f                   	outsl  %ds:(%esi),(%dx)
    7ee5:	74 61                	je     7f48 <smap+0x22>
    7ee7:	62 6c 65 20          	bound  %ebp,0x20(%ebp,%eiz,2)
    7eeb:	70 61                	jo     7f4e <smap+0x28>
    7eed:	72 74                	jb     7f63 <smap+0x3d>
    7eef:	69 74 69 6f 6e 2e 0d 	imul   $0xa0d2e6e,0x6f(%ecx,%ebp,2),%esi
    7ef6:	0a 
    7ef7:	00 00                	add    %al,(%eax)

00007ef8 <gdt>:
    7ef8:	00 00                	add    %al,(%eax)
    7efa:	00 00                	add    %al,(%eax)
    7efc:	00 00                	add    %al,(%eax)
    7efe:	00 00                	add    %al,(%eax)
    7f00:	ff                   	(bad)  
    7f01:	ff 00                	incl   (%eax)
    7f03:	00 00                	add    %al,(%eax)
    7f05:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    7f0c:	00 92 cf 00 ff ff    	add    %dl,-0xff31(%edx)
    7f12:	00 00                	add    %al,(%eax)
    7f14:	00 9e 00 00 ff ff    	add    %bl,-0x10000(%esi)
    7f1a:	00 00                	add    %al,(%eax)
    7f1c:	00 92 00 00 27 00    	add    %dl,0x270000(%edx)

00007f20 <gdtdesc>:
    7f20:	27                   	daa    
    7f21:	00 f8                	add    %bh,%al
    7f23:	7e 00                	jle    7f25 <gdtdesc+0x5>
    7f25:	00 00                	add    %al,(%eax)

00007f26 <smap>:
    7f26:	00 00                	add    %al,(%eax)
    7f28:	00 00                	add    %al,(%eax)
    7f2a:	00 00                	add    %al,(%eax)
    7f2c:	00 00                	add    %al,(%eax)
    7f2e:	00 00                	add    %al,(%eax)
    7f30:	00 00                	add    %al,(%eax)
    7f32:	00 00                	add    %al,(%eax)
    7f34:	00 00                	add    %al,(%eax)
    7f36:	00 00                	add    %al,(%eax)
    7f38:	00 00                	add    %al,(%eax)
    7f3a:	00 00                	add    %al,(%eax)
    7f3c:	00 00                	add    %al,(%eax)
    7f3e:	00 00                	add    %al,(%eax)
    7f40:	00 00                	add    %al,(%eax)
    7f42:	00 00                	add    %al,(%eax)
    7f44:	00 00                	add    %al,(%eax)
    7f46:	00 00                	add    %al,(%eax)
    7f48:	00 00                	add    %al,(%eax)
    7f4a:	00 00                	add    %al,(%eax)
    7f4c:	00 00                	add    %al,(%eax)
    7f4e:	00 00                	add    %al,(%eax)
    7f50:	00 00                	add    %al,(%eax)
    7f52:	00 00                	add    %al,(%eax)
    7f54:	00 00                	add    %al,(%eax)
    7f56:	00 00                	add    %al,(%eax)
    7f58:	00 00                	add    %al,(%eax)
    7f5a:	00 00                	add    %al,(%eax)
    7f5c:	00 00                	add    %al,(%eax)
    7f5e:	00 00                	add    %al,(%eax)
    7f60:	00 00                	add    %al,(%eax)
    7f62:	00 00                	add    %al,(%eax)
    7f64:	00 00                	add    %al,(%eax)
    7f66:	00 00                	add    %al,(%eax)
    7f68:	00 00                	add    %al,(%eax)
    7f6a:	00 00                	add    %al,(%eax)
    7f6c:	00 00                	add    %al,(%eax)
    7f6e:	00 00                	add    %al,(%eax)
    7f70:	00 00                	add    %al,(%eax)
    7f72:	00 00                	add    %al,(%eax)
    7f74:	00 00                	add    %al,(%eax)
    7f76:	00 00                	add    %al,(%eax)
    7f78:	00 00                	add    %al,(%eax)
    7f7a:	00 00                	add    %al,(%eax)
    7f7c:	00 00                	add    %al,(%eax)
    7f7e:	00 00                	add    %al,(%eax)
    7f80:	00 00                	add    %al,(%eax)
    7f82:	00 00                	add    %al,(%eax)
    7f84:	00 00                	add    %al,(%eax)
    7f86:	00 00                	add    %al,(%eax)
    7f88:	00 00                	add    %al,(%eax)
    7f8a:	00 00                	add    %al,(%eax)
    7f8c:	00 00                	add    %al,(%eax)
    7f8e:	00 00                	add    %al,(%eax)
    7f90:	00 00                	add    %al,(%eax)
    7f92:	00 00                	add    %al,(%eax)
    7f94:	00 00                	add    %al,(%eax)
    7f96:	00 00                	add    %al,(%eax)
    7f98:	00 00                	add    %al,(%eax)
    7f9a:	00 00                	add    %al,(%eax)
    7f9c:	00 00                	add    %al,(%eax)
    7f9e:	00 00                	add    %al,(%eax)
    7fa0:	00 00                	add    %al,(%eax)
    7fa2:	00 00                	add    %al,(%eax)
    7fa4:	00 00                	add    %al,(%eax)
    7fa6:	00 00                	add    %al,(%eax)
    7fa8:	00 00                	add    %al,(%eax)
    7faa:	00 00                	add    %al,(%eax)
    7fac:	00 00                	add    %al,(%eax)
    7fae:	00 00                	add    %al,(%eax)
    7fb0:	00 00                	add    %al,(%eax)
    7fb2:	00 00                	add    %al,(%eax)
    7fb4:	00 00                	add    %al,(%eax)
    7fb6:	00 00                	add    %al,(%eax)
    7fb8:	00 00                	add    %al,(%eax)
    7fba:	00 00                	add    %al,(%eax)
    7fbc:	00 00                	add    %al,(%eax)
    7fbe:	00 00                	add    %al,(%eax)
    7fc0:	00 00                	add    %al,(%eax)
    7fc2:	00 00                	add    %al,(%eax)
    7fc4:	00 00                	add    %al,(%eax)
    7fc6:	00 00                	add    %al,(%eax)
    7fc8:	00 00                	add    %al,(%eax)
    7fca:	00 00                	add    %al,(%eax)
    7fcc:	00 00                	add    %al,(%eax)
    7fce:	00 00                	add    %al,(%eax)
    7fd0:	00 00                	add    %al,(%eax)
    7fd2:	00 00                	add    %al,(%eax)
    7fd4:	00 00                	add    %al,(%eax)
    7fd6:	00 00                	add    %al,(%eax)
    7fd8:	00 00                	add    %al,(%eax)
    7fda:	00 00                	add    %al,(%eax)
    7fdc:	00 00                	add    %al,(%eax)
    7fde:	00 00                	add    %al,(%eax)
    7fe0:	00 00                	add    %al,(%eax)
    7fe2:	00 00                	add    %al,(%eax)
    7fe4:	00 00                	add    %al,(%eax)
    7fe6:	00 00                	add    %al,(%eax)
    7fe8:	00 00                	add    %al,(%eax)
    7fea:	00 00                	add    %al,(%eax)
    7fec:	00 00                	add    %al,(%eax)
    7fee:	00 00                	add    %al,(%eax)
    7ff0:	00 00                	add    %al,(%eax)
    7ff2:	00 00                	add    %al,(%eax)
    7ff4:	00 00                	add    %al,(%eax)
    7ff6:	00 00                	add    %al,(%eax)
    7ff8:	00 00                	add    %al,(%eax)
    7ffa:	00 00                	add    %al,(%eax)
    7ffc:	00 00                	add    %al,(%eax)
    7ffe:	00 00                	add    %al,(%eax)
    8000:	00 00                	add    %al,(%eax)
    8002:	00 00                	add    %al,(%eax)
    8004:	00 00                	add    %al,(%eax)
    8006:	00 00                	add    %al,(%eax)
    8008:	00 00                	add    %al,(%eax)
    800a:	00 00                	add    %al,(%eax)
    800c:	00 00                	add    %al,(%eax)
    800e:	00 00                	add    %al,(%eax)
    8010:	00 00                	add    %al,(%eax)
    8012:	00 00                	add    %al,(%eax)
    8014:	00 00                	add    %al,(%eax)
    8016:	00 00                	add    %al,(%eax)
    8018:	00 00                	add    %al,(%eax)
    801a:	00 00                	add    %al,(%eax)
    801c:	00 00                	add    %al,(%eax)
    801e:	00 00                	add    %al,(%eax)
    8020:	00 00                	add    %al,(%eax)
    8022:	00 00                	add    %al,(%eax)
    8024:	00 00                	add    %al,(%eax)
    8026:	00 00                	add    %al,(%eax)
    8028:	00 00                	add    %al,(%eax)
    802a:	00 00                	add    %al,(%eax)
    802c:	00 00                	add    %al,(%eax)
    802e:	00 00                	add    %al,(%eax)
    8030:	00 00                	add    %al,(%eax)
    8032:	00 00                	add    %al,(%eax)
    8034:	00 00                	add    %al,(%eax)
    8036:	00 00                	add    %al,(%eax)
    8038:	00 00                	add    %al,(%eax)
    803a:	00 00                	add    %al,(%eax)
    803c:	00 00                	add    %al,(%eax)
    803e:	00 00                	add    %al,(%eax)
    8040:	00 00                	add    %al,(%eax)
    8042:	00 00                	add    %al,(%eax)
    8044:	00 00                	add    %al,(%eax)
    8046:	00 00                	add    %al,(%eax)
    8048:	00 00                	add    %al,(%eax)
    804a:	00 00                	add    %al,(%eax)
    804c:	00 00                	add    %al,(%eax)
    804e:	00 00                	add    %al,(%eax)
    8050:	00 00                	add    %al,(%eax)
    8052:	00 00                	add    %al,(%eax)
    8054:	00 00                	add    %al,(%eax)
    8056:	00 00                	add    %al,(%eax)
    8058:	00 00                	add    %al,(%eax)
    805a:	00 00                	add    %al,(%eax)
    805c:	00 00                	add    %al,(%eax)
    805e:	00 00                	add    %al,(%eax)
    8060:	00 00                	add    %al,(%eax)
    8062:	00 00                	add    %al,(%eax)
    8064:	00 00                	add    %al,(%eax)
    8066:	00 00                	add    %al,(%eax)
    8068:	00 00                	add    %al,(%eax)
    806a:	00 00                	add    %al,(%eax)
    806c:	00 00                	add    %al,(%eax)
    806e:	00 00                	add    %al,(%eax)
    8070:	00 00                	add    %al,(%eax)
    8072:	00 00                	add    %al,(%eax)
    8074:	00 00                	add    %al,(%eax)
    8076:	00 00                	add    %al,(%eax)
    8078:	00 00                	add    %al,(%eax)
    807a:	00 00                	add    %al,(%eax)
    807c:	00 00                	add    %al,(%eax)
    807e:	00 00                	add    %al,(%eax)
    8080:	00 00                	add    %al,(%eax)
    8082:	00 00                	add    %al,(%eax)
    8084:	00 00                	add    %al,(%eax)
    8086:	00 00                	add    %al,(%eax)
    8088:	00 00                	add    %al,(%eax)
    808a:	00 00                	add    %al,(%eax)
    808c:	00 00                	add    %al,(%eax)
    808e:	00 00                	add    %al,(%eax)
    8090:	00 00                	add    %al,(%eax)
    8092:	00 00                	add    %al,(%eax)
    8094:	00 00                	add    %al,(%eax)
    8096:	00 00                	add    %al,(%eax)
    8098:	00 00                	add    %al,(%eax)
    809a:	00 00                	add    %al,(%eax)
    809c:	00 00                	add    %al,(%eax)
    809e:	00 00                	add    %al,(%eax)
    80a0:	00 00                	add    %al,(%eax)
    80a2:	00 00                	add    %al,(%eax)
    80a4:	00 00                	add    %al,(%eax)
    80a6:	00 00                	add    %al,(%eax)
    80a8:	00 00                	add    %al,(%eax)
    80aa:	00 00                	add    %al,(%eax)
    80ac:	00 00                	add    %al,(%eax)
    80ae:	00 00                	add    %al,(%eax)
    80b0:	00 00                	add    %al,(%eax)
    80b2:	00 00                	add    %al,(%eax)
    80b4:	00 00                	add    %al,(%eax)
    80b6:	00 00                	add    %al,(%eax)
    80b8:	00 00                	add    %al,(%eax)
    80ba:	00 00                	add    %al,(%eax)
    80bc:	00 00                	add    %al,(%eax)
    80be:	00 00                	add    %al,(%eax)
    80c0:	00 00                	add    %al,(%eax)
    80c2:	00 00                	add    %al,(%eax)
    80c4:	00 00                	add    %al,(%eax)
    80c6:	00 00                	add    %al,(%eax)
    80c8:	00 00                	add    %al,(%eax)
    80ca:	00 00                	add    %al,(%eax)
    80cc:	00 00                	add    %al,(%eax)
    80ce:	00 00                	add    %al,(%eax)
    80d0:	00 00                	add    %al,(%eax)
    80d2:	00 00                	add    %al,(%eax)
    80d4:	00 00                	add    %al,(%eax)
    80d6:	00 00                	add    %al,(%eax)
    80d8:	00 00                	add    %al,(%eax)
    80da:	00 00                	add    %al,(%eax)
    80dc:	00 00                	add    %al,(%eax)
    80de:	00 00                	add    %al,(%eax)
    80e0:	00 00                	add    %al,(%eax)
    80e2:	00 00                	add    %al,(%eax)
    80e4:	00 00                	add    %al,(%eax)
    80e6:	00 00                	add    %al,(%eax)
    80e8:	00 00                	add    %al,(%eax)
    80ea:	00 00                	add    %al,(%eax)
    80ec:	00 00                	add    %al,(%eax)
    80ee:	00 00                	add    %al,(%eax)
    80f0:	00 00                	add    %al,(%eax)
    80f2:	00 00                	add    %al,(%eax)
    80f4:	00 00                	add    %al,(%eax)
    80f6:	00 00                	add    %al,(%eax)
    80f8:	00 00                	add    %al,(%eax)
    80fa:	00 00                	add    %al,(%eax)
    80fc:	00 00                	add    %al,(%eax)
    80fe:	00 00                	add    %al,(%eax)
    8100:	00 00                	add    %al,(%eax)
    8102:	00 00                	add    %al,(%eax)
    8104:	00 00                	add    %al,(%eax)
    8106:	00 00                	add    %al,(%eax)
    8108:	00 00                	add    %al,(%eax)
    810a:	00 00                	add    %al,(%eax)
    810c:	00 00                	add    %al,(%eax)
    810e:	00 00                	add    %al,(%eax)
    8110:	00 00                	add    %al,(%eax)
    8112:	00 00                	add    %al,(%eax)
    8114:	00 00                	add    %al,(%eax)
    8116:	00 00                	add    %al,(%eax)
    8118:	00 00                	add    %al,(%eax)
    811a:	00 00                	add    %al,(%eax)
    811c:	00 00                	add    %al,(%eax)
    811e:	00 00                	add    %al,(%eax)
    8120:	00 00                	add    %al,(%eax)
    8122:	00 00                	add    %al,(%eax)
    8124:	00 00                	add    %al,(%eax)
    8126:	00 00                	add    %al,(%eax)
    8128:	00 00                	add    %al,(%eax)
    812a:	00 00                	add    %al,(%eax)
    812c:	00 00                	add    %al,(%eax)
    812e:	00 00                	add    %al,(%eax)
    8130:	00 00                	add    %al,(%eax)
    8132:	00 00                	add    %al,(%eax)
    8134:	00 00                	add    %al,(%eax)
    8136:	00 00                	add    %al,(%eax)
    8138:	00 00                	add    %al,(%eax)
    813a:	00 00                	add    %al,(%eax)
    813c:	00 00                	add    %al,(%eax)
    813e:	00 00                	add    %al,(%eax)
    8140:	00 00                	add    %al,(%eax)
    8142:	00 00                	add    %al,(%eax)
    8144:	00 00                	add    %al,(%eax)
    8146:	00 00                	add    %al,(%eax)
    8148:	00 00                	add    %al,(%eax)
    814a:	00 00                	add    %al,(%eax)
    814c:	00 00                	add    %al,(%eax)
    814e:	00 00                	add    %al,(%eax)
    8150:	00 00                	add    %al,(%eax)
    8152:	00 00                	add    %al,(%eax)
    8154:	00 00                	add    %al,(%eax)
    8156:	00 00                	add    %al,(%eax)
    8158:	00 00                	add    %al,(%eax)
    815a:	00 00                	add    %al,(%eax)
    815c:	00 00                	add    %al,(%eax)
    815e:	00 00                	add    %al,(%eax)
    8160:	00 00                	add    %al,(%eax)
    8162:	00 00                	add    %al,(%eax)
    8164:	00 00                	add    %al,(%eax)
    8166:	00 00                	add    %al,(%eax)
    8168:	00 00                	add    %al,(%eax)
    816a:	00 00                	add    %al,(%eax)
    816c:	00 00                	add    %al,(%eax)
    816e:	00 00                	add    %al,(%eax)
    8170:	00 00                	add    %al,(%eax)
    8172:	00 00                	add    %al,(%eax)
    8174:	00 00                	add    %al,(%eax)
    8176:	00 00                	add    %al,(%eax)
    8178:	00 00                	add    %al,(%eax)
    817a:	00 00                	add    %al,(%eax)
    817c:	00 00                	add    %al,(%eax)
    817e:	00 00                	add    %al,(%eax)
    8180:	00 00                	add    %al,(%eax)
    8182:	00 00                	add    %al,(%eax)
    8184:	00 00                	add    %al,(%eax)
    8186:	00 00                	add    %al,(%eax)
    8188:	00 00                	add    %al,(%eax)
    818a:	00 00                	add    %al,(%eax)
    818c:	00 00                	add    %al,(%eax)
    818e:	00 00                	add    %al,(%eax)
    8190:	00 00                	add    %al,(%eax)
    8192:	00 00                	add    %al,(%eax)
    8194:	00 00                	add    %al,(%eax)
    8196:	00 00                	add    %al,(%eax)
    8198:	00 00                	add    %al,(%eax)
    819a:	00 00                	add    %al,(%eax)
    819c:	00 00                	add    %al,(%eax)
    819e:	00 00                	add    %al,(%eax)
    81a0:	00 00                	add    %al,(%eax)
    81a2:	00 00                	add    %al,(%eax)
    81a4:	00 00                	add    %al,(%eax)
    81a6:	00 00                	add    %al,(%eax)
    81a8:	00 00                	add    %al,(%eax)
    81aa:	00 00                	add    %al,(%eax)
    81ac:	00 00                	add    %al,(%eax)
    81ae:	00 00                	add    %al,(%eax)
    81b0:	00 00                	add    %al,(%eax)
    81b2:	00 00                	add    %al,(%eax)
    81b4:	00 00                	add    %al,(%eax)
    81b6:	00 00                	add    %al,(%eax)
    81b8:	00 00                	add    %al,(%eax)
    81ba:	00 00                	add    %al,(%eax)
    81bc:	00 00                	add    %al,(%eax)
    81be:	00 00                	add    %al,(%eax)
    81c0:	00 00                	add    %al,(%eax)
    81c2:	00 00                	add    %al,(%eax)
    81c4:	00 00                	add    %al,(%eax)
    81c6:	00 00                	add    %al,(%eax)
    81c8:	00 00                	add    %al,(%eax)
    81ca:	00 00                	add    %al,(%eax)
    81cc:	00 00                	add    %al,(%eax)
    81ce:	00 00                	add    %al,(%eax)
    81d0:	00 00                	add    %al,(%eax)
    81d2:	00 00                	add    %al,(%eax)
    81d4:	00 00                	add    %al,(%eax)
    81d6:	00 00                	add    %al,(%eax)
    81d8:	00 00                	add    %al,(%eax)
    81da:	00 00                	add    %al,(%eax)
    81dc:	00 00                	add    %al,(%eax)
    81de:	00 00                	add    %al,(%eax)
    81e0:	00 00                	add    %al,(%eax)
    81e2:	00 00                	add    %al,(%eax)
    81e4:	00 00                	add    %al,(%eax)
    81e6:	00 00                	add    %al,(%eax)
    81e8:	00 00                	add    %al,(%eax)
    81ea:	00 00                	add    %al,(%eax)
    81ec:	00 00                	add    %al,(%eax)
    81ee:	00 00                	add    %al,(%eax)
    81f0:	00 00                	add    %al,(%eax)
    81f2:	00 00                	add    %al,(%eax)
    81f4:	00 00                	add    %al,(%eax)
    81f6:	00 00                	add    %al,(%eax)
    81f8:	00 00                	add    %al,(%eax)
    81fa:	00 00                	add    %al,(%eax)
    81fc:	00 00                	add    %al,(%eax)
    81fe:	00 00                	add    %al,(%eax)
    8200:	00 00                	add    %al,(%eax)
    8202:	00 00                	add    %al,(%eax)
    8204:	00 00                	add    %al,(%eax)
    8206:	00 00                	add    %al,(%eax)
    8208:	00 00                	add    %al,(%eax)
    820a:	00 00                	add    %al,(%eax)
    820c:	00 00                	add    %al,(%eax)
    820e:	00 00                	add    %al,(%eax)
    8210:	00 00                	add    %al,(%eax)
    8212:	00 00                	add    %al,(%eax)
    8214:	00 00                	add    %al,(%eax)
    8216:	00 00                	add    %al,(%eax)
    8218:	00 00                	add    %al,(%eax)
    821a:	00 00                	add    %al,(%eax)
    821c:	00 00                	add    %al,(%eax)
    821e:	00 00                	add    %al,(%eax)
    8220:	00 00                	add    %al,(%eax)
    8222:	00 00                	add    %al,(%eax)
    8224:	00 00                	add    %al,(%eax)
    8226:	00 00                	add    %al,(%eax)
    8228:	00 00                	add    %al,(%eax)
    822a:	00 00                	add    %al,(%eax)
    822c:	00 00                	add    %al,(%eax)
    822e:	00 00                	add    %al,(%eax)
    8230:	00 00                	add    %al,(%eax)
    8232:	00 00                	add    %al,(%eax)
    8234:	00 00                	add    %al,(%eax)
    8236:	00 00                	add    %al,(%eax)
    8238:	00 00                	add    %al,(%eax)
    823a:	00 00                	add    %al,(%eax)
    823c:	00 00                	add    %al,(%eax)
    823e:	00 00                	add    %al,(%eax)
    8240:	00 00                	add    %al,(%eax)
    8242:	00 00                	add    %al,(%eax)
    8244:	00 00                	add    %al,(%eax)
    8246:	00 00                	add    %al,(%eax)
    8248:	00 00                	add    %al,(%eax)
    824a:	00 00                	add    %al,(%eax)
    824c:	00 00                	add    %al,(%eax)
    824e:	00 00                	add    %al,(%eax)
    8250:	00 00                	add    %al,(%eax)
    8252:	00 00                	add    %al,(%eax)
    8254:	00 00                	add    %al,(%eax)
    8256:	00 00                	add    %al,(%eax)
    8258:	00 00                	add    %al,(%eax)
    825a:	00 00                	add    %al,(%eax)
    825c:	00 00                	add    %al,(%eax)
    825e:	00 00                	add    %al,(%eax)
    8260:	00 00                	add    %al,(%eax)
    8262:	00 00                	add    %al,(%eax)
    8264:	00 00                	add    %al,(%eax)
    8266:	00 00                	add    %al,(%eax)
    8268:	00 00                	add    %al,(%eax)
    826a:	00 00                	add    %al,(%eax)
    826c:	00 00                	add    %al,(%eax)
    826e:	00 00                	add    %al,(%eax)
    8270:	00 00                	add    %al,(%eax)
    8272:	00 00                	add    %al,(%eax)
    8274:	00 00                	add    %al,(%eax)
    8276:	00 00                	add    %al,(%eax)
    8278:	00 00                	add    %al,(%eax)
    827a:	00 00                	add    %al,(%eax)
    827c:	00 00                	add    %al,(%eax)
    827e:	00 00                	add    %al,(%eax)
    8280:	00 00                	add    %al,(%eax)
    8282:	00 00                	add    %al,(%eax)
    8284:	00 00                	add    %al,(%eax)
    8286:	00 00                	add    %al,(%eax)
    8288:	00 00                	add    %al,(%eax)
    828a:	00 00                	add    %al,(%eax)
    828c:	00 00                	add    %al,(%eax)
    828e:	00 00                	add    %al,(%eax)
    8290:	00 00                	add    %al,(%eax)
    8292:	00 00                	add    %al,(%eax)
    8294:	00 00                	add    %al,(%eax)
    8296:	00 00                	add    %al,(%eax)
    8298:	00 00                	add    %al,(%eax)
    829a:	00 00                	add    %al,(%eax)
    829c:	00 00                	add    %al,(%eax)
    829e:	00 00                	add    %al,(%eax)
    82a0:	00 00                	add    %al,(%eax)
    82a2:	00 00                	add    %al,(%eax)
    82a4:	00 00                	add    %al,(%eax)
    82a6:	00 00                	add    %al,(%eax)
    82a8:	00 00                	add    %al,(%eax)
    82aa:	00 00                	add    %al,(%eax)
    82ac:	00 00                	add    %al,(%eax)
    82ae:	00 00                	add    %al,(%eax)
    82b0:	00 00                	add    %al,(%eax)
    82b2:	00 00                	add    %al,(%eax)
    82b4:	00 00                	add    %al,(%eax)
    82b6:	00 00                	add    %al,(%eax)
    82b8:	00 00                	add    %al,(%eax)
    82ba:	00 00                	add    %al,(%eax)
    82bc:	00 00                	add    %al,(%eax)
    82be:	00 00                	add    %al,(%eax)
    82c0:	00 00                	add    %al,(%eax)
    82c2:	00 00                	add    %al,(%eax)
    82c4:	00 00                	add    %al,(%eax)
    82c6:	00 00                	add    %al,(%eax)
    82c8:	00 00                	add    %al,(%eax)
    82ca:	00 00                	add    %al,(%eax)
    82cc:	00 00                	add    %al,(%eax)
    82ce:	00 00                	add    %al,(%eax)
    82d0:	00 00                	add    %al,(%eax)
    82d2:	00 00                	add    %al,(%eax)
    82d4:	00 00                	add    %al,(%eax)
    82d6:	00 00                	add    %al,(%eax)
    82d8:	00 00                	add    %al,(%eax)
    82da:	00 00                	add    %al,(%eax)
    82dc:	00 00                	add    %al,(%eax)
    82de:	00 00                	add    %al,(%eax)
    82e0:	00 00                	add    %al,(%eax)
    82e2:	00 00                	add    %al,(%eax)
    82e4:	00 00                	add    %al,(%eax)
    82e6:	00 00                	add    %al,(%eax)
    82e8:	00 00                	add    %al,(%eax)
    82ea:	00 00                	add    %al,(%eax)
    82ec:	00 00                	add    %al,(%eax)
    82ee:	00 00                	add    %al,(%eax)
    82f0:	00 00                	add    %al,(%eax)
    82f2:	00 00                	add    %al,(%eax)
    82f4:	00 00                	add    %al,(%eax)
    82f6:	00 00                	add    %al,(%eax)
    82f8:	00 00                	add    %al,(%eax)
    82fa:	00 00                	add    %al,(%eax)
    82fc:	00 00                	add    %al,(%eax)
    82fe:	00 00                	add    %al,(%eax)
    8300:	00 00                	add    %al,(%eax)
    8302:	00 00                	add    %al,(%eax)
    8304:	00 00                	add    %al,(%eax)
    8306:	00 00                	add    %al,(%eax)
    8308:	00 00                	add    %al,(%eax)
    830a:	00 00                	add    %al,(%eax)
    830c:	00 00                	add    %al,(%eax)
    830e:	00 00                	add    %al,(%eax)
    8310:	00 00                	add    %al,(%eax)
    8312:	00 00                	add    %al,(%eax)
    8314:	00 00                	add    %al,(%eax)
    8316:	00 00                	add    %al,(%eax)
    8318:	00 00                	add    %al,(%eax)
    831a:	00 00                	add    %al,(%eax)
    831c:	00 00                	add    %al,(%eax)
    831e:	00 00                	add    %al,(%eax)
    8320:	00 00                	add    %al,(%eax)
    8322:	00 00                	add    %al,(%eax)
    8324:	00 00                	add    %al,(%eax)
    8326:	00 00                	add    %al,(%eax)
    8328:	00 00                	add    %al,(%eax)
    832a:	00 00                	add    %al,(%eax)
    832c:	00 00                	add    %al,(%eax)
    832e:	00 00                	add    %al,(%eax)
    8330:	00 00                	add    %al,(%eax)
    8332:	00 00                	add    %al,(%eax)
    8334:	00 00                	add    %al,(%eax)
    8336:	00 00                	add    %al,(%eax)
    8338:	00 00                	add    %al,(%eax)
    833a:	00 00                	add    %al,(%eax)
    833c:	00 00                	add    %al,(%eax)
    833e:	00 00                	add    %al,(%eax)
    8340:	00 00                	add    %al,(%eax)
    8342:	00 00                	add    %al,(%eax)
    8344:	00 00                	add    %al,(%eax)
    8346:	00 00                	add    %al,(%eax)
    8348:	00 00                	add    %al,(%eax)
    834a:	00 00                	add    %al,(%eax)
    834c:	00 00                	add    %al,(%eax)
    834e:	00 00                	add    %al,(%eax)
    8350:	00 00                	add    %al,(%eax)
    8352:	00 00                	add    %al,(%eax)
    8354:	00 00                	add    %al,(%eax)
    8356:	00 00                	add    %al,(%eax)
    8358:	00 00                	add    %al,(%eax)
    835a:	00 00                	add    %al,(%eax)
    835c:	00 00                	add    %al,(%eax)
    835e:	00 00                	add    %al,(%eax)
    8360:	00 00                	add    %al,(%eax)
    8362:	00 00                	add    %al,(%eax)
    8364:	00 00                	add    %al,(%eax)
    8366:	00 00                	add    %al,(%eax)
    8368:	00 00                	add    %al,(%eax)
    836a:	00 00                	add    %al,(%eax)
    836c:	00 00                	add    %al,(%eax)
    836e:	00 00                	add    %al,(%eax)
    8370:	00 00                	add    %al,(%eax)
    8372:	00 00                	add    %al,(%eax)
    8374:	00 00                	add    %al,(%eax)
    8376:	00 00                	add    %al,(%eax)
    8378:	00 00                	add    %al,(%eax)
    837a:	00 00                	add    %al,(%eax)
    837c:	00 00                	add    %al,(%eax)
    837e:	00 00                	add    %al,(%eax)
    8380:	00 00                	add    %al,(%eax)
    8382:	00 00                	add    %al,(%eax)
    8384:	00 00                	add    %al,(%eax)
    8386:	00 00                	add    %al,(%eax)
    8388:	00 00                	add    %al,(%eax)
    838a:	00 00                	add    %al,(%eax)
    838c:	00 00                	add    %al,(%eax)
    838e:	00 00                	add    %al,(%eax)
    8390:	00 00                	add    %al,(%eax)
    8392:	00 00                	add    %al,(%eax)
    8394:	00 00                	add    %al,(%eax)
    8396:	00 00                	add    %al,(%eax)
    8398:	00 00                	add    %al,(%eax)
    839a:	00 00                	add    %al,(%eax)
    839c:	00 00                	add    %al,(%eax)
    839e:	00 00                	add    %al,(%eax)
    83a0:	00 00                	add    %al,(%eax)
    83a2:	00 00                	add    %al,(%eax)
    83a4:	00 00                	add    %al,(%eax)
    83a6:	00 00                	add    %al,(%eax)
    83a8:	00 00                	add    %al,(%eax)
    83aa:	00 00                	add    %al,(%eax)
    83ac:	00 00                	add    %al,(%eax)
    83ae:	00 00                	add    %al,(%eax)
    83b0:	00 00                	add    %al,(%eax)
    83b2:	00 00                	add    %al,(%eax)
    83b4:	00 00                	add    %al,(%eax)
    83b6:	00 00                	add    %al,(%eax)
    83b8:	00 00                	add    %al,(%eax)
    83ba:	00 00                	add    %al,(%eax)
    83bc:	00 00                	add    %al,(%eax)
    83be:	00 00                	add    %al,(%eax)
    83c0:	00 00                	add    %al,(%eax)
    83c2:	00 00                	add    %al,(%eax)
    83c4:	00 00                	add    %al,(%eax)
    83c6:	00 00                	add    %al,(%eax)
    83c8:	00 00                	add    %al,(%eax)
    83ca:	00 00                	add    %al,(%eax)
    83cc:	00 00                	add    %al,(%eax)
    83ce:	00 00                	add    %al,(%eax)
    83d0:	00 00                	add    %al,(%eax)
    83d2:	00 00                	add    %al,(%eax)
    83d4:	00 00                	add    %al,(%eax)
    83d6:	00 00                	add    %al,(%eax)
    83d8:	00 00                	add    %al,(%eax)
    83da:	00 00                	add    %al,(%eax)
    83dc:	00 00                	add    %al,(%eax)
    83de:	00 00                	add    %al,(%eax)
    83e0:	00 00                	add    %al,(%eax)
    83e2:	00 00                	add    %al,(%eax)
    83e4:	00 00                	add    %al,(%eax)
    83e6:	00 00                	add    %al,(%eax)
    83e8:	00 00                	add    %al,(%eax)
    83ea:	00 00                	add    %al,(%eax)
    83ec:	00 00                	add    %al,(%eax)
    83ee:	00 00                	add    %al,(%eax)
    83f0:	00 00                	add    %al,(%eax)
    83f2:	00 00                	add    %al,(%eax)
    83f4:	00 00                	add    %al,(%eax)
    83f6:	00 00                	add    %al,(%eax)
    83f8:	00 00                	add    %al,(%eax)
    83fa:	00 00                	add    %al,(%eax)
    83fc:	00 00                	add    %al,(%eax)
    83fe:	00 00                	add    %al,(%eax)
    8400:	00 00                	add    %al,(%eax)
    8402:	00 00                	add    %al,(%eax)
    8404:	00 00                	add    %al,(%eax)
    8406:	00 00                	add    %al,(%eax)
    8408:	00 00                	add    %al,(%eax)
    840a:	00 00                	add    %al,(%eax)
    840c:	00 00                	add    %al,(%eax)
    840e:	00 00                	add    %al,(%eax)
    8410:	00 00                	add    %al,(%eax)
    8412:	00 00                	add    %al,(%eax)
    8414:	00 00                	add    %al,(%eax)
    8416:	00 00                	add    %al,(%eax)
    8418:	00 00                	add    %al,(%eax)
    841a:	00 00                	add    %al,(%eax)
    841c:	00 00                	add    %al,(%eax)
    841e:	00 00                	add    %al,(%eax)
    8420:	00 00                	add    %al,(%eax)
    8422:	00 00                	add    %al,(%eax)
    8424:	00 00                	add    %al,(%eax)
    8426:	00 00                	add    %al,(%eax)
    8428:	00 00                	add    %al,(%eax)
    842a:	00 00                	add    %al,(%eax)
    842c:	00 00                	add    %al,(%eax)
    842e:	00 00                	add    %al,(%eax)
    8430:	00 00                	add    %al,(%eax)
    8432:	00 00                	add    %al,(%eax)
    8434:	00 00                	add    %al,(%eax)
    8436:	00 00                	add    %al,(%eax)
    8438:	00 00                	add    %al,(%eax)
    843a:	00 00                	add    %al,(%eax)
    843c:	00 00                	add    %al,(%eax)
    843e:	00 00                	add    %al,(%eax)
    8440:	00 00                	add    %al,(%eax)
    8442:	00 00                	add    %al,(%eax)
    8444:	00 00                	add    %al,(%eax)
    8446:	00 00                	add    %al,(%eax)
    8448:	00 00                	add    %al,(%eax)
    844a:	00 00                	add    %al,(%eax)
    844c:	00 00                	add    %al,(%eax)
    844e:	00 00                	add    %al,(%eax)
    8450:	00 00                	add    %al,(%eax)
    8452:	00 00                	add    %al,(%eax)
    8454:	00 00                	add    %al,(%eax)
    8456:	00 00                	add    %al,(%eax)
    8458:	00 00                	add    %al,(%eax)
    845a:	00 00                	add    %al,(%eax)
    845c:	00 00                	add    %al,(%eax)
    845e:	00 00                	add    %al,(%eax)
    8460:	00 00                	add    %al,(%eax)
    8462:	00 00                	add    %al,(%eax)
    8464:	00 00                	add    %al,(%eax)
    8466:	00 00                	add    %al,(%eax)
    8468:	00 00                	add    %al,(%eax)
    846a:	00 00                	add    %al,(%eax)
    846c:	00 00                	add    %al,(%eax)
    846e:	00 00                	add    %al,(%eax)
    8470:	00 00                	add    %al,(%eax)
    8472:	00 00                	add    %al,(%eax)
    8474:	00 00                	add    %al,(%eax)
    8476:	00 00                	add    %al,(%eax)
    8478:	00 00                	add    %al,(%eax)
    847a:	00 00                	add    %al,(%eax)
    847c:	00 00                	add    %al,(%eax)
    847e:	00 00                	add    %al,(%eax)
    8480:	00 00                	add    %al,(%eax)
    8482:	00 00                	add    %al,(%eax)
    8484:	00 00                	add    %al,(%eax)
    8486:	00 00                	add    %al,(%eax)
    8488:	00 00                	add    %al,(%eax)
    848a:	00 00                	add    %al,(%eax)
    848c:	00 00                	add    %al,(%eax)
    848e:	00 00                	add    %al,(%eax)
    8490:	00 00                	add    %al,(%eax)
    8492:	00 00                	add    %al,(%eax)
    8494:	00 00                	add    %al,(%eax)
    8496:	00 00                	add    %al,(%eax)
    8498:	00 00                	add    %al,(%eax)
    849a:	00 00                	add    %al,(%eax)
    849c:	00 00                	add    %al,(%eax)
    849e:	00 00                	add    %al,(%eax)
    84a0:	00 00                	add    %al,(%eax)
    84a2:	00 00                	add    %al,(%eax)
    84a4:	00 00                	add    %al,(%eax)
    84a6:	00 00                	add    %al,(%eax)
    84a8:	00 00                	add    %al,(%eax)
    84aa:	00 00                	add    %al,(%eax)
    84ac:	00 00                	add    %al,(%eax)
    84ae:	00 00                	add    %al,(%eax)
    84b0:	00 00                	add    %al,(%eax)
    84b2:	00 00                	add    %al,(%eax)
    84b4:	00 00                	add    %al,(%eax)
    84b6:	00 00                	add    %al,(%eax)
    84b8:	00 00                	add    %al,(%eax)
    84ba:	00 00                	add    %al,(%eax)
    84bc:	00 00                	add    %al,(%eax)
    84be:	00 00                	add    %al,(%eax)
    84c0:	00 00                	add    %al,(%eax)
    84c2:	00 00                	add    %al,(%eax)
    84c4:	00 00                	add    %al,(%eax)
    84c6:	00 00                	add    %al,(%eax)
    84c8:	00 00                	add    %al,(%eax)
    84ca:	00 00                	add    %al,(%eax)
    84cc:	00 00                	add    %al,(%eax)
    84ce:	00 00                	add    %al,(%eax)
    84d0:	00 00                	add    %al,(%eax)
    84d2:	00 00                	add    %al,(%eax)
    84d4:	00 00                	add    %al,(%eax)
    84d6:	00 00                	add    %al,(%eax)
    84d8:	00 00                	add    %al,(%eax)
    84da:	00 00                	add    %al,(%eax)
    84dc:	00 00                	add    %al,(%eax)
    84de:	00 00                	add    %al,(%eax)
    84e0:	00 00                	add    %al,(%eax)
    84e2:	00 00                	add    %al,(%eax)
    84e4:	00 00                	add    %al,(%eax)
    84e6:	00 00                	add    %al,(%eax)
    84e8:	00 00                	add    %al,(%eax)
    84ea:	00 00                	add    %al,(%eax)
    84ec:	00 00                	add    %al,(%eax)
    84ee:	00 00                	add    %al,(%eax)
    84f0:	00 00                	add    %al,(%eax)
    84f2:	00 00                	add    %al,(%eax)
    84f4:	00 00                	add    %al,(%eax)
    84f6:	00 00                	add    %al,(%eax)
    84f8:	00 00                	add    %al,(%eax)
    84fa:	00 00                	add    %al,(%eax)
    84fc:	00 00                	add    %al,(%eax)
    84fe:	00 00                	add    %al,(%eax)
    8500:	00 00                	add    %al,(%eax)
    8502:	00 00                	add    %al,(%eax)
    8504:	00 00                	add    %al,(%eax)
    8506:	00 00                	add    %al,(%eax)
    8508:	00 00                	add    %al,(%eax)
    850a:	00 00                	add    %al,(%eax)
    850c:	00 00                	add    %al,(%eax)
    850e:	00 00                	add    %al,(%eax)
    8510:	00 00                	add    %al,(%eax)
    8512:	00 00                	add    %al,(%eax)
    8514:	00 00                	add    %al,(%eax)
    8516:	00 00                	add    %al,(%eax)
    8518:	00 00                	add    %al,(%eax)
    851a:	00 00                	add    %al,(%eax)
    851c:	00 00                	add    %al,(%eax)
    851e:	00 00                	add    %al,(%eax)
    8520:	00 00                	add    %al,(%eax)
    8522:	00 00                	add    %al,(%eax)
    8524:	00 00                	add    %al,(%eax)
    8526:	00 00                	add    %al,(%eax)
    8528:	00 00                	add    %al,(%eax)
    852a:	00 00                	add    %al,(%eax)
    852c:	00 00                	add    %al,(%eax)
    852e:	00 00                	add    %al,(%eax)
    8530:	00 00                	add    %al,(%eax)
    8532:	00 00                	add    %al,(%eax)
    8534:	00 00                	add    %al,(%eax)
    8536:	00 00                	add    %al,(%eax)
    8538:	00 00                	add    %al,(%eax)
    853a:	00 00                	add    %al,(%eax)
    853c:	00 00                	add    %al,(%eax)
    853e:	00 00                	add    %al,(%eax)
    8540:	00 00                	add    %al,(%eax)
    8542:	00 00                	add    %al,(%eax)
    8544:	00 00                	add    %al,(%eax)
    8546:	00 00                	add    %al,(%eax)
    8548:	00 00                	add    %al,(%eax)
    854a:	00 00                	add    %al,(%eax)
    854c:	00 00                	add    %al,(%eax)
    854e:	00 00                	add    %al,(%eax)
    8550:	00 00                	add    %al,(%eax)
    8552:	00 00                	add    %al,(%eax)
    8554:	00 00                	add    %al,(%eax)
    8556:	00 00                	add    %al,(%eax)
    8558:	00 00                	add    %al,(%eax)
    855a:	00 00                	add    %al,(%eax)
    855c:	00 00                	add    %al,(%eax)
    855e:	00 00                	add    %al,(%eax)
    8560:	00 00                	add    %al,(%eax)
    8562:	00 00                	add    %al,(%eax)
    8564:	00 00                	add    %al,(%eax)
    8566:	00 00                	add    %al,(%eax)
    8568:	00 00                	add    %al,(%eax)
    856a:	00 00                	add    %al,(%eax)
    856c:	00 00                	add    %al,(%eax)
    856e:	00 00                	add    %al,(%eax)
    8570:	00 00                	add    %al,(%eax)
    8572:	00 00                	add    %al,(%eax)
    8574:	00 00                	add    %al,(%eax)
    8576:	00 00                	add    %al,(%eax)
    8578:	00 00                	add    %al,(%eax)
    857a:	00 00                	add    %al,(%eax)
    857c:	00 00                	add    %al,(%eax)
    857e:	00 00                	add    %al,(%eax)
    8580:	00 00                	add    %al,(%eax)
    8582:	00 00                	add    %al,(%eax)
    8584:	00 00                	add    %al,(%eax)
    8586:	00 00                	add    %al,(%eax)
    8588:	00 00                	add    %al,(%eax)
    858a:	00 00                	add    %al,(%eax)
    858c:	00 00                	add    %al,(%eax)
    858e:	00 00                	add    %al,(%eax)
    8590:	00 00                	add    %al,(%eax)
    8592:	00 00                	add    %al,(%eax)
    8594:	00 00                	add    %al,(%eax)
    8596:	00 00                	add    %al,(%eax)
    8598:	00 00                	add    %al,(%eax)
    859a:	00 00                	add    %al,(%eax)
    859c:	00 00                	add    %al,(%eax)
    859e:	00 00                	add    %al,(%eax)
    85a0:	00 00                	add    %al,(%eax)
    85a2:	00 00                	add    %al,(%eax)
    85a4:	00 00                	add    %al,(%eax)
    85a6:	00 00                	add    %al,(%eax)
    85a8:	00 00                	add    %al,(%eax)
    85aa:	00 00                	add    %al,(%eax)
    85ac:	00 00                	add    %al,(%eax)
    85ae:	00 00                	add    %al,(%eax)
    85b0:	00 00                	add    %al,(%eax)
    85b2:	00 00                	add    %al,(%eax)
    85b4:	00 00                	add    %al,(%eax)
    85b6:	00 00                	add    %al,(%eax)
    85b8:	00 00                	add    %al,(%eax)
    85ba:	00 00                	add    %al,(%eax)
    85bc:	00 00                	add    %al,(%eax)
    85be:	00 00                	add    %al,(%eax)
    85c0:	00 00                	add    %al,(%eax)
    85c2:	00 00                	add    %al,(%eax)
    85c4:	00 00                	add    %al,(%eax)
    85c6:	00 00                	add    %al,(%eax)
    85c8:	00 00                	add    %al,(%eax)
    85ca:	00 00                	add    %al,(%eax)
    85cc:	00 00                	add    %al,(%eax)
    85ce:	00 00                	add    %al,(%eax)
    85d0:	00 00                	add    %al,(%eax)
    85d2:	00 00                	add    %al,(%eax)
    85d4:	00 00                	add    %al,(%eax)
    85d6:	00 00                	add    %al,(%eax)
    85d8:	00 00                	add    %al,(%eax)
    85da:	00 00                	add    %al,(%eax)
    85dc:	00 00                	add    %al,(%eax)
    85de:	00 00                	add    %al,(%eax)
    85e0:	00 00                	add    %al,(%eax)
    85e2:	00 00                	add    %al,(%eax)
    85e4:	00 00                	add    %al,(%eax)
    85e6:	00 00                	add    %al,(%eax)
    85e8:	00 00                	add    %al,(%eax)
    85ea:	00 00                	add    %al,(%eax)
    85ec:	00 00                	add    %al,(%eax)
    85ee:	00 00                	add    %al,(%eax)
    85f0:	00 00                	add    %al,(%eax)
    85f2:	00 00                	add    %al,(%eax)
    85f4:	00 00                	add    %al,(%eax)
    85f6:	00 00                	add    %al,(%eax)
    85f8:	00 00                	add    %al,(%eax)
    85fa:	00 00                	add    %al,(%eax)
    85fc:	00 00                	add    %al,(%eax)
    85fe:	00 00                	add    %al,(%eax)
    8600:	00 00                	add    %al,(%eax)
    8602:	00 00                	add    %al,(%eax)
    8604:	00 00                	add    %al,(%eax)
    8606:	00 00                	add    %al,(%eax)
    8608:	00 00                	add    %al,(%eax)
    860a:	00 00                	add    %al,(%eax)
    860c:	00 00                	add    %al,(%eax)
    860e:	00 00                	add    %al,(%eax)
    8610:	00 00                	add    %al,(%eax)
    8612:	00 00                	add    %al,(%eax)
    8614:	00 00                	add    %al,(%eax)
    8616:	00 00                	add    %al,(%eax)
    8618:	00 00                	add    %al,(%eax)
    861a:	00 00                	add    %al,(%eax)
    861c:	00 00                	add    %al,(%eax)
    861e:	00 00                	add    %al,(%eax)
    8620:	00 00                	add    %al,(%eax)
    8622:	00 00                	add    %al,(%eax)
    8624:	00 00                	add    %al,(%eax)
    8626:	00 00                	add    %al,(%eax)
    8628:	00 00                	add    %al,(%eax)
    862a:	00 00                	add    %al,(%eax)
    862c:	00 00                	add    %al,(%eax)
    862e:	00 00                	add    %al,(%eax)
    8630:	00 00                	add    %al,(%eax)
    8632:	00 00                	add    %al,(%eax)
    8634:	00 00                	add    %al,(%eax)
    8636:	00 00                	add    %al,(%eax)
    8638:	00 00                	add    %al,(%eax)
    863a:	00 00                	add    %al,(%eax)
    863c:	00 00                	add    %al,(%eax)
    863e:	00 00                	add    %al,(%eax)
    8640:	00 00                	add    %al,(%eax)
    8642:	00 00                	add    %al,(%eax)
    8644:	00 00                	add    %al,(%eax)
    8646:	00 00                	add    %al,(%eax)
    8648:	00 00                	add    %al,(%eax)
    864a:	00 00                	add    %al,(%eax)
    864c:	00 00                	add    %al,(%eax)
    864e:	00 00                	add    %al,(%eax)
    8650:	00 00                	add    %al,(%eax)
    8652:	00 00                	add    %al,(%eax)
    8654:	00 00                	add    %al,(%eax)
    8656:	00 00                	add    %al,(%eax)
    8658:	00 00                	add    %al,(%eax)
    865a:	00 00                	add    %al,(%eax)
    865c:	00 00                	add    %al,(%eax)
    865e:	00 00                	add    %al,(%eax)
    8660:	00 00                	add    %al,(%eax)
    8662:	00 00                	add    %al,(%eax)
    8664:	00 00                	add    %al,(%eax)
    8666:	00 00                	add    %al,(%eax)
    8668:	00 00                	add    %al,(%eax)
    866a:	00 00                	add    %al,(%eax)
    866c:	00 00                	add    %al,(%eax)
    866e:	00 00                	add    %al,(%eax)
    8670:	00 00                	add    %al,(%eax)
    8672:	00 00                	add    %al,(%eax)
    8674:	00 00                	add    %al,(%eax)
    8676:	00 00                	add    %al,(%eax)
    8678:	00 00                	add    %al,(%eax)
    867a:	00 00                	add    %al,(%eax)
    867c:	00 00                	add    %al,(%eax)
    867e:	00 00                	add    %al,(%eax)
    8680:	00 00                	add    %al,(%eax)
    8682:	00 00                	add    %al,(%eax)
    8684:	00 00                	add    %al,(%eax)
    8686:	00 00                	add    %al,(%eax)
    8688:	00 00                	add    %al,(%eax)
    868a:	00 00                	add    %al,(%eax)
    868c:	00 00                	add    %al,(%eax)
    868e:	00 00                	add    %al,(%eax)
    8690:	00 00                	add    %al,(%eax)
    8692:	00 00                	add    %al,(%eax)
    8694:	00 00                	add    %al,(%eax)
    8696:	00 00                	add    %al,(%eax)
    8698:	00 00                	add    %al,(%eax)
    869a:	00 00                	add    %al,(%eax)
    869c:	00 00                	add    %al,(%eax)
    869e:	00 00                	add    %al,(%eax)
    86a0:	00 00                	add    %al,(%eax)
    86a2:	00 00                	add    %al,(%eax)
    86a4:	00 00                	add    %al,(%eax)
    86a6:	00 00                	add    %al,(%eax)
    86a8:	00 00                	add    %al,(%eax)
    86aa:	00 00                	add    %al,(%eax)
    86ac:	00 00                	add    %al,(%eax)
    86ae:	00 00                	add    %al,(%eax)
    86b0:	00 00                	add    %al,(%eax)
    86b2:	00 00                	add    %al,(%eax)
    86b4:	00 00                	add    %al,(%eax)
    86b6:	00 00                	add    %al,(%eax)
    86b8:	00 00                	add    %al,(%eax)
    86ba:	00 00                	add    %al,(%eax)
    86bc:	00 00                	add    %al,(%eax)
    86be:	00 00                	add    %al,(%eax)
    86c0:	00 00                	add    %al,(%eax)
    86c2:	00 00                	add    %al,(%eax)
    86c4:	00 00                	add    %al,(%eax)
    86c6:	00 00                	add    %al,(%eax)
    86c8:	00 00                	add    %al,(%eax)
    86ca:	00 00                	add    %al,(%eax)
    86cc:	00 00                	add    %al,(%eax)
    86ce:	00 00                	add    %al,(%eax)
    86d0:	00 00                	add    %al,(%eax)
    86d2:	00 00                	add    %al,(%eax)
    86d4:	00 00                	add    %al,(%eax)
    86d6:	00 00                	add    %al,(%eax)
    86d8:	00 00                	add    %al,(%eax)
    86da:	00 00                	add    %al,(%eax)
    86dc:	00 00                	add    %al,(%eax)
    86de:	00 00                	add    %al,(%eax)
    86e0:	00 00                	add    %al,(%eax)
    86e2:	00 00                	add    %al,(%eax)
    86e4:	00 00                	add    %al,(%eax)
    86e6:	00 00                	add    %al,(%eax)
    86e8:	00 00                	add    %al,(%eax)
    86ea:	00 00                	add    %al,(%eax)
    86ec:	00 00                	add    %al,(%eax)
    86ee:	00 00                	add    %al,(%eax)
    86f0:	00 00                	add    %al,(%eax)
    86f2:	00 00                	add    %al,(%eax)
    86f4:	00 00                	add    %al,(%eax)
    86f6:	00 00                	add    %al,(%eax)
    86f8:	00 00                	add    %al,(%eax)
    86fa:	00 00                	add    %al,(%eax)
    86fc:	00 00                	add    %al,(%eax)
    86fe:	00 00                	add    %al,(%eax)
    8700:	00 00                	add    %al,(%eax)
    8702:	00 00                	add    %al,(%eax)
    8704:	00 00                	add    %al,(%eax)
    8706:	00 00                	add    %al,(%eax)
    8708:	00 00                	add    %al,(%eax)
    870a:	00 00                	add    %al,(%eax)
    870c:	00 00                	add    %al,(%eax)
    870e:	00 00                	add    %al,(%eax)
    8710:	00 00                	add    %al,(%eax)
    8712:	00 00                	add    %al,(%eax)
    8714:	00 00                	add    %al,(%eax)
    8716:	00 00                	add    %al,(%eax)
    8718:	00 00                	add    %al,(%eax)
    871a:	00 00                	add    %al,(%eax)
    871c:	00 00                	add    %al,(%eax)
    871e:	00 00                	add    %al,(%eax)
    8720:	00 00                	add    %al,(%eax)
    8722:	00 00                	add    %al,(%eax)
    8724:	00 00                	add    %al,(%eax)
    8726:	00 00                	add    %al,(%eax)
    8728:	00 00                	add    %al,(%eax)
    872a:	00 00                	add    %al,(%eax)
    872c:	00 00                	add    %al,(%eax)
    872e:	00 00                	add    %al,(%eax)
    8730:	00 00                	add    %al,(%eax)
    8732:	00 00                	add    %al,(%eax)
    8734:	00 00                	add    %al,(%eax)
    8736:	00 00                	add    %al,(%eax)
    8738:	00 00                	add    %al,(%eax)
    873a:	00 00                	add    %al,(%eax)
    873c:	00 00                	add    %al,(%eax)
    873e:	00 00                	add    %al,(%eax)
    8740:	00 00                	add    %al,(%eax)
    8742:	00 00                	add    %al,(%eax)
    8744:	00 00                	add    %al,(%eax)
    8746:	00 00                	add    %al,(%eax)
    8748:	00 00                	add    %al,(%eax)
    874a:	00 00                	add    %al,(%eax)
    874c:	00 00                	add    %al,(%eax)
    874e:	00 00                	add    %al,(%eax)
    8750:	00 00                	add    %al,(%eax)
    8752:	00 00                	add    %al,(%eax)
    8754:	00 00                	add    %al,(%eax)
    8756:	00 00                	add    %al,(%eax)
    8758:	00 00                	add    %al,(%eax)
    875a:	00 00                	add    %al,(%eax)
    875c:	00 00                	add    %al,(%eax)
    875e:	00 00                	add    %al,(%eax)
    8760:	00 00                	add    %al,(%eax)
    8762:	00 00                	add    %al,(%eax)
    8764:	00 00                	add    %al,(%eax)
    8766:	00 00                	add    %al,(%eax)
    8768:	00 00                	add    %al,(%eax)
    876a:	00 00                	add    %al,(%eax)
    876c:	00 00                	add    %al,(%eax)
    876e:	00 00                	add    %al,(%eax)
    8770:	00 00                	add    %al,(%eax)
    8772:	00 00                	add    %al,(%eax)
    8774:	00 00                	add    %al,(%eax)
    8776:	00 00                	add    %al,(%eax)
    8778:	00 00                	add    %al,(%eax)
    877a:	00 00                	add    %al,(%eax)
    877c:	00 00                	add    %al,(%eax)
    877e:	00 00                	add    %al,(%eax)
    8780:	00 00                	add    %al,(%eax)
    8782:	00 00                	add    %al,(%eax)
    8784:	00 00                	add    %al,(%eax)
    8786:	00 00                	add    %al,(%eax)
    8788:	00 00                	add    %al,(%eax)
    878a:	00 00                	add    %al,(%eax)
    878c:	00 00                	add    %al,(%eax)
    878e:	00 00                	add    %al,(%eax)
    8790:	00 00                	add    %al,(%eax)
    8792:	00 00                	add    %al,(%eax)
    8794:	00 00                	add    %al,(%eax)
    8796:	00 00                	add    %al,(%eax)
    8798:	00 00                	add    %al,(%eax)
    879a:	00 00                	add    %al,(%eax)
    879c:	00 00                	add    %al,(%eax)
    879e:	00 00                	add    %al,(%eax)
    87a0:	00 00                	add    %al,(%eax)
    87a2:	00 00                	add    %al,(%eax)
    87a4:	00 00                	add    %al,(%eax)
    87a6:	00 00                	add    %al,(%eax)
    87a8:	00 00                	add    %al,(%eax)
    87aa:	00 00                	add    %al,(%eax)
    87ac:	00 00                	add    %al,(%eax)
    87ae:	00 00                	add    %al,(%eax)
    87b0:	00 00                	add    %al,(%eax)
    87b2:	00 00                	add    %al,(%eax)
    87b4:	00 00                	add    %al,(%eax)
    87b6:	00 00                	add    %al,(%eax)
    87b8:	00 00                	add    %al,(%eax)
    87ba:	00 00                	add    %al,(%eax)
    87bc:	00 00                	add    %al,(%eax)
    87be:	00 00                	add    %al,(%eax)
    87c0:	00 00                	add    %al,(%eax)
    87c2:	00 00                	add    %al,(%eax)
    87c4:	00 00                	add    %al,(%eax)
    87c6:	00 00                	add    %al,(%eax)
    87c8:	00 00                	add    %al,(%eax)
    87ca:	00 00                	add    %al,(%eax)
    87cc:	00 00                	add    %al,(%eax)
    87ce:	00 00                	add    %al,(%eax)
    87d0:	00 00                	add    %al,(%eax)
    87d2:	00 00                	add    %al,(%eax)
    87d4:	00 00                	add    %al,(%eax)
    87d6:	00 00                	add    %al,(%eax)
    87d8:	00 00                	add    %al,(%eax)
    87da:	00 00                	add    %al,(%eax)
    87dc:	00 00                	add    %al,(%eax)
    87de:	00 00                	add    %al,(%eax)
    87e0:	00 00                	add    %al,(%eax)
    87e2:	00 00                	add    %al,(%eax)
    87e4:	00 00                	add    %al,(%eax)
    87e6:	00 00                	add    %al,(%eax)
    87e8:	00 00                	add    %al,(%eax)
    87ea:	00 00                	add    %al,(%eax)
    87ec:	00 00                	add    %al,(%eax)
    87ee:	00 00                	add    %al,(%eax)
    87f0:	00 00                	add    %al,(%eax)
    87f2:	00 00                	add    %al,(%eax)
    87f4:	00 00                	add    %al,(%eax)
    87f6:	00 00                	add    %al,(%eax)
    87f8:	00 00                	add    %al,(%eax)
    87fa:	00 00                	add    %al,(%eax)
    87fc:	00 00                	add    %al,(%eax)
    87fe:	00 00                	add    %al,(%eax)
    8800:	00 00                	add    %al,(%eax)
    8802:	00 00                	add    %al,(%eax)
    8804:	00 00                	add    %al,(%eax)
    8806:	00 00                	add    %al,(%eax)
    8808:	00 00                	add    %al,(%eax)
    880a:	00 00                	add    %al,(%eax)
    880c:	00 00                	add    %al,(%eax)
    880e:	00 00                	add    %al,(%eax)
    8810:	00 00                	add    %al,(%eax)
    8812:	00 00                	add    %al,(%eax)
    8814:	00 00                	add    %al,(%eax)
    8816:	00 00                	add    %al,(%eax)
    8818:	00 00                	add    %al,(%eax)
    881a:	00 00                	add    %al,(%eax)
    881c:	00 00                	add    %al,(%eax)
    881e:	00 00                	add    %al,(%eax)
    8820:	00 00                	add    %al,(%eax)
    8822:	00 00                	add    %al,(%eax)
    8824:	00 00                	add    %al,(%eax)
    8826:	00 00                	add    %al,(%eax)
    8828:	00 00                	add    %al,(%eax)
    882a:	00 00                	add    %al,(%eax)
    882c:	00 00                	add    %al,(%eax)
    882e:	00 00                	add    %al,(%eax)
    8830:	00 00                	add    %al,(%eax)
    8832:	00 00                	add    %al,(%eax)
    8834:	00 00                	add    %al,(%eax)
    8836:	00 00                	add    %al,(%eax)
    8838:	00 00                	add    %al,(%eax)
    883a:	00 00                	add    %al,(%eax)
    883c:	00 00                	add    %al,(%eax)
    883e:	00 00                	add    %al,(%eax)
    8840:	00 00                	add    %al,(%eax)
    8842:	00 00                	add    %al,(%eax)
    8844:	00 00                	add    %al,(%eax)
    8846:	00 00                	add    %al,(%eax)
    8848:	00 00                	add    %al,(%eax)
    884a:	00 00                	add    %al,(%eax)
    884c:	00 00                	add    %al,(%eax)
    884e:	00 00                	add    %al,(%eax)
    8850:	00 00                	add    %al,(%eax)
    8852:	00 00                	add    %al,(%eax)
    8854:	00 00                	add    %al,(%eax)
    8856:	00 00                	add    %al,(%eax)
    8858:	00 00                	add    %al,(%eax)
    885a:	00 00                	add    %al,(%eax)
    885c:	00 00                	add    %al,(%eax)
    885e:	00 00                	add    %al,(%eax)
    8860:	00 00                	add    %al,(%eax)
    8862:	00 00                	add    %al,(%eax)
    8864:	00 00                	add    %al,(%eax)
    8866:	00 00                	add    %al,(%eax)
    8868:	00 00                	add    %al,(%eax)
    886a:	00 00                	add    %al,(%eax)
    886c:	00 00                	add    %al,(%eax)
    886e:	00 00                	add    %al,(%eax)
    8870:	00 00                	add    %al,(%eax)
    8872:	00 00                	add    %al,(%eax)
    8874:	00 00                	add    %al,(%eax)
    8876:	00 00                	add    %al,(%eax)
    8878:	00 00                	add    %al,(%eax)
    887a:	00 00                	add    %al,(%eax)
    887c:	00 00                	add    %al,(%eax)
    887e:	00 00                	add    %al,(%eax)
    8880:	00 00                	add    %al,(%eax)
    8882:	00 00                	add    %al,(%eax)
    8884:	00 00                	add    %al,(%eax)
    8886:	00 00                	add    %al,(%eax)
    8888:	00 00                	add    %al,(%eax)
    888a:	00 00                	add    %al,(%eax)
    888c:	00 00                	add    %al,(%eax)
    888e:	00 00                	add    %al,(%eax)
    8890:	00 00                	add    %al,(%eax)
    8892:	00 00                	add    %al,(%eax)
    8894:	00 00                	add    %al,(%eax)
    8896:	00 00                	add    %al,(%eax)
    8898:	00 00                	add    %al,(%eax)
    889a:	00 00                	add    %al,(%eax)
    889c:	00 00                	add    %al,(%eax)
    889e:	00 00                	add    %al,(%eax)
    88a0:	00 00                	add    %al,(%eax)
    88a2:	00 00                	add    %al,(%eax)
    88a4:	00 00                	add    %al,(%eax)
    88a6:	00 00                	add    %al,(%eax)
    88a8:	00 00                	add    %al,(%eax)
    88aa:	00 00                	add    %al,(%eax)
    88ac:	00 00                	add    %al,(%eax)
    88ae:	00 00                	add    %al,(%eax)
    88b0:	00 00                	add    %al,(%eax)
    88b2:	00 00                	add    %al,(%eax)
    88b4:	00 00                	add    %al,(%eax)
    88b6:	00 00                	add    %al,(%eax)
    88b8:	00 00                	add    %al,(%eax)
    88ba:	00 00                	add    %al,(%eax)
    88bc:	00 00                	add    %al,(%eax)
    88be:	00 00                	add    %al,(%eax)
    88c0:	00 00                	add    %al,(%eax)
    88c2:	00 00                	add    %al,(%eax)
    88c4:	00 00                	add    %al,(%eax)
    88c6:	00 00                	add    %al,(%eax)
    88c8:	00 00                	add    %al,(%eax)
    88ca:	00 00                	add    %al,(%eax)
    88cc:	00 00                	add    %al,(%eax)
    88ce:	00 00                	add    %al,(%eax)
    88d0:	00 00                	add    %al,(%eax)
    88d2:	00 00                	add    %al,(%eax)
    88d4:	00 00                	add    %al,(%eax)
    88d6:	00 00                	add    %al,(%eax)
    88d8:	00 00                	add    %al,(%eax)
    88da:	00 00                	add    %al,(%eax)
    88dc:	00 00                	add    %al,(%eax)
    88de:	00 00                	add    %al,(%eax)
    88e0:	00 00                	add    %al,(%eax)
    88e2:	00 00                	add    %al,(%eax)
    88e4:	00 00                	add    %al,(%eax)
    88e6:	00 00                	add    %al,(%eax)
    88e8:	00 00                	add    %al,(%eax)
    88ea:	00 00                	add    %al,(%eax)
    88ec:	00 00                	add    %al,(%eax)
    88ee:	00 00                	add    %al,(%eax)
    88f0:	00 00                	add    %al,(%eax)
    88f2:	00 00                	add    %al,(%eax)
    88f4:	00 00                	add    %al,(%eax)
    88f6:	00 00                	add    %al,(%eax)
    88f8:	00 00                	add    %al,(%eax)
    88fa:	00 00                	add    %al,(%eax)
    88fc:	00 00                	add    %al,(%eax)
    88fe:	00 00                	add    %al,(%eax)
    8900:	00 00                	add    %al,(%eax)
    8902:	00 00                	add    %al,(%eax)
    8904:	00 00                	add    %al,(%eax)
    8906:	00 00                	add    %al,(%eax)
    8908:	00 00                	add    %al,(%eax)
    890a:	00 00                	add    %al,(%eax)
    890c:	00 00                	add    %al,(%eax)
    890e:	00 00                	add    %al,(%eax)
    8910:	00 00                	add    %al,(%eax)
    8912:	00 00                	add    %al,(%eax)
    8914:	00 00                	add    %al,(%eax)
    8916:	00 00                	add    %al,(%eax)
    8918:	00 00                	add    %al,(%eax)
    891a:	00 00                	add    %al,(%eax)
    891c:	00 00                	add    %al,(%eax)
    891e:	00 00                	add    %al,(%eax)
    8920:	00 00                	add    %al,(%eax)
    8922:	00 00                	add    %al,(%eax)
    8924:	00 00                	add    %al,(%eax)
    8926:	00 00                	add    %al,(%eax)
    8928:	00 00                	add    %al,(%eax)
    892a:	00 00                	add    %al,(%eax)
    892c:	00 00                	add    %al,(%eax)
    892e:	00 00                	add    %al,(%eax)
    8930:	00 00                	add    %al,(%eax)
    8932:	00 00                	add    %al,(%eax)
    8934:	00 00                	add    %al,(%eax)
    8936:	00 00                	add    %al,(%eax)
    8938:	00 00                	add    %al,(%eax)
    893a:	00 00                	add    %al,(%eax)
    893c:	00 00                	add    %al,(%eax)
    893e:	00 00                	add    %al,(%eax)
    8940:	00 00                	add    %al,(%eax)
    8942:	00 00                	add    %al,(%eax)
    8944:	00 00                	add    %al,(%eax)
    8946:	00 00                	add    %al,(%eax)
    8948:	00 00                	add    %al,(%eax)
    894a:	00 00                	add    %al,(%eax)
    894c:	00 00                	add    %al,(%eax)
    894e:	00 00                	add    %al,(%eax)
    8950:	00 00                	add    %al,(%eax)
    8952:	00 00                	add    %al,(%eax)
    8954:	00 00                	add    %al,(%eax)
    8956:	00 00                	add    %al,(%eax)
    8958:	00 00                	add    %al,(%eax)
    895a:	00 00                	add    %al,(%eax)
    895c:	00 00                	add    %al,(%eax)
    895e:	00 00                	add    %al,(%eax)
    8960:	00 00                	add    %al,(%eax)
    8962:	00 00                	add    %al,(%eax)
    8964:	00 00                	add    %al,(%eax)
    8966:	00 00                	add    %al,(%eax)
    8968:	00 00                	add    %al,(%eax)
    896a:	00 00                	add    %al,(%eax)
    896c:	00 00                	add    %al,(%eax)
    896e:	00 00                	add    %al,(%eax)
    8970:	00 00                	add    %al,(%eax)
    8972:	00 00                	add    %al,(%eax)
    8974:	00 00                	add    %al,(%eax)
    8976:	00 00                	add    %al,(%eax)
    8978:	00 00                	add    %al,(%eax)
    897a:	00 00                	add    %al,(%eax)
    897c:	00 00                	add    %al,(%eax)
    897e:	00 00                	add    %al,(%eax)
    8980:	00 00                	add    %al,(%eax)
    8982:	00 00                	add    %al,(%eax)
    8984:	00 00                	add    %al,(%eax)
    8986:	00 00                	add    %al,(%eax)
    8988:	00 00                	add    %al,(%eax)
    898a:	00 00                	add    %al,(%eax)
    898c:	00 00                	add    %al,(%eax)
    898e:	00 00                	add    %al,(%eax)
    8990:	00 00                	add    %al,(%eax)
    8992:	00 00                	add    %al,(%eax)
    8994:	00 00                	add    %al,(%eax)
    8996:	00 00                	add    %al,(%eax)
    8998:	00 00                	add    %al,(%eax)
    899a:	00 00                	add    %al,(%eax)
    899c:	00 00                	add    %al,(%eax)
    899e:	00 00                	add    %al,(%eax)
    89a0:	00 00                	add    %al,(%eax)
    89a2:	00 00                	add    %al,(%eax)
    89a4:	00 00                	add    %al,(%eax)
    89a6:	00 00                	add    %al,(%eax)
    89a8:	00 00                	add    %al,(%eax)
    89aa:	00 00                	add    %al,(%eax)
    89ac:	00 00                	add    %al,(%eax)
    89ae:	00 00                	add    %al,(%eax)
    89b0:	00 00                	add    %al,(%eax)
    89b2:	00 00                	add    %al,(%eax)
    89b4:	00 00                	add    %al,(%eax)
    89b6:	00 00                	add    %al,(%eax)
    89b8:	00 00                	add    %al,(%eax)
    89ba:	00 00                	add    %al,(%eax)
    89bc:	00 00                	add    %al,(%eax)
    89be:	00 00                	add    %al,(%eax)
    89c0:	00 00                	add    %al,(%eax)
    89c2:	00 00                	add    %al,(%eax)
    89c4:	00 00                	add    %al,(%eax)
    89c6:	00 00                	add    %al,(%eax)
    89c8:	00 00                	add    %al,(%eax)
    89ca:	00 00                	add    %al,(%eax)
    89cc:	00 00                	add    %al,(%eax)
    89ce:	00 00                	add    %al,(%eax)
    89d0:	00 00                	add    %al,(%eax)
    89d2:	00 00                	add    %al,(%eax)
    89d4:	00 00                	add    %al,(%eax)
    89d6:	00 00                	add    %al,(%eax)
    89d8:	00 00                	add    %al,(%eax)
    89da:	00 00                	add    %al,(%eax)
    89dc:	00 00                	add    %al,(%eax)
    89de:	00 00                	add    %al,(%eax)
    89e0:	00 00                	add    %al,(%eax)
    89e2:	00 00                	add    %al,(%eax)
    89e4:	00 00                	add    %al,(%eax)
    89e6:	00 00                	add    %al,(%eax)
    89e8:	00 00                	add    %al,(%eax)
    89ea:	00 00                	add    %al,(%eax)
    89ec:	00 00                	add    %al,(%eax)
    89ee:	00 00                	add    %al,(%eax)
    89f0:	00 00                	add    %al,(%eax)
    89f2:	00 00                	add    %al,(%eax)
    89f4:	00 00                	add    %al,(%eax)
    89f6:	00 00                	add    %al,(%eax)
    89f8:	00 00                	add    %al,(%eax)
    89fa:	00 00                	add    %al,(%eax)
    89fc:	00 00                	add    %al,(%eax)
    89fe:	00 00                	add    %al,(%eax)
    8a00:	00 00                	add    %al,(%eax)
    8a02:	00 00                	add    %al,(%eax)
    8a04:	00 00                	add    %al,(%eax)
    8a06:	00 00                	add    %al,(%eax)
    8a08:	00 00                	add    %al,(%eax)
    8a0a:	00 00                	add    %al,(%eax)
    8a0c:	00 00                	add    %al,(%eax)
    8a0e:	00 00                	add    %al,(%eax)
    8a10:	00 00                	add    %al,(%eax)
    8a12:	00 00                	add    %al,(%eax)
    8a14:	00 00                	add    %al,(%eax)
    8a16:	00 00                	add    %al,(%eax)
    8a18:	00 00                	add    %al,(%eax)
    8a1a:	00 00                	add    %al,(%eax)
    8a1c:	00 00                	add    %al,(%eax)
    8a1e:	00 00                	add    %al,(%eax)
    8a20:	00 00                	add    %al,(%eax)
    8a22:	00 00                	add    %al,(%eax)
    8a24:	00 00                	add    %al,(%eax)
    8a26:	00 00                	add    %al,(%eax)
    8a28:	00 00                	add    %al,(%eax)
    8a2a:	00 00                	add    %al,(%eax)
    8a2c:	00 00                	add    %al,(%eax)
    8a2e:	00 00                	add    %al,(%eax)
    8a30:	00 00                	add    %al,(%eax)
    8a32:	00 00                	add    %al,(%eax)
    8a34:	00 00                	add    %al,(%eax)
    8a36:	00 00                	add    %al,(%eax)
    8a38:	00 00                	add    %al,(%eax)
    8a3a:	00 00                	add    %al,(%eax)
    8a3c:	00 00                	add    %al,(%eax)
    8a3e:	00 00                	add    %al,(%eax)
    8a40:	00 00                	add    %al,(%eax)
    8a42:	00 00                	add    %al,(%eax)
    8a44:	00 00                	add    %al,(%eax)
    8a46:	00 00                	add    %al,(%eax)
    8a48:	00 00                	add    %al,(%eax)
    8a4a:	00 00                	add    %al,(%eax)
    8a4c:	00 00                	add    %al,(%eax)
    8a4e:	00 00                	add    %al,(%eax)
    8a50:	00 00                	add    %al,(%eax)
    8a52:	00 00                	add    %al,(%eax)
    8a54:	00 00                	add    %al,(%eax)
    8a56:	00 00                	add    %al,(%eax)
    8a58:	00 00                	add    %al,(%eax)
    8a5a:	00 00                	add    %al,(%eax)
    8a5c:	00 00                	add    %al,(%eax)
    8a5e:	00 00                	add    %al,(%eax)
    8a60:	00 00                	add    %al,(%eax)
    8a62:	00 00                	add    %al,(%eax)
    8a64:	00 00                	add    %al,(%eax)
    8a66:	00 00                	add    %al,(%eax)
    8a68:	00 00                	add    %al,(%eax)
    8a6a:	00 00                	add    %al,(%eax)
    8a6c:	00 00                	add    %al,(%eax)
    8a6e:	00 00                	add    %al,(%eax)
    8a70:	00 00                	add    %al,(%eax)
    8a72:	00 00                	add    %al,(%eax)
    8a74:	00 00                	add    %al,(%eax)
    8a76:	00 00                	add    %al,(%eax)
    8a78:	00 00                	add    %al,(%eax)
    8a7a:	00 00                	add    %al,(%eax)
    8a7c:	00 00                	add    %al,(%eax)
    8a7e:	00 00                	add    %al,(%eax)
    8a80:	00 00                	add    %al,(%eax)
    8a82:	00 00                	add    %al,(%eax)
    8a84:	00 00                	add    %al,(%eax)
    8a86:	00 00                	add    %al,(%eax)
    8a88:	00 00                	add    %al,(%eax)
    8a8a:	00 00                	add    %al,(%eax)
    8a8c:	00 00                	add    %al,(%eax)
    8a8e:	00 00                	add    %al,(%eax)
    8a90:	00 00                	add    %al,(%eax)
    8a92:	00 00                	add    %al,(%eax)
    8a94:	00 00                	add    %al,(%eax)
    8a96:	00 00                	add    %al,(%eax)
    8a98:	00 00                	add    %al,(%eax)
    8a9a:	00 00                	add    %al,(%eax)
    8a9c:	00 00                	add    %al,(%eax)
    8a9e:	00 00                	add    %al,(%eax)
    8aa0:	00 00                	add    %al,(%eax)
    8aa2:	00 00                	add    %al,(%eax)
    8aa4:	00 00                	add    %al,(%eax)
    8aa6:	00 00                	add    %al,(%eax)
    8aa8:	00 00                	add    %al,(%eax)
    8aaa:	00 00                	add    %al,(%eax)
    8aac:	00 00                	add    %al,(%eax)
    8aae:	00 00                	add    %al,(%eax)
    8ab0:	00 00                	add    %al,(%eax)
    8ab2:	00 00                	add    %al,(%eax)
    8ab4:	00 00                	add    %al,(%eax)
    8ab6:	00 00                	add    %al,(%eax)
    8ab8:	00 00                	add    %al,(%eax)
    8aba:	00 00                	add    %al,(%eax)
    8abc:	00 00                	add    %al,(%eax)
    8abe:	00 00                	add    %al,(%eax)
    8ac0:	00 00                	add    %al,(%eax)
    8ac2:	00 00                	add    %al,(%eax)
    8ac4:	00 00                	add    %al,(%eax)
    8ac6:	00 00                	add    %al,(%eax)
    8ac8:	00 00                	add    %al,(%eax)
    8aca:	00 00                	add    %al,(%eax)
    8acc:	00 00                	add    %al,(%eax)
    8ace:	00 00                	add    %al,(%eax)
    8ad0:	00 00                	add    %al,(%eax)
    8ad2:	00 00                	add    %al,(%eax)
    8ad4:	00 00                	add    %al,(%eax)
    8ad6:	00 00                	add    %al,(%eax)
    8ad8:	00 00                	add    %al,(%eax)
    8ada:	00 00                	add    %al,(%eax)
    8adc:	00 00                	add    %al,(%eax)
    8ade:	00 00                	add    %al,(%eax)
    8ae0:	00 00                	add    %al,(%eax)
    8ae2:	00 00                	add    %al,(%eax)
    8ae4:	00 00                	add    %al,(%eax)
    8ae6:	00 00                	add    %al,(%eax)
    8ae8:	00 00                	add    %al,(%eax)
    8aea:	00 00                	add    %al,(%eax)
    8aec:	00 00                	add    %al,(%eax)
    8aee:	00 00                	add    %al,(%eax)
    8af0:	00 00                	add    %al,(%eax)
    8af2:	00 00                	add    %al,(%eax)
    8af4:	00 00                	add    %al,(%eax)
    8af6:	00 00                	add    %al,(%eax)
    8af8:	00 00                	add    %al,(%eax)
    8afa:	00 00                	add    %al,(%eax)
    8afc:	00 00                	add    %al,(%eax)
    8afe:	00 00                	add    %al,(%eax)
    8b00:	00 00                	add    %al,(%eax)
    8b02:	00 00                	add    %al,(%eax)
    8b04:	00 00                	add    %al,(%eax)
    8b06:	00 00                	add    %al,(%eax)
    8b08:	00 00                	add    %al,(%eax)
    8b0a:	00 00                	add    %al,(%eax)
    8b0c:	00 00                	add    %al,(%eax)
    8b0e:	00 00                	add    %al,(%eax)
    8b10:	00 00                	add    %al,(%eax)
    8b12:	00 00                	add    %al,(%eax)
    8b14:	00 00                	add    %al,(%eax)
    8b16:	00 00                	add    %al,(%eax)
    8b18:	00 00                	add    %al,(%eax)
    8b1a:	00 00                	add    %al,(%eax)
    8b1c:	00 00                	add    %al,(%eax)
    8b1e:	00 00                	add    %al,(%eax)
    8b20:	00 00                	add    %al,(%eax)
    8b22:	00 00                	add    %al,(%eax)
    8b24:	00 00                	add    %al,(%eax)

00008b26 <putc>:
 */
volatile char *video = (volatile char*) 0xB8000;

void
putc (int l, int color, char ch)
{
    8b26:	55                   	push   %ebp
    8b27:	89 e5                	mov    %esp,%ebp
    8b29:	8b 45 08             	mov    0x8(%ebp),%eax
	volatile char * p = video + l * 2;
	* p = ch;
    8b2c:	8b 55 10             	mov    0x10(%ebp),%edx
volatile char *video = (volatile char*) 0xB8000;

void
putc (int l, int color, char ch)
{
	volatile char * p = video + l * 2;
    8b2f:	01 c0                	add    %eax,%eax
    8b31:	03 05 84 92 00 00    	add    0x9284,%eax
	* p = ch;
    8b37:	88 10                	mov    %dl,(%eax)
	* (p + 1) = color;
    8b39:	8b 55 0c             	mov    0xc(%ebp),%edx
    8b3c:	88 50 01             	mov    %dl,0x1(%eax)
}
    8b3f:	5d                   	pop    %ebp
    8b40:	c3                   	ret    

00008b41 <puts>:


int
puts (int r, int c, int color, const char *string)
{
    8b41:	55                   	push   %ebp
    8b42:	89 e5                	mov    %esp,%ebp
    8b44:	53                   	push   %ebx
	int l = r * 80 + c;
    8b45:	6b 45 08 50          	imul   $0x50,0x8(%ebp),%eax
	while (*string != 0)
    8b49:	8b 4d 14             	mov    0x14(%ebp),%ecx


int
puts (int r, int c, int color, const char *string)
{
	int l = r * 80 + c;
    8b4c:	03 45 0c             	add    0xc(%ebp),%eax
	while (*string != 0)
    8b4f:	29 c1                	sub    %eax,%ecx
    8b51:	0f be 14 01          	movsbl (%ecx,%eax,1),%edx
    8b55:	84 d2                	test   %dl,%dl
    8b57:	74 14                	je     8b6d <puts+0x2c>
	{
		putc (l++, color, *string++);
    8b59:	52                   	push   %edx
    8b5a:	8d 58 01             	lea    0x1(%eax),%ebx
    8b5d:	ff 75 10             	pushl  0x10(%ebp)
    8b60:	50                   	push   %eax
    8b61:	e8 c0 ff ff ff       	call   8b26 <putc>
    8b66:	83 c4 0c             	add    $0xc,%esp
    8b69:	89 d8                	mov    %ebx,%eax
    8b6b:	eb e4                	jmp    8b51 <puts+0x10>
	}
	return l;
}
    8b6d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    8b70:	c9                   	leave  
    8b71:	c3                   	ret    

00008b72 <putline>:
"                                                                                ";

void
putline (char * s)
{
	puts (row = (row >= CRT_ROWS) ? 0 : row + 1, 0, VGA_CLR_BLACK, blank);
    8b72:	a1 28 93 00 00       	mov    0x9328,%eax
char * blank =
"                                                                                ";

void
putline (char * s)
{
    8b77:	55                   	push   %ebp
    8b78:	89 e5                	mov    %esp,%ebp
    8b7a:	53                   	push   %ebx
	puts (row = (row >= CRT_ROWS) ? 0 : row + 1, 0, VGA_CLR_BLACK, blank);
    8b7b:	ff 35 80 92 00 00    	pushl  0x9280
    8b81:	8d 58 01             	lea    0x1(%eax),%ebx
    8b84:	83 f8 18             	cmp    $0x18,%eax
    8b87:	b8 00 00 00 00       	mov    $0x0,%eax
    8b8c:	6a 00                	push   $0x0
    8b8e:	6a 00                	push   $0x0
    8b90:	0f 4f d8             	cmovg  %eax,%ebx
    8b93:	53                   	push   %ebx
    8b94:	89 1d 28 93 00 00    	mov    %ebx,0x9328
    8b9a:	e8 a2 ff ff ff       	call   8b41 <puts>
	puts (row, 0, VGA_CLR_WHITE, s);
    8b9f:	ff 75 08             	pushl  0x8(%ebp)
    8ba2:	6a 0f                	push   $0xf
    8ba4:	6a 00                	push   $0x0
    8ba6:	53                   	push   %ebx
    8ba7:	e8 95 ff ff ff       	call   8b41 <puts>
}
    8bac:	83 c4 20             	add    $0x20,%esp
    8baf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    8bb2:	c9                   	leave  
    8bb3:	c3                   	ret    

00008bb4 <roll>:

void
roll (int r)
{
    8bb4:	55                   	push   %ebp
    8bb5:	89 e5                	mov    %esp,%ebp
	row = r;
    8bb7:	8b 45 08             	mov    0x8(%ebp),%eax
}
    8bba:	5d                   	pop    %ebp
}

void
roll (int r)
{
	row = r;
    8bbb:	a3 28 93 00 00       	mov    %eax,0x9328
}
    8bc0:	c3                   	ret    

00008bc1 <panic>:

void
panic (char * m)
{
    8bc1:	55                   	push   %ebp
    8bc2:	89 e5                	mov    %esp,%ebp
	puts (0, 0, VGA_CLR_RED, m);
    8bc4:	ff 75 08             	pushl  0x8(%ebp)
    8bc7:	6a 04                	push   $0x4
    8bc9:	6a 00                	push   $0x0
    8bcb:	6a 00                	push   $0x0
    8bcd:	e8 6f ff ff ff       	call   8b41 <puts>
    8bd2:	83 c4 10             	add    $0x10,%esp
	while (1)
	{
		asm volatile("hlt");
    8bd5:	f4                   	hlt    
    8bd6:	eb fd                	jmp    8bd5 <panic+0x14>

00008bd8 <strlen>:
 * string
 */

int
strlen (const char *s)
{
    8bd8:	55                   	push   %ebp
	int n;

	for (n = 0; *s != '\0'; s++)
    8bd9:	31 c0                	xor    %eax,%eax
 * string
 */

int
strlen (const char *s)
{
    8bdb:	89 e5                	mov    %esp,%ebp
    8bdd:	8b 55 08             	mov    0x8(%ebp),%edx
	int n;

	for (n = 0; *s != '\0'; s++)
    8be0:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    8be4:	74 03                	je     8be9 <strlen+0x11>
		n++;
    8be6:	40                   	inc    %eax
    8be7:	eb f7                	jmp    8be0 <strlen+0x8>
	return n;
}
    8be9:	5d                   	pop    %ebp
    8bea:	c3                   	ret    

00008beb <reverse>:

/* reverse:  reverse string s in place */
void
reverse (char s[])
{
    8beb:	55                   	push   %ebp
    8bec:	89 e5                	mov    %esp,%ebp
    8bee:	56                   	push   %esi
    8bef:	53                   	push   %ebx
    8bf0:	8b 75 08             	mov    0x8(%ebp),%esi
	int i, j;
	char c;

	for (i = 0, j = strlen (s) - 1; i < j; i++, j--)
    8bf3:	56                   	push   %esi
    8bf4:	e8 df ff ff ff       	call   8bd8 <strlen>
    8bf9:	5a                   	pop    %edx
    8bfa:	48                   	dec    %eax
    8bfb:	31 d2                	xor    %edx,%edx
    8bfd:	39 c2                	cmp    %eax,%edx
    8bff:	7d 10                	jge    8c11 <reverse+0x26>
	{
		c = s[i];
    8c01:	8a 1c 16             	mov    (%esi,%edx,1),%bl
		s[i] = s[j];
    8c04:	8a 0c 06             	mov    (%esi,%eax,1),%cl
    8c07:	88 0c 16             	mov    %cl,(%esi,%edx,1)
		s[j] = c;
    8c0a:	88 1c 06             	mov    %bl,(%esi,%eax,1)
reverse (char s[])
{
	int i, j;
	char c;

	for (i = 0, j = strlen (s) - 1; i < j; i++, j--)
    8c0d:	42                   	inc    %edx
    8c0e:	48                   	dec    %eax
    8c0f:	eb ec                	jmp    8bfd <reverse+0x12>
	{
		c = s[i];
		s[i] = s[j];
		s[j] = c;
	}
}
    8c11:	8d 65 f8             	lea    -0x8(%ebp),%esp
    8c14:	5b                   	pop    %ebx
    8c15:	5e                   	pop    %esi
    8c16:	5d                   	pop    %ebp
    8c17:	c3                   	ret    

00008c18 <itox>:

/* itoa:  convert n to characters in s */
void
itox (int n, char s[], int root, char * table)
{
    8c18:	55                   	push   %ebp
    8c19:	89 e5                	mov    %esp,%ebp
    8c1b:	57                   	push   %edi
    8c1c:	56                   	push   %esi
    8c1d:	53                   	push   %ebx
    8c1e:	31 f6                	xor    %esi,%esi
    8c20:	83 ec 08             	sub    $0x8,%esp
    8c23:	8b 45 08             	mov    0x8(%ebp),%eax
    8c26:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8c29:	8b 7d 14             	mov    0x14(%ebp),%edi
    8c2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    8c2f:	8b 45 10             	mov    0x10(%ebp),%eax
    8c32:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8c35:	89 45 ec             	mov    %eax,-0x14(%ebp)
    8c38:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c3b:	c1 fa 1f             	sar    $0x1f,%edx
    8c3e:	31 d0                	xor    %edx,%eax
    8c40:	29 d0                	sub    %edx,%eax
	if ((sign = n) < 0) /* record sign */
		n = -n; /* make n positive */
	i = 0;
	do
	{ /* generate digits in reverse order */
		s[i++] = table[n % root]; /* get next digit */
    8c42:	99                   	cltd   
    8c43:	8d 4e 01             	lea    0x1(%esi),%ecx
    8c46:	f7 7d ec             	idivl  -0x14(%ebp)
    8c49:	8a 14 17             	mov    (%edi,%edx,1),%dl
	} while ((n /= root) > 0); /* delete it */
    8c4c:	85 c0                	test   %eax,%eax
	if ((sign = n) < 0) /* record sign */
		n = -n; /* make n positive */
	i = 0;
	do
	{ /* generate digits in reverse order */
		s[i++] = table[n % root]; /* get next digit */
    8c4e:	88 54 0b ff          	mov    %dl,-0x1(%ebx,%ecx,1)
    8c52:	89 ca                	mov    %ecx,%edx
	} while ((n /= root) > 0); /* delete it */
    8c54:	7e 04                	jle    8c5a <itox+0x42>
	if ((sign = n) < 0) /* record sign */
		n = -n; /* make n positive */
	i = 0;
	do
	{ /* generate digits in reverse order */
		s[i++] = table[n % root]; /* get next digit */
    8c56:	89 ce                	mov    %ecx,%esi
    8c58:	eb e8                	jmp    8c42 <itox+0x2a>
	} while ((n /= root) > 0); /* delete it */
	if (sign < 0)
    8c5a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    8c5e:	79 07                	jns    8c67 <itox+0x4f>
		s[i++] = '-';
    8c60:	8d 4e 02             	lea    0x2(%esi),%ecx
    8c63:	c6 04 13 2d          	movb   $0x2d,(%ebx,%edx,1)
	s[i] = '\0';
    8c67:	c6 04 0b 00          	movb   $0x0,(%ebx,%ecx,1)
	reverse (s);
    8c6b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
    8c6e:	58                   	pop    %eax
    8c6f:	5a                   	pop    %edx
    8c70:	5b                   	pop    %ebx
    8c71:	5e                   	pop    %esi
    8c72:	5f                   	pop    %edi
    8c73:	5d                   	pop    %ebp
		s[i++] = table[n % root]; /* get next digit */
	} while ((n /= root) > 0); /* delete it */
	if (sign < 0)
		s[i++] = '-';
	s[i] = '\0';
	reverse (s);
    8c74:	e9 72 ff ff ff       	jmp    8beb <reverse>

00008c79 <itoa>:
}

void
itoa (int n, char s[])
{
    8c79:	55                   	push   %ebp
    8c7a:	89 e5                	mov    %esp,%ebp
	static char dec[] = "0123456789";
	itox(n, s, 10, dec);
    8c7c:	68 74 92 00 00       	push   $0x9274
    8c81:	6a 0a                	push   $0xa
    8c83:	ff 75 0c             	pushl  0xc(%ebp)
    8c86:	ff 75 08             	pushl  0x8(%ebp)
    8c89:	e8 8a ff ff ff       	call   8c18 <itox>
}
    8c8e:	83 c4 10             	add    $0x10,%esp
    8c91:	c9                   	leave  
    8c92:	c3                   	ret    

00008c93 <itoh>:


void
itoh (int n, char* s)
{
    8c93:	55                   	push   %ebp
    8c94:	89 e5                	mov    %esp,%ebp
	static char hex[] = "0123456789abcdef";
	itox(n, s, 16, hex);
    8c96:	68 60 92 00 00       	push   $0x9260
    8c9b:	6a 10                	push   $0x10
    8c9d:	ff 75 0c             	pushl  0xc(%ebp)
    8ca0:	ff 75 08             	pushl  0x8(%ebp)
    8ca3:	e8 70 ff ff ff       	call   8c18 <itox>
}
    8ca8:	83 c4 10             	add    $0x10,%esp
    8cab:	c9                   	leave  
    8cac:	c3                   	ret    

00008cad <puti>:

static char puti_str[40];

void
puti (int32_t i)
{
    8cad:	55                   	push   %ebp
    8cae:	89 e5                	mov    %esp,%ebp
	itoh (i, puti_str);
    8cb0:	68 00 93 00 00       	push   $0x9300
    8cb5:	ff 75 08             	pushl  0x8(%ebp)
    8cb8:	e8 d6 ff ff ff       	call   8c93 <itoh>
	putline (puti_str);
    8cbd:	58                   	pop    %eax
    8cbe:	5a                   	pop    %edx
    8cbf:	c7 45 08 00 93 00 00 	movl   $0x9300,0x8(%ebp)
}
    8cc6:	c9                   	leave  

void
puti (int32_t i)
{
	itoh (i, puti_str);
	putline (puti_str);
    8cc7:	e9 a6 fe ff ff       	jmp    8b72 <putline>

00008ccc <readsector>:
		/* do nothing */;
}

void
readsector (void *dst, uint32_t offset)
{
    8ccc:	55                   	push   %ebp

static inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
    8ccd:	ba f7 01 00 00       	mov    $0x1f7,%edx
    8cd2:	89 e5                	mov    %esp,%ebp
    8cd4:	57                   	push   %edi
    8cd5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    8cd8:	ec                   	in     (%dx),%al
 */
static void
waitdisk (void)
{
	// wait for disk reaady
	while ((inb (0x1F7) & 0xC0) != 0x40)
    8cd9:	83 e0 c0             	and    $0xffffffc0,%eax
    8cdc:	3c 40                	cmp    $0x40,%al
    8cde:	75 f8                	jne    8cd8 <readsector+0xc>
 * x86 instructions
 */
static inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
    8ce0:	ba f2 01 00 00       	mov    $0x1f2,%edx
    8ce5:	b0 01                	mov    $0x1,%al
    8ce7:	ee                   	out    %al,(%dx)
    8ce8:	ba f3 01 00 00       	mov    $0x1f3,%edx
    8ced:	88 c8                	mov    %cl,%al
    8cef:	ee                   	out    %al,(%dx)
	// wait for disk to be ready
	waitdisk ();

	outb (0x1F2, 1);		// count = 1
	outb (0x1F3, offset);
	outb (0x1F4, offset >> 8);
    8cf0:	89 c8                	mov    %ecx,%eax
    8cf2:	ba f4 01 00 00       	mov    $0x1f4,%edx
    8cf7:	c1 e8 08             	shr    $0x8,%eax
    8cfa:	ee                   	out    %al,(%dx)
	outb (0x1F5, offset >> 16);
    8cfb:	89 c8                	mov    %ecx,%eax
    8cfd:	ba f5 01 00 00       	mov    $0x1f5,%edx
    8d02:	c1 e8 10             	shr    $0x10,%eax
    8d05:	ee                   	out    %al,(%dx)
	outb (0x1F6, (offset >> 24) | 0xE0);
    8d06:	89 c8                	mov    %ecx,%eax
    8d08:	ba f6 01 00 00       	mov    $0x1f6,%edx
    8d0d:	c1 e8 18             	shr    $0x18,%eax
    8d10:	83 c8 e0             	or     $0xffffffe0,%eax
    8d13:	ee                   	out    %al,(%dx)
    8d14:	ba f7 01 00 00       	mov    $0x1f7,%edx
    8d19:	b0 20                	mov    $0x20,%al
    8d1b:	ee                   	out    %al,(%dx)

static inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
    8d1c:	ec                   	in     (%dx),%al
 */
static void
waitdisk (void)
{
	// wait for disk reaady
	while ((inb (0x1F7) & 0xC0) != 0x40)
    8d1d:	83 e0 c0             	and    $0xffffffc0,%eax
    8d20:	3c 40                	cmp    $0x40,%al
    8d22:	75 f8                	jne    8d1c <readsector+0x50>
}

static inline void
insl(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsl"			:
    8d24:	8b 7d 08             	mov    0x8(%ebp),%edi
    8d27:	b9 80 00 00 00       	mov    $0x80,%ecx
    8d2c:	ba f0 01 00 00       	mov    $0x1f0,%edx
    8d31:	fc                   	cld    
    8d32:	f2 6d                	repnz insl (%dx),%es:(%edi)
	// wait for disk to be ready
	waitdisk ();

	// read a sector
	insl (0x1F0, dst, SECTOR_SIZE / 4);
}
    8d34:	5f                   	pop    %edi
    8d35:	5d                   	pop    %ebp
    8d36:	c3                   	ret    

00008d37 <readsection>:

// Read 'count' bytes at 'offset' from kernel into virtual address 'va'.
// Might copy more than asked
void
readsection (uint32_t va, uint32_t count, uint32_t offset, uint32_t lba)
{
    8d37:	55                   	push   %ebp
    8d38:	89 e5                	mov    %esp,%ebp
    8d3a:	57                   	push   %edi
    8d3b:	56                   	push   %esi
    8d3c:	53                   	push   %ebx
    8d3d:	8b 5d 08             	mov    0x8(%ebp),%ebx
	end_va = va + count;
	// round down to sector boundary
	va &= ~(SECTOR_SIZE - 1);

	// translate from bytes to sectors, and kernel starts at sector 1
	offset = (offset / SECTOR_SIZE) + lba;
    8d40:	8b 7d 10             	mov    0x10(%ebp),%edi
void
readsection (uint32_t va, uint32_t count, uint32_t offset, uint32_t lba)
{
	uint32_t end_va;

	va &= 0xFFFFFF;
    8d43:	89 de                	mov    %ebx,%esi
	end_va = va + count;
	// round down to sector boundary
	va &= ~(SECTOR_SIZE - 1);
    8d45:	81 e3 00 fe ff 00    	and    $0xfffe00,%ebx
void
readsection (uint32_t va, uint32_t count, uint32_t offset, uint32_t lba)
{
	uint32_t end_va;

	va &= 0xFFFFFF;
    8d4b:	81 e6 ff ff ff 00    	and    $0xffffff,%esi
	end_va = va + count;
	// round down to sector boundary
	va &= ~(SECTOR_SIZE - 1);

	// translate from bytes to sectors, and kernel starts at sector 1
	offset = (offset / SECTOR_SIZE) + lba;
    8d51:	c1 ef 09             	shr    $0x9,%edi
readsection (uint32_t va, uint32_t count, uint32_t offset, uint32_t lba)
{
	uint32_t end_va;

	va &= 0xFFFFFF;
	end_va = va + count;
    8d54:	03 75 0c             	add    0xc(%ebp),%esi
	// round down to sector boundary
	va &= ~(SECTOR_SIZE - 1);

	// translate from bytes to sectors, and kernel starts at sector 1
	offset = (offset / SECTOR_SIZE) + lba;
    8d57:	03 7d 14             	add    0x14(%ebp),%edi

	// If this is too slow, we could read lots of sectors at a time.
	// We'd write more to memory than asked, but it doesn't matter --
	// we load in increasing order.
	while (va < end_va)
    8d5a:	39 f3                	cmp    %esi,%ebx
    8d5c:	73 12                	jae    8d70 <readsection+0x39>
	{
		readsector ((uint8_t*) va, offset);
    8d5e:	57                   	push   %edi
    8d5f:	53                   	push   %ebx
		va += SECTOR_SIZE;
		offset++;
    8d60:	47                   	inc    %edi
	// We'd write more to memory than asked, but it doesn't matter --
	// we load in increasing order.
	while (va < end_va)
	{
		readsector ((uint8_t*) va, offset);
		va += SECTOR_SIZE;
    8d61:	81 c3 00 02 00 00    	add    $0x200,%ebx
	// If this is too slow, we could read lots of sectors at a time.
	// We'd write more to memory than asked, but it doesn't matter --
	// we load in increasing order.
	while (va < end_va)
	{
		readsector ((uint8_t*) va, offset);
    8d67:	e8 60 ff ff ff       	call   8ccc <readsector>
		va += SECTOR_SIZE;
		offset++;
    8d6c:	58                   	pop    %eax
    8d6d:	5a                   	pop    %edx
    8d6e:	eb ea                	jmp    8d5a <readsection+0x23>
	}
}
    8d70:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8d73:	5b                   	pop    %ebx
    8d74:	5e                   	pop    %esi
    8d75:	5f                   	pop    %edi
    8d76:	5d                   	pop    %ebp
    8d77:	c3                   	ret    

00008d78 <load_kernel>:

#define ELFHDR		((elfhdr *) 0x20000)

uint32_t
load_kernel(uint32_t dkernel)
{
    8d78:	55                   	push   %ebp
    8d79:	89 e5                	mov    %esp,%ebp
    8d7b:	57                   	push   %edi
    8d7c:	56                   	push   %esi
    8d7d:	53                   	push   %ebx
    8d7e:	83 ec 0c             	sub    $0xc,%esp
    8d81:	8b 7d 08             	mov    0x8(%ebp),%edi
	// load kernel from the beginning of the first bootable partition
	proghdr *ph, *eph;

	readsection((uint32_t) ELFHDR, SECTOR_SIZE * 8, 0, dkernel);
    8d84:	57                   	push   %edi
    8d85:	6a 00                	push   $0x0
    8d87:	68 00 10 00 00       	push   $0x1000
    8d8c:	68 00 00 02 00       	push   $0x20000
    8d91:	e8 a1 ff ff ff       	call   8d37 <readsection>

	// is this a valid ELF?
	if (ELFHDR->e_magic != ELF_MAGIC)
    8d96:	83 c4 10             	add    $0x10,%esp
    8d99:	81 3d 00 00 02 00 7f 	cmpl   $0x464c457f,0x20000
    8da0:	45 4c 46 
    8da3:	74 10                	je     8db5 <load_kernel+0x3d>
		panic ("Kernel is not a valid elf.");
    8da5:	83 ec 0c             	sub    $0xc,%esp
    8da8:	68 60 8f 00 00       	push   $0x8f60
    8dad:	e8 0f fe ff ff       	call   8bc1 <panic>
    8db2:	83 c4 10             	add    $0x10,%esp

	// load each program segment (ignores ph flags)
	ph = (proghdr *) ((uint8_t *) ELFHDR + ELFHDR->e_phoff);
    8db5:	a1 1c 00 02 00       	mov    0x2001c,%eax
	eph = ph + ELFHDR->e_phnum;
    8dba:	0f b7 35 2c 00 02 00 	movzwl 0x2002c,%esi
	// is this a valid ELF?
	if (ELFHDR->e_magic != ELF_MAGIC)
		panic ("Kernel is not a valid elf.");

	// load each program segment (ignores ph flags)
	ph = (proghdr *) ((uint8_t *) ELFHDR + ELFHDR->e_phoff);
    8dc1:	8d 98 00 00 02 00    	lea    0x20000(%eax),%ebx
	eph = ph + ELFHDR->e_phnum;
    8dc7:	c1 e6 05             	shl    $0x5,%esi
    8dca:	01 de                	add    %ebx,%esi

	for (; ph < eph; ph++)
    8dcc:	39 f3                	cmp    %esi,%ebx
    8dce:	73 17                	jae    8de7 <load_kernel+0x6f>
	{
		readsection(ph->p_va, ph->p_memsz, ph->p_offset, dkernel);
    8dd0:	57                   	push   %edi
    8dd1:	ff 73 04             	pushl  0x4(%ebx)

	// load each program segment (ignores ph flags)
	ph = (proghdr *) ((uint8_t *) ELFHDR + ELFHDR->e_phoff);
	eph = ph + ELFHDR->e_phnum;

	for (; ph < eph; ph++)
    8dd4:	83 c3 20             	add    $0x20,%ebx
	{
		readsection(ph->p_va, ph->p_memsz, ph->p_offset, dkernel);
    8dd7:	ff 73 f4             	pushl  -0xc(%ebx)
    8dda:	ff 73 e8             	pushl  -0x18(%ebx)
    8ddd:	e8 55 ff ff ff       	call   8d37 <readsection>

	// load each program segment (ignores ph flags)
	ph = (proghdr *) ((uint8_t *) ELFHDR + ELFHDR->e_phoff);
	eph = ph + ELFHDR->e_phnum;

	for (; ph < eph; ph++)
    8de2:	83 c4 10             	add    $0x10,%esp
    8de5:	eb e5                	jmp    8dcc <load_kernel+0x54>
	{
		readsection(ph->p_va, ph->p_memsz, ph->p_offset, dkernel);
	}

	return (ELFHDR->e_entry & 0xFFFFFF);
    8de7:	a1 18 00 02 00       	mov    0x20018,%eax
}
    8dec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8def:	5b                   	pop    %ebx
	for (; ph < eph; ph++)
	{
		readsection(ph->p_va, ph->p_memsz, ph->p_offset, dkernel);
	}

	return (ELFHDR->e_entry & 0xFFFFFF);
    8df0:	25 ff ff ff 00       	and    $0xffffff,%eax
}
    8df5:	5e                   	pop    %esi
    8df6:	5f                   	pop    %edi
    8df7:	5d                   	pop    %ebp
    8df8:	c3                   	ret    

00008df9 <parse_e820>:

mboot_info_t *
parse_e820 (bios_smap_t *smap)
{
    8df9:	55                   	push   %ebp
    8dfa:	89 e5                	mov    %esp,%ebp
    8dfc:	56                   	push   %esi
    8dfd:	53                   	push   %ebx
    8dfe:	8b 75 08             	mov    0x8(%ebp),%esi
	bios_smap_t *p;
	uint32_t mmap_len;
	p = smap;
	mmap_len = 0;
    8e01:	31 db                	xor    %ebx,%ebx
	putline ("* E820 Memory Map *");
    8e03:	83 ec 0c             	sub    $0xc,%esp
    8e06:	68 7b 8f 00 00       	push   $0x8f7b
    8e0b:	e8 62 fd ff ff       	call   8b72 <putline>
	while (p->base_addr != 0 || p->length != 0 || p->type != 0)
    8e10:	83 c4 10             	add    $0x10,%esp
    8e13:	8b 44 1e 04          	mov    0x4(%esi,%ebx,1),%eax
    8e17:	89 c1                	mov    %eax,%ecx
    8e19:	0b 4c 1e 08          	or     0x8(%esi,%ebx,1),%ecx
    8e1d:	74 11                	je     8e30 <parse_e820+0x37>
	{
		puti (p->base_addr);
    8e1f:	83 ec 0c             	sub    $0xc,%esp
		p ++;
		mmap_len += sizeof(bios_smap_t);
    8e22:	83 c3 18             	add    $0x18,%ebx
	p = smap;
	mmap_len = 0;
	putline ("* E820 Memory Map *");
	while (p->base_addr != 0 || p->length != 0 || p->type != 0)
	{
		puti (p->base_addr);
    8e25:	50                   	push   %eax
    8e26:	e8 82 fe ff ff       	call   8cad <puti>
		p ++;
		mmap_len += sizeof(bios_smap_t);
    8e2b:	83 c4 10             	add    $0x10,%esp
    8e2e:	eb e3                	jmp    8e13 <parse_e820+0x1a>
	bios_smap_t *p;
	uint32_t mmap_len;
	p = smap;
	mmap_len = 0;
	putline ("* E820 Memory Map *");
	while (p->base_addr != 0 || p->length != 0 || p->type != 0)
    8e30:	8b 54 1e 10          	mov    0x10(%esi,%ebx,1),%edx
    8e34:	0b 54 1e 0c          	or     0xc(%esi,%ebx,1),%edx
    8e38:	75 e5                	jne    8e1f <parse_e820+0x26>
    8e3a:	83 7c 1e 14 00       	cmpl   $0x0,0x14(%esi,%ebx,1)
    8e3f:	75 de                	jne    8e1f <parse_e820+0x26>
	{
		puti (p->base_addr);
		p ++;
		mmap_len += sizeof(bios_smap_t);
	}
	mboot_info.mmap_length = mmap_len;
    8e41:	89 1d cc 92 00 00    	mov    %ebx,0x92cc
	mboot_info.mmap_addr = (uint32_t) smap;
    8e47:	89 35 d0 92 00 00    	mov    %esi,0x92d0
	return &mboot_info;
}
    8e4d:	8d 65 f8             	lea    -0x8(%ebp),%esp
    8e50:	b8 a0 92 00 00       	mov    $0x92a0,%eax
    8e55:	5b                   	pop    %ebx
    8e56:	5e                   	pop    %esi
    8e57:	5d                   	pop    %ebp
    8e58:	c3                   	ret    

00008e59 <boot1main>:
mboot_info_t mboot_info =
	{ .flags = (1 << 6), };

void
boot1main (uint32_t dev, mbr_t * mbr, bios_smap_t *smap)
{
    8e59:	55                   	push   %ebp
    8e5a:	89 e5                	mov    %esp,%ebp
    8e5c:	56                   	push   %esi
    8e5d:	53                   	push   %ebx
    8e5e:	8b 75 0c             	mov    0xc(%ebp),%esi
    8e61:	8b 5d 10             	mov    0x10(%ebp),%ebx
	roll(3); putline("Start boot1 main ...");
    8e64:	83 ec 0c             	sub    $0xc,%esp
    8e67:	6a 03                	push   $0x3
    8e69:	e8 46 fd ff ff       	call   8bb4 <roll>
    8e6e:	c7 04 24 8f 8f 00 00 	movl   $0x8f8f,(%esp)
    8e75:	e8 f8 fc ff ff       	call   8b72 <putline>
    8e7a:	83 c4 10             	add    $0x10,%esp

	// search bootable partition
	int i;
	uint32_t bootable_lba = 0;
	for (i = 0; i < 4; i++)
    8e7d:	31 c0                	xor    %eax,%eax
	{
		if ( mbr->partition[i].bootable == BOOTABLE_PARTITION)
    8e7f:	89 c2                	mov    %eax,%edx
    8e81:	c1 e2 04             	shl    $0x4,%edx
    8e84:	80 bc 16 be 01 00 00 	cmpb   $0x80,0x1be(%esi,%edx,1)
    8e8b:	80 
    8e8c:	75 0c                	jne    8e9a <boot1main+0x41>
		{
			bootable_lba = mbr->partition[i].first_lba;
    8e8e:	83 c0 1b             	add    $0x1b,%eax
    8e91:	c1 e0 04             	shl    $0x4,%eax
    8e94:	8b 74 06 16          	mov    0x16(%esi,%eax,1),%esi
    8e98:	eb 18                	jmp    8eb2 <boot1main+0x59>
	roll(3); putline("Start boot1 main ...");

	// search bootable partition
	int i;
	uint32_t bootable_lba = 0;
	for (i = 0; i < 4; i++)
    8e9a:	40                   	inc    %eax
    8e9b:	83 f8 04             	cmp    $0x4,%eax
    8e9e:	75 df                	jne    8e7f <boot1main+0x26>
			break;
		}
	}

	if (i == 4)
		panic ("Cannot find bootable partition!");
    8ea0:	83 ec 0c             	sub    $0xc,%esp
{
	roll(3); putline("Start boot1 main ...");

	// search bootable partition
	int i;
	uint32_t bootable_lba = 0;
    8ea3:	31 f6                	xor    %esi,%esi
			break;
		}
	}

	if (i == 4)
		panic ("Cannot find bootable partition!");
    8ea5:	68 dc 8f 00 00       	push   $0x8fdc
    8eaa:	e8 12 fd ff ff       	call   8bc1 <panic>
    8eaf:	83 c4 10             	add    $0x10,%esp

	parse_e820 (smap);
    8eb2:	83 ec 0c             	sub    $0xc,%esp
    8eb5:	53                   	push   %ebx
    8eb6:	e8 3e ff ff ff       	call   8df9 <parse_e820>

	putline ("Load kernel ...\n");
    8ebb:	c7 04 24 a4 8f 00 00 	movl   $0x8fa4,(%esp)
    8ec2:	e8 ab fc ff ff       	call   8b72 <putline>
	uint32_t entry = load_kernel(bootable_lba);
    8ec7:	89 34 24             	mov    %esi,(%esp)
    8eca:	e8 a9 fe ff ff       	call   8d78 <load_kernel>

	putline ("Start kernel ...\n");
    8ecf:	c7 04 24 b5 8f 00 00 	movl   $0x8fb5,(%esp)
		panic ("Cannot find bootable partition!");

	parse_e820 (smap);

	putline ("Load kernel ...\n");
	uint32_t entry = load_kernel(bootable_lba);
    8ed6:	89 c3                	mov    %eax,%ebx

	putline ("Start kernel ...\n");
    8ed8:	e8 95 fc ff ff       	call   8b72 <putline>

	exec_kernel (entry, &mboot_info);
    8edd:	58                   	pop    %eax
    8ede:	5a                   	pop    %edx
    8edf:	68 a0 92 00 00       	push   $0x92a0
    8ee4:	53                   	push   %ebx
    8ee5:	e8 15 00 00 00       	call   8eff <exec_kernel>

	panic ("Fail to load kernel.");
    8eea:	c7 45 08 c7 8f 00 00 	movl   $0x8fc7,0x8(%ebp)
    8ef1:	83 c4 10             	add    $0x10,%esp

}
    8ef4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    8ef7:	5b                   	pop    %ebx
    8ef8:	5e                   	pop    %esi
    8ef9:	5d                   	pop    %ebp

	putline ("Start kernel ...\n");

	exec_kernel (entry, &mboot_info);

	panic ("Fail to load kernel.");
    8efa:	e9 c2 fc ff ff       	jmp    8bc1 <panic>

00008eff <exec_kernel>:
	.set  MBOOT_INFO_MAGIC, 0x2badb002

	.globl	exec_kernel
	.code32
exec_kernel:
	cli
    8eff:	fa                   	cli    
	movl	$MBOOT_INFO_MAGIC, %eax
    8f00:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
	movl	8(%esp), %ebx
    8f05:	8b 5c 24 08          	mov    0x8(%esp),%ebx
	movl	4(%esp), %edx
    8f09:	8b 54 24 04          	mov    0x4(%esp),%edx
	jmp	*%edx
    8f0d:	ff e2                	jmp    *%edx

Disassembly of section .rodata:

00008f0f <.rodata>:
    8f0f:	20 20                	and    %ah,(%eax)
    8f11:	20 20                	and    %ah,(%eax)
    8f13:	20 20                	and    %ah,(%eax)
    8f15:	20 20                	and    %ah,(%eax)
    8f17:	20 20                	and    %ah,(%eax)
    8f19:	20 20                	and    %ah,(%eax)
    8f1b:	20 20                	and    %ah,(%eax)
    8f1d:	20 20                	and    %ah,(%eax)
    8f1f:	20 20                	and    %ah,(%eax)
    8f21:	20 20                	and    %ah,(%eax)
    8f23:	20 20                	and    %ah,(%eax)
    8f25:	20 20                	and    %ah,(%eax)
    8f27:	20 20                	and    %ah,(%eax)
    8f29:	20 20                	and    %ah,(%eax)
    8f2b:	20 20                	and    %ah,(%eax)
    8f2d:	20 20                	and    %ah,(%eax)
    8f2f:	20 20                	and    %ah,(%eax)
    8f31:	20 20                	and    %ah,(%eax)
    8f33:	20 20                	and    %ah,(%eax)
    8f35:	20 20                	and    %ah,(%eax)
    8f37:	20 20                	and    %ah,(%eax)
    8f39:	20 20                	and    %ah,(%eax)
    8f3b:	20 20                	and    %ah,(%eax)
    8f3d:	20 20                	and    %ah,(%eax)
    8f3f:	20 20                	and    %ah,(%eax)
    8f41:	20 20                	and    %ah,(%eax)
    8f43:	20 20                	and    %ah,(%eax)
    8f45:	20 20                	and    %ah,(%eax)
    8f47:	20 20                	and    %ah,(%eax)
    8f49:	20 20                	and    %ah,(%eax)
    8f4b:	20 20                	and    %ah,(%eax)
    8f4d:	20 20                	and    %ah,(%eax)
    8f4f:	20 20                	and    %ah,(%eax)
    8f51:	20 20                	and    %ah,(%eax)
    8f53:	20 20                	and    %ah,(%eax)
    8f55:	20 20                	and    %ah,(%eax)
    8f57:	20 20                	and    %ah,(%eax)
    8f59:	20 20                	and    %ah,(%eax)
    8f5b:	20 20                	and    %ah,(%eax)
    8f5d:	20 20                	and    %ah,(%eax)
    8f5f:	00 4b 65             	add    %cl,0x65(%ebx)
    8f62:	72 6e                	jb     8fd2 <exec_kernel+0xd3>
    8f64:	65 6c                	gs insb (%dx),%es:(%edi)
    8f66:	20 69 73             	and    %ch,0x73(%ecx)
    8f69:	20 6e 6f             	and    %ch,0x6f(%esi)
    8f6c:	74 20                	je     8f8e <exec_kernel+0x8f>
    8f6e:	61                   	popa   
    8f6f:	20 76 61             	and    %dh,0x61(%esi)
    8f72:	6c                   	insb   (%dx),%es:(%edi)
    8f73:	69 64 20 65 6c 66 2e 	imul   $0x2e666c,0x65(%eax,%eiz,1),%esp
    8f7a:	00 
    8f7b:	2a 20                	sub    (%eax),%ah
    8f7d:	45                   	inc    %ebp
    8f7e:	38 32                	cmp    %dh,(%edx)
    8f80:	30 20                	xor    %ah,(%eax)
    8f82:	4d                   	dec    %ebp
    8f83:	65 6d                	gs insl (%dx),%es:(%edi)
    8f85:	6f                   	outsl  %ds:(%esi),(%dx)
    8f86:	72 79                	jb     9001 <exec_kernel+0x102>
    8f88:	20 4d 61             	and    %cl,0x61(%ebp)
    8f8b:	70 20                	jo     8fad <exec_kernel+0xae>
    8f8d:	2a 00                	sub    (%eax),%al
    8f8f:	53                   	push   %ebx
    8f90:	74 61                	je     8ff3 <exec_kernel+0xf4>
    8f92:	72 74                	jb     9008 <exec_kernel+0x109>
    8f94:	20 62 6f             	and    %ah,0x6f(%edx)
    8f97:	6f                   	outsl  %ds:(%esi),(%dx)
    8f98:	74 31                	je     8fcb <exec_kernel+0xcc>
    8f9a:	20 6d 61             	and    %ch,0x61(%ebp)
    8f9d:	69 6e 20 2e 2e 2e 00 	imul   $0x2e2e2e,0x20(%esi),%ebp
    8fa4:	4c                   	dec    %esp
    8fa5:	6f                   	outsl  %ds:(%esi),(%dx)
    8fa6:	61                   	popa   
    8fa7:	64 20 6b 65          	and    %ch,%fs:0x65(%ebx)
    8fab:	72 6e                	jb     901b <exec_kernel+0x11c>
    8fad:	65 6c                	gs insb (%dx),%es:(%edi)
    8faf:	20 2e                	and    %ch,(%esi)
    8fb1:	2e 2e 0a 00          	cs or  %cs:(%eax),%al
    8fb5:	53                   	push   %ebx
    8fb6:	74 61                	je     9019 <exec_kernel+0x11a>
    8fb8:	72 74                	jb     902e <exec_kernel+0x12f>
    8fba:	20 6b 65             	and    %ch,0x65(%ebx)
    8fbd:	72 6e                	jb     902d <exec_kernel+0x12e>
    8fbf:	65 6c                	gs insb (%dx),%es:(%edi)
    8fc1:	20 2e                	and    %ch,(%esi)
    8fc3:	2e 2e 0a 00          	cs or  %cs:(%eax),%al
    8fc7:	46                   	inc    %esi
    8fc8:	61                   	popa   
    8fc9:	69 6c 20 74 6f 20 6c 	imul   $0x6f6c206f,0x74(%eax,%eiz,1),%ebp
    8fd0:	6f 
    8fd1:	61                   	popa   
    8fd2:	64 20 6b 65          	and    %ch,%fs:0x65(%ebx)
    8fd6:	72 6e                	jb     9046 <exec_kernel+0x147>
    8fd8:	65 6c                	gs insb (%dx),%es:(%edi)
    8fda:	2e 00 43 61          	add    %al,%cs:0x61(%ebx)
    8fde:	6e                   	outsb  %ds:(%esi),(%dx)
    8fdf:	6e                   	outsb  %ds:(%esi),(%dx)
    8fe0:	6f                   	outsl  %ds:(%esi),(%dx)
    8fe1:	74 20                	je     9003 <exec_kernel+0x104>
    8fe3:	66 69 6e 64 20 62    	imul   $0x6220,0x64(%esi),%bp
    8fe9:	6f                   	outsl  %ds:(%esi),(%dx)
    8fea:	6f                   	outsl  %ds:(%esi),(%dx)
    8feb:	74 61                	je     904e <exec_kernel+0x14f>
    8fed:	62 6c 65 20          	bound  %ebp,0x20(%ebp,%eiz,2)
    8ff1:	70 61                	jo     9054 <exec_kernel+0x155>
    8ff3:	72 74                	jb     9069 <exec_kernel+0x16a>
    8ff5:	69                   	.byte 0x69
    8ff6:	74 69                	je     9061 <exec_kernel+0x162>
    8ff8:	6f                   	outsl  %ds:(%esi),(%dx)
    8ff9:	6e                   	outsb  %ds:(%esi),(%dx)
    8ffa:	21 00                	and    %eax,(%eax)

Disassembly of section .eh_frame:

00008ffc <.eh_frame>:
    8ffc:	14 00                	adc    $0x0,%al
    8ffe:	00 00                	add    %al,(%eax)
    9000:	00 00                	add    %al,(%eax)
    9002:	00 00                	add    %al,(%eax)
    9004:	01 7a 52             	add    %edi,0x52(%edx)
    9007:	00 01                	add    %al,(%ecx)
    9009:	7c 08                	jl     9013 <exec_kernel+0x114>
    900b:	01 1b                	add    %ebx,(%ebx)
    900d:	0c 04                	or     $0x4,%al
    900f:	04 88                	add    $0x88,%al
    9011:	01 00                	add    %eax,(%eax)
    9013:	00 1c 00             	add    %bl,(%eax,%eax,1)
    9016:	00 00                	add    %al,(%eax)
    9018:	1c 00                	sbb    $0x0,%al
    901a:	00 00                	add    %al,(%eax)
    901c:	0a fb                	or     %bl,%bh
    901e:	ff                   	(bad)  
    901f:	ff 1b                	lcall  *(%ebx)
    9021:	00 00                	add    %al,(%eax)
    9023:	00 00                	add    %al,(%eax)
    9025:	41                   	inc    %ecx
    9026:	0e                   	push   %cs
    9027:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    902d:	57                   	push   %edi
    902e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9031:	04 00                	add    $0x0,%al
    9033:	00 20                	add    %ah,(%eax)
    9035:	00 00                	add    %al,(%eax)
    9037:	00 3c 00             	add    %bh,(%eax,%eax,1)
    903a:	00 00                	add    %al,(%eax)
    903c:	05 fb ff ff 31       	add    $0x31fffffb,%eax
    9041:	00 00                	add    %al,(%eax)
    9043:	00 00                	add    %al,(%eax)
    9045:	41                   	inc    %ecx
    9046:	0e                   	push   %cs
    9047:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    904d:	41                   	inc    %ecx
    904e:	83 03 6c             	addl   $0x6c,(%ebx)
    9051:	c5 c3 0c             	(bad)  
    9054:	04 04                	add    $0x4,%al
    9056:	00 00                	add    %al,(%eax)
    9058:	20 00                	and    %al,(%eax)
    905a:	00 00                	add    %al,(%eax)
    905c:	60                   	pusha  
    905d:	00 00                	add    %al,(%eax)
    905f:	00 12                	add    %dl,(%edx)
    9061:	fb                   	sti    
    9062:	ff                   	(bad)  
    9063:	ff 42 00             	incl   0x0(%edx)
    9066:	00 00                	add    %al,(%eax)
    9068:	00 46 0e             	add    %al,0xe(%esi)
    906b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9071:	41                   	inc    %ecx
    9072:	83 03 78             	addl   $0x78,(%ebx)
    9075:	c5 c3 0c             	(bad)  
    9078:	04 04                	add    $0x4,%al
    907a:	00 00                	add    %al,(%eax)
    907c:	1c 00                	sbb    $0x0,%al
    907e:	00 00                	add    %al,(%eax)
    9080:	84 00                	test   %al,(%eax)
    9082:	00 00                	add    %al,(%eax)
    9084:	30 fb                	xor    %bh,%bl
    9086:	ff                   	(bad)  
    9087:	ff 0d 00 00 00 00    	decl   0x0
    908d:	41                   	inc    %ecx
    908e:	0e                   	push   %cs
    908f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9095:	44                   	inc    %esp
    9096:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9099:	04 00                	add    $0x0,%al
    909b:	00 18                	add    %bl,(%eax)
    909d:	00 00                	add    %al,(%eax)
    909f:	00 a4 00 00 00 1d fb 	add    %ah,-0x4e30000(%eax,%eax,1)
    90a6:	ff                   	(bad)  
    90a7:	ff 17                	call   *(%edi)
    90a9:	00 00                	add    %al,(%eax)
    90ab:	00 00                	add    %al,(%eax)
    90ad:	41                   	inc    %ecx
    90ae:	0e                   	push   %cs
    90af:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    90b5:	00 00                	add    %al,(%eax)
    90b7:	00 1c 00             	add    %bl,(%eax,%eax,1)
    90ba:	00 00                	add    %al,(%eax)
    90bc:	c0 00 00             	rolb   $0x0,(%eax)
    90bf:	00 18                	add    %bl,(%eax)
    90c1:	fb                   	sti    
    90c2:	ff                   	(bad)  
    90c3:	ff 13                	call   *(%ebx)
    90c5:	00 00                	add    %al,(%eax)
    90c7:	00 00                	add    %al,(%eax)
    90c9:	41                   	inc    %ecx
    90ca:	0e                   	push   %cs
    90cb:	08 85 02 44 0d 05    	or     %al,0x50d4402(%ebp)
    90d1:	4d                   	dec    %ebp
    90d2:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    90d5:	04 00                	add    $0x0,%al
    90d7:	00 24 00             	add    %ah,(%eax,%eax,1)
    90da:	00 00                	add    %al,(%eax)
    90dc:	e0 00                	loopne 90de <exec_kernel+0x1df>
    90de:	00 00                	add    %al,(%eax)
    90e0:	0b fb                	or     %ebx,%edi
    90e2:	ff                   	(bad)  
    90e3:	ff 2d 00 00 00 00    	ljmp   *0x0
    90e9:	41                   	inc    %ecx
    90ea:	0e                   	push   %cs
    90eb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    90f1:	42                   	inc    %edx
    90f2:	86 03                	xchg   %al,(%ebx)
    90f4:	83 04 65 c3 41 c6 41 	addl   $0xffffffc5,0x41c641c3(,%eiz,2)
    90fb:	c5 
    90fc:	0c 04                	or     $0x4,%al
    90fe:	04 00                	add    $0x0,%al
    9100:	28 00                	sub    %al,(%eax)
    9102:	00 00                	add    %al,(%eax)
    9104:	08 01                	or     %al,(%ecx)
    9106:	00 00                	add    %al,(%eax)
    9108:	10 fb                	adc    %bh,%bl
    910a:	ff                   	(bad)  
    910b:	ff 61 00             	jmp    *0x0(%ecx)
    910e:	00 00                	add    %al,(%eax)
    9110:	00 41 0e             	add    %al,0xe(%ecx)
    9113:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9119:	43                   	inc    %ebx
    911a:	87 03                	xchg   %eax,(%ebx)
    911c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
    911f:	05 02 53 c3 41       	add    $0x41c35302,%eax
    9124:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
    9128:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    912b:	04 1c                	add    $0x1c,%al
    912d:	00 00                	add    %al,(%eax)
    912f:	00 34 01             	add    %dh,(%ecx,%eax,1)
    9132:	00 00                	add    %al,(%eax)
    9134:	45                   	inc    %ebp
    9135:	fb                   	sti    
    9136:	ff                   	(bad)  
    9137:	ff 1a                	lcall  *(%edx)
    9139:	00 00                	add    %al,(%eax)
    913b:	00 00                	add    %al,(%eax)
    913d:	41                   	inc    %ecx
    913e:	0e                   	push   %cs
    913f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9145:	56                   	push   %esi
    9146:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9149:	04 00                	add    $0x0,%al
    914b:	00 1c 00             	add    %bl,(%eax,%eax,1)
    914e:	00 00                	add    %al,(%eax)
    9150:	54                   	push   %esp
    9151:	01 00                	add    %eax,(%eax)
    9153:	00 3f                	add    %bh,(%edi)
    9155:	fb                   	sti    
    9156:	ff                   	(bad)  
    9157:	ff 1a                	lcall  *(%edx)
    9159:	00 00                	add    %al,(%eax)
    915b:	00 00                	add    %al,(%eax)
    915d:	41                   	inc    %ecx
    915e:	0e                   	push   %cs
    915f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9165:	56                   	push   %esi
    9166:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9169:	04 00                	add    $0x0,%al
    916b:	00 1c 00             	add    %bl,(%eax,%eax,1)
    916e:	00 00                	add    %al,(%eax)
    9170:	74 01                	je     9173 <exec_kernel+0x274>
    9172:	00 00                	add    %al,(%eax)
    9174:	39 fb                	cmp    %edi,%ebx
    9176:	ff                   	(bad)  
    9177:	ff 1f                	lcall  *(%edi)
    9179:	00 00                	add    %al,(%eax)
    917b:	00 00                	add    %al,(%eax)
    917d:	41                   	inc    %ecx
    917e:	0e                   	push   %cs
    917f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9185:	57                   	push   %edi
    9186:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9189:	04 00                	add    $0x0,%al
    918b:	00 20                	add    %ah,(%eax)
    918d:	00 00                	add    %al,(%eax)
    918f:	00 94 01 00 00 38 fb 	add    %dl,-0x4c80000(%ecx,%eax,1)
    9196:	ff                   	(bad)  
    9197:	ff 6b 00             	ljmp   *0x0(%ebx)
    919a:	00 00                	add    %al,(%eax)
    919c:	00 41 0e             	add    %al,0xe(%ecx)
    919f:	08 85 02 47 0d 05    	or     %al,0x50d4702(%ebp)
    91a5:	41                   	inc    %ecx
    91a6:	87 03                	xchg   %eax,(%ebx)
    91a8:	02 60 c7             	add    -0x39(%eax),%ah
    91ab:	41                   	inc    %ecx
    91ac:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    91af:	04 28                	add    $0x28,%al
    91b1:	00 00                	add    %al,(%eax)
    91b3:	00 b8 01 00 00 7f    	add    %bh,0x7f000001(%eax)
    91b9:	fb                   	sti    
    91ba:	ff                   	(bad)  
    91bb:	ff 41 00             	incl   0x0(%ecx)
    91be:	00 00                	add    %al,(%eax)
    91c0:	00 41 0e             	add    %al,0xe(%ecx)
    91c3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    91c9:	43                   	inc    %ebx
    91ca:	87 03                	xchg   %eax,(%ebx)
    91cc:	86 04 83             	xchg   %al,(%ebx,%eax,4)
    91cf:	05 77 c3 41 c6       	add    $0xc641c377,%eax
    91d4:	41                   	inc    %ecx
    91d5:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
    91dc:	28 00                	sub    %al,(%eax)
    91de:	00 00                	add    %al,(%eax)
    91e0:	e4 01                	in     $0x1,%al
    91e2:	00 00                	add    %al,(%eax)
    91e4:	94                   	xchg   %eax,%esp
    91e5:	fb                   	sti    
    91e6:	ff                   	(bad)  
    91e7:	ff 81 00 00 00 00    	incl   0x0(%ecx)
    91ed:	41                   	inc    %ecx
    91ee:	0e                   	push   %cs
    91ef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    91f5:	46                   	inc    %esi
    91f6:	87 03                	xchg   %eax,(%ebx)
    91f8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
    91fb:	05 02 6f c3 46       	add    $0x46c36f02,%eax
    9200:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
    9204:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9207:	04 24                	add    $0x24,%al
    9209:	00 00                	add    %al,(%eax)
    920b:	00 10                	add    %dl,(%eax)
    920d:	02 00                	add    (%eax),%al
    920f:	00 e9                	add    %ch,%cl
    9211:	fb                   	sti    
    9212:	ff                   	(bad)  
    9213:	ff 60 00             	jmp    *0x0(%eax)
    9216:	00 00                	add    %al,(%eax)
    9218:	00 41 0e             	add    %al,0xe(%ecx)
    921b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9221:	42                   	inc    %edx
    9222:	86 03                	xchg   %al,(%ebx)
    9224:	83 04 02 58          	addl   $0x58,(%edx,%eax,1)
    9228:	c3                   	ret    
    9229:	41                   	inc    %ecx
    922a:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
    922e:	04 04                	add    $0x4,%al
    9230:	24 00                	and    $0x0,%al
    9232:	00 00                	add    %al,(%eax)
    9234:	38 02                	cmp    %al,(%edx)
    9236:	00 00                	add    %al,(%eax)
    9238:	21 fc                	and    %edi,%esp
    923a:	ff                   	(bad)  
    923b:	ff a6 00 00 00 00    	jmp    *0x0(%esi)
    9241:	41                   	inc    %ecx
    9242:	0e                   	push   %cs
    9243:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9249:	42                   	inc    %edx
    924a:	86 03                	xchg   %al,(%ebx)
    924c:	83 04 02 9a          	addl   $0xffffff9a,(%edx,%eax,1)
    9250:	c3                   	ret    
    9251:	41                   	inc    %ecx
    9252:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
    9256:	04 04                	add    $0x4,%al

Disassembly of section .data:

00009260 <hex.1136>:
    9260:	30 31                	xor    %dh,(%ecx)
    9262:	32 33                	xor    (%ebx),%dh
    9264:	34 35                	xor    $0x35,%al
    9266:	36 37                	ss aaa 
    9268:	38 39                	cmp    %bh,(%ecx)
    926a:	61                   	popa   
    926b:	62 63 64             	bound  %esp,0x64(%ebx)
    926e:	65 66 00 00          	data16 add %al,%gs:(%eax)
    9272:	00 00                	add    %al,(%eax)

00009274 <dec.1131>:
    9274:	30 31                	xor    %dh,(%ecx)
    9276:	32 33                	xor    (%ebx),%dh
    9278:	34 35                	xor    $0x35,%al
    927a:	36 37                	ss aaa 
    927c:	38 39                	cmp    %bh,(%ecx)
    927e:	00 00                	add    %al,(%eax)

00009280 <blank>:
    9280:	0f 8f 00 00 00 80    	jg     80009286 <SMAP_SIG+0x2cb35136>

00009284 <video>:
    9284:	00 80 0b 00 00 00    	add    %al,0xb(%eax)
    928a:	00 00                	add    %al,(%eax)
    928c:	00 00                	add    %al,(%eax)
    928e:	00 00                	add    %al,(%eax)
    9290:	00 00                	add    %al,(%eax)
    9292:	00 00                	add    %al,(%eax)
    9294:	00 00                	add    %al,(%eax)
    9296:	00 00                	add    %al,(%eax)
    9298:	00 00                	add    %al,(%eax)
    929a:	00 00                	add    %al,(%eax)
    929c:	00 00                	add    %al,(%eax)
    929e:	00 00                	add    %al,(%eax)

000092a0 <mboot_info>:
    92a0:	40                   	inc    %eax
    92a1:	00 00                	add    %al,(%eax)
    92a3:	00 00                	add    %al,(%eax)
    92a5:	00 00                	add    %al,(%eax)
    92a7:	00 00                	add    %al,(%eax)
    92a9:	00 00                	add    %al,(%eax)
    92ab:	00 00                	add    %al,(%eax)
    92ad:	00 00                	add    %al,(%eax)
    92af:	00 00                	add    %al,(%eax)
    92b1:	00 00                	add    %al,(%eax)
    92b3:	00 00                	add    %al,(%eax)
    92b5:	00 00                	add    %al,(%eax)
    92b7:	00 00                	add    %al,(%eax)
    92b9:	00 00                	add    %al,(%eax)
    92bb:	00 00                	add    %al,(%eax)
    92bd:	00 00                	add    %al,(%eax)
    92bf:	00 00                	add    %al,(%eax)
    92c1:	00 00                	add    %al,(%eax)
    92c3:	00 00                	add    %al,(%eax)
    92c5:	00 00                	add    %al,(%eax)
    92c7:	00 00                	add    %al,(%eax)
    92c9:	00 00                	add    %al,(%eax)
    92cb:	00 00                	add    %al,(%eax)
    92cd:	00 00                	add    %al,(%eax)
    92cf:	00 00                	add    %al,(%eax)
    92d1:	00 00                	add    %al,(%eax)
    92d3:	00 00                	add    %al,(%eax)
    92d5:	00 00                	add    %al,(%eax)
    92d7:	00 00                	add    %al,(%eax)
    92d9:	00 00                	add    %al,(%eax)
    92db:	00 00                	add    %al,(%eax)
    92dd:	00 00                	add    %al,(%eax)
    92df:	00 00                	add    %al,(%eax)
    92e1:	00 00                	add    %al,(%eax)
    92e3:	00 00                	add    %al,(%eax)
    92e5:	00 00                	add    %al,(%eax)
    92e7:	00 00                	add    %al,(%eax)
    92e9:	00 00                	add    %al,(%eax)
    92eb:	00 00                	add    %al,(%eax)
    92ed:	00 00                	add    %al,(%eax)
    92ef:	00 00                	add    %al,(%eax)
    92f1:	00 00                	add    %al,(%eax)
    92f3:	00 00                	add    %al,(%eax)
    92f5:	00 00                	add    %al,(%eax)
    92f7:	00 00                	add    %al,(%eax)
    92f9:	00 00                	add    %al,(%eax)
    92fb:	00 00                	add    %al,(%eax)
    92fd:	00 00                	add    %al,(%eax)
    92ff:	00                   	.byte 0x0

Disassembly of section .bss:

00009300 <__bss_start>:
    9300:	00 00                	add    %al,(%eax)
    9302:	00 00                	add    %al,(%eax)
    9304:	00 00                	add    %al,(%eax)
    9306:	00 00                	add    %al,(%eax)
    9308:	00 00                	add    %al,(%eax)
    930a:	00 00                	add    %al,(%eax)
    930c:	00 00                	add    %al,(%eax)
    930e:	00 00                	add    %al,(%eax)
    9310:	00 00                	add    %al,(%eax)
    9312:	00 00                	add    %al,(%eax)
    9314:	00 00                	add    %al,(%eax)
    9316:	00 00                	add    %al,(%eax)
    9318:	00 00                	add    %al,(%eax)
    931a:	00 00                	add    %al,(%eax)
    931c:	00 00                	add    %al,(%eax)
    931e:	00 00                	add    %al,(%eax)
    9320:	00 00                	add    %al,(%eax)
    9322:	00 00                	add    %al,(%eax)
    9324:	00 00                	add    %al,(%eax)
    9326:	00 00                	add    %al,(%eax)

00009328 <row>:
    9328:	00 00                	add    %al,(%eax)
    932a:	00 00                	add    %al,(%eax)

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    %edi
   1:	43                   	inc    %ebx
   2:	43                   	inc    %ebx
   3:	3a 20                	cmp    (%eax),%ah
   5:	28 47 4e             	sub    %al,0x4e(%edi)
   8:	55                   	push   %ebp
   9:	29 20                	sub    %esp,(%eax)
   b:	36 2e 31 2e          	ss xor %ebp,%cs:(%esi)
   f:	31 20                	xor    %esp,(%eax)
  11:	32 30                	xor    (%eax),%dh
  13:	31 36                	xor    %esi,(%esi)
  15:	30 36                	xor    %dh,(%esi)
  17:	32 31                	xor    (%ecx),%dh
  19:	20 28                	and    %ch,(%eax)
  1b:	52                   	push   %edx
  1c:	65 64 20 48 61       	gs and %cl,%fs:0x61(%eax)
  21:	74 20                	je     43 <PROT_MODE_DSEG+0x33>
  23:	36 2e 31 2e          	ss xor %ebp,%cs:(%esi)
  27:	31                   	.byte 0x31
  28:	2d                   	.byte 0x2d
  29:	33 29                	xor    (%ecx),%ebp
  2b:	00                   	.byte 0x0

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	1c 00                	sbb    $0x0,%al
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 00                	add    $0x0,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	00 7e 00             	add    %bh,0x0(%esi)
  13:	00 26                	add    %ah,(%esi)
  15:	0d 00 00 00 00       	or     $0x0,%eax
  1a:	00 00                	add    %al,(%eax)
  1c:	00 00                	add    %al,(%eax)
  1e:	00 00                	add    %al,(%eax)
  20:	1c 00                	sbb    $0x0,%al
  22:	00 00                	add    %al,(%eax)
  24:	02 00                	add    (%eax),%al
  26:	5d                   	pop    %ebp
  27:	00 00                	add    %al,(%eax)
  29:	00 04 00             	add    %al,(%eax,%eax,1)
  2c:	00 00                	add    %al,(%eax)
  2e:	00 00                	add    %al,(%eax)
  30:	26 8b 00             	mov    %es:(%eax),%eax
  33:	00 52 02             	add    %dl,0x2(%edx)
  36:	00 00                	add    %al,(%eax)
  38:	00 00                	add    %al,(%eax)
  3a:	00 00                	add    %al,(%eax)
  3c:	00 00                	add    %al,(%eax)
  3e:	00 00                	add    %al,(%eax)
  40:	1c 00                	sbb    $0x0,%al
  42:	00 00                	add    %al,(%eax)
  44:	02 00                	add    (%eax),%al
  46:	fb                   	sti    
  47:	06                   	push   %es
  48:	00 00                	add    %al,(%eax)
  4a:	04 00                	add    $0x0,%al
  4c:	00 00                	add    %al,(%eax)
  4e:	00 00                	add    %al,(%eax)
  50:	78 8d                	js     ffffffdf <SMAP_SIG+0xacb2be8f>
  52:	00 00                	add    %al,(%eax)
  54:	87 01                	xchg   %eax,(%ecx)
  56:	00 00                	add    %al,(%eax)
  58:	00 00                	add    %al,(%eax)
  5a:	00 00                	add    %al,(%eax)
  5c:	00 00                	add    %al,(%eax)
  5e:	00 00                	add    %al,(%eax)
  60:	1c 00                	sbb    $0x0,%al
  62:	00 00                	add    %al,(%eax)
  64:	02 00                	add    (%eax),%al
  66:	d1 0d 00 00 04 00    	rorl   0x40000
  6c:	00 00                	add    %al,(%eax)
  6e:	00 00                	add    %al,(%eax)
  70:	ff 8e 00 00 10 00    	decl   0x100000(%esi)
  76:	00 00                	add    %al,(%eax)
  78:	00 00                	add    %al,(%eax)
  7a:	00 00                	add    %al,(%eax)
  7c:	00 00                	add    %al,(%eax)
  7e:	00 00                	add    %al,(%eax)

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	59                   	pop    %ecx
   1:	00 00                	add    %al,(%eax)
   3:	00 02                	add    %al,(%edx)
   5:	00 00                	add    %al,(%eax)
   7:	00 00                	add    %al,(%eax)
   9:	00 04 01             	add    %al,(%ecx,%eax,1)
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	00 7e 00             	add    %bh,0x0(%esi)
  13:	00 26                	add    %ah,(%esi)
  15:	8b 00                	mov    (%eax),%eax
  17:	00 62 6f             	add    %ah,0x6f(%edx)
  1a:	6f                   	outsl  %ds:(%esi),(%dx)
  1b:	74 2f                	je     4c <PROT_MODE_DSEG+0x3c>
  1d:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  20:	74 31                	je     53 <PROT_MODE_DSEG+0x43>
  22:	2f                   	das    
  23:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  26:	74 31                	je     59 <PROT_MODE_DSEG+0x49>
  28:	2e 53                	cs push %ebx
  2a:	00 2f                	add    %ch,(%edi)
  2c:	68 6f 6d 65 2f       	push   $0x2f656d6f
  31:	61                   	popa   
  32:	63 63 74             	arpl   %sp,0x74(%ebx)
  35:	73 2f                	jae    66 <PROT_MODE_DSEG+0x56>
  37:	6a 61                	push   $0x61
  39:	38 36                	cmp    %dh,(%esi)
  3b:	32 2f                	xor    (%edi),%ch
  3d:	63 73 34             	arpl   %si,0x34(%ebx)
  40:	32 32                	xor    (%edx),%dh
  42:	2f                   	das    
  43:	6d                   	insl   (%dx),%es:(%edi)
  44:	63 65 72             	arpl   %sp,0x72(%ebp)
  47:	74 69                	je     b2 <PR_BOOTABLE+0x32>
  49:	6b 6f 73 00          	imul   $0x0,0x73(%edi),%ebp
  4d:	47                   	inc    %edi
  4e:	4e                   	dec    %esi
  4f:	55                   	push   %ebp
  50:	20 41 53             	and    %al,0x53(%ecx)
  53:	20 32                	and    %dh,(%edx)
  55:	2e 32 36             	xor    %cs:(%esi),%dh
  58:	2e 31 00             	xor    %eax,%cs:(%eax)
  5b:	01 80 9a 06 00 00    	add    %eax,0x69a(%eax)
  61:	04 00                	add    $0x0,%al
  63:	14 00                	adc    $0x0,%al
  65:	00 00                	add    %al,(%eax)
  67:	04 01                	add    $0x1,%al
  69:	1d 01 00 00 0c       	sbb    $0xc000001,%eax
  6e:	4d                   	dec    %ebp
  6f:	00 00                	add    %al,(%eax)
  71:	00 d2                	add    %dl,%dl
  73:	00 00                	add    %al,(%eax)
  75:	00 26                	add    %ah,(%esi)
  77:	8b 00                	mov    (%eax),%eax
  79:	00 52 02             	add    %dl,0x2(%edx)
  7c:	00 00                	add    %al,(%eax)
  7e:	80 00 00             	addb   $0x0,(%eax)
  81:	00 02                	add    %al,(%edx)
  83:	01 06                	add    %eax,(%esi)
  85:	96                   	xchg   %eax,%esi
  86:	00 00                	add    %al,(%eax)
  88:	00 03                	add    %al,(%ebx)
  8a:	63 00                	arpl   %ax,(%eax)
  8c:	00 00                	add    %al,(%eax)
  8e:	02 0d 37 00 00 00    	add    0x37,%cl
  94:	02 01                	add    (%ecx),%al
  96:	08 94 00 00 00 02 02 	or     %dl,0x2020000(%eax,%eax,1)
  9d:	05 18 00 00 00       	add    $0x18,%eax
  a2:	02 02                	add    (%edx),%al
  a4:	07                   	pop    %es
  a5:	f9                   	stc    
  a6:	00 00                	add    %al,(%eax)
  a8:	00 03                	add    %al,(%ebx)
  aa:	c4 00                	les    (%eax),%eax
  ac:	00 00                	add    %al,(%eax)
  ae:	02 10                	add    (%eax),%dl
  b0:	57                   	push   %edi
  b1:	00 00                	add    %al,(%eax)
  b3:	00 04 04             	add    %al,(%esp,%eax,1)
  b6:	05 69 6e 74 00       	add    $0x746e69,%eax
  bb:	03 c3                	add    %ebx,%eax
  bd:	00 00                	add    %al,(%eax)
  bf:	00 02                	add    %al,(%edx)
  c1:	11 69 00             	adc    %ebp,0x0(%ecx)
  c4:	00 00                	add    %al,(%eax)
  c6:	02 04 07             	add    (%edi,%eax,1),%al
  c9:	b6 00                	mov    $0x0,%dh
  cb:	00 00                	add    %al,(%eax)
  cd:	02 08                	add    (%eax),%cl
  cf:	05 75 00 00 00       	add    $0x75,%eax
  d4:	02 08                	add    (%eax),%cl
  d6:	07                   	pop    %es
  d7:	ac                   	lods   %ds:(%esi),%al
  d8:	00 00                	add    %al,(%eax)
  da:	00 02                	add    %al,(%edx)
  dc:	04 07                	add    $0x7,%al
  de:	22 00                	and    (%eax),%al
  e0:	00 00                	add    %al,(%eax)
  e2:	05 b9 01 00 00       	add    $0x1b9,%eax
  e7:	01 06                	add    %eax,(%esi)
  e9:	96                   	xchg   %eax,%esi
  ea:	00 00                	add    %al,(%eax)
  ec:	00 05 03 84 92 00    	add    %al,0x928403
  f2:	00 06                	add    %al,(%esi)
  f4:	04 a3                	add    $0xa3,%al
  f6:	00 00                	add    %al,(%eax)
  f8:	00 02                	add    %al,(%edx)
  fa:	01 06                	add    %eax,(%esi)
  fc:	9d                   	popf   
  fd:	00 00                	add    %al,(%eax)
  ff:	00 07                	add    %al,(%edi)
 101:	9c                   	pushf  
 102:	00 00                	add    %al,(%eax)
 104:	00 08                	add    %cl,(%eax)
 106:	9c                   	pushf  
 107:	00 00                	add    %al,(%eax)
 109:	00 09                	add    %cl,(%ecx)
 10b:	72 6f                	jb     17c <PR_BOOTABLE+0xfc>
 10d:	77 00                	ja     10f <PR_BOOTABLE+0x8f>
 10f:	01 1c 57             	add    %ebx,(%edi,%edx,2)
 112:	00 00                	add    %al,(%eax)
 114:	00 05 03 28 93 00    	add    %al,0x932803
 11a:	00 05 ae 01 00 00    	add    %al,0x1ae
 120:	01 1e                	add    %ebx,(%esi)
 122:	cf                   	iret   
 123:	00 00                	add    %al,(%eax)
 125:	00 05 03 80 92 00    	add    %al,0x928003
 12b:	00 06                	add    %al,(%esi)
 12d:	04 9c                	add    $0x9c,%al
 12f:	00 00                	add    %al,(%eax)
 131:	00 0a                	add    %cl,(%edx)
 133:	9c                   	pushf  
 134:	00 00                	add    %al,(%eax)
 136:	00 e5                	add    %ah,%ch
 138:	00 00                	add    %al,(%eax)
 13a:	00 0b                	add    %cl,(%ebx)
 13c:	7e 00                	jle    13e <PR_BOOTABLE+0xbe>
 13e:	00 00                	add    %al,(%eax)
 140:	27                   	daa    
 141:	00 0c a5 01 00 00 01 	add    %cl,0x1000001(,%eiz,4)
 148:	38 d5                	cmp    %dl,%ch
 14a:	00 00                	add    %al,(%eax)
 14c:	00 05 03 00 93 00    	add    %al,0x930003
 152:	00 0d 83 00 00 00    	add    %cl,0x83
 158:	01 a4 37 8d 00 00 41 	add    %esp,0x4100008d(%edi,%esi,1)
 15f:	00 00                	add    %al,(%eax)
 161:	00 01                	add    %al,(%ecx)
 163:	9c                   	pushf  
 164:	5d                   	pop    %ebp
 165:	01 00                	add    %eax,(%eax)
 167:	00 0e                	add    %cl,(%esi)
 169:	76 61                	jbe    1cc <PR_BOOTABLE+0x14c>
 16b:	00 01                	add    %al,(%ecx)
 16d:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 16e:	5e                   	pop    %esi
 16f:	00 00                	add    %al,(%eax)
 171:	00 00                	add    %al,(%eax)
 173:	00 00                	add    %al,(%eax)
 175:	00 0f                	add    %cl,(%edi)
 177:	78 04                	js     17d <PR_BOOTABLE+0xfd>
 179:	00 00                	add    %al,(%eax)
 17b:	01 a4 5e 00 00 00 02 	add    %esp,0x2000000(%esi,%ebx,2)
 182:	91                   	xchg   %eax,%ecx
 183:	04 10                	add    $0x10,%al
 185:	24 02                	and    $0x2,%al
 187:	00 00                	add    %al,(%eax)
 189:	01 a4 5e 00 00 00 63 	add    %esp,0x63000000(%esi,%ebx,2)
 190:	00 00                	add    %al,(%eax)
 192:	00 11                	add    %dl,(%ecx)
 194:	6c                   	insb   (%dx),%es:(%edi)
 195:	62 61 00             	bound  %esp,0x0(%ecx)
 198:	01 a4 5e 00 00 00 02 	add    %esp,0x2000000(%esi,%ebx,2)
 19f:	91                   	xchg   %eax,%ecx
 1a0:	0c 12                	or     $0x12,%al
 1a2:	00 00                	add    %al,(%eax)
 1a4:	00 00                	add    %al,(%eax)
 1a6:	01 a6 5e 00 00 00    	add    %esp,0x5e(%esi)
 1ac:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 1ad:	00 00                	add    %al,(%eax)
 1af:	00 13                	add    %dl,(%ebx)
 1b1:	6c                   	insb   (%dx),%es:(%edi)
 1b2:	8d 00                	lea    (%eax),%eax
 1b4:	00 5d 01             	add    %bl,0x1(%ebp)
 1b7:	00 00                	add    %al,(%eax)
 1b9:	00 0d 42 00 00 00    	add    %cl,0x42
 1bf:	01 8e cc 8c 00 00    	add    %ecx,0x8ccc(%esi)
 1c5:	6b 00 00             	imul   $0x0,(%eax),%eax
 1c8:	00 01                	add    %al,(%ecx)
 1ca:	9c                   	pushf  
 1cb:	12 03                	adc    (%ebx),%al
 1cd:	00 00                	add    %al,(%eax)
 1cf:	11 64 73 74          	adc    %esp,0x74(%ebx,%esi,2)
 1d3:	00 01                	add    %al,(%ecx)
 1d5:	8e 12                	mov    (%edx),%ss
 1d7:	03 00                	add    (%eax),%eax
 1d9:	00 02                	add    %al,(%edx)
 1db:	91                   	xchg   %eax,%ecx
 1dc:	00 0f                	add    %cl,(%edi)
 1de:	24 02                	and    $0x2,%al
 1e0:	00 00                	add    %al,(%eax)
 1e2:	01 8e 5e 00 00 00    	add    %ecx,0x5e(%esi)
 1e8:	02 91 04 14 14 03    	add    0x3141404(%ecx),%dl
 1ee:	00 00                	add    %al,(%eax)
 1f0:	cd 8c                	int    $0x8c
 1f2:	00 00                	add    %al,(%eax)
 1f4:	00 00                	add    %al,(%eax)
 1f6:	00 00                	add    %al,(%eax)
 1f8:	01 91 c6 01 00 00    	add    %edx,0x1c6(%ecx)
 1fe:	15 57 06 00 00       	adc    $0x657,%eax
 203:	cd 8c                	int    $0x8c
 205:	00 00                	add    %al,(%eax)
 207:	18 00                	sbb    %al,(%eax)
 209:	00 00                	add    %al,(%eax)
 20b:	01 89 16 67 06 00    	add    %ecx,0x66716(%ecx)
 211:	00 d1                	add    %dl,%cl
 213:	00 00                	add    %al,(%eax)
 215:	00 17                	add    %dl,(%edi)
 217:	18 00                	sbb    %al,(%eax)
 219:	00 00                	add    %al,(%eax)
 21b:	18 72 06             	sbb    %dh,0x6(%edx)
 21e:	00 00                	add    %al,(%eax)
 220:	00 00                	add    %al,(%eax)
 222:	00 19                	add    %bl,(%ecx)
 224:	7e 06                	jle    22c <PR_BOOTABLE+0x1ac>
 226:	00 00                	add    %al,(%eax)
 228:	e0 8c                	loopne 1b6 <PR_BOOTABLE+0x136>
 22a:	00 00                	add    %al,(%eax)
 22c:	08 00                	or     %al,(%eax)
 22e:	00 00                	add    %al,(%eax)
 230:	01 93 ec 01 00 00    	add    %edx,0x1ec(%ebx)
 236:	16                   	push   %ss
 237:	91                   	xchg   %eax,%ecx
 238:	06                   	push   %es
 239:	00 00                	add    %al,(%eax)
 23b:	e7 00                	out    %eax,$0x0
 23d:	00 00                	add    %al,(%eax)
 23f:	16                   	push   %ss
 240:	86 06                	xchg   %al,(%esi)
 242:	00 00                	add    %al,(%eax)
 244:	fb                   	sti    
 245:	00 00                	add    %al,(%eax)
 247:	00 00                	add    %al,(%eax)
 249:	19 7e 06             	sbb    %edi,0x6(%esi)
 24c:	00 00                	add    %al,(%eax)
 24e:	e8 8c 00 00 08       	call   80002df <_end+0x7ff6fb3>
 253:	00 00                	add    %al,(%eax)
 255:	00 01                	add    %al,(%ecx)
 257:	94                   	xchg   %eax,%esp
 258:	12 02                	adc    (%edx),%al
 25a:	00 00                	add    %al,(%eax)
 25c:	16                   	push   %ss
 25d:	91                   	xchg   %eax,%ecx
 25e:	06                   	push   %es
 25f:	00 00                	add    %al,(%eax)
 261:	11 01                	adc    %eax,(%ecx)
 263:	00 00                	add    %al,(%eax)
 265:	16                   	push   %ss
 266:	86 06                	xchg   %al,(%esi)
 268:	00 00                	add    %al,(%eax)
 26a:	24 01                	and    $0x1,%al
 26c:	00 00                	add    %al,(%eax)
 26e:	00 14 7e             	add    %dl,(%esi,%edi,2)
 271:	06                   	push   %es
 272:	00 00                	add    %al,(%eax)
 274:	f2 8c 00             	repnz mov %es,(%eax)
 277:	00 30                	add    %dh,(%eax)
 279:	00 00                	add    %al,(%eax)
 27b:	00 01                	add    %al,(%ecx)
 27d:	95                   	xchg   %eax,%ebp
 27e:	38 02                	cmp    %al,(%edx)
 280:	00 00                	add    %al,(%eax)
 282:	16                   	push   %ss
 283:	91                   	xchg   %eax,%ecx
 284:	06                   	push   %es
 285:	00 00                	add    %al,(%eax)
 287:	3a 01                	cmp    (%ecx),%al
 289:	00 00                	add    %al,(%eax)
 28b:	16                   	push   %ss
 28c:	86 06                	xchg   %al,(%esi)
 28e:	00 00                	add    %al,(%eax)
 290:	4e                   	dec    %esi
 291:	01 00                	add    %eax,(%eax)
 293:	00 00                	add    %al,(%eax)
 295:	14 7e                	adc    $0x7e,%al
 297:	06                   	push   %es
 298:	00 00                	add    %al,(%eax)
 29a:	fd                   	std    
 29b:	8c 00                	mov    %es,(%eax)
 29d:	00 48 00             	add    %cl,0x0(%eax)
 2a0:	00 00                	add    %al,(%eax)
 2a2:	01 96 5e 02 00 00    	add    %edx,0x25e(%esi)
 2a8:	16                   	push   %ss
 2a9:	91                   	xchg   %eax,%ecx
 2aa:	06                   	push   %es
 2ab:	00 00                	add    %al,(%eax)
 2ad:	64 01 00             	add    %eax,%fs:(%eax)
 2b0:	00 16                	add    %dl,(%esi)
 2b2:	86 06                	xchg   %al,(%esi)
 2b4:	00 00                	add    %al,(%eax)
 2b6:	78 01                	js     2b9 <PR_BOOTABLE+0x239>
 2b8:	00 00                	add    %al,(%eax)
 2ba:	00 14 7e             	add    %dl,(%esi,%edi,2)
 2bd:	06                   	push   %es
 2be:	00 00                	add    %al,(%eax)
 2c0:	08 8d 00 00 60 00    	or     %cl,0x600000(%ebp)
 2c6:	00 00                	add    %al,(%eax)
 2c8:	01 97 84 02 00 00    	add    %edx,0x284(%edi)
 2ce:	16                   	push   %ss
 2cf:	91                   	xchg   %eax,%ecx
 2d0:	06                   	push   %es
 2d1:	00 00                	add    %al,(%eax)
 2d3:	8e 01                	mov    (%ecx),%es
 2d5:	00 00                	add    %al,(%eax)
 2d7:	16                   	push   %ss
 2d8:	86 06                	xchg   %al,(%esi)
 2da:	00 00                	add    %al,(%eax)
 2dc:	a8 01                	test   $0x1,%al
 2de:	00 00                	add    %al,(%eax)
 2e0:	00 19                	add    %bl,(%ecx)
 2e2:	7e 06                	jle    2ea <PR_BOOTABLE+0x26a>
 2e4:	00 00                	add    %al,(%eax)
 2e6:	14 8d                	adc    $0x8d,%al
 2e8:	00 00                	add    %al,(%eax)
 2ea:	08 00                	or     %al,(%eax)
 2ec:	00 00                	add    %al,(%eax)
 2ee:	01 98 aa 02 00 00    	add    %ebx,0x2aa(%eax)
 2f4:	16                   	push   %ss
 2f5:	91                   	xchg   %eax,%ecx
 2f6:	06                   	push   %es
 2f7:	00 00                	add    %al,(%eax)
 2f9:	be 01 00 00 16       	mov    $0x16000001,%esi
 2fe:	86 06                	xchg   %al,(%esi)
 300:	00 00                	add    %al,(%eax)
 302:	d3 01                	roll   %cl,(%ecx)
 304:	00 00                	add    %al,(%eax)
 306:	00 19                	add    %bl,(%ecx)
 308:	14 03                	adc    $0x3,%al
 30a:	00 00                	add    %al,(%eax)
 30c:	1c 8d                	sbb    $0x8d,%al
 30e:	00 00                	add    %al,(%eax)
 310:	08 00                	or     %al,(%eax)
 312:	00 00                	add    %al,(%eax)
 314:	01 9b e6 02 00 00    	add    %ebx,0x2e6(%ebx)
 31a:	1a 57 06             	sbb    0x6(%edi),%dl
 31d:	00 00                	add    %al,(%eax)
 31f:	1c 8d                	sbb    $0x8d,%al
 321:	00 00                	add    %al,(%eax)
 323:	01 00                	add    %eax,(%eax)
 325:	00 00                	add    %al,(%eax)
 327:	01 89 16 67 06 00    	add    %ecx,0x66716(%ecx)
 32d:	00 e9                	add    %ch,%cl
 32f:	01 00                	add    %eax,(%eax)
 331:	00 1b                	add    %bl,(%ebx)
 333:	1c 8d                	sbb    $0x8d,%al
 335:	00 00                	add    %al,(%eax)
 337:	01 00                	add    %eax,(%eax)
 339:	00 00                	add    %al,(%eax)
 33b:	18 72 06             	sbb    %dh,0x6(%edx)
 33e:	00 00                	add    %al,(%eax)
 340:	00 00                	add    %al,(%eax)
 342:	00 1a                	add    %bl,(%edx)
 344:	29 06                	sub    %eax,(%esi)
 346:	00 00                	add    %al,(%eax)
 348:	24 8d                	and    $0x8d,%al
 34a:	00 00                	add    %al,(%eax)
 34c:	10 00                	adc    %al,(%eax)
 34e:	00 00                	add    %al,(%eax)
 350:	01 9e 16 4b 06 00    	add    %ebx,0x64b16(%esi)
 356:	00 ff                	add    %bh,%bh
 358:	01 00                	add    %eax,(%eax)
 35a:	00 16                	add    %dl,(%esi)
 35c:	40                   	inc    %eax
 35d:	06                   	push   %es
 35e:	00 00                	add    %al,(%eax)
 360:	14 02                	adc    $0x2,%al
 362:	00 00                	add    %al,(%eax)
 364:	16                   	push   %ss
 365:	35 06 00 00 28       	xor    $0x28000006,%eax
 36a:	02 00                	add    (%eax),%al
 36c:	00 00                	add    %al,(%eax)
 36e:	00 1c 04             	add    %bl,(%esp,%eax,1)
 371:	1d 07 00 00 00       	sbb    $0x7,%eax
 376:	01 86 01 0d a2 00    	add    %eax,0xa20d01(%esi)
 37c:	00 00                	add    %al,(%eax)
 37e:	01 7b 93             	add    %edi,-0x6d(%ebx)
 381:	8c 00                	mov    %es,(%eax)
 383:	00 1a                	add    %bl,(%edx)
 385:	00 00                	add    %al,(%eax)
 387:	00 01                	add    %al,(%ecx)
 389:	9c                   	pushf  
 38a:	64 03 00             	add    %fs:(%eax),%eax
 38d:	00 11                	add    %dl,(%ecx)
 38f:	6e                   	outsb  %ds:(%esi),(%dx)
 390:	00 01                	add    %al,(%ecx)
 392:	7b 57                	jnp    3eb <PR_BOOTABLE+0x36b>
 394:	00 00                	add    %al,(%eax)
 396:	00 02                	add    %al,(%edx)
 398:	91                   	xchg   %eax,%ecx
 399:	00 11                	add    %dl,(%ecx)
 39b:	73 00                	jae    39d <PR_BOOTABLE+0x31d>
 39d:	01 7b cf             	add    %edi,-0x31(%ebx)
 3a0:	00 00                	add    %al,(%eax)
 3a2:	00 02                	add    %al,(%edx)
 3a4:	91                   	xchg   %eax,%ecx
 3a5:	04 09                	add    $0x9,%al
 3a7:	68 65 78 00 01       	push   $0x1007865
 3ac:	7d 64                	jge    412 <PR_BOOTABLE+0x392>
 3ae:	03 00                	add    (%eax),%eax
 3b0:	00 05 03 60 92 00    	add    %al,0x926003
 3b6:	00 13                	add    %dl,(%ebx)
 3b8:	a8 8c                	test   $0x8c,%al
 3ba:	00 00                	add    %al,(%eax)
 3bc:	cc                   	int3   
 3bd:	03 00                	add    (%eax),%eax
 3bf:	00 00                	add    %al,(%eax)
 3c1:	0a 9c 00 00 00 74 03 	or     0x3740000(%eax,%eax,1),%bl
 3c8:	00 00                	add    %al,(%eax)
 3ca:	0b 7e 00             	or     0x0(%esi),%edi
 3cd:	00 00                	add    %al,(%eax)
 3cf:	10 00                	adc    %al,(%eax)
 3d1:	0d 8f 00 00 00       	or     $0x8f,%eax
 3d6:	01 73 79             	add    %esi,0x79(%ebx)
 3d9:	8c 00                	mov    %es,(%eax)
 3db:	00 1a                	add    %bl,(%edx)
 3dd:	00 00                	add    %al,(%eax)
 3df:	00 01                	add    %al,(%ecx)
 3e1:	9c                   	pushf  
 3e2:	bc 03 00 00 11       	mov    $0x11000003,%esp
 3e7:	6e                   	outsb  %ds:(%esi),(%dx)
 3e8:	00 01                	add    %al,(%ecx)
 3ea:	73 57                	jae    443 <PR_BOOTABLE+0x3c3>
 3ec:	00 00                	add    %al,(%eax)
 3ee:	00 02                	add    %al,(%edx)
 3f0:	91                   	xchg   %eax,%ecx
 3f1:	00 11                	add    %dl,(%ecx)
 3f3:	73 00                	jae    3f5 <PR_BOOTABLE+0x375>
 3f5:	01 73 cf             	add    %esi,-0x31(%ebx)
 3f8:	00 00                	add    %al,(%eax)
 3fa:	00 02                	add    %al,(%edx)
 3fc:	91                   	xchg   %eax,%ecx
 3fd:	04 09                	add    $0x9,%al
 3ff:	64 65 63 00          	fs arpl %ax,%gs:(%eax)
 403:	01 75 bc             	add    %esi,-0x44(%ebp)
 406:	03 00                	add    (%eax),%eax
 408:	00 05 03 74 92 00    	add    %al,0x927403
 40e:	00 13                	add    %dl,(%ebx)
 410:	8e 8c 00 00 cc 03 00 	mov    0x3cc00(%eax,%eax,1),%cs
 417:	00 00                	add    %al,(%eax)
 419:	0a 9c 00 00 00 cc 03 	or     0x3cc0000(%eax,%eax,1),%bl
 420:	00 00                	add    %al,(%eax)
 422:	0b 7e 00             	or     0x0(%esi),%edi
 425:	00 00                	add    %al,(%eax)
 427:	0a 00                	or     (%eax),%al
 429:	0d 18 01 00 00       	or     $0x118,%eax
 42e:	01 61 18             	add    %esp,0x18(%ecx)
 431:	8c 00                	mov    %es,(%eax)
 433:	00 61 00             	add    %ah,0x0(%ecx)
 436:	00 00                	add    %al,(%eax)
 438:	01 9c 3c 04 00 00 0e 	add    %ebx,0xe000004(%esp,%edi,1)
 43f:	6e                   	outsb  %ds:(%esi),(%dx)
 440:	00 01                	add    %al,(%ecx)
 442:	61                   	popa   
 443:	57                   	push   %edi
 444:	00 00                	add    %al,(%eax)
 446:	00 3e                	add    %bh,(%esi)
 448:	02 00                	add    (%eax),%al
 44a:	00 11                	add    %dl,(%ecx)
 44c:	73 00                	jae    44e <PR_BOOTABLE+0x3ce>
 44e:	01 61 cf             	add    %esp,-0x31(%ecx)
 451:	00 00                	add    %al,(%eax)
 453:	00 02                	add    %al,(%edx)
 455:	91                   	xchg   %eax,%ecx
 456:	04 0f                	add    $0xf,%al
 458:	b4 01                	mov    $0x1,%ah
 45a:	00 00                	add    %al,(%eax)
 45c:	01 61 57             	add    %esp,0x57(%ecx)
 45f:	00 00                	add    %al,(%eax)
 461:	00 02                	add    %al,(%edx)
 463:	91                   	xchg   %eax,%ecx
 464:	08 0f                	or     %cl,(%edi)
 466:	bd 03 00 00 01       	mov    $0x1000003,%ebp
 46b:	61                   	popa   
 46c:	cf                   	iret   
 46d:	00 00                	add    %al,(%eax)
 46f:	00 02                	add    %al,(%edx)
 471:	91                   	xchg   %eax,%ecx
 472:	0c 1e                	or     $0x1e,%al
 474:	69 00 01 63 57 00    	imul   $0x576301,(%eax),%eax
 47a:	00 00                	add    %al,(%eax)
 47c:	5d                   	pop    %ebp
 47d:	02 00                	add    (%eax),%al
 47f:	00 12                	add    %dl,(%edx)
 481:	98                   	cwtl   
 482:	01 00                	add    %eax,(%eax)
 484:	00 01                	add    %al,(%ecx)
 486:	63 57 00             	arpl   %dx,0x0(%edi)
 489:	00 00                	add    %al,(%eax)
 48b:	91                   	xchg   %eax,%ecx
 48c:	02 00                	add    (%eax),%al
 48e:	00 1f                	add    %bl,(%edi)
 490:	79 8c                	jns    41e <PR_BOOTABLE+0x39e>
 492:	00 00                	add    %al,(%eax)
 494:	3c 04                	cmp    $0x4,%al
 496:	00 00                	add    %al,(%eax)
 498:	00 0d 9d 01 00 00    	add    %cl,0x19d
 49e:	01 52 eb             	add    %edx,-0x15(%edx)
 4a1:	8b 00                	mov    (%eax),%eax
 4a3:	00 2d 00 00 00 01    	add    %ch,0x1000000
 4a9:	9c                   	pushf  
 4aa:	8c 04 00             	mov    %es,(%eax,%eax,1)
 4ad:	00 11                	add    %dl,(%ecx)
 4af:	73 00                	jae    4b1 <PR_BOOTABLE+0x431>
 4b1:	01 52 cf             	add    %edx,-0x31(%edx)
 4b4:	00 00                	add    %al,(%eax)
 4b6:	00 02                	add    %al,(%edx)
 4b8:	91                   	xchg   %eax,%ecx
 4b9:	00 1e                	add    %bl,(%esi)
 4bb:	69 00 01 54 57 00    	imul   $0x575401,(%eax),%eax
 4c1:	00 00                	add    %al,(%eax)
 4c3:	a5                   	movsl  %ds:(%esi),%es:(%edi)
 4c4:	02 00                	add    (%eax),%al
 4c6:	00 09                	add    %cl,(%ecx)
 4c8:	6a 00                	push   $0x0
 4ca:	01 54 57 00          	add    %edx,0x0(%edi,%edx,2)
 4ce:	00 00                	add    %al,(%eax)
 4d0:	01 50 1e             	add    %edx,0x1e(%eax)
 4d3:	63 00                	arpl   %ax,(%eax)
 4d5:	01 55 9c             	add    %edx,-0x64(%ebp)
 4d8:	00 00                	add    %al,(%eax)
 4da:	00 c4                	add    %al,%ah
 4dc:	02 00                	add    (%eax),%al
 4de:	00 13                	add    %dl,(%ebx)
 4e0:	f9                   	stc    
 4e1:	8b 00                	mov    (%eax),%eax
 4e3:	00 8c 04 00 00 00 20 	add    %cl,0x20000000(%esp,%eax,1)
 4ea:	0c 01                	or     $0x1,%al
 4ec:	00 00                	add    %al,(%eax)
 4ee:	01 47 57             	add    %eax,0x57(%edi)
 4f1:	00 00                	add    %al,(%eax)
 4f3:	00 d8                	add    %bl,%al
 4f5:	8b 00                	mov    (%eax),%eax
 4f7:	00 13                	add    %dl,(%ebx)
 4f9:	00 00                	add    %al,(%eax)
 4fb:	00 01                	add    %al,(%ecx)
 4fd:	9c                   	pushf  
 4fe:	c0 04 00 00          	rolb   $0x0,(%eax,%eax,1)
 502:	0e                   	push   %cs
 503:	73 00                	jae    505 <PR_BOOTABLE+0x485>
 505:	01 47 c0             	add    %eax,-0x40(%edi)
 508:	04 00                	add    $0x0,%al
 50a:	00 d7                	add    %dl,%bh
 50c:	02 00                	add    (%eax),%al
 50e:	00 1e                	add    %bl,(%esi)
 510:	6e                   	outsb  %ds:(%esi),(%dx)
 511:	00 01                	add    %al,(%ecx)
 513:	49                   	dec    %ecx
 514:	57                   	push   %edi
 515:	00 00                	add    %al,(%eax)
 517:	00 fc                	add    %bh,%ah
 519:	02 00                	add    (%eax),%al
 51b:	00 00                	add    %al,(%eax)
 51d:	06                   	push   %es
 51e:	04 a8                	add    $0xa8,%al
 520:	00 00                	add    %al,(%eax)
 522:	00 0d 3d 00 00 00    	add    %cl,0x3d
 528:	01 3b                	add    %edi,(%ebx)
 52a:	ad                   	lods   %ds:(%esi),%eax
 52b:	8c 00                	mov    %es,(%eax)
 52d:	00 1f                	add    %bl,(%edi)
 52f:	00 00                	add    %al,(%eax)
 531:	00 01                	add    %al,(%ecx)
 533:	9c                   	pushf  
 534:	fb                   	sti    
 535:	04 00                	add    $0x0,%al
 537:	00 0e                	add    %cl,(%esi)
 539:	69 00 01 3b 4c 00    	imul   $0x4c3b01,(%eax),%eax
 53f:	00 00                	add    %al,(%eax)
 541:	1b 03                	sbb    (%ebx),%eax
 543:	00 00                	add    %al,(%eax)
 545:	13 bd 8c 00 00 1c    	adc    0x1c00008c(%ebp),%edi
 54b:	03 00                	add    (%eax),%eax
 54d:	00 1f                	add    %bl,(%edi)
 54f:	cc                   	int3   
 550:	8c 00                	mov    %es,(%eax)
 552:	00 48 05             	add    %cl,0x5(%eax)
 555:	00 00                	add    %al,(%eax)
 557:	00 0d 37 00 00 00    	add    %cl,0x37
 55d:	01 2f                	add    %ebp,(%edi)
 55f:	c1 8b 00 00 17 00 00 	rorl   $0x0,0x170000(%ebx)
 566:	00 01                	add    %al,(%ecx)
 568:	9c                   	pushf  
 569:	26 05 00 00 11 6d    	es add $0x6d110000,%eax
 56f:	00 01                	add    %al,(%ecx)
 571:	2f                   	das    
 572:	cf                   	iret   
 573:	00 00                	add    %al,(%eax)
 575:	00 02                	add    %al,(%edx)
 577:	91                   	xchg   %eax,%ecx
 578:	00 13                	add    %dl,(%ebx)
 57a:	d2 8b 00 00 7c 05    	rorb   %cl,0x57c0000(%ebx)
 580:	00 00                	add    %al,(%eax)
 582:	00 0d 2b 00 00 00    	add    %cl,0x2b
 588:	01 29                	add    %ebp,(%ecx)
 58a:	b4 8b                	mov    $0x8b,%ah
 58c:	00 00                	add    %al,(%eax)
 58e:	0d 00 00 00 01       	or     $0x1000000,%eax
 593:	9c                   	pushf  
 594:	48                   	dec    %eax
 595:	05 00 00 11 72       	add    $0x72110000,%eax
 59a:	00 01                	add    %al,(%ecx)
 59c:	29 57 00             	sub    %edx,0x0(%edi)
 59f:	00 00                	add    %al,(%eax)
 5a1:	02 91 00 00 0d 10    	add    0x100d0000(%ecx),%dl
 5a7:	00 00                	add    %al,(%eax)
 5a9:	00 01                	add    %al,(%ecx)
 5ab:	22 72 8b             	and    -0x75(%edx),%dh
 5ae:	00 00                	add    %al,(%eax)
 5b0:	42                   	inc    %edx
 5b1:	00 00                	add    %al,(%eax)
 5b3:	00 01                	add    %al,(%ecx)
 5b5:	9c                   	pushf  
 5b6:	7c 05                	jl     5bd <PR_BOOTABLE+0x53d>
 5b8:	00 00                	add    %al,(%eax)
 5ba:	11 73 00             	adc    %esi,0x0(%ebx)
 5bd:	01 22                	add    %esp,(%edx)
 5bf:	cf                   	iret   
 5c0:	00 00                	add    %al,(%eax)
 5c2:	00 02                	add    %al,(%edx)
 5c4:	91                   	xchg   %eax,%ecx
 5c5:	00 13                	add    %dl,(%ebx)
 5c7:	9f                   	lahf   
 5c8:	8b 00                	mov    (%eax),%eax
 5ca:	00 7c 05 00          	add    %bh,0x0(%ebp,%eax,1)
 5ce:	00 13                	add    %dl,(%ebx)
 5d0:	ac                   	lods   %ds:(%esi),%al
 5d1:	8b 00                	mov    (%eax),%eax
 5d3:	00 7c 05 00          	add    %bh,0x0(%ebp,%eax,1)
 5d7:	00 00                	add    %al,(%eax)
 5d9:	20 f4                	and    %dh,%ah
 5db:	00 00                	add    %al,(%eax)
 5dd:	00 01                	add    %al,(%ecx)
 5df:	12 57 00             	adc    0x0(%edi),%dl
 5e2:	00 00                	add    %al,(%eax)
 5e4:	41                   	inc    %ecx
 5e5:	8b 00                	mov    (%eax),%eax
 5e7:	00 31                	add    %dh,(%ecx)
 5e9:	00 00                	add    %al,(%eax)
 5eb:	00 01                	add    %al,(%ecx)
 5ed:	9c                   	pushf  
 5ee:	e1 05                	loope  5f5 <PR_BOOTABLE+0x575>
 5f0:	00 00                	add    %al,(%eax)
 5f2:	11 72 00             	adc    %esi,0x0(%edx)
 5f5:	01 12                	add    %edx,(%edx)
 5f7:	57                   	push   %edi
 5f8:	00 00                	add    %al,(%eax)
 5fa:	00 02                	add    %al,(%edx)
 5fc:	91                   	xchg   %eax,%ecx
 5fd:	00 11                	add    %dl,(%ecx)
 5ff:	63 00                	arpl   %ax,(%eax)
 601:	01 12                	add    %edx,(%edx)
 603:	57                   	push   %edi
 604:	00 00                	add    %al,(%eax)
 606:	00 02                	add    %al,(%edx)
 608:	91                   	xchg   %eax,%ecx
 609:	04 0f                	add    $0xf,%al
 60b:	cc                   	int3   
 60c:	00 00                	add    %al,(%eax)
 60e:	00 01                	add    %al,(%ecx)
 610:	12 57 00             	adc    0x0(%edi),%dl
 613:	00 00                	add    %al,(%eax)
 615:	02 91 08 10 30 00    	add    0x301008(%ecx),%dl
 61b:	00 00                	add    %al,(%eax)
 61d:	01 12                	add    %edx,(%edx)
 61f:	c0 04 00 00          	rolb   $0x0,(%eax,%eax,1)
 623:	2f                   	das    
 624:	03 00                	add    (%eax),%eax
 626:	00 1e                	add    %bl,(%esi)
 628:	6c                   	insb   (%dx),%es:(%edi)
 629:	00 01                	add    %al,(%ecx)
 62b:	14 57                	adc    $0x57,%al
 62d:	00 00                	add    %al,(%eax)
 62f:	00 b5 03 00 00 13    	add    %dh,0x13000003(%ebp)
 635:	66 8b 00             	mov    (%eax),%ax
 638:	00 e1                	add    %ah,%cl
 63a:	05 00 00 00 0d       	add    $0xd000000,%eax
 63f:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 640:	00 00                	add    %al,(%eax)
 642:	00 01                	add    %al,(%ecx)
 644:	09 26                	or     %esp,(%esi)
 646:	8b 00                	mov    (%eax),%eax
 648:	00 1b                	add    %bl,(%ebx)
 64a:	00 00                	add    %al,(%eax)
 64c:	00 01                	add    %al,(%ecx)
 64e:	9c                   	pushf  
 64f:	29 06                	sub    %eax,(%esi)
 651:	00 00                	add    %al,(%eax)
 653:	11 6c 00 01          	adc    %ebp,0x1(%eax,%eax,1)
 657:	09 57 00             	or     %edx,0x0(%edi)
 65a:	00 00                	add    %al,(%eax)
 65c:	02 91 00 0f cc 00    	add    0xcc0f00(%ecx),%dl
 662:	00 00                	add    %al,(%eax)
 664:	01 09                	add    %ecx,(%ecx)
 666:	57                   	push   %edi
 667:	00 00                	add    %al,(%eax)
 669:	00 02                	add    %al,(%edx)
 66b:	91                   	xchg   %eax,%ecx
 66c:	04 11                	add    $0x11,%al
 66e:	63 68 00             	arpl   %bp,0x0(%eax)
 671:	01 09                	add    %ecx,(%ecx)
 673:	9c                   	pushf  
 674:	00 00                	add    %al,(%eax)
 676:	00 02                	add    %al,(%edx)
 678:	91                   	xchg   %eax,%ecx
 679:	08 09                	or     %cl,(%ecx)
 67b:	70 00                	jo     67d <PR_BOOTABLE+0x5fd>
 67d:	01 0b                	add    %ecx,(%ebx)
 67f:	96                   	xchg   %eax,%esi
 680:	00 00                	add    %al,(%eax)
 682:	00 01                	add    %al,(%ecx)
 684:	50                   	push   %eax
 685:	00 21                	add    %ah,(%ecx)
 687:	70 00                	jo     689 <PR_BOOTABLE+0x609>
 689:	00 00                	add    %al,(%eax)
 68b:	02 2d 03 57 06 00    	add    0x65703,%ch
 691:	00 22                	add    %ah,(%edx)
 693:	93                   	xchg   %eax,%ebx
 694:	01 00                	add    %eax,(%eax)
 696:	00 02                	add    %al,(%edx)
 698:	2d 57 00 00 00       	sub    $0x57,%eax
 69d:	22 d9                	and    %cl,%bl
 69f:	03 00                	add    (%eax),%eax
 6a1:	00 02                	add    %al,(%edx)
 6a3:	2d 12 03 00 00       	sub    $0x312,%eax
 6a8:	23 63 6e             	and    0x6e(%ebx),%esp
 6ab:	74 00                	je     6ad <PR_BOOTABLE+0x62d>
 6ad:	02 2d 57 00 00 00    	add    0x57,%ch
 6b3:	00 24 69             	add    %ah,(%ecx,%ebp,2)
 6b6:	6e                   	outsb  %ds:(%esi),(%dx)
 6b7:	62 00                	bound  %eax,(%eax)
 6b9:	02 25 2c 00 00 00    	add    0x2c,%ah
 6bf:	03 7e 06             	add    0x6(%esi),%edi
 6c2:	00 00                	add    %al,(%eax)
 6c4:	22 93 01 00 00 02    	and    0x2000001(%ebx),%dl
 6ca:	25 57 00 00 00       	and    $0x57,%eax
 6cf:	25 13 01 00 00       	and    $0x113,%eax
 6d4:	02 27                	add    (%edi),%ah
 6d6:	2c 00                	sub    $0x0,%al
 6d8:	00 00                	add    %al,(%eax)
 6da:	00 26                	add    %ah,(%esi)
 6dc:	6b 00 00             	imul   $0x0,(%eax),%eax
 6df:	00 02                	add    %al,(%edx)
 6e1:	19 03                	sbb    %eax,(%ebx)
 6e3:	22 93 01 00 00 02    	and    0x2000001(%ebx),%dl
 6e9:	19 57 00             	sbb    %edx,0x0(%edi)
 6ec:	00 00                	add    %al,(%eax)
 6ee:	22 13                	and    (%ebx),%dl
 6f0:	01 00                	add    %eax,(%eax)
 6f2:	00 02                	add    %al,(%edx)
 6f4:	19 2c 00             	sbb    %ebp,(%eax,%eax,1)
 6f7:	00 00                	add    %al,(%eax)
 6f9:	00 00                	add    %al,(%eax)
 6fb:	d2 06                	rolb   %cl,(%esi)
 6fd:	00 00                	add    %al,(%eax)
 6ff:	04 00                	add    $0x0,%al
 701:	1c 02                	sbb    $0x2,%al
 703:	00 00                	add    %al,(%eax)
 705:	04 01                	add    $0x1,%al
 707:	1d 01 00 00 0c       	sbb    $0xc000001,%eax
 70c:	5c                   	pop    %esp
 70d:	04 00                	add    $0x0,%al
 70f:	00 d2                	add    %dl,%dl
 711:	00 00                	add    %al,(%eax)
 713:	00 78 8d             	add    %bh,-0x73(%eax)
 716:	00 00                	add    %al,(%eax)
 718:	87 01                	xchg   %eax,(%ecx)
 71a:	00 00                	add    %al,(%eax)
 71c:	ea 01 00 00 02 01 06 	ljmp   $0x601,$0x2000001
 723:	96                   	xchg   %eax,%esi
 724:	00 00                	add    %al,(%eax)
 726:	00 03                	add    %al,(%ebx)
 728:	63 00                	arpl   %ax,(%eax)
 72a:	00 00                	add    %al,(%eax)
 72c:	02 0d 37 00 00 00    	add    0x37,%cl
 732:	02 01                	add    (%ecx),%al
 734:	08 94 00 00 00 02 02 	or     %dl,0x2020000(%eax,%eax,1)
 73b:	05 18 00 00 00       	add    $0x18,%eax
 740:	03 52 03             	add    0x3(%edx),%edx
 743:	00 00                	add    %al,(%eax)
 745:	02 0f                	add    (%edi),%cl
 747:	50                   	push   %eax
 748:	00 00                	add    %al,(%eax)
 74a:	00 02                	add    %al,(%edx)
 74c:	02 07                	add    (%edi),%al
 74e:	f9                   	stc    
 74f:	00 00                	add    %al,(%eax)
 751:	00 04 04             	add    %al,(%esp,%eax,1)
 754:	05 69 6e 74 00       	add    $0x746e69,%eax
 759:	03 c3                	add    %ebx,%eax
 75b:	00 00                	add    %al,(%eax)
 75d:	00 02                	add    %al,(%edx)
 75f:	11 69 00             	adc    %ebp,0x0(%ecx)
 762:	00 00                	add    %al,(%eax)
 764:	02 04 07             	add    (%edi,%eax,1),%al
 767:	b6 00                	mov    $0x0,%dh
 769:	00 00                	add    %al,(%eax)
 76b:	02 08                	add    (%eax),%cl
 76d:	05 75 00 00 00       	add    $0x75,%eax
 772:	03 05 02 00 00 02    	add    0x2000002,%eax
 778:	13 82 00 00 00 02    	adc    0x2000000(%edx),%eax
 77e:	08 07                	or     %al,(%edi)
 780:	ac                   	lods   %ds:(%esi),%al
 781:	00 00                	add    %al,(%eax)
 783:	00 05 10 02 65 d9    	add    %al,0xd9650210
 789:	00 00                	add    %al,(%eax)
 78b:	00 06                	add    %al,(%esi)
 78d:	44                   	inc    %esp
 78e:	03 00                	add    (%eax),%eax
 790:	00 02                	add    %al,(%edx)
 792:	67 2c 00             	addr16 sub $0x0,%al
 795:	00 00                	add    %al,(%eax)
 797:	00 06                	add    %al,(%esi)
 799:	26 03 00             	add    %es:(%eax),%eax
 79c:	00 02                	add    %al,(%edx)
 79e:	6a d9                	push   $0xffffffd9
 7a0:	00 00                	add    %al,(%eax)
 7a2:	00 01                	add    %al,(%ecx)
 7a4:	07                   	pop    %es
 7a5:	69 64 00 02 6b 2c 00 	imul   $0x2c6b,0x2(%eax,%eax,1),%esp
 7ac:	00 
 7ad:	00 04 06             	add    %al,(%esi,%eax,1)
 7b0:	cb                   	lret   
 7b1:	03 00                	add    (%eax),%eax
 7b3:	00 02                	add    %al,(%edx)
 7b5:	6f                   	outsl  %ds:(%esi),(%dx)
 7b6:	d9 00                	flds   (%eax)
 7b8:	00 00                	add    %al,(%eax)
 7ba:	05 06 0f 04 00       	add    $0x40f06,%eax
 7bf:	00 02                	add    %al,(%edx)
 7c1:	70 5e                	jo     821 <PR_BOOTABLE+0x7a1>
 7c3:	00 00                	add    %al,(%eax)
 7c5:	00 08                	add    %cl,(%eax)
 7c7:	06                   	push   %es
 7c8:	cb                   	lret   
 7c9:	04 00                	add    $0x0,%al
 7cb:	00 02                	add    %al,(%edx)
 7cd:	71 5e                	jno    82d <PR_BOOTABLE+0x7ad>
 7cf:	00 00                	add    %al,(%eax)
 7d1:	00 0c 00             	add    %cl,(%eax,%eax,1)
 7d4:	08 2c 00             	or     %ch,(%eax,%eax,1)
 7d7:	00 00                	add    %al,(%eax)
 7d9:	e9 00 00 00 09       	jmp    90007de <_end+0x8ff74b2>
 7de:	e9 00 00 00 02       	jmp    20007e3 <_end+0x1ff74b7>
 7e3:	00 02                	add    %al,(%edx)
 7e5:	04 07                	add    $0x7,%al
 7e7:	22 00                	and    (%eax),%al
 7e9:	00 00                	add    %al,(%eax)
 7eb:	0a 6d 62             	or     0x62(%ebp),%ch
 7ee:	72 00                	jb     7f0 <PR_BOOTABLE+0x770>
 7f0:	00 02                	add    %al,(%edx)
 7f2:	02 61 31             	add    0x31(%ecx),%ah
 7f5:	01 00                	add    %eax,(%eax)
 7f7:	00 06                	add    %al,(%esi)
 7f9:	2b 02                	sub    (%edx),%eax
 7fb:	00 00                	add    %al,(%eax)
 7fd:	02 63 31             	add    0x31(%ebx),%ah
 800:	01 00                	add    %eax,(%eax)
 802:	00 00                	add    %al,(%eax)
 804:	0b bf 01 00 00 02    	or     0x2000001(%edi),%edi
 80a:	64 42                	fs inc %edx
 80c:	01 00                	add    %eax,(%eax)
 80e:	00 b4 01 0b cf 02 00 	add    %dh,0x2cf0b(%ecx,%eax,1)
 815:	00 02                	add    %al,(%edx)
 817:	72 52                	jb     86b <PR_BOOTABLE+0x7eb>
 819:	01 00                	add    %eax,(%eax)
 81b:	00 be 01 0b 38 04    	add    %bh,0x4380b01(%esi)
 821:	00 00                	add    %al,(%eax)
 823:	02 73 62             	add    0x62(%ebx),%dh
 826:	01 00                	add    %eax,(%eax)
 828:	00 fe                	add    %bh,%dh
 82a:	01 00                	add    %eax,(%eax)
 82c:	08 2c 00             	or     %ch,(%eax,%eax,1)
 82f:	00 00                	add    %al,(%eax)
 831:	42                   	inc    %edx
 832:	01 00                	add    %eax,(%eax)
 834:	00 0c e9             	add    %cl,(%ecx,%ebp,8)
 837:	00 00                	add    %al,(%eax)
 839:	00 b3 01 00 08 2c    	add    %dh,0x2c080001(%ebx)
 83f:	00 00                	add    %al,(%eax)
 841:	00 52 01             	add    %dl,0x1(%edx)
 844:	00 00                	add    %al,(%eax)
 846:	09 e9                	or     %ebp,%ecx
 848:	00 00                	add    %al,(%eax)
 84a:	00 09                	add    %cl,(%ecx)
 84c:	00 08                	add    %cl,(%eax)
 84e:	89 00                	mov    %eax,(%eax)
 850:	00 00                	add    %al,(%eax)
 852:	62 01                	bound  %eax,(%ecx)
 854:	00 00                	add    %al,(%eax)
 856:	09 e9                	or     %ebp,%ecx
 858:	00 00                	add    %al,(%eax)
 85a:	00 03                	add    %al,(%ebx)
 85c:	00 08                	add    %cl,(%eax)
 85e:	2c 00                	sub    $0x0,%al
 860:	00 00                	add    %al,(%eax)
 862:	72 01                	jb     865 <PR_BOOTABLE+0x7e5>
 864:	00 00                	add    %al,(%eax)
 866:	09 e9                	or     %ebp,%ecx
 868:	00 00                	add    %al,(%eax)
 86a:	00 01                	add    %al,(%ecx)
 86c:	00 03                	add    %al,(%ebx)
 86e:	ad                   	lods   %ds:(%esi),%eax
 86f:	02 00                	add    (%eax),%al
 871:	00 02                	add    %al,(%edx)
 873:	74 f0                	je     865 <PR_BOOTABLE+0x7e5>
 875:	00 00                	add    %al,(%eax)
 877:	00 0d 30 03 00 00    	add    %cl,0x330
 87d:	18 02                	sbb    %al,(%edx)
 87f:	7e ba                	jle    83b <PR_BOOTABLE+0x7bb>
 881:	01 00                	add    %eax,(%eax)
 883:	00 06                	add    %al,(%esi)
 885:	0a 04 00             	or     (%eax,%eax,1),%al
 888:	00 02                	add    %al,(%edx)
 88a:	7f 5e                	jg     8ea <PR_BOOTABLE+0x86a>
 88c:	00 00                	add    %al,(%eax)
 88e:	00 00                	add    %al,(%eax)
 890:	06                   	push   %es
 891:	d4 03                	aam    $0x3
 893:	00 00                	add    %al,(%eax)
 895:	02 80 77 00 00 00    	add    0x77(%eax),%al
 89b:	04 06                	add    $0x6,%al
 89d:	77 02                	ja     8a1 <PR_BOOTABLE+0x821>
 89f:	00 00                	add    %al,(%eax)
 8a1:	02 81 77 00 00 00    	add    0x77(%ecx),%al
 8a7:	0c 06                	or     $0x6,%al
 8a9:	b5 02                	mov    $0x2,%ch
 8ab:	00 00                	add    %al,(%eax)
 8ad:	02 82 5e 00 00 00    	add    0x5e(%edx),%al
 8b3:	14 00                	adc    $0x0,%al
 8b5:	03 d9                	add    %ecx,%ebx
 8b7:	02 00                	add    (%eax),%al
 8b9:	00 02                	add    %al,(%edx)
 8bb:	83 7d 01 00          	cmpl   $0x0,0x1(%ebp)
 8bf:	00 0d c8 01 00 00    	add    %cl,0x1c8
 8c5:	34 02                	xor    $0x2,%al
 8c7:	8b 86 02 00 00 06    	mov    0x6000002(%esi),%eax
 8cd:	c3                   	ret    
 8ce:	03 00                	add    (%eax),%eax
 8d0:	00 02                	add    %al,(%edx)
 8d2:	8c 5e 00             	mov    %ds,0x0(%esi)
 8d5:	00 00                	add    %al,(%eax)
 8d7:	00 06                	add    %al,(%esi)
 8d9:	8f 03                	popl   (%ebx)
 8db:	00 00                	add    %al,(%eax)
 8dd:	02 8d 86 02 00 00    	add    0x286(%ebp),%cl
 8e3:	04 06                	add    $0x6,%al
 8e5:	b3 02                	mov    $0x2,%bl
 8e7:	00 00                	add    %al,(%eax)
 8e9:	02 8e 45 00 00 00    	add    0x45(%esi),%cl
 8ef:	10 06                	adc    %al,(%esi)
 8f1:	46                   	inc    %esi
 8f2:	02 00                	add    (%eax),%al
 8f4:	00 02                	add    %al,(%edx)
 8f6:	8f 45 00             	popl   0x0(%ebp)
 8f9:	00 00                	add    %al,(%eax)
 8fb:	12 06                	adc    (%esi),%al
 8fd:	09 03                	or     %eax,(%ebx)
 8ff:	00 00                	add    %al,(%eax)
 901:	02 90 5e 00 00 00    	add    0x5e(%eax),%dl
 907:	14 06                	adc    $0x6,%al
 909:	fd                   	std    
 90a:	01 00                	add    %eax,(%eax)
 90c:	00 02                	add    %al,(%edx)
 90e:	91                   	xchg   %eax,%ecx
 90f:	5e                   	pop    %esi
 910:	00 00                	add    %al,(%eax)
 912:	00 18                	add    %bl,(%eax)
 914:	06                   	push   %es
 915:	ae                   	scas   %es:(%edi),%al
 916:	03 00                	add    (%eax),%eax
 918:	00 02                	add    %al,(%edx)
 91a:	92                   	xchg   %eax,%edx
 91b:	5e                   	pop    %esi
 91c:	00 00                	add    %al,(%eax)
 91e:	00 1c 06             	add    %bl,(%esi,%eax,1)
 921:	e7 03                	out    %eax,$0x3
 923:	00 00                	add    %al,(%eax)
 925:	02 93 5e 00 00 00    	add    0x5e(%ebx),%dl
 92b:	20 06                	and    %al,(%esi)
 92d:	36 02 00             	add    %ss:(%eax),%al
 930:	00 02                	add    %al,(%edx)
 932:	94                   	xchg   %eax,%esp
 933:	5e                   	pop    %esi
 934:	00 00                	add    %al,(%eax)
 936:	00 24 06             	add    %ah,(%esi,%eax,1)
 939:	c6 02 00             	movb   $0x0,(%edx)
 93c:	00 02                	add    %al,(%edx)
 93e:	95                   	xchg   %eax,%ebp
 93f:	45                   	inc    %ebp
 940:	00 00                	add    %al,(%eax)
 942:	00 28                	add    %ch,(%eax)
 944:	06                   	push   %es
 945:	50                   	push   %eax
 946:	02 00                	add    (%eax),%al
 948:	00 02                	add    %al,(%edx)
 94a:	96                   	xchg   %eax,%esi
 94b:	45                   	inc    %ebp
 94c:	00 00                	add    %al,(%eax)
 94e:	00 2a                	add    %ch,(%edx)
 950:	06                   	push   %es
 951:	30 04 00             	xor    %al,(%eax,%eax,1)
 954:	00 02                	add    %al,(%edx)
 956:	97                   	xchg   %eax,%edi
 957:	45                   	inc    %ebp
 958:	00 00                	add    %al,(%eax)
 95a:	00 2c 06             	add    %ch,(%esi,%eax,1)
 95d:	9b                   	fwait
 95e:	02 00                	add    (%eax),%al
 960:	00 02                	add    %al,(%edx)
 962:	98                   	cwtl   
 963:	45                   	inc    %ebp
 964:	00 00                	add    %al,(%eax)
 966:	00 2e                	add    %ch,(%esi)
 968:	06                   	push   %es
 969:	42                   	inc    %edx
 96a:	04 00                	add    $0x0,%al
 96c:	00 02                	add    %al,(%edx)
 96e:	99                   	cltd   
 96f:	45                   	inc    %ebp
 970:	00 00                	add    %al,(%eax)
 972:	00 30                	add    %dh,(%eax)
 974:	06                   	push   %es
 975:	cf                   	iret   
 976:	01 00                	add    %eax,(%eax)
 978:	00 02                	add    %al,(%edx)
 97a:	9a 45 00 00 00 32 00 	lcall  $0x32,$0x45
 981:	08 2c 00             	or     %ch,(%eax,%eax,1)
 984:	00 00                	add    %al,(%eax)
 986:	96                   	xchg   %eax,%esi
 987:	02 00                	add    (%eax),%al
 989:	00 09                	add    %cl,(%ecx)
 98b:	e9 00 00 00 0b       	jmp    b000990 <_end+0xaff7664>
 990:	00 03                	add    %al,(%ebx)
 992:	e4 01                	in     $0x1,%al
 994:	00 00                	add    %al,(%eax)
 996:	02 9b c5 01 00 00    	add    0x1c5(%ebx),%bl
 99c:	0d 93 02 00 00       	or     $0x293,%eax
 9a1:	20 02                	and    %al,(%edx)
 9a3:	9e                   	sahf   
 9a4:	0e                   	push   %cs
 9a5:	03 00                	add    (%eax),%eax
 9a7:	00 06                	add    %al,(%esi)
 9a9:	8c 02                	mov    %es,(%edx)
 9ab:	00 00                	add    %al,(%eax)
 9ad:	02 9f 5e 00 00 00    	add    0x5e(%edi),%bl
 9b3:	00 06                	add    %al,(%esi)
 9b5:	22 02                	and    (%edx),%al
 9b7:	00 00                	add    %al,(%eax)
 9b9:	02 a0 5e 00 00 00    	add    0x5e(%eax),%ah
 9bf:	04 06                	add    $0x6,%al
 9c1:	66 03 00             	add    (%eax),%ax
 9c4:	00 02                	add    %al,(%edx)
 9c6:	a1 5e 00 00 00       	mov    0x5e,%eax
 9cb:	08 06                	or     %al,(%esi)
 9cd:	c6 04 00 00          	movb   $0x0,(%eax,%eax,1)
 9d1:	02 a2 5e 00 00 00    	add    0x5e(%edx),%ah
 9d7:	0c 06                	or     $0x6,%al
 9d9:	27                   	daa    
 9da:	04 00                	add    $0x0,%al
 9dc:	00 02                	add    %al,(%edx)
 9de:	a3 5e 00 00 00       	mov    %eax,0x5e
 9e3:	10 06                	adc    %al,(%esi)
 9e5:	1a 02                	sbb    (%edx),%al
 9e7:	00 00                	add    %al,(%eax)
 9e9:	02 a4 5e 00 00 00 14 	add    0x14000000(%esi,%ebx,2),%ah
 9f0:	06                   	push   %es
 9f1:	7c 03                	jl     9f6 <PR_BOOTABLE+0x976>
 9f3:	00 00                	add    %al,(%eax)
 9f5:	02 a5 5e 00 00 00    	add    0x5e(%ebp),%ah
 9fb:	18 06                	sbb    %al,(%esi)
 9fd:	b4 04                	mov    $0x4,%ah
 9ff:	00 00                	add    %al,(%eax)
 a01:	02 a6 5e 00 00 00    	add    0x5e(%esi),%ah
 a07:	1c 00                	sbb    $0x0,%al
 a09:	03 93 02 00 00 02    	add    0x2000002(%ebx),%edx
 a0f:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 a10:	a1 02 00 00 05       	mov    0x5000002,%eax
 a15:	04 02                	add    $0x2,%al
 a17:	b6 52                	mov    $0x52,%dh
 a19:	03 00                	add    (%eax),%eax
 a1b:	00 06                	add    %al,(%esi)
 a1d:	1f                   	pop    %ds
 a1e:	03 00                	add    (%eax),%eax
 a20:	00 02                	add    %al,(%edx)
 a22:	b7 2c                	mov    $0x2c,%bh
 a24:	00 00                	add    %al,(%eax)
 a26:	00 00                	add    %al,(%eax)
 a28:	06                   	push   %es
 a29:	13 03                	adc    (%ebx),%eax
 a2b:	00 00                	add    %al,(%eax)
 a2d:	02 b8 2c 00 00 00    	add    0x2c(%eax),%bh
 a33:	01 06                	add    %eax,(%esi)
 a35:	19 03                	sbb    %eax,(%ebx)
 a37:	00 00                	add    %al,(%eax)
 a39:	02 b9 2c 00 00 00    	add    0x2c(%ecx),%bh
 a3f:	02 06                	add    (%esi),%al
 a41:	86 02                	xchg   %al,(%edx)
 a43:	00 00                	add    %al,(%eax)
 a45:	02 ba 2c 00 00 00    	add    0x2c(%edx),%bh
 a4b:	03 00                	add    (%eax),%eax
 a4d:	05 10 02 c7 8b       	add    $0x8bc70210,%eax
 a52:	03 00                	add    (%eax),%eax
 a54:	00 06                	add    %al,(%esi)
 a56:	07                   	pop    %es
 a57:	04 00                	add    $0x0,%al
 a59:	00 02                	add    %al,(%edx)
 a5b:	c8 5e 00 00          	enter  $0x5e,$0x0
 a5f:	00 00                	add    %al,(%eax)
 a61:	06                   	push   %es
 a62:	7e 02                	jle    a66 <PR_BOOTABLE+0x9e6>
 a64:	00 00                	add    %al,(%eax)
 a66:	02 c9                	add    %cl,%cl
 a68:	5e                   	pop    %esi
 a69:	00 00                	add    %al,(%eax)
 a6b:	00 04 06             	add    %al,(%esi,%eax,1)
 a6e:	d9 03                	flds   (%ebx)
 a70:	00 00                	add    %al,(%eax)
 a72:	02 ca                	add    %dl,%cl
 a74:	5e                   	pop    %esi
 a75:	00 00                	add    %al,(%eax)
 a77:	00 08                	add    %cl,(%eax)
 a79:	06                   	push   %es
 a7a:	7e 04                	jle    a80 <PR_BOOTABLE+0xa00>
 a7c:	00 00                	add    %al,(%eax)
 a7e:	02 cb                	add    %bl,%cl
 a80:	5e                   	pop    %esi
 a81:	00 00                	add    %al,(%eax)
 a83:	00 0c 00             	add    %cl,(%eax,%eax,1)
 a86:	05 10 02 cd c4       	add    $0xc4cd0210,%eax
 a8b:	03 00                	add    (%eax),%eax
 a8d:	00 07                	add    %al,(%edi)
 a8f:	6e                   	outsb  %ds:(%esi),(%dx)
 a90:	75 6d                	jne    aff <PR_BOOTABLE+0xa7f>
 a92:	00 02                	add    %al,(%edx)
 a94:	ce                   	into   
 a95:	5e                   	pop    %esi
 a96:	00 00                	add    %al,(%eax)
 a98:	00 00                	add    %al,(%eax)
 a9a:	06                   	push   %es
 a9b:	0a 04 00             	or     (%eax,%eax,1),%al
 a9e:	00 02                	add    %al,(%edx)
 aa0:	cf                   	iret   
 aa1:	5e                   	pop    %esi
 aa2:	00 00                	add    %al,(%eax)
 aa4:	00 04 06             	add    %al,(%esi,%eax,1)
 aa7:	d9 03                	flds   (%ebx)
 aa9:	00 00                	add    %al,(%eax)
 aab:	02 d0                	add    %al,%dl
 aad:	5e                   	pop    %esi
 aae:	00 00                	add    %al,(%eax)
 ab0:	00 08                	add    %cl,(%eax)
 ab2:	06                   	push   %es
 ab3:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 ab4:	02 00                	add    (%eax),%al
 ab6:	00 02                	add    %al,(%edx)
 ab8:	d1 5e 00             	rcrl   0x0(%esi)
 abb:	00 00                	add    %al,(%eax)
 abd:	0c 00                	or     $0x0,%al
 abf:	0e                   	push   %cs
 ac0:	10 02                	adc    %al,(%edx)
 ac2:	c6                   	(bad)  
 ac3:	e3 03                	jecxz  ac8 <PR_BOOTABLE+0xa48>
 ac5:	00 00                	add    %al,(%eax)
 ac7:	0f a1                	pop    %fs
 ac9:	03 00                	add    (%eax),%eax
 acb:	00 02                	add    %al,(%edx)
 acd:	cc                   	int3   
 ace:	52                   	push   %edx
 acf:	03 00                	add    (%eax),%eax
 ad1:	00 10                	add    %dl,(%eax)
 ad3:	65 6c                	gs insb (%dx),%es:(%edi)
 ad5:	66 00 02             	data16 add %al,(%edx)
 ad8:	d2 8b 03 00 00 00    	rorb   %cl,0x3(%ebx)
 ade:	0d 5b 03 00 00       	or     $0x35b,%eax
 ae3:	60                   	pusha  
 ae4:	02 ae ec 04 00 00    	add    0x4ec(%esi),%ch
 aea:	06                   	push   %es
 aeb:	38 02                	cmp    %al,(%edx)
 aed:	00 00                	add    %al,(%eax)
 aef:	02 af 5e 00 00 00    	add    0x5e(%edi),%ch
 af5:	00 06                	add    %al,(%esi)
 af7:	3a 03                	cmp    (%ebx),%al
 af9:	00 00                	add    %al,(%eax)
 afb:	02 b2 5e 00 00 00    	add    0x5e(%edx),%dh
 b01:	04 06                	add    $0x6,%al
 b03:	ef                   	out    %eax,(%dx)
 b04:	03 00                	add    (%eax),%eax
 b06:	00 02                	add    %al,(%edx)
 b08:	b3 5e                	mov    $0x5e,%bl
 b0a:	00 00                	add    %al,(%eax)
 b0c:	00 08                	add    %cl,(%eax)
 b0e:	06                   	push   %es
 b0f:	95                   	xchg   %eax,%ebp
 b10:	03 00                	add    (%eax),%eax
 b12:	00 02                	add    %al,(%edx)
 b14:	bb 19 03 00 00       	mov    $0x319,%ebx
 b19:	0c 06                	or     $0x6,%al
 b1b:	3e 02 00             	add    %ds:(%eax),%al
 b1e:	00 02                	add    %al,(%edx)
 b20:	be 5e 00 00 00       	mov    $0x5e,%esi
 b25:	10 06                	adc    %al,(%esi)
 b27:	73 04                	jae    b2d <PR_BOOTABLE+0xaad>
 b29:	00 00                	add    %al,(%eax)
 b2b:	02 c2                	add    %dl,%al
 b2d:	5e                   	pop    %esi
 b2e:	00 00                	add    %al,(%eax)
 b30:	00 14 06             	add    %dl,(%esi,%eax,1)
 b33:	68 02 00 00 02       	push   $0x2000002
 b38:	c3                   	ret    
 b39:	5e                   	pop    %esi
 b3a:	00 00                	add    %al,(%eax)
 b3c:	00 18                	add    %bl,(%eax)
 b3e:	06                   	push   %es
 b3f:	4d                   	dec    %ebp
 b40:	03 00                	add    (%eax),%eax
 b42:	00 02                	add    %al,(%edx)
 b44:	d3 c4                	rol    %cl,%esp
 b46:	03 00                	add    (%eax),%eax
 b48:	00 1c 06             	add    %bl,(%esi,%eax,1)
 b4b:	72 02                	jb     b4f <PR_BOOTABLE+0xacf>
 b4d:	00 00                	add    %al,(%eax)
 b4f:	02 d6                	add    %dh,%dl
 b51:	5e                   	pop    %esi
 b52:	00 00                	add    %al,(%eax)
 b54:	00 2c 06             	add    %ch,(%esi,%eax,1)
 b57:	da 01                	fiaddl (%ecx)
 b59:	00 00                	add    %al,(%eax)
 b5b:	02 d8                	add    %al,%bl
 b5d:	5e                   	pop    %esi
 b5e:	00 00                	add    %al,(%eax)
 b60:	00 30                	add    %dh,(%eax)
 b62:	06                   	push   %es
 b63:	19 04 00             	sbb    %eax,(%eax,%eax,1)
 b66:	00 02                	add    %al,(%edx)
 b68:	dc 5e 00             	fcompl 0x0(%esi)
 b6b:	00 00                	add    %al,(%eax)
 b6d:	34 06                	xor    $0x6,%al
 b6f:	ba 02 00 00 02       	mov    $0x2000002,%edx
 b74:	dd 5e 00             	fstpl  0x0(%esi)
 b77:	00 00                	add    %al,(%eax)
 b79:	38 06                	cmp    %al,(%esi)
 b7b:	b6 03                	mov    $0x3,%dh
 b7d:	00 00                	add    %al,(%eax)
 b7f:	02 e0                	add    %al,%ah
 b81:	5e                   	pop    %esi
 b82:	00 00                	add    %al,(%eax)
 b84:	00 3c 06             	add    %bh,(%esi,%eax,1)
 b87:	88 04 00             	mov    %al,(%eax,%eax,1)
 b8a:	00 02                	add    %al,(%edx)
 b8c:	e3 5e                	jecxz  bec <PR_BOOTABLE+0xb6c>
 b8e:	00 00                	add    %al,(%eax)
 b90:	00 40 06             	add    %al,0x6(%eax)
 b93:	bc 04 00 00 02       	mov    $0x2000004,%esp
 b98:	e6 5e                	out    %al,$0x5e
 b9a:	00 00                	add    %al,(%eax)
 b9c:	00 44 06 6b          	add    %al,0x6b(%esi,%eax,1)
 ba0:	03 00                	add    (%eax),%eax
 ba2:	00 02                	add    %al,(%edx)
 ba4:	e9 5e 00 00 00       	jmp    c07 <PR_BOOTABLE+0xb87>
 ba9:	48                   	dec    %eax
 baa:	06                   	push   %es
 bab:	f9                   	stc    
 bac:	03 00                	add    (%eax),%eax
 bae:	00 02                	add    %al,(%edx)
 bb0:	ea 5e 00 00 00 4c 06 	ljmp   $0x64c,$0x5e
 bb7:	de 03                	fiadd  (%ebx)
 bb9:	00 00                	add    %al,(%eax)
 bbb:	02 eb                	add    %bl,%ch
 bbd:	5e                   	pop    %esi
 bbe:	00 00                	add    %al,(%eax)
 bc0:	00 50 06             	add    %dl,0x6(%eax)
 bc3:	99                   	cltd   
 bc4:	04 00                	add    $0x0,%al
 bc6:	00 02                	add    %al,(%edx)
 bc8:	ec                   	in     (%dx),%al
 bc9:	5e                   	pop    %esi
 bca:	00 00                	add    %al,(%eax)
 bcc:	00 54 06 eb          	add    %dl,-0x15(%esi,%eax,1)
 bd0:	01 00                	add    %eax,(%eax)
 bd2:	00 02                	add    %al,(%edx)
 bd4:	ed                   	in     (%dx),%eax
 bd5:	5e                   	pop    %esi
 bd6:	00 00                	add    %al,(%eax)
 bd8:	00 58 06             	add    %bl,0x6(%eax)
 bdb:	4a                   	dec    %edx
 bdc:	04 00                	add    $0x0,%al
 bde:	00 02                	add    %al,(%edx)
 be0:	ee                   	out    %al,(%dx)
 be1:	5e                   	pop    %esi
 be2:	00 00                	add    %al,(%eax)
 be4:	00 5c 00 03          	add    %bl,0x3(%eax,%eax,1)
 be8:	e5 02                	in     $0x2,%eax
 bea:	00 00                	add    %al,(%eax)
 bec:	02 ef                	add    %bh,%ch
 bee:	e3 03                	jecxz  bf3 <PR_BOOTABLE+0xb73>
 bf0:	00 00                	add    %al,(%eax)
 bf2:	11 5b 03             	adc    %ebx,0x3(%ebx)
 bf5:	00 00                	add    %al,(%eax)
 bf7:	01 08                	add    %ecx,(%eax)
 bf9:	ec                   	in     (%dx),%al
 bfa:	04 00                	add    $0x0,%al
 bfc:	00 05 03 a0 92 00    	add    %al,0x92a003
 c02:	00 12                	add    %dl,(%edx)
 c04:	84 03                	test   %al,(%ebx)
 c06:	00 00                	add    %al,(%eax)
 c08:	01 47 5e             	add    %eax,0x5e(%edi)
 c0b:	05 00 00 f9 8d       	add    $0x8df90000,%eax
 c10:	00 00                	add    %al,(%eax)
 c12:	60                   	pusha  
 c13:	00 00                	add    %al,(%eax)
 c15:	00 01                	add    %al,(%ecx)
 c17:	9c                   	pushf  
 c18:	5e                   	pop    %esi
 c19:	05 00 00 13 35       	add    $0x35130000,%eax
 c1e:	03 00                	add    (%eax),%eax
 c20:	00 01                	add    %al,(%ecx)
 c22:	47                   	inc    %edi
 c23:	64 05 00 00 02 91    	fs add $0x91020000,%eax
 c29:	00 14 70             	add    %dl,(%eax,%esi,2)
 c2c:	00 01                	add    %al,(%ecx)
 c2e:	49                   	dec    %ecx
 c2f:	64 05 00 00 ef 03    	fs add $0x3ef0000,%eax
 c35:	00 00                	add    %al,(%eax)
 c37:	15 ab 04 00 00       	adc    $0x4ab,%eax
 c3c:	01 4a 5e             	add    %ecx,0x5e(%edx)
 c3f:	00 00                	add    %al,(%eax)
 c41:	00 4d 04             	add    %cl,0x4(%ebp)
 c44:	00 00                	add    %al,(%eax)
 c46:	16                   	push   %ss
 c47:	10 8e 00 00 93 06    	adc    %cl,0x6930000(%esi)
 c4d:	00 00                	add    %al,(%eax)
 c4f:	16                   	push   %ss
 c50:	2b 8e 00 00 9e 06    	sub    0x69e0000(%esi),%ecx
 c56:	00 00                	add    %al,(%eax)
 c58:	00 17                	add    %dl,(%edi)
 c5a:	04 ec                	add    $0xec,%al
 c5c:	04 00                	add    $0x0,%al
 c5e:	00 17                	add    %dl,(%edi)
 c60:	04 ba                	add    $0xba,%al
 c62:	01 00                	add    %eax,(%eax)
 c64:	00 12                	add    %dl,(%edx)
 c66:	0e                   	push   %cs
 c67:	02 00                	add    (%eax),%al
 c69:	00 01                	add    %al,(%ecx)
 c6b:	2f                   	das    
 c6c:	5e                   	pop    %esi
 c6d:	00 00                	add    %al,(%eax)
 c6f:	00 78 8d             	add    %bh,-0x73(%eax)
 c72:	00 00                	add    %al,(%eax)
 c74:	81 00 00 00 01 9c    	addl   $0x9c010000,(%eax)
 c7a:	ca 05 00             	lret   $0x5
 c7d:	00 13                	add    %dl,(%ebx)
 c7f:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 c80:	03 00                	add    (%eax),%eax
 c82:	00 01                	add    %al,(%ecx)
 c84:	2f                   	das    
 c85:	5e                   	pop    %esi
 c86:	00 00                	add    %al,(%eax)
 c88:	00 02                	add    %al,(%edx)
 c8a:	91                   	xchg   %eax,%ecx
 c8b:	00 14 70             	add    %dl,(%eax,%esi,2)
 c8e:	68 00 01 32 ca       	push   $0xca320100
 c93:	05 00 00 93 04       	add    $0x4930000,%eax
 c98:	00 00                	add    %al,(%eax)
 c9a:	14 65                	adc    $0x65,%al
 c9c:	70 68                	jo     d06 <PR_BOOTABLE+0xc86>
 c9e:	00 01                	add    %al,(%ecx)
 ca0:	32 ca                	xor    %dl,%cl
 ca2:	05 00 00 be 04       	add    $0x4be0000,%eax
 ca7:	00 00                	add    %al,(%eax)
 ca9:	16                   	push   %ss
 caa:	96                   	xchg   %eax,%esi
 cab:	8d 00                	lea    (%eax),%eax
 cad:	00 a9 06 00 00 16    	add    %ch,0x16000006(%ecx)
 cb3:	b2 8d                	mov    $0x8d,%dl
 cb5:	00 00                	add    %al,(%eax)
 cb7:	b4 06                	mov    $0x6,%ah
 cb9:	00 00                	add    %al,(%eax)
 cbb:	16                   	push   %ss
 cbc:	e2 8d                	loop   c4b <PR_BOOTABLE+0xbcb>
 cbe:	00 00                	add    %al,(%eax)
 cc0:	a9 06 00 00 00       	test   $0x6,%eax
 cc5:	17                   	pop    %ss
 cc6:	04 0e                	add    $0xe,%al
 cc8:	03 00                	add    (%eax),%eax
 cca:	00 18                	add    %bl,(%eax)
 ccc:	ff 02                	incl   (%edx)
 cce:	00 00                	add    %al,(%eax)
 cd0:	01 0c 59             	add    %ecx,(%ecx,%ebx,2)
 cd3:	8e 00                	mov    (%eax),%es
 cd5:	00 a6 00 00 00 01    	add    %ah,0x1000000(%esi)
 cdb:	9c                   	pushf  
 cdc:	8d 06                	lea    (%esi),%eax
 cde:	00 00                	add    %al,(%eax)
 ce0:	19 64 65 76          	sbb    %esp,0x76(%ebp,%eiz,2)
 ce4:	00 01                	add    %al,(%ecx)
 ce6:	0c 5e                	or     $0x5e,%al
 ce8:	00 00                	add    %al,(%eax)
 cea:	00 d1                	add    %dl,%cl
 cec:	04 00                	add    $0x0,%al
 cee:	00 1a                	add    %bl,(%edx)
 cf0:	6d                   	insl   (%dx),%es:(%edi)
 cf1:	62 72 00             	bound  %esi,0x0(%edx)
 cf4:	01 0c 8d 06 00 00 02 	add    %ecx,0x2000006(,%ecx,4)
 cfb:	91                   	xchg   %eax,%ecx
 cfc:	04 13                	add    $0x13,%al
 cfe:	35 03 00 00 01       	xor    $0x1000003,%eax
 d03:	0c 64                	or     $0x64,%al
 d05:	05 00 00 02 91       	add    $0x91020000,%eax
 d0a:	08 14 69             	or     %dl,(%ecx,%ebp,2)
 d0d:	00 01                	add    %al,(%ecx)
 d0f:	11 57 00             	adc    %edx,0x0(%edi)
 d12:	00 00                	add    %al,(%eax)
 d14:	e5 04                	in     $0x4,%eax
 d16:	00 00                	add    %al,(%eax)
 d18:	15 f2 02 00 00       	adc    $0x2f2,%eax
 d1d:	01 12                	add    %edx,(%edx)
 d1f:	5e                   	pop    %esi
 d20:	00 00                	add    %al,(%eax)
 d22:	00 1c 05 00 00 15 ff 	add    %bl,-0xeb0000(,%eax,1)
 d29:	01 00                	add    %eax,(%eax)
 d2b:	00 01                	add    %al,(%ecx)
 d2d:	22 5e 00             	and    0x0(%esi),%bl
 d30:	00 00                	add    %al,(%eax)
 d32:	47                   	inc    %edi
 d33:	05 00 00 16 6e       	add    $0x6e160000,%eax
 d38:	8e 00                	mov    (%eax),%es
 d3a:	00 bf 06 00 00 16    	add    %bh,0x16000006(%edi)
 d40:	7a 8e                	jp     cd0 <PR_BOOTABLE+0xc50>
 d42:	00 00                	add    %al,(%eax)
 d44:	93                   	xchg   %eax,%ebx
 d45:	06                   	push   %es
 d46:	00 00                	add    %al,(%eax)
 d48:	16                   	push   %ss
 d49:	af                   	scas   %es:(%edi),%eax
 d4a:	8e 00                	mov    (%eax),%es
 d4c:	00 b4 06 00 00 16 bb 	add    %dh,-0x44ea0000(%esi,%eax,1)
 d53:	8e 00                	mov    (%eax),%es
 d55:	00 08                	add    %cl,(%eax)
 d57:	05 00 00 16 c7       	add    $0xc7160000,%eax
 d5c:	8e 00                	mov    (%eax),%es
 d5e:	00 93 06 00 00 16    	add    %dl,0x16000006(%ebx)
 d64:	cf                   	iret   
 d65:	8e 00                	mov    (%eax),%es
 d67:	00 6a 05             	add    %ch,0x5(%edx)
 d6a:	00 00                	add    %al,(%eax)
 d6c:	16                   	push   %ss
 d6d:	dd 8e 00 00 93 06    	fisttpll 0x6930000(%esi)
 d73:	00 00                	add    %al,(%eax)
 d75:	16                   	push   %ss
 d76:	ea 8e 00 00 ca 06 00 	ljmp   $0x6,$0xca00008e
 d7d:	00 1b                	add    %bl,(%ebx)
 d7f:	ff 8e 00 00 b4 06    	decl   0x6b40000(%esi)
 d85:	00 00                	add    %al,(%eax)
 d87:	00 17                	add    %dl,(%edi)
 d89:	04 72                	add    $0x72,%al
 d8b:	01 00                	add    %eax,(%eax)
 d8d:	00 1c 10             	add    %bl,(%eax,%edx,1)
 d90:	00 00                	add    %al,(%eax)
 d92:	00 10                	add    %dl,(%eax)
 d94:	00 00                	add    %al,(%eax)
 d96:	00 02                	add    %al,(%edx)
 d98:	4f                   	dec    %edi
 d99:	1c 3d                	sbb    $0x3d,%al
 d9b:	00 00                	add    %al,(%eax)
 d9d:	00 3d 00 00 00 02    	add    %bh,0x2000000
 da3:	50                   	push   %eax
 da4:	1c 83                	sbb    $0x83,%al
 da6:	00 00                	add    %al,(%eax)
 da8:	00 83 00 00 00 02    	add    %al,0x2000000(%ebx)
 dae:	78 1c                	js     dcc <PR_BOOTABLE+0xd4c>
 db0:	37                   	aaa    
 db1:	00 00                	add    %al,(%eax)
 db3:	00 37                	add    %dh,(%edi)
 db5:	00 00                	add    %al,(%eax)
 db7:	00 02                	add    %al,(%edx)
 db9:	52                   	push   %edx
 dba:	1c 2b                	sbb    $0x2b,%al
 dbc:	00 00                	add    %al,(%eax)
 dbe:	00 2b                	add    %ch,(%ebx)
 dc0:	00 00                	add    %al,(%eax)
 dc2:	00 02                	add    %al,(%edx)
 dc4:	51                   	push   %ecx
 dc5:	1c 5c                	sbb    $0x5c,%al
 dc7:	02 00                	add    (%eax),%al
 dc9:	00 5c 02 00          	add    %bl,0x0(%edx,%eax,1)
 dcd:	00 01                	add    %al,(%ecx)
 dcf:	06                   	push   %es
 dd0:	00 5f 00             	add    %bl,0x0(%edi)
 dd3:	00 00                	add    %al,(%eax)
 dd5:	02 00                	add    (%eax),%al
 dd7:	b2 03                	mov    $0x3,%dl
 dd9:	00 00                	add    %al,(%eax)
 ddb:	04 01                	add    $0x1,%al
 ddd:	9e                   	sahf   
 dde:	02 00                	add    (%eax),%al
 de0:	00 ff                	add    %bh,%bh
 de2:	8e 00                	mov    (%eax),%es
 de4:	00 0f                	add    %cl,(%edi)
 de6:	8f 00                	popl   (%eax)
 de8:	00 62 6f             	add    %ah,0x6f(%edx)
 deb:	6f                   	outsl  %ds:(%esi),(%dx)
 dec:	74 2f                	je     e1d <PR_BOOTABLE+0xd9d>
 dee:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 df1:	74 31                	je     e24 <PR_BOOTABLE+0xda4>
 df3:	2f                   	das    
 df4:	65 78 65             	gs js  e5c <PR_BOOTABLE+0xddc>
 df7:	63 5f 6b             	arpl   %bx,0x6b(%edi)
 dfa:	65 72 6e             	gs jb  e6b <PR_BOOTABLE+0xdeb>
 dfd:	65 6c                	gs insb (%dx),%es:(%edi)
 dff:	2e 53                	cs push %ebx
 e01:	00 2f                	add    %ch,(%edi)
 e03:	68 6f 6d 65 2f       	push   $0x2f656d6f
 e08:	61                   	popa   
 e09:	63 63 74             	arpl   %sp,0x74(%ebx)
 e0c:	73 2f                	jae    e3d <PR_BOOTABLE+0xdbd>
 e0e:	6a 61                	push   $0x61
 e10:	38 36                	cmp    %dh,(%esi)
 e12:	32 2f                	xor    (%edi),%ch
 e14:	63 73 34             	arpl   %si,0x34(%ebx)
 e17:	32 32                	xor    (%edx),%dh
 e19:	2f                   	das    
 e1a:	6d                   	insl   (%dx),%es:(%edi)
 e1b:	63 65 72             	arpl   %sp,0x72(%ebp)
 e1e:	74 69                	je     e89 <PR_BOOTABLE+0xe09>
 e20:	6b 6f 73 00          	imul   $0x0,0x73(%edi),%ebp
 e24:	47                   	inc    %edi
 e25:	4e                   	dec    %esi
 e26:	55                   	push   %ebp
 e27:	20 41 53             	and    %al,0x53(%ecx)
 e2a:	20 32                	and    %dh,(%edx)
 e2c:	2e 32 36             	xor    %cs:(%esi),%dh
 e2f:	2e 31 00             	xor    %eax,%cs:(%eax)
 e32:	01                   	.byte 0x1
 e33:	80                   	.byte 0x80

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%ecx)
   2:	00 10                	add    %dl,(%eax)
   4:	06                   	push   %es
   5:	11 01                	adc    %eax,(%ecx)
   7:	12 01                	adc    (%ecx),%al
   9:	03 08                	add    (%eax),%ecx
   b:	1b 08                	sbb    (%eax),%ecx
   d:	25 08 13 05 00       	and    $0x51308,%eax
  12:	00 00                	add    %al,(%eax)
  14:	01 11                	add    %edx,(%ecx)
  16:	01 25 0e 13 0b 03    	add    %esp,0x30b130e
  1c:	0e                   	push   %cs
  1d:	1b 0e                	sbb    (%esi),%ecx
  1f:	11 01                	adc    %eax,(%ecx)
  21:	12 06                	adc    (%esi),%al
  23:	10 17                	adc    %dl,(%edi)
  25:	00 00                	add    %al,(%eax)
  27:	02 24 00             	add    (%eax,%eax,1),%ah
  2a:	0b 0b                	or     (%ebx),%ecx
  2c:	3e 0b 03             	or     %ds:(%ebx),%eax
  2f:	0e                   	push   %cs
  30:	00 00                	add    %al,(%eax)
  32:	03 16                	add    (%esi),%edx
  34:	00 03                	add    %al,(%ebx)
  36:	0e                   	push   %cs
  37:	3a 0b                	cmp    (%ebx),%cl
  39:	3b 0b                	cmp    (%ebx),%ecx
  3b:	49                   	dec    %ecx
  3c:	13 00                	adc    (%eax),%eax
  3e:	00 04 24             	add    %al,(%esp)
  41:	00 0b                	add    %cl,(%ebx)
  43:	0b 3e                	or     (%esi),%edi
  45:	0b 03                	or     (%ebx),%eax
  47:	08 00                	or     %al,(%eax)
  49:	00 05 34 00 03 0e    	add    %al,0xe030034
  4f:	3a 0b                	cmp    (%ebx),%cl
  51:	3b 0b                	cmp    (%ebx),%ecx
  53:	49                   	dec    %ecx
  54:	13 3f                	adc    (%edi),%edi
  56:	19 02                	sbb    %eax,(%edx)
  58:	18 00                	sbb    %al,(%eax)
  5a:	00 06                	add    %al,(%esi)
  5c:	0f 00 0b             	str    (%ebx)
  5f:	0b 49 13             	or     0x13(%ecx),%ecx
  62:	00 00                	add    %al,(%eax)
  64:	07                   	pop    %es
  65:	35 00 49 13 00       	xor    $0x134900,%eax
  6a:	00 08                	add    %cl,(%eax)
  6c:	26 00 49 13          	add    %cl,%es:0x13(%ecx)
  70:	00 00                	add    %al,(%eax)
  72:	09 34 00             	or     %esi,(%eax,%eax,1)
  75:	03 08                	add    (%eax),%ecx
  77:	3a 0b                	cmp    (%ebx),%cl
  79:	3b 0b                	cmp    (%ebx),%ecx
  7b:	49                   	dec    %ecx
  7c:	13 02                	adc    (%edx),%eax
  7e:	18 00                	sbb    %al,(%eax)
  80:	00 0a                	add    %cl,(%edx)
  82:	01 01                	add    %eax,(%ecx)
  84:	49                   	dec    %ecx
  85:	13 01                	adc    (%ecx),%eax
  87:	13 00                	adc    (%eax),%eax
  89:	00 0b                	add    %cl,(%ebx)
  8b:	21 00                	and    %eax,(%eax)
  8d:	49                   	dec    %ecx
  8e:	13 2f                	adc    (%edi),%ebp
  90:	0b 00                	or     (%eax),%eax
  92:	00 0c 34             	add    %cl,(%esp,%esi,1)
  95:	00 03                	add    %al,(%ebx)
  97:	0e                   	push   %cs
  98:	3a 0b                	cmp    (%ebx),%cl
  9a:	3b 0b                	cmp    (%ebx),%ecx
  9c:	49                   	dec    %ecx
  9d:	13 02                	adc    (%edx),%eax
  9f:	18 00                	sbb    %al,(%eax)
  a1:	00 0d 2e 01 3f 19    	add    %cl,0x193f012e
  a7:	03 0e                	add    (%esi),%ecx
  a9:	3a 0b                	cmp    (%ebx),%cl
  ab:	3b 0b                	cmp    (%ebx),%ecx
  ad:	27                   	daa    
  ae:	19 11                	sbb    %edx,(%ecx)
  b0:	01 12                	add    %edx,(%edx)
  b2:	06                   	push   %es
  b3:	40                   	inc    %eax
  b4:	18 97 42 19 01 13    	sbb    %dl,0x13011942(%edi)
  ba:	00 00                	add    %al,(%eax)
  bc:	0e                   	push   %cs
  bd:	05 00 03 08 3a       	add    $0x3a080300,%eax
  c2:	0b 3b                	or     (%ebx),%edi
  c4:	0b 49 13             	or     0x13(%ecx),%ecx
  c7:	02 17                	add    (%edi),%dl
  c9:	00 00                	add    %al,(%eax)
  cb:	0f 05                	syscall 
  cd:	00 03                	add    %al,(%ebx)
  cf:	0e                   	push   %cs
  d0:	3a 0b                	cmp    (%ebx),%cl
  d2:	3b 0b                	cmp    (%ebx),%ecx
  d4:	49                   	dec    %ecx
  d5:	13 02                	adc    (%edx),%eax
  d7:	18 00                	sbb    %al,(%eax)
  d9:	00 10                	add    %dl,(%eax)
  db:	05 00 03 0e 3a       	add    $0x3a0e0300,%eax
  e0:	0b 3b                	or     (%ebx),%edi
  e2:	0b 49 13             	or     0x13(%ecx),%ecx
  e5:	02 17                	add    (%edi),%dl
  e7:	00 00                	add    %al,(%eax)
  e9:	11 05 00 03 08 3a    	adc    %eax,0x3a080300
  ef:	0b 3b                	or     (%ebx),%edi
  f1:	0b 49 13             	or     0x13(%ecx),%ecx
  f4:	02 18                	add    (%eax),%bl
  f6:	00 00                	add    %al,(%eax)
  f8:	12 34 00             	adc    (%eax,%eax,1),%dh
  fb:	03 0e                	add    (%esi),%ecx
  fd:	3a 0b                	cmp    (%ebx),%cl
  ff:	3b 0b                	cmp    (%ebx),%ecx
 101:	49                   	dec    %ecx
 102:	13 02                	adc    (%edx),%eax
 104:	17                   	pop    %ss
 105:	00 00                	add    %al,(%eax)
 107:	13 89 82 01 00 11    	adc    0x11000182(%ecx),%ecx
 10d:	01 31                	add    %esi,(%ecx)
 10f:	13 00                	adc    (%eax),%eax
 111:	00 14 1d 01 31 13 52 	add    %dl,0x52133101(,%ebx,1)
 118:	01 55 17             	add    %edx,0x17(%ebp)
 11b:	58                   	pop    %eax
 11c:	0b 59 0b             	or     0xb(%ecx),%ebx
 11f:	01 13                	add    %edx,(%ebx)
 121:	00 00                	add    %al,(%eax)
 123:	15 1d 01 31 13       	adc    $0x1331011d,%eax
 128:	52                   	push   %edx
 129:	01 55 17             	add    %edx,0x17(%ebp)
 12c:	58                   	pop    %eax
 12d:	0b 59 0b             	or     0xb(%ecx),%ebx
 130:	00 00                	add    %al,(%eax)
 132:	16                   	push   %ss
 133:	05 00 31 13 02       	add    $0x2133100,%eax
 138:	17                   	pop    %ss
 139:	00 00                	add    %al,(%eax)
 13b:	17                   	pop    %ss
 13c:	0b 01                	or     (%ecx),%eax
 13e:	55                   	push   %ebp
 13f:	17                   	pop    %ss
 140:	00 00                	add    %al,(%eax)
 142:	18 34 00             	sbb    %dh,(%eax,%eax,1)
 145:	31 13                	xor    %edx,(%ebx)
 147:	00 00                	add    %al,(%eax)
 149:	19 1d 01 31 13 11    	sbb    %ebx,0x11133101
 14f:	01 12                	add    %edx,(%edx)
 151:	06                   	push   %es
 152:	58                   	pop    %eax
 153:	0b 59 0b             	or     0xb(%ecx),%ebx
 156:	01 13                	add    %edx,(%ebx)
 158:	00 00                	add    %al,(%eax)
 15a:	1a 1d 01 31 13 11    	sbb    0x11133101,%bl
 160:	01 12                	add    %edx,(%edx)
 162:	06                   	push   %es
 163:	58                   	pop    %eax
 164:	0b 59 0b             	or     0xb(%ecx),%ebx
 167:	00 00                	add    %al,(%eax)
 169:	1b 0b                	sbb    (%ebx),%ecx
 16b:	01 11                	add    %edx,(%ecx)
 16d:	01 12                	add    %edx,(%edx)
 16f:	06                   	push   %es
 170:	00 00                	add    %al,(%eax)
 172:	1c 0f                	sbb    $0xf,%al
 174:	00 0b                	add    %cl,(%ebx)
 176:	0b 00                	or     (%eax),%eax
 178:	00 1d 2e 00 03 0e    	add    %bl,0xe03002e
 17e:	3a 0b                	cmp    (%ebx),%cl
 180:	3b 0b                	cmp    (%ebx),%ecx
 182:	27                   	daa    
 183:	19 20                	sbb    %esp,(%eax)
 185:	0b 00                	or     (%eax),%eax
 187:	00 1e                	add    %bl,(%esi)
 189:	34 00                	xor    $0x0,%al
 18b:	03 08                	add    (%eax),%ecx
 18d:	3a 0b                	cmp    (%ebx),%cl
 18f:	3b 0b                	cmp    (%ebx),%ecx
 191:	49                   	dec    %ecx
 192:	13 02                	adc    (%edx),%eax
 194:	17                   	pop    %ss
 195:	00 00                	add    %al,(%eax)
 197:	1f                   	pop    %ds
 198:	89 82 01 00 11 01    	mov    %eax,0x1110001(%edx)
 19e:	95                   	xchg   %eax,%ebp
 19f:	42                   	inc    %edx
 1a0:	19 31                	sbb    %esi,(%ecx)
 1a2:	13 00                	adc    (%eax),%eax
 1a4:	00 20                	add    %ah,(%eax)
 1a6:	2e 01 3f             	add    %edi,%cs:(%edi)
 1a9:	19 03                	sbb    %eax,(%ebx)
 1ab:	0e                   	push   %cs
 1ac:	3a 0b                	cmp    (%ebx),%cl
 1ae:	3b 0b                	cmp    (%ebx),%ecx
 1b0:	27                   	daa    
 1b1:	19 49 13             	sbb    %ecx,0x13(%ecx)
 1b4:	11 01                	adc    %eax,(%ecx)
 1b6:	12 06                	adc    (%esi),%al
 1b8:	40                   	inc    %eax
 1b9:	18 97 42 19 01 13    	sbb    %dl,0x13011942(%edi)
 1bf:	00 00                	add    %al,(%eax)
 1c1:	21 2e                	and    %ebp,(%esi)
 1c3:	01 03                	add    %eax,(%ebx)
 1c5:	0e                   	push   %cs
 1c6:	3a 0b                	cmp    (%ebx),%cl
 1c8:	3b 0b                	cmp    (%ebx),%ecx
 1ca:	27                   	daa    
 1cb:	19 20                	sbb    %esp,(%eax)
 1cd:	0b 01                	or     (%ecx),%eax
 1cf:	13 00                	adc    (%eax),%eax
 1d1:	00 22                	add    %ah,(%edx)
 1d3:	05 00 03 0e 3a       	add    $0x3a0e0300,%eax
 1d8:	0b 3b                	or     (%ebx),%edi
 1da:	0b 49 13             	or     0x13(%ecx),%ecx
 1dd:	00 00                	add    %al,(%eax)
 1df:	23 05 00 03 08 3a    	and    0x3a080300,%eax
 1e5:	0b 3b                	or     (%ebx),%edi
 1e7:	0b 49 13             	or     0x13(%ecx),%ecx
 1ea:	00 00                	add    %al,(%eax)
 1ec:	24 2e                	and    $0x2e,%al
 1ee:	01 03                	add    %eax,(%ebx)
 1f0:	08 3a                	or     %bh,(%edx)
 1f2:	0b 3b                	or     (%ebx),%edi
 1f4:	0b 27                	or     (%edi),%esp
 1f6:	19 49 13             	sbb    %ecx,0x13(%ecx)
 1f9:	20 0b                	and    %cl,(%ebx)
 1fb:	01 13                	add    %edx,(%ebx)
 1fd:	00 00                	add    %al,(%eax)
 1ff:	25 34 00 03 0e       	and    $0xe030034,%eax
 204:	3a 0b                	cmp    (%ebx),%cl
 206:	3b 0b                	cmp    (%ebx),%ecx
 208:	49                   	dec    %ecx
 209:	13 00                	adc    (%eax),%eax
 20b:	00 26                	add    %ah,(%esi)
 20d:	2e 01 03             	add    %eax,%cs:(%ebx)
 210:	0e                   	push   %cs
 211:	3a 0b                	cmp    (%ebx),%cl
 213:	3b 0b                	cmp    (%ebx),%ecx
 215:	27                   	daa    
 216:	19 20                	sbb    %esp,(%eax)
 218:	0b 00                	or     (%eax),%eax
 21a:	00 00                	add    %al,(%eax)
 21c:	01 11                	add    %edx,(%ecx)
 21e:	01 25 0e 13 0b 03    	add    %esp,0x30b130e
 224:	0e                   	push   %cs
 225:	1b 0e                	sbb    (%esi),%ecx
 227:	11 01                	adc    %eax,(%ecx)
 229:	12 06                	adc    (%esi),%al
 22b:	10 17                	adc    %dl,(%edi)
 22d:	00 00                	add    %al,(%eax)
 22f:	02 24 00             	add    (%eax,%eax,1),%ah
 232:	0b 0b                	or     (%ebx),%ecx
 234:	3e 0b 03             	or     %ds:(%ebx),%eax
 237:	0e                   	push   %cs
 238:	00 00                	add    %al,(%eax)
 23a:	03 16                	add    (%esi),%edx
 23c:	00 03                	add    %al,(%ebx)
 23e:	0e                   	push   %cs
 23f:	3a 0b                	cmp    (%ebx),%cl
 241:	3b 0b                	cmp    (%ebx),%ecx
 243:	49                   	dec    %ecx
 244:	13 00                	adc    (%eax),%eax
 246:	00 04 24             	add    %al,(%esp)
 249:	00 0b                	add    %cl,(%ebx)
 24b:	0b 3e                	or     (%esi),%edi
 24d:	0b 03                	or     (%ebx),%eax
 24f:	08 00                	or     %al,(%eax)
 251:	00 05 13 01 0b 0b    	add    %al,0xb0b0113
 257:	3a 0b                	cmp    (%ebx),%cl
 259:	3b 0b                	cmp    (%ebx),%ecx
 25b:	01 13                	add    %edx,(%ebx)
 25d:	00 00                	add    %al,(%eax)
 25f:	06                   	push   %es
 260:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
 265:	0b 3b                	or     (%ebx),%edi
 267:	0b 49 13             	or     0x13(%ecx),%ecx
 26a:	38 0b                	cmp    %cl,(%ebx)
 26c:	00 00                	add    %al,(%eax)
 26e:	07                   	pop    %es
 26f:	0d 00 03 08 3a       	or     $0x3a080300,%eax
 274:	0b 3b                	or     (%ebx),%edi
 276:	0b 49 13             	or     0x13(%ecx),%ecx
 279:	38 0b                	cmp    %cl,(%ebx)
 27b:	00 00                	add    %al,(%eax)
 27d:	08 01                	or     %al,(%ecx)
 27f:	01 49 13             	add    %ecx,0x13(%ecx)
 282:	01 13                	add    %edx,(%ebx)
 284:	00 00                	add    %al,(%eax)
 286:	09 21                	or     %esp,(%ecx)
 288:	00 49 13             	add    %cl,0x13(%ecx)
 28b:	2f                   	das    
 28c:	0b 00                	or     (%eax),%eax
 28e:	00 0a                	add    %cl,(%edx)
 290:	13 01                	adc    (%ecx),%eax
 292:	03 08                	add    (%eax),%ecx
 294:	0b 05 3a 0b 3b 0b    	or     0xb3b0b3a,%eax
 29a:	01 13                	add    %edx,(%ebx)
 29c:	00 00                	add    %al,(%eax)
 29e:	0b 0d 00 03 0e 3a    	or     0x3a0e0300,%ecx
 2a4:	0b 3b                	or     (%ebx),%edi
 2a6:	0b 49 13             	or     0x13(%ecx),%ecx
 2a9:	38 05 00 00 0c 21    	cmp    %al,0x210c0000
 2af:	00 49 13             	add    %cl,0x13(%ecx)
 2b2:	2f                   	das    
 2b3:	05 00 00 0d 13       	add    $0x130d0000,%eax
 2b8:	01 03                	add    %eax,(%ebx)
 2ba:	0e                   	push   %cs
 2bb:	0b 0b                	or     (%ebx),%ecx
 2bd:	3a 0b                	cmp    (%ebx),%cl
 2bf:	3b 0b                	cmp    (%ebx),%ecx
 2c1:	01 13                	add    %edx,(%ebx)
 2c3:	00 00                	add    %al,(%eax)
 2c5:	0e                   	push   %cs
 2c6:	17                   	pop    %ss
 2c7:	01 0b                	add    %ecx,(%ebx)
 2c9:	0b 3a                	or     (%edx),%edi
 2cb:	0b 3b                	or     (%ebx),%edi
 2cd:	0b 01                	or     (%ecx),%eax
 2cf:	13 00                	adc    (%eax),%eax
 2d1:	00 0f                	add    %cl,(%edi)
 2d3:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
 2d8:	0b 3b                	or     (%ebx),%edi
 2da:	0b 49 13             	or     0x13(%ecx),%ecx
 2dd:	00 00                	add    %al,(%eax)
 2df:	10 0d 00 03 08 3a    	adc    %cl,0x3a080300
 2e5:	0b 3b                	or     (%ebx),%edi
 2e7:	0b 49 13             	or     0x13(%ecx),%ecx
 2ea:	00 00                	add    %al,(%eax)
 2ec:	11 34 00             	adc    %esi,(%eax,%eax,1)
 2ef:	03 0e                	add    (%esi),%ecx
 2f1:	3a 0b                	cmp    (%ebx),%cl
 2f3:	3b 0b                	cmp    (%ebx),%ecx
 2f5:	49                   	dec    %ecx
 2f6:	13 3f                	adc    (%edi),%edi
 2f8:	19 02                	sbb    %eax,(%edx)
 2fa:	18 00                	sbb    %al,(%eax)
 2fc:	00 12                	add    %dl,(%edx)
 2fe:	2e 01 3f             	add    %edi,%cs:(%edi)
 301:	19 03                	sbb    %eax,(%ebx)
 303:	0e                   	push   %cs
 304:	3a 0b                	cmp    (%ebx),%cl
 306:	3b 0b                	cmp    (%ebx),%ecx
 308:	27                   	daa    
 309:	19 49 13             	sbb    %ecx,0x13(%ecx)
 30c:	11 01                	adc    %eax,(%ecx)
 30e:	12 06                	adc    (%esi),%al
 310:	40                   	inc    %eax
 311:	18 97 42 19 01 13    	sbb    %dl,0x13011942(%edi)
 317:	00 00                	add    %al,(%eax)
 319:	13 05 00 03 0e 3a    	adc    0x3a0e0300,%eax
 31f:	0b 3b                	or     (%ebx),%edi
 321:	0b 49 13             	or     0x13(%ecx),%ecx
 324:	02 18                	add    (%eax),%bl
 326:	00 00                	add    %al,(%eax)
 328:	14 34                	adc    $0x34,%al
 32a:	00 03                	add    %al,(%ebx)
 32c:	08 3a                	or     %bh,(%edx)
 32e:	0b 3b                	or     (%ebx),%edi
 330:	0b 49 13             	or     0x13(%ecx),%ecx
 333:	02 17                	add    (%edi),%dl
 335:	00 00                	add    %al,(%eax)
 337:	15 34 00 03 0e       	adc    $0xe030034,%eax
 33c:	3a 0b                	cmp    (%ebx),%cl
 33e:	3b 0b                	cmp    (%ebx),%ecx
 340:	49                   	dec    %ecx
 341:	13 02                	adc    (%edx),%eax
 343:	17                   	pop    %ss
 344:	00 00                	add    %al,(%eax)
 346:	16                   	push   %ss
 347:	89 82 01 00 11 01    	mov    %eax,0x1110001(%edx)
 34d:	31 13                	xor    %edx,(%ebx)
 34f:	00 00                	add    %al,(%eax)
 351:	17                   	pop    %ss
 352:	0f 00 0b             	str    (%ebx)
 355:	0b 49 13             	or     0x13(%ecx),%ecx
 358:	00 00                	add    %al,(%eax)
 35a:	18 2e                	sbb    %ch,(%esi)
 35c:	01 3f                	add    %edi,(%edi)
 35e:	19 03                	sbb    %eax,(%ebx)
 360:	0e                   	push   %cs
 361:	3a 0b                	cmp    (%ebx),%cl
 363:	3b 0b                	cmp    (%ebx),%ecx
 365:	27                   	daa    
 366:	19 11                	sbb    %edx,(%ecx)
 368:	01 12                	add    %edx,(%edx)
 36a:	06                   	push   %es
 36b:	40                   	inc    %eax
 36c:	18 97 42 19 01 13    	sbb    %dl,0x13011942(%edi)
 372:	00 00                	add    %al,(%eax)
 374:	19 05 00 03 08 3a    	sbb    %eax,0x3a080300
 37a:	0b 3b                	or     (%ebx),%edi
 37c:	0b 49 13             	or     0x13(%ecx),%ecx
 37f:	02 17                	add    (%edi),%dl
 381:	00 00                	add    %al,(%eax)
 383:	1a 05 00 03 08 3a    	sbb    0x3a080300,%al
 389:	0b 3b                	or     (%ebx),%edi
 38b:	0b 49 13             	or     0x13(%ecx),%ecx
 38e:	02 18                	add    (%eax),%bl
 390:	00 00                	add    %al,(%eax)
 392:	1b 89 82 01 00 11    	sbb    0x11000182(%ecx),%ecx
 398:	01 95 42 19 31 13    	add    %edx,0x13311942(%ebp)
 39e:	00 00                	add    %al,(%eax)
 3a0:	1c 2e                	sbb    $0x2e,%al
 3a2:	00 3f                	add    %bh,(%edi)
 3a4:	19 3c 19             	sbb    %edi,(%ecx,%ebx,1)
 3a7:	6e                   	outsb  %ds:(%esi),(%dx)
 3a8:	0e                   	push   %cs
 3a9:	03 0e                	add    (%esi),%ecx
 3ab:	3a 0b                	cmp    (%ebx),%cl
 3ad:	3b 0b                	cmp    (%ebx),%ecx
 3af:	00 00                	add    %al,(%eax)
 3b1:	00 01                	add    %al,(%ecx)
 3b3:	11 00                	adc    %eax,(%eax)
 3b5:	10 06                	adc    %al,(%esi)
 3b7:	11 01                	adc    %eax,(%ecx)
 3b9:	12 01                	adc    (%ecx),%al
 3bb:	03 08                	add    (%eax),%ecx
 3bd:	1b 08                	sbb    (%eax),%ecx
 3bf:	25 08 13 05 00       	and    $0x51308,%eax
 3c4:	00 00                	add    %al,(%eax)

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	7c 00                	jl     2 <CR0_PE_ON+0x1>
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	29 00                	sub    %eax,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	01 01                	add    %eax,(%ecx)
   c:	fb                   	sti    
   d:	0e                   	push   %cs
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	01 00                	add    %eax,(%eax)
  19:	00 01                	add    %al,(%ecx)
  1b:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  1e:	74 2f                	je     4f <PROT_MODE_DSEG+0x3f>
  20:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  23:	74 31                	je     56 <PROT_MODE_DSEG+0x46>
  25:	00 00                	add    %al,(%eax)
  27:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  2a:	74 31                	je     5d <PROT_MODE_DSEG+0x4d>
  2c:	2e 53                	cs push %ebx
  2e:	00 01                	add    %al,(%ecx)
  30:	00 00                	add    %al,(%eax)
  32:	00 00                	add    %al,(%eax)
  34:	05 02 00 7e 00       	add    $0x7e0002,%eax
  39:	00 03                	add    %al,(%ebx)
  3b:	2a 01                	sub    (%ecx),%al
  3d:	21 24 2f             	and    %esp,(%edi,%ebp,1)
  40:	2f                   	das    
  41:	2f                   	das    
  42:	2f                   	das    
  43:	30 2f                	xor    %ch,(%edi)
  45:	2f                   	das    
  46:	2f                   	das    
  47:	2f                   	das    
  48:	34 3d                	xor    $0x3d,%al
  4a:	42                   	inc    %edx
  4b:	3d 67 3e 67 67       	cmp    $0x67673e67,%eax
  50:	30 2f                	xor    %ch,(%edi)
  52:	67 30 83 3d 4b       	xor    %al,0x4b3d(%bp,%di)
  57:	2f                   	das    
  58:	30 2f                	xor    %ch,(%edi)
  5a:	3d 2f 30 3d 3d       	cmp    $0x3d3d302f,%eax
  5f:	31 26                	xor    %esp,(%esi)
  61:	59                   	pop    %ecx
  62:	3d 4b 40 5c 4b       	cmp    $0x4b5c404b,%eax
  67:	2f                   	das    
  68:	2f                   	das    
  69:	2f                   	das    
  6a:	2f                   	das    
  6b:	34 59                	xor    $0x59,%al
  6d:	59                   	pop    %ecx
  6e:	59                   	pop    %ecx
  6f:	21 5b 27             	and    %ebx,0x27(%ebx)
  72:	21 30                	and    %esi,(%eax)
  74:	21 2f                	and    %ebp,(%edi)
  76:	2f                   	das    
  77:	2f                   	das    
  78:	30 21                	xor    %ah,(%ecx)
  7a:	02 fc                	add    %ah,%bh
  7c:	18 00                	sbb    %al,(%eax)
  7e:	01 01                	add    %eax,(%ecx)
  80:	66 01 00             	add    %ax,(%eax)
  83:	00 02                	add    %al,(%edx)
  85:	00 3a                	add    %bh,(%edx)
  87:	00 00                	add    %al,(%eax)
  89:	00 01                	add    %al,(%ecx)
  8b:	01 fb                	add    %edi,%ebx
  8d:	0e                   	push   %cs
  8e:	0d 00 01 01 01       	or     $0x1010100,%eax
  93:	01 00                	add    %eax,(%eax)
  95:	00 00                	add    %al,(%eax)
  97:	01 00                	add    %eax,(%eax)
  99:	00 01                	add    %al,(%ecx)
  9b:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  9e:	74 2f                	je     cf <PR_BOOTABLE+0x4f>
  a0:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  a3:	74 31                	je     d6 <PR_BOOTABLE+0x56>
  a5:	00 00                	add    %al,(%eax)
  a7:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  aa:	74 31                	je     dd <PR_BOOTABLE+0x5d>
  ac:	6c                   	insb   (%dx),%es:(%edi)
  ad:	69 62 2e 63 00 01 00 	imul   $0x10063,0x2e(%edx),%esp
  b4:	00 62 6f             	add    %ah,0x6f(%edx)
  b7:	6f                   	outsl  %ds:(%esi),(%dx)
  b8:	74 31                	je     eb <PR_BOOTABLE+0x6b>
  ba:	6c                   	insb   (%dx),%es:(%edi)
  bb:	69 62 2e 68 00 01 00 	imul   $0x10068,0x2e(%edx),%esp
  c2:	00 00                	add    %al,(%eax)
  c4:	00 05 02 26 8b 00    	add    %al,0x8b2602
  ca:	00 03                	add    %al,(%ebx)
  cc:	09 01                	or     %eax,(%ecx)
  ce:	3c 3e                	cmp    $0x3e,%al
  d0:	3b 83 2f 67 33 4b    	cmp    0x4b33672f(%ebx),%eax
  d6:	4b                   	dec    %ebx
  d7:	3b 3d a0 08 3f 03    	cmp    0x33f08a0,%edi
  dd:	09 58 13             	or     %ebx,0x13(%eax)
  e0:	57                   	push   %edi
  e1:	4b                   	dec    %ebx
  e2:	02 24 13             	add    (%ebx,%edx,1),%ah
  e5:	c9                   	leave  
  e6:	86 3d 3d 1f 59 24    	xchg   %bh,0x24591f3d
  ec:	3d 00 02 04 01       	cmp    $0x1040200,%eax
  f1:	08 15 03 14 3c 23    	or     %dl,0x233c1403
  f7:	2b 2e                	sub    (%esi),%ebp
  f9:	00 02                	add    %al,(%edx)
  fb:	04 01                	add    $0x1,%al
  fd:	3f                   	aas    
  fe:	00 02                	add    %al,(%edx)
 100:	04 03                	add    $0x3,%al
 102:	67 3e 33 58 40       	xor    %ds:0x40(%bx,%si),%ebx
 107:	00 02                	add    %al,(%edx)
 109:	04 01                	add    $0x1,%al
 10b:	06                   	push   %es
 10c:	9e                   	sahf   
 10d:	00 02                	add    %al,(%edx)
 10f:	04 03                	add    $0x3,%al
 111:	06                   	push   %es
 112:	4c                   	dec    %esp
 113:	00 02                	add    %al,(%edx)
 115:	04 03                	add    $0x3,%al
 117:	3d 00 02 04 03       	cmp    $0x3040200,%eax
 11c:	67 00 02             	add    %al,(%bp,%si)
 11f:	04 03                	add    $0x3,%al
 121:	38 50 79             	cmp    %dl,0x79(%eax)
 124:	ac                   	lods   %ds:(%esi),%al
 125:	00 02                	add    %al,(%edx)
 127:	04 01                	add    $0x1,%al
 129:	08 de                	or     %bl,%dh
 12b:	00 02                	add    %al,(%edx)
 12d:	04 01                	add    $0x1,%al
 12f:	9f                   	lahf   
 130:	00 02                	add    %al,(%edx)
 132:	04 01                	add    $0x1,%al
 134:	2d 00 02 04 01       	sub    $0x1040200,%eax
 139:	67 2d 4c 67 75 4b    	addr16 sub $0x4b75674c,%eax
 13f:	3d 65 5d 3e 08       	cmp    $0x83e5d65,%eax
 144:	21 5d 3e             	and    %ebx,0x3e(%ebp)
 147:	08 21                	or     %ah,(%ecx)
 149:	03 bd 7f 58 3d c9    	add    -0x36c2a781(%ebp),%edi
 14f:	91                   	xchg   %eax,%ecx
 150:	1f                   	pop    %ds
 151:	03 d1                	add    %ecx,%edx
 153:	00 58 04             	add    %bl,0x4(%eax)
 156:	02 03                	add    (%ebx),%al
 158:	99                   	cltd   
 159:	7f 20                	jg     17b <PR_BOOTABLE+0xfb>
 15b:	04 01                	add    $0x1,%al
 15d:	03 e7                	add    %edi,%esp
 15f:	00 58 3c             	add    %bl,0x3c(%eax)
 162:	04 02                	add    $0x2,%al
 164:	03 99 7f 3c 04 01    	add    0x1043c7f(%ecx),%ebx
 16a:	03 e1                	add    %ecx,%esp
 16c:	00 20                	add    %ah,(%eax)
 16e:	04 02                	add    $0x2,%al
 170:	03 92 7f 74 04 01    	add    0x104747f(%edx),%edx
 176:	03 fa                	add    %edx,%edi
 178:	00 f2                	add    %dh,%dl
 17a:	04 02                	add    $0x2,%al
 17c:	03 86 7f 2e 04 01    	add    0x1042e7f(%esi),%eax
 182:	03 fa                	add    %edx,%edi
 184:	00 58 04             	add    %bl,0x4(%eax)
 187:	02 03                	add    (%ebx),%al
 189:	86 7f 3c             	xchg   %bh,0x3c(%edi)
 18c:	04 01                	add    $0x1,%al
 18e:	03 fb                	add    %ebx,%edi
 190:	00 20                	add    %ah,(%eax)
 192:	04 02                	add    $0x2,%al
 194:	03 85 7f 2e 04 01    	add    0x1042e7f(%ebp),%eax
 19a:	03 fb                	add    %ebx,%edi
 19c:	00 58 04             	add    %bl,0x4(%eax)
 19f:	02 03                	add    (%ebx),%al
 1a1:	85 7f 3c             	test   %edi,0x3c(%edi)
 1a4:	04 01                	add    $0x1,%al
 1a6:	03 fc                	add    %esp,%edi
 1a8:	00 20                	add    %ah,(%eax)
 1aa:	04 02                	add    $0x2,%al
 1ac:	03 84 7f 2e 04 01 03 	add    0x301042e(%edi,%edi,2),%eax
 1b3:	fc                   	cld    
 1b4:	00 58 04             	add    %bl,0x4(%eax)
 1b7:	02 03                	add    (%ebx),%al
 1b9:	84 7f 66             	test   %bh,0x66(%edi)
 1bc:	03 0d 90 04 01 03    	add    0x3010490,%ecx
 1c2:	e1 00                	loope  1c4 <PR_BOOTABLE+0x144>
 1c4:	20 04 02             	and    %al,(%edx,%eax,1)
 1c7:	03 a6 7f 74 04 01    	add    0x104747f(%esi),%esp
 1cd:	03 f0                	add    %eax,%esi
 1cf:	00 f2                	add    %dh,%dl
 1d1:	42                   	inc    %edx
 1d2:	66 03 09             	add    (%ecx),%cx
 1d5:	3c 03                	cmp    $0x3,%al
 1d7:	7a 3c                	jp     215 <PR_BOOTABLE+0x195>
 1d9:	31 63 6c             	xor    %esp,0x6c(%ebx)
 1dc:	37                   	aaa    
 1dd:	41                   	inc    %ecx
 1de:	41                   	inc    %ecx
 1df:	4c                   	dec    %esp
 1e0:	30 1f                	xor    %bl,(%edi)
 1e2:	65 5a                	gs pop %edx
 1e4:	4c                   	dec    %esp
 1e5:	02 08                	add    (%eax),%cl
 1e7:	00 01                	add    %al,(%ecx)
 1e9:	01 b0 00 00 00 02    	add    %esi,0x2000000(%eax)
 1ef:	00 3b                	add    %bh,(%ebx)
 1f1:	00 00                	add    %al,(%eax)
 1f3:	00 01                	add    %al,(%ecx)
 1f5:	01 fb                	add    %edi,%ebx
 1f7:	0e                   	push   %cs
 1f8:	0d 00 01 01 01       	or     $0x1010100,%eax
 1fd:	01 00                	add    %eax,(%eax)
 1ff:	00 00                	add    %al,(%eax)
 201:	01 00                	add    %eax,(%eax)
 203:	00 01                	add    %al,(%ecx)
 205:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 208:	74 2f                	je     239 <PR_BOOTABLE+0x1b9>
 20a:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 20d:	74 31                	je     240 <PR_BOOTABLE+0x1c0>
 20f:	00 00                	add    %al,(%eax)
 211:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 214:	74 31                	je     247 <PR_BOOTABLE+0x1c7>
 216:	6d                   	insl   (%dx),%es:(%edi)
 217:	61                   	popa   
 218:	69 6e 2e 63 00 01 00 	imul   $0x10063,0x2e(%esi),%ebp
 21f:	00 62 6f             	add    %ah,0x6f(%edx)
 222:	6f                   	outsl  %ds:(%esi),(%dx)
 223:	74 31                	je     256 <PR_BOOTABLE+0x1d6>
 225:	6c                   	insb   (%dx),%es:(%edi)
 226:	69 62 2e 68 00 01 00 	imul   $0x10068,0x2e(%edx),%esp
 22d:	00 00                	add    %al,(%eax)
 22f:	00 05 02 78 8d 00    	add    %al,0x8d7802
 235:	00 03                	add    %al,(%ebx)
 237:	2f                   	das    
 238:	01 90 40 08 23 e5    	add    %edx,-0x1adcf7c0(%eax)
 23e:	f5                   	cmc    
 23f:	59                   	pop    %ecx
 240:	73 67                	jae    2a9 <PR_BOOTABLE+0x229>
 242:	00 02                	add    %al,(%edx)
 244:	04 01                	add    $0x1,%al
 246:	5a                   	pop    %edx
 247:	00 02                	add    %al,(%edx)
 249:	04 02                	add    $0x2,%al
 24b:	4c                   	dec    %esp
 24c:	00 02                	add    %al,(%edx)
 24e:	04 02                	add    $0x2,%al
 250:	48                   	dec    %eax
 251:	00 02                	add    %al,(%edx)
 253:	04 02                	add    $0x2,%al
 255:	3e 00 02             	add    %al,%ds:(%edx)
 258:	04 02                	add    $0x2,%al
 25a:	aa                   	stos   %al,%es:(%edi)
 25b:	5d                   	pop    %ebp
 25c:	59                   	pop    %ecx
 25d:	49                   	dec    %ecx
 25e:	59                   	pop    %ecx
 25f:	4e                   	dec    %esi
 260:	58                   	pop    %eax
 261:	40                   	inc    %eax
 262:	2f                   	das    
 263:	c9                   	leave  
 264:	e6 3e                	out    %al,$0x3e
 266:	3a 68 00             	cmp    0x0(%eax),%ch
 269:	02 04 01             	add    (%ecx,%eax,1),%al
 26c:	54                   	push   %esp
 26d:	00 02                	add    %al,(%edx)
 26f:	04 02                	add    $0x2,%al
 271:	06                   	push   %es
 272:	9e                   	sahf   
 273:	06                   	push   %es
 274:	7a 67                	jp     2dd <PR_BOOTABLE+0x25d>
 276:	68 03 b6 7f ba       	push   $0xba7fb603
 27b:	58                   	pop    %eax
 27c:	67 08 87 30 e6       	or     %al,-0x19d0(%bx)
 281:	00 02                	add    %al,(%edx)
 283:	04 02                	add    $0x2,%al
 285:	b6 03                	mov    $0x3,%dh
 287:	0a 66 03             	or     0x3(%esi),%ah
 28a:	75 3c                	jne    2c8 <PR_BOOTABLE+0x248>
 28c:	03 0b                	add    (%ebx),%ecx
 28e:	2e ca 92 bb          	cs lret $0xbb92
 292:	84 72 30             	test   %dh,0x30(%edx)
 295:	5a                   	pop    %edx
 296:	ca a0 64             	lret   $0x64a0
 299:	02 05 00 01 01 46    	add    0x46010100,%al
 29f:	00 00                	add    %al,(%eax)
 2a1:	00 02                	add    %al,(%edx)
 2a3:	00 2f                	add    %ch,(%edi)
 2a5:	00 00                	add    %al,(%eax)
 2a7:	00 01                	add    %al,(%ecx)
 2a9:	01 fb                	add    %edi,%ebx
 2ab:	0e                   	push   %cs
 2ac:	0d 00 01 01 01       	or     $0x1010100,%eax
 2b1:	01 00                	add    %eax,(%eax)
 2b3:	00 00                	add    %al,(%eax)
 2b5:	01 00                	add    %eax,(%eax)
 2b7:	00 01                	add    %al,(%ecx)
 2b9:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 2bc:	74 2f                	je     2ed <PR_BOOTABLE+0x26d>
 2be:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 2c1:	74 31                	je     2f4 <PR_BOOTABLE+0x274>
 2c3:	00 00                	add    %al,(%eax)
 2c5:	65 78 65             	gs js  32d <PR_BOOTABLE+0x2ad>
 2c8:	63 5f 6b             	arpl   %bx,0x6b(%edi)
 2cb:	65 72 6e             	gs jb  33c <PR_BOOTABLE+0x2bc>
 2ce:	65 6c                	gs insb (%dx),%es:(%edi)
 2d0:	2e 53                	cs push %ebx
 2d2:	00 01                	add    %al,(%ecx)
 2d4:	00 00                	add    %al,(%eax)
 2d6:	00 00                	add    %al,(%eax)
 2d8:	05 02 ff 8e 00       	add    $0x8eff02,%eax
 2dd:	00 17                	add    %dl,(%edi)
 2df:	21 59 4b             	and    %ebx,0x4b(%ecx)
 2e2:	4b                   	dec    %ebx
 2e3:	02 02                	add    (%edx),%al
 2e5:	00 01                	add    %al,(%ecx)
 2e7:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	65 6e                	outsb  %gs:(%esi),(%dx)
   2:	64 5f                	fs pop %edi
   4:	76 61                	jbe    67 <PROT_MODE_DSEG+0x57>
   6:	00 77 61             	add    %dh,0x61(%edi)
   9:	69 74 64 69 73 6b 00 	imul   $0x70006b73,0x69(%esp,%eiz,2),%esi
  10:	70 
  11:	75 74                	jne    87 <PR_BOOTABLE+0x7>
  13:	6c                   	insb   (%dx),%es:(%edi)
  14:	69 6e 65 00 73 68 6f 	imul   $0x6f687300,0x65(%esi),%ebp
  1b:	72 74                	jb     91 <PR_BOOTABLE+0x11>
  1d:	20 69 6e             	and    %ch,0x6e(%ecx)
  20:	74 00                	je     22 <PROT_MODE_DSEG+0x12>
  22:	73 69                	jae    8d <PR_BOOTABLE+0xd>
  24:	7a 65                	jp     8b <PR_BOOTABLE+0xb>
  26:	74 79                	je     a1 <PR_BOOTABLE+0x21>
  28:	70 65                	jo     8f <PR_BOOTABLE+0xf>
  2a:	00 72 6f             	add    %dh,0x6f(%edx)
  2d:	6c                   	insb   (%dx),%es:(%edi)
  2e:	6c                   	insb   (%dx),%es:(%edi)
  2f:	00 73 74             	add    %dh,0x74(%ebx)
  32:	72 69                	jb     9d <PR_BOOTABLE+0x1d>
  34:	6e                   	outsb  %ds:(%esi),(%dx)
  35:	67 00 70 61          	add    %dh,0x61(%bx,%si)
  39:	6e                   	outsb  %ds:(%esi),(%dx)
  3a:	69 63 00 70 75 74 69 	imul   $0x69747570,0x0(%ebx),%esp
  41:	00 72 65             	add    %dh,0x65(%edx)
  44:	61                   	popa   
  45:	64 73 65             	fs jae ad <PR_BOOTABLE+0x2d>
  48:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
  4c:	00 62 6f             	add    %ah,0x6f(%edx)
  4f:	6f                   	outsl  %ds:(%esi),(%dx)
  50:	74 2f                	je     81 <PR_BOOTABLE+0x1>
  52:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  55:	74 31                	je     88 <PR_BOOTABLE+0x8>
  57:	2f                   	das    
  58:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  5b:	74 31                	je     8e <PR_BOOTABLE+0xe>
  5d:	6c                   	insb   (%dx),%es:(%edi)
  5e:	69 62 2e 63 00 75 69 	imul   $0x69750063,0x2e(%edx),%esp
  65:	6e                   	outsb  %ds:(%esi),(%dx)
  66:	74 38                	je     a0 <PR_BOOTABLE+0x20>
  68:	5f                   	pop    %edi
  69:	74 00                	je     6b <PROT_MODE_DSEG+0x5b>
  6b:	6f                   	outsl  %ds:(%esi),(%dx)
  6c:	75 74                	jne    e2 <PR_BOOTABLE+0x62>
  6e:	62 00                	bound  %eax,(%eax)
  70:	69 6e 73 6c 00 6c 6f 	imul   $0x6f6c006c,0x73(%esi),%ebp
  77:	6e                   	outsb  %ds:(%esi),(%dx)
  78:	67 20 6c 6f          	and    %ch,0x6f(%si)
  7c:	6e                   	outsb  %ds:(%esi),(%dx)
  7d:	67 20 69 6e          	and    %ch,0x6e(%bx,%di)
  81:	74 00                	je     83 <PR_BOOTABLE+0x3>
  83:	72 65                	jb     ea <PR_BOOTABLE+0x6a>
  85:	61                   	popa   
  86:	64 73 65             	fs jae ee <PR_BOOTABLE+0x6e>
  89:	63 74 69 6f          	arpl   %si,0x6f(%ecx,%ebp,2)
  8d:	6e                   	outsb  %ds:(%esi),(%dx)
  8e:	00 69 74             	add    %ch,0x74(%ecx)
  91:	6f                   	outsl  %ds:(%esi),(%dx)
  92:	61                   	popa   
  93:	00 75 6e             	add    %dh,0x6e(%ebp)
  96:	73 69                	jae    101 <PR_BOOTABLE+0x81>
  98:	67 6e                	outsb  %ds:(%si),(%dx)
  9a:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
  9f:	61                   	popa   
  a0:	72 00                	jb     a2 <PR_BOOTABLE+0x22>
  a2:	69 74 6f 68 00 70 75 	imul   $0x74757000,0x68(%edi,%ebp,2),%esi
  a9:	74 
  aa:	63 00                	arpl   %ax,(%eax)
  ac:	6c                   	insb   (%dx),%es:(%edi)
  ad:	6f                   	outsl  %ds:(%esi),(%dx)
  ae:	6e                   	outsb  %ds:(%esi),(%dx)
  af:	67 20 6c 6f          	and    %ch,0x6f(%si)
  b3:	6e                   	outsb  %ds:(%esi),(%dx)
  b4:	67 20 75 6e          	and    %dh,0x6e(%di)
  b8:	73 69                	jae    123 <PR_BOOTABLE+0xa3>
  ba:	67 6e                	outsb  %ds:(%si),(%dx)
  bc:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
  c1:	74 00                	je     c3 <PR_BOOTABLE+0x43>
  c3:	75 69                	jne    12e <PR_BOOTABLE+0xae>
  c5:	6e                   	outsb  %ds:(%esi),(%dx)
  c6:	74 33                	je     fb <PR_BOOTABLE+0x7b>
  c8:	32 5f 74             	xor    0x74(%edi),%bl
  cb:	00 63 6f             	add    %ah,0x6f(%ebx)
  ce:	6c                   	insb   (%dx),%es:(%edi)
  cf:	6f                   	outsl  %ds:(%esi),(%dx)
  d0:	72 00                	jb     d2 <PR_BOOTABLE+0x52>
  d2:	2f                   	das    
  d3:	68 6f 6d 65 2f       	push   $0x2f656d6f
  d8:	61                   	popa   
  d9:	63 63 74             	arpl   %sp,0x74(%ebx)
  dc:	73 2f                	jae    10d <PR_BOOTABLE+0x8d>
  de:	6a 61                	push   $0x61
  e0:	38 36                	cmp    %dh,(%esi)
  e2:	32 2f                	xor    (%edi),%ch
  e4:	63 73 34             	arpl   %si,0x34(%ebx)
  e7:	32 32                	xor    (%edx),%dh
  e9:	2f                   	das    
  ea:	6d                   	insl   (%dx),%es:(%edi)
  eb:	63 65 72             	arpl   %sp,0x72(%ebp)
  ee:	74 69                	je     159 <PR_BOOTABLE+0xd9>
  f0:	6b 6f 73 00          	imul   $0x0,0x73(%edi),%ebp
  f4:	70 75                	jo     16b <PR_BOOTABLE+0xeb>
  f6:	74 73                	je     16b <PR_BOOTABLE+0xeb>
  f8:	00 73 68             	add    %dh,0x68(%ebx)
  fb:	6f                   	outsl  %ds:(%esi),(%dx)
  fc:	72 74                	jb     172 <PR_BOOTABLE+0xf2>
  fe:	20 75 6e             	and    %dh,0x6e(%ebp)
 101:	73 69                	jae    16c <PR_BOOTABLE+0xec>
 103:	67 6e                	outsb  %ds:(%si),(%dx)
 105:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 10a:	74 00                	je     10c <PR_BOOTABLE+0x8c>
 10c:	73 74                	jae    182 <PR_BOOTABLE+0x102>
 10e:	72 6c                	jb     17c <PR_BOOTABLE+0xfc>
 110:	65 6e                	outsb  %gs:(%esi),(%dx)
 112:	00 64 61 74          	add    %ah,0x74(%ecx,%eiz,2)
 116:	61                   	popa   
 117:	00 69 74             	add    %ch,0x74(%ecx)
 11a:	6f                   	outsl  %ds:(%esi),(%dx)
 11b:	78 00                	js     11d <PR_BOOTABLE+0x9d>
 11d:	47                   	inc    %edi
 11e:	4e                   	dec    %esi
 11f:	55                   	push   %ebp
 120:	20 43 31             	and    %al,0x31(%ebx)
 123:	31 20                	xor    %esp,(%eax)
 125:	36 2e 31 2e          	ss xor %ebp,%cs:(%esi)
 129:	31 20                	xor    %esp,(%eax)
 12b:	32 30                	xor    (%eax),%dh
 12d:	31 36                	xor    %esi,(%esi)
 12f:	30 36                	xor    %dh,(%esi)
 131:	32 31                	xor    (%ecx),%dh
 133:	20 28                	and    %ch,(%eax)
 135:	52                   	push   %edx
 136:	65 64 20 48 61       	gs and %cl,%fs:0x61(%eax)
 13b:	74 20                	je     15d <PR_BOOTABLE+0xdd>
 13d:	36 2e 31 2e          	ss xor %ebp,%cs:(%esi)
 141:	31 2d 33 29 20 2d    	xor    %ebp,0x2d202933
 147:	6d                   	insl   (%dx),%es:(%edi)
 148:	33 32                	xor    (%edx),%esi
 14a:	20 2d 6d 74 75 6e    	and    %ch,0x6e75746d
 150:	65 3d 67 65 6e 65    	gs cmp $0x656e6567,%eax
 156:	72 69                	jb     1c1 <PR_BOOTABLE+0x141>
 158:	63 20                	arpl   %sp,(%eax)
 15a:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
 15f:	68 3d 69 36 38       	push   $0x3836693d
 164:	36 20 2d 67 20 2d 4f 	and    %ch,%ss:0x4f2d2067
 16b:	73 20                	jae    18d <PR_BOOTABLE+0x10d>
 16d:	2d 4f 73 20 2d       	sub    $0x2d20734f,%eax
 172:	66 6e                	data16 outsb %ds:(%esi),(%dx)
 174:	6f                   	outsl  %ds:(%esi),(%dx)
 175:	2d 62 75 69 6c       	sub    $0x6c697562,%eax
 17a:	74 69                	je     1e5 <PR_BOOTABLE+0x165>
 17c:	6e                   	outsb  %ds:(%esi),(%dx)
 17d:	20 2d 66 6e 6f 2d    	and    %ch,0x2d6f6e66
 183:	73 74                	jae    1f9 <PR_BOOTABLE+0x179>
 185:	61                   	popa   
 186:	63 6b 2d             	arpl   %bp,0x2d(%ebx)
 189:	70 72                	jo     1fd <PR_BOOTABLE+0x17d>
 18b:	6f                   	outsl  %ds:(%esi),(%dx)
 18c:	74 65                	je     1f3 <PR_BOOTABLE+0x173>
 18e:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
 192:	00 70 6f             	add    %dh,0x6f(%eax)
 195:	72 74                	jb     20b <PR_BOOTABLE+0x18b>
 197:	00 73 69             	add    %dh,0x69(%ebx)
 19a:	67 6e                	outsb  %ds:(%si),(%dx)
 19c:	00 72 65             	add    %dh,0x65(%edx)
 19f:	76 65                	jbe    206 <PR_BOOTABLE+0x186>
 1a1:	72 73                	jb     216 <PR_BOOTABLE+0x196>
 1a3:	65 00 70 75          	add    %dh,%gs:0x75(%eax)
 1a7:	74 69                	je     212 <PR_BOOTABLE+0x192>
 1a9:	5f                   	pop    %edi
 1aa:	73 74                	jae    220 <PR_BOOTABLE+0x1a0>
 1ac:	72 00                	jb     1ae <PR_BOOTABLE+0x12e>
 1ae:	62 6c 61 6e          	bound  %ebp,0x6e(%ecx,%eiz,2)
 1b2:	6b 00 72             	imul   $0x72,(%eax),%eax
 1b5:	6f                   	outsl  %ds:(%esi),(%dx)
 1b6:	6f                   	outsl  %ds:(%esi),(%dx)
 1b7:	74 00                	je     1b9 <PR_BOOTABLE+0x139>
 1b9:	76 69                	jbe    224 <PR_BOOTABLE+0x1a4>
 1bb:	64 65 6f             	fs outsl %gs:(%esi),(%dx)
 1be:	00 64 69 73          	add    %ah,0x73(%ecx,%ebp,2)
 1c2:	6b 5f 73 69          	imul   $0x69,0x73(%edi),%ebx
 1c6:	67 00 65 6c          	add    %ah,0x6c(%di)
 1ca:	66 68 64 66          	pushw  $0x6664
 1ce:	00 65 5f             	add    %ah,0x5f(%ebp)
 1d1:	73 68                	jae    23b <PR_BOOTABLE+0x1bb>
 1d3:	73 74                	jae    249 <PR_BOOTABLE+0x1c9>
 1d5:	72 6e                	jb     245 <PR_BOOTABLE+0x1c5>
 1d7:	64 78 00             	fs js  1da <PR_BOOTABLE+0x15a>
 1da:	6d                   	insl   (%dx),%es:(%edi)
 1db:	6d                   	insl   (%dx),%es:(%edi)
 1dc:	61                   	popa   
 1dd:	70 5f                	jo     23e <PR_BOOTABLE+0x1be>
 1df:	61                   	popa   
 1e0:	64 64 72 00          	fs fs jb 1e4 <PR_BOOTABLE+0x164>
 1e4:	65 6c                	gs insb (%dx),%es:(%edi)
 1e6:	66 68 64 72          	pushw  $0x7264
 1ea:	00 76 62             	add    %dh,0x62(%esi)
 1ed:	65 5f                	gs pop %edi
 1ef:	69 6e 74 65 72 66 61 	imul   $0x61667265,0x74(%esi),%ebp
 1f6:	63 65 5f             	arpl   %sp,0x5f(%ebp)
 1f9:	6f                   	outsl  %ds:(%esi),(%dx)
 1fa:	66 66 00 65 5f       	data16 data16 add %ah,0x5f(%ebp)
 1ff:	65 6e                	outsb  %gs:(%esi),(%dx)
 201:	74 72                	je     275 <PR_BOOTABLE+0x1f5>
 203:	79 00                	jns    205 <PR_BOOTABLE+0x185>
 205:	75 69                	jne    270 <PR_BOOTABLE+0x1f0>
 207:	6e                   	outsb  %ds:(%esi),(%dx)
 208:	74 36                	je     240 <PR_BOOTABLE+0x1c0>
 20a:	34 5f                	xor    $0x5f,%al
 20c:	74 00                	je     20e <PR_BOOTABLE+0x18e>
 20e:	6c                   	insb   (%dx),%es:(%edi)
 20f:	6f                   	outsl  %ds:(%esi),(%dx)
 210:	61                   	popa   
 211:	64 5f                	fs pop %edi
 213:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
 217:	65 6c                	gs insb (%dx),%es:(%edi)
 219:	00 70 5f             	add    %dh,0x5f(%eax)
 21c:	6d                   	insl   (%dx),%es:(%edi)
 21d:	65 6d                	gs insl (%dx),%es:(%edi)
 21f:	73 7a                	jae    29b <PR_BOOTABLE+0x21b>
 221:	00 70 5f             	add    %dh,0x5f(%eax)
 224:	6f                   	outsl  %ds:(%esi),(%dx)
 225:	66 66 73 65          	data16 data16 jae 28e <PR_BOOTABLE+0x20e>
 229:	74 00                	je     22b <PR_BOOTABLE+0x1ab>
 22b:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 22e:	74 6c                	je     29c <PR_BOOTABLE+0x21c>
 230:	6f                   	outsl  %ds:(%esi),(%dx)
 231:	61                   	popa   
 232:	64 65 72 00          	fs gs jb 236 <PR_BOOTABLE+0x1b6>
 236:	65 5f                	gs pop %edi
 238:	66 6c                	data16 insb (%dx),%es:(%edi)
 23a:	61                   	popa   
 23b:	67 73 00             	addr16 jae 23e <PR_BOOTABLE+0x1be>
 23e:	63 6d 64             	arpl   %bp,0x64(%ebp)
 241:	6c                   	insb   (%dx),%es:(%edi)
 242:	69 6e 65 00 65 5f 6d 	imul   $0x6d5f6500,0x65(%esi),%ebp
 249:	61                   	popa   
 24a:	63 68 69             	arpl   %bp,0x69(%eax)
 24d:	6e                   	outsb  %ds:(%esi),(%dx)
 24e:	65 00 65 5f          	add    %ah,%gs:0x5f(%ebp)
 252:	70 68                	jo     2bc <PR_BOOTABLE+0x23c>
 254:	65 6e                	outsb  %gs:(%esi),(%dx)
 256:	74 73                	je     2cb <PR_BOOTABLE+0x24b>
 258:	69 7a 65 00 65 78 65 	imul   $0x65786500,0x65(%edx),%edi
 25f:	63 5f 6b             	arpl   %bx,0x6b(%edi)
 262:	65 72 6e             	gs jb  2d3 <PR_BOOTABLE+0x253>
 265:	65 6c                	gs insb (%dx),%es:(%edi)
 267:	00 6d 6f             	add    %ch,0x6f(%ebp)
 26a:	64 73 5f             	fs jae 2cc <PR_BOOTABLE+0x24c>
 26d:	61                   	popa   
 26e:	64 64 72 00          	fs fs jb 272 <PR_BOOTABLE+0x1f2>
 272:	6d                   	insl   (%dx),%es:(%edi)
 273:	6d                   	insl   (%dx),%es:(%edi)
 274:	61                   	popa   
 275:	70 5f                	jo     2d6 <PR_BOOTABLE+0x256>
 277:	6c                   	insb   (%dx),%es:(%edi)
 278:	65 6e                	outsb  %gs:(%esi),(%dx)
 27a:	67 74 68             	addr16 je 2e5 <PR_BOOTABLE+0x265>
 27d:	00 73 74             	add    %dh,0x74(%ebx)
 280:	72 73                	jb     2f5 <PR_BOOTABLE+0x275>
 282:	69 7a 65 00 70 61 72 	imul   $0x72617000,0x65(%edx),%edi
 289:	74 33                	je     2be <PR_BOOTABLE+0x23e>
 28b:	00 70 5f             	add    %dh,0x5f(%eax)
 28e:	74 79                	je     309 <PR_BOOTABLE+0x289>
 290:	70 65                	jo     2f7 <PR_BOOTABLE+0x277>
 292:	00 70 72             	add    %dh,0x72(%eax)
 295:	6f                   	outsl  %ds:(%esi),(%dx)
 296:	67 68 64 72 00 65    	addr16 push $0x65007264
 29c:	5f                   	pop    %edi
 29d:	73 68                	jae    307 <PR_BOOTABLE+0x287>
 29f:	65 6e                	outsb  %gs:(%esi),(%dx)
 2a1:	74 73                	je     316 <PR_BOOTABLE+0x296>
 2a3:	69 7a 65 00 73 68 6e 	imul   $0x6e687300,0x65(%edx),%edi
 2aa:	64 78 00             	fs js  2ad <PR_BOOTABLE+0x22d>
 2ad:	6d                   	insl   (%dx),%es:(%edi)
 2ae:	62 72 5f             	bound  %esi,0x5f(%edx)
 2b1:	74 00                	je     2b3 <PR_BOOTABLE+0x233>
 2b3:	65 5f                	gs pop %edi
 2b5:	74 79                	je     330 <PR_BOOTABLE+0x2b0>
 2b7:	70 65                	jo     31e <PR_BOOTABLE+0x29e>
 2b9:	00 64 72 69          	add    %ah,0x69(%edx,%esi,2)
 2bd:	76 65                	jbe    324 <PR_BOOTABLE+0x2a4>
 2bf:	73 5f                	jae    320 <PR_BOOTABLE+0x2a0>
 2c1:	61                   	popa   
 2c2:	64 64 72 00          	fs fs jb 2c6 <PR_BOOTABLE+0x246>
 2c6:	65 5f                	gs pop %edi
 2c8:	65 68 73 69 7a 65    	gs push $0x657a6973
 2ce:	00 70 61             	add    %dh,0x61(%eax)
 2d1:	72 74                	jb     347 <PR_BOOTABLE+0x2c7>
 2d3:	69 74 69 6f 6e 00 62 	imul   $0x6962006e,0x6f(%ecx,%ebp,2),%esi
 2da:	69 
 2db:	6f                   	outsl  %ds:(%esi),(%dx)
 2dc:	73 5f                	jae    33d <PR_BOOTABLE+0x2bd>
 2de:	73 6d                	jae    34d <PR_BOOTABLE+0x2cd>
 2e0:	61                   	popa   
 2e1:	70 5f                	jo     342 <PR_BOOTABLE+0x2c2>
 2e3:	74 00                	je     2e5 <PR_BOOTABLE+0x265>
 2e5:	6d                   	insl   (%dx),%es:(%edi)
 2e6:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 2e9:	74 5f                	je     34a <PR_BOOTABLE+0x2ca>
 2eb:	69 6e 66 6f 5f 74 00 	imul   $0x745f6f,0x66(%esi),%ebp
 2f2:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 2f5:	74 61                	je     358 <PR_BOOTABLE+0x2d8>
 2f7:	62 6c 65 5f          	bound  %ebp,0x5f(%ebp,%eiz,2)
 2fb:	6c                   	insb   (%dx),%es:(%edi)
 2fc:	62 61 00             	bound  %esp,0x0(%ecx)
 2ff:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 302:	74 31                	je     335 <PR_BOOTABLE+0x2b5>
 304:	6d                   	insl   (%dx),%es:(%edi)
 305:	61                   	popa   
 306:	69 6e 00 65 5f 76 65 	imul   $0x65765f65,0x0(%esi),%ebp
 30d:	72 73                	jb     382 <PR_BOOTABLE+0x302>
 30f:	69 6f 6e 00 70 61 72 	imul   $0x72617000,0x6e(%edi),%ebp
 316:	74 31                	je     349 <PR_BOOTABLE+0x2c9>
 318:	00 70 61             	add    %dh,0x61(%eax)
 31b:	72 74                	jb     391 <PR_BOOTABLE+0x311>
 31d:	32 00                	xor    (%eax),%al
 31f:	64 72 69             	fs jb  38b <PR_BOOTABLE+0x30b>
 322:	76 65                	jbe    389 <PR_BOOTABLE+0x309>
 324:	72 00                	jb     326 <PR_BOOTABLE+0x2a6>
 326:	66 69 72 73 74 5f    	imul   $0x5f74,0x73(%edx),%si
 32c:	63 68 73             	arpl   %bp,0x73(%eax)
 32f:	00 62 69             	add    %ah,0x69(%edx)
 332:	6f                   	outsl  %ds:(%esi),(%dx)
 333:	73 5f                	jae    394 <PR_BOOTABLE+0x314>
 335:	73 6d                	jae    3a4 <PR_BOOTABLE+0x324>
 337:	61                   	popa   
 338:	70 00                	jo     33a <PR_BOOTABLE+0x2ba>
 33a:	6d                   	insl   (%dx),%es:(%edi)
 33b:	65 6d                	gs insl (%dx),%es:(%edi)
 33d:	5f                   	pop    %edi
 33e:	6c                   	insb   (%dx),%es:(%edi)
 33f:	6f                   	outsl  %ds:(%esi),(%dx)
 340:	77 65                	ja     3a7 <PR_BOOTABLE+0x327>
 342:	72 00                	jb     344 <PR_BOOTABLE+0x2c4>
 344:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 347:	74 61                	je     3aa <PR_BOOTABLE+0x32a>
 349:	62 6c 65 00          	bound  %ebp,0x0(%ebp,%eiz,2)
 34d:	73 79                	jae    3c8 <PR_BOOTABLE+0x348>
 34f:	6d                   	insl   (%dx),%es:(%edi)
 350:	73 00                	jae    352 <PR_BOOTABLE+0x2d2>
 352:	75 69                	jne    3bd <PR_BOOTABLE+0x33d>
 354:	6e                   	outsb  %ds:(%esi),(%dx)
 355:	74 31                	je     388 <PR_BOOTABLE+0x308>
 357:	36 5f                	ss pop %edi
 359:	74 00                	je     35b <PR_BOOTABLE+0x2db>
 35b:	6d                   	insl   (%dx),%es:(%edi)
 35c:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 35f:	74 5f                	je     3c0 <PR_BOOTABLE+0x340>
 361:	69 6e 66 6f 00 70 5f 	imul   $0x5f70006f,0x66(%esi),%ebp
 368:	76 61                	jbe    3cb <PR_BOOTABLE+0x34b>
 36a:	00 76 62             	add    %dh,0x62(%esi)
 36d:	65 5f                	gs pop %edi
 36f:	63 6f 6e             	arpl   %bp,0x6e(%edi)
 372:	74 72                	je     3e6 <PR_BOOTABLE+0x366>
 374:	6f                   	outsl  %ds:(%esi),(%dx)
 375:	6c                   	insb   (%dx),%es:(%edi)
 376:	5f                   	pop    %edi
 377:	69 6e 66 6f 00 70 5f 	imul   $0x5f70006f,0x66(%esi),%ebp
 37e:	66 6c                	data16 insb (%dx),%es:(%edi)
 380:	61                   	popa   
 381:	67 73 00             	addr16 jae 384 <PR_BOOTABLE+0x304>
 384:	70 61                	jo     3e7 <PR_BOOTABLE+0x367>
 386:	72 73                	jb     3fb <PR_BOOTABLE+0x37b>
 388:	65 5f                	gs pop %edi
 38a:	65 38 32             	cmp    %dh,%gs:(%edx)
 38d:	30 00                	xor    %al,(%eax)
 38f:	65 5f                	gs pop %edi
 391:	65 6c                	gs insb (%dx),%es:(%edi)
 393:	66 00 62 6f          	data16 add %ah,0x6f(%edx)
 397:	6f                   	outsl  %ds:(%esi),(%dx)
 398:	74 5f                	je     3f9 <PR_BOOTABLE+0x379>
 39a:	64 65 76 69          	fs gs jbe 407 <PR_BOOTABLE+0x387>
 39e:	63 65 00             	arpl   %sp,0x0(%ebp)
 3a1:	61                   	popa   
 3a2:	6f                   	outsl  %ds:(%esi),(%dx)
 3a3:	75 74                	jne    419 <PR_BOOTABLE+0x399>
 3a5:	00 64 6b 65          	add    %ah,0x65(%ebx,%ebp,2)
 3a9:	72 6e                	jb     419 <PR_BOOTABLE+0x399>
 3ab:	65 6c                	gs insb (%dx),%es:(%edi)
 3ad:	00 65 5f             	add    %ah,0x5f(%ebp)
 3b0:	70 68                	jo     41a <PR_BOOTABLE+0x39a>
 3b2:	6f                   	outsl  %ds:(%esi),(%dx)
 3b3:	66 66 00 63 6f       	data16 data16 add %ah,0x6f(%ebx)
 3b8:	6e                   	outsb  %ds:(%esi),(%dx)
 3b9:	66 69 67 5f 74 61    	imul   $0x6174,0x5f(%edi),%sp
 3bf:	62 6c 65 00          	bound  %ebp,0x0(%ebp,%eiz,2)
 3c3:	65 5f                	gs pop %edi
 3c5:	6d                   	insl   (%dx),%es:(%edi)
 3c6:	61                   	popa   
 3c7:	67 69 63 00 6c 61 73 	imul   $0x7473616c,0x0(%bp,%di),%esp
 3ce:	74 
 3cf:	5f                   	pop    %edi
 3d0:	63 68 73             	arpl   %bp,0x73(%eax)
 3d3:	00 62 61             	add    %ah,0x61(%edx)
 3d6:	73 65                	jae    43d <PR_BOOTABLE+0x3bd>
 3d8:	5f                   	pop    %edi
 3d9:	61                   	popa   
 3da:	64 64 72 00          	fs fs jb 3de <PR_BOOTABLE+0x35e>
 3de:	76 62                	jbe    442 <PR_BOOTABLE+0x3c2>
 3e0:	65 5f                	gs pop %edi
 3e2:	6d                   	insl   (%dx),%es:(%edi)
 3e3:	6f                   	outsl  %ds:(%esi),(%dx)
 3e4:	64 65 00 65 5f       	fs add %ah,%gs:0x5f(%ebp)
 3e9:	73 68                	jae    453 <PR_BOOTABLE+0x3d3>
 3eb:	6f                   	outsl  %ds:(%esi),(%dx)
 3ec:	66 66 00 6d 65       	data16 data16 add %ch,0x65(%ebp)
 3f1:	6d                   	insl   (%dx),%es:(%edi)
 3f2:	5f                   	pop    %edi
 3f3:	75 70                	jne    465 <PR_BOOTABLE+0x3e5>
 3f5:	70 65                	jo     45c <PR_BOOTABLE+0x3dc>
 3f7:	72 00                	jb     3f9 <PR_BOOTABLE+0x379>
 3f9:	76 62                	jbe    45d <PR_BOOTABLE+0x3dd>
 3fb:	65 5f                	gs pop %edi
 3fd:	6d                   	insl   (%dx),%es:(%edi)
 3fe:	6f                   	outsl  %ds:(%esi),(%dx)
 3ff:	64 65 5f             	fs gs pop %edi
 402:	69 6e 66 6f 00 74 61 	imul   $0x6174006f,0x66(%esi),%ebp
 409:	62 73 69             	bound  %esi,0x69(%ebx)
 40c:	7a 65                	jp     473 <PR_BOOTABLE+0x3f3>
 40e:	00 66 69             	add    %ah,0x69(%esi)
 411:	72 73                	jb     486 <PR_BOOTABLE+0x406>
 413:	74 5f                	je     474 <PR_BOOTABLE+0x3f4>
 415:	6c                   	insb   (%dx),%es:(%edi)
 416:	62 61 00             	bound  %esp,0x0(%ecx)
 419:	64 72 69             	fs jb  485 <PR_BOOTABLE+0x405>
 41c:	76 65                	jbe    483 <PR_BOOTABLE+0x403>
 41e:	73 5f                	jae    47f <PR_BOOTABLE+0x3ff>
 420:	6c                   	insb   (%dx),%es:(%edi)
 421:	65 6e                	outsb  %gs:(%esi),(%dx)
 423:	67 74 68             	addr16 je 48e <PR_BOOTABLE+0x40e>
 426:	00 70 5f             	add    %dh,0x5f(%eax)
 429:	66 69 6c 65 73 7a 00 	imul   $0x7a,0x73(%ebp,%eiz,2),%bp
 430:	65 5f                	gs pop %edi
 432:	70 68                	jo     49c <PR_BOOTABLE+0x41c>
 434:	6e                   	outsb  %ds:(%esi),(%dx)
 435:	75 6d                	jne    4a4 <PR_BOOTABLE+0x424>
 437:	00 73 69             	add    %dh,0x69(%ebx)
 43a:	67 6e                	outsb  %ds:(%si),(%dx)
 43c:	61                   	popa   
 43d:	74 75                	je     4b4 <PR_BOOTABLE+0x434>
 43f:	72 65                	jb     4a6 <PR_BOOTABLE+0x426>
 441:	00 65 5f             	add    %ah,0x5f(%ebp)
 444:	73 68                	jae    4ae <PR_BOOTABLE+0x42e>
 446:	6e                   	outsb  %ds:(%esi),(%dx)
 447:	75 6d                	jne    4b6 <PR_BOOTABLE+0x436>
 449:	00 76 62             	add    %dh,0x62(%esi)
 44c:	65 5f                	gs pop %edi
 44e:	69 6e 74 65 72 66 61 	imul   $0x61667265,0x74(%esi),%ebp
 455:	63 65 5f             	arpl   %sp,0x5f(%ebp)
 458:	6c                   	insb   (%dx),%es:(%edi)
 459:	65 6e                	outsb  %gs:(%esi),(%dx)
 45b:	00 62 6f             	add    %ah,0x6f(%edx)
 45e:	6f                   	outsl  %ds:(%esi),(%dx)
 45f:	74 2f                	je     490 <PR_BOOTABLE+0x410>
 461:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 464:	74 31                	je     497 <PR_BOOTABLE+0x417>
 466:	2f                   	das    
 467:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 46a:	74 31                	je     49d <PR_BOOTABLE+0x41d>
 46c:	6d                   	insl   (%dx),%es:(%edi)
 46d:	61                   	popa   
 46e:	69 6e 2e 63 00 6d 6f 	imul   $0x6f6d0063,0x2e(%esi),%ebp
 475:	64 73 5f             	fs jae 4d7 <PR_BOOTABLE+0x457>
 478:	63 6f 75             	arpl   %bp,0x75(%edi)
 47b:	6e                   	outsb  %ds:(%esi),(%dx)
 47c:	74 00                	je     47e <PR_BOOTABLE+0x3fe>
 47e:	5f                   	pop    %edi
 47f:	72 65                	jb     4e6 <PR_BOOTABLE+0x466>
 481:	73 65                	jae    4e8 <PR_BOOTABLE+0x468>
 483:	72 76                	jb     4fb <PR_BOOTABLE+0x47b>
 485:	65 64 00 62 6f       	gs add %ah,%fs:0x6f(%edx)
 48a:	6f                   	outsl  %ds:(%esi),(%dx)
 48b:	74 5f                	je     4ec <PR_BOOTABLE+0x46c>
 48d:	6c                   	insb   (%dx),%es:(%edi)
 48e:	6f                   	outsl  %ds:(%esi),(%dx)
 48f:	61                   	popa   
 490:	64 65 72 5f          	fs gs jb 4f3 <PR_BOOTABLE+0x473>
 494:	6e                   	outsb  %ds:(%esi),(%dx)
 495:	61                   	popa   
 496:	6d                   	insl   (%dx),%es:(%edi)
 497:	65 00 76 62          	add    %dh,%gs:0x62(%esi)
 49b:	65 5f                	gs pop %edi
 49d:	69 6e 74 65 72 66 61 	imul   $0x61667265,0x74(%esi),%ebp
 4a4:	63 65 5f             	arpl   %sp,0x5f(%ebp)
 4a7:	73 65                	jae    50e <PR_BOOTABLE+0x48e>
 4a9:	67 00 6d 6d          	add    %ch,0x6d(%di)
 4ad:	61                   	popa   
 4ae:	70 5f                	jo     50f <PR_BOOTABLE+0x48f>
 4b0:	6c                   	insb   (%dx),%es:(%edi)
 4b1:	65 6e                	outsb  %gs:(%esi),(%dx)
 4b3:	00 70 5f             	add    %dh,0x5f(%eax)
 4b6:	61                   	popa   
 4b7:	6c                   	insb   (%dx),%es:(%edi)
 4b8:	69 67 6e 00 61 70 6d 	imul   $0x6d706100,0x6e(%edi),%esp
 4bf:	5f                   	pop    %edi
 4c0:	74 61                	je     523 <PR_BOOTABLE+0x4a3>
 4c2:	62 6c 65 00          	bound  %ebp,0x0(%ebp,%eiz,2)
 4c6:	70 5f                	jo     527 <PR_BOOTABLE+0x4a7>
 4c8:	70 61                	jo     52b <PR_BOOTABLE+0x4ab>
 4ca:	00 73 65             	add    %dh,0x65(%ebx)
 4cd:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
 4d1:	73 5f                	jae    532 <PR_BOOTABLE+0x4b2>
 4d3:	63 6f 75             	arpl   %bp,0x75(%edi)
 4d6:	6e                   	outsb  %ds:(%esi),(%dx)
 4d7:	74 00                	je     4d9 <PR_BOOTABLE+0x459>

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	11 02                	adc    %eax,(%edx)
   2:	00 00                	add    %al,(%eax)
   4:	1a 02                	sbb    (%edx),%al
   6:	00 00                	add    %al,(%eax)
   8:	02 00                	add    (%eax),%al
   a:	91                   	xchg   %eax,%ecx
   b:	00 1a                	add    %bl,(%edx)
   d:	02 00                	add    (%eax),%al
   f:	00 2b                	add    %ch,(%ebx)
  11:	02 00                	add    (%eax),%al
  13:	00 0a                	add    %cl,(%edx)
  15:	00 91 00 06 0c ff    	add    %dl,-0xf3fa00(%ecx)
  1b:	ff                   	(bad)  
  1c:	ff 00                	incl   (%eax)
  1e:	1a 9f 2b 02 00 00    	sbb    0x22b(%edi),%bl
  24:	31 02                	xor    %eax,(%edx)
  26:	00 00                	add    %al,(%eax)
  28:	01 00                	add    %eax,(%eax)
  2a:	56                   	push   %esi
  2b:	31 02                	xor    %eax,(%edx)
  2d:	00 00                	add    %al,(%eax)
  2f:	41                   	inc    %ecx
  30:	02 00                	add    (%eax),%al
  32:	00 01                	add    %al,(%ecx)
  34:	00 53 41             	add    %dl,0x41(%ebx)
  37:	02 00                	add    (%eax),%al
  39:	00 45 02             	add    %al,0x2(%ebp)
  3c:	00 00                	add    %al,(%eax)
  3e:	02 00                	add    (%eax),%al
  40:	74 00                	je     42 <PROT_MODE_DSEG+0x32>
  42:	45                   	inc    %ebp
  43:	02 00                	add    (%eax),%al
  45:	00 46 02             	add    %al,0x2(%esi)
  48:	00 00                	add    %al,(%eax)
  4a:	04 00                	add    $0x0,%al
  4c:	73 80                	jae    ffffffce <SMAP_SIG+0xacb2be7e>
  4e:	7c 9f                	jl     ffffffef <SMAP_SIG+0xacb2be9f>
  50:	46                   	inc    %esi
  51:	02 00                	add    (%eax),%al
  53:	00 4e 02             	add    %cl,0x2(%esi)
  56:	00 00                	add    %al,(%eax)
  58:	01 00                	add    %eax,(%eax)
  5a:	53                   	push   %ebx
  5b:	00 00                	add    %al,(%eax)
  5d:	00 00                	add    %al,(%eax)
  5f:	00 00                	add    %al,(%eax)
  61:	00 00                	add    %al,(%eax)
  63:	11 02                	adc    %eax,(%edx)
  65:	00 00                	add    %al,(%eax)
  67:	34 02                	xor    $0x2,%al
  69:	00 00                	add    %al,(%eax)
  6b:	02 00                	add    (%eax),%al
  6d:	91                   	xchg   %eax,%ecx
  6e:	08 34 02             	or     %dh,(%edx,%eax,1)
  71:	00 00                	add    %al,(%eax)
  73:	3b 02                	cmp    (%edx),%eax
  75:	00 00                	add    %al,(%eax)
  77:	01 00                	add    %eax,(%eax)
  79:	57                   	push   %edi
  7a:	3b 02                	cmp    (%edx),%eax
  7c:	00 00                	add    %al,(%eax)
  7e:	45                   	inc    %ebp
  7f:	02 00                	add    (%eax),%al
  81:	00 02                	add    %al,(%edx)
  83:	00 74 04 45          	add    %dh,0x45(%esp,%eax,1)
  87:	02 00                	add    (%eax),%al
  89:	00 46 02             	add    %al,0x2(%esi)
  8c:	00 00                	add    %al,(%eax)
  8e:	03 00                	add    (%eax),%eax
  90:	77 7f                	ja     111 <PR_BOOTABLE+0x91>
  92:	9f                   	lahf   
  93:	46                   	inc    %esi
  94:	02 00                	add    (%eax),%al
  96:	00 50 02             	add    %dl,0x2(%eax)
  99:	00 00                	add    %al,(%eax)
  9b:	01 00                	add    %eax,(%eax)
  9d:	57                   	push   %edi
  9e:	00 00                	add    %al,(%eax)
  a0:	00 00                	add    %al,(%eax)
  a2:	00 00                	add    %al,(%eax)
  a4:	00 00                	add    %al,(%eax)
  a6:	31 02                	xor    %eax,(%edx)
  a8:	00 00                	add    %al,(%eax)
  aa:	4f                   	dec    %edi
  ab:	02 00                	add    (%eax),%al
  ad:	00 01                	add    %al,(%ecx)
  af:	00 56 4f             	add    %dl,0x4f(%esi)
  b2:	02 00                	add    (%eax),%al
  b4:	00 52 02             	add    %dl,0x2(%edx)
  b7:	00 00                	add    %al,(%eax)
  b9:	0e                   	push   %cs
  ba:	00 91 00 06 0c ff    	add    %dl,-0xf3fa00(%ecx)
  c0:	ff                   	(bad)  
  c1:	ff 00                	incl   (%eax)
  c3:	1a 91 04 06 22 9f    	sbb    -0x60ddf9fc(%ecx),%dl
  c9:	00 00                	add    %al,(%eax)
  cb:	00 00                	add    %al,(%eax)
  cd:	00 00                	add    %al,(%eax)
  cf:	00 00                	add    %al,(%eax)
  d1:	b2 01                	mov    $0x1,%dl
  d3:	00 00                	add    %al,(%eax)
  d5:	b3 01                	mov    $0x1,%bl
  d7:	00 00                	add    %al,(%eax)
  d9:	04 00                	add    $0x0,%al
  db:	0a f7                	or     %bh,%dh
  dd:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
  e3:	00 00                	add    %al,(%eax)
  e5:	00 00                	add    %al,(%eax)
  e7:	ba 01 00 00 c2       	mov    $0xc2000001,%edx
  ec:	01 00                	add    %eax,(%eax)
  ee:	00 02                	add    %al,(%edx)
  f0:	00 31                	add    %dh,(%ecx)
  f2:	9f                   	lahf   
  f3:	00 00                	add    %al,(%eax)
  f5:	00 00                	add    %al,(%eax)
  f7:	00 00                	add    %al,(%eax)
  f9:	00 00                	add    %al,(%eax)
  fb:	ba 01 00 00 c2       	mov    $0xc2000001,%edx
 100:	01 00                	add    %eax,(%eax)
 102:	00 04 00             	add    %al,(%eax,%eax,1)
 105:	0a f2                	or     %dl,%dh
 107:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 10d:	00 00                	add    %al,(%eax)
 10f:	00 00                	add    %al,(%eax)
 111:	c2 01 00             	ret    $0x1
 114:	00 ca                	add    %cl,%dl
 116:	01 00                	add    %eax,(%eax)
 118:	00 01                	add    %al,(%ecx)
 11a:	00 51 00             	add    %dl,0x0(%ecx)
 11d:	00 00                	add    %al,(%eax)
 11f:	00 00                	add    %al,(%eax)
 121:	00 00                	add    %al,(%eax)
 123:	00 c2                	add    %al,%dl
 125:	01 00                	add    %eax,(%eax)
 127:	00 ca                	add    %cl,%dl
 129:	01 00                	add    %eax,(%eax)
 12b:	00 04 00             	add    %al,(%eax,%eax,1)
 12e:	0a f3                	or     %bl,%dh
 130:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 136:	00 00                	add    %al,(%eax)
 138:	00 00                	add    %al,(%eax)
 13a:	ca 01 00             	lret   $0x1
 13d:	00 d5                	add    %dl,%ch
 13f:	01 00                	add    %eax,(%eax)
 141:	00 02                	add    %al,(%edx)
 143:	00 91 05 00 00 00    	add    %dl,0x5(%ecx)
 149:	00 00                	add    %al,(%eax)
 14b:	00 00                	add    %al,(%eax)
 14d:	00 ca                	add    %cl,%dl
 14f:	01 00                	add    %eax,(%eax)
 151:	00 d5                	add    %dl,%ch
 153:	01 00                	add    %eax,(%eax)
 155:	00 04 00             	add    %al,(%eax,%eax,1)
 158:	0a f4                	or     %ah,%dh
 15a:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 160:	00 00                	add    %al,(%eax)
 162:	00 00                	add    %al,(%eax)
 164:	d5 01                	aad    $0x1
 166:	00 00                	add    %al,(%eax)
 168:	e0 01                	loopne 16b <PR_BOOTABLE+0xeb>
 16a:	00 00                	add    %al,(%eax)
 16c:	02 00                	add    (%eax),%al
 16e:	91                   	xchg   %eax,%ecx
 16f:	06                   	push   %es
 170:	00 00                	add    %al,(%eax)
 172:	00 00                	add    %al,(%eax)
 174:	00 00                	add    %al,(%eax)
 176:	00 00                	add    %al,(%eax)
 178:	d5 01                	aad    $0x1
 17a:	00 00                	add    %al,(%eax)
 17c:	e0 01                	loopne 17f <PR_BOOTABLE+0xff>
 17e:	00 00                	add    %al,(%eax)
 180:	04 00                	add    $0x0,%al
 182:	0a f5                	or     %ch,%dh
 184:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 18a:	00 00                	add    %al,(%eax)
 18c:	00 00                	add    %al,(%eax)
 18e:	e0 01                	loopne 191 <PR_BOOTABLE+0x111>
 190:	00 00                	add    %al,(%eax)
 192:	ee                   	out    %al,(%dx)
 193:	01 00                	add    %eax,(%eax)
 195:	00 08                	add    %cl,(%eax)
 197:	00 91 07 94 01 09    	add    %dl,0x9019407(%ecx)
 19d:	e0 21                	loopne 1c0 <PR_BOOTABLE+0x140>
 19f:	9f                   	lahf   
 1a0:	00 00                	add    %al,(%eax)
 1a2:	00 00                	add    %al,(%eax)
 1a4:	00 00                	add    %al,(%eax)
 1a6:	00 00                	add    %al,(%eax)
 1a8:	e0 01                	loopne 1ab <PR_BOOTABLE+0x12b>
 1aa:	00 00                	add    %al,(%eax)
 1ac:	ee                   	out    %al,(%dx)
 1ad:	01 00                	add    %eax,(%eax)
 1af:	00 04 00             	add    %al,(%eax,%eax,1)
 1b2:	0a f6                	or     %dh,%dh
 1b4:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 1ba:	00 00                	add    %al,(%eax)
 1bc:	00 00                	add    %al,(%eax)
 1be:	ee                   	out    %al,(%dx)
 1bf:	01 00                	add    %eax,(%eax)
 1c1:	00 f6                	add    %dh,%dh
 1c3:	01 00                	add    %eax,(%eax)
 1c5:	00 03                	add    %al,(%ebx)
 1c7:	00 08                	add    %cl,(%eax)
 1c9:	20 9f 00 00 00 00    	and    %bl,0x0(%edi)
 1cf:	00 00                	add    %al,(%eax)
 1d1:	00 00                	add    %al,(%eax)
 1d3:	ee                   	out    %al,(%dx)
 1d4:	01 00                	add    %eax,(%eax)
 1d6:	00 f6                	add    %dh,%dh
 1d8:	01 00                	add    %eax,(%eax)
 1da:	00 04 00             	add    %al,(%eax,%eax,1)
 1dd:	0a f7                	or     %bh,%dh
 1df:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 1e5:	00 00                	add    %al,(%eax)
 1e7:	00 00                	add    %al,(%eax)
 1e9:	f6 01 00             	testb  $0x0,(%ecx)
 1ec:	00 f7                	add    %dh,%bh
 1ee:	01 00                	add    %eax,(%eax)
 1f0:	00 04 00             	add    %al,(%eax,%eax,1)
 1f3:	0a f7                	or     %bh,%dh
 1f5:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 1fb:	00 00                	add    %al,(%eax)
 1fd:	00 00                	add    %al,(%eax)
 1ff:	fe 01                	incb   (%ecx)
 201:	00 00                	add    %al,(%eax)
 203:	0e                   	push   %cs
 204:	02 00                	add    (%eax),%al
 206:	00 03                	add    %al,(%ebx)
 208:	00 08                	add    %cl,(%eax)
 20a:	80 9f 00 00 00 00 00 	sbbb   $0x0,0x0(%edi)
 211:	00 00                	add    %al,(%eax)
 213:	00 fe                	add    %bh,%dh
 215:	01 00                	add    %eax,(%eax)
 217:	00 0e                	add    %cl,(%esi)
 219:	02 00                	add    (%eax),%al
 21b:	00 02                	add    %al,(%edx)
 21d:	00 91 00 00 00 00    	add    %dl,0x0(%ecx)
 223:	00 00                	add    %al,(%eax)
 225:	00 00                	add    %al,(%eax)
 227:	00 fe                	add    %bh,%dh
 229:	01 00                	add    %eax,(%eax)
 22b:	00 0e                	add    %cl,(%esi)
 22d:	02 00                	add    (%eax),%al
 22f:	00 04 00             	add    %al,(%eax,%eax,1)
 232:	0a f0                	or     %al,%dh
 234:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 23a:	00 00                	add    %al,(%eax)
 23c:	00 00                	add    %al,(%eax)
 23e:	f2 00 00             	repnz add %al,(%eax)
 241:	00 1c 01             	add    %bl,(%ecx,%eax,1)
 244:	00 00                	add    %al,(%eax)
 246:	02 00                	add    (%eax),%al
 248:	91                   	xchg   %eax,%ecx
 249:	00 1c 01             	add    %bl,(%ecx,%eax,1)
 24c:	00 00                	add    %al,(%eax)
 24e:	49                   	dec    %ecx
 24f:	01 00                	add    %eax,(%eax)
 251:	00 01                	add    %al,(%ecx)
 253:	00 50 00             	add    %dl,0x0(%eax)
 256:	00 00                	add    %al,(%eax)
 258:	00 00                	add    %al,(%eax)
 25a:	00 00                	add    %al,(%eax)
 25c:	00 1c 01             	add    %bl,(%ecx,%eax,1)
 25f:	00 00                	add    %al,(%eax)
 261:	20 01                	and    %al,(%ecx)
 263:	00 00                	add    %al,(%eax)
 265:	01 00                	add    %eax,(%eax)
 267:	56                   	push   %esi
 268:	20 01                	and    %al,(%ecx)
 26a:	00 00                	add    %al,(%eax)
 26c:	34 01                	xor    $0x1,%al
 26e:	00 00                	add    %al,(%eax)
 270:	01 00                	add    %eax,(%eax)
 272:	51                   	push   %ecx
 273:	34 01                	xor    $0x1,%al
 275:	00 00                	add    %al,(%eax)
 277:	3d 01 00 00 01       	cmp    $0x1000001,%eax
 27c:	00 52 3d             	add    %dl,0x3d(%edx)
 27f:	01 00                	add    %eax,(%eax)
 281:	00 52 01             	add    %dl,0x1(%edx)
 284:	00 00                	add    %al,(%eax)
 286:	01 00                	add    %eax,(%eax)
 288:	51                   	push   %ecx
 289:	00 00                	add    %al,(%eax)
 28b:	00 00                	add    %al,(%eax)
 28d:	00 00                	add    %al,(%eax)
 28f:	00 00                	add    %al,(%eax)
 291:	f5                   	cmc    
 292:	00 00                	add    %al,(%eax)
 294:	00 09                	add    %cl,(%ecx)
 296:	01 00                	add    %eax,(%eax)
 298:	00 02                	add    %al,(%edx)
 29a:	00 91 68 00 00 00    	add    %dl,0x68(%ecx)
 2a0:	00 00                	add    %al,(%eax)
 2a2:	00 00                	add    %al,(%eax)
 2a4:	00 c5                	add    %al,%ch
 2a6:	00 00                	add    %al,(%eax)
 2a8:	00 d7                	add    %dl,%bh
 2aa:	00 00                	add    %al,(%eax)
 2ac:	00 02                	add    %al,(%edx)
 2ae:	00 30                	add    %dh,(%eax)
 2b0:	9f                   	lahf   
 2b1:	d7                   	xlat   %ds:(%ebx)
 2b2:	00 00                	add    %al,(%eax)
 2b4:	00 f2                	add    %dh,%dl
 2b6:	00 00                	add    %al,(%eax)
 2b8:	00 01                	add    %al,(%ecx)
 2ba:	00 52 00             	add    %dl,0x0(%edx)
 2bd:	00 00                	add    %al,(%eax)
 2bf:	00 00                	add    %al,(%eax)
 2c1:	00 00                	add    %al,(%eax)
 2c3:	00 de                	add    %bl,%dh
 2c5:	00 00                	add    %al,(%eax)
 2c7:	00 eb                	add    %ch,%bl
 2c9:	00 00                	add    %al,(%eax)
 2cb:	00 01                	add    %al,(%ecx)
 2cd:	00 53 00             	add    %dl,0x0(%ebx)
 2d0:	00 00                	add    %al,(%eax)
 2d2:	00 00                	add    %al,(%eax)
 2d4:	00 00                	add    %al,(%eax)
 2d6:	00 b2 00 00 00 ba    	add    %dh,-0x46000000(%edx)
 2dc:	00 00                	add    %al,(%eax)
 2de:	00 02                	add    %al,(%edx)
 2e0:	00 91 00 ba 00 00    	add    %dl,0xba00(%ecx)
 2e6:	00 c5                	add    %al,%ch
 2e8:	00 00                	add    %al,(%eax)
 2ea:	00 07                	add    %al,(%edi)
 2ec:	00 91 00 06 70 00    	add    %dl,0x700600(%ecx)
 2f2:	22 9f 00 00 00 00    	and    0x0(%edi),%bl
 2f8:	00 00                	add    %al,(%eax)
 2fa:	00 00                	add    %al,(%eax)
 2fc:	b2 00                	mov    $0x0,%dl
 2fe:	00 00                	add    %al,(%eax)
 300:	ba 00 00 00 02       	mov    $0x2000000,%edx
 305:	00 30                	add    %dh,(%eax)
 307:	9f                   	lahf   
 308:	ba 00 00 00 c5       	mov    $0xc5000000,%edx
 30d:	00 00                	add    %al,(%eax)
 30f:	00 01                	add    %al,(%ecx)
 311:	00 50 00             	add    %dl,0x0(%eax)
 314:	00 00                	add    %al,(%eax)
 316:	00 00                	add    %al,(%eax)
 318:	00 00                	add    %al,(%eax)
 31a:	00 87 01 00 00 a0    	add    %al,-0x5fffffff(%edi)
 320:	01 00                	add    %eax,(%eax)
 322:	00 02                	add    %al,(%edx)
 324:	00 91 00 00 00 00    	add    %dl,0x0(%ecx)
 32a:	00 00                	add    %al,(%eax)
 32c:	00 00                	add    %al,(%eax)
 32e:	00 1b                	add    %bl,(%ebx)
 330:	00 00                	add    %al,(%eax)
 332:	00 2b                	add    %ch,(%ebx)
 334:	00 00                	add    %al,(%eax)
 336:	00 02                	add    %al,(%edx)
 338:	00 91 0c 2b 00 00    	add    %dl,0x2b0c(%ecx)
 33e:	00 33                	add    %dh,(%ebx)
 340:	00 00                	add    %al,(%eax)
 342:	00 12                	add    %dl,(%edx)
 344:	00 91 0c 06 91 00    	add    %dl,0x91060c(%ecx)
 34a:	06                   	push   %es
 34b:	08 50 1e             	or     %dl,0x1e(%eax)
 34e:	1c 70                	sbb    $0x70,%al
 350:	00 22                	add    %ah,(%edx)
 352:	91                   	xchg   %eax,%ecx
 353:	04 06                	add    $0x6,%al
 355:	1c 9f                	sbb    $0x9f,%al
 357:	33 00                	xor    (%eax),%eax
 359:	00 00                	add    %al,(%eax)
 35b:	3f                   	aas    
 35c:	00 00                	add    %al,(%eax)
 35e:	00 14 00             	add    %dl,(%eax,%eax,1)
 361:	91                   	xchg   %eax,%ecx
 362:	0c 06                	or     $0x6,%al
 364:	91                   	xchg   %eax,%ecx
 365:	00 06                	add    %al,(%esi)
 367:	08 50 1e             	or     %dl,0x1e(%eax)
 36a:	1c 91                	sbb    $0x91,%al
 36c:	04 06                	add    $0x6,%al
 36e:	1c 70                	sbb    $0x70,%al
 370:	00 22                	add    %ah,(%edx)
 372:	23 01                	and    (%ecx),%eax
 374:	9f                   	lahf   
 375:	3f                   	aas    
 376:	00 00                	add    %al,(%eax)
 378:	00 47 00             	add    %al,0x0(%edi)
 37b:	00 00                	add    %al,(%eax)
 37d:	12 00                	adc    (%eax),%al
 37f:	91                   	xchg   %eax,%ecx
 380:	0c 06                	or     $0x6,%al
 382:	91                   	xchg   %eax,%ecx
 383:	00 06                	add    %al,(%esi)
 385:	08 50 1e             	or     %dl,0x1e(%eax)
 388:	1c 91                	sbb    $0x91,%al
 38a:	04 06                	add    $0x6,%al
 38c:	1c 73                	sbb    $0x73,%al
 38e:	00 22                	add    %ah,(%edx)
 390:	9f                   	lahf   
 391:	47                   	inc    %edi
 392:	00 00                	add    %al,(%eax)
 394:	00 4c 00 00          	add    %cl,0x0(%eax,%eax,1)
 398:	00 12                	add    %dl,(%edx)
 39a:	00 91 0c 06 91 00    	add    %dl,0x91060c(%ecx)
 3a0:	06                   	push   %es
 3a1:	08 50 1e             	or     %dl,0x1e(%eax)
 3a4:	1c 70                	sbb    $0x70,%al
 3a6:	00 22                	add    %ah,(%edx)
 3a8:	91                   	xchg   %eax,%ecx
 3a9:	04 06                	add    $0x6,%al
 3ab:	1c 9f                	sbb    $0x9f,%al
 3ad:	00 00                	add    %al,(%eax)
 3af:	00 00                	add    %al,(%eax)
 3b1:	00 00                	add    %al,(%eax)
 3b3:	00 00                	add    %al,(%eax)
 3b5:	23 00                	and    (%eax),%eax
 3b7:	00 00                	add    %al,(%eax)
 3b9:	29 00                	sub    %eax,(%eax)
 3bb:	00 00                	add    %al,(%eax)
 3bd:	07                   	pop    %es
 3be:	00 70 00             	add    %dh,0x0(%eax)
 3c1:	91                   	xchg   %eax,%ecx
 3c2:	04 06                	add    $0x6,%al
 3c4:	22 9f 29 00 00 00    	and    0x29(%edi),%bl
 3ca:	37                   	aaa    
 3cb:	00 00                	add    %al,(%eax)
 3cd:	00 01                	add    %al,(%ecx)
 3cf:	00 50 37             	add    %dl,0x37(%eax)
 3d2:	00 00                	add    %al,(%eax)
 3d4:	00 47 00             	add    %al,0x0(%edi)
 3d7:	00 00                	add    %al,(%eax)
 3d9:	01 00                	add    %eax,(%eax)
 3db:	53                   	push   %ebx
 3dc:	47                   	inc    %edi
 3dd:	00 00                	add    %al,(%eax)
 3df:	00 4c 00 00          	add    %cl,0x0(%eax,%eax,1)
 3e3:	00 01                	add    %al,(%ecx)
 3e5:	00 50 00             	add    %dl,0x0(%eax)
 3e8:	00 00                	add    %al,(%eax)
 3ea:	00 00                	add    %al,(%eax)
 3ec:	00 00                	add    %al,(%eax)
 3ee:	00 89 00 00 00 9b    	add    %cl,-0x65000000(%ecx)
 3f4:	00 00                	add    %al,(%eax)
 3f6:	00 02                	add    %al,(%edx)
 3f8:	00 91 00 9b 00 00    	add    %dl,0x9b00(%ecx)
 3fe:	00 ad 00 00 00 07    	add    %ch,0x7000000(%ebp)
 404:	00 91 00 06 73 00    	add    %dl,0x730600(%ecx)
 40a:	22 9f ad 00 00 00    	and    0xad(%edi),%bl
 410:	b3 00                	mov    $0x0,%bl
 412:	00 00                	add    %al,(%eax)
 414:	09 00                	or     %eax,(%eax)
 416:	91                   	xchg   %eax,%ecx
 417:	00 06                	add    %al,(%esi)
 419:	73 00                	jae    41b <PR_BOOTABLE+0x39b>
 41b:	22 48 1c             	and    0x1c(%eax),%cl
 41e:	9f                   	lahf   
 41f:	b8 00 00 00 de       	mov    $0xde000000,%eax
 424:	00 00                	add    %al,(%eax)
 426:	00 07                	add    %al,(%edi)
 428:	00 91 00 06 73 00    	add    %dl,0x730600(%ecx)
 42e:	22 9f de 00 00 00    	and    0xde(%edi),%bl
 434:	e1 00                	loope  436 <PR_BOOTABLE+0x3b6>
 436:	00 00                	add    %al,(%eax)
 438:	0b 00                	or     (%eax),%eax
 43a:	91                   	xchg   %eax,%ecx
 43b:	00 06                	add    %al,(%esi)
 43d:	03 cc                	add    %esp,%ecx
 43f:	92                   	xchg   %eax,%edx
 440:	00 00                	add    %al,(%eax)
 442:	06                   	push   %es
 443:	22 9f 00 00 00 00    	and    0x0(%edi),%bl
 449:	00 00                	add    %al,(%eax)
 44b:	00 00                	add    %al,(%eax)
 44d:	89 00                	mov    %eax,(%eax)
 44f:	00 00                	add    %al,(%eax)
 451:	9b                   	fwait
 452:	00 00                	add    %al,(%eax)
 454:	00 02                	add    %al,(%edx)
 456:	00 30                	add    %dh,(%eax)
 458:	9f                   	lahf   
 459:	9b                   	fwait
 45a:	00 00                	add    %al,(%eax)
 45c:	00 ad 00 00 00 01    	add    %ch,0x1000000(%ebp)
 462:	00 53 ad             	add    %dl,-0x53(%ebx)
 465:	00 00                	add    %al,(%eax)
 467:	00 b3 00 00 00 03    	add    %dh,0x3000000(%ebx)
 46d:	00 73 68             	add    %dh,0x68(%ebx)
 470:	9f                   	lahf   
 471:	b3 00                	mov    $0x0,%bl
 473:	00 00                	add    %al,(%eax)
 475:	de 00                	fiadd  (%eax)
 477:	00 00                	add    %al,(%eax)
 479:	01 00                	add    %eax,(%eax)
 47b:	53                   	push   %ebx
 47c:	de 00                	fiadd  (%eax)
 47e:	00 00                	add    %al,(%eax)
 480:	e1 00                	loope  482 <PR_BOOTABLE+0x402>
 482:	00 00                	add    %al,(%eax)
 484:	05 00 03 cc 92       	add    $0x92cc0300,%eax
 489:	00 00                	add    %al,(%eax)
 48b:	00 00                	add    %al,(%eax)
 48d:	00 00                	add    %al,(%eax)
 48f:	00 00                	add    %al,(%eax)
 491:	00 00                	add    %al,(%eax)
 493:	4f                   	dec    %edi
 494:	00 00                	add    %al,(%eax)
 496:	00 5f 00             	add    %bl,0x0(%edi)
 499:	00 00                	add    %al,(%eax)
 49b:	01 00                	add    %eax,(%eax)
 49d:	53                   	push   %ebx
 49e:	5f                   	pop    %edi
 49f:	00 00                	add    %al,(%eax)
 4a1:	00 6a 00             	add    %ch,0x0(%edx)
 4a4:	00 00                	add    %al,(%eax)
 4a6:	03 00                	add    (%eax),%eax
 4a8:	73 60                	jae    50a <PR_BOOTABLE+0x48a>
 4aa:	9f                   	lahf   
 4ab:	6a 00                	push   $0x0
 4ad:	00 00                	add    %al,(%eax)
 4af:	78 00                	js     4b1 <PR_BOOTABLE+0x431>
 4b1:	00 00                	add    %al,(%eax)
 4b3:	01 00                	add    %eax,(%eax)
 4b5:	53                   	push   %ebx
 4b6:	00 00                	add    %al,(%eax)
 4b8:	00 00                	add    %al,(%eax)
 4ba:	00 00                	add    %al,(%eax)
 4bc:	00 00                	add    %al,(%eax)
 4be:	54                   	push   %esp
 4bf:	00 00                	add    %al,(%eax)
 4c1:	00 7e 00             	add    %bh,0x0(%esi)
 4c4:	00 00                	add    %al,(%eax)
 4c6:	01 00                	add    %eax,(%eax)
 4c8:	56                   	push   %esi
 4c9:	00 00                	add    %al,(%eax)
 4cb:	00 00                	add    %al,(%eax)
 4cd:	00 00                	add    %al,(%eax)
 4cf:	00 00                	add    %al,(%eax)
 4d1:	e1 00                	loope  4d3 <PR_BOOTABLE+0x453>
 4d3:	00 00                	add    %al,(%eax)
 4d5:	79 01                	jns    4d8 <PR_BOOTABLE+0x458>
 4d7:	00 00                	add    %al,(%eax)
 4d9:	02 00                	add    (%eax),%al
 4db:	91                   	xchg   %eax,%ecx
 4dc:	00 00                	add    %al,(%eax)
 4de:	00 00                	add    %al,(%eax)
 4e0:	00 00                	add    %al,(%eax)
 4e2:	00 00                	add    %al,(%eax)
 4e4:	00 02                	add    %al,(%edx)
 4e6:	01 00                	add    %eax,(%eax)
 4e8:	00 07                	add    %al,(%edi)
 4ea:	01 00                	add    %eax,(%eax)
 4ec:	00 02                	add    %al,(%edx)
 4ee:	00 30                	add    %dh,(%eax)
 4f0:	9f                   	lahf   
 4f1:	07                   	pop    %es
 4f2:	01 00                	add    %eax,(%eax)
 4f4:	00 19                	add    %bl,(%ecx)
 4f6:	01 00                	add    %eax,(%eax)
 4f8:	00 01                	add    %al,(%ecx)
 4fa:	00 50 19             	add    %dl,0x19(%eax)
 4fd:	01 00                	add    %eax,(%eax)
 4ff:	00 1c 01             	add    %bl,(%ecx,%eax,1)
 502:	00 00                	add    %al,(%eax)
 504:	03 00                	add    (%eax),%eax
 506:	70 65                	jo     56d <PR_BOOTABLE+0x4ed>
 508:	9f                   	lahf   
 509:	22 01                	and    (%ecx),%al
 50b:	00 00                	add    %al,(%eax)
 50d:	36 01 00             	add    %eax,%ss:(%eax)
 510:	00 01                	add    %al,(%ecx)
 512:	00 50 00             	add    %dl,0x0(%eax)
 515:	00 00                	add    %al,(%eax)
 517:	00 00                	add    %al,(%eax)
 519:	00 00                	add    %al,(%eax)
 51b:	00 02                	add    %al,(%edx)
 51d:	01 00                	add    %eax,(%eax)
 51f:	00 20                	add    %ah,(%eax)
 521:	01 00                	add    %eax,(%eax)
 523:	00 02                	add    %al,(%edx)
 525:	00 30                	add    %dh,(%eax)
 527:	9f                   	lahf   
 528:	20 01                	and    %al,(%ecx)
 52a:	00 00                	add    %al,(%eax)
 52c:	22 01                	and    (%ecx),%al
 52e:	00 00                	add    %al,(%eax)
 530:	01 00                	add    %eax,(%eax)
 532:	56                   	push   %esi
 533:	22 01                	and    (%ecx),%al
 535:	00 00                	add    %al,(%eax)
 537:	3a 01                	cmp    (%ecx),%al
 539:	00 00                	add    %al,(%eax)
 53b:	02 00                	add    (%eax),%al
 53d:	30 9f 00 00 00 00    	xor    %bl,0x0(%edi)
 543:	00 00                	add    %al,(%eax)
 545:	00 00                	add    %al,(%eax)
 547:	60                   	pusha  
 548:	01 00                	add    %eax,(%eax)
 54a:	00 64 01 00          	add    %ah,0x0(%ecx,%eax,1)
 54e:	00 01                	add    %al,(%ecx)
 550:	00 50 64             	add    %dl,0x64(%eax)
 553:	01 00                	add    %eax,(%eax)
 555:	00 80 01 00 00 01    	add    %al,0x1000001(%eax)
 55b:	00 53 00             	add    %dl,0x0(%ebx)
 55e:	00 00                	add    %al,(%eax)
 560:	00 00                	add    %al,(%eax)
 562:	00 00                	add    %al,(%eax)
 564:	00                   	.byte 0x0

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
   1:	01 00                	add    %eax,(%eax)
   3:	00 ac 01 00 00 b2 01 	add    %ch,0x1b20000(%ecx,%eax,1)
   a:	00 00                	add    %al,(%eax)
   c:	ba 01 00 00 00       	mov    $0x1,%edx
  11:	00 00                	add    %al,(%eax)
  13:	00 00                	add    %al,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	00 a7 01 00 00 ac    	add    %ah,-0x53ffffff(%edi)
  1d:	01 00                	add    %eax,(%eax)
  1f:	00 b2 01 00 00 b3    	add    %dh,-0x4cffffff(%edx)
  25:	01 00                	add    %eax,(%eax)
  27:	00 00                	add    %al,(%eax)
  29:	00 00                	add    %al,(%eax)
  2b:	00 00                	add    %al,(%eax)
  2d:	00 00                	add    %al,(%eax)
  2f:	00 cc                	add    %cl,%ah
  31:	01 00                	add    %eax,(%eax)
  33:	00 d1                	add    %dl,%cl
  35:	01 00                	add    %eax,(%eax)
  37:	00 d4                	add    %dl,%ah
  39:	01 00                	add    %eax,(%eax)
  3b:	00 d5                	add    %dl,%ch
  3d:	01 00                	add    %eax,(%eax)
  3f:	00 00                	add    %al,(%eax)
  41:	00 00                	add    %al,(%eax)
  43:	00 00                	add    %al,(%eax)
  45:	00 00                	add    %al,(%eax)
  47:	00 d7                	add    %dl,%bh
  49:	01 00                	add    %eax,(%eax)
  4b:	00 dc                	add    %bl,%ah
  4d:	01 00                	add    %eax,(%eax)
  4f:	00 df                	add    %bl,%bh
  51:	01 00                	add    %eax,(%eax)
  53:	00 e0                	add    %ah,%al
  55:	01 00                	add    %eax,(%eax)
  57:	00 00                	add    %al,(%eax)
  59:	00 00                	add    %al,(%eax)
  5b:	00 00                	add    %al,(%eax)
  5d:	00 00                	add    %al,(%eax)
  5f:	00 e2                	add    %ah,%dl
  61:	01 00                	add    %eax,(%eax)
  63:	00 e7                	add    %ah,%bh
  65:	01 00                	add    %eax,(%eax)
  67:	00 ed                	add    %ch,%ch
  69:	01 00                	add    %eax,(%eax)
  6b:	00 ee                	add    %ch,%dh
  6d:	01 00                	add    %eax,(%eax)
  6f:	00 00                	add    %al,(%eax)
  71:	00 00                	add    %al,(%eax)
  73:	00 00                	add    %al,(%eax)
  75:	00 00                	add    %al,(%eax)
  77:	00                   	.byte 0x0
