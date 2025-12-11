
build/nanos2/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0de0000 <main>:
c0de0000:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de0004:	b08d      	sub	sp, #52	@ 0x34
c0de0006:	b662      	cpsie	i
c0de0008:	f007 fda4 	bl	c0de7b54 <os_boot>
c0de000c:	f240 48d0 	movw	r8, #1232	@ 0x4d0
c0de0010:	f240 57e8 	movw	r7, #1512	@ 0x5e8
c0de0014:	f2c0 0800 	movt	r8, #0
c0de0018:	f44f 7a88 	mov.w	sl, #272	@ 0x110
c0de001c:	f2c0 0700 	movt	r7, #0
c0de0020:	2600      	movs	r6, #0
c0de0022:	ad01      	add	r5, sp, #4
c0de0024:	464c      	mov	r4, r9
c0de0026:	bf00      	nop
c0de0028:	eb09 0008 	add.w	r0, r9, r8
c0de002c:	4651      	mov	r1, sl
c0de002e:	f008 fa3d 	bl	c0de84ac <__aeabi_memclr>
c0de0032:	4628      	mov	r0, r5
c0de0034:	f809 6007 	strb.w	r6, [r9, r7]
c0de0038:	f008 fa8a 	bl	c0de8550 <setjmp>
c0de003c:	b281      	uxth	r1, r0
c0de003e:	2905      	cmp	r1, #5
c0de0040:	f8ad 0030 	strh.w	r0, [sp, #48]	@ 0x30
c0de0044:	d108      	bne.n	c0de0058 <main+0x58>
c0de0046:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de0048:	f8ad 6030 	strh.w	r6, [sp, #48]	@ 0x30
c0de004c:	f008 f850 	bl	c0de80f0 <try_context_set>
c0de0050:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de0052:	f008 f84d 	bl	c0de80f0 <try_context_set>
c0de0056:	e7e7      	b.n	c0de0028 <main+0x28>
c0de0058:	b171      	cbz	r1, c0de0078 <main+0x78>
c0de005a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de005c:	2400      	movs	r4, #0
c0de005e:	f8ad 4030 	strh.w	r4, [sp, #48]	@ 0x30
c0de0062:	f008 f845 	bl	c0de80f0 <try_context_set>
c0de0066:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de0068:	f008 f842 	bl	c0de80f0 <try_context_set>
c0de006c:	f001 fb54 	bl	c0de1718 <app_exit>
c0de0070:	4620      	mov	r0, r4
c0de0072:	b00d      	add	sp, #52	@ 0x34
c0de0074:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de0078:	a801      	add	r0, sp, #4
c0de007a:	f008 f839 	bl	c0de80f0 <try_context_set>
c0de007e:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de0080:	f005 ff42 	bl	c0de5f08 <io_seproxyhal_init>
c0de0084:	f240 0100 	movw	r1, #0
c0de0088:	f2c0 0100 	movt	r1, #0
c0de008c:	eb09 0001 	add.w	r0, r9, r1
c0de0090:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0094:	f008 fa0a 	bl	c0de84ac <__aeabi_memclr>
c0de0098:	f24b 505c 	movw	r0, #46428	@ 0xb55c
c0de009c:	f2c0 0000 	movt	r0, #0
c0de00a0:	4478      	add	r0, pc
c0de00a2:	f007 ff31 	bl	c0de7f08 <pic>
c0de00a6:	7840      	ldrb	r0, [r0, #1]
c0de00a8:	2801      	cmp	r0, #1
c0de00aa:	d00e      	beq.n	c0de00ca <main+0xca>
c0de00ac:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de00b0:	f8ad 0000 	strh.w	r0, [sp]
c0de00b4:	f24b 5040 	movw	r0, #46400	@ 0xb540
c0de00b8:	f2c0 0000 	movt	r0, #0
c0de00bc:	4478      	add	r0, pc
c0de00be:	f007 ff23 	bl	c0de7f08 <pic>
c0de00c2:	4669      	mov	r1, sp
c0de00c4:	2202      	movs	r2, #2
c0de00c6:	f007 ff4e 	bl	c0de7f66 <nvm_write>
c0de00ca:	2000      	movs	r0, #0
c0de00cc:	f005 ff40 	bl	c0de5f50 <USB_power>
c0de00d0:	2001      	movs	r0, #1
c0de00d2:	f005 ff3d 	bl	c0de5f50 <USB_power>
c0de00d6:	f004 fec8 	bl	c0de4e6a <ui_idle>
c0de00da:	f001 fb3d 	bl	c0de1758 <waves_main>

c0de00de <_code>:
	...

c0de00e0 <b58enc>:
c0de00e0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de00e4:	af03      	add	r7, sp, #12
c0de00e6:	b086      	sub	sp, #24
c0de00e8:	4698      	mov	r8, r3
c0de00ea:	2b01      	cmp	r3, #1
c0de00ec:	f04f 0b00 	mov.w	fp, #0
c0de00f0:	e947 1206 	strd	r1, r2, [r7, #-24]
c0de00f4:	f847 0c20 	str.w	r0, [r7, #-32]
c0de00f8:	db0a      	blt.n	c0de0110 <b58enc+0x30>
c0de00fa:	bf00      	nop
c0de00fc:	f857 1c14 	ldr.w	r1, [r7, #-20]
c0de0100:	f811 100b 	ldrb.w	r1, [r1, fp]
c0de0104:	b921      	cbnz	r1, c0de0110 <b58enc+0x30>
c0de0106:	f10b 0b01 	add.w	fp, fp, #1
c0de010a:	45d8      	cmp	r8, fp
c0de010c:	d1f6      	bne.n	c0de00fc <b58enc+0x1c>
c0de010e:	46c3      	mov	fp, r8
c0de0110:	eba8 000b 	sub.w	r0, r8, fp
c0de0114:	218a      	movs	r1, #138	@ 0x8a
c0de0116:	4348      	muls	r0, r1
c0de0118:	f248 511f 	movw	r1, #34079	@ 0x851f
c0de011c:	f2c5 11eb 	movt	r1, #20971	@ 0x51eb
c0de0120:	fba0 0201 	umull	r0, r2, r0, r1
c0de0124:	2001      	movs	r0, #1
c0de0126:	eb00 1152 	add.w	r1, r0, r2, lsr #5
c0de012a:	2008      	movs	r0, #8
c0de012c:	eb00 1052 	add.w	r0, r0, r2, lsr #5
c0de0130:	f020 0007 	bic.w	r0, r0, #7
c0de0134:	ea4f 1a52 	mov.w	sl, r2, lsr #5
c0de0138:	ebad 0400 	sub.w	r4, sp, r0
c0de013c:	46a5      	mov	sp, r4
c0de013e:	4620      	mov	r0, r4
c0de0140:	f847 1c1c 	str.w	r1, [r7, #-28]
c0de0144:	f008 f9b2 	bl	c0de84ac <__aeabi_memclr>
c0de0148:	45d8      	cmp	r8, fp
c0de014a:	dd26      	ble.n	c0de019a <b58enc+0xba>
c0de014c:	f64c 3c09 	movw	ip, #51977	@ 0xcb09
c0de0150:	f6c8 5c3d 	movt	ip, #36157	@ 0x8d3d
c0de0154:	f04f 0e3a 	mov.w	lr, #58	@ 0x3a
c0de0158:	465a      	mov	r2, fp
c0de015a:	4655      	mov	r5, sl
c0de015c:	f857 0c14 	ldr.w	r0, [r7, #-20]
c0de0160:	45aa      	cmp	sl, r5
c0de0162:	5c86      	ldrb	r6, [r0, r2]
c0de0164:	dc01      	bgt.n	c0de016a <b58enc+0x8a>
c0de0166:	4653      	mov	r3, sl
c0de0168:	b19e      	cbz	r6, c0de0192 <b58enc+0xb2>
c0de016a:	4653      	mov	r3, sl
c0de016c:	5ce0      	ldrb	r0, [r4, r3]
c0de016e:	eb06 2000 	add.w	r0, r6, r0, lsl #8
c0de0172:	fb80 610c 	smull	r6, r1, r0, ip
c0de0176:	4401      	add	r1, r0
c0de0178:	114e      	asrs	r6, r1, #5
c0de017a:	eb06 76d1 	add.w	r6, r6, r1, lsr #31
c0de017e:	fb06 011e 	mls	r1, r6, lr, r0
c0de0182:	54e1      	strb	r1, [r4, r3]
c0de0184:	3b01      	subs	r3, #1
c0de0186:	42ab      	cmp	r3, r5
c0de0188:	dcf0      	bgt.n	c0de016c <b58enc+0x8c>
c0de018a:	383a      	subs	r0, #58	@ 0x3a
c0de018c:	f110 0f73 	cmn.w	r0, #115	@ 0x73
c0de0190:	d3ec      	bcc.n	c0de016c <b58enc+0x8c>
c0de0192:	3201      	adds	r2, #1
c0de0194:	4542      	cmp	r2, r8
c0de0196:	461d      	mov	r5, r3
c0de0198:	d1e0      	bne.n	c0de015c <b58enc+0x7c>
c0de019a:	e957 1207 	ldrd	r1, r2, [r7, #-28]
c0de019e:	f04f 0800 	mov.w	r8, #0
c0de01a2:	bf00      	nop
c0de01a4:	f814 0008 	ldrb.w	r0, [r4, r8]
c0de01a8:	b920      	cbnz	r0, c0de01b4 <b58enc+0xd4>
c0de01aa:	f108 0801 	add.w	r8, r8, #1
c0de01ae:	4541      	cmp	r1, r8
c0de01b0:	d1f8      	bne.n	c0de01a4 <b58enc+0xc4>
c0de01b2:	4688      	mov	r8, r1
c0de01b4:	6816      	ldr	r6, [r2, #0]
c0de01b6:	eb01 000b 	add.w	r0, r1, fp
c0de01ba:	eba0 0508 	sub.w	r5, r0, r8
c0de01be:	42ae      	cmp	r6, r5
c0de01c0:	4629      	mov	r1, r5
c0de01c2:	d928      	bls.n	c0de0216 <b58enc+0x136>
c0de01c4:	f1bb 0f00 	cmp.w	fp, #0
c0de01c8:	d005      	beq.n	c0de01d6 <b58enc+0xf6>
c0de01ca:	f857 0c20 	ldr.w	r0, [r7, #-32]
c0de01ce:	4659      	mov	r1, fp
c0de01d0:	2231      	movs	r2, #49	@ 0x31
c0de01d2:	f008 f972 	bl	c0de84ba <__aeabi_memset>
c0de01d6:	45d0      	cmp	r8, sl
c0de01d8:	d902      	bls.n	c0de01e0 <b58enc+0x100>
c0de01da:	f857 4c20 	ldr.w	r4, [r7, #-32]
c0de01de:	e014      	b.n	c0de020a <b58enc+0x12a>
c0de01e0:	f648 42bb 	movw	r2, #36027	@ 0x8cbb
c0de01e4:	ebaa 0008 	sub.w	r0, sl, r8
c0de01e8:	eb04 0108 	add.w	r1, r4, r8
c0de01ec:	f2c0 0200 	movt	r2, #0
c0de01f0:	f857 4c20 	ldr.w	r4, [r7, #-32]
c0de01f4:	3001      	adds	r0, #1
c0de01f6:	447a      	add	r2, pc
c0de01f8:	f811 3b01 	ldrb.w	r3, [r1], #1
c0de01fc:	3801      	subs	r0, #1
c0de01fe:	5cd3      	ldrb	r3, [r2, r3]
c0de0200:	f804 300b 	strb.w	r3, [r4, fp]
c0de0204:	f10b 0b01 	add.w	fp, fp, #1
c0de0208:	d1f6      	bne.n	c0de01f8 <b58enc+0x118>
c0de020a:	f857 2c18 	ldr.w	r2, [r7, #-24]
c0de020e:	2000      	movs	r0, #0
c0de0210:	4659      	mov	r1, fp
c0de0212:	f804 000b 	strb.w	r0, [r4, fp]
c0de0216:	2000      	movs	r0, #0
c0de0218:	3101      	adds	r1, #1
c0de021a:	f1a7 040c 	sub.w	r4, r7, #12
c0de021e:	42ae      	cmp	r6, r5
c0de0220:	bf88      	it	hi
c0de0222:	2001      	movhi	r0, #1
c0de0224:	6011      	str	r1, [r2, #0]
c0de0226:	46a5      	mov	sp, r4
c0de0228:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de022c <public_key_le_to_be>:
c0de022c:	b5b0      	push	{r4, r5, r7, lr}
c0de022e:	b088      	sub	sp, #32
c0de0230:	f100 0148 	add.w	r1, r0, #72	@ 0x48
c0de0234:	2200      	movs	r2, #0
c0de0236:	466c      	mov	r4, sp
c0de0238:	f811 3901 	ldrb.w	r3, [r1], #-1
c0de023c:	54a3      	strb	r3, [r4, r2]
c0de023e:	3201      	adds	r2, #1
c0de0240:	2a20      	cmp	r2, #32
c0de0242:	d1f9      	bne.n	c0de0238 <public_key_le_to_be+0xc>
c0de0244:	f890 1028 	ldrb.w	r1, [r0, #40]	@ 0x28
c0de0248:	07c9      	lsls	r1, r1, #31
c0de024a:	d005      	beq.n	c0de0258 <public_key_le_to_be+0x2c>
c0de024c:	f89d 101f 	ldrb.w	r1, [sp, #31]
c0de0250:	f041 0180 	orr.w	r1, r1, #128	@ 0x80
c0de0254:	f88d 101f 	strb.w	r1, [sp, #31]
c0de0258:	f100 0508 	add.w	r5, r0, #8
c0de025c:	3028      	adds	r0, #40	@ 0x28
c0de025e:	2121      	movs	r1, #33	@ 0x21
c0de0260:	f008 f924 	bl	c0de84ac <__aeabi_memclr>
c0de0264:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
c0de0266:	c50f      	stmia	r5!, {r0, r1, r2, r3}
c0de0268:	e894 000f 	ldmia.w	r4, {r0, r1, r2, r3}
c0de026c:	c50f      	stmia	r5!, {r0, r1, r2, r3}
c0de026e:	b008      	add	sp, #32
c0de0270:	bdb0      	pop	{r4, r5, r7, pc}

c0de0272 <get_keypair_by_path>:
c0de0272:	b570      	push	{r4, r5, r6, lr}
c0de0274:	b08c      	sub	sp, #48	@ 0x30
c0de0276:	460d      	mov	r5, r1
c0de0278:	f648 31c2 	movw	r1, #35778	@ 0x8bc2
c0de027c:	f2c0 0100 	movt	r1, #0
c0de0280:	4614      	mov	r4, r2
c0de0282:	4602      	mov	r2, r0
c0de0284:	200c      	movs	r0, #12
c0de0286:	4479      	add	r1, pc
c0de0288:	2300      	movs	r3, #0
c0de028a:	ae04      	add	r6, sp, #16
c0de028c:	e9cd 3101 	strd	r3, r1, [sp, #4]
c0de0290:	9003      	str	r0, [sp, #12]
c0de0292:	2001      	movs	r0, #1
c0de0294:	2171      	movs	r1, #113	@ 0x71
c0de0296:	2305      	movs	r3, #5
c0de0298:	9600      	str	r6, [sp, #0]
c0de029a:	f007 fe88 	bl	c0de7fae <os_perso_derive_node_with_seed_key>
c0de029e:	2071      	movs	r0, #113	@ 0x71
c0de02a0:	4631      	mov	r1, r6
c0de02a2:	2220      	movs	r2, #32
c0de02a4:	4623      	mov	r3, r4
c0de02a6:	f007 fc20 	bl	c0de7aea <cx_ecfp_init_private_key_no_throw>
c0de02aa:	2071      	movs	r0, #113	@ 0x71
c0de02ac:	2100      	movs	r1, #0
c0de02ae:	2200      	movs	r2, #0
c0de02b0:	462b      	mov	r3, r5
c0de02b2:	f007 fc1e 	bl	c0de7af2 <cx_ecfp_init_public_key_no_throw>
c0de02b6:	2071      	movs	r0, #113	@ 0x71
c0de02b8:	4629      	mov	r1, r5
c0de02ba:	4622      	mov	r2, r4
c0de02bc:	2301      	movs	r3, #1
c0de02be:	f007 fc10 	bl	c0de7ae2 <cx_ecfp_generate_pair_no_throw>
c0de02c2:	b908      	cbnz	r0, c0de02c8 <get_keypair_by_path+0x56>
c0de02c4:	b00c      	add	sp, #48	@ 0x30
c0de02c6:	bd70      	pop	{r4, r5, r6, pc}
c0de02c8:	f007 fc47 	bl	c0de7b5a <os_longjmp>

c0de02cc <get_curve25519_public_key_for_path>:
c0de02cc:	b5b0      	push	{r4, r5, r7, lr}
c0de02ce:	b08a      	sub	sp, #40	@ 0x28
c0de02d0:	466d      	mov	r5, sp
c0de02d2:	462a      	mov	r2, r5
c0de02d4:	460c      	mov	r4, r1
c0de02d6:	f7ff ffcc 	bl	c0de0272 <get_keypair_by_path>
c0de02da:	4628      	mov	r0, r5
c0de02dc:	2128      	movs	r1, #40	@ 0x28
c0de02de:	f008 f8e5 	bl	c0de84ac <__aeabi_memclr>
c0de02e2:	4620      	mov	r0, r4
c0de02e4:	f7ff ffa2 	bl	c0de022c <public_key_le_to_be>
c0de02e8:	f104 0008 	add.w	r0, r4, #8
c0de02ec:	4601      	mov	r1, r0
c0de02ee:	f002 fc13 	bl	c0de2b18 <ed25519_pk_to_curve25519>
c0de02f2:	fab0 f080 	clz	r0, r0
c0de02f6:	0940      	lsrs	r0, r0, #5
c0de02f8:	b00a      	add	sp, #40	@ 0x28
c0de02fa:	bdb0      	pop	{r4, r5, r7, pc}

c0de02fc <blake2b_256>:
c0de02fc:	b570      	push	{r4, r5, r6, lr}
c0de02fe:	b0c2      	sub	sp, #264	@ 0x108
c0de0300:	460c      	mov	r4, r1
c0de0302:	4605      	mov	r5, r0
c0de0304:	a802      	add	r0, sp, #8
c0de0306:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de030a:	4616      	mov	r6, r2
c0de030c:	f007 fbe5 	bl	c0de7ada <cx_blake2b_init_no_throw>
c0de0310:	b980      	cbnz	r0, c0de0334 <blake2b_256+0x38>
c0de0312:	f04f 0c20 	mov.w	ip, #32
c0de0316:	a802      	add	r0, sp, #8
c0de0318:	2101      	movs	r1, #1
c0de031a:	462a      	mov	r2, r5
c0de031c:	4623      	mov	r3, r4
c0de031e:	9600      	str	r6, [sp, #0]
c0de0320:	f8cd c004 	str.w	ip, [sp, #4]
c0de0324:	f007 fbf5 	bl	c0de7b12 <cx_hash_no_throw>
c0de0328:	b920      	cbnz	r0, c0de0334 <blake2b_256+0x38>
c0de032a:	a802      	add	r0, sp, #8
c0de032c:	f007 fbed 	bl	c0de7b0a <cx_hash_get_size>
c0de0330:	b042      	add	sp, #264	@ 0x108
c0de0332:	bd70      	pop	{r4, r5, r6, pc}
c0de0334:	f007 fc11 	bl	c0de7b5a <os_longjmp>

c0de0338 <keccak_256>:
c0de0338:	b570      	push	{r4, r5, r6, lr}
c0de033a:	b0ec      	sub	sp, #432	@ 0x1b0
c0de033c:	460c      	mov	r4, r1
c0de033e:	4605      	mov	r5, r0
c0de0340:	a802      	add	r0, sp, #8
c0de0342:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de0346:	4616      	mov	r6, r2
c0de0348:	f007 fbe7 	bl	c0de7b1a <cx_keccak_init_no_throw>
c0de034c:	b980      	cbnz	r0, c0de0370 <keccak_256+0x38>
c0de034e:	f04f 0c20 	mov.w	ip, #32
c0de0352:	a802      	add	r0, sp, #8
c0de0354:	2101      	movs	r1, #1
c0de0356:	462a      	mov	r2, r5
c0de0358:	4623      	mov	r3, r4
c0de035a:	9600      	str	r6, [sp, #0]
c0de035c:	f8cd c004 	str.w	ip, [sp, #4]
c0de0360:	f007 fbd7 	bl	c0de7b12 <cx_hash_no_throw>
c0de0364:	b920      	cbnz	r0, c0de0370 <keccak_256+0x38>
c0de0366:	a802      	add	r0, sp, #8
c0de0368:	f007 fbcf 	bl	c0de7b0a <cx_hash_get_size>
c0de036c:	b06c      	add	sp, #432	@ 0x1b0
c0de036e:	bd70      	pop	{r4, r5, r6, pc}
c0de0370:	f007 fbf3 	bl	c0de7b5a <os_longjmp>

c0de0374 <stream_eddsa_sign_step1>:
c0de0374:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de0378:	b0c6      	sub	sp, #280	@ 0x118
c0de037a:	460e      	mov	r6, r1
c0de037c:	f44f 712e 	mov.w	r1, #696	@ 0x2b8
c0de0380:	4605      	mov	r5, r0
c0de0382:	f008 f893 	bl	c0de84ac <__aeabi_memclr>
c0de0386:	a812      	add	r0, sp, #72	@ 0x48
c0de0388:	f007 fbd7 	bl	c0de7b3a <cx_sha512_init_no_throw>
c0de038c:	6872      	ldr	r2, [r6, #4]
c0de038e:	2a20      	cmp	r2, #32
c0de0390:	d12e      	bne.n	c0de03f0 <stream_eddsa_sign_step1+0x7c>
c0de0392:	f106 0208 	add.w	r2, r6, #8
c0de0396:	2700      	movs	r7, #0
c0de0398:	a812      	add	r0, sp, #72	@ 0x48
c0de039a:	2100      	movs	r1, #0
c0de039c:	2320      	movs	r3, #32
c0de039e:	9700      	str	r7, [sp, #0]
c0de03a0:	9701      	str	r7, [sp, #4]
c0de03a2:	f007 fbb6 	bl	c0de7b12 <cx_hash_no_throw>
c0de03a6:	2800      	cmp	r0, #0
c0de03a8:	f040 8093 	bne.w	c0de04d2 <stream_eddsa_sign_step1+0x15e>
c0de03ac:	ac12      	add	r4, sp, #72	@ 0x48
c0de03ae:	4620      	mov	r0, r4
c0de03b0:	f007 fbab 	bl	c0de7b0a <cx_hash_get_size>
c0de03b4:	2040      	movs	r0, #64	@ 0x40
c0de03b6:	a902      	add	r1, sp, #8
c0de03b8:	e9cd 1000 	strd	r1, r0, [sp]
c0de03bc:	4620      	mov	r0, r4
c0de03be:	2101      	movs	r1, #1
c0de03c0:	2200      	movs	r2, #0
c0de03c2:	2300      	movs	r3, #0
c0de03c4:	2401      	movs	r4, #1
c0de03c6:	f007 fba4 	bl	c0de7b12 <cx_hash_no_throw>
c0de03ca:	2800      	cmp	r0, #0
c0de03cc:	f040 8081 	bne.w	c0de04d2 <stream_eddsa_sign_step1+0x15e>
c0de03d0:	a812      	add	r0, sp, #72	@ 0x48
c0de03d2:	f007 fb9a 	bl	c0de7b0a <cx_hash_get_size>
c0de03d6:	f89d 0008 	ldrb.w	r0, [sp, #8]
c0de03da:	f89d 1027 	ldrb.w	r1, [sp, #39]	@ 0x27
c0de03de:	f000 00f8 	and.w	r0, r0, #248	@ 0xf8
c0de03e2:	f364 119f 	bfi	r1, r4, #6, #26
c0de03e6:	f88d 0008 	strb.w	r0, [sp, #8]
c0de03ea:	f88d 1027 	strb.w	r1, [sp, #39]	@ 0x27
c0de03ee:	e004      	b.n	c0de03fa <stream_eddsa_sign_step1+0x86>
c0de03f0:	f106 0108 	add.w	r1, r6, #8
c0de03f4:	a802      	add	r0, sp, #8
c0de03f6:	f008 f85c 	bl	c0de84b2 <__aeabi_memcpy>
c0de03fa:	f105 0020 	add.w	r0, r5, #32
c0de03fe:	f105 0840 	add.w	r8, r5, #64	@ 0x40
c0de0402:	2100      	movs	r1, #0
c0de0404:	221f      	movs	r2, #31
c0de0406:	af02      	add	r7, sp, #8
c0de0408:	5cbb      	ldrb	r3, [r7, r2]
c0de040a:	5c7c      	ldrb	r4, [r7, r1]
c0de040c:	547b      	strb	r3, [r7, r1]
c0de040e:	3101      	adds	r1, #1
c0de0410:	54bc      	strb	r4, [r7, r2]
c0de0412:	2910      	cmp	r1, #16
c0de0414:	f1a2 0201 	sub.w	r2, r2, #1
c0de0418:	d1f6      	bne.n	c0de0408 <stream_eddsa_sign_step1+0x94>
c0de041a:	4639      	mov	r1, r7
c0de041c:	2220      	movs	r2, #32
c0de041e:	f008 f848 	bl	c0de84b2 <__aeabi_memcpy>
c0de0422:	f107 0120 	add.w	r1, r7, #32
c0de0426:	4640      	mov	r0, r8
c0de0428:	2220      	movs	r2, #32
c0de042a:	f008 f842 	bl	c0de84b2 <__aeabi_memcpy>
c0de042e:	7830      	ldrb	r0, [r6, #0]
c0de0430:	2104      	movs	r1, #4
c0de0432:	462c      	mov	r4, r5
c0de0434:	f804 1fa8 	strb.w	r1, [r4, #168]!
c0de0438:	f804 0c08 	strb.w	r0, [r4, #-8]
c0de043c:	2041      	movs	r0, #65	@ 0x41
c0de043e:	f844 0c04 	str.w	r0, [r4, #-4]
c0de0442:	f648 3148 	movw	r1, #35656	@ 0x8b48
c0de0446:	1c66      	adds	r6, r4, #1
c0de0448:	f2c0 0100 	movt	r1, #0
c0de044c:	4479      	add	r1, pc
c0de044e:	4630      	mov	r0, r6
c0de0450:	2220      	movs	r2, #32
c0de0452:	f008 f82e 	bl	c0de84b2 <__aeabi_memcpy>
c0de0456:	f648 3152 	movw	r1, #35666	@ 0x8b52
c0de045a:	f2c0 0100 	movt	r1, #0
c0de045e:	f104 0021 	add.w	r0, r4, #33	@ 0x21
c0de0462:	4479      	add	r1, pc
c0de0464:	2220      	movs	r2, #32
c0de0466:	f008 f824 	bl	c0de84b2 <__aeabi_memcpy>
c0de046a:	2071      	movs	r0, #113	@ 0x71
c0de046c:	4621      	mov	r1, r4
c0de046e:	463a      	mov	r2, r7
c0de0470:	2320      	movs	r3, #32
c0de0472:	f007 fb42 	bl	c0de7afa <cx_ecfp_scalar_mult_no_throw>
c0de0476:	bb60      	cbnz	r0, c0de04d2 <stream_eddsa_sign_step1+0x15e>
c0de0478:	a945      	add	r1, sp, #276	@ 0x114
c0de047a:	2071      	movs	r0, #113	@ 0x71
c0de047c:	f007 fd7f 	bl	c0de7f7e <cx_ecdomain_parameters_length>
c0de0480:	bb38      	cbnz	r0, c0de04d2 <stream_eddsa_sign_step1+0x15e>
c0de0482:	f8d5 20a4 	ldr.w	r2, [r5, #164]	@ 0xa4
c0de0486:	2071      	movs	r0, #113	@ 0x71
c0de0488:	4621      	mov	r1, r4
c0de048a:	f007 fb3a 	bl	c0de7b02 <cx_edwards_compress_point_no_throw>
c0de048e:	bb00      	cbnz	r0, c0de04d2 <stream_eddsa_sign_step1+0x15e>
c0de0490:	4628      	mov	r0, r5
c0de0492:	4631      	mov	r1, r6
c0de0494:	2220      	movs	r2, #32
c0de0496:	f008 f80c 	bl	c0de84b2 <__aeabi_memcpy>
c0de049a:	f105 04ec 	add.w	r4, r5, #236	@ 0xec
c0de049e:	4620      	mov	r0, r4
c0de04a0:	f007 fb4b 	bl	c0de7b3a <cx_sha512_init_no_throw>
c0de04a4:	f505 70dc 	add.w	r0, r5, #440	@ 0x1b8
c0de04a8:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de04ac:	f007 fb15 	bl	c0de7ada <cx_blake2b_init_no_throw>
c0de04b0:	b978      	cbnz	r0, c0de04d2 <stream_eddsa_sign_step1+0x15e>
c0de04b2:	2700      	movs	r7, #0
c0de04b4:	4620      	mov	r0, r4
c0de04b6:	2100      	movs	r1, #0
c0de04b8:	4642      	mov	r2, r8
c0de04ba:	2320      	movs	r3, #32
c0de04bc:	9700      	str	r7, [sp, #0]
c0de04be:	9701      	str	r7, [sp, #4]
c0de04c0:	f007 fb27 	bl	c0de7b12 <cx_hash_no_throw>
c0de04c4:	b928      	cbnz	r0, c0de04d2 <stream_eddsa_sign_step1+0x15e>
c0de04c6:	4620      	mov	r0, r4
c0de04c8:	f007 fb1f 	bl	c0de7b0a <cx_hash_get_size>
c0de04cc:	b046      	add	sp, #280	@ 0x118
c0de04ce:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de04d2:	f007 fb42 	bl	c0de7b5a <os_longjmp>

c0de04d6 <stream_eddsa_sign_step2>:
c0de04d6:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de04da:	b082      	sub	sp, #8
c0de04dc:	4614      	mov	r4, r2
c0de04de:	460d      	mov	r5, r1
c0de04e0:	f500 77dc 	add.w	r7, r0, #440	@ 0x1b8
c0de04e4:	4606      	mov	r6, r0
c0de04e6:	f04f 0800 	mov.w	r8, #0
c0de04ea:	4638      	mov	r0, r7
c0de04ec:	2100      	movs	r1, #0
c0de04ee:	462a      	mov	r2, r5
c0de04f0:	4623      	mov	r3, r4
c0de04f2:	f8cd 8000 	str.w	r8, [sp]
c0de04f6:	f8cd 8004 	str.w	r8, [sp, #4]
c0de04fa:	f007 fb0a 	bl	c0de7b12 <cx_hash_no_throw>
c0de04fe:	b9a0      	cbnz	r0, c0de052a <stream_eddsa_sign_step2+0x54>
c0de0500:	4638      	mov	r0, r7
c0de0502:	f007 fb02 	bl	c0de7b0a <cx_hash_get_size>
c0de0506:	36ec      	adds	r6, #236	@ 0xec
c0de0508:	4630      	mov	r0, r6
c0de050a:	2100      	movs	r1, #0
c0de050c:	462a      	mov	r2, r5
c0de050e:	4623      	mov	r3, r4
c0de0510:	f8cd 8000 	str.w	r8, [sp]
c0de0514:	f8cd 8004 	str.w	r8, [sp, #4]
c0de0518:	f007 fafb 	bl	c0de7b12 <cx_hash_no_throw>
c0de051c:	b928      	cbnz	r0, c0de052a <stream_eddsa_sign_step2+0x54>
c0de051e:	4630      	mov	r0, r6
c0de0520:	b002      	add	sp, #8
c0de0522:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de0526:	f007 baf0 	b.w	c0de7b0a <cx_hash_get_size>
c0de052a:	f007 fb16 	bl	c0de7b5a <os_longjmp>
	...

c0de0530 <stream_eddsa_sign_step3>:
c0de0530:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de0534:	b093      	sub	sp, #76	@ 0x4c
c0de0536:	4606      	mov	r6, r0
c0de0538:	f500 78dc 	add.w	r8, r0, #440	@ 0x1b8
c0de053c:	f240 0000 	movw	r0, #0
c0de0540:	f2c0 0000 	movt	r0, #0
c0de0544:	4448      	add	r0, r9
c0de0546:	f200 306d 	addw	r0, r0, #877	@ 0x36d
c0de054a:	2720      	movs	r7, #32
c0de054c:	9000      	str	r0, [sp, #0]
c0de054e:	4640      	mov	r0, r8
c0de0550:	2101      	movs	r1, #1
c0de0552:	2200      	movs	r2, #0
c0de0554:	2300      	movs	r3, #0
c0de0556:	9701      	str	r7, [sp, #4]
c0de0558:	f007 fadb 	bl	c0de7b12 <cx_hash_no_throw>
c0de055c:	2800      	cmp	r0, #0
c0de055e:	f040 809f 	bne.w	c0de06a0 <stream_eddsa_sign_step3+0x170>
c0de0562:	4640      	mov	r0, r8
c0de0564:	f007 fad1 	bl	c0de7b0a <cx_hash_get_size>
c0de0568:	f106 0aec 	add.w	sl, r6, #236	@ 0xec
c0de056c:	2040      	movs	r0, #64	@ 0x40
c0de056e:	ac02      	add	r4, sp, #8
c0de0570:	9001      	str	r0, [sp, #4]
c0de0572:	4650      	mov	r0, sl
c0de0574:	2101      	movs	r1, #1
c0de0576:	2200      	movs	r2, #0
c0de0578:	2300      	movs	r3, #0
c0de057a:	9400      	str	r4, [sp, #0]
c0de057c:	f007 fac9 	bl	c0de7b12 <cx_hash_no_throw>
c0de0580:	2800      	cmp	r0, #0
c0de0582:	f040 808d 	bne.w	c0de06a0 <stream_eddsa_sign_step3+0x170>
c0de0586:	4650      	mov	r0, sl
c0de0588:	f007 fabf 	bl	c0de7b0a <cx_hash_get_size>
c0de058c:	2000      	movs	r0, #0
c0de058e:	213f      	movs	r1, #63	@ 0x3f
c0de0590:	5c62      	ldrb	r2, [r4, r1]
c0de0592:	5c23      	ldrb	r3, [r4, r0]
c0de0594:	5422      	strb	r2, [r4, r0]
c0de0596:	3001      	adds	r0, #1
c0de0598:	5463      	strb	r3, [r4, r1]
c0de059a:	2820      	cmp	r0, #32
c0de059c:	f1a1 0101 	sub.w	r1, r1, #1
c0de05a0:	d1f6      	bne.n	c0de0590 <stream_eddsa_sign_step3+0x60>
c0de05a2:	f648 2228 	movw	r2, #35368	@ 0x8a28
c0de05a6:	f2c0 0200 	movt	r2, #0
c0de05aa:	ac02      	add	r4, sp, #8
c0de05ac:	447a      	add	r2, pc
c0de05ae:	4620      	mov	r0, r4
c0de05b0:	2140      	movs	r1, #64	@ 0x40
c0de05b2:	2320      	movs	r3, #32
c0de05b4:	f007 fab9 	bl	c0de7b2a <cx_math_modm_no_throw>
c0de05b8:	2800      	cmp	r0, #0
c0de05ba:	d171      	bne.n	c0de06a0 <stream_eddsa_sign_step3+0x170>
c0de05bc:	f104 0020 	add.w	r0, r4, #32
c0de05c0:	f106 0540 	add.w	r5, r6, #64	@ 0x40
c0de05c4:	c89c      	ldmia	r0!, {r2, r3, r4, r7}
c0de05c6:	4629      	mov	r1, r5
c0de05c8:	c19c      	stmia	r1!, {r2, r3, r4, r7}
c0de05ca:	e890 009c 	ldmia.w	r0, {r2, r3, r4, r7}
c0de05ce:	2004      	movs	r0, #4
c0de05d0:	c19c      	stmia	r1!, {r2, r3, r4, r7}
c0de05d2:	4634      	mov	r4, r6
c0de05d4:	f804 0fa0 	strb.w	r0, [r4, #160]!
c0de05d8:	f648 11b2 	movw	r1, #35250	@ 0x89b2
c0de05dc:	f2c0 0100 	movt	r1, #0
c0de05e0:	1c60      	adds	r0, r4, #1
c0de05e2:	4479      	add	r1, pc
c0de05e4:	2220      	movs	r2, #32
c0de05e6:	f007 ff64 	bl	c0de84b2 <__aeabi_memcpy>
c0de05ea:	f648 11be 	movw	r1, #35262	@ 0x89be
c0de05ee:	f104 0721 	add.w	r7, r4, #33	@ 0x21
c0de05f2:	f2c0 0100 	movt	r1, #0
c0de05f6:	4479      	add	r1, pc
c0de05f8:	4638      	mov	r0, r7
c0de05fa:	2220      	movs	r2, #32
c0de05fc:	f007 ff59 	bl	c0de84b2 <__aeabi_memcpy>
c0de0600:	2071      	movs	r0, #113	@ 0x71
c0de0602:	4621      	mov	r1, r4
c0de0604:	462a      	mov	r2, r5
c0de0606:	2320      	movs	r3, #32
c0de0608:	f007 fa77 	bl	c0de7afa <cx_ecfp_scalar_mult_no_throw>
c0de060c:	2800      	cmp	r0, #0
c0de060e:	d147      	bne.n	c0de06a0 <stream_eddsa_sign_step3+0x170>
c0de0610:	a912      	add	r1, sp, #72	@ 0x48
c0de0612:	2071      	movs	r0, #113	@ 0x71
c0de0614:	f007 fcb3 	bl	c0de7f7e <cx_ecdomain_parameters_length>
c0de0618:	2800      	cmp	r0, #0
c0de061a:	d141      	bne.n	c0de06a0 <stream_eddsa_sign_step3+0x170>
c0de061c:	f894 0020 	ldrb.w	r0, [r4, #32]
c0de0620:	07c0      	lsls	r0, r0, #31
c0de0622:	d003      	beq.n	c0de062c <stream_eddsa_sign_step3+0xfc>
c0de0624:	7838      	ldrb	r0, [r7, #0]
c0de0626:	f040 0080 	orr.w	r0, r0, #128	@ 0x80
c0de062a:	7038      	strb	r0, [r7, #0]
c0de062c:	f106 00e0 	add.w	r0, r6, #224	@ 0xe0
c0de0630:	f106 01c1 	add.w	r1, r6, #193	@ 0xc1
c0de0634:	2200      	movs	r2, #0
c0de0636:	bf00      	nop
c0de0638:	7803      	ldrb	r3, [r0, #0]
c0de063a:	5c8d      	ldrb	r5, [r1, r2]
c0de063c:	548b      	strb	r3, [r1, r2]
c0de063e:	3201      	adds	r2, #1
c0de0640:	2a10      	cmp	r2, #16
c0de0642:	f800 5901 	strb.w	r5, [r0], #-1
c0de0646:	d1f7      	bne.n	c0de0638 <stream_eddsa_sign_step3+0x108>
c0de0648:	f106 0460 	add.w	r4, r6, #96	@ 0x60
c0de064c:	4620      	mov	r0, r4
c0de064e:	4639      	mov	r1, r7
c0de0650:	2220      	movs	r2, #32
c0de0652:	f007 ff2e 	bl	c0de84b2 <__aeabi_memcpy>
c0de0656:	4650      	mov	r0, sl
c0de0658:	f007 fa6f 	bl	c0de7b3a <cx_sha512_init_no_throw>
c0de065c:	4640      	mov	r0, r8
c0de065e:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de0662:	f007 fa3a 	bl	c0de7ada <cx_blake2b_init_no_throw>
c0de0666:	b9d8      	cbnz	r0, c0de06a0 <stream_eddsa_sign_step3+0x170>
c0de0668:	2500      	movs	r5, #0
c0de066a:	4650      	mov	r0, sl
c0de066c:	2100      	movs	r1, #0
c0de066e:	4622      	mov	r2, r4
c0de0670:	2320      	movs	r3, #32
c0de0672:	9500      	str	r5, [sp, #0]
c0de0674:	9501      	str	r5, [sp, #4]
c0de0676:	f007 fa4c 	bl	c0de7b12 <cx_hash_no_throw>
c0de067a:	b988      	cbnz	r0, c0de06a0 <stream_eddsa_sign_step3+0x170>
c0de067c:	4650      	mov	r0, sl
c0de067e:	f007 fa44 	bl	c0de7b0a <cx_hash_get_size>
c0de0682:	4650      	mov	r0, sl
c0de0684:	2100      	movs	r1, #0
c0de0686:	4632      	mov	r2, r6
c0de0688:	2320      	movs	r3, #32
c0de068a:	9500      	str	r5, [sp, #0]
c0de068c:	9501      	str	r5, [sp, #4]
c0de068e:	f007 fa40 	bl	c0de7b12 <cx_hash_no_throw>
c0de0692:	b928      	cbnz	r0, c0de06a0 <stream_eddsa_sign_step3+0x170>
c0de0694:	4650      	mov	r0, sl
c0de0696:	f007 fa38 	bl	c0de7b0a <cx_hash_get_size>
c0de069a:	b013      	add	sp, #76	@ 0x4c
c0de069c:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de06a0:	f007 fa5b 	bl	c0de7b5a <os_longjmp>

c0de06a4 <stream_eddsa_sign_step5>:
c0de06a4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de06a8:	b0a3      	sub	sp, #140	@ 0x8c
c0de06aa:	4604      	mov	r4, r0
c0de06ac:	f500 75dc 	add.w	r5, r0, #440	@ 0x1b8
c0de06b0:	a803      	add	r0, sp, #12
c0de06b2:	4688      	mov	r8, r1
c0de06b4:	2720      	movs	r7, #32
c0de06b6:	9000      	str	r0, [sp, #0]
c0de06b8:	4628      	mov	r0, r5
c0de06ba:	2101      	movs	r1, #1
c0de06bc:	2200      	movs	r2, #0
c0de06be:	2300      	movs	r3, #0
c0de06c0:	9701      	str	r7, [sp, #4]
c0de06c2:	f007 fa26 	bl	c0de7b12 <cx_hash_no_throw>
c0de06c6:	2800      	cmp	r0, #0
c0de06c8:	f040 8081 	bne.w	c0de07ce <stream_eddsa_sign_step5+0x12a>
c0de06cc:	4628      	mov	r0, r5
c0de06ce:	f007 fa1c 	bl	c0de7b0a <cx_hash_get_size>
c0de06d2:	f240 0000 	movw	r0, #0
c0de06d6:	f2c0 0000 	movt	r0, #0
c0de06da:	4448      	add	r0, r9
c0de06dc:	f200 306d 	addw	r0, r0, #877	@ 0x36d
c0de06e0:	a903      	add	r1, sp, #12
c0de06e2:	2220      	movs	r2, #32
c0de06e4:	f007 fef4 	bl	c0de84d0 <memcmp>
c0de06e8:	2800      	cmp	r0, #0
c0de06ea:	d172      	bne.n	c0de07d2 <stream_eddsa_sign_step5+0x12e>
c0de06ec:	f104 05ec 	add.w	r5, r4, #236	@ 0xec
c0de06f0:	2040      	movs	r0, #64	@ 0x40
c0de06f2:	ae13      	add	r6, sp, #76	@ 0x4c
c0de06f4:	9001      	str	r0, [sp, #4]
c0de06f6:	4628      	mov	r0, r5
c0de06f8:	2101      	movs	r1, #1
c0de06fa:	2200      	movs	r2, #0
c0de06fc:	2300      	movs	r3, #0
c0de06fe:	9600      	str	r6, [sp, #0]
c0de0700:	f007 fa07 	bl	c0de7b12 <cx_hash_no_throw>
c0de0704:	2800      	cmp	r0, #0
c0de0706:	d162      	bne.n	c0de07ce <stream_eddsa_sign_step5+0x12a>
c0de0708:	4628      	mov	r0, r5
c0de070a:	f007 f9fe 	bl	c0de7b0a <cx_hash_get_size>
c0de070e:	2000      	movs	r0, #0
c0de0710:	213f      	movs	r1, #63	@ 0x3f
c0de0712:	bf00      	nop
c0de0714:	5c72      	ldrb	r2, [r6, r1]
c0de0716:	5c33      	ldrb	r3, [r6, r0]
c0de0718:	5432      	strb	r2, [r6, r0]
c0de071a:	3001      	adds	r0, #1
c0de071c:	5473      	strb	r3, [r6, r1]
c0de071e:	2820      	cmp	r0, #32
c0de0720:	f1a1 0101 	sub.w	r1, r1, #1
c0de0724:	d1f6      	bne.n	c0de0714 <stream_eddsa_sign_step5+0x70>
c0de0726:	f648 02a4 	movw	r2, #34980	@ 0x88a4
c0de072a:	f2c0 0200 	movt	r2, #0
c0de072e:	af13      	add	r7, sp, #76	@ 0x4c
c0de0730:	447a      	add	r2, pc
c0de0732:	4638      	mov	r0, r7
c0de0734:	2140      	movs	r1, #64	@ 0x40
c0de0736:	2320      	movs	r3, #32
c0de0738:	f007 f9f7 	bl	c0de7b2a <cx_math_modm_no_throw>
c0de073c:	2800      	cmp	r0, #0
c0de073e:	d146      	bne.n	c0de07ce <stream_eddsa_sign_step5+0x12a>
c0de0740:	f648 0288 	movw	r2, #34952	@ 0x8888
c0de0744:	f104 0520 	add.w	r5, r4, #32
c0de0748:	f2c0 0200 	movt	r2, #0
c0de074c:	447a      	add	r2, pc
c0de074e:	4628      	mov	r0, r5
c0de0750:	2120      	movs	r1, #32
c0de0752:	2320      	movs	r3, #32
c0de0754:	f04f 0a20 	mov.w	sl, #32
c0de0758:	f007 f9e7 	bl	c0de7b2a <cx_math_modm_no_throw>
c0de075c:	bbb8      	cbnz	r0, c0de07ce <stream_eddsa_sign_step5+0x12a>
c0de075e:	f648 0366 	movw	r3, #34918	@ 0x8866
c0de0762:	f104 0680 	add.w	r6, r4, #128	@ 0x80
c0de0766:	f2c0 0300 	movt	r3, #0
c0de076a:	f107 0120 	add.w	r1, r7, #32
c0de076e:	447b      	add	r3, pc
c0de0770:	4630      	mov	r0, r6
c0de0772:	462a      	mov	r2, r5
c0de0774:	f8cd a000 	str.w	sl, [sp]
c0de0778:	f007 f9db 	bl	c0de7b32 <cx_math_multm_no_throw>
c0de077c:	bb38      	cbnz	r0, c0de07ce <stream_eddsa_sign_step5+0x12a>
c0de077e:	f648 0348 	movw	r3, #34888	@ 0x8848
c0de0782:	f2c0 0300 	movt	r3, #0
c0de0786:	f104 0240 	add.w	r2, r4, #64	@ 0x40
c0de078a:	2720      	movs	r7, #32
c0de078c:	447b      	add	r3, pc
c0de078e:	4630      	mov	r0, r6
c0de0790:	4631      	mov	r1, r6
c0de0792:	9700      	str	r7, [sp, #0]
c0de0794:	f007 f9c5 	bl	c0de7b22 <cx_math_addm_no_throw>
c0de0798:	b9c8      	cbnz	r0, c0de07ce <stream_eddsa_sign_step5+0x12a>
c0de079a:	f104 009f 	add.w	r0, r4, #159	@ 0x9f
c0de079e:	2100      	movs	r1, #0
c0de07a0:	7802      	ldrb	r2, [r0, #0]
c0de07a2:	5c73      	ldrb	r3, [r6, r1]
c0de07a4:	5472      	strb	r2, [r6, r1]
c0de07a6:	3101      	adds	r1, #1
c0de07a8:	2910      	cmp	r1, #16
c0de07aa:	f800 3901 	strb.w	r3, [r0], #-1
c0de07ae:	d1f7      	bne.n	c0de07a0 <stream_eddsa_sign_step5+0xfc>
c0de07b0:	f104 0160 	add.w	r1, r4, #96	@ 0x60
c0de07b4:	4640      	mov	r0, r8
c0de07b6:	2240      	movs	r2, #64	@ 0x40
c0de07b8:	f007 fe7d 	bl	c0de84b6 <__aeabi_memmove>
c0de07bc:	4620      	mov	r0, r4
c0de07be:	f44f 712e 	mov.w	r1, #696	@ 0x2b8
c0de07c2:	f007 fe73 	bl	c0de84ac <__aeabi_memclr>
c0de07c6:	2040      	movs	r0, #64	@ 0x40
c0de07c8:	b023      	add	sp, #140	@ 0x8c
c0de07ca:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de07ce:	f007 f9c4 	bl	c0de7b5a <os_longjmp>
c0de07d2:	f249 1001 	movw	r0, #37121	@ 0x9101
c0de07d6:	f007 f9c0 	bl	c0de7b5a <os_longjmp>

c0de07da <waves_public_key_to_address>:
c0de07da:	b570      	push	{r4, r5, r6, lr}
c0de07dc:	b098      	sub	sp, #96	@ 0x60
c0de07de:	ae10      	add	r6, sp, #64	@ 0x40
c0de07e0:	4614      	mov	r4, r2
c0de07e2:	460d      	mov	r5, r1
c0de07e4:	2120      	movs	r1, #32
c0de07e6:	4632      	mov	r2, r6
c0de07e8:	f7ff fd88 	bl	c0de02fc <blake2b_256>
c0de07ec:	4630      	mov	r0, r6
c0de07ee:	2120      	movs	r1, #32
c0de07f0:	4632      	mov	r2, r6
c0de07f2:	f7ff fda1 	bl	c0de0338 <keccak_256>
c0de07f6:	2001      	movs	r0, #1
c0de07f8:	f88d 5027 	strb.w	r5, [sp, #39]	@ 0x27
c0de07fc:	f10d 0526 	add.w	r5, sp, #38	@ 0x26
c0de0800:	f88d 0026 	strb.w	r0, [sp, #38]	@ 0x26
c0de0804:	1ca8      	adds	r0, r5, #2
c0de0806:	4631      	mov	r1, r6
c0de0808:	2214      	movs	r2, #20
c0de080a:	f007 fe52 	bl	c0de84b2 <__aeabi_memcpy>
c0de080e:	ae01      	add	r6, sp, #4
c0de0810:	4628      	mov	r0, r5
c0de0812:	2116      	movs	r1, #22
c0de0814:	4632      	mov	r2, r6
c0de0816:	f7ff fd71 	bl	c0de02fc <blake2b_256>
c0de081a:	4630      	mov	r0, r6
c0de081c:	2120      	movs	r1, #32
c0de081e:	4632      	mov	r2, r6
c0de0820:	f7ff fd8a 	bl	c0de0338 <keccak_256>
c0de0824:	9801      	ldr	r0, [sp, #4]
c0de0826:	462a      	mov	r2, r5
c0de0828:	0e01      	lsrs	r1, r0, #24
c0de082a:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de082e:	f88d 103f 	strb.w	r1, [sp, #63]	@ 0x3f
c0de0832:	0c01      	lsrs	r1, r0, #16
c0de0834:	0a00      	lsrs	r0, r0, #8
c0de0836:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de083a:	2024      	movs	r0, #36	@ 0x24
c0de083c:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de0840:	9000      	str	r0, [sp, #0]
c0de0842:	4669      	mov	r1, sp
c0de0844:	4620      	mov	r0, r4
c0de0846:	231a      	movs	r3, #26
c0de0848:	f7ff fc4a 	bl	c0de00e0 <b58enc>
c0de084c:	b018      	add	sp, #96	@ 0x60
c0de084e:	bd70      	pop	{r4, r5, r6, pc}

c0de0850 <waves_public_key_hash_to_address>:
c0de0850:	b570      	push	{r4, r5, r6, lr}
c0de0852:	b090      	sub	sp, #64	@ 0x40
c0de0854:	4614      	mov	r4, r2
c0de0856:	4602      	mov	r2, r0
c0de0858:	2001      	movs	r0, #1
c0de085a:	f10d 0526 	add.w	r5, sp, #38	@ 0x26
c0de085e:	f88d 0026 	strb.w	r0, [sp, #38]	@ 0x26
c0de0862:	f88d 1027 	strb.w	r1, [sp, #39]	@ 0x27
c0de0866:	1ca8      	adds	r0, r5, #2
c0de0868:	4611      	mov	r1, r2
c0de086a:	2214      	movs	r2, #20
c0de086c:	f007 fe21 	bl	c0de84b2 <__aeabi_memcpy>
c0de0870:	ae01      	add	r6, sp, #4
c0de0872:	4628      	mov	r0, r5
c0de0874:	2116      	movs	r1, #22
c0de0876:	4632      	mov	r2, r6
c0de0878:	f7ff fd40 	bl	c0de02fc <blake2b_256>
c0de087c:	4630      	mov	r0, r6
c0de087e:	2120      	movs	r1, #32
c0de0880:	4632      	mov	r2, r6
c0de0882:	f7ff fd59 	bl	c0de0338 <keccak_256>
c0de0886:	9801      	ldr	r0, [sp, #4]
c0de0888:	462a      	mov	r2, r5
c0de088a:	0e01      	lsrs	r1, r0, #24
c0de088c:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de0890:	f88d 103f 	strb.w	r1, [sp, #63]	@ 0x3f
c0de0894:	0c01      	lsrs	r1, r0, #16
c0de0896:	0a00      	lsrs	r0, r0, #8
c0de0898:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de089c:	2024      	movs	r0, #36	@ 0x24
c0de089e:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de08a2:	9000      	str	r0, [sp, #0]
c0de08a4:	4669      	mov	r1, sp
c0de08a6:	4620      	mov	r0, r4
c0de08a8:	231a      	movs	r3, #26
c0de08aa:	f7ff fc19 	bl	c0de00e0 <b58enc>
c0de08ae:	b010      	add	sp, #64	@ 0x40
c0de08b0:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de08b4 <copy_in_reverse_order>:
c0de08b4:	b580      	push	{r7, lr}
c0de08b6:	b17a      	cbz	r2, c0de08d8 <copy_in_reverse_order+0x24>
c0de08b8:	f04f 0c00 	mov.w	ip, #0
c0de08bc:	f04f 0e00 	mov.w	lr, #0
c0de08c0:	ea6f 030c 	mvn.w	r3, ip
c0de08c4:	4413      	add	r3, r2
c0de08c6:	5ccb      	ldrb	r3, [r1, r3]
c0de08c8:	f10e 0e01 	add.w	lr, lr, #1
c0de08cc:	f800 300c 	strb.w	r3, [r0, ip]
c0de08d0:	fa1f fc8e 	uxth.w	ip, lr
c0de08d4:	4594      	cmp	ip, r2
c0de08d6:	d3f3      	bcc.n	c0de08c0 <copy_in_reverse_order+0xc>
c0de08d8:	bd80      	pop	{r7, pc}

c0de08da <deserialize_uint32_t>:
c0de08da:	7842      	ldrb	r2, [r0, #1]
c0de08dc:	7801      	ldrb	r1, [r0, #0]
c0de08de:	7883      	ldrb	r3, [r0, #2]
c0de08e0:	0412      	lsls	r2, r2, #16
c0de08e2:	78c0      	ldrb	r0, [r0, #3]
c0de08e4:	ea42 6101 	orr.w	r1, r2, r1, lsl #24
c0de08e8:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de08ec:	4408      	add	r0, r1
c0de08ee:	4770      	bx	lr

c0de08f0 <read_path_from_bytes>:
c0de08f0:	b580      	push	{r7, lr}
c0de08f2:	7843      	ldrb	r3, [r0, #1]
c0de08f4:	f890 c000 	ldrb.w	ip, [r0]
c0de08f8:	7882      	ldrb	r2, [r0, #2]
c0de08fa:	041b      	lsls	r3, r3, #16
c0de08fc:	f890 e003 	ldrb.w	lr, [r0, #3]
c0de0900:	ea43 630c 	orr.w	r3, r3, ip, lsl #24
c0de0904:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de0908:	4472      	add	r2, lr
c0de090a:	600a      	str	r2, [r1, #0]
c0de090c:	7943      	ldrb	r3, [r0, #5]
c0de090e:	f890 c004 	ldrb.w	ip, [r0, #4]
c0de0912:	7982      	ldrb	r2, [r0, #6]
c0de0914:	041b      	lsls	r3, r3, #16
c0de0916:	f890 e007 	ldrb.w	lr, [r0, #7]
c0de091a:	ea43 630c 	orr.w	r3, r3, ip, lsl #24
c0de091e:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de0922:	4472      	add	r2, lr
c0de0924:	604a      	str	r2, [r1, #4]
c0de0926:	7a43      	ldrb	r3, [r0, #9]
c0de0928:	f890 c008 	ldrb.w	ip, [r0, #8]
c0de092c:	7a82      	ldrb	r2, [r0, #10]
c0de092e:	041b      	lsls	r3, r3, #16
c0de0930:	f890 e00b 	ldrb.w	lr, [r0, #11]
c0de0934:	ea43 630c 	orr.w	r3, r3, ip, lsl #24
c0de0938:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de093c:	4472      	add	r2, lr
c0de093e:	608a      	str	r2, [r1, #8]
c0de0940:	7b43      	ldrb	r3, [r0, #13]
c0de0942:	f890 c00c 	ldrb.w	ip, [r0, #12]
c0de0946:	7b82      	ldrb	r2, [r0, #14]
c0de0948:	041b      	lsls	r3, r3, #16
c0de094a:	f890 e00f 	ldrb.w	lr, [r0, #15]
c0de094e:	ea43 630c 	orr.w	r3, r3, ip, lsl #24
c0de0952:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de0956:	4472      	add	r2, lr
c0de0958:	60ca      	str	r2, [r1, #12]
c0de095a:	7c43      	ldrb	r3, [r0, #17]
c0de095c:	f890 c010 	ldrb.w	ip, [r0, #16]
c0de0960:	7c82      	ldrb	r2, [r0, #18]
c0de0962:	041b      	lsls	r3, r3, #16
c0de0964:	7cc0      	ldrb	r0, [r0, #19]
c0de0966:	ea43 630c 	orr.w	r3, r3, ip, lsl #24
c0de096a:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de096e:	4410      	add	r0, r2
c0de0970:	6108      	str	r0, [r1, #16]
c0de0972:	bd80      	pop	{r7, pc}

c0de0974 <hash_stream_data>:
c0de0974:	b5b0      	push	{r4, r5, r7, lr}
c0de0976:	f240 0c00 	movw	ip, #0
c0de097a:	f2c0 0c00 	movt	ip, #0
c0de097e:	eb09 050c 	add.w	r5, r9, ip
c0de0982:	f8d5 33b8 	ldr.w	r3, [r5, #952]	@ 0x3b8
c0de0986:	e9d5 45ec 	ldrd	r4, r5, [r5, #944]	@ 0x3b0
c0de098a:	1ac0      	subs	r0, r0, r3
c0de098c:	2c00      	cmp	r4, #0
c0de098e:	eba5 0404 	sub.w	r4, r5, r4
c0de0992:	d108      	bne.n	c0de09a6 <hash_stream_data+0x32>
c0de0994:	eb09 050c 	add.w	r5, r9, ip
c0de0998:	f895 239b 	ldrb.w	r2, [r5, #923]	@ 0x39b
c0de099c:	1a80      	subs	r0, r0, r2
c0de099e:	1aa4      	subs	r4, r4, r2
c0de09a0:	4413      	add	r3, r2
c0de09a2:	f8c5 33b8 	str.w	r3, [r5, #952]	@ 0x3b8
c0de09a6:	42a0      	cmp	r0, r4
c0de09a8:	bf38      	it	cc
c0de09aa:	4604      	movcc	r4, r0
c0de09ac:	1858      	adds	r0, r3, r1
c0de09ae:	f240 51f8 	movw	r1, #1528	@ 0x5f8
c0de09b2:	f2c0 0100 	movt	r1, #0
c0de09b6:	4449      	add	r1, r9
c0de09b8:	eb09 050c 	add.w	r5, r9, ip
c0de09bc:	4401      	add	r1, r0
c0de09be:	4628      	mov	r0, r5
c0de09c0:	4622      	mov	r2, r4
c0de09c2:	f7ff fd88 	bl	c0de04d6 <stream_eddsa_sign_step2>
c0de09c6:	f8d5 03b0 	ldr.w	r0, [r5, #944]	@ 0x3b0
c0de09ca:	f8d5 13b8 	ldr.w	r1, [r5, #952]	@ 0x3b8
c0de09ce:	4420      	add	r0, r4
c0de09d0:	f8c5 03b0 	str.w	r0, [r5, #944]	@ 0x3b0
c0de09d4:	1908      	adds	r0, r1, r4
c0de09d6:	f8c5 03b8 	str.w	r0, [r5, #952]	@ 0x3b8
c0de09da:	bdb0      	pop	{r4, r5, r7, pc}

c0de09dc <make_sign_step>:
c0de09dc:	b570      	push	{r4, r5, r6, lr}
c0de09de:	b09e      	sub	sp, #120	@ 0x78
c0de09e0:	f240 0400 	movw	r4, #0
c0de09e4:	f2c0 0400 	movt	r4, #0
c0de09e8:	eb09 0204 	add.w	r2, r9, r4
c0de09ec:	f892 339a 	ldrb.w	r3, [r2, #922]	@ 0x39a
c0de09f0:	4602      	mov	r2, r0
c0de09f2:	2b04      	cmp	r3, #4
c0de09f4:	d02a      	beq.n	c0de0a4c <make_sign_step+0x70>
c0de09f6:	2b02      	cmp	r3, #2
c0de09f8:	d01b      	beq.n	c0de0a32 <make_sign_step+0x56>
c0de09fa:	2b01      	cmp	r3, #1
c0de09fc:	d146      	bne.n	c0de0a8c <make_sign_step+0xb0>
c0de09fe:	444c      	add	r4, r9
c0de0a00:	ad0b      	add	r5, sp, #44	@ 0x2c
c0de0a02:	ae01      	add	r6, sp, #4
c0de0a04:	f504 7067 	add.w	r0, r4, #924	@ 0x39c
c0de0a08:	4629      	mov	r1, r5
c0de0a0a:	4632      	mov	r2, r6
c0de0a0c:	f7ff fc31 	bl	c0de0272 <get_keypair_by_path>
c0de0a10:	4620      	mov	r0, r4
c0de0a12:	4631      	mov	r1, r6
c0de0a14:	f7ff fcae 	bl	c0de0374 <stream_eddsa_sign_step1>
c0de0a18:	4628      	mov	r0, r5
c0de0a1a:	f7ff fc07 	bl	c0de022c <public_key_le_to_be>
c0de0a1e:	f89d 0053 	ldrb.w	r0, [sp, #83]	@ 0x53
c0de0a22:	f000 0080 	and.w	r0, r0, #128	@ 0x80
c0de0a26:	f884 0320 	strb.w	r0, [r4, #800]	@ 0x320
c0de0a2a:	2002      	movs	r0, #2
c0de0a2c:	f884 039a 	strb.w	r0, [r4, #922]	@ 0x39a
c0de0a30:	e02c      	b.n	c0de0a8c <make_sign_step+0xb0>
c0de0a32:	eb09 0004 	add.w	r0, r9, r4
c0de0a36:	e9d0 03ec 	ldrd	r0, r3, [r0, #944]	@ 0x3b0
c0de0a3a:	4298      	cmp	r0, r3
c0de0a3c:	d21c      	bcs.n	c0de0a78 <make_sign_step+0x9c>
c0de0a3e:	4608      	mov	r0, r1
c0de0a40:	4611      	mov	r1, r2
c0de0a42:	b01e      	add	sp, #120	@ 0x78
c0de0a44:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de0a48:	f7ff bf94 	b.w	c0de0974 <hash_stream_data>
c0de0a4c:	eb09 0004 	add.w	r0, r9, r4
c0de0a50:	e9d0 03ec 	ldrd	r0, r3, [r0, #944]	@ 0x3b0
c0de0a54:	4298      	cmp	r0, r3
c0de0a56:	d219      	bcs.n	c0de0a8c <make_sign_step+0xb0>
c0de0a58:	4608      	mov	r0, r1
c0de0a5a:	4611      	mov	r1, r2
c0de0a5c:	f7ff ff8a 	bl	c0de0974 <hash_stream_data>
c0de0a60:	eb09 0004 	add.w	r0, r9, r4
c0de0a64:	e9d0 01ec 	ldrd	r0, r1, [r0, #944]	@ 0x3b0
c0de0a68:	4288      	cmp	r0, r1
c0de0a6a:	bf02      	ittt	eq
c0de0a6c:	eb09 0004 	addeq.w	r0, r9, r4
c0de0a70:	2105      	moveq	r1, #5
c0de0a72:	f880 139a 	strbeq.w	r1, [r0, #922]	@ 0x39a
c0de0a76:	e009      	b.n	c0de0a8c <make_sign_step+0xb0>
c0de0a78:	444c      	add	r4, r9
c0de0a7a:	4620      	mov	r0, r4
c0de0a7c:	f7ff fd58 	bl	c0de0530 <stream_eddsa_sign_step3>
c0de0a80:	2004      	movs	r0, #4
c0de0a82:	f884 039a 	strb.w	r0, [r4, #922]	@ 0x39a
c0de0a86:	2000      	movs	r0, #0
c0de0a88:	f8c4 03b0 	str.w	r0, [r4, #944]	@ 0x3b0
c0de0a8c:	b01e      	add	sp, #120	@ 0x78
c0de0a8e:	bd70      	pop	{r4, r5, r6, pc}

c0de0a90 <make_allowed_sign_steps>:
c0de0a90:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0a92:	b081      	sub	sp, #4
c0de0a94:	f240 0600 	movw	r6, #0
c0de0a98:	f240 50f8 	movw	r0, #1528	@ 0x5f8
c0de0a9c:	f2c0 0600 	movt	r6, #0
c0de0aa0:	f2c0 0000 	movt	r0, #0
c0de0aa4:	eb09 0206 	add.w	r2, r9, r6
c0de0aa8:	eb09 0100 	add.w	r1, r9, r0
c0de0aac:	f8d2 23bc 	ldr.w	r2, [r2, #956]	@ 0x3bc
c0de0ab0:	790d      	ldrb	r5, [r1, #4]
c0de0ab2:	b10a      	cbz	r2, c0de0ab8 <make_allowed_sign_steps+0x28>
c0de0ab4:	2405      	movs	r4, #5
c0de0ab6:	e035      	b.n	c0de0b24 <make_allowed_sign_steps+0x94>
c0de0ab8:	eb09 0700 	add.w	r7, r9, r0
c0de0abc:	eb09 0406 	add.w	r4, r9, r6
c0de0ac0:	1d78      	adds	r0, r7, #5
c0de0ac2:	f504 7167 	add.w	r1, r4, #924	@ 0x39c
c0de0ac6:	f7ff ff13 	bl	c0de08f0 <read_path_from_bytes>
c0de0aca:	7e78      	ldrb	r0, [r7, #25]
c0de0acc:	7eb9      	ldrb	r1, [r7, #26]
c0de0ace:	f884 0321 	strb.w	r0, [r4, #801]	@ 0x321
c0de0ad2:	7f78      	ldrb	r0, [r7, #29]
c0de0ad4:	f884 1322 	strb.w	r1, [r4, #802]	@ 0x322
c0de0ad8:	f884 0325 	strb.w	r0, [r4, #805]	@ 0x325
c0de0adc:	7ff8      	ldrb	r0, [r7, #31]
c0de0ade:	7fb9      	ldrb	r1, [r7, #30]
c0de0ae0:	7efa      	ldrb	r2, [r7, #27]
c0de0ae2:	0400      	lsls	r0, r0, #16
c0de0ae4:	ea40 6001 	orr.w	r0, r0, r1, lsl #24
c0de0ae8:	f897 1020 	ldrb.w	r1, [r7, #32]
c0de0aec:	f884 2323 	strb.w	r2, [r4, #803]	@ 0x323
c0de0af0:	f897 2021 	ldrb.w	r2, [r7, #33]	@ 0x21
c0de0af4:	7f3b      	ldrb	r3, [r7, #28]
c0de0af6:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de0afa:	4410      	add	r0, r2
c0de0afc:	f884 3324 	strb.w	r3, [r4, #804]	@ 0x324
c0de0b00:	f8c4 03b4 	str.w	r0, [r4, #948]	@ 0x3b4
c0de0b04:	f004 fb82 	bl	c0de520c <getMessageType>
c0de0b08:	f894 1321 	ldrb.w	r1, [r4, #801]	@ 0x321
c0de0b0c:	f8c4 0328 	str.w	r0, [r4, #808]	@ 0x328
c0de0b10:	2909      	cmp	r1, #9
c0de0b12:	d223      	bcs.n	c0de0b5c <make_allowed_sign_steps+0xcc>
c0de0b14:	eb09 0006 	add.w	r0, r9, r6
c0de0b18:	f890 0322 	ldrb.w	r0, [r0, #802]	@ 0x322
c0de0b1c:	2809      	cmp	r0, #9
c0de0b1e:	d21d      	bcs.n	c0de0b5c <make_allowed_sign_steps+0xcc>
c0de0b20:	3d1d      	subs	r5, #29
c0de0b22:	2422      	movs	r4, #34	@ 0x22
c0de0b24:	eb09 0006 	add.w	r0, r9, r6
c0de0b28:	f8d0 13b8 	ldr.w	r1, [r0, #952]	@ 0x3b8
c0de0b2c:	b2ed      	uxtb	r5, r5
c0de0b2e:	42a9      	cmp	r1, r5
c0de0b30:	d212      	bcs.n	c0de0b58 <make_allowed_sign_steps+0xc8>
c0de0b32:	f890 039a 	ldrb.w	r0, [r0, #922]	@ 0x39a
c0de0b36:	2804      	cmp	r0, #4
c0de0b38:	d80e      	bhi.n	c0de0b58 <make_allowed_sign_steps+0xc8>
c0de0b3a:	bf00      	nop
c0de0b3c:	4620      	mov	r0, r4
c0de0b3e:	4629      	mov	r1, r5
c0de0b40:	f7ff ff4c 	bl	c0de09dc <make_sign_step>
c0de0b44:	eb09 0006 	add.w	r0, r9, r6
c0de0b48:	f8d0 13b8 	ldr.w	r1, [r0, #952]	@ 0x3b8
c0de0b4c:	42a9      	cmp	r1, r5
c0de0b4e:	d203      	bcs.n	c0de0b58 <make_allowed_sign_steps+0xc8>
c0de0b50:	f890 039a 	ldrb.w	r0, [r0, #922]	@ 0x39a
c0de0b54:	2805      	cmp	r0, #5
c0de0b56:	d3f1      	bcc.n	c0de0b3c <make_allowed_sign_steps+0xac>
c0de0b58:	b001      	add	sp, #4
c0de0b5a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de0b5c:	f249 1003 	movw	r0, #37123	@ 0x9103
c0de0b60:	f006 fffb 	bl	c0de7b5a <os_longjmp>

c0de0b64 <set_result_sign>:
c0de0b64:	b510      	push	{r4, lr}
c0de0b66:	f240 0000 	movw	r0, #0
c0de0b6a:	f2c0 0000 	movt	r0, #0
c0de0b6e:	eb09 0400 	add.w	r4, r9, r0
c0de0b72:	f894 0320 	ldrb.w	r0, [r4, #800]	@ 0x320
c0de0b76:	f894 236c 	ldrb.w	r2, [r4, #876]	@ 0x36c
c0de0b7a:	f204 312d 	addw	r1, r4, #813	@ 0x32d
c0de0b7e:	4310      	orrs	r0, r2
c0de0b80:	f884 036c 	strb.w	r0, [r4, #876]	@ 0x36c
c0de0b84:	f240 50f8 	movw	r0, #1528	@ 0x5f8
c0de0b88:	f2c0 0000 	movt	r0, #0
c0de0b8c:	4448      	add	r0, r9
c0de0b8e:	2240      	movs	r2, #64	@ 0x40
c0de0b90:	f007 fc8f 	bl	c0de84b2 <__aeabi_memcpy>
c0de0b94:	4620      	mov	r0, r4
c0de0b96:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0b9a:	f007 fc87 	bl	c0de84ac <__aeabi_memclr>
c0de0b9e:	2040      	movs	r0, #64	@ 0x40
c0de0ba0:	bd10      	pop	{r4, pc}

c0de0ba2 <set_result_get_address>:
c0de0ba2:	b5b0      	push	{r4, r5, r7, lr}
c0de0ba4:	f240 50f8 	movw	r0, #1528	@ 0x5f8
c0de0ba8:	f2c0 0000 	movt	r0, #0
c0de0bac:	eb09 0400 	add.w	r4, r9, r0
c0de0bb0:	f240 0000 	movw	r0, #0
c0de0bb4:	f2c0 0000 	movt	r0, #0
c0de0bb8:	eb09 0500 	add.w	r5, r9, r0
c0de0bbc:	f105 0124 	add.w	r1, r5, #36	@ 0x24
c0de0bc0:	4620      	mov	r0, r4
c0de0bc2:	2220      	movs	r2, #32
c0de0bc4:	f007 fc75 	bl	c0de84b2 <__aeabi_memcpy>
c0de0bc8:	f104 0020 	add.w	r0, r4, #32
c0de0bcc:	4629      	mov	r1, r5
c0de0bce:	2223      	movs	r2, #35	@ 0x23
c0de0bd0:	f007 fc6f 	bl	c0de84b2 <__aeabi_memcpy>
c0de0bd4:	4628      	mov	r0, r5
c0de0bd6:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0bda:	f007 fc67 	bl	c0de84ac <__aeabi_memclr>
c0de0bde:	2043      	movs	r0, #67	@ 0x43
c0de0be0:	bdb0      	pop	{r4, r5, r7, pc}

c0de0be2 <handle_apdu>:
c0de0be2:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0be6:	b0b0      	sub	sp, #192	@ 0xc0
c0de0be8:	ad23      	add	r5, sp, #140	@ 0x8c
c0de0bea:	4680      	mov	r8, r0
c0de0bec:	4628      	mov	r0, r5
c0de0bee:	460e      	mov	r6, r1
c0de0bf0:	922f      	str	r2, [sp, #188]	@ 0xbc
c0de0bf2:	f007 fcad 	bl	c0de8550 <setjmp>
c0de0bf6:	b284      	uxth	r4, r0
c0de0bf8:	f8ad 00b8 	strh.w	r0, [sp, #184]	@ 0xb8
c0de0bfc:	b1bc      	cbz	r4, c0de0c2e <handle_apdu+0x4c>
c0de0bfe:	2c05      	cmp	r4, #5
c0de0c00:	f000 80f0 	beq.w	c0de0de4 <handle_apdu+0x202>
c0de0c04:	4607      	mov	r7, r0
c0de0c06:	982d      	ldr	r0, [sp, #180]	@ 0xb4
c0de0c08:	2100      	movs	r1, #0
c0de0c0a:	f8ad 10b8 	strh.w	r1, [sp, #184]	@ 0xb8
c0de0c0e:	f007 fa6f 	bl	c0de80f0 <try_context_set>
c0de0c12:	f404 4070 	and.w	r0, r4, #61440	@ 0xf000
c0de0c16:	f5b0 4fc0 	cmp.w	r0, #24576	@ 0x6000
c0de0c1a:	d002      	beq.n	c0de0c22 <handle_apdu+0x40>
c0de0c1c:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de0c20:	d17c      	bne.n	c0de0d1c <handle_apdu+0x13a>
c0de0c22:	f5b4 4f10 	cmp.w	r4, #36864	@ 0x9000
c0de0c26:	d17e      	bne.n	c0de0d26 <handle_apdu+0x144>
c0de0c28:	2190      	movs	r1, #144	@ 0x90
c0de0c2a:	2000      	movs	r0, #0
c0de0c2c:	e08a      	b.n	c0de0d44 <handle_apdu+0x162>
c0de0c2e:	a823      	add	r0, sp, #140	@ 0x8c
c0de0c30:	f007 fa5e 	bl	c0de80f0 <try_context_set>
c0de0c34:	902d      	str	r0, [sp, #180]	@ 0xb4
c0de0c36:	f007 f9e9 	bl	c0de800c <os_global_pin_is_validated>
c0de0c3a:	28aa      	cmp	r0, #170	@ 0xaa
c0de0c3c:	f040 80db 	bne.w	c0de0df6 <handle_apdu+0x214>
c0de0c40:	f240 55f8 	movw	r5, #1528	@ 0x5f8
c0de0c44:	4648      	mov	r0, r9
c0de0c46:	f2c0 0500 	movt	r5, #0
c0de0c4a:	f819 0005 	ldrb.w	r0, [r9, r5]
c0de0c4e:	2880      	cmp	r0, #128	@ 0x80
c0de0c50:	f040 80d5 	bne.w	c0de0dfe <handle_apdu+0x21c>
c0de0c54:	4648      	mov	r0, r9
c0de0c56:	eb09 0005 	add.w	r0, r9, r5
c0de0c5a:	7840      	ldrb	r0, [r0, #1]
c0de0c5c:	2804      	cmp	r0, #4
c0de0c5e:	f040 808e 	bne.w	c0de0d7e <handle_apdu+0x19c>
c0de0c62:	4648      	mov	r0, r9
c0de0c64:	eb09 0005 	add.w	r0, r9, r5
c0de0c68:	7900      	ldrb	r0, [r0, #4]
c0de0c6a:	992f      	ldr	r1, [sp, #188]	@ 0xbc
c0de0c6c:	2814      	cmp	r0, #20
c0de0c6e:	f040 8171 	bne.w	c0de0f54 <handle_apdu+0x372>
c0de0c72:	3905      	subs	r1, #5
c0de0c74:	4281      	cmp	r1, r0
c0de0c76:	f040 816d 	bne.w	c0de0f54 <handle_apdu+0x372>
c0de0c7a:	e9cd 6800 	strd	r6, r8, [sp]
c0de0c7e:	f240 0600 	movw	r6, #0
c0de0c82:	f2c0 0600 	movt	r6, #0
c0de0c86:	eb09 0006 	add.w	r0, r9, r6
c0de0c8a:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0c8e:	464c      	mov	r4, r9
c0de0c90:	f007 fc0c 	bl	c0de84ac <__aeabi_memclr>
c0de0c94:	eb09 0005 	add.w	r0, r9, r5
c0de0c98:	ac0b      	add	r4, sp, #44	@ 0x2c
c0de0c9a:	3005      	adds	r0, #5
c0de0c9c:	4621      	mov	r1, r4
c0de0c9e:	f7ff fe27 	bl	c0de08f0 <read_path_from_bytes>
c0de0ca2:	af10      	add	r7, sp, #64	@ 0x40
c0de0ca4:	4620      	mov	r0, r4
c0de0ca6:	4639      	mov	r1, r7
c0de0ca8:	f7ff fb10 	bl	c0de02cc <get_curve25519_public_key_for_path>
c0de0cac:	2800      	cmp	r0, #0
c0de0cae:	f000 80aa 	beq.w	c0de0e06 <handle_apdu+0x224>
c0de0cb2:	eb09 0805 	add.w	r8, r9, r5
c0de0cb6:	f898 1003 	ldrb.w	r1, [r8, #3]
c0de0cba:	3708      	adds	r7, #8
c0de0cbc:	f10d 0b08 	add.w	fp, sp, #8
c0de0cc0:	4638      	mov	r0, r7
c0de0cc2:	465a      	mov	r2, fp
c0de0cc4:	46ca      	mov	sl, r9
c0de0cc6:	f7ff fd88 	bl	c0de07da <waves_public_key_to_address>
c0de0cca:	463a      	mov	r2, r7
c0de0ccc:	eb09 0006 	add.w	r0, r9, r6
c0de0cd0:	46ac      	mov	ip, r5
c0de0cd2:	ca78      	ldmia	r2!, {r3, r4, r5, r6}
c0de0cd4:	f100 0124 	add.w	r1, r0, #36	@ 0x24
c0de0cd8:	c178      	stmia	r1!, {r3, r4, r5, r6}
c0de0cda:	e892 0078 	ldmia.w	r2, {r3, r4, r5, r6}
c0de0cde:	c178      	stmia	r1!, {r3, r4, r5, r6}
c0de0ce0:	e8bb 006c 	ldmia.w	fp!, {r2, r3, r5, r6}
c0de0ce4:	4601      	mov	r1, r0
c0de0ce6:	c16c      	stmia	r1!, {r2, r3, r5, r6}
c0de0ce8:	e8bb 006c 	ldmia.w	fp!, {r2, r3, r5, r6}
c0de0cec:	c16c      	stmia	r1!, {r2, r3, r5, r6}
c0de0cee:	f8bb 2000 	ldrh.w	r2, [fp]
c0de0cf2:	f89b 3002 	ldrb.w	r3, [fp, #2]
c0de0cf6:	800a      	strh	r2, [r1, #0]
c0de0cf8:	708b      	strb	r3, [r1, #2]
c0de0cfa:	f898 1002 	ldrb.w	r1, [r8, #2]
c0de0cfe:	2200      	movs	r2, #0
c0de0d00:	2900      	cmp	r1, #0
c0de0d02:	f880 2023 	strb.w	r2, [r0, #35]	@ 0x23
c0de0d06:	f000 8081 	beq.w	c0de0e0c <handle_apdu+0x22a>
c0de0d0a:	9901      	ldr	r1, [sp, #4]
c0de0d0c:	6808      	ldr	r0, [r1, #0]
c0de0d0e:	f040 0010 	orr.w	r0, r0, #16
c0de0d12:	6008      	str	r0, [r1, #0]
c0de0d14:	f004 f892 	bl	c0de4e3c <menu_address_init>
c0de0d18:	ad23      	add	r5, sp, #140	@ 0x8c
c0de0d1a:	e022      	b.n	c0de0d62 <handle_apdu+0x180>
c0de0d1c:	0a38      	lsrs	r0, r7, #8
c0de0d1e:	210d      	movs	r1, #13
c0de0d20:	f361 00df 	bfi	r0, r1, #3, #29
c0de0d24:	e000      	b.n	c0de0d28 <handle_apdu+0x146>
c0de0d26:	0a38      	lsrs	r0, r7, #8
c0de0d28:	4604      	mov	r4, r0
c0de0d2a:	f240 0000 	movw	r0, #0
c0de0d2e:	f2c0 0000 	movt	r0, #0
c0de0d32:	4448      	add	r0, r9
c0de0d34:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0d38:	f007 fbb8 	bl	c0de84ac <__aeabi_memclr>
c0de0d3c:	f004 f895 	bl	c0de4e6a <ui_idle>
c0de0d40:	4638      	mov	r0, r7
c0de0d42:	4621      	mov	r1, r4
c0de0d44:	f240 57f8 	movw	r7, #1528	@ 0x5f8
c0de0d48:	464a      	mov	r2, r9
c0de0d4a:	6833      	ldr	r3, [r6, #0]
c0de0d4c:	f2c0 0700 	movt	r7, #0
c0de0d50:	eb09 0207 	add.w	r2, r9, r7
c0de0d54:	54d1      	strb	r1, [r2, r3]
c0de0d56:	6831      	ldr	r1, [r6, #0]
c0de0d58:	4411      	add	r1, r2
c0de0d5a:	7048      	strb	r0, [r1, #1]
c0de0d5c:	6830      	ldr	r0, [r6, #0]
c0de0d5e:	3002      	adds	r0, #2
c0de0d60:	6030      	str	r0, [r6, #0]
c0de0d62:	f007 f9bb 	bl	c0de80dc <try_context_get>
c0de0d66:	42a8      	cmp	r0, r5
c0de0d68:	d102      	bne.n	c0de0d70 <handle_apdu+0x18e>
c0de0d6a:	982d      	ldr	r0, [sp, #180]	@ 0xb4
c0de0d6c:	f007 f9c0 	bl	c0de80f0 <try_context_set>
c0de0d70:	f8bd 00b8 	ldrh.w	r0, [sp, #184]	@ 0xb8
c0de0d74:	2800      	cmp	r0, #0
c0de0d76:	d147      	bne.n	c0de0e08 <handle_apdu+0x226>
c0de0d78:	b030      	add	sp, #192	@ 0xc0
c0de0d7a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de0d7e:	462c      	mov	r4, r5
c0de0d80:	2808      	cmp	r0, #8
c0de0d82:	d05d      	beq.n	c0de0e40 <handle_apdu+0x25e>
c0de0d84:	2806      	cmp	r0, #6
c0de0d86:	d071      	beq.n	c0de0e6c <handle_apdu+0x28a>
c0de0d88:	2802      	cmp	r0, #2
c0de0d8a:	d17d      	bne.n	c0de0e88 <handle_apdu+0x2a6>
c0de0d8c:	4648      	mov	r0, r9
c0de0d8e:	eb09 0004 	add.w	r0, r9, r4
c0de0d92:	7900      	ldrb	r0, [r0, #4]
c0de0d94:	992f      	ldr	r1, [sp, #188]	@ 0xbc
c0de0d96:	3905      	subs	r1, #5
c0de0d98:	4281      	cmp	r1, r0
c0de0d9a:	f040 80db 	bne.w	c0de0f54 <handle_apdu+0x372>
c0de0d9e:	4648      	mov	r0, r9
c0de0da0:	eb09 0004 	add.w	r0, r9, r4
c0de0da4:	7880      	ldrb	r0, [r0, #2]
c0de0da6:	0641      	lsls	r1, r0, #25
c0de0da8:	d172      	bne.n	c0de0e90 <handle_apdu+0x2ae>
c0de0daa:	4647      	mov	r7, r8
c0de0dac:	f240 0800 	movw	r8, #0
c0de0db0:	4649      	mov	r1, r9
c0de0db2:	f2c0 0800 	movt	r8, #0
c0de0db6:	eb09 0108 	add.w	r1, r9, r8
c0de0dba:	f891 139a 	ldrb.w	r1, [r1, #922]	@ 0x39a
c0de0dbe:	2905      	cmp	r1, #5
c0de0dc0:	f200 8092 	bhi.w	c0de0ee8 <handle_apdu+0x306>
c0de0dc4:	2900      	cmp	r1, #0
c0de0dc6:	d167      	bne.n	c0de0e98 <handle_apdu+0x2b6>
c0de0dc8:	f004 fd42 	bl	c0de5850 <show_processing>
c0de0dcc:	4648      	mov	r0, r9
c0de0dce:	eb09 0004 	add.w	r0, r9, r4
c0de0dd2:	78c0      	ldrb	r0, [r0, #3]
c0de0dd4:	eb09 0108 	add.w	r1, r9, r8
c0de0dd8:	2201      	movs	r2, #1
c0de0dda:	f881 239a 	strb.w	r2, [r1, #922]	@ 0x39a
c0de0dde:	f881 032c 	strb.w	r0, [r1, #812]	@ 0x32c
c0de0de2:	e061      	b.n	c0de0ea8 <handle_apdu+0x2c6>
c0de0de4:	982d      	ldr	r0, [sp, #180]	@ 0xb4
c0de0de6:	2100      	movs	r1, #0
c0de0de8:	f8ad 10b8 	strh.w	r1, [sp, #184]	@ 0xb8
c0de0dec:	f007 f980 	bl	c0de80f0 <try_context_set>
c0de0df0:	2005      	movs	r0, #5
c0de0df2:	f006 feb2 	bl	c0de7b5a <os_longjmp>
c0de0df6:	f646 1086 	movw	r0, #27014	@ 0x6986
c0de0dfa:	f006 feae 	bl	c0de7b5a <os_longjmp>
c0de0dfe:	f44f 40dc 	mov.w	r0, #28160	@ 0x6e00
c0de0e02:	f006 feaa 	bl	c0de7b5a <os_longjmp>
c0de0e06:	2002      	movs	r0, #2
c0de0e08:	f006 fea7 	bl	c0de7b5a <os_longjmp>
c0de0e0c:	eb09 040c 	add.w	r4, r9, ip
c0de0e10:	2220      	movs	r2, #32
c0de0e12:	4620      	mov	r0, r4
c0de0e14:	4639      	mov	r1, r7
c0de0e16:	f007 fb4c 	bl	c0de84b2 <__aeabi_memcpy>
c0de0e1a:	f104 0020 	add.w	r0, r4, #32
c0de0e1e:	a902      	add	r1, sp, #8
c0de0e20:	2223      	movs	r2, #35	@ 0x23
c0de0e22:	f007 fb46 	bl	c0de84b2 <__aeabi_memcpy>
c0de0e26:	f240 0000 	movw	r0, #0
c0de0e2a:	f2c0 0000 	movt	r0, #0
c0de0e2e:	4448      	add	r0, r9
c0de0e30:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0e34:	f007 fb3a 	bl	c0de84ac <__aeabi_memclr>
c0de0e38:	9900      	ldr	r1, [sp, #0]
c0de0e3a:	2043      	movs	r0, #67	@ 0x43
c0de0e3c:	6008      	str	r0, [r1, #0]
c0de0e3e:	e01f      	b.n	c0de0e80 <handle_apdu+0x29e>
c0de0e40:	f248 01c9 	movw	r1, #32969	@ 0x80c9
c0de0e44:	eb09 0004 	add.w	r0, r9, r4
c0de0e48:	f2c0 0100 	movt	r1, #0
c0de0e4c:	2405      	movs	r4, #5
c0de0e4e:	4479      	add	r1, pc
c0de0e50:	4622      	mov	r2, r4
c0de0e52:	f007 fb2e 	bl	c0de84b2 <__aeabi_memcpy>
c0de0e56:	f240 0000 	movw	r0, #0
c0de0e5a:	f2c0 0000 	movt	r0, #0
c0de0e5e:	4448      	add	r0, r9
c0de0e60:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0e64:	f007 fb22 	bl	c0de84ac <__aeabi_memclr>
c0de0e68:	6034      	str	r4, [r6, #0]
c0de0e6a:	e009      	b.n	c0de0e80 <handle_apdu+0x29e>
c0de0e6c:	2101      	movs	r1, #1
c0de0e6e:	f809 1004 	strb.w	r1, [r9, r4]
c0de0e72:	eb09 0004 	add.w	r0, r9, r4
c0de0e76:	2102      	movs	r1, #2
c0de0e78:	7041      	strb	r1, [r0, #1]
c0de0e7a:	7081      	strb	r1, [r0, #2]
c0de0e7c:	2003      	movs	r0, #3
c0de0e7e:	6030      	str	r0, [r6, #0]
c0de0e80:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de0e84:	f006 fe69 	bl	c0de7b5a <os_longjmp>
c0de0e88:	f44f 40da 	mov.w	r0, #27904	@ 0x6d00
c0de0e8c:	f006 fe65 	bl	c0de7b5a <os_longjmp>
c0de0e90:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de0e94:	f006 fe61 	bl	c0de7b5a <os_longjmp>
c0de0e98:	4648      	mov	r0, r9
c0de0e9a:	eb09 0008 	add.w	r0, r9, r8
c0de0e9e:	f8d0 13bc 	ldr.w	r1, [r0, #956]	@ 0x3bc
c0de0ea2:	3101      	adds	r1, #1
c0de0ea4:	f8c0 13bc 	str.w	r1, [r0, #956]	@ 0x3bc
c0de0ea8:	eb09 0508 	add.w	r5, r9, r8
c0de0eac:	2000      	movs	r0, #0
c0de0eae:	f8c5 03b8 	str.w	r0, [r5, #952]	@ 0x3b8
c0de0eb2:	f7ff fded 	bl	c0de0a90 <make_allowed_sign_steps>
c0de0eb6:	f895 039a 	ldrb.w	r0, [r5, #922]	@ 0x39a
c0de0eba:	2805      	cmp	r0, #5
c0de0ebc:	d1e0      	bne.n	c0de0e80 <handle_apdu+0x29e>
c0de0ebe:	eb09 0508 	add.w	r5, r9, r8
c0de0ec2:	f205 312d 	addw	r1, r5, #813	@ 0x32d
c0de0ec6:	4628      	mov	r0, r5
c0de0ec8:	464e      	mov	r6, r9
c0de0eca:	f7ff fbeb 	bl	c0de06a4 <stream_eddsa_sign_step5>
c0de0ece:	2006      	movs	r0, #6
c0de0ed0:	f885 039a 	strb.w	r0, [r5, #922]	@ 0x39a
c0de0ed4:	f44f 7148 	mov.w	r1, #800	@ 0x320
c0de0ed8:	4628      	mov	r0, r5
c0de0eda:	f007 fae7 	bl	c0de84ac <__aeabi_memclr>
c0de0ede:	f000 f844 	bl	c0de0f6a <cx_blake2b_init>
c0de0ee2:	eb09 0004 	add.w	r0, r9, r4
c0de0ee6:	7880      	ldrb	r0, [r0, #2]
c0de0ee8:	2880      	cmp	r0, #128	@ 0x80
c0de0eea:	d10d      	bne.n	c0de0f08 <handle_apdu+0x326>
c0de0eec:	2001      	movs	r0, #1
c0de0eee:	f004 f9db 	bl	c0de52a8 <make_allowed_ui_steps>
c0de0ef2:	4648      	mov	r0, r9
c0de0ef4:	eb09 0008 	add.w	r0, r9, r8
c0de0ef8:	f890 039a 	ldrb.w	r0, [r0, #922]	@ 0x39a
c0de0efc:	2808      	cmp	r0, #8
c0de0efe:	d00d      	beq.n	c0de0f1c <handle_apdu+0x33a>
c0de0f00:	f249 1002 	movw	r0, #37122	@ 0x9102
c0de0f04:	f006 fe29 	bl	c0de7b5a <os_longjmp>
c0de0f08:	2000      	movs	r0, #0
c0de0f0a:	f004 f9cd 	bl	c0de52a8 <make_allowed_ui_steps>
c0de0f0e:	4648      	mov	r0, r9
c0de0f10:	eb09 0008 	add.w	r0, r9, r8
c0de0f14:	f890 039a 	ldrb.w	r0, [r0, #922]	@ 0x39a
c0de0f18:	2808      	cmp	r0, #8
c0de0f1a:	d1b1      	bne.n	c0de0e80 <handle_apdu+0x29e>
c0de0f1c:	eb09 0008 	add.w	r0, r9, r8
c0de0f20:	212d      	movs	r1, #45	@ 0x2d
c0de0f22:	f200 306d 	addw	r0, r0, #877	@ 0x36d
c0de0f26:	9110      	str	r1, [sp, #64]	@ 0x40
c0de0f28:	a910      	add	r1, sp, #64	@ 0x40
c0de0f2a:	2320      	movs	r3, #32
c0de0f2c:	4602      	mov	r2, r0
c0de0f2e:	f7ff f8d7 	bl	c0de00e0 <b58enc>
c0de0f32:	b178      	cbz	r0, c0de0f54 <handle_apdu+0x372>
c0de0f34:	eb09 0408 	add.w	r4, r9, r8
c0de0f38:	f894 132c 	ldrb.w	r1, [r4, #812]	@ 0x32c
c0de0f3c:	f104 00ac 	add.w	r0, r4, #172	@ 0xac
c0de0f40:	4602      	mov	r2, r0
c0de0f42:	f7ff fc4a 	bl	c0de07da <waves_public_key_to_address>
c0de0f46:	f8d4 0328 	ldr.w	r0, [r4, #808]	@ 0x328
c0de0f4a:	2802      	cmp	r0, #2
c0de0f4c:	d106      	bne.n	c0de0f5c <handle_apdu+0x37a>
c0de0f4e:	f004 fbcb 	bl	c0de56e8 <show_sign_protobuf_ui>
c0de0f52:	e005      	b.n	c0de0f60 <handle_apdu+0x37e>
c0de0f54:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de0f58:	f006 fdff 	bl	c0de7b5a <os_longjmp>
c0de0f5c:	f004 fb95 	bl	c0de568a <show_sign_ui>
c0de0f60:	6838      	ldr	r0, [r7, #0]
c0de0f62:	f040 0010 	orr.w	r0, r0, #16
c0de0f66:	6038      	str	r0, [r7, #0]
c0de0f68:	e78a      	b.n	c0de0e80 <handle_apdu+0x29e>

c0de0f6a <cx_blake2b_init>:
c0de0f6a:	b580      	push	{r7, lr}
c0de0f6c:	f240 0000 	movw	r0, #0
c0de0f70:	f2c0 0000 	movt	r0, #0
c0de0f74:	4448      	add	r0, r9
c0de0f76:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de0f7a:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de0f7e:	f006 fdac 	bl	c0de7ada <cx_blake2b_init_no_throw>
c0de0f82:	b900      	cbnz	r0, c0de0f86 <cx_blake2b_init+0x1c>
c0de0f84:	bd80      	pop	{r7, pc}
c0de0f86:	f006 fde8 	bl	c0de7b5a <os_longjmp>

c0de0f8a <init_context>:
c0de0f8a:	b580      	push	{r7, lr}
c0de0f8c:	f240 0000 	movw	r0, #0
c0de0f90:	f2c0 0000 	movt	r0, #0
c0de0f94:	4448      	add	r0, r9
c0de0f96:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0f9a:	f007 fa87 	bl	c0de84ac <__aeabi_memclr>
c0de0f9e:	bd80      	pop	{r7, pc}

c0de0fa0 <io_event>:
c0de0fa0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0fa2:	b081      	sub	sp, #4
c0de0fa4:	f240 35c0 	movw	r5, #960	@ 0x3c0
c0de0fa8:	f2c0 0500 	movt	r5, #0
c0de0fac:	f819 0005 	ldrb.w	r0, [r9, r5]
c0de0fb0:	280c      	cmp	r0, #12
c0de0fb2:	dc05      	bgt.n	c0de0fc0 <io_event+0x20>
c0de0fb4:	2805      	cmp	r0, #5
c0de0fb6:	d079      	beq.n	c0de10ac <io_event+0x10c>
c0de0fb8:	280c      	cmp	r0, #12
c0de0fba:	f000 83a5 	beq.w	c0de1708 <io_event+0x768>
c0de0fbe:	e163      	b.n	c0de1288 <io_event+0x2e8>
c0de0fc0:	280d      	cmp	r0, #13
c0de0fc2:	f000 80ea 	beq.w	c0de119a <io_event+0x1fa>
c0de0fc6:	280e      	cmp	r0, #14
c0de0fc8:	f040 815e 	bne.w	c0de1288 <io_event+0x2e8>
c0de0fcc:	f240 56ec 	movw	r6, #1516	@ 0x5ec
c0de0fd0:	f2c0 0600 	movt	r6, #0
c0de0fd4:	2001      	movs	r0, #1
c0de0fd6:	eb09 0506 	add.w	r5, r9, r6
c0de0fda:	f809 0006 	strb.w	r0, [r9, r6]
c0de0fde:	2700      	movs	r7, #0
c0de0fe0:	4628      	mov	r0, r5
c0de0fe2:	606f      	str	r7, [r5, #4]
c0de0fe4:	f007 f81d 	bl	c0de8022 <os_ux>
c0de0fe8:	2004      	movs	r0, #4
c0de0fea:	f007 f88f 	bl	c0de810c <os_sched_last_status>
c0de0fee:	6068      	str	r0, [r5, #4]
c0de0ff0:	f240 45d0 	movw	r5, #1232	@ 0x4d0
c0de0ff4:	2869      	cmp	r0, #105	@ 0x69
c0de0ff6:	f2c0 0500 	movt	r5, #0
c0de0ffa:	f040 81b5 	bne.w	c0de1368 <io_event+0x3c8>
c0de0ffe:	f004 fd2a 	bl	c0de5a56 <io_seph_ux_init_button>
c0de1002:	eb09 0405 	add.w	r4, r9, r5
c0de1006:	2004      	movs	r0, #4
c0de1008:	f8a4 70ca 	strh.w	r7, [r4, #202]	@ 0xca
c0de100c:	f007 f87e 	bl	c0de810c <os_sched_last_status>
c0de1010:	f8d4 10cc 	ldr.w	r1, [r4, #204]	@ 0xcc
c0de1014:	eb09 0206 	add.w	r2, r9, r6
c0de1018:	2900      	cmp	r1, #0
c0de101a:	6050      	str	r0, [r2, #4]
c0de101c:	f000 8374 	beq.w	c0de1708 <io_event+0x768>
c0de1020:	2800      	cmp	r0, #0
c0de1022:	f000 8371 	beq.w	c0de1708 <io_event+0x768>
c0de1026:	2897      	cmp	r0, #151	@ 0x97
c0de1028:	f000 836e 	beq.w	c0de1708 <io_event+0x768>
c0de102c:	eb09 0005 	add.w	r0, r9, r5
c0de1030:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de1034:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de1038:	4281      	cmp	r1, r0
c0de103a:	f080 8365 	bcs.w	c0de1708 <io_event+0x768>
c0de103e:	f006 ffab 	bl	c0de7f98 <os_perso_isonboarded>
c0de1042:	28aa      	cmp	r0, #170	@ 0xaa
c0de1044:	d104      	bne.n	c0de1050 <io_event+0xb0>
c0de1046:	f006 ffe1 	bl	c0de800c <os_global_pin_is_validated>
c0de104a:	28aa      	cmp	r0, #170	@ 0xaa
c0de104c:	f040 835c 	bne.w	c0de1708 <io_event+0x768>
c0de1050:	eb09 0105 	add.w	r1, r9, r5
c0de1054:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1058:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de105c:	4288      	cmp	r0, r1
c0de105e:	f080 834e 	bcs.w	c0de16fe <io_event+0x75e>
c0de1062:	b281      	uxth	r1, r0
c0de1064:	eb09 0005 	add.w	r0, r9, r5
c0de1068:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de106c:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de1070:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1074:	b13b      	cbz	r3, c0de1086 <io_event+0xe6>
c0de1076:	4798      	blx	r3
c0de1078:	b158      	cbz	r0, c0de1092 <io_event+0xf2>
c0de107a:	eb09 0105 	add.w	r1, r9, r5
c0de107e:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de1082:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de1086:	2801      	cmp	r0, #1
c0de1088:	bf08      	it	eq
c0de108a:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de108e:	f004 fcf6 	bl	c0de5a7e <io_seph_ux_display_bagl_element>
c0de1092:	eb09 0205 	add.w	r2, r9, r5
c0de1096:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de109a:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de109e:	3001      	adds	r0, #1
c0de10a0:	b283      	uxth	r3, r0
c0de10a2:	428b      	cmp	r3, r1
c0de10a4:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de10a8:	d3db      	bcc.n	c0de1062 <io_event+0xc2>
c0de10aa:	e328      	b.n	c0de16fe <io_event+0x75e>
c0de10ac:	f240 56ec 	movw	r6, #1516	@ 0x5ec
c0de10b0:	f2c0 0600 	movt	r6, #0
c0de10b4:	2001      	movs	r0, #1
c0de10b6:	f809 0006 	strb.w	r0, [r9, r6]
c0de10ba:	eb09 0406 	add.w	r4, r9, r6
c0de10be:	2000      	movs	r0, #0
c0de10c0:	6060      	str	r0, [r4, #4]
c0de10c2:	4620      	mov	r0, r4
c0de10c4:	f006 ffad 	bl	c0de8022 <os_ux>
c0de10c8:	2004      	movs	r0, #4
c0de10ca:	f007 f81f 	bl	c0de810c <os_sched_last_status>
c0de10ce:	2800      	cmp	r0, #0
c0de10d0:	6060      	str	r0, [r4, #4]
c0de10d2:	f000 8319 	beq.w	c0de1708 <io_event+0x768>
c0de10d6:	2897      	cmp	r0, #151	@ 0x97
c0de10d8:	f000 8316 	beq.w	c0de1708 <io_event+0x768>
c0de10dc:	2869      	cmp	r0, #105	@ 0x69
c0de10de:	f040 81b6 	bne.w	c0de144e <io_event+0x4ae>
c0de10e2:	f004 fcb8 	bl	c0de5a56 <io_seph_ux_init_button>
c0de10e6:	f240 44d0 	movw	r4, #1232	@ 0x4d0
c0de10ea:	f2c0 0400 	movt	r4, #0
c0de10ee:	eb09 0504 	add.w	r5, r9, r4
c0de10f2:	2000      	movs	r0, #0
c0de10f4:	f8a5 00ca 	strh.w	r0, [r5, #202]	@ 0xca
c0de10f8:	2004      	movs	r0, #4
c0de10fa:	f007 f807 	bl	c0de810c <os_sched_last_status>
c0de10fe:	f8d5 10cc 	ldr.w	r1, [r5, #204]	@ 0xcc
c0de1102:	eb09 0206 	add.w	r2, r9, r6
c0de1106:	2900      	cmp	r1, #0
c0de1108:	6050      	str	r0, [r2, #4]
c0de110a:	f000 82fd 	beq.w	c0de1708 <io_event+0x768>
c0de110e:	2800      	cmp	r0, #0
c0de1110:	f000 82fa 	beq.w	c0de1708 <io_event+0x768>
c0de1114:	2897      	cmp	r0, #151	@ 0x97
c0de1116:	f000 82f7 	beq.w	c0de1708 <io_event+0x768>
c0de111a:	eb09 0004 	add.w	r0, r9, r4
c0de111e:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de1122:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de1126:	4281      	cmp	r1, r0
c0de1128:	f080 82ee 	bcs.w	c0de1708 <io_event+0x768>
c0de112c:	f006 ff34 	bl	c0de7f98 <os_perso_isonboarded>
c0de1130:	28aa      	cmp	r0, #170	@ 0xaa
c0de1132:	d104      	bne.n	c0de113e <io_event+0x19e>
c0de1134:	f006 ff6a 	bl	c0de800c <os_global_pin_is_validated>
c0de1138:	28aa      	cmp	r0, #170	@ 0xaa
c0de113a:	f040 82e5 	bne.w	c0de1708 <io_event+0x768>
c0de113e:	eb09 0104 	add.w	r1, r9, r4
c0de1142:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1146:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de114a:	4288      	cmp	r0, r1
c0de114c:	f080 82d7 	bcs.w	c0de16fe <io_event+0x75e>
c0de1150:	b281      	uxth	r1, r0
c0de1152:	eb09 0004 	add.w	r0, r9, r4
c0de1156:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de115a:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de115e:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1162:	b13b      	cbz	r3, c0de1174 <io_event+0x1d4>
c0de1164:	4798      	blx	r3
c0de1166:	b158      	cbz	r0, c0de1180 <io_event+0x1e0>
c0de1168:	eb09 0104 	add.w	r1, r9, r4
c0de116c:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de1170:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de1174:	2801      	cmp	r0, #1
c0de1176:	bf08      	it	eq
c0de1178:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de117c:	f004 fc7f 	bl	c0de5a7e <io_seph_ux_display_bagl_element>
c0de1180:	eb09 0204 	add.w	r2, r9, r4
c0de1184:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de1188:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de118c:	3001      	adds	r0, #1
c0de118e:	b283      	uxth	r3, r0
c0de1190:	428b      	cmp	r3, r1
c0de1192:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de1196:	d3db      	bcc.n	c0de1150 <io_event+0x1b0>
c0de1198:	e2b1      	b.n	c0de16fe <io_event+0x75e>
c0de119a:	f240 55ec 	movw	r5, #1516	@ 0x5ec
c0de119e:	f2c0 0500 	movt	r5, #0
c0de11a2:	2001      	movs	r0, #1
c0de11a4:	f809 0005 	strb.w	r0, [r9, r5]
c0de11a8:	eb09 0405 	add.w	r4, r9, r5
c0de11ac:	2000      	movs	r0, #0
c0de11ae:	6060      	str	r0, [r4, #4]
c0de11b0:	4620      	mov	r0, r4
c0de11b2:	f006 ff36 	bl	c0de8022 <os_ux>
c0de11b6:	2004      	movs	r0, #4
c0de11b8:	f006 ffa8 	bl	c0de810c <os_sched_last_status>
c0de11bc:	2800      	cmp	r0, #0
c0de11be:	6060      	str	r0, [r4, #4]
c0de11c0:	f000 82a2 	beq.w	c0de1708 <io_event+0x768>
c0de11c4:	2897      	cmp	r0, #151	@ 0x97
c0de11c6:	f000 829f 	beq.w	c0de1708 <io_event+0x768>
c0de11ca:	2869      	cmp	r0, #105	@ 0x69
c0de11cc:	f040 8195 	bne.w	c0de14fa <io_event+0x55a>
c0de11d0:	f004 fc41 	bl	c0de5a56 <io_seph_ux_init_button>
c0de11d4:	f240 44d0 	movw	r4, #1232	@ 0x4d0
c0de11d8:	f2c0 0400 	movt	r4, #0
c0de11dc:	eb09 0604 	add.w	r6, r9, r4
c0de11e0:	2000      	movs	r0, #0
c0de11e2:	f8a6 00ca 	strh.w	r0, [r6, #202]	@ 0xca
c0de11e6:	2004      	movs	r0, #4
c0de11e8:	f006 ff90 	bl	c0de810c <os_sched_last_status>
c0de11ec:	f8d6 10cc 	ldr.w	r1, [r6, #204]	@ 0xcc
c0de11f0:	eb09 0205 	add.w	r2, r9, r5
c0de11f4:	2900      	cmp	r1, #0
c0de11f6:	6050      	str	r0, [r2, #4]
c0de11f8:	f000 8286 	beq.w	c0de1708 <io_event+0x768>
c0de11fc:	2800      	cmp	r0, #0
c0de11fe:	f000 8283 	beq.w	c0de1708 <io_event+0x768>
c0de1202:	2897      	cmp	r0, #151	@ 0x97
c0de1204:	f000 8280 	beq.w	c0de1708 <io_event+0x768>
c0de1208:	eb09 0004 	add.w	r0, r9, r4
c0de120c:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de1210:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de1214:	4281      	cmp	r1, r0
c0de1216:	f080 8277 	bcs.w	c0de1708 <io_event+0x768>
c0de121a:	f006 febd 	bl	c0de7f98 <os_perso_isonboarded>
c0de121e:	28aa      	cmp	r0, #170	@ 0xaa
c0de1220:	d104      	bne.n	c0de122c <io_event+0x28c>
c0de1222:	f006 fef3 	bl	c0de800c <os_global_pin_is_validated>
c0de1226:	28aa      	cmp	r0, #170	@ 0xaa
c0de1228:	f040 826e 	bne.w	c0de1708 <io_event+0x768>
c0de122c:	eb09 0104 	add.w	r1, r9, r4
c0de1230:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1234:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de1238:	4288      	cmp	r0, r1
c0de123a:	f080 8260 	bcs.w	c0de16fe <io_event+0x75e>
c0de123e:	b281      	uxth	r1, r0
c0de1240:	eb09 0004 	add.w	r0, r9, r4
c0de1244:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de1248:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de124c:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1250:	b13b      	cbz	r3, c0de1262 <io_event+0x2c2>
c0de1252:	4798      	blx	r3
c0de1254:	b158      	cbz	r0, c0de126e <io_event+0x2ce>
c0de1256:	eb09 0104 	add.w	r1, r9, r4
c0de125a:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de125e:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de1262:	2801      	cmp	r0, #1
c0de1264:	bf08      	it	eq
c0de1266:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de126a:	f004 fc08 	bl	c0de5a7e <io_seph_ux_display_bagl_element>
c0de126e:	eb09 0204 	add.w	r2, r9, r4
c0de1272:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de1276:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de127a:	3001      	adds	r0, #1
c0de127c:	b283      	uxth	r3, r0
c0de127e:	428b      	cmp	r3, r1
c0de1280:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de1284:	d3db      	bcc.n	c0de123e <io_event+0x29e>
c0de1286:	e23a      	b.n	c0de16fe <io_event+0x75e>
c0de1288:	f240 55ec 	movw	r5, #1516	@ 0x5ec
c0de128c:	f2c0 0500 	movt	r5, #0
c0de1290:	2001      	movs	r0, #1
c0de1292:	eb09 0405 	add.w	r4, r9, r5
c0de1296:	f809 0005 	strb.w	r0, [r9, r5]
c0de129a:	2600      	movs	r6, #0
c0de129c:	4620      	mov	r0, r4
c0de129e:	6066      	str	r6, [r4, #4]
c0de12a0:	f006 febf 	bl	c0de8022 <os_ux>
c0de12a4:	2004      	movs	r0, #4
c0de12a6:	f006 ff31 	bl	c0de810c <os_sched_last_status>
c0de12aa:	2869      	cmp	r0, #105	@ 0x69
c0de12ac:	6060      	str	r0, [r4, #4]
c0de12ae:	f040 8083 	bne.w	c0de13b8 <io_event+0x418>
c0de12b2:	f004 fbd0 	bl	c0de5a56 <io_seph_ux_init_button>
c0de12b6:	f240 44d0 	movw	r4, #1232	@ 0x4d0
c0de12ba:	f2c0 0400 	movt	r4, #0
c0de12be:	eb09 0704 	add.w	r7, r9, r4
c0de12c2:	2004      	movs	r0, #4
c0de12c4:	f8a7 60ca 	strh.w	r6, [r7, #202]	@ 0xca
c0de12c8:	f006 ff20 	bl	c0de810c <os_sched_last_status>
c0de12cc:	f8d7 10cc 	ldr.w	r1, [r7, #204]	@ 0xcc
c0de12d0:	eb09 0205 	add.w	r2, r9, r5
c0de12d4:	2900      	cmp	r1, #0
c0de12d6:	6050      	str	r0, [r2, #4]
c0de12d8:	f000 8216 	beq.w	c0de1708 <io_event+0x768>
c0de12dc:	2800      	cmp	r0, #0
c0de12de:	f000 8213 	beq.w	c0de1708 <io_event+0x768>
c0de12e2:	2897      	cmp	r0, #151	@ 0x97
c0de12e4:	f000 8210 	beq.w	c0de1708 <io_event+0x768>
c0de12e8:	eb09 0004 	add.w	r0, r9, r4
c0de12ec:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de12f0:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de12f4:	4281      	cmp	r1, r0
c0de12f6:	f080 8207 	bcs.w	c0de1708 <io_event+0x768>
c0de12fa:	f006 fe4d 	bl	c0de7f98 <os_perso_isonboarded>
c0de12fe:	28aa      	cmp	r0, #170	@ 0xaa
c0de1300:	d104      	bne.n	c0de130c <io_event+0x36c>
c0de1302:	f006 fe83 	bl	c0de800c <os_global_pin_is_validated>
c0de1306:	28aa      	cmp	r0, #170	@ 0xaa
c0de1308:	f040 81fe 	bne.w	c0de1708 <io_event+0x768>
c0de130c:	eb09 0104 	add.w	r1, r9, r4
c0de1310:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1314:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de1318:	4288      	cmp	r0, r1
c0de131a:	f080 81f0 	bcs.w	c0de16fe <io_event+0x75e>
c0de131e:	b281      	uxth	r1, r0
c0de1320:	eb09 0004 	add.w	r0, r9, r4
c0de1324:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de1328:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de132c:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1330:	b13b      	cbz	r3, c0de1342 <io_event+0x3a2>
c0de1332:	4798      	blx	r3
c0de1334:	b158      	cbz	r0, c0de134e <io_event+0x3ae>
c0de1336:	eb09 0104 	add.w	r1, r9, r4
c0de133a:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de133e:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de1342:	2801      	cmp	r0, #1
c0de1344:	bf08      	it	eq
c0de1346:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de134a:	f004 fb98 	bl	c0de5a7e <io_seph_ux_display_bagl_element>
c0de134e:	eb09 0204 	add.w	r2, r9, r4
c0de1352:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de1356:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de135a:	3001      	adds	r0, #1
c0de135c:	b283      	uxth	r3, r0
c0de135e:	428b      	cmp	r3, r1
c0de1360:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de1364:	d3db      	bcc.n	c0de131e <io_event+0x37e>
c0de1366:	e1ca      	b.n	c0de16fe <io_event+0x75e>
c0de1368:	4604      	mov	r4, r0
c0de136a:	3897      	subs	r0, #151	@ 0x97
c0de136c:	eb09 0205 	add.w	r2, r9, r5
c0de1370:	bf18      	it	ne
c0de1372:	2001      	movne	r0, #1
c0de1374:	f8d2 20e4 	ldr.w	r2, [r2, #228]	@ 0xe4
c0de1378:	2c00      	cmp	r4, #0
c0de137a:	4621      	mov	r1, r4
c0de137c:	bf18      	it	ne
c0de137e:	2101      	movne	r1, #1
c0de1380:	2a00      	cmp	r2, #0
c0de1382:	f000 8176 	beq.w	c0de1672 <io_event+0x6d2>
c0de1386:	3a64      	subs	r2, #100	@ 0x64
c0de1388:	eb09 0305 	add.w	r3, r9, r5
c0de138c:	bf38      	it	cc
c0de138e:	2200      	movcc	r2, #0
c0de1390:	f8c3 20e4 	str.w	r2, [r3, #228]	@ 0xe4
c0de1394:	f200 816d 	bhi.w	c0de1672 <io_event+0x6d2>
c0de1398:	eb09 0205 	add.w	r2, r9, r5
c0de139c:	f8d2 20e0 	ldr.w	r2, [r2, #224]	@ 0xe0
c0de13a0:	2a00      	cmp	r2, #0
c0de13a2:	f000 80f5 	beq.w	c0de1590 <io_event+0x5f0>
c0de13a6:	eb09 0005 	add.w	r0, r9, r5
c0de13aa:	f8d0 10e8 	ldr.w	r1, [r0, #232]	@ 0xe8
c0de13ae:	f8c0 10e4 	str.w	r1, [r0, #228]	@ 0xe4
c0de13b2:	2000      	movs	r0, #0
c0de13b4:	4790      	blx	r2
c0de13b6:	e15c      	b.n	c0de1672 <io_event+0x6d2>
c0de13b8:	f240 44d0 	movw	r4, #1232	@ 0x4d0
c0de13bc:	f2c0 0400 	movt	r4, #0
c0de13c0:	eb09 0004 	add.w	r0, r9, r4
c0de13c4:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de13c8:	2800      	cmp	r0, #0
c0de13ca:	f000 819d 	beq.w	c0de1708 <io_event+0x768>
c0de13ce:	eb09 0004 	add.w	r0, r9, r4
c0de13d2:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de13d6:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de13da:	4281      	cmp	r1, r0
c0de13dc:	f080 8194 	bcs.w	c0de1708 <io_event+0x768>
c0de13e0:	f006 fdda 	bl	c0de7f98 <os_perso_isonboarded>
c0de13e4:	28aa      	cmp	r0, #170	@ 0xaa
c0de13e6:	d104      	bne.n	c0de13f2 <io_event+0x452>
c0de13e8:	f006 fe10 	bl	c0de800c <os_global_pin_is_validated>
c0de13ec:	28aa      	cmp	r0, #170	@ 0xaa
c0de13ee:	f040 818b 	bne.w	c0de1708 <io_event+0x768>
c0de13f2:	eb09 0104 	add.w	r1, r9, r4
c0de13f6:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de13fa:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de13fe:	4288      	cmp	r0, r1
c0de1400:	f080 817d 	bcs.w	c0de16fe <io_event+0x75e>
c0de1404:	b281      	uxth	r1, r0
c0de1406:	eb09 0004 	add.w	r0, r9, r4
c0de140a:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de140e:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de1412:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1416:	b13b      	cbz	r3, c0de1428 <io_event+0x488>
c0de1418:	4798      	blx	r3
c0de141a:	b158      	cbz	r0, c0de1434 <io_event+0x494>
c0de141c:	eb09 0104 	add.w	r1, r9, r4
c0de1420:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de1424:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de1428:	2801      	cmp	r0, #1
c0de142a:	bf08      	it	eq
c0de142c:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1430:	f004 fb25 	bl	c0de5a7e <io_seph_ux_display_bagl_element>
c0de1434:	eb09 0204 	add.w	r2, r9, r4
c0de1438:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de143c:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de1440:	3001      	adds	r0, #1
c0de1442:	b283      	uxth	r3, r0
c0de1444:	428b      	cmp	r3, r1
c0de1446:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de144a:	d3db      	bcc.n	c0de1404 <io_event+0x464>
c0de144c:	e157      	b.n	c0de16fe <io_event+0x75e>
c0de144e:	f240 44d0 	movw	r4, #1232	@ 0x4d0
c0de1452:	f2c0 0400 	movt	r4, #0
c0de1456:	eb09 0004 	add.w	r0, r9, r4
c0de145a:	f8d0 00dc 	ldr.w	r0, [r0, #220]	@ 0xdc
c0de145e:	b128      	cbz	r0, c0de146c <io_event+0x4cc>
c0de1460:	eb09 0105 	add.w	r1, r9, r5
c0de1464:	78c9      	ldrb	r1, [r1, #3]
c0de1466:	0849      	lsrs	r1, r1, #1
c0de1468:	f004 fb47 	bl	c0de5afa <io_seproxyhal_button_push>
c0de146c:	eb09 0004 	add.w	r0, r9, r4
c0de1470:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de1474:	2800      	cmp	r0, #0
c0de1476:	f000 8147 	beq.w	c0de1708 <io_event+0x768>
c0de147a:	eb09 0004 	add.w	r0, r9, r4
c0de147e:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de1482:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de1486:	4281      	cmp	r1, r0
c0de1488:	f080 813e 	bcs.w	c0de1708 <io_event+0x768>
c0de148c:	f006 fd84 	bl	c0de7f98 <os_perso_isonboarded>
c0de1490:	28aa      	cmp	r0, #170	@ 0xaa
c0de1492:	d104      	bne.n	c0de149e <io_event+0x4fe>
c0de1494:	f006 fdba 	bl	c0de800c <os_global_pin_is_validated>
c0de1498:	28aa      	cmp	r0, #170	@ 0xaa
c0de149a:	f040 8135 	bne.w	c0de1708 <io_event+0x768>
c0de149e:	eb09 0104 	add.w	r1, r9, r4
c0de14a2:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de14a6:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de14aa:	4288      	cmp	r0, r1
c0de14ac:	f080 8127 	bcs.w	c0de16fe <io_event+0x75e>
c0de14b0:	b281      	uxth	r1, r0
c0de14b2:	eb09 0004 	add.w	r0, r9, r4
c0de14b6:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de14ba:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de14be:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de14c2:	b13b      	cbz	r3, c0de14d4 <io_event+0x534>
c0de14c4:	4798      	blx	r3
c0de14c6:	b158      	cbz	r0, c0de14e0 <io_event+0x540>
c0de14c8:	eb09 0104 	add.w	r1, r9, r4
c0de14cc:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de14d0:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de14d4:	2801      	cmp	r0, #1
c0de14d6:	bf08      	it	eq
c0de14d8:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de14dc:	f004 facf 	bl	c0de5a7e <io_seph_ux_display_bagl_element>
c0de14e0:	eb09 0204 	add.w	r2, r9, r4
c0de14e4:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de14e8:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de14ec:	3001      	adds	r0, #1
c0de14ee:	b283      	uxth	r3, r0
c0de14f0:	428b      	cmp	r3, r1
c0de14f2:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de14f6:	d3db      	bcc.n	c0de14b0 <io_event+0x510>
c0de14f8:	e101      	b.n	c0de16fe <io_event+0x75e>
c0de14fa:	f240 44d0 	movw	r4, #1232	@ 0x4d0
c0de14fe:	f2c0 0400 	movt	r4, #0
c0de1502:	eb09 0004 	add.w	r0, r9, r4
c0de1506:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de150a:	2800      	cmp	r0, #0
c0de150c:	f000 80fc 	beq.w	c0de1708 <io_event+0x768>
c0de1510:	eb09 0004 	add.w	r0, r9, r4
c0de1514:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de1518:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de151c:	4281      	cmp	r1, r0
c0de151e:	f080 80f3 	bcs.w	c0de1708 <io_event+0x768>
c0de1522:	f006 fd39 	bl	c0de7f98 <os_perso_isonboarded>
c0de1526:	28aa      	cmp	r0, #170	@ 0xaa
c0de1528:	d104      	bne.n	c0de1534 <io_event+0x594>
c0de152a:	f006 fd6f 	bl	c0de800c <os_global_pin_is_validated>
c0de152e:	28aa      	cmp	r0, #170	@ 0xaa
c0de1530:	f040 80ea 	bne.w	c0de1708 <io_event+0x768>
c0de1534:	eb09 0104 	add.w	r1, r9, r4
c0de1538:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de153c:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de1540:	4288      	cmp	r0, r1
c0de1542:	f080 80dc 	bcs.w	c0de16fe <io_event+0x75e>
c0de1546:	b281      	uxth	r1, r0
c0de1548:	eb09 0004 	add.w	r0, r9, r4
c0de154c:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de1550:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de1554:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1558:	b13b      	cbz	r3, c0de156a <io_event+0x5ca>
c0de155a:	4798      	blx	r3
c0de155c:	b158      	cbz	r0, c0de1576 <io_event+0x5d6>
c0de155e:	eb09 0104 	add.w	r1, r9, r4
c0de1562:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de1566:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de156a:	2801      	cmp	r0, #1
c0de156c:	bf08      	it	eq
c0de156e:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1572:	f004 fa84 	bl	c0de5a7e <io_seph_ux_display_bagl_element>
c0de1576:	eb09 0204 	add.w	r2, r9, r4
c0de157a:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de157e:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de1582:	3001      	adds	r0, #1
c0de1584:	b283      	uxth	r3, r0
c0de1586:	428b      	cmp	r3, r1
c0de1588:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de158c:	d3db      	bcc.n	c0de1546 <io_event+0x5a6>
c0de158e:	e0b6      	b.n	c0de16fe <io_event+0x75e>
c0de1590:	f240 52e4 	movw	r2, #1508	@ 0x5e4
c0de1594:	f2c0 0200 	movt	r2, #0
c0de1598:	f859 2002 	ldr.w	r2, [r9, r2]
c0de159c:	4008      	ands	r0, r1
c0de159e:	4611      	mov	r1, r2
c0de15a0:	2a00      	cmp	r2, #0
c0de15a2:	bf18      	it	ne
c0de15a4:	2101      	movne	r1, #1
c0de15a6:	4008      	ands	r0, r1
c0de15a8:	2801      	cmp	r0, #1
c0de15aa:	d162      	bne.n	c0de1672 <io_event+0x6d2>
c0de15ac:	f240 50e0 	movw	r0, #1504	@ 0x5e0
c0de15b0:	f2c0 0000 	movt	r0, #0
c0de15b4:	f859 1000 	ldr.w	r1, [r9, r0]
c0de15b8:	3101      	adds	r1, #1
c0de15ba:	fb91 f3f2 	sdiv	r3, r1, r2
c0de15be:	fb03 1112 	mls	r1, r3, r2, r1
c0de15c2:	f849 1000 	str.w	r1, [r9, r0]
c0de15c6:	f004 fa46 	bl	c0de5a56 <io_seph_ux_init_button>
c0de15ca:	eb09 0705 	add.w	r7, r9, r5
c0de15ce:	2000      	movs	r0, #0
c0de15d0:	f8a7 00ca 	strh.w	r0, [r7, #202]	@ 0xca
c0de15d4:	2004      	movs	r0, #4
c0de15d6:	f006 fd99 	bl	c0de810c <os_sched_last_status>
c0de15da:	f8d7 10cc 	ldr.w	r1, [r7, #204]	@ 0xcc
c0de15de:	eb09 0206 	add.w	r2, r9, r6
c0de15e2:	2900      	cmp	r1, #0
c0de15e4:	6050      	str	r0, [r2, #4]
c0de15e6:	d044      	beq.n	c0de1672 <io_event+0x6d2>
c0de15e8:	2800      	cmp	r0, #0
c0de15ea:	d042      	beq.n	c0de1672 <io_event+0x6d2>
c0de15ec:	2897      	cmp	r0, #151	@ 0x97
c0de15ee:	d040      	beq.n	c0de1672 <io_event+0x6d2>
c0de15f0:	eb09 0005 	add.w	r0, r9, r5
c0de15f4:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de15f8:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de15fc:	4281      	cmp	r1, r0
c0de15fe:	d238      	bcs.n	c0de1672 <io_event+0x6d2>
c0de1600:	f006 fcca 	bl	c0de7f98 <os_perso_isonboarded>
c0de1604:	28aa      	cmp	r0, #170	@ 0xaa
c0de1606:	d103      	bne.n	c0de1610 <io_event+0x670>
c0de1608:	f006 fd00 	bl	c0de800c <os_global_pin_is_validated>
c0de160c:	28aa      	cmp	r0, #170	@ 0xaa
c0de160e:	d130      	bne.n	c0de1672 <io_event+0x6d2>
c0de1610:	eb09 0105 	add.w	r1, r9, r5
c0de1614:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1618:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de161c:	4288      	cmp	r0, r1
c0de161e:	d223      	bcs.n	c0de1668 <io_event+0x6c8>
c0de1620:	b281      	uxth	r1, r0
c0de1622:	eb09 0005 	add.w	r0, r9, r5
c0de1626:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de162a:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de162e:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1632:	b13b      	cbz	r3, c0de1644 <io_event+0x6a4>
c0de1634:	4798      	blx	r3
c0de1636:	b158      	cbz	r0, c0de1650 <io_event+0x6b0>
c0de1638:	eb09 0105 	add.w	r1, r9, r5
c0de163c:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de1640:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de1644:	2801      	cmp	r0, #1
c0de1646:	bf08      	it	eq
c0de1648:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de164c:	f004 fa17 	bl	c0de5a7e <io_seph_ux_display_bagl_element>
c0de1650:	eb09 0205 	add.w	r2, r9, r5
c0de1654:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de1658:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de165c:	3001      	adds	r0, #1
c0de165e:	b283      	uxth	r3, r0
c0de1660:	428b      	cmp	r3, r1
c0de1662:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de1666:	d3db      	bcc.n	c0de1620 <io_event+0x680>
c0de1668:	b280      	uxth	r0, r0
c0de166a:	4288      	cmp	r0, r1
c0de166c:	d101      	bne.n	c0de1672 <io_event+0x6d2>
c0de166e:	f006 fd5b 	bl	c0de8128 <screen_update>
c0de1672:	2c00      	cmp	r4, #0
c0de1674:	d048      	beq.n	c0de1708 <io_event+0x768>
c0de1676:	2c97      	cmp	r4, #151	@ 0x97
c0de1678:	d046      	beq.n	c0de1708 <io_event+0x768>
c0de167a:	eb09 0005 	add.w	r0, r9, r5
c0de167e:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de1682:	2800      	cmp	r0, #0
c0de1684:	d040      	beq.n	c0de1708 <io_event+0x768>
c0de1686:	eb09 0005 	add.w	r0, r9, r5
c0de168a:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de168e:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de1692:	4281      	cmp	r1, r0
c0de1694:	d238      	bcs.n	c0de1708 <io_event+0x768>
c0de1696:	f006 fc7f 	bl	c0de7f98 <os_perso_isonboarded>
c0de169a:	28aa      	cmp	r0, #170	@ 0xaa
c0de169c:	d103      	bne.n	c0de16a6 <io_event+0x706>
c0de169e:	f006 fcb5 	bl	c0de800c <os_global_pin_is_validated>
c0de16a2:	28aa      	cmp	r0, #170	@ 0xaa
c0de16a4:	d130      	bne.n	c0de1708 <io_event+0x768>
c0de16a6:	eb09 0105 	add.w	r1, r9, r5
c0de16aa:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de16ae:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de16b2:	4288      	cmp	r0, r1
c0de16b4:	d223      	bcs.n	c0de16fe <io_event+0x75e>
c0de16b6:	b281      	uxth	r1, r0
c0de16b8:	eb09 0005 	add.w	r0, r9, r5
c0de16bc:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de16c0:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de16c4:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de16c8:	b13b      	cbz	r3, c0de16da <io_event+0x73a>
c0de16ca:	4798      	blx	r3
c0de16cc:	b158      	cbz	r0, c0de16e6 <io_event+0x746>
c0de16ce:	eb09 0105 	add.w	r1, r9, r5
c0de16d2:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de16d6:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de16da:	2801      	cmp	r0, #1
c0de16dc:	bf08      	it	eq
c0de16de:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de16e2:	f004 f9cc 	bl	c0de5a7e <io_seph_ux_display_bagl_element>
c0de16e6:	eb09 0205 	add.w	r2, r9, r5
c0de16ea:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de16ee:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de16f2:	3001      	adds	r0, #1
c0de16f4:	b283      	uxth	r3, r0
c0de16f6:	428b      	cmp	r3, r1
c0de16f8:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de16fc:	d3db      	bcc.n	c0de16b6 <io_event+0x716>
c0de16fe:	b280      	uxth	r0, r0
c0de1700:	4288      	cmp	r0, r1
c0de1702:	bf08      	it	eq
c0de1704:	f006 fd10 	bleq	c0de8128 <screen_update>
c0de1708:	f004 fa33 	bl	c0de5b72 <io_seph_is_status_sent>
c0de170c:	b908      	cbnz	r0, c0de1712 <io_event+0x772>
c0de170e:	f004 fa2e 	bl	c0de5b6e <io_seproxyhal_general_status>
c0de1712:	2001      	movs	r0, #1
c0de1714:	b001      	add	sp, #4
c0de1716:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de1718 <app_exit>:
c0de1718:	b510      	push	{r4, lr}
c0de171a:	b08c      	sub	sp, #48	@ 0x30
c0de171c:	466c      	mov	r4, sp
c0de171e:	4620      	mov	r0, r4
c0de1720:	f006 ff16 	bl	c0de8550 <setjmp>
c0de1724:	0401      	lsls	r1, r0, #16
c0de1726:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0de172a:	d00b      	beq.n	c0de1744 <app_exit+0x2c>
c0de172c:	f006 fcd6 	bl	c0de80dc <try_context_get>
c0de1730:	42a0      	cmp	r0, r4
c0de1732:	d102      	bne.n	c0de173a <app_exit+0x22>
c0de1734:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de1736:	f006 fcdb 	bl	c0de80f0 <try_context_set>
c0de173a:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0de173e:	b940      	cbnz	r0, c0de1752 <app_exit+0x3a>
c0de1740:	b00c      	add	sp, #48	@ 0x30
c0de1742:	bd10      	pop	{r4, pc}
c0de1744:	4668      	mov	r0, sp
c0de1746:	f006 fcd3 	bl	c0de80f0 <try_context_set>
c0de174a:	900a      	str	r0, [sp, #40]	@ 0x28
c0de174c:	20ff      	movs	r0, #255	@ 0xff
c0de174e:	f006 fc8b 	bl	c0de8068 <os_sched_exit>
c0de1752:	f006 fa02 	bl	c0de7b5a <os_longjmp>
	...

c0de1758 <waves_main>:
c0de1758:	b090      	sub	sp, #64	@ 0x40
c0de175a:	f240 41d0 	movw	r1, #1232	@ 0x4d0
c0de175e:	4648      	mov	r0, r9
c0de1760:	f2c0 0100 	movt	r1, #0
c0de1764:	f240 5af8 	movw	sl, #1528	@ 0x5f8
c0de1768:	2500      	movs	r5, #0
c0de176a:	eb09 0001 	add.w	r0, r9, r1
c0de176e:	f44f 71fa 	mov.w	r1, #500	@ 0x1f4
c0de1772:	466c      	mov	r4, sp
c0de1774:	f10d 0834 	add.w	r8, sp, #52	@ 0x34
c0de1778:	ae0e      	add	r6, sp, #56	@ 0x38
c0de177a:	f2c0 0a00 	movt	sl, #0
c0de177e:	f04f 0b0d 	mov.w	fp, #13
c0de1782:	950f      	str	r5, [sp, #60]	@ 0x3c
c0de1784:	950e      	str	r5, [sp, #56]	@ 0x38
c0de1786:	950d      	str	r5, [sp, #52]	@ 0x34
c0de1788:	f8c0 10e4 	str.w	r1, [r0, #228]	@ 0xe4
c0de178c:	4620      	mov	r0, r4
c0de178e:	f8ad 5032 	strh.w	r5, [sp, #50]	@ 0x32
c0de1792:	f006 fedd 	bl	c0de8550 <setjmp>
c0de1796:	4607      	mov	r7, r0
c0de1798:	b280      	uxth	r0, r0
c0de179a:	f8ad 702c 	strh.w	r7, [sp, #44]	@ 0x2c
c0de179e:	b318      	cbz	r0, c0de17e8 <waves_main+0x90>
c0de17a0:	2805      	cmp	r0, #5
c0de17a2:	d044      	beq.n	c0de182e <waves_main+0xd6>
c0de17a4:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de17a6:	f8ad 502c 	strh.w	r5, [sp, #44]	@ 0x2c
c0de17aa:	f006 fca1 	bl	c0de80f0 <try_context_set>
c0de17ae:	f407 4070 	and.w	r0, r7, #61440	@ 0xf000
c0de17b2:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de17b6:	d004      	beq.n	c0de17c2 <waves_main+0x6a>
c0de17b8:	f5b0 4fc0 	cmp.w	r0, #24576	@ 0x6000
c0de17bc:	bf18      	it	ne
c0de17be:	f36b 27df 	bfine	r7, fp, #11, #21
c0de17c2:	f8ad 7032 	strh.w	r7, [sp, #50]	@ 0x32
c0de17c6:	f8bd 0032 	ldrh.w	r0, [sp, #50]	@ 0x32
c0de17ca:	4649      	mov	r1, r9
c0de17cc:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
c0de17ce:	0a00      	lsrs	r0, r0, #8
c0de17d0:	eb09 010a 	add.w	r1, r9, sl
c0de17d4:	5488      	strb	r0, [r1, r2]
c0de17d6:	f8bd 0032 	ldrh.w	r0, [sp, #50]	@ 0x32
c0de17da:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
c0de17dc:	4411      	add	r1, r2
c0de17de:	7048      	strb	r0, [r1, #1]
c0de17e0:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de17e2:	3002      	adds	r0, #2
c0de17e4:	900e      	str	r0, [sp, #56]	@ 0x38
c0de17e6:	e015      	b.n	c0de1814 <waves_main+0xbc>
c0de17e8:	4620      	mov	r0, r4
c0de17ea:	f006 fc81 	bl	c0de80f0 <try_context_set>
c0de17ee:	900a      	str	r0, [sp, #40]	@ 0x28
c0de17f0:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de17f2:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de17f4:	950e      	str	r5, [sp, #56]	@ 0x38
c0de17f6:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de17f8:	990f      	ldr	r1, [sp, #60]	@ 0x3c
c0de17fa:	b2c0      	uxtb	r0, r0
c0de17fc:	b289      	uxth	r1, r1
c0de17fe:	f004 f9bb 	bl	c0de5b78 <io_exchange>
c0de1802:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de1804:	950d      	str	r5, [sp, #52]	@ 0x34
c0de1806:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de1808:	b1d0      	cbz	r0, c0de1840 <waves_main+0xe8>
c0de180a:	9a0f      	ldr	r2, [sp, #60]	@ 0x3c
c0de180c:	4640      	mov	r0, r8
c0de180e:	4631      	mov	r1, r6
c0de1810:	f7ff f9e7 	bl	c0de0be2 <handle_apdu>
c0de1814:	f006 fc62 	bl	c0de80dc <try_context_get>
c0de1818:	42a0      	cmp	r0, r4
c0de181a:	d102      	bne.n	c0de1822 <waves_main+0xca>
c0de181c:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de181e:	f006 fc67 	bl	c0de80f0 <try_context_set>
c0de1822:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0de1826:	2800      	cmp	r0, #0
c0de1828:	d0b0      	beq.n	c0de178c <waves_main+0x34>
c0de182a:	f006 f996 	bl	c0de7b5a <os_longjmp>
c0de182e:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de1830:	2100      	movs	r1, #0
c0de1832:	f8ad 102c 	strh.w	r1, [sp, #44]	@ 0x2c
c0de1836:	f006 fc5b 	bl	c0de80f0 <try_context_set>
c0de183a:	2005      	movs	r0, #5
c0de183c:	f006 f98d 	bl	c0de7b5a <os_longjmp>
c0de1840:	f646 1082 	movw	r0, #27010	@ 0x6982
c0de1844:	f006 f989 	bl	c0de7b5a <os_longjmp>

c0de1848 <pb_field_iter_begin>:
c0de1848:	b570      	push	{r4, r5, r6, lr}
c0de184a:	460d      	mov	r5, r1
c0de184c:	2128      	movs	r1, #40	@ 0x28
c0de184e:	4614      	mov	r4, r2
c0de1850:	4606      	mov	r6, r0
c0de1852:	f006 fe2b 	bl	c0de84ac <__aeabi_memclr>
c0de1856:	4628      	mov	r0, r5
c0de1858:	f006 fb56 	bl	c0de7f08 <pic>
c0de185c:	6030      	str	r0, [r6, #0]
c0de185e:	4630      	mov	r0, r6
c0de1860:	6074      	str	r4, [r6, #4]
c0de1862:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de1866:	f000 b800 	b.w	c0de186a <load_descriptor_values>

c0de186a <load_descriptor_values>:
c0de186a:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de186e:	4604      	mov	r4, r0
c0de1870:	6800      	ldr	r0, [r0, #0]
c0de1872:	f8b4 8008 	ldrh.w	r8, [r4, #8]
c0de1876:	7801      	ldrb	r1, [r0, #0]
c0de1878:	7842      	ldrb	r2, [r0, #1]
c0de187a:	ea41 2602 	orr.w	r6, r1, r2, lsl #8
c0de187e:	45b0      	cmp	r8, r6
c0de1880:	f080 80b7 	bcs.w	c0de19f2 <load_descriptor_values+0x188>
c0de1884:	f006 fb40 	bl	c0de7f08 <pic>
c0de1888:	f810 1f02 	ldrb.w	r1, [r0, #2]!
c0de188c:	7842      	ldrb	r2, [r0, #1]
c0de188e:	7883      	ldrb	r3, [r0, #2]
c0de1890:	78c0      	ldrb	r0, [r0, #3]
c0de1892:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de1896:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de189a:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de189e:	f006 fb33 	bl	c0de7f08 <pic>
c0de18a2:	8961      	ldrh	r1, [r4, #10]
c0de18a4:	f850 7021 	ldr.w	r7, [r0, r1, lsl #2]
c0de18a8:	f007 0203 	and.w	r2, r7, #3
c0de18ac:	f3c7 0085 	ubfx	r0, r7, #2, #6
c0de18b0:	0a3b      	lsrs	r3, r7, #8
c0de18b2:	2a02      	cmp	r2, #2
c0de18b4:	8220      	strh	r0, [r4, #16]
c0de18b6:	75a3      	strb	r3, [r4, #22]
c0de18b8:	d00b      	beq.n	c0de18d2 <load_descriptor_values+0x68>
c0de18ba:	2a01      	cmp	r2, #1
c0de18bc:	d024      	beq.n	c0de1908 <load_descriptor_values+0x9e>
c0de18be:	2a00      	cmp	r2, #0
c0de18c0:	d145      	bne.n	c0de194e <load_descriptor_values+0xe4>
c0de18c2:	2001      	movs	r0, #1
c0de18c4:	82a0      	strh	r0, [r4, #20]
c0de18c6:	f3c7 6103 	ubfx	r1, r7, #24, #4
c0de18ca:	f3c7 4207 	ubfx	r2, r7, #16, #8
c0de18ce:	0f3d      	lsrs	r5, r7, #28
c0de18d0:	e054      	b.n	c0de197c <load_descriptor_values+0x112>
c0de18d2:	6822      	ldr	r2, [r4, #0]
c0de18d4:	f812 cf02 	ldrb.w	ip, [r2, #2]!
c0de18d8:	7855      	ldrb	r5, [r2, #1]
c0de18da:	7893      	ldrb	r3, [r2, #2]
c0de18dc:	78d2      	ldrb	r2, [r2, #3]
c0de18de:	ea4c 2505 	orr.w	r5, ip, r5, lsl #8
c0de18e2:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de18e6:	ea45 4202 	orr.w	r2, r5, r2, lsl #16
c0de18ea:	eb02 0181 	add.w	r1, r2, r1, lsl #2
c0de18ee:	e9d1 3201 	ldrd	r3, r2, [r1, #4]
c0de18f2:	68cd      	ldr	r5, [r1, #12]
c0de18f4:	0c39      	lsrs	r1, r7, #16
c0de18f6:	82a1      	strh	r1, [r4, #20]
c0de18f8:	f06f 013f 	mvn.w	r1, #63	@ 0x3f
c0de18fc:	ea01 0193 	and.w	r1, r1, r3, lsr #2
c0de1900:	4408      	add	r0, r1
c0de1902:	8220      	strh	r0, [r4, #16]
c0de1904:	b2d9      	uxtb	r1, r3
c0de1906:	e039      	b.n	c0de197c <load_descriptor_values+0x112>
c0de1908:	6820      	ldr	r0, [r4, #0]
c0de190a:	f006 fafd 	bl	c0de7f08 <pic>
c0de190e:	f810 1f02 	ldrb.w	r1, [r0, #2]!
c0de1912:	7842      	ldrb	r2, [r0, #1]
c0de1914:	7883      	ldrb	r3, [r0, #2]
c0de1916:	78c0      	ldrb	r0, [r0, #3]
c0de1918:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de191c:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de1920:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de1924:	f006 faf0 	bl	c0de7f08 <pic>
c0de1928:	8961      	ldrh	r1, [r4, #10]
c0de192a:	f06f 023f 	mvn.w	r2, #63	@ 0x3f
c0de192e:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de1932:	6840      	ldr	r0, [r0, #4]
c0de1934:	f3c7 410b 	ubfx	r1, r7, #16, #12
c0de1938:	82a1      	strh	r1, [r4, #20]
c0de193a:	8a21      	ldrh	r1, [r4, #16]
c0de193c:	ea02 5290 	and.w	r2, r2, r0, lsr #22
c0de1940:	4311      	orrs	r1, r2
c0de1942:	8221      	strh	r1, [r4, #16]
c0de1944:	0f39      	lsrs	r1, r7, #28
c0de1946:	b282      	uxth	r2, r0
c0de1948:	f3c0 450b 	ubfx	r5, r0, #16, #12
c0de194c:	e016      	b.n	c0de197c <load_descriptor_values+0x112>
c0de194e:	6822      	ldr	r2, [r4, #0]
c0de1950:	f812 3f02 	ldrb.w	r3, [r2, #2]!
c0de1954:	7857      	ldrb	r7, [r2, #1]
c0de1956:	7895      	ldrb	r5, [r2, #2]
c0de1958:	78d2      	ldrb	r2, [r2, #3]
c0de195a:	ea43 2307 	orr.w	r3, r3, r7, lsl #8
c0de195e:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de1962:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de1966:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de196a:	1d1f      	adds	r7, r3, #4
c0de196c:	cfa6      	ldmia	r7, {r1, r2, r5, r7}
c0de196e:	f06f 033f 	mvn.w	r3, #63	@ 0x3f
c0de1972:	ea03 0391 	and.w	r3, r3, r1, lsr #2
c0de1976:	4418      	add	r0, r3
c0de1978:	82a7      	strh	r7, [r4, #20]
c0de197a:	8220      	strh	r0, [r4, #16]
c0de197c:	6863      	ldr	r3, [r4, #4]
c0de197e:	8265      	strh	r5, [r4, #18]
c0de1980:	1898      	adds	r0, r3, r2
c0de1982:	060a      	lsls	r2, r1, #24
c0de1984:	61a0      	str	r0, [r4, #24]
c0de1986:	d003      	beq.n	c0de1990 <load_descriptor_values+0x126>
c0de1988:	b249      	sxtb	r1, r1
c0de198a:	1a42      	subs	r2, r0, r1
c0de198c:	7da1      	ldrb	r1, [r4, #22]
c0de198e:	e00e      	b.n	c0de19ae <load_descriptor_values+0x144>
c0de1990:	7da1      	ldrb	r1, [r4, #22]
c0de1992:	f001 0230 	and.w	r2, r1, #48	@ 0x30
c0de1996:	2a20      	cmp	r2, #32
c0de1998:	d108      	bne.n	c0de19ac <load_descriptor_values+0x142>
c0de199a:	f041 0280 	orr.w	r2, r1, #128	@ 0x80
c0de199e:	f002 02c0 	and.w	r2, r2, #192	@ 0xc0
c0de19a2:	2a80      	cmp	r2, #128	@ 0x80
c0de19a4:	d102      	bne.n	c0de19ac <load_descriptor_values+0x142>
c0de19a6:	f104 0214 	add.w	r2, r4, #20
c0de19aa:	e000      	b.n	c0de19ae <load_descriptor_values+0x144>
c0de19ac:	2200      	movs	r2, #0
c0de19ae:	6222      	str	r2, [r4, #32]
c0de19b0:	f001 02c0 	and.w	r2, r1, #192	@ 0xc0
c0de19b4:	2a80      	cmp	r2, #128	@ 0x80
c0de19b6:	d101      	bne.n	c0de19bc <load_descriptor_values+0x152>
c0de19b8:	b103      	cbz	r3, c0de19bc <load_descriptor_values+0x152>
c0de19ba:	6800      	ldr	r0, [r0, #0]
c0de19bc:	f001 010e 	and.w	r1, r1, #14
c0de19c0:	2908      	cmp	r1, #8
c0de19c2:	61e0      	str	r0, [r4, #28]
c0de19c4:	d113      	bne.n	c0de19ee <load_descriptor_values+0x184>
c0de19c6:	6820      	ldr	r0, [r4, #0]
c0de19c8:	f006 fa9e 	bl	c0de7f08 <pic>
c0de19cc:	f810 1f06 	ldrb.w	r1, [r0, #6]!
c0de19d0:	7842      	ldrb	r2, [r0, #1]
c0de19d2:	7883      	ldrb	r3, [r0, #2]
c0de19d4:	78c0      	ldrb	r0, [r0, #3]
c0de19d6:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de19da:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de19de:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de19e2:	f006 fa91 	bl	c0de7f08 <pic>
c0de19e6:	89e1      	ldrh	r1, [r4, #14]
c0de19e8:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de19ec:	e000      	b.n	c0de19f0 <load_descriptor_values+0x186>
c0de19ee:	2000      	movs	r0, #0
c0de19f0:	6260      	str	r0, [r4, #36]	@ 0x24
c0de19f2:	2000      	movs	r0, #0
c0de19f4:	45b0      	cmp	r8, r6
c0de19f6:	bf38      	it	cc
c0de19f8:	2001      	movcc	r0, #1
c0de19fa:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de19fe <pb_field_iter_begin_extension>:
c0de19fe:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1a00:	b081      	sub	sp, #4
c0de1a02:	460f      	mov	r7, r1
c0de1a04:	460c      	mov	r4, r1
c0de1a06:	f857 1b04 	ldr.w	r1, [r7], #4
c0de1a0a:	688e      	ldr	r6, [r1, #8]
c0de1a0c:	4631      	mov	r1, r6
c0de1a0e:	f811 2f02 	ldrb.w	r2, [r1, #2]!
c0de1a12:	78f3      	ldrb	r3, [r6, #3]
c0de1a14:	788d      	ldrb	r5, [r1, #2]
c0de1a16:	78c9      	ldrb	r1, [r1, #3]
c0de1a18:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de1a1c:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de1a20:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de1a24:	6809      	ldr	r1, [r1, #0]
c0de1a26:	4605      	mov	r5, r0
c0de1a28:	f401 4140 	and.w	r1, r1, #49152	@ 0xc000
c0de1a2c:	f5b1 4f00 	cmp.w	r1, #32768	@ 0x8000
c0de1a30:	4628      	mov	r0, r5
c0de1a32:	f04f 0128 	mov.w	r1, #40	@ 0x28
c0de1a36:	bf18      	it	ne
c0de1a38:	683f      	ldrne	r7, [r7, #0]
c0de1a3a:	f006 fd37 	bl	c0de84ac <__aeabi_memclr>
c0de1a3e:	4630      	mov	r0, r6
c0de1a40:	f006 fa62 	bl	c0de7f08 <pic>
c0de1a44:	6028      	str	r0, [r5, #0]
c0de1a46:	4628      	mov	r0, r5
c0de1a48:	606f      	str	r7, [r5, #4]
c0de1a4a:	f7ff ff0e 	bl	c0de186a <load_descriptor_values>
c0de1a4e:	f104 010c 	add.w	r1, r4, #12
c0de1a52:	6229      	str	r1, [r5, #32]
c0de1a54:	b001      	add	sp, #4
c0de1a56:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de1a58 <pb_field_iter_next>:
c0de1a58:	b510      	push	{r4, lr}
c0de1a5a:	4604      	mov	r4, r0
c0de1a5c:	f000 f808 	bl	c0de1a70 <advance_iterator>
c0de1a60:	4620      	mov	r0, r4
c0de1a62:	f7ff ff02 	bl	c0de186a <load_descriptor_values>
c0de1a66:	8920      	ldrh	r0, [r4, #8]
c0de1a68:	2800      	cmp	r0, #0
c0de1a6a:	bf18      	it	ne
c0de1a6c:	2001      	movne	r0, #1
c0de1a6e:	bd10      	pop	{r4, pc}

c0de1a70 <advance_iterator>:
c0de1a70:	b510      	push	{r4, lr}
c0de1a72:	4604      	mov	r4, r0
c0de1a74:	6800      	ldr	r0, [r0, #0]
c0de1a76:	8921      	ldrh	r1, [r4, #8]
c0de1a78:	7802      	ldrb	r2, [r0, #0]
c0de1a7a:	7843      	ldrb	r3, [r0, #1]
c0de1a7c:	3101      	adds	r1, #1
c0de1a7e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de1a82:	b28b      	uxth	r3, r1
c0de1a84:	4293      	cmp	r3, r2
c0de1a86:	8121      	strh	r1, [r4, #8]
c0de1a88:	d228      	bcs.n	c0de1adc <advance_iterator+0x6c>
c0de1a8a:	f006 fa3d 	bl	c0de7f08 <pic>
c0de1a8e:	f810 1f02 	ldrb.w	r1, [r0, #2]!
c0de1a92:	7842      	ldrb	r2, [r0, #1]
c0de1a94:	7883      	ldrb	r3, [r0, #2]
c0de1a96:	78c0      	ldrb	r0, [r0, #3]
c0de1a98:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de1a9c:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de1aa0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de1aa4:	f006 fa30 	bl	c0de7f08 <pic>
c0de1aa8:	8961      	ldrh	r1, [r4, #10]
c0de1aaa:	2301      	movs	r3, #1
c0de1aac:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de1ab0:	f000 0203 	and.w	r2, r0, #3
c0de1ab4:	fa03 f202 	lsl.w	r2, r3, r2
c0de1ab8:	4411      	add	r1, r2
c0de1aba:	f410 5f40 	tst.w	r0, #12288	@ 0x3000
c0de1abe:	8161      	strh	r1, [r4, #10]
c0de1ac0:	d102      	bne.n	c0de1ac8 <advance_iterator+0x58>
c0de1ac2:	89a1      	ldrh	r1, [r4, #12]
c0de1ac4:	3101      	adds	r1, #1
c0de1ac6:	81a1      	strh	r1, [r4, #12]
c0de1ac8:	f400 6060 	and.w	r0, r0, #3584	@ 0xe00
c0de1acc:	f5b0 6f00 	cmp.w	r0, #2048	@ 0x800
c0de1ad0:	bf18      	it	ne
c0de1ad2:	bd10      	popne	{r4, pc}
c0de1ad4:	89e0      	ldrh	r0, [r4, #14]
c0de1ad6:	3001      	adds	r0, #1
c0de1ad8:	81e0      	strh	r0, [r4, #14]
c0de1ada:	bd10      	pop	{r4, pc}
c0de1adc:	2000      	movs	r0, #0
c0de1ade:	e9c4 0002 	strd	r0, r0, [r4, #8]
c0de1ae2:	bd10      	pop	{r4, pc}

c0de1ae4 <pb_field_iter_find>:
c0de1ae4:	b570      	push	{r4, r5, r6, lr}
c0de1ae6:	4604      	mov	r4, r0
c0de1ae8:	8a00      	ldrh	r0, [r0, #16]
c0de1aea:	4288      	cmp	r0, r1
c0de1aec:	d101      	bne.n	c0de1af2 <pb_field_iter_find+0xe>
c0de1aee:	2001      	movs	r0, #1
c0de1af0:	bd70      	pop	{r4, r5, r6, pc}
c0de1af2:	8926      	ldrh	r6, [r4, #8]
c0de1af4:	460d      	mov	r5, r1
c0de1af6:	bf00      	nop
c0de1af8:	4620      	mov	r0, r4
c0de1afa:	f7ff ffb9 	bl	c0de1a70 <advance_iterator>
c0de1afe:	6820      	ldr	r0, [r4, #0]
c0de1b00:	f006 fa02 	bl	c0de7f08 <pic>
c0de1b04:	f810 1f02 	ldrb.w	r1, [r0, #2]!
c0de1b08:	7842      	ldrb	r2, [r0, #1]
c0de1b0a:	7883      	ldrb	r3, [r0, #2]
c0de1b0c:	78c0      	ldrb	r0, [r0, #3]
c0de1b0e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de1b12:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de1b16:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de1b1a:	f006 f9f5 	bl	c0de7f08 <pic>
c0de1b1e:	8961      	ldrh	r1, [r4, #10]
c0de1b20:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de1b24:	ea85 0090 	eor.w	r0, r5, r0, lsr #2
c0de1b28:	0680      	lsls	r0, r0, #26
c0de1b2a:	d10b      	bne.n	c0de1b44 <pb_field_iter_find+0x60>
c0de1b2c:	4620      	mov	r0, r4
c0de1b2e:	f7ff fe9c 	bl	c0de186a <load_descriptor_values>
c0de1b32:	8a20      	ldrh	r0, [r4, #16]
c0de1b34:	42a8      	cmp	r0, r5
c0de1b36:	d105      	bne.n	c0de1b44 <pb_field_iter_find+0x60>
c0de1b38:	7da0      	ldrb	r0, [r4, #22]
c0de1b3a:	f000 000f 	and.w	r0, r0, #15
c0de1b3e:	280a      	cmp	r0, #10
c0de1b40:	d1d5      	bne.n	c0de1aee <pb_field_iter_find+0xa>
c0de1b42:	bf00      	nop
c0de1b44:	8920      	ldrh	r0, [r4, #8]
c0de1b46:	42b0      	cmp	r0, r6
c0de1b48:	d1d6      	bne.n	c0de1af8 <pb_field_iter_find+0x14>
c0de1b4a:	4620      	mov	r0, r4
c0de1b4c:	f7ff fe8d 	bl	c0de186a <load_descriptor_values>
c0de1b50:	2000      	movs	r0, #0
c0de1b52:	bd70      	pop	{r4, r5, r6, pc}

c0de1b54 <pb_default_field_callback>:
c0de1b54:	8a53      	ldrh	r3, [r2, #18]
c0de1b56:	2b08      	cmp	r3, #8
c0de1b58:	d114      	bne.n	c0de1b84 <pb_default_field_callback+0x30>
c0de1b5a:	69d3      	ldr	r3, [r2, #28]
c0de1b5c:	b193      	cbz	r3, c0de1b84 <pb_default_field_callback+0x30>
c0de1b5e:	b130      	cbz	r0, c0de1b6e <pb_default_field_callback+0x1a>
c0de1b60:	f8d3 c000 	ldr.w	ip, [r3]
c0de1b64:	f1bc 0f00 	cmp.w	ip, #0
c0de1b68:	d001      	beq.n	c0de1b6e <pb_default_field_callback+0x1a>
c0de1b6a:	3304      	adds	r3, #4
c0de1b6c:	e007      	b.n	c0de1b7e <pb_default_field_callback+0x2a>
c0de1b6e:	b149      	cbz	r1, c0de1b84 <pb_default_field_callback+0x30>
c0de1b70:	f8d3 c000 	ldr.w	ip, [r3]
c0de1b74:	f1bc 0f00 	cmp.w	ip, #0
c0de1b78:	d004      	beq.n	c0de1b84 <pb_default_field_callback+0x30>
c0de1b7a:	3304      	adds	r3, #4
c0de1b7c:	4608      	mov	r0, r1
c0de1b7e:	4611      	mov	r1, r2
c0de1b80:	461a      	mov	r2, r3
c0de1b82:	4760      	bx	ip
c0de1b84:	2001      	movs	r0, #1
c0de1b86:	4770      	bx	lr

c0de1b88 <apdu_read>:
c0de1b88:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1b8c:	b084      	sub	sp, #16
c0de1b8e:	2a65      	cmp	r2, #101	@ 0x65
c0de1b90:	9102      	str	r1, [sp, #8]
c0de1b92:	f080 80af 	bcs.w	c0de1cf4 <apdu_read+0x16c>
c0de1b96:	6846      	ldr	r6, [r0, #4]
c0de1b98:	9003      	str	r0, [sp, #12]
c0de1b9a:	8870      	ldrh	r0, [r6, #2]
c0de1b9c:	8831      	ldrh	r1, [r6, #0]
c0de1b9e:	4614      	mov	r4, r2
c0de1ba0:	1a47      	subs	r7, r0, r1
c0de1ba2:	b2b8      	uxth	r0, r7
c0de1ba4:	4290      	cmp	r0, r2
c0de1ba6:	d275      	bcs.n	c0de1c94 <apdu_read+0x10c>
c0de1ba8:	f106 000a 	add.w	r0, r6, #10
c0de1bac:	4401      	add	r1, r0
c0de1bae:	463a      	mov	r2, r7
c0de1bb0:	f006 fc81 	bl	c0de84b6 <__aeabi_memmove>
c0de1bb4:	8077      	strh	r7, [r6, #2]
c0de1bb6:	f240 57f8 	movw	r7, #1528	@ 0x5f8
c0de1bba:	f240 0500 	movw	r5, #0
c0de1bbe:	2000      	movs	r0, #0
c0de1bc0:	f04f 0800 	mov.w	r8, #0
c0de1bc4:	f2c0 0700 	movt	r7, #0
c0de1bc8:	f2c0 0500 	movt	r5, #0
c0de1bcc:	f04f 0b00 	mov.w	fp, #0
c0de1bd0:	8030      	strh	r0, [r6, #0]
c0de1bd2:	bf00      	nop
c0de1bd4:	f1bb 0f0a 	cmp.w	fp, #10
c0de1bd8:	f080 8080 	bcs.w	c0de1cdc <apdu_read+0x154>
c0de1bdc:	88f0      	ldrh	r0, [r6, #6]
c0de1bde:	88b1      	ldrh	r1, [r6, #4]
c0de1be0:	4288      	cmp	r0, r1
c0de1be2:	d071      	beq.n	c0de1cc8 <apdu_read+0x140>
c0de1be4:	2090      	movs	r0, #144	@ 0x90
c0de1be6:	f809 0007 	strb.w	r0, [r9, r7]
c0de1bea:	eb09 0a07 	add.w	sl, r9, r7
c0de1bee:	2000      	movs	r0, #0
c0de1bf0:	2102      	movs	r1, #2
c0de1bf2:	f88a 8001 	strb.w	r8, [sl, #1]
c0de1bf6:	f003 ffbf 	bl	c0de5b78 <io_exchange>
c0de1bfa:	f89a 3004 	ldrb.w	r3, [sl, #4]
c0de1bfe:	3805      	subs	r0, #5
c0de1c00:	4298      	cmp	r0, r3
c0de1c02:	d16f      	bne.n	c0de1ce4 <apdu_read+0x15c>
c0de1c04:	eb09 0007 	add.w	r0, r9, r7
c0de1c08:	7880      	ldrb	r0, [r0, #2]
c0de1c0a:	0640      	lsls	r0, r0, #25
c0de1c0c:	d162      	bne.n	c0de1cd4 <apdu_read+0x14c>
c0de1c0e:	8870      	ldrh	r0, [r6, #2]
c0de1c10:	18c1      	adds	r1, r0, r3
c0de1c12:	29a1      	cmp	r1, #161	@ 0xa1
c0de1c14:	d26a      	bcs.n	c0de1cec <apdu_read+0x164>
c0de1c16:	eb09 0205 	add.w	r2, r9, r5
c0de1c1a:	f892 239a 	ldrb.w	r2, [r2, #922]	@ 0x39a
c0de1c1e:	2a08      	cmp	r2, #8
c0de1c20:	d058      	beq.n	c0de1cd4 <apdu_read+0x14c>
c0de1c22:	88f2      	ldrh	r2, [r6, #6]
c0de1c24:	46a2      	mov	sl, r4
c0de1c26:	441a      	add	r2, r3
c0de1c28:	8934      	ldrh	r4, [r6, #8]
c0de1c2a:	80f2      	strh	r2, [r6, #6]
c0de1c2c:	88b2      	ldrh	r2, [r6, #4]
c0de1c2e:	4421      	add	r1, r4
c0de1c30:	4420      	add	r0, r4
c0de1c32:	4291      	cmp	r1, r2
c0de1c34:	bf88      	it	hi
c0de1c36:	1a13      	subhi	r3, r2, r0
c0de1c38:	eb09 0005 	add.w	r0, r9, r5
c0de1c3c:	eb09 0107 	add.w	r1, r9, r7
c0de1c40:	f880 339b 	strb.w	r3, [r0, #923]	@ 0x39b
c0de1c44:	2400      	movs	r4, #0
c0de1c46:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de1c4a:	1d4a      	adds	r2, r1, #5
c0de1c4c:	2100      	movs	r1, #0
c0de1c4e:	9400      	str	r4, [sp, #0]
c0de1c50:	f04f 0800 	mov.w	r8, #0
c0de1c54:	9401      	str	r4, [sp, #4]
c0de1c56:	f005 ff5c 	bl	c0de7b12 <cx_hash_no_throw>
c0de1c5a:	2800      	cmp	r0, #0
c0de1c5c:	d148      	bne.n	c0de1cf0 <apdu_read+0x168>
c0de1c5e:	eb09 0005 	add.w	r0, r9, r5
c0de1c62:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de1c66:	f10b 0b01 	add.w	fp, fp, #1
c0de1c6a:	f005 ff4e 	bl	c0de7b0a <cx_hash_get_size>
c0de1c6e:	8870      	ldrh	r0, [r6, #2]
c0de1c70:	eb09 0407 	add.w	r4, r9, r7
c0de1c74:	4430      	add	r0, r6
c0de1c76:	7922      	ldrb	r2, [r4, #4]
c0de1c78:	300a      	adds	r0, #10
c0de1c7a:	1d61      	adds	r1, r4, #5
c0de1c7c:	f006 fc1b 	bl	c0de84b6 <__aeabi_memmove>
c0de1c80:	7920      	ldrb	r0, [r4, #4]
c0de1c82:	8872      	ldrh	r2, [r6, #2]
c0de1c84:	8831      	ldrh	r1, [r6, #0]
c0de1c86:	4410      	add	r0, r2
c0de1c88:	1a42      	subs	r2, r0, r1
c0de1c8a:	b292      	uxth	r2, r2
c0de1c8c:	4654      	mov	r4, sl
c0de1c8e:	4552      	cmp	r2, sl
c0de1c90:	8070      	strh	r0, [r6, #2]
c0de1c92:	d39f      	bcc.n	c0de1bd4 <apdu_read+0x4c>
c0de1c94:	88b2      	ldrh	r2, [r6, #4]
c0de1c96:	8930      	ldrh	r0, [r6, #8]
c0de1c98:	4282      	cmp	r2, r0
c0de1c9a:	d915      	bls.n	c0de1cc8 <apdu_read+0x140>
c0de1c9c:	9f02      	ldr	r7, [sp, #8]
c0de1c9e:	4420      	add	r0, r4
c0de1ca0:	190a      	adds	r2, r1, r4
c0de1ca2:	8130      	strh	r0, [r6, #8]
c0de1ca4:	f04f 0001 	mov.w	r0, #1
c0de1ca8:	8032      	strh	r2, [r6, #0]
c0de1caa:	b187      	cbz	r7, c0de1cce <apdu_read+0x146>
c0de1cac:	b17c      	cbz	r4, c0de1cce <apdu_read+0x146>
c0de1cae:	1870      	adds	r0, r6, r1
c0de1cb0:	300a      	adds	r0, #10
c0de1cb2:	2100      	movs	r1, #0
c0de1cb4:	2200      	movs	r2, #0
c0de1cb6:	bf00      	nop
c0de1cb8:	5c43      	ldrb	r3, [r0, r1]
c0de1cba:	3201      	adds	r2, #1
c0de1cbc:	547b      	strb	r3, [r7, r1]
c0de1cbe:	b291      	uxth	r1, r2
c0de1cc0:	42a1      	cmp	r1, r4
c0de1cc2:	d3f9      	bcc.n	c0de1cb8 <apdu_read+0x130>
c0de1cc4:	2001      	movs	r0, #1
c0de1cc6:	e002      	b.n	c0de1cce <apdu_read+0x146>
c0de1cc8:	9903      	ldr	r1, [sp, #12]
c0de1cca:	2000      	movs	r0, #0
c0de1ccc:	6088      	str	r0, [r1, #8]
c0de1cce:	b004      	add	sp, #16
c0de1cd0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de1cd4:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de1cd8:	f005 ff3f 	bl	c0de7b5a <os_longjmp>
c0de1cdc:	f246 0003 	movw	r0, #24579	@ 0x6003
c0de1ce0:	f005 ff3b 	bl	c0de7b5a <os_longjmp>
c0de1ce4:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de1ce8:	f005 ff37 	bl	c0de7b5a <os_longjmp>
c0de1cec:	f246 0005 	movw	r0, #24581	@ 0x6005
c0de1cf0:	f005 ff33 	bl	c0de7b5a <os_longjmp>
c0de1cf4:	f246 0002 	movw	r0, #24578	@ 0x6002
c0de1cf8:	f005 ff2f 	bl	c0de7b5a <os_longjmp>

c0de1cfc <pb_istream_from_apdu>:
c0de1cfc:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de1d00:	b083      	sub	sp, #12
c0de1d02:	460c      	mov	r4, r1
c0de1d04:	f64f 6177 	movw	r1, #65143	@ 0xfe77
c0de1d08:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de1d0c:	4616      	mov	r6, r2
c0de1d0e:	4479      	add	r1, pc
c0de1d10:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de1d14:	f04f 0800 	mov.w	r8, #0
c0de1d18:	9f0a      	ldr	r7, [sp, #40]	@ 0x28
c0de1d1a:	e9c0 1400 	strd	r1, r4, [r0]
c0de1d1e:	e9c0 2802 	strd	r2, r8, [r0, #8]
c0de1d22:	4620      	mov	r0, r4
c0de1d24:	21aa      	movs	r1, #170	@ 0xaa
c0de1d26:	461d      	mov	r5, r3
c0de1d28:	f006 fbc0 	bl	c0de84ac <__aeabi_memclr>
c0de1d2c:	f104 000a 	add.w	r0, r4, #10
c0de1d30:	4631      	mov	r1, r6
c0de1d32:	462a      	mov	r2, r5
c0de1d34:	80e5      	strh	r5, [r4, #6]
c0de1d36:	80a7      	strh	r7, [r4, #4]
c0de1d38:	f006 fbbd 	bl	c0de84b6 <__aeabi_memmove>
c0de1d3c:	f240 0a00 	movw	sl, #0
c0de1d40:	42bd      	cmp	r5, r7
c0de1d42:	f2c0 0a00 	movt	sl, #0
c0de1d46:	462b      	mov	r3, r5
c0de1d48:	d907      	bls.n	c0de1d5a <pb_istream_from_apdu+0x5e>
c0de1d4a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de1d4c:	eb09 010a 	add.w	r1, r9, sl
c0de1d50:	4438      	add	r0, r7
c0de1d52:	3805      	subs	r0, #5
c0de1d54:	b2fb      	uxtb	r3, r7
c0de1d56:	f881 039b 	strb.w	r0, [r1, #923]	@ 0x39b
c0de1d5a:	eb09 000a 	add.w	r0, r9, sl
c0de1d5e:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de1d62:	2100      	movs	r1, #0
c0de1d64:	4632      	mov	r2, r6
c0de1d66:	f8cd 8000 	str.w	r8, [sp]
c0de1d6a:	f8cd 8004 	str.w	r8, [sp, #4]
c0de1d6e:	f005 fed0 	bl	c0de7b12 <cx_hash_no_throw>
c0de1d72:	b960      	cbnz	r0, c0de1d8e <pb_istream_from_apdu+0x92>
c0de1d74:	eb09 000a 	add.w	r0, r9, sl
c0de1d78:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de1d7c:	f005 fec5 	bl	c0de7b0a <cx_hash_get_size>
c0de1d80:	2000      	movs	r0, #0
c0de1d82:	8065      	strh	r5, [r4, #2]
c0de1d84:	8020      	strh	r0, [r4, #0]
c0de1d86:	8120      	strh	r0, [r4, #8]
c0de1d88:	b003      	add	sp, #12
c0de1d8a:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de1d8e:	f005 fee4 	bl	c0de7b5a <os_longjmp>
	...

c0de1d94 <pb_read>:
c0de1d94:	b570      	push	{r4, r5, r6, lr}
c0de1d96:	b084      	sub	sp, #16
c0de1d98:	b1a2      	cbz	r2, c0de1dc4 <pb_read+0x30>
c0de1d9a:	4615      	mov	r5, r2
c0de1d9c:	4604      	mov	r4, r0
c0de1d9e:	b199      	cbz	r1, c0de1dc8 <pb_read+0x34>
c0de1da0:	68a0      	ldr	r0, [r4, #8]
c0de1da2:	42a8      	cmp	r0, r5
c0de1da4:	d206      	bcs.n	c0de1db4 <pb_read+0x20>
c0de1da6:	68e0      	ldr	r0, [r4, #12]
c0de1da8:	f646 71ef 	movw	r1, #28655	@ 0x6fef
c0de1dac:	f2c0 0100 	movt	r1, #0
c0de1db0:	4479      	add	r1, pc
c0de1db2:	e02a      	b.n	c0de1e0a <pb_read+0x76>
c0de1db4:	6823      	ldr	r3, [r4, #0]
c0de1db6:	4620      	mov	r0, r4
c0de1db8:	462a      	mov	r2, r5
c0de1dba:	4798      	blx	r3
c0de1dbc:	b1f8      	cbz	r0, c0de1dfe <pb_read+0x6a>
c0de1dbe:	68a0      	ldr	r0, [r4, #8]
c0de1dc0:	1b40      	subs	r0, r0, r5
c0de1dc2:	60a0      	str	r0, [r4, #8]
c0de1dc4:	2001      	movs	r0, #1
c0de1dc6:	e025      	b.n	c0de1e14 <pb_read+0x80>
c0de1dc8:	6820      	ldr	r0, [r4, #0]
c0de1dca:	f240 0243 	movw	r2, #67	@ 0x43
c0de1dce:	f2c0 0200 	movt	r2, #0
c0de1dd2:	447a      	add	r2, pc
c0de1dd4:	4290      	cmp	r0, r2
c0de1dd6:	d0e3      	beq.n	c0de1da0 <pb_read+0xc>
c0de1dd8:	2d11      	cmp	r5, #17
c0de1dda:	d30a      	bcc.n	c0de1df2 <pb_read+0x5e>
c0de1ddc:	466e      	mov	r6, sp
c0de1dde:	bf00      	nop
c0de1de0:	4620      	mov	r0, r4
c0de1de2:	4631      	mov	r1, r6
c0de1de4:	2210      	movs	r2, #16
c0de1de6:	f7ff ffd5 	bl	c0de1d94 <pb_read>
c0de1dea:	b190      	cbz	r0, c0de1e12 <pb_read+0x7e>
c0de1dec:	3d10      	subs	r5, #16
c0de1dee:	2d10      	cmp	r5, #16
c0de1df0:	d8f6      	bhi.n	c0de1de0 <pb_read+0x4c>
c0de1df2:	4669      	mov	r1, sp
c0de1df4:	4620      	mov	r0, r4
c0de1df6:	462a      	mov	r2, r5
c0de1df8:	f7ff ffcc 	bl	c0de1d94 <pb_read>
c0de1dfc:	e00a      	b.n	c0de1e14 <pb_read+0x80>
c0de1dfe:	68e0      	ldr	r0, [r4, #12]
c0de1e00:	f646 61c8 	movw	r1, #28360	@ 0x6ec8
c0de1e04:	f2c0 0100 	movt	r1, #0
c0de1e08:	4479      	add	r1, pc
c0de1e0a:	2800      	cmp	r0, #0
c0de1e0c:	bf18      	it	ne
c0de1e0e:	4601      	movne	r1, r0
c0de1e10:	60e1      	str	r1, [r4, #12]
c0de1e12:	2000      	movs	r0, #0
c0de1e14:	b004      	add	sp, #16
c0de1e16:	bd70      	pop	{r4, r5, r6, pc}

c0de1e18 <buf_read>:
c0de1e18:	6843      	ldr	r3, [r0, #4]
c0de1e1a:	eb03 0c02 	add.w	ip, r3, r2
c0de1e1e:	f8c0 c004 	str.w	ip, [r0, #4]
c0de1e22:	b139      	cbz	r1, c0de1e34 <buf_read+0x1c>
c0de1e24:	b132      	cbz	r2, c0de1e34 <buf_read+0x1c>
c0de1e26:	bf00      	nop
c0de1e28:	f813 0b01 	ldrb.w	r0, [r3], #1
c0de1e2c:	3a01      	subs	r2, #1
c0de1e2e:	f801 0b01 	strb.w	r0, [r1], #1
c0de1e32:	d1f9      	bne.n	c0de1e28 <buf_read+0x10>
c0de1e34:	2001      	movs	r0, #1
c0de1e36:	4770      	bx	lr

c0de1e38 <pb_decode_varint32_eof>:
c0de1e38:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1e3c:	b082      	sub	sp, #8
c0de1e3e:	4688      	mov	r8, r1
c0de1e40:	f10d 0107 	add.w	r1, sp, #7
c0de1e44:	4616      	mov	r6, r2
c0de1e46:	4604      	mov	r4, r0
c0de1e48:	f000 f889 	bl	c0de1f5e <pb_readbyte>
c0de1e4c:	b138      	cbz	r0, c0de1e5e <pb_decode_varint32_eof+0x26>
c0de1e4e:	f89d 7007 	ldrb.w	r7, [sp, #7]
c0de1e52:	0638      	lsls	r0, r7, #24
c0de1e54:	d40b      	bmi.n	c0de1e6e <pb_decode_varint32_eof+0x36>
c0de1e56:	2001      	movs	r0, #1
c0de1e58:	f8c8 7000 	str.w	r7, [r8]
c0de1e5c:	e03e      	b.n	c0de1edc <pb_decode_varint32_eof+0xa4>
c0de1e5e:	f04f 0000 	mov.w	r0, #0
c0de1e62:	b3de      	cbz	r6, c0de1edc <pb_decode_varint32_eof+0xa4>
c0de1e64:	68a1      	ldr	r1, [r4, #8]
c0de1e66:	bbc9      	cbnz	r1, c0de1edc <pb_decode_varint32_eof+0xa4>
c0de1e68:	2001      	movs	r0, #1
c0de1e6a:	7030      	strb	r0, [r6, #0]
c0de1e6c:	e035      	b.n	c0de1eda <pb_decode_varint32_eof+0xa2>
c0de1e6e:	f007 077f 	and.w	r7, r7, #127	@ 0x7f
c0de1e72:	2507      	movs	r5, #7
c0de1e74:	f10d 0607 	add.w	r6, sp, #7
c0de1e78:	4620      	mov	r0, r4
c0de1e7a:	4631      	mov	r1, r6
c0de1e7c:	f000 f86f 	bl	c0de1f5e <pb_readbyte>
c0de1e80:	b358      	cbz	r0, c0de1eda <pb_decode_varint32_eof+0xa2>
c0de1e82:	b2e9      	uxtb	r1, r5
c0de1e84:	f89d 0007 	ldrb.w	r0, [sp, #7]
c0de1e88:	2920      	cmp	r1, #32
c0de1e8a:	d30d      	bcc.n	c0de1ea8 <pb_decode_varint32_eof+0x70>
c0de1e8c:	0642      	lsls	r2, r0, #25
c0de1e8e:	d00f      	beq.n	c0de1eb0 <pb_decode_varint32_eof+0x78>
c0de1e90:	293f      	cmp	r1, #63	@ 0x3f
c0de1e92:	f04f 0201 	mov.w	r2, #1
c0de1e96:	bf38      	it	cc
c0de1e98:	22ff      	movcc	r2, #255	@ 0xff
c0de1e9a:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de1e9e:	dc12      	bgt.n	c0de1ec6 <pb_decode_varint32_eof+0x8e>
c0de1ea0:	4282      	cmp	r2, r0
c0de1ea2:	d005      	beq.n	c0de1eb0 <pb_decode_varint32_eof+0x78>
c0de1ea4:	e00f      	b.n	c0de1ec6 <pb_decode_varint32_eof+0x8e>
c0de1ea6:	bf00      	nop
c0de1ea8:	f000 027f 	and.w	r2, r0, #127	@ 0x7f
c0de1eac:	408a      	lsls	r2, r1
c0de1eae:	4317      	orrs	r7, r2
c0de1eb0:	b242      	sxtb	r2, r0
c0de1eb2:	2a00      	cmp	r2, #0
c0de1eb4:	f101 0507 	add.w	r5, r1, #7
c0de1eb8:	d4de      	bmi.n	c0de1e78 <pb_decode_varint32_eof+0x40>
c0de1eba:	b2e9      	uxtb	r1, r5
c0de1ebc:	2923      	cmp	r1, #35	@ 0x23
c0de1ebe:	d1ca      	bne.n	c0de1e56 <pb_decode_varint32_eof+0x1e>
c0de1ec0:	f010 0070 	ands.w	r0, r0, #112	@ 0x70
c0de1ec4:	d0c7      	beq.n	c0de1e56 <pb_decode_varint32_eof+0x1e>
c0de1ec6:	68e0      	ldr	r0, [r4, #12]
c0de1ec8:	f247 014d 	movw	r1, #28749	@ 0x704d
c0de1ecc:	f2c0 0100 	movt	r1, #0
c0de1ed0:	4479      	add	r1, pc
c0de1ed2:	2800      	cmp	r0, #0
c0de1ed4:	bf18      	it	ne
c0de1ed6:	4601      	movne	r1, r0
c0de1ed8:	60e1      	str	r1, [r4, #12]
c0de1eda:	2000      	movs	r0, #0
c0de1edc:	b002      	add	sp, #8
c0de1ede:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
	...

c0de1ee4 <pb_decode_varint>:
c0de1ee4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de1ee8:	b081      	sub	sp, #4
c0de1eea:	4688      	mov	r8, r1
c0de1eec:	4604      	mov	r4, r0
c0de1eee:	2000      	movs	r0, #0
c0de1ef0:	f10d 0a03 	add.w	sl, sp, #3
c0de1ef4:	2700      	movs	r7, #0
c0de1ef6:	2500      	movs	r5, #0
c0de1ef8:	b2c6      	uxtb	r6, r0
c0de1efa:	2e40      	cmp	r6, #64	@ 0x40
c0de1efc:	d221      	bcs.n	c0de1f42 <pb_decode_varint+0x5e>
c0de1efe:	4620      	mov	r0, r4
c0de1f00:	4651      	mov	r1, sl
c0de1f02:	f000 f82c 	bl	c0de1f5e <pb_readbyte>
c0de1f06:	b330      	cbz	r0, c0de1f56 <pb_decode_varint+0x72>
c0de1f08:	f89d 0003 	ldrb.w	r0, [sp, #3]
c0de1f0c:	f1c6 0320 	rsb	r3, r6, #32
c0de1f10:	f000 017f 	and.w	r1, r0, #127	@ 0x7f
c0de1f14:	fa21 f303 	lsr.w	r3, r1, r3
c0de1f18:	f1b6 0220 	subs.w	r2, r6, #32
c0de1f1c:	bf58      	it	pl
c0de1f1e:	fa01 f302 	lslpl.w	r3, r1, r2
c0de1f22:	fa01 f106 	lsl.w	r1, r1, r6
c0de1f26:	bf58      	it	pl
c0de1f28:	2100      	movpl	r1, #0
c0de1f2a:	0600      	lsls	r0, r0, #24
c0de1f2c:	ea45 0503 	orr.w	r5, r5, r3
c0de1f30:	ea47 0701 	orr.w	r7, r7, r1
c0de1f34:	f106 0007 	add.w	r0, r6, #7
c0de1f38:	d4de      	bmi.n	c0de1ef8 <pb_decode_varint+0x14>
c0de1f3a:	2001      	movs	r0, #1
c0de1f3c:	e9c8 7500 	strd	r7, r5, [r8]
c0de1f40:	e00a      	b.n	c0de1f58 <pb_decode_varint+0x74>
c0de1f42:	68e0      	ldr	r0, [r4, #12]
c0de1f44:	f646 71d1 	movw	r1, #28625	@ 0x6fd1
c0de1f48:	f2c0 0100 	movt	r1, #0
c0de1f4c:	4479      	add	r1, pc
c0de1f4e:	2800      	cmp	r0, #0
c0de1f50:	bf18      	it	ne
c0de1f52:	4601      	movne	r1, r0
c0de1f54:	60e1      	str	r1, [r4, #12]
c0de1f56:	2000      	movs	r0, #0
c0de1f58:	b001      	add	sp, #4
c0de1f5a:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de1f5e <pb_readbyte>:
c0de1f5e:	b510      	push	{r4, lr}
c0de1f60:	4604      	mov	r4, r0
c0de1f62:	6880      	ldr	r0, [r0, #8]
c0de1f64:	b148      	cbz	r0, c0de1f7a <pb_readbyte+0x1c>
c0de1f66:	6823      	ldr	r3, [r4, #0]
c0de1f68:	4620      	mov	r0, r4
c0de1f6a:	2201      	movs	r2, #1
c0de1f6c:	4798      	blx	r3
c0de1f6e:	b158      	cbz	r0, c0de1f88 <pb_readbyte+0x2a>
c0de1f70:	68a0      	ldr	r0, [r4, #8]
c0de1f72:	3801      	subs	r0, #1
c0de1f74:	60a0      	str	r0, [r4, #8]
c0de1f76:	2001      	movs	r0, #1
c0de1f78:	bd10      	pop	{r4, pc}
c0de1f7a:	68e0      	ldr	r0, [r4, #12]
c0de1f7c:	f646 611b 	movw	r1, #28187	@ 0x6e1b
c0de1f80:	f2c0 0100 	movt	r1, #0
c0de1f84:	4479      	add	r1, pc
c0de1f86:	e005      	b.n	c0de1f94 <pb_readbyte+0x36>
c0de1f88:	68e0      	ldr	r0, [r4, #12]
c0de1f8a:	f646 513e 	movw	r1, #27966	@ 0x6d3e
c0de1f8e:	f2c0 0100 	movt	r1, #0
c0de1f92:	4479      	add	r1, pc
c0de1f94:	2800      	cmp	r0, #0
c0de1f96:	bf18      	it	ne
c0de1f98:	4601      	movne	r1, r0
c0de1f9a:	2000      	movs	r0, #0
c0de1f9c:	60e1      	str	r1, [r4, #12]
c0de1f9e:	bd10      	pop	{r4, pc}

c0de1fa0 <pb_decode_tag>:
c0de1fa0:	b5b0      	push	{r4, r5, r7, lr}
c0de1fa2:	b082      	sub	sp, #8
c0de1fa4:	460c      	mov	r4, r1
c0de1fa6:	2100      	movs	r1, #0
c0de1fa8:	4615      	mov	r5, r2
c0de1faa:	7019      	strb	r1, [r3, #0]
c0de1fac:	7021      	strb	r1, [r4, #0]
c0de1fae:	6011      	str	r1, [r2, #0]
c0de1fb0:	a901      	add	r1, sp, #4
c0de1fb2:	461a      	mov	r2, r3
c0de1fb4:	f7ff ff40 	bl	c0de1e38 <pb_decode_varint32_eof>
c0de1fb8:	b128      	cbz	r0, c0de1fc6 <pb_decode_tag+0x26>
c0de1fba:	9901      	ldr	r1, [sp, #4]
c0de1fbc:	08ca      	lsrs	r2, r1, #3
c0de1fbe:	f001 0107 	and.w	r1, r1, #7
c0de1fc2:	602a      	str	r2, [r5, #0]
c0de1fc4:	7021      	strb	r1, [r4, #0]
c0de1fc6:	b002      	add	sp, #8
c0de1fc8:	bdb0      	pop	{r4, r5, r7, pc}
	...

c0de1fcc <pb_skip_field>:
c0de1fcc:	b570      	push	{r4, r5, r6, lr}
c0de1fce:	b082      	sub	sp, #8
c0de1fd0:	2901      	cmp	r1, #1
c0de1fd2:	4604      	mov	r4, r0
c0de1fd4:	dc06      	bgt.n	c0de1fe4 <pb_skip_field+0x18>
c0de1fd6:	b1e9      	cbz	r1, c0de2014 <pb_skip_field+0x48>
c0de1fd8:	2901      	cmp	r1, #1
c0de1fda:	d10f      	bne.n	c0de1ffc <pb_skip_field+0x30>
c0de1fdc:	4620      	mov	r0, r4
c0de1fde:	2100      	movs	r1, #0
c0de1fe0:	2208      	movs	r2, #8
c0de1fe2:	e006      	b.n	c0de1ff2 <pb_skip_field+0x26>
c0de1fe4:	2902      	cmp	r1, #2
c0de1fe6:	d023      	beq.n	c0de2030 <pb_skip_field+0x64>
c0de1fe8:	2905      	cmp	r1, #5
c0de1fea:	d107      	bne.n	c0de1ffc <pb_skip_field+0x30>
c0de1fec:	4620      	mov	r0, r4
c0de1fee:	2100      	movs	r1, #0
c0de1ff0:	2204      	movs	r2, #4
c0de1ff2:	b002      	add	sp, #8
c0de1ff4:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de1ff8:	f7ff becc 	b.w	c0de1d94 <pb_read>
c0de1ffc:	68e0      	ldr	r0, [r4, #12]
c0de1ffe:	f646 7127 	movw	r1, #28455	@ 0x6f27
c0de2002:	f2c0 0100 	movt	r1, #0
c0de2006:	4479      	add	r1, pc
c0de2008:	2500      	movs	r5, #0
c0de200a:	2800      	cmp	r0, #0
c0de200c:	bf18      	it	ne
c0de200e:	4601      	movne	r1, r0
c0de2010:	60e1      	str	r1, [r4, #12]
c0de2012:	e01a      	b.n	c0de204a <pb_skip_field+0x7e>
c0de2014:	f10d 0603 	add.w	r6, sp, #3
c0de2018:	4620      	mov	r0, r4
c0de201a:	4631      	mov	r1, r6
c0de201c:	2201      	movs	r2, #1
c0de201e:	f7ff feb9 	bl	c0de1d94 <pb_read>
c0de2022:	4605      	mov	r5, r0
c0de2024:	b188      	cbz	r0, c0de204a <pb_skip_field+0x7e>
c0de2026:	f99d 0003 	ldrsb.w	r0, [sp, #3]
c0de202a:	2800      	cmp	r0, #0
c0de202c:	d4f4      	bmi.n	c0de2018 <pb_skip_field+0x4c>
c0de202e:	e00c      	b.n	c0de204a <pb_skip_field+0x7e>
c0de2030:	a901      	add	r1, sp, #4
c0de2032:	4620      	mov	r0, r4
c0de2034:	2200      	movs	r2, #0
c0de2036:	2500      	movs	r5, #0
c0de2038:	f7ff fefe 	bl	c0de1e38 <pb_decode_varint32_eof>
c0de203c:	b128      	cbz	r0, c0de204a <pb_skip_field+0x7e>
c0de203e:	9a01      	ldr	r2, [sp, #4]
c0de2040:	4620      	mov	r0, r4
c0de2042:	2100      	movs	r1, #0
c0de2044:	f7ff fea6 	bl	c0de1d94 <pb_read>
c0de2048:	4605      	mov	r5, r0
c0de204a:	4628      	mov	r0, r5
c0de204c:	b002      	add	sp, #8
c0de204e:	bd70      	pop	{r4, r5, r6, pc}

c0de2050 <pb_make_string_substream>:
c0de2050:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2052:	b081      	sub	sp, #4
c0de2054:	460f      	mov	r7, r1
c0de2056:	4669      	mov	r1, sp
c0de2058:	2200      	movs	r2, #0
c0de205a:	4604      	mov	r4, r0
c0de205c:	2600      	movs	r6, #0
c0de205e:	f7ff feeb 	bl	c0de1e38 <pb_decode_varint32_eof>
c0de2062:	b1c8      	cbz	r0, c0de2098 <pb_make_string_substream+0x48>
c0de2064:	4620      	mov	r0, r4
c0de2066:	e890 006c 	ldmia.w	r0, {r2, r3, r5, r6}
c0de206a:	4639      	mov	r1, r7
c0de206c:	c16c      	stmia	r1!, {r2, r3, r5, r6}
c0de206e:	68b9      	ldr	r1, [r7, #8]
c0de2070:	9800      	ldr	r0, [sp, #0]
c0de2072:	4281      	cmp	r1, r0
c0de2074:	d20b      	bcs.n	c0de208e <pb_make_string_substream+0x3e>
c0de2076:	68e0      	ldr	r0, [r4, #12]
c0de2078:	f646 51e6 	movw	r1, #28134	@ 0x6de6
c0de207c:	f2c0 0100 	movt	r1, #0
c0de2080:	4479      	add	r1, pc
c0de2082:	2800      	cmp	r0, #0
c0de2084:	bf18      	it	ne
c0de2086:	4601      	movne	r1, r0
c0de2088:	60e1      	str	r1, [r4, #12]
c0de208a:	2600      	movs	r6, #0
c0de208c:	e004      	b.n	c0de2098 <pb_make_string_substream+0x48>
c0de208e:	60b8      	str	r0, [r7, #8]
c0de2090:	68a1      	ldr	r1, [r4, #8]
c0de2092:	2601      	movs	r6, #1
c0de2094:	1a08      	subs	r0, r1, r0
c0de2096:	60a0      	str	r0, [r4, #8]
c0de2098:	4630      	mov	r0, r6
c0de209a:	b001      	add	sp, #4
c0de209c:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de209e <pb_close_string_substream>:
c0de209e:	b570      	push	{r4, r5, r6, lr}
c0de20a0:	688a      	ldr	r2, [r1, #8]
c0de20a2:	460c      	mov	r4, r1
c0de20a4:	4605      	mov	r5, r0
c0de20a6:	b12a      	cbz	r2, c0de20b4 <pb_close_string_substream+0x16>
c0de20a8:	4620      	mov	r0, r4
c0de20aa:	2100      	movs	r1, #0
c0de20ac:	2600      	movs	r6, #0
c0de20ae:	f7ff fe71 	bl	c0de1d94 <pb_read>
c0de20b2:	b120      	cbz	r0, c0de20be <pb_close_string_substream+0x20>
c0de20b4:	6860      	ldr	r0, [r4, #4]
c0de20b6:	68e1      	ldr	r1, [r4, #12]
c0de20b8:	2601      	movs	r6, #1
c0de20ba:	6068      	str	r0, [r5, #4]
c0de20bc:	60e9      	str	r1, [r5, #12]
c0de20be:	4630      	mov	r0, r6
c0de20c0:	bd70      	pop	{r4, r5, r6, pc}

c0de20c2 <pb_decode_ex>:
c0de20c2:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de20c4:	b08b      	sub	sp, #44	@ 0x2c
c0de20c6:	461d      	mov	r5, r3
c0de20c8:	4616      	mov	r6, r2
c0de20ca:	460f      	mov	r7, r1
c0de20cc:	07d9      	lsls	r1, r3, #31
c0de20ce:	4604      	mov	r4, r0
c0de20d0:	d109      	bne.n	c0de20e6 <pb_decode_ex+0x24>
c0de20d2:	a801      	add	r0, sp, #4
c0de20d4:	4639      	mov	r1, r7
c0de20d6:	4632      	mov	r2, r6
c0de20d8:	f7ff fbb6 	bl	c0de1848 <pb_field_iter_begin>
c0de20dc:	b118      	cbz	r0, c0de20e6 <pb_decode_ex+0x24>
c0de20de:	a801      	add	r0, sp, #4
c0de20e0:	f000 f832 	bl	c0de2148 <pb_message_set_to_defaults>
c0de20e4:	b308      	cbz	r0, c0de212a <pb_decode_ex+0x68>
c0de20e6:	07a8      	lsls	r0, r5, #30
c0de20e8:	d407      	bmi.n	c0de20fa <pb_decode_ex+0x38>
c0de20ea:	4620      	mov	r0, r4
c0de20ec:	4639      	mov	r1, r7
c0de20ee:	4632      	mov	r2, r6
c0de20f0:	462b      	mov	r3, r5
c0de20f2:	f000 f8d3 	bl	c0de229c <pb_decode_inner>
c0de20f6:	4605      	mov	r5, r0
c0de20f8:	e022      	b.n	c0de2140 <pb_decode_ex+0x7e>
c0de20fa:	a901      	add	r1, sp, #4
c0de20fc:	4620      	mov	r0, r4
c0de20fe:	f7ff ffa7 	bl	c0de2050 <pb_make_string_substream>
c0de2102:	b1e0      	cbz	r0, c0de213e <pb_decode_ex+0x7c>
c0de2104:	a801      	add	r0, sp, #4
c0de2106:	4639      	mov	r1, r7
c0de2108:	4632      	mov	r2, r6
c0de210a:	462b      	mov	r3, r5
c0de210c:	f000 f8c6 	bl	c0de229c <pb_decode_inner>
c0de2110:	9a03      	ldr	r2, [sp, #12]
c0de2112:	4605      	mov	r5, r0
c0de2114:	b122      	cbz	r2, c0de2120 <pb_decode_ex+0x5e>
c0de2116:	a801      	add	r0, sp, #4
c0de2118:	2100      	movs	r1, #0
c0de211a:	f7ff fe3b 	bl	c0de1d94 <pb_read>
c0de211e:	b170      	cbz	r0, c0de213e <pb_decode_ex+0x7c>
c0de2120:	9802      	ldr	r0, [sp, #8]
c0de2122:	9904      	ldr	r1, [sp, #16]
c0de2124:	6060      	str	r0, [r4, #4]
c0de2126:	60e1      	str	r1, [r4, #12]
c0de2128:	e00a      	b.n	c0de2140 <pb_decode_ex+0x7e>
c0de212a:	68e0      	ldr	r0, [r4, #12]
c0de212c:	f646 3158 	movw	r1, #27480	@ 0x6b58
c0de2130:	f2c0 0100 	movt	r1, #0
c0de2134:	4479      	add	r1, pc
c0de2136:	2800      	cmp	r0, #0
c0de2138:	bf18      	it	ne
c0de213a:	4601      	movne	r1, r0
c0de213c:	60e1      	str	r1, [r4, #12]
c0de213e:	2500      	movs	r5, #0
c0de2140:	4628      	mov	r0, r5
c0de2142:	b00b      	add	sp, #44	@ 0x2c
c0de2144:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de2148 <pb_message_set_to_defaults>:
c0de2148:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de214c:	b090      	sub	sp, #64	@ 0x40
c0de214e:	4604      	mov	r4, r0
c0de2150:	2600      	movs	r6, #0
c0de2152:	6800      	ldr	r0, [r0, #0]
c0de2154:	9605      	str	r6, [sp, #20]
c0de2156:	9604      	str	r6, [sp, #16]
c0de2158:	f810 1f0a 	ldrb.w	r1, [r0, #10]!
c0de215c:	9603      	str	r6, [sp, #12]
c0de215e:	7842      	ldrb	r2, [r0, #1]
c0de2160:	7883      	ldrb	r3, [r0, #2]
c0de2162:	78c0      	ldrb	r0, [r0, #3]
c0de2164:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de2168:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de216c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de2170:	9602      	str	r6, [sp, #8]
c0de2172:	b1d0      	cbz	r0, c0de21aa <pb_message_set_to_defaults+0x62>
c0de2174:	f64f 4199 	movw	r1, #64665	@ 0xfc99
c0de2178:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de217c:	4479      	add	r1, pc
c0de217e:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0de2182:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2186:	e9cd 0604 	strd	r0, r6, [sp, #16]
c0de218a:	a802      	add	r0, sp, #8
c0de218c:	a906      	add	r1, sp, #24
c0de218e:	f10d 0207 	add.w	r2, sp, #7
c0de2192:	f88d 6007 	strb.w	r6, [sp, #7]
c0de2196:	f7ff fe4f 	bl	c0de1e38 <pb_decode_varint32_eof>
c0de219a:	2800      	cmp	r0, #0
c0de219c:	d078      	beq.n	c0de2290 <pb_message_set_to_defaults+0x148>
c0de219e:	9806      	ldr	r0, [sp, #24]
c0de21a0:	ea4f 08d0 	mov.w	r8, r0, lsr #3
c0de21a4:	f000 0b07 	and.w	fp, r0, #7
c0de21a8:	e003      	b.n	c0de21b2 <pb_message_set_to_defaults+0x6a>
c0de21aa:	f04f 0b00 	mov.w	fp, #0
c0de21ae:	f04f 0800 	mov.w	r8, #0
c0de21b2:	ad06      	add	r5, sp, #24
c0de21b4:	f10d 0a08 	add.w	sl, sp, #8
c0de21b8:	7da0      	ldrb	r0, [r4, #22]
c0de21ba:	f000 010f 	and.w	r1, r0, #15
c0de21be:	290a      	cmp	r1, #10
c0de21c0:	d110      	bne.n	c0de21e4 <pb_message_set_to_defaults+0x9c>
c0de21c2:	69e0      	ldr	r0, [r4, #28]
c0de21c4:	6807      	ldr	r7, [r0, #0]
c0de21c6:	bf00      	nop
c0de21c8:	b3af      	cbz	r7, c0de2236 <pb_message_set_to_defaults+0xee>
c0de21ca:	4628      	mov	r0, r5
c0de21cc:	4639      	mov	r1, r7
c0de21ce:	f7ff fc16 	bl	c0de19fe <pb_field_iter_begin_extension>
c0de21d2:	b128      	cbz	r0, c0de21e0 <pb_message_set_to_defaults+0x98>
c0de21d4:	4628      	mov	r0, r5
c0de21d6:	733e      	strb	r6, [r7, #12]
c0de21d8:	f7ff ffb6 	bl	c0de2148 <pb_message_set_to_defaults>
c0de21dc:	2800      	cmp	r0, #0
c0de21de:	d057      	beq.n	c0de2290 <pb_message_set_to_defaults+0x148>
c0de21e0:	68bf      	ldr	r7, [r7, #8]
c0de21e2:	e7f1      	b.n	c0de21c8 <pb_message_set_to_defaults+0x80>
c0de21e4:	f000 01c0 	and.w	r1, r0, #192	@ 0xc0
c0de21e8:	2980      	cmp	r1, #128	@ 0x80
c0de21ea:	d01a      	beq.n	c0de2222 <pb_message_set_to_defaults+0xda>
c0de21ec:	bb19      	cbnz	r1, c0de2236 <pb_message_set_to_defaults+0xee>
c0de21ee:	f000 0130 	and.w	r1, r0, #48	@ 0x30
c0de21f2:	2930      	cmp	r1, #48	@ 0x30
c0de21f4:	bf18      	it	ne
c0de21f6:	2920      	cmpne	r1, #32
c0de21f8:	d01b      	beq.n	c0de2232 <pb_message_set_to_defaults+0xea>
c0de21fa:	2910      	cmp	r1, #16
c0de21fc:	d102      	bne.n	c0de2204 <pb_message_set_to_defaults+0xbc>
c0de21fe:	6a21      	ldr	r1, [r4, #32]
c0de2200:	b101      	cbz	r1, c0de2204 <pb_message_set_to_defaults+0xbc>
c0de2202:	700e      	strb	r6, [r1, #0]
c0de2204:	f000 000e 	and.w	r0, r0, #14
c0de2208:	2808      	cmp	r0, #8
c0de220a:	d13c      	bne.n	c0de2286 <pb_message_set_to_defaults+0x13e>
c0de220c:	69e2      	ldr	r2, [r4, #28]
c0de220e:	6a61      	ldr	r1, [r4, #36]	@ 0x24
c0de2210:	4628      	mov	r0, r5
c0de2212:	f7ff fb19 	bl	c0de1848 <pb_field_iter_begin>
c0de2216:	b170      	cbz	r0, c0de2236 <pb_message_set_to_defaults+0xee>
c0de2218:	4628      	mov	r0, r5
c0de221a:	f7ff ff95 	bl	c0de2148 <pb_message_set_to_defaults>
c0de221e:	b950      	cbnz	r0, c0de2236 <pb_message_set_to_defaults+0xee>
c0de2220:	e036      	b.n	c0de2290 <pb_message_set_to_defaults+0x148>
c0de2222:	f040 0010 	orr.w	r0, r0, #16
c0de2226:	69a1      	ldr	r1, [r4, #24]
c0de2228:	f000 0030 	and.w	r0, r0, #48	@ 0x30
c0de222c:	2830      	cmp	r0, #48	@ 0x30
c0de222e:	600e      	str	r6, [r1, #0]
c0de2230:	d101      	bne.n	c0de2236 <pb_message_set_to_defaults+0xee>
c0de2232:	6a20      	ldr	r0, [r4, #32]
c0de2234:	8006      	strh	r6, [r0, #0]
c0de2236:	f1b8 0f00 	cmp.w	r8, #0
c0de223a:	d01b      	beq.n	c0de2274 <pb_message_set_to_defaults+0x12c>
c0de223c:	8a20      	ldrh	r0, [r4, #16]
c0de223e:	4580      	cmp	r8, r0
c0de2240:	d11a      	bne.n	c0de2278 <pb_message_set_to_defaults+0x130>
c0de2242:	fa5f f18b 	uxtb.w	r1, fp
c0de2246:	4650      	mov	r0, sl
c0de2248:	4622      	mov	r2, r4
c0de224a:	f000 f98f 	bl	c0de256c <decode_field>
c0de224e:	b1f8      	cbz	r0, c0de2290 <pb_message_set_to_defaults+0x148>
c0de2250:	4650      	mov	r0, sl
c0de2252:	4629      	mov	r1, r5
c0de2254:	f10d 0207 	add.w	r2, sp, #7
c0de2258:	f88d 6007 	strb.w	r6, [sp, #7]
c0de225c:	f7ff fdec 	bl	c0de1e38 <pb_decode_varint32_eof>
c0de2260:	b1b0      	cbz	r0, c0de2290 <pb_message_set_to_defaults+0x148>
c0de2262:	9906      	ldr	r1, [sp, #24]
c0de2264:	6a20      	ldr	r0, [r4, #32]
c0de2266:	ea4f 08d1 	mov.w	r8, r1, lsr #3
c0de226a:	f001 0b07 	and.w	fp, r1, #7
c0de226e:	b118      	cbz	r0, c0de2278 <pb_message_set_to_defaults+0x130>
c0de2270:	7006      	strb	r6, [r0, #0]
c0de2272:	e001      	b.n	c0de2278 <pb_message_set_to_defaults+0x130>
c0de2274:	f04f 0800 	mov.w	r8, #0
c0de2278:	4620      	mov	r0, r4
c0de227a:	f7ff fbed 	bl	c0de1a58 <pb_field_iter_next>
c0de227e:	2800      	cmp	r0, #0
c0de2280:	f47f af9a 	bne.w	c0de21b8 <pb_message_set_to_defaults+0x70>
c0de2284:	e008      	b.n	c0de2298 <pb_message_set_to_defaults+0x150>
c0de2286:	69e0      	ldr	r0, [r4, #28]
c0de2288:	8a61      	ldrh	r1, [r4, #18]
c0de228a:	f006 f90f 	bl	c0de84ac <__aeabi_memclr>
c0de228e:	e7d2      	b.n	c0de2236 <pb_message_set_to_defaults+0xee>
c0de2290:	2000      	movs	r0, #0
c0de2292:	b010      	add	sp, #64	@ 0x40
c0de2294:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de2298:	2001      	movs	r0, #1
c0de229a:	e7fa      	b.n	c0de2292 <pb_message_set_to_defaults+0x14a>

c0de229c <pb_decode_inner>:
c0de229c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de22a0:	b09e      	sub	sp, #120	@ 0x78
c0de22a2:	4683      	mov	fp, r0
c0de22a4:	2000      	movs	r0, #0
c0de22a6:	ac06      	add	r4, sp, #24
c0de22a8:	f8ad 004e 	strh.w	r0, [sp, #78]	@ 0x4e
c0de22ac:	e9cd 0010 	strd	r0, r0, [sp, #64]	@ 0x40
c0de22b0:	4620      	mov	r0, r4
c0de22b2:	461d      	mov	r5, r3
c0de22b4:	f7ff fac8 	bl	c0de1848 <pb_field_iter_begin>
c0de22b8:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de22bc:	2800      	cmp	r0, #0
c0de22be:	f000 80e5 	beq.w	c0de248c <pb_decode_inner+0x1f0>
c0de22c2:	f104 0014 	add.w	r0, r4, #20
c0de22c6:	9003      	str	r0, [sp, #12]
c0de22c8:	f64f 70ff 	movw	r0, #65535	@ 0xffff
c0de22cc:	2600      	movs	r6, #0
c0de22ce:	9004      	str	r0, [sp, #16]
c0de22d0:	2000      	movs	r0, #0
c0de22d2:	9501      	str	r5, [sp, #4]
c0de22d4:	9002      	str	r0, [sp, #8]
c0de22d6:	bf00      	nop
c0de22d8:	2000      	movs	r0, #0
c0de22da:	f88d 0017 	strb.w	r0, [sp, #23]
c0de22de:	4658      	mov	r0, fp
c0de22e0:	a914      	add	r1, sp, #80	@ 0x50
c0de22e2:	f10d 0217 	add.w	r2, sp, #23
c0de22e6:	f7ff fda7 	bl	c0de1e38 <pb_decode_varint32_eof>
c0de22ea:	2800      	cmp	r0, #0
c0de22ec:	f000 80ac 	beq.w	c0de2448 <pb_decode_inner+0x1ac>
c0de22f0:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de22f2:	08c7      	lsrs	r7, r0, #3
c0de22f4:	f000 80ac 	beq.w	c0de2450 <pb_decode_inner+0x1b4>
c0de22f8:	f000 0a07 	and.w	sl, r0, #7
c0de22fc:	4620      	mov	r0, r4
c0de22fe:	4639      	mov	r1, r7
c0de2300:	f7ff fbf0 	bl	c0de1ae4 <pb_field_iter_find>
c0de2304:	b128      	cbz	r0, c0de2312 <pb_decode_inner+0x76>
c0de2306:	f89d 002e 	ldrb.w	r0, [sp, #46]	@ 0x2e
c0de230a:	f000 010f 	and.w	r1, r0, #15
c0de230e:	290a      	cmp	r1, #10
c0de2310:	d156      	bne.n	c0de23c0 <pb_decode_inner+0x124>
c0de2312:	42b7      	cmp	r7, r6
c0de2314:	d34e      	bcc.n	c0de23b4 <pb_decode_inner+0x118>
c0de2316:	f8bd 6020 	ldrh.w	r6, [sp, #32]
c0de231a:	bf00      	nop
c0de231c:	f89d 002e 	ldrb.w	r0, [sp, #46]	@ 0x2e
c0de2320:	f000 050f 	and.w	r5, r0, #15
c0de2324:	2d0a      	cmp	r5, #10
c0de2326:	d006      	beq.n	c0de2336 <pb_decode_inner+0x9a>
c0de2328:	4620      	mov	r0, r4
c0de232a:	f7ff fb95 	bl	c0de1a58 <pb_field_iter_next>
c0de232e:	f8bd 0020 	ldrh.w	r0, [sp, #32]
c0de2332:	42b0      	cmp	r0, r6
c0de2334:	d1f2      	bne.n	c0de231c <pb_decode_inner+0x80>
c0de2336:	f8bd 6028 	ldrh.w	r6, [sp, #40]	@ 0x28
c0de233a:	2d0a      	cmp	r5, #10
c0de233c:	bf18      	it	ne
c0de233e:	f04f 36ff 	movne.w	r6, #4294967295	@ 0xffffffff
c0de2342:	42b7      	cmp	r7, r6
c0de2344:	d336      	bcc.n	c0de23b4 <pb_decode_inner+0x118>
c0de2346:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de2348:	f8d0 8000 	ldr.w	r8, [r0]
c0de234c:	f1b8 0f00 	cmp.w	r8, #0
c0de2350:	d030      	beq.n	c0de23b4 <pb_decode_inner+0x118>
c0de2352:	4654      	mov	r4, sl
c0de2354:	f8db a008 	ldr.w	sl, [fp, #8]
c0de2358:	4650      	mov	r0, sl
c0de235a:	bf00      	nop
c0de235c:	4582      	cmp	sl, r0
c0de235e:	d126      	bne.n	c0de23ae <pb_decode_inner+0x112>
c0de2360:	f8d8 0000 	ldr.w	r0, [r8]
c0de2364:	6805      	ldr	r5, [r0, #0]
c0de2366:	b12d      	cbz	r5, c0de2374 <pb_decode_inner+0xd8>
c0de2368:	4658      	mov	r0, fp
c0de236a:	4641      	mov	r1, r8
c0de236c:	463a      	mov	r2, r7
c0de236e:	4623      	mov	r3, r4
c0de2370:	47a8      	blx	r5
c0de2372:	e012      	b.n	c0de239a <pb_decode_inner+0xfe>
c0de2374:	a814      	add	r0, sp, #80	@ 0x50
c0de2376:	4641      	mov	r1, r8
c0de2378:	f7ff fb41 	bl	c0de19fe <pb_field_iter_begin_extension>
c0de237c:	2800      	cmp	r0, #0
c0de237e:	f000 80c8 	beq.w	c0de2512 <pb_decode_inner+0x276>
c0de2382:	f8bd 0060 	ldrh.w	r0, [sp, #96]	@ 0x60
c0de2386:	4287      	cmp	r7, r0
c0de2388:	d10a      	bne.n	c0de23a0 <pb_decode_inner+0x104>
c0de238a:	2001      	movs	r0, #1
c0de238c:	f888 000c 	strb.w	r0, [r8, #12]
c0de2390:	4658      	mov	r0, fp
c0de2392:	4621      	mov	r1, r4
c0de2394:	aa14      	add	r2, sp, #80	@ 0x50
c0de2396:	f000 f8e9 	bl	c0de256c <decode_field>
c0de239a:	2800      	cmp	r0, #0
c0de239c:	f000 80c5 	beq.w	c0de252a <pb_decode_inner+0x28e>
c0de23a0:	f8d8 8008 	ldr.w	r8, [r8, #8]
c0de23a4:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de23a8:	f1b8 0f00 	cmp.w	r8, #0
c0de23ac:	d1d6      	bne.n	c0de235c <pb_decode_inner+0xc0>
c0de23ae:	4582      	cmp	sl, r0
c0de23b0:	46a2      	mov	sl, r4
c0de23b2:	d142      	bne.n	c0de243a <pb_decode_inner+0x19e>
c0de23b4:	4658      	mov	r0, fp
c0de23b6:	4651      	mov	r1, sl
c0de23b8:	f7ff fe08 	bl	c0de1fcc <pb_skip_field>
c0de23bc:	e03b      	b.n	c0de2436 <pb_decode_inner+0x19a>
c0de23be:	bf00      	nop
c0de23c0:	f000 0130 	and.w	r1, r0, #48	@ 0x30
c0de23c4:	2920      	cmp	r1, #32
c0de23c6:	d11c      	bne.n	c0de2402 <pb_decode_inner+0x166>
c0de23c8:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de23ca:	9a03      	ldr	r2, [sp, #12]
c0de23cc:	9b04      	ldr	r3, [sp, #16]
c0de23ce:	4291      	cmp	r1, r2
c0de23d0:	d118      	bne.n	c0de2404 <pb_decode_inner+0x168>
c0de23d2:	f8bd 1020 	ldrh.w	r1, [sp, #32]
c0de23d6:	428b      	cmp	r3, r1
c0de23d8:	d00f      	beq.n	c0de23fa <pb_decode_inner+0x15e>
c0de23da:	f64f 72ff 	movw	r2, #65535	@ 0xffff
c0de23de:	4293      	cmp	r3, r2
c0de23e0:	d004      	beq.n	c0de23ec <pb_decode_inner+0x150>
c0de23e2:	f8bd 204e 	ldrh.w	r2, [sp, #78]	@ 0x4e
c0de23e6:	9b02      	ldr	r3, [sp, #8]
c0de23e8:	429a      	cmp	r2, r3
c0de23ea:	d146      	bne.n	c0de247a <pb_decode_inner+0x1de>
c0de23ec:	2200      	movs	r2, #0
c0de23ee:	f8ad 204e 	strh.w	r2, [sp, #78]	@ 0x4e
c0de23f2:	f8bd 202c 	ldrh.w	r2, [sp, #44]	@ 0x2c
c0de23f6:	460b      	mov	r3, r1
c0de23f8:	9202      	str	r2, [sp, #8]
c0de23fa:	f10d 014e 	add.w	r1, sp, #78	@ 0x4e
c0de23fe:	910e      	str	r1, [sp, #56]	@ 0x38
c0de2400:	e000      	b.n	c0de2404 <pb_decode_inner+0x168>
c0de2402:	9b04      	ldr	r3, [sp, #16]
c0de2404:	f010 0f30 	tst.w	r0, #48	@ 0x30
c0de2408:	9304      	str	r3, [sp, #16]
c0de240a:	d10f      	bne.n	c0de242c <pb_decode_inner+0x190>
c0de240c:	f8bd 0024 	ldrh.w	r0, [sp, #36]	@ 0x24
c0de2410:	283f      	cmp	r0, #63	@ 0x3f
c0de2412:	d80b      	bhi.n	c0de242c <pb_decode_inner+0x190>
c0de2414:	f000 011f 	and.w	r1, r0, #31
c0de2418:	0940      	lsrs	r0, r0, #5
c0de241a:	af10      	add	r7, sp, #64	@ 0x40
c0de241c:	f857 2020 	ldr.w	r2, [r7, r0, lsl #2]
c0de2420:	2301      	movs	r3, #1
c0de2422:	fa03 f101 	lsl.w	r1, r3, r1
c0de2426:	4311      	orrs	r1, r2
c0de2428:	f847 1020 	str.w	r1, [r7, r0, lsl #2]
c0de242c:	4658      	mov	r0, fp
c0de242e:	4651      	mov	r1, sl
c0de2430:	4622      	mov	r2, r4
c0de2432:	f000 f89b 	bl	c0de256c <decode_field>
c0de2436:	2800      	cmp	r0, #0
c0de2438:	d077      	beq.n	c0de252a <pb_decode_inner+0x28e>
c0de243a:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de243e:	ac06      	add	r4, sp, #24
c0de2440:	2800      	cmp	r0, #0
c0de2442:	f47f af49 	bne.w	c0de22d8 <pb_decode_inner+0x3c>
c0de2446:	e00e      	b.n	c0de2466 <pb_decode_inner+0x1ca>
c0de2448:	f89d 0017 	ldrb.w	r0, [sp, #23]
c0de244c:	b958      	cbnz	r0, c0de2466 <pb_decode_inner+0x1ca>
c0de244e:	e06c      	b.n	c0de252a <pb_decode_inner+0x28e>
c0de2450:	9801      	ldr	r0, [sp, #4]
c0de2452:	0740      	lsls	r0, r0, #29
c0de2454:	d407      	bmi.n	c0de2466 <pb_decode_inner+0x1ca>
c0de2456:	f8db 000c 	ldr.w	r0, [fp, #12]
c0de245a:	f646 1111 	movw	r1, #26897	@ 0x6911
c0de245e:	f2c0 0100 	movt	r1, #0
c0de2462:	4479      	add	r1, pc
c0de2464:	e05c      	b.n	c0de2520 <pb_decode_inner+0x284>
c0de2466:	9904      	ldr	r1, [sp, #16]
c0de2468:	f64f 70ff 	movw	r0, #65535	@ 0xffff
c0de246c:	4281      	cmp	r1, r0
c0de246e:	d00d      	beq.n	c0de248c <pb_decode_inner+0x1f0>
c0de2470:	f8bd 004e 	ldrh.w	r0, [sp, #78]	@ 0x4e
c0de2474:	9902      	ldr	r1, [sp, #8]
c0de2476:	4288      	cmp	r0, r1
c0de2478:	d008      	beq.n	c0de248c <pb_decode_inner+0x1f0>
c0de247a:	f8db 000c 	ldr.w	r0, [fp, #12]
c0de247e:	f246 7189 	movw	r1, #26505	@ 0x6789
c0de2482:	f2c0 0100 	movt	r1, #0
c0de2486:	4479      	add	r1, pc
c0de2488:	e04a      	b.n	c0de2520 <pb_decode_inner+0x284>
c0de248a:	bf00      	nop
c0de248c:	f8bd 5024 	ldrh.w	r5, [sp, #36]	@ 0x24
c0de2490:	f89d 602e 	ldrb.w	r6, [sp, #46]	@ 0x2e
c0de2494:	a806      	add	r0, sp, #24
c0de2496:	f7ff fadf 	bl	c0de1a58 <pb_field_iter_next>
c0de249a:	2800      	cmp	r0, #0
c0de249c:	d1f6      	bne.n	c0de248c <pb_decode_inner+0x1f0>
c0de249e:	f006 0030 	and.w	r0, r6, #48	@ 0x30
c0de24a2:	fab0 f080 	clz	r0, r0
c0de24a6:	f8bd 1028 	ldrh.w	r1, [sp, #40]	@ 0x28
c0de24aa:	0940      	lsrs	r0, r0, #5
c0de24ac:	2900      	cmp	r1, #0
c0de24ae:	bf18      	it	ne
c0de24b0:	2101      	movne	r1, #1
c0de24b2:	4008      	ands	r0, r1
c0de24b4:	4428      	add	r0, r5
c0de24b6:	b281      	uxth	r1, r0
c0de24b8:	2940      	cmp	r1, #64	@ 0x40
c0de24ba:	bf28      	it	cs
c0de24bc:	2040      	movcs	r0, #64	@ 0x40
c0de24be:	b280      	uxth	r0, r0
c0de24c0:	b1e8      	cbz	r0, c0de24fe <pb_decode_inner+0x262>
c0de24c2:	2820      	cmp	r0, #32
c0de24c4:	ea4f 1150 	mov.w	r1, r0, lsr #5
c0de24c8:	d30b      	bcc.n	c0de24e2 <pb_decode_inner+0x246>
c0de24ca:	460a      	mov	r2, r1
c0de24cc:	2901      	cmp	r1, #1
c0de24ce:	bf98      	it	ls
c0de24d0:	2201      	movls	r2, #1
c0de24d2:	ab10      	add	r3, sp, #64	@ 0x40
c0de24d4:	681f      	ldr	r7, [r3, #0]
c0de24d6:	3701      	adds	r7, #1
c0de24d8:	d113      	bne.n	c0de2502 <pb_decode_inner+0x266>
c0de24da:	3a01      	subs	r2, #1
c0de24dc:	f103 0304 	add.w	r3, r3, #4
c0de24e0:	d1f8      	bne.n	c0de24d4 <pb_decode_inner+0x238>
c0de24e2:	f010 001f 	ands.w	r0, r0, #31
c0de24e6:	d00a      	beq.n	c0de24fe <pb_decode_inner+0x262>
c0de24e8:	aa10      	add	r2, sp, #64	@ 0x40
c0de24ea:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de24ee:	f1c0 0020 	rsb	r0, r0, #32
c0de24f2:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de24f6:	fa22 f000 	lsr.w	r0, r2, r0
c0de24fa:	4281      	cmp	r1, r0
c0de24fc:	d101      	bne.n	c0de2502 <pb_decode_inner+0x266>
c0de24fe:	2001      	movs	r0, #1
c0de2500:	e014      	b.n	c0de252c <pb_decode_inner+0x290>
c0de2502:	f8db 000c 	ldr.w	r0, [fp, #12]
c0de2506:	f646 2131 	movw	r1, #27185	@ 0x6a31
c0de250a:	f2c0 0100 	movt	r1, #0
c0de250e:	4479      	add	r1, pc
c0de2510:	e006      	b.n	c0de2520 <pb_decode_inner+0x284>
c0de2512:	f8db 000c 	ldr.w	r0, [fp, #12]
c0de2516:	f646 01cd 	movw	r1, #26829	@ 0x68cd
c0de251a:	f2c0 0100 	movt	r1, #0
c0de251e:	4479      	add	r1, pc
c0de2520:	2800      	cmp	r0, #0
c0de2522:	bf18      	it	ne
c0de2524:	4601      	movne	r1, r0
c0de2526:	f8cb 100c 	str.w	r1, [fp, #12]
c0de252a:	2000      	movs	r0, #0
c0de252c:	b01e      	add	sp, #120	@ 0x78
c0de252e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de2532 <pb_decode>:
c0de2532:	2300      	movs	r3, #0
c0de2534:	f7ff bdc5 	b.w	c0de20c2 <pb_decode_ex>

c0de2538 <pb_decode_fixed32>:
c0de2538:	b510      	push	{r4, lr}
c0de253a:	b082      	sub	sp, #8
c0de253c:	460c      	mov	r4, r1
c0de253e:	a901      	add	r1, sp, #4
c0de2540:	2204      	movs	r2, #4
c0de2542:	f7ff fc27 	bl	c0de1d94 <pb_read>
c0de2546:	b108      	cbz	r0, c0de254c <pb_decode_fixed32+0x14>
c0de2548:	9901      	ldr	r1, [sp, #4]
c0de254a:	6021      	str	r1, [r4, #0]
c0de254c:	b002      	add	sp, #8
c0de254e:	bd10      	pop	{r4, pc}

c0de2550 <pb_decode_fixed64>:
c0de2550:	b510      	push	{r4, lr}
c0de2552:	b082      	sub	sp, #8
c0de2554:	460c      	mov	r4, r1
c0de2556:	4669      	mov	r1, sp
c0de2558:	2208      	movs	r2, #8
c0de255a:	f7ff fc1b 	bl	c0de1d94 <pb_read>
c0de255e:	b118      	cbz	r0, c0de2568 <pb_decode_fixed64+0x18>
c0de2560:	e9dd 1200 	ldrd	r1, r2, [sp]
c0de2564:	e9c4 1200 	strd	r1, r2, [r4]
c0de2568:	b002      	add	sp, #8
c0de256a:	bd10      	pop	{r4, pc}

c0de256c <decode_field>:
c0de256c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2570:	b088      	sub	sp, #32
c0de2572:	4615      	mov	r5, r2
c0de2574:	7d92      	ldrb	r2, [r2, #22]
c0de2576:	4604      	mov	r4, r0
c0de2578:	f002 03c0 	and.w	r3, r2, #192	@ 0xc0
c0de257c:	2b80      	cmp	r3, #128	@ 0x80
c0de257e:	d011      	beq.n	c0de25a4 <decode_field+0x38>
c0de2580:	2b40      	cmp	r3, #64	@ 0x40
c0de2582:	d016      	beq.n	c0de25b2 <decode_field+0x46>
c0de2584:	2b00      	cmp	r3, #0
c0de2586:	d153      	bne.n	c0de2630 <decode_field+0xc4>
c0de2588:	f3c2 1001 	ubfx	r0, r2, #4, #2
c0de258c:	2801      	cmp	r0, #1
c0de258e:	dc5e      	bgt.n	c0de264e <decode_field+0xe2>
c0de2590:	2800      	cmp	r0, #0
c0de2592:	f000 80d1 	beq.w	c0de2738 <decode_field+0x1cc>
c0de2596:	6a28      	ldr	r0, [r5, #32]
c0de2598:	2800      	cmp	r0, #0
c0de259a:	f000 80cd 	beq.w	c0de2738 <decode_field+0x1cc>
c0de259e:	2101      	movs	r1, #1
c0de25a0:	7001      	strb	r1, [r0, #0]
c0de25a2:	e0c9      	b.n	c0de2738 <decode_field+0x1cc>
c0de25a4:	68e0      	ldr	r0, [r4, #12]
c0de25a6:	f246 614f 	movw	r1, #26191	@ 0x664f
c0de25aa:	f2c0 0100 	movt	r1, #0
c0de25ae:	4479      	add	r1, pc
c0de25b0:	e044      	b.n	c0de263c <decode_field+0xd0>
c0de25b2:	6828      	ldr	r0, [r5, #0]
c0de25b4:	f810 2f0e 	ldrb.w	r2, [r0, #14]!
c0de25b8:	7843      	ldrb	r3, [r0, #1]
c0de25ba:	7887      	ldrb	r7, [r0, #2]
c0de25bc:	78c0      	ldrb	r0, [r0, #3]
c0de25be:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de25c2:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de25c6:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de25ca:	2800      	cmp	r0, #0
c0de25cc:	d075      	beq.n	c0de26ba <decode_field+0x14e>
c0de25ce:	2902      	cmp	r1, #2
c0de25d0:	d179      	bne.n	c0de26c6 <decode_field+0x15a>
c0de25d2:	a904      	add	r1, sp, #16
c0de25d4:	4620      	mov	r0, r4
c0de25d6:	f7ff fd3b 	bl	c0de2050 <pb_make_string_substream>
c0de25da:	b398      	cbz	r0, c0de2644 <decode_field+0xd8>
c0de25dc:	9f06      	ldr	r7, [sp, #24]
c0de25de:	ae04      	add	r6, sp, #16
c0de25e0:	6828      	ldr	r0, [r5, #0]
c0de25e2:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de25e6:	7842      	ldrb	r2, [r0, #1]
c0de25e8:	7883      	ldrb	r3, [r0, #2]
c0de25ea:	78c0      	ldrb	r0, [r0, #3]
c0de25ec:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de25f0:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de25f4:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de25f8:	f005 fc86 	bl	c0de7f08 <pic>
c0de25fc:	4603      	mov	r3, r0
c0de25fe:	4630      	mov	r0, r6
c0de2600:	2100      	movs	r1, #0
c0de2602:	462a      	mov	r2, r5
c0de2604:	4798      	blx	r3
c0de2606:	2800      	cmp	r0, #0
c0de2608:	f000 809d 	beq.w	c0de2746 <decode_field+0x1da>
c0de260c:	9a06      	ldr	r2, [sp, #24]
c0de260e:	b112      	cbz	r2, c0de2616 <decode_field+0xaa>
c0de2610:	42ba      	cmp	r2, r7
c0de2612:	4617      	mov	r7, r2
c0de2614:	d3e4      	bcc.n	c0de25e0 <decode_field+0x74>
c0de2616:	b12a      	cbz	r2, c0de2624 <decode_field+0xb8>
c0de2618:	a804      	add	r0, sp, #16
c0de261a:	2100      	movs	r1, #0
c0de261c:	2500      	movs	r5, #0
c0de261e:	f7ff fbb9 	bl	c0de1d94 <pb_read>
c0de2622:	b180      	cbz	r0, c0de2646 <decode_field+0xda>
c0de2624:	9805      	ldr	r0, [sp, #20]
c0de2626:	9907      	ldr	r1, [sp, #28]
c0de2628:	6060      	str	r0, [r4, #4]
c0de262a:	60e1      	str	r1, [r4, #12]
c0de262c:	2501      	movs	r5, #1
c0de262e:	e00a      	b.n	c0de2646 <decode_field+0xda>
c0de2630:	68e0      	ldr	r0, [r4, #12]
c0de2632:	f246 619f 	movw	r1, #26271	@ 0x669f
c0de2636:	f2c0 0100 	movt	r1, #0
c0de263a:	4479      	add	r1, pc
c0de263c:	2800      	cmp	r0, #0
c0de263e:	bf18      	it	ne
c0de2640:	4601      	movne	r1, r0
c0de2642:	60e1      	str	r1, [r4, #12]
c0de2644:	2500      	movs	r5, #0
c0de2646:	4628      	mov	r0, r5
c0de2648:	b008      	add	sp, #32
c0de264a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de264e:	2802      	cmp	r0, #2
c0de2650:	d15a      	bne.n	c0de2708 <decode_field+0x19c>
c0de2652:	2902      	cmp	r1, #2
c0de2654:	d164      	bne.n	c0de2720 <decode_field+0x1b4>
c0de2656:	f002 000e 	and.w	r0, r2, #14
c0de265a:	2805      	cmp	r0, #5
c0de265c:	d860      	bhi.n	c0de2720 <decode_field+0x1b4>
c0de265e:	6a2f      	ldr	r7, [r5, #32]
c0de2660:	69a8      	ldr	r0, [r5, #24]
c0de2662:	8a69      	ldrh	r1, [r5, #18]
c0de2664:	883a      	ldrh	r2, [r7, #0]
c0de2666:	fb02 0001 	mla	r0, r2, r1, r0
c0de266a:	a904      	add	r1, sp, #16
c0de266c:	61e8      	str	r0, [r5, #28]
c0de266e:	4620      	mov	r0, r4
c0de2670:	f7ff fcee 	bl	c0de2050 <pb_make_string_substream>
c0de2674:	2800      	cmp	r0, #0
c0de2676:	d0e5      	beq.n	c0de2644 <decode_field+0xd8>
c0de2678:	9806      	ldr	r0, [sp, #24]
c0de267a:	b1b8      	cbz	r0, c0de26ac <decode_field+0x140>
c0de267c:	8838      	ldrh	r0, [r7, #0]
c0de267e:	ae04      	add	r6, sp, #16
c0de2680:	8aa9      	ldrh	r1, [r5, #20]
c0de2682:	b280      	uxth	r0, r0
c0de2684:	4288      	cmp	r0, r1
c0de2686:	f080 809e 	bcs.w	c0de27c6 <decode_field+0x25a>
c0de268a:	4630      	mov	r0, r6
c0de268c:	4629      	mov	r1, r5
c0de268e:	f000 f8a3 	bl	c0de27d8 <decode_basic_field>
c0de2692:	2800      	cmp	r0, #0
c0de2694:	f000 8095 	beq.w	c0de27c2 <decode_field+0x256>
c0de2698:	8838      	ldrh	r0, [r7, #0]
c0de269a:	3001      	adds	r0, #1
c0de269c:	8038      	strh	r0, [r7, #0]
c0de269e:	69e9      	ldr	r1, [r5, #28]
c0de26a0:	8a6a      	ldrh	r2, [r5, #18]
c0de26a2:	9b06      	ldr	r3, [sp, #24]
c0de26a4:	4411      	add	r1, r2
c0de26a6:	2b00      	cmp	r3, #0
c0de26a8:	61e9      	str	r1, [r5, #28]
c0de26aa:	d1e9      	bne.n	c0de2680 <decode_field+0x114>
c0de26ac:	2501      	movs	r5, #1
c0de26ae:	a904      	add	r1, sp, #16
c0de26b0:	4620      	mov	r0, r4
c0de26b2:	f7ff fcf4 	bl	c0de209e <pb_close_string_substream>
c0de26b6:	4005      	ands	r5, r0
c0de26b8:	e7c5      	b.n	c0de2646 <decode_field+0xda>
c0de26ba:	4620      	mov	r0, r4
c0de26bc:	b008      	add	sp, #32
c0de26be:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de26c2:	f7ff bc83 	b.w	c0de1fcc <pb_skip_field>
c0de26c6:	2905      	cmp	r1, #5
c0de26c8:	d044      	beq.n	c0de2754 <decode_field+0x1e8>
c0de26ca:	2901      	cmp	r1, #1
c0de26cc:	d048      	beq.n	c0de2760 <decode_field+0x1f4>
c0de26ce:	2900      	cmp	r1, #0
c0de26d0:	d151      	bne.n	c0de2776 <decode_field+0x20a>
c0de26d2:	2700      	movs	r7, #0
c0de26d4:	f10d 0806 	add.w	r8, sp, #6
c0de26d8:	eb08 0607 	add.w	r6, r8, r7
c0de26dc:	4620      	mov	r0, r4
c0de26de:	4631      	mov	r1, r6
c0de26e0:	2201      	movs	r2, #1
c0de26e2:	f7ff fb57 	bl	c0de1d94 <pb_read>
c0de26e6:	2800      	cmp	r0, #0
c0de26e8:	d0ac      	beq.n	c0de2644 <decode_field+0xd8>
c0de26ea:	f996 0000 	ldrsb.w	r0, [r6]
c0de26ee:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de26f2:	dc47      	bgt.n	c0de2784 <decode_field+0x218>
c0de26f4:	3701      	adds	r7, #1
c0de26f6:	2f0a      	cmp	r7, #10
c0de26f8:	d1ee      	bne.n	c0de26d8 <decode_field+0x16c>
c0de26fa:	68e0      	ldr	r0, [r4, #12]
c0de26fc:	f646 0119 	movw	r1, #26649	@ 0x6819
c0de2700:	f2c0 0100 	movt	r1, #0
c0de2704:	4479      	add	r1, pc
c0de2706:	e799      	b.n	c0de263c <decode_field+0xd0>
c0de2708:	8a28      	ldrh	r0, [r5, #16]
c0de270a:	6a29      	ldr	r1, [r5, #32]
c0de270c:	f002 020e 	and.w	r2, r2, #14
c0de2710:	2a08      	cmp	r2, #8
c0de2712:	8008      	strh	r0, [r1, #0]
c0de2714:	d110      	bne.n	c0de2738 <decode_field+0x1cc>
c0de2716:	69e8      	ldr	r0, [r5, #28]
c0de2718:	8a69      	ldrh	r1, [r5, #18]
c0de271a:	f005 fec7 	bl	c0de84ac <__aeabi_memclr>
c0de271e:	e00b      	b.n	c0de2738 <decode_field+0x1cc>
c0de2720:	6a29      	ldr	r1, [r5, #32]
c0de2722:	69a8      	ldr	r0, [r5, #24]
c0de2724:	8a6a      	ldrh	r2, [r5, #18]
c0de2726:	880b      	ldrh	r3, [r1, #0]
c0de2728:	fb03 0002 	mla	r0, r3, r2, r0
c0de272c:	61e8      	str	r0, [r5, #28]
c0de272e:	1c58      	adds	r0, r3, #1
c0de2730:	8008      	strh	r0, [r1, #0]
c0de2732:	8aa8      	ldrh	r0, [r5, #20]
c0de2734:	4283      	cmp	r3, r0
c0de2736:	d246      	bcs.n	c0de27c6 <decode_field+0x25a>
c0de2738:	4620      	mov	r0, r4
c0de273a:	4629      	mov	r1, r5
c0de273c:	b008      	add	sp, #32
c0de273e:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de2742:	f000 b849 	b.w	c0de27d8 <decode_basic_field>
c0de2746:	68e0      	ldr	r0, [r4, #12]
c0de2748:	f246 61ad 	movw	r1, #26285	@ 0x66ad
c0de274c:	f2c0 0100 	movt	r1, #0
c0de2750:	4479      	add	r1, pc
c0de2752:	e773      	b.n	c0de263c <decode_field+0xd0>
c0de2754:	f10d 0106 	add.w	r1, sp, #6
c0de2758:	4620      	mov	r0, r4
c0de275a:	2204      	movs	r2, #4
c0de275c:	2404      	movs	r4, #4
c0de275e:	e004      	b.n	c0de276a <decode_field+0x1fe>
c0de2760:	f10d 0106 	add.w	r1, sp, #6
c0de2764:	4620      	mov	r0, r4
c0de2766:	2208      	movs	r2, #8
c0de2768:	2408      	movs	r4, #8
c0de276a:	f7ff fb13 	bl	c0de1d94 <pb_read>
c0de276e:	2800      	cmp	r0, #0
c0de2770:	f43f af68 	beq.w	c0de2644 <decode_field+0xd8>
c0de2774:	e007      	b.n	c0de2786 <decode_field+0x21a>
c0de2776:	68e0      	ldr	r0, [r4, #12]
c0de2778:	f246 71ad 	movw	r1, #26541	@ 0x67ad
c0de277c:	f2c0 0100 	movt	r1, #0
c0de2780:	4479      	add	r1, pc
c0de2782:	e75b      	b.n	c0de263c <decode_field+0xd0>
c0de2784:	1c7c      	adds	r4, r7, #1
c0de2786:	f24f 6087 	movw	r0, #63111	@ 0xf687
c0de278a:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de278e:	4478      	add	r0, pc
c0de2790:	9004      	str	r0, [sp, #16]
c0de2792:	f10d 0006 	add.w	r0, sp, #6
c0de2796:	9005      	str	r0, [sp, #20]
c0de2798:	2000      	movs	r0, #0
c0de279a:	6829      	ldr	r1, [r5, #0]
c0de279c:	9007      	str	r0, [sp, #28]
c0de279e:	f811 0f0e 	ldrb.w	r0, [r1, #14]!
c0de27a2:	9406      	str	r4, [sp, #24]
c0de27a4:	784a      	ldrb	r2, [r1, #1]
c0de27a6:	788b      	ldrb	r3, [r1, #2]
c0de27a8:	78c9      	ldrb	r1, [r1, #3]
c0de27aa:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de27ae:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de27b2:	ea40 4301 	orr.w	r3, r0, r1, lsl #16
c0de27b6:	a804      	add	r0, sp, #16
c0de27b8:	2100      	movs	r1, #0
c0de27ba:	462a      	mov	r2, r5
c0de27bc:	4798      	blx	r3
c0de27be:	4605      	mov	r5, r0
c0de27c0:	e741      	b.n	c0de2646 <decode_field+0xda>
c0de27c2:	9806      	ldr	r0, [sp, #24]
c0de27c4:	b130      	cbz	r0, c0de27d4 <decode_field+0x268>
c0de27c6:	68e0      	ldr	r0, [r4, #12]
c0de27c8:	f246 5161 	movw	r1, #25953	@ 0x6561
c0de27cc:	f2c0 0100 	movt	r1, #0
c0de27d0:	4479      	add	r1, pc
c0de27d2:	e733      	b.n	c0de263c <decode_field+0xd0>
c0de27d4:	2500      	movs	r5, #0
c0de27d6:	e76a      	b.n	c0de26ae <decode_field+0x142>

c0de27d8 <decode_basic_field>:
c0de27d8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de27da:	b08f      	sub	sp, #60	@ 0x3c
c0de27dc:	460d      	mov	r5, r1
c0de27de:	7d89      	ldrb	r1, [r1, #22]
c0de27e0:	4604      	mov	r4, r0
c0de27e2:	f001 010f 	and.w	r1, r1, #15
c0de27e6:	2905      	cmp	r1, #5
c0de27e8:	dc14      	bgt.n	c0de2814 <decode_basic_field+0x3c>
c0de27ea:	1e48      	subs	r0, r1, #1
c0de27ec:	2803      	cmp	r0, #3
c0de27ee:	d35c      	bcc.n	c0de28aa <decode_basic_field+0xd2>
c0de27f0:	1f08      	subs	r0, r1, #4
c0de27f2:	2802      	cmp	r0, #2
c0de27f4:	f080 808b 	bcs.w	c0de290e <decode_basic_field+0x136>
c0de27f8:	8a68      	ldrh	r0, [r5, #18]
c0de27fa:	2808      	cmp	r0, #8
c0de27fc:	f000 8106 	beq.w	c0de2a0c <decode_basic_field+0x234>
c0de2800:	2804      	cmp	r0, #4
c0de2802:	f040 8120 	bne.w	c0de2a46 <decode_basic_field+0x26e>
c0de2806:	69e9      	ldr	r1, [r5, #28]
c0de2808:	4620      	mov	r0, r4
c0de280a:	b00f      	add	sp, #60	@ 0x3c
c0de280c:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de2810:	f7ff be92 	b.w	c0de2538 <pb_decode_fixed32>
c0de2814:	2907      	cmp	r1, #7
c0de2816:	dd61      	ble.n	c0de28dc <decode_basic_field+0x104>
c0de2818:	f1a1 0008 	sub.w	r0, r1, #8
c0de281c:	2802      	cmp	r0, #2
c0de281e:	f080 80a2 	bcs.w	c0de2966 <decode_basic_field+0x18e>
c0de2822:	a90b      	add	r1, sp, #44	@ 0x2c
c0de2824:	4620      	mov	r0, r4
c0de2826:	f7ff fc13 	bl	c0de2050 <pb_make_string_substream>
c0de282a:	2800      	cmp	r0, #0
c0de282c:	f000 8161 	beq.w	c0de2af2 <decode_basic_field+0x31a>
c0de2830:	6a69      	ldr	r1, [r5, #36]	@ 0x24
c0de2832:	2900      	cmp	r1, #0
c0de2834:	f000 80f1 	beq.w	c0de2a1a <decode_basic_field+0x242>
c0de2838:	7da8      	ldrb	r0, [r5, #22]
c0de283a:	f000 0220 	and.w	r2, r0, #32
c0de283e:	3210      	adds	r2, #16
c0de2840:	2a30      	cmp	r2, #48	@ 0x30
c0de2842:	d10b      	bne.n	c0de285c <decode_basic_field+0x84>
c0de2844:	69ea      	ldr	r2, [r5, #28]
c0de2846:	4668      	mov	r0, sp
c0de2848:	f7fe fffe 	bl	c0de1848 <pb_field_iter_begin>
c0de284c:	b128      	cbz	r0, c0de285a <decode_basic_field+0x82>
c0de284e:	4668      	mov	r0, sp
c0de2850:	f7ff fc7a 	bl	c0de2148 <pb_message_set_to_defaults>
c0de2854:	2800      	cmp	r0, #0
c0de2856:	f000 8136 	beq.w	c0de2ac6 <decode_basic_field+0x2ee>
c0de285a:	7da8      	ldrb	r0, [r5, #22]
c0de285c:	f000 000f 	and.w	r0, r0, #15
c0de2860:	2809      	cmp	r0, #9
c0de2862:	d10b      	bne.n	c0de287c <decode_basic_field+0xa4>
c0de2864:	6a28      	ldr	r0, [r5, #32]
c0de2866:	b148      	cbz	r0, c0de287c <decode_basic_field+0xa4>
c0de2868:	f850 3c08 	ldr.w	r3, [r0, #-8]
c0de286c:	b133      	cbz	r3, c0de287c <decode_basic_field+0xa4>
c0de286e:	1f02      	subs	r2, r0, #4
c0de2870:	a80b      	add	r0, sp, #44	@ 0x2c
c0de2872:	4629      	mov	r1, r5
c0de2874:	4798      	blx	r3
c0de2876:	2800      	cmp	r0, #0
c0de2878:	f000 814c 	beq.w	c0de2b14 <decode_basic_field+0x33c>
c0de287c:	69ea      	ldr	r2, [r5, #28]
c0de287e:	6a69      	ldr	r1, [r5, #36]	@ 0x24
c0de2880:	a80b      	add	r0, sp, #44	@ 0x2c
c0de2882:	2301      	movs	r3, #1
c0de2884:	f7ff fd0a 	bl	c0de229c <pb_decode_inner>
c0de2888:	4605      	mov	r5, r0
c0de288a:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
c0de288c:	b13a      	cbz	r2, c0de289e <decode_basic_field+0xc6>
c0de288e:	a80b      	add	r0, sp, #44	@ 0x2c
c0de2890:	2100      	movs	r1, #0
c0de2892:	2600      	movs	r6, #0
c0de2894:	f7ff fa7e 	bl	c0de1d94 <pb_read>
c0de2898:	2800      	cmp	r0, #0
c0de289a:	f000 812b 	beq.w	c0de2af4 <decode_basic_field+0x31c>
c0de289e:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de28a0:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de28a2:	6060      	str	r0, [r4, #4]
c0de28a4:	60e1      	str	r1, [r4, #12]
c0de28a6:	462e      	mov	r6, r5
c0de28a8:	e124      	b.n	c0de2af4 <decode_basic_field+0x31c>
c0de28aa:	2902      	cmp	r1, #2
c0de28ac:	d141      	bne.n	c0de2932 <decode_basic_field+0x15a>
c0de28ae:	4669      	mov	r1, sp
c0de28b0:	4620      	mov	r0, r4
c0de28b2:	f7ff fb17 	bl	c0de1ee4 <pb_decode_varint>
c0de28b6:	2800      	cmp	r0, #0
c0de28b8:	f000 811b 	beq.w	c0de2af2 <decode_basic_field+0x31a>
c0de28bc:	8a68      	ldrh	r0, [r5, #18]
c0de28be:	2803      	cmp	r0, #3
c0de28c0:	f300 80b2 	bgt.w	c0de2a28 <decode_basic_field+0x250>
c0de28c4:	2801      	cmp	r0, #1
c0de28c6:	f000 80d1 	beq.w	c0de2a6c <decode_basic_field+0x294>
c0de28ca:	2802      	cmp	r0, #2
c0de28cc:	f040 80bb 	bne.w	c0de2a46 <decode_basic_field+0x26e>
c0de28d0:	9800      	ldr	r0, [sp, #0]
c0de28d2:	69ea      	ldr	r2, [r5, #28]
c0de28d4:	9901      	ldr	r1, [sp, #4]
c0de28d6:	8010      	strh	r0, [r2, #0]
c0de28d8:	b283      	uxth	r3, r0
c0de28da:	e0cc      	b.n	c0de2a76 <decode_basic_field+0x29e>
c0de28dc:	2906      	cmp	r1, #6
c0de28de:	d05a      	beq.n	c0de2996 <decode_basic_field+0x1be>
c0de28e0:	2907      	cmp	r1, #7
c0de28e2:	d176      	bne.n	c0de29d2 <decode_basic_field+0x1fa>
c0de28e4:	69ef      	ldr	r7, [r5, #28]
c0de28e6:	4669      	mov	r1, sp
c0de28e8:	4620      	mov	r0, r4
c0de28ea:	2200      	movs	r2, #0
c0de28ec:	2600      	movs	r6, #0
c0de28ee:	f7ff faa3 	bl	c0de1e38 <pb_decode_varint32_eof>
c0de28f2:	2800      	cmp	r0, #0
c0de28f4:	f000 80fe 	beq.w	c0de2af4 <decode_basic_field+0x31c>
c0de28f8:	9a00      	ldr	r2, [sp, #0]
c0de28fa:	1c50      	adds	r0, r2, #1
c0de28fc:	f0c0 80aa 	bcc.w	c0de2a54 <decode_basic_field+0x27c>
c0de2900:	68e0      	ldr	r0, [r4, #12]
c0de2902:	f246 51e2 	movw	r1, #26082	@ 0x65e2
c0de2906:	f2c0 0100 	movt	r1, #0
c0de290a:	4479      	add	r1, pc
c0de290c:	e0ed      	b.n	c0de2aea <decode_basic_field+0x312>
c0de290e:	2900      	cmp	r1, #0
c0de2910:	d15f      	bne.n	c0de29d2 <decode_basic_field+0x1fa>
c0de2912:	69ed      	ldr	r5, [r5, #28]
c0de2914:	4669      	mov	r1, sp
c0de2916:	4620      	mov	r0, r4
c0de2918:	2200      	movs	r2, #0
c0de291a:	f7ff fa8d 	bl	c0de1e38 <pb_decode_varint32_eof>
c0de291e:	4606      	mov	r6, r0
c0de2920:	2800      	cmp	r0, #0
c0de2922:	f000 80e7 	beq.w	c0de2af4 <decode_basic_field+0x31c>
c0de2926:	9800      	ldr	r0, [sp, #0]
c0de2928:	2800      	cmp	r0, #0
c0de292a:	bf18      	it	ne
c0de292c:	2001      	movne	r0, #1
c0de292e:	7028      	strb	r0, [r5, #0]
c0de2930:	e0e0      	b.n	c0de2af4 <decode_basic_field+0x31c>
c0de2932:	2903      	cmp	r1, #3
c0de2934:	d154      	bne.n	c0de29e0 <decode_basic_field+0x208>
c0de2936:	4669      	mov	r1, sp
c0de2938:	4620      	mov	r0, r4
c0de293a:	f7ff fad3 	bl	c0de1ee4 <pb_decode_varint>
c0de293e:	2800      	cmp	r0, #0
c0de2940:	f000 80d7 	beq.w	c0de2af2 <decode_basic_field+0x31a>
c0de2944:	e9dd 1000 	ldrd	r1, r0, [sp]
c0de2948:	2200      	movs	r2, #0
c0de294a:	ea5f 0350 	movs.w	r3, r0, lsr #1
c0de294e:	ea4f 0031 	mov.w	r0, r1, rrx
c0de2952:	f001 0101 	and.w	r1, r1, #1
c0de2956:	4249      	negs	r1, r1
c0de2958:	f162 0700 	sbc.w	r7, r2, #0
c0de295c:	8a6a      	ldrh	r2, [r5, #18]
c0de295e:	4048      	eors	r0, r1
c0de2960:	ea83 0107 	eor.w	r1, r3, r7
c0de2964:	e048      	b.n	c0de29f8 <decode_basic_field+0x220>
c0de2966:	290b      	cmp	r1, #11
c0de2968:	d133      	bne.n	c0de29d2 <decode_basic_field+0x1fa>
c0de296a:	4669      	mov	r1, sp
c0de296c:	4620      	mov	r0, r4
c0de296e:	2200      	movs	r2, #0
c0de2970:	2600      	movs	r6, #0
c0de2972:	f7ff fa61 	bl	c0de1e38 <pb_decode_varint32_eof>
c0de2976:	2800      	cmp	r0, #0
c0de2978:	f000 80bc 	beq.w	c0de2af4 <decode_basic_field+0x31c>
c0de297c:	9a00      	ldr	r2, [sp, #0]
c0de297e:	f5b2 3f80 	cmp.w	r2, #65536	@ 0x10000
c0de2982:	d21f      	bcs.n	c0de29c4 <decode_basic_field+0x1ec>
c0de2984:	2a00      	cmp	r2, #0
c0de2986:	f000 80a5 	beq.w	c0de2ad4 <decode_basic_field+0x2fc>
c0de298a:	8a68      	ldrh	r0, [r5, #18]
c0de298c:	4282      	cmp	r2, r0
c0de298e:	f040 80a6 	bne.w	c0de2ade <decode_basic_field+0x306>
c0de2992:	69e9      	ldr	r1, [r5, #28]
c0de2994:	e0b4      	b.n	c0de2b00 <decode_basic_field+0x328>
c0de2996:	4669      	mov	r1, sp
c0de2998:	4620      	mov	r0, r4
c0de299a:	2200      	movs	r2, #0
c0de299c:	2600      	movs	r6, #0
c0de299e:	f7ff fa4b 	bl	c0de1e38 <pb_decode_varint32_eof>
c0de29a2:	2800      	cmp	r0, #0
c0de29a4:	f000 80a6 	beq.w	c0de2af4 <decode_basic_field+0x31c>
c0de29a8:	9a00      	ldr	r2, [sp, #0]
c0de29aa:	f5b2 3f80 	cmp.w	r2, #65536	@ 0x10000
c0de29ae:	d209      	bcs.n	c0de29c4 <decode_basic_field+0x1ec>
c0de29b0:	7da8      	ldrb	r0, [r5, #22]
c0de29b2:	f000 00c0 	and.w	r0, r0, #192	@ 0xc0
c0de29b6:	2880      	cmp	r0, #128	@ 0x80
c0de29b8:	d051      	beq.n	c0de2a5e <decode_basic_field+0x286>
c0de29ba:	8a68      	ldrh	r0, [r5, #18]
c0de29bc:	1c91      	adds	r1, r2, #2
c0de29be:	4281      	cmp	r1, r0
c0de29c0:	f240 809b 	bls.w	c0de2afa <decode_basic_field+0x322>
c0de29c4:	68e0      	ldr	r0, [r4, #12]
c0de29c6:	f246 318b 	movw	r1, #25483	@ 0x638b
c0de29ca:	f2c0 0100 	movt	r1, #0
c0de29ce:	4479      	add	r1, pc
c0de29d0:	e08b      	b.n	c0de2aea <decode_basic_field+0x312>
c0de29d2:	68e0      	ldr	r0, [r4, #12]
c0de29d4:	f246 21fd 	movw	r1, #25341	@ 0x62fd
c0de29d8:	f2c0 0100 	movt	r1, #0
c0de29dc:	4479      	add	r1, pc
c0de29de:	e084      	b.n	c0de2aea <decode_basic_field+0x312>
c0de29e0:	4669      	mov	r1, sp
c0de29e2:	4620      	mov	r0, r4
c0de29e4:	f7ff fa7e 	bl	c0de1ee4 <pb_decode_varint>
c0de29e8:	2800      	cmp	r0, #0
c0de29ea:	f000 8082 	beq.w	c0de2af2 <decode_basic_field+0x31a>
c0de29ee:	8a6a      	ldrh	r2, [r5, #18]
c0de29f0:	9800      	ldr	r0, [sp, #0]
c0de29f2:	2a08      	cmp	r2, #8
c0de29f4:	d01d      	beq.n	c0de2a32 <decode_basic_field+0x25a>
c0de29f6:	17c1      	asrs	r1, r0, #31
c0de29f8:	2a03      	cmp	r2, #3
c0de29fa:	dc1c      	bgt.n	c0de2a36 <decode_basic_field+0x25e>
c0de29fc:	2a01      	cmp	r2, #1
c0de29fe:	d04c      	beq.n	c0de2a9a <decode_basic_field+0x2c2>
c0de2a00:	2a02      	cmp	r2, #2
c0de2a02:	d120      	bne.n	c0de2a46 <decode_basic_field+0x26e>
c0de2a04:	69ea      	ldr	r2, [r5, #28]
c0de2a06:	b203      	sxth	r3, r0
c0de2a08:	8010      	strh	r0, [r2, #0]
c0de2a0a:	e049      	b.n	c0de2aa0 <decode_basic_field+0x2c8>
c0de2a0c:	69e9      	ldr	r1, [r5, #28]
c0de2a0e:	4620      	mov	r0, r4
c0de2a10:	b00f      	add	sp, #60	@ 0x3c
c0de2a12:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de2a16:	f7ff bd9b 	b.w	c0de2550 <pb_decode_fixed64>
c0de2a1a:	68e0      	ldr	r0, [r4, #12]
c0de2a1c:	f246 311c 	movw	r1, #25372	@ 0x631c
c0de2a20:	f2c0 0100 	movt	r1, #0
c0de2a24:	4479      	add	r1, pc
c0de2a26:	e060      	b.n	c0de2aea <decode_basic_field+0x312>
c0de2a28:	2804      	cmp	r0, #4
c0de2a2a:	d026      	beq.n	c0de2a7a <decode_basic_field+0x2a2>
c0de2a2c:	2808      	cmp	r0, #8
c0de2a2e:	d10a      	bne.n	c0de2a46 <decode_basic_field+0x26e>
c0de2a30:	9800      	ldr	r0, [sp, #0]
c0de2a32:	9901      	ldr	r1, [sp, #4]
c0de2a34:	e003      	b.n	c0de2a3e <decode_basic_field+0x266>
c0de2a36:	2a04      	cmp	r2, #4
c0de2a38:	d034      	beq.n	c0de2aa4 <decode_basic_field+0x2cc>
c0de2a3a:	2a08      	cmp	r2, #8
c0de2a3c:	d103      	bne.n	c0de2a46 <decode_basic_field+0x26e>
c0de2a3e:	69ea      	ldr	r2, [r5, #28]
c0de2a40:	e9c2 0100 	strd	r0, r1, [r2]
c0de2a44:	e036      	b.n	c0de2ab4 <decode_basic_field+0x2dc>
c0de2a46:	68e0      	ldr	r0, [r4, #12]
c0de2a48:	f246 11ea 	movw	r1, #25066	@ 0x61ea
c0de2a4c:	f2c0 0100 	movt	r1, #0
c0de2a50:	4479      	add	r1, pc
c0de2a52:	e04a      	b.n	c0de2aea <decode_basic_field+0x312>
c0de2a54:	7da9      	ldrb	r1, [r5, #22]
c0de2a56:	f001 01c0 	and.w	r1, r1, #192	@ 0xc0
c0de2a5a:	2980      	cmp	r1, #128	@ 0x80
c0de2a5c:	d113      	bne.n	c0de2a86 <decode_basic_field+0x2ae>
c0de2a5e:	68e0      	ldr	r0, [r4, #12]
c0de2a60:	f246 1195 	movw	r1, #24981	@ 0x6195
c0de2a64:	f2c0 0100 	movt	r1, #0
c0de2a68:	4479      	add	r1, pc
c0de2a6a:	e03e      	b.n	c0de2aea <decode_basic_field+0x312>
c0de2a6c:	9800      	ldr	r0, [sp, #0]
c0de2a6e:	69ea      	ldr	r2, [r5, #28]
c0de2a70:	9901      	ldr	r1, [sp, #4]
c0de2a72:	7010      	strb	r0, [r2, #0]
c0de2a74:	b2c3      	uxtb	r3, r0
c0de2a76:	2200      	movs	r2, #0
c0de2a78:	e018      	b.n	c0de2aac <decode_basic_field+0x2d4>
c0de2a7a:	9800      	ldr	r0, [sp, #0]
c0de2a7c:	69ea      	ldr	r2, [r5, #28]
c0de2a7e:	9901      	ldr	r1, [sp, #4]
c0de2a80:	6010      	str	r0, [r2, #0]
c0de2a82:	2200      	movs	r2, #0
c0de2a84:	e011      	b.n	c0de2aaa <decode_basic_field+0x2d2>
c0de2a86:	8a69      	ldrh	r1, [r5, #18]
c0de2a88:	4288      	cmp	r0, r1
c0de2a8a:	d93b      	bls.n	c0de2b04 <decode_basic_field+0x32c>
c0de2a8c:	68e0      	ldr	r0, [r4, #12]
c0de2a8e:	f246 11df 	movw	r1, #25055	@ 0x61df
c0de2a92:	f2c0 0100 	movt	r1, #0
c0de2a96:	4479      	add	r1, pc
c0de2a98:	e027      	b.n	c0de2aea <decode_basic_field+0x312>
c0de2a9a:	69ea      	ldr	r2, [r5, #28]
c0de2a9c:	b243      	sxtb	r3, r0
c0de2a9e:	7010      	strb	r0, [r2, #0]
c0de2aa0:	17da      	asrs	r2, r3, #31
c0de2aa2:	e003      	b.n	c0de2aac <decode_basic_field+0x2d4>
c0de2aa4:	69ea      	ldr	r2, [r5, #28]
c0de2aa6:	6010      	str	r0, [r2, #0]
c0de2aa8:	17c2      	asrs	r2, r0, #31
c0de2aaa:	4603      	mov	r3, r0
c0de2aac:	4058      	eors	r0, r3
c0de2aae:	4051      	eors	r1, r2
c0de2ab0:	4308      	orrs	r0, r1
c0de2ab2:	d101      	bne.n	c0de2ab8 <decode_basic_field+0x2e0>
c0de2ab4:	2601      	movs	r6, #1
c0de2ab6:	e01d      	b.n	c0de2af4 <decode_basic_field+0x31c>
c0de2ab8:	68e0      	ldr	r0, [r4, #12]
c0de2aba:	f246 11f3 	movw	r1, #25075	@ 0x61f3
c0de2abe:	f2c0 0100 	movt	r1, #0
c0de2ac2:	4479      	add	r1, pc
c0de2ac4:	e011      	b.n	c0de2aea <decode_basic_field+0x312>
c0de2ac6:	68e0      	ldr	r0, [r4, #12]
c0de2ac8:	f246 11bc 	movw	r1, #25020	@ 0x61bc
c0de2acc:	f2c0 0100 	movt	r1, #0
c0de2ad0:	4479      	add	r1, pc
c0de2ad2:	e00a      	b.n	c0de2aea <decode_basic_field+0x312>
c0de2ad4:	69e8      	ldr	r0, [r5, #28]
c0de2ad6:	8a69      	ldrh	r1, [r5, #18]
c0de2ad8:	f005 fce8 	bl	c0de84ac <__aeabi_memclr>
c0de2adc:	e7ea      	b.n	c0de2ab4 <decode_basic_field+0x2dc>
c0de2ade:	68e0      	ldr	r0, [r4, #12]
c0de2ae0:	f246 3196 	movw	r1, #25494	@ 0x6396
c0de2ae4:	f2c0 0100 	movt	r1, #0
c0de2ae8:	4479      	add	r1, pc
c0de2aea:	2800      	cmp	r0, #0
c0de2aec:	bf18      	it	ne
c0de2aee:	4601      	movne	r1, r0
c0de2af0:	60e1      	str	r1, [r4, #12]
c0de2af2:	2600      	movs	r6, #0
c0de2af4:	4630      	mov	r0, r6
c0de2af6:	b00f      	add	sp, #60	@ 0x3c
c0de2af8:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2afa:	69e9      	ldr	r1, [r5, #28]
c0de2afc:	f821 2b02 	strh.w	r2, [r1], #2
c0de2b00:	4620      	mov	r0, r4
c0de2b02:	e003      	b.n	c0de2b0c <decode_basic_field+0x334>
c0de2b04:	2000      	movs	r0, #0
c0de2b06:	54b8      	strb	r0, [r7, r2]
c0de2b08:	4620      	mov	r0, r4
c0de2b0a:	4639      	mov	r1, r7
c0de2b0c:	f7ff f942 	bl	c0de1d94 <pb_read>
c0de2b10:	4606      	mov	r6, r0
c0de2b12:	e7ef      	b.n	c0de2af4 <decode_basic_field+0x31c>
c0de2b14:	2500      	movs	r5, #0
c0de2b16:	e6b8      	b.n	c0de288a <decode_basic_field+0xb2>

c0de2b18 <ed25519_pk_to_curve25519>:
c0de2b18:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2b1a:	b09f      	sub	sp, #124	@ 0x7c
c0de2b1c:	4604      	mov	r4, r0
c0de2b1e:	4608      	mov	r0, r1
c0de2b20:	460e      	mov	r6, r1
c0de2b22:	f000 f8e1 	bl	c0de2ce8 <ge25519_has_small_order>
c0de2b26:	b110      	cbz	r0, c0de2b2e <ed25519_pk_to_curve25519+0x16>
c0de2b28:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2b2c:	e024      	b.n	c0de2b78 <ed25519_pk_to_curve25519+0x60>
c0de2b2e:	ad15      	add	r5, sp, #84	@ 0x54
c0de2b30:	4628      	mov	r0, r5
c0de2b32:	4631      	mov	r1, r6
c0de2b34:	f000 fed1 	bl	c0de38da <fe25519_frombytes>
c0de2b38:	ae01      	add	r6, sp, #4
c0de2b3a:	4630      	mov	r0, r6
c0de2b3c:	f000 f913 	bl	c0de2d66 <fe25519_1>
c0de2b40:	4630      	mov	r0, r6
c0de2b42:	4631      	mov	r1, r6
c0de2b44:	462a      	mov	r2, r5
c0de2b46:	f000 f942 	bl	c0de2dce <fe25519_sub>
c0de2b4a:	4630      	mov	r0, r6
c0de2b4c:	4631      	mov	r1, r6
c0de2b4e:	f000 f815 	bl	c0de2b7c <fe25519_invert>
c0de2b52:	af0b      	add	r7, sp, #44	@ 0x2c
c0de2b54:	4638      	mov	r0, r7
c0de2b56:	f000 f906 	bl	c0de2d66 <fe25519_1>
c0de2b5a:	4638      	mov	r0, r7
c0de2b5c:	4639      	mov	r1, r7
c0de2b5e:	462a      	mov	r2, r5
c0de2b60:	f000 f909 	bl	c0de2d76 <fe25519_add>
c0de2b64:	4638      	mov	r0, r7
c0de2b66:	4639      	mov	r1, r7
c0de2b68:	4632      	mov	r2, r6
c0de2b6a:	f000 f961 	bl	c0de2e30 <fe25519_mul>
c0de2b6e:	4620      	mov	r0, r4
c0de2b70:	4639      	mov	r1, r7
c0de2b72:	f000 fff1 	bl	c0de3b58 <fe25519_tobytes>
c0de2b76:	2000      	movs	r0, #0
c0de2b78:	b01f      	add	sp, #124	@ 0x7c
c0de2b7a:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de2b7c <fe25519_invert>:
c0de2b7c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2b7e:	b0a9      	sub	sp, #164	@ 0xa4
c0de2b80:	ae1f      	add	r6, sp, #124	@ 0x7c
c0de2b82:	4604      	mov	r4, r0
c0de2b84:	4630      	mov	r0, r6
c0de2b86:	460f      	mov	r7, r1
c0de2b88:	f000 fc75 	bl	c0de3476 <fe25519_sq>
c0de2b8c:	ad15      	add	r5, sp, #84	@ 0x54
c0de2b8e:	4628      	mov	r0, r5
c0de2b90:	4631      	mov	r1, r6
c0de2b92:	f000 fc70 	bl	c0de3476 <fe25519_sq>
c0de2b96:	4628      	mov	r0, r5
c0de2b98:	4629      	mov	r1, r5
c0de2b9a:	f000 fc6c 	bl	c0de3476 <fe25519_sq>
c0de2b9e:	4628      	mov	r0, r5
c0de2ba0:	4639      	mov	r1, r7
c0de2ba2:	462a      	mov	r2, r5
c0de2ba4:	f000 f944 	bl	c0de2e30 <fe25519_mul>
c0de2ba8:	4630      	mov	r0, r6
c0de2baa:	4631      	mov	r1, r6
c0de2bac:	462a      	mov	r2, r5
c0de2bae:	f000 f93f 	bl	c0de2e30 <fe25519_mul>
c0de2bb2:	af0b      	add	r7, sp, #44	@ 0x2c
c0de2bb4:	4638      	mov	r0, r7
c0de2bb6:	4631      	mov	r1, r6
c0de2bb8:	f000 fc5d 	bl	c0de3476 <fe25519_sq>
c0de2bbc:	4628      	mov	r0, r5
c0de2bbe:	4629      	mov	r1, r5
c0de2bc0:	463a      	mov	r2, r7
c0de2bc2:	f000 f935 	bl	c0de2e30 <fe25519_mul>
c0de2bc6:	4638      	mov	r0, r7
c0de2bc8:	4629      	mov	r1, r5
c0de2bca:	f000 fc54 	bl	c0de3476 <fe25519_sq>
c0de2bce:	2504      	movs	r5, #4
c0de2bd0:	4638      	mov	r0, r7
c0de2bd2:	4639      	mov	r1, r7
c0de2bd4:	f000 fc4f 	bl	c0de3476 <fe25519_sq>
c0de2bd8:	3d01      	subs	r5, #1
c0de2bda:	d1f9      	bne.n	c0de2bd0 <fe25519_invert+0x54>
c0de2bdc:	ad0b      	add	r5, sp, #44	@ 0x2c
c0de2bde:	ae15      	add	r6, sp, #84	@ 0x54
c0de2be0:	4630      	mov	r0, r6
c0de2be2:	4629      	mov	r1, r5
c0de2be4:	4632      	mov	r2, r6
c0de2be6:	f000 f923 	bl	c0de2e30 <fe25519_mul>
c0de2bea:	4628      	mov	r0, r5
c0de2bec:	4631      	mov	r1, r6
c0de2bee:	f000 fc42 	bl	c0de3476 <fe25519_sq>
c0de2bf2:	2609      	movs	r6, #9
c0de2bf4:	4628      	mov	r0, r5
c0de2bf6:	4629      	mov	r1, r5
c0de2bf8:	f000 fc3d 	bl	c0de3476 <fe25519_sq>
c0de2bfc:	3e01      	subs	r6, #1
c0de2bfe:	d1f9      	bne.n	c0de2bf4 <fe25519_invert+0x78>
c0de2c00:	ae0b      	add	r6, sp, #44	@ 0x2c
c0de2c02:	aa15      	add	r2, sp, #84	@ 0x54
c0de2c04:	4630      	mov	r0, r6
c0de2c06:	4631      	mov	r1, r6
c0de2c08:	f000 f912 	bl	c0de2e30 <fe25519_mul>
c0de2c0c:	ad01      	add	r5, sp, #4
c0de2c0e:	4628      	mov	r0, r5
c0de2c10:	4631      	mov	r1, r6
c0de2c12:	f000 fc30 	bl	c0de3476 <fe25519_sq>
c0de2c16:	2613      	movs	r6, #19
c0de2c18:	4628      	mov	r0, r5
c0de2c1a:	4629      	mov	r1, r5
c0de2c1c:	f000 fc2b 	bl	c0de3476 <fe25519_sq>
c0de2c20:	3e01      	subs	r6, #1
c0de2c22:	d1f9      	bne.n	c0de2c18 <fe25519_invert+0x9c>
c0de2c24:	ad0b      	add	r5, sp, #44	@ 0x2c
c0de2c26:	a901      	add	r1, sp, #4
c0de2c28:	4628      	mov	r0, r5
c0de2c2a:	462a      	mov	r2, r5
c0de2c2c:	f000 f900 	bl	c0de2e30 <fe25519_mul>
c0de2c30:	4628      	mov	r0, r5
c0de2c32:	4629      	mov	r1, r5
c0de2c34:	f000 fc1f 	bl	c0de3476 <fe25519_sq>
c0de2c38:	2609      	movs	r6, #9
c0de2c3a:	bf00      	nop
c0de2c3c:	4628      	mov	r0, r5
c0de2c3e:	4629      	mov	r1, r5
c0de2c40:	f000 fc19 	bl	c0de3476 <fe25519_sq>
c0de2c44:	3e01      	subs	r6, #1
c0de2c46:	d1f9      	bne.n	c0de2c3c <fe25519_invert+0xc0>
c0de2c48:	ad0b      	add	r5, sp, #44	@ 0x2c
c0de2c4a:	ae15      	add	r6, sp, #84	@ 0x54
c0de2c4c:	4630      	mov	r0, r6
c0de2c4e:	4629      	mov	r1, r5
c0de2c50:	4632      	mov	r2, r6
c0de2c52:	f000 f8ed 	bl	c0de2e30 <fe25519_mul>
c0de2c56:	4628      	mov	r0, r5
c0de2c58:	4631      	mov	r1, r6
c0de2c5a:	f000 fc0c 	bl	c0de3476 <fe25519_sq>
c0de2c5e:	2631      	movs	r6, #49	@ 0x31
c0de2c60:	4628      	mov	r0, r5
c0de2c62:	4629      	mov	r1, r5
c0de2c64:	f000 fc07 	bl	c0de3476 <fe25519_sq>
c0de2c68:	3e01      	subs	r6, #1
c0de2c6a:	d1f9      	bne.n	c0de2c60 <fe25519_invert+0xe4>
c0de2c6c:	ae0b      	add	r6, sp, #44	@ 0x2c
c0de2c6e:	aa15      	add	r2, sp, #84	@ 0x54
c0de2c70:	4630      	mov	r0, r6
c0de2c72:	4631      	mov	r1, r6
c0de2c74:	f000 f8dc 	bl	c0de2e30 <fe25519_mul>
c0de2c78:	ad01      	add	r5, sp, #4
c0de2c7a:	4628      	mov	r0, r5
c0de2c7c:	4631      	mov	r1, r6
c0de2c7e:	f000 fbfa 	bl	c0de3476 <fe25519_sq>
c0de2c82:	2663      	movs	r6, #99	@ 0x63
c0de2c84:	4628      	mov	r0, r5
c0de2c86:	4629      	mov	r1, r5
c0de2c88:	f000 fbf5 	bl	c0de3476 <fe25519_sq>
c0de2c8c:	3e01      	subs	r6, #1
c0de2c8e:	d1f9      	bne.n	c0de2c84 <fe25519_invert+0x108>
c0de2c90:	ad0b      	add	r5, sp, #44	@ 0x2c
c0de2c92:	a901      	add	r1, sp, #4
c0de2c94:	4628      	mov	r0, r5
c0de2c96:	462a      	mov	r2, r5
c0de2c98:	f000 f8ca 	bl	c0de2e30 <fe25519_mul>
c0de2c9c:	4628      	mov	r0, r5
c0de2c9e:	4629      	mov	r1, r5
c0de2ca0:	f000 fbe9 	bl	c0de3476 <fe25519_sq>
c0de2ca4:	2631      	movs	r6, #49	@ 0x31
c0de2ca6:	bf00      	nop
c0de2ca8:	4628      	mov	r0, r5
c0de2caa:	4629      	mov	r1, r5
c0de2cac:	f000 fbe3 	bl	c0de3476 <fe25519_sq>
c0de2cb0:	3e01      	subs	r6, #1
c0de2cb2:	d1f9      	bne.n	c0de2ca8 <fe25519_invert+0x12c>
c0de2cb4:	ad15      	add	r5, sp, #84	@ 0x54
c0de2cb6:	a90b      	add	r1, sp, #44	@ 0x2c
c0de2cb8:	4628      	mov	r0, r5
c0de2cba:	462a      	mov	r2, r5
c0de2cbc:	f000 f8b8 	bl	c0de2e30 <fe25519_mul>
c0de2cc0:	4628      	mov	r0, r5
c0de2cc2:	4629      	mov	r1, r5
c0de2cc4:	f000 fbd7 	bl	c0de3476 <fe25519_sq>
c0de2cc8:	2604      	movs	r6, #4
c0de2cca:	bf00      	nop
c0de2ccc:	4628      	mov	r0, r5
c0de2cce:	4629      	mov	r1, r5
c0de2cd0:	f000 fbd1 	bl	c0de3476 <fe25519_sq>
c0de2cd4:	3e01      	subs	r6, #1
c0de2cd6:	d1f9      	bne.n	c0de2ccc <fe25519_invert+0x150>
c0de2cd8:	a915      	add	r1, sp, #84	@ 0x54
c0de2cda:	aa1f      	add	r2, sp, #124	@ 0x7c
c0de2cdc:	4620      	mov	r0, r4
c0de2cde:	f000 f8a7 	bl	c0de2e30 <fe25519_mul>
c0de2ce2:	b029      	add	sp, #164	@ 0xa4
c0de2ce4:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de2ce8 <ge25519_has_small_order>:
c0de2ce8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2cea:	b082      	sub	sp, #8
c0de2cec:	2200      	movs	r2, #0
c0de2cee:	f88d 2006 	strb.w	r2, [sp, #6]
c0de2cf2:	f8ad 2004 	strh.w	r2, [sp, #4]
c0de2cf6:	9200      	str	r2, [sp, #0]
c0de2cf8:	f246 2cfc 	movw	ip, #25340	@ 0x62fc
c0de2cfc:	f2c0 0c00 	movt	ip, #0
c0de2d00:	44fc      	add	ip, pc
c0de2d02:	4669      	mov	r1, sp
c0de2d04:	46e6      	mov	lr, ip
c0de2d06:	bf00      	nop
c0de2d08:	5c83      	ldrb	r3, [r0, r2]
c0de2d0a:	2400      	movs	r4, #0
c0de2d0c:	4675      	mov	r5, lr
c0de2d0e:	bf00      	nop
c0de2d10:	f815 6b20 	ldrb.w	r6, [r5], #32
c0de2d14:	5d0f      	ldrb	r7, [r1, r4]
c0de2d16:	405e      	eors	r6, r3
c0de2d18:	433e      	orrs	r6, r7
c0de2d1a:	550e      	strb	r6, [r1, r4]
c0de2d1c:	3401      	adds	r4, #1
c0de2d1e:	2c07      	cmp	r4, #7
c0de2d20:	d1f6      	bne.n	c0de2d10 <ge25519_has_small_order+0x28>
c0de2d22:	3201      	adds	r2, #1
c0de2d24:	2a1f      	cmp	r2, #31
c0de2d26:	f10e 0e01 	add.w	lr, lr, #1
c0de2d2a:	d1ed      	bne.n	c0de2d08 <ge25519_has_small_order+0x20>
c0de2d2c:	7fc2      	ldrb	r2, [r0, #31]
c0de2d2e:	f10c 001f 	add.w	r0, ip, #31
c0de2d32:	f002 027f 	and.w	r2, r2, #127	@ 0x7f
c0de2d36:	2300      	movs	r3, #0
c0de2d38:	f810 7b20 	ldrb.w	r7, [r0], #32
c0de2d3c:	5cce      	ldrb	r6, [r1, r3]
c0de2d3e:	4057      	eors	r7, r2
c0de2d40:	4337      	orrs	r7, r6
c0de2d42:	54cf      	strb	r7, [r1, r3]
c0de2d44:	3301      	adds	r3, #1
c0de2d46:	2b07      	cmp	r3, #7
c0de2d48:	d1f6      	bne.n	c0de2d38 <ge25519_has_small_order+0x50>
c0de2d4a:	2000      	movs	r0, #0
c0de2d4c:	2200      	movs	r2, #0
c0de2d4e:	bf00      	nop
c0de2d50:	5c0b      	ldrb	r3, [r1, r0]
c0de2d52:	3001      	adds	r0, #1
c0de2d54:	3b01      	subs	r3, #1
c0de2d56:	2807      	cmp	r0, #7
c0de2d58:	ea42 0203 	orr.w	r2, r2, r3
c0de2d5c:	d1f8      	bne.n	c0de2d50 <ge25519_has_small_order+0x68>
c0de2d5e:	f3c2 2000 	ubfx	r0, r2, #8, #1
c0de2d62:	b002      	add	sp, #8
c0de2d64:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de2d66 <fe25519_1>:
c0de2d66:	b580      	push	{r7, lr}
c0de2d68:	2101      	movs	r1, #1
c0de2d6a:	f840 1b04 	str.w	r1, [r0], #4
c0de2d6e:	2124      	movs	r1, #36	@ 0x24
c0de2d70:	f005 fb9c 	bl	c0de84ac <__aeabi_memclr>
c0de2d74:	bd80      	pop	{r7, pc}

c0de2d76 <fe25519_add>:
c0de2d76:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2d7a:	e891 5400 	ldmia.w	r1, {sl, ip, lr}
c0de2d7e:	e9d2 3400 	ldrd	r3, r4, [r2]
c0de2d82:	e9d1 b503 	ldrd	fp, r5, [r1, #12]
c0de2d86:	449a      	add	sl, r3
c0de2d88:	6893      	ldr	r3, [r2, #8]
c0de2d8a:	44a4      	add	ip, r4
c0de2d8c:	68d4      	ldr	r4, [r2, #12]
c0de2d8e:	f101 0814 	add.w	r8, r1, #20
c0de2d92:	e898 01c0 	ldmia.w	r8, {r6, r7, r8}
c0de2d96:	449e      	add	lr, r3
c0de2d98:	6913      	ldr	r3, [r2, #16]
c0de2d9a:	44a3      	add	fp, r4
c0de2d9c:	6954      	ldr	r4, [r2, #20]
c0de2d9e:	442b      	add	r3, r5
c0de2da0:	6995      	ldr	r5, [r2, #24]
c0de2da2:	4434      	add	r4, r6
c0de2da4:	69d6      	ldr	r6, [r2, #28]
c0de2da6:	443d      	add	r5, r7
c0de2da8:	44b0      	add	r8, r6
c0de2daa:	e9d1 7108 	ldrd	r7, r1, [r1, #32]
c0de2dae:	e9d2 6208 	ldrd	r6, r2, [r2, #32]
c0de2db2:	e880 5400 	stmia.w	r0, {sl, ip, lr}
c0de2db6:	443e      	add	r6, r7
c0de2db8:	4411      	add	r1, r2
c0de2dba:	f100 0214 	add.w	r2, r0, #20
c0de2dbe:	e9c0 b303 	strd	fp, r3, [r0, #12]
c0de2dc2:	e882 0130 	stmia.w	r2, {r4, r5, r8}
c0de2dc6:	e9c0 6108 	strd	r6, r1, [r0, #32]
c0de2dca:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de2dce <fe25519_sub>:
c0de2dce:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2dd2:	e891 5400 	ldmia.w	r1, {sl, ip, lr}
c0de2dd6:	e9d2 3400 	ldrd	r3, r4, [r2]
c0de2dda:	e9d1 b503 	ldrd	fp, r5, [r1, #12]
c0de2dde:	ebaa 0a03 	sub.w	sl, sl, r3
c0de2de2:	6893      	ldr	r3, [r2, #8]
c0de2de4:	ebac 0c04 	sub.w	ip, ip, r4
c0de2de8:	68d4      	ldr	r4, [r2, #12]
c0de2dea:	f101 0814 	add.w	r8, r1, #20
c0de2dee:	e898 01c0 	ldmia.w	r8, {r6, r7, r8}
c0de2df2:	ebae 0e03 	sub.w	lr, lr, r3
c0de2df6:	6913      	ldr	r3, [r2, #16]
c0de2df8:	ebab 0b04 	sub.w	fp, fp, r4
c0de2dfc:	6954      	ldr	r4, [r2, #20]
c0de2dfe:	1aeb      	subs	r3, r5, r3
c0de2e00:	6995      	ldr	r5, [r2, #24]
c0de2e02:	1b34      	subs	r4, r6, r4
c0de2e04:	69d6      	ldr	r6, [r2, #28]
c0de2e06:	1b7d      	subs	r5, r7, r5
c0de2e08:	eba8 0806 	sub.w	r8, r8, r6
c0de2e0c:	e9d1 7108 	ldrd	r7, r1, [r1, #32]
c0de2e10:	e9d2 6208 	ldrd	r6, r2, [r2, #32]
c0de2e14:	e880 5400 	stmia.w	r0, {sl, ip, lr}
c0de2e18:	1bbe      	subs	r6, r7, r6
c0de2e1a:	1a89      	subs	r1, r1, r2
c0de2e1c:	f100 0214 	add.w	r2, r0, #20
c0de2e20:	e9c0 b303 	strd	fp, r3, [r0, #12]
c0de2e24:	e882 0130 	stmia.w	r2, {r4, r5, r8}
c0de2e28:	e9c0 6108 	strd	r6, r1, [r0, #32]
c0de2e2c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de2e30 <fe25519_mul>:
c0de2e30:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2e34:	b0ae      	sub	sp, #184	@ 0xb8
c0de2e36:	e9d1 7300 	ldrd	r7, r3, [r1]
c0de2e3a:	f8d1 b008 	ldr.w	fp, [r1, #8]
c0de2e3e:	9320      	str	r3, [sp, #128]	@ 0x80
c0de2e40:	f8d1 800c 	ldr.w	r8, [r1, #12]
c0de2e44:	690d      	ldr	r5, [r1, #16]
c0de2e46:	f8d1 e014 	ldr.w	lr, [r1, #20]
c0de2e4a:	698e      	ldr	r6, [r1, #24]
c0de2e4c:	f8d1 c01c 	ldr.w	ip, [r1, #28]
c0de2e50:	6a0b      	ldr	r3, [r1, #32]
c0de2e52:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de2e54:	931c      	str	r3, [sp, #112]	@ 0x70
c0de2e56:	9117      	str	r1, [sp, #92]	@ 0x5c
c0de2e58:	6813      	ldr	r3, [r2, #0]
c0de2e5a:	9920      	ldr	r1, [sp, #128]	@ 0x80
c0de2e5c:	9206      	str	r2, [sp, #24]
c0de2e5e:	fb83 2101 	smull	r2, r1, r3, r1
c0de2e62:	922a      	str	r2, [sp, #168]	@ 0xa8
c0de2e64:	912d      	str	r1, [sp, #180]	@ 0xb4
c0de2e66:	fb83 120b 	smull	r1, r2, r3, fp
c0de2e6a:	e9cd 2128 	strd	r2, r1, [sp, #160]	@ 0xa0
c0de2e6e:	fb83 1208 	smull	r1, r2, r3, r8
c0de2e72:	e9cd 2124 	strd	r2, r1, [sp, #144]	@ 0x90
c0de2e76:	fb83 2105 	smull	r2, r1, r3, r5
c0de2e7a:	e9cd 212b 	strd	r2, r1, [sp, #172]	@ 0xac
c0de2e7e:	fb83 120e 	smull	r1, r2, r3, lr
c0de2e82:	e9cd 2126 	strd	r2, r1, [sp, #152]	@ 0x98
c0de2e86:	fb83 2106 	smull	r2, r1, r3, r6
c0de2e8a:	961a      	str	r6, [sp, #104]	@ 0x68
c0de2e8c:	f8cd c02c 	str.w	ip, [sp, #44]	@ 0x2c
c0de2e90:	e9cd 120e 	strd	r1, r2, [sp, #56]	@ 0x38
c0de2e94:	fb83 620c 	smull	r6, r2, r3, ip
c0de2e98:	f8dd c070 	ldr.w	ip, [sp, #112]	@ 0x70
c0de2e9c:	f8cd e064 	str.w	lr, [sp, #100]	@ 0x64
c0de2ea0:	f8dd e018 	ldr.w	lr, [sp, #24]
c0de2ea4:	9505      	str	r5, [sp, #20]
c0de2ea6:	e9cd 621e 	strd	r6, r2, [sp, #120]	@ 0x78
c0de2eaa:	fb83 620c 	smull	r6, r2, r3, ip
c0de2eae:	9d17      	ldr	r5, [sp, #92]	@ 0x5c
c0de2eb0:	961d      	str	r6, [sp, #116]	@ 0x74
c0de2eb2:	e9de 1601 	ldrd	r1, r6, [lr, #4]
c0de2eb6:	f8cd 8034 	str.w	r8, [sp, #52]	@ 0x34
c0de2eba:	fb83 4a07 	smull	r4, sl, r3, r7
c0de2ebe:	9210      	str	r2, [sp, #64]	@ 0x40
c0de2ec0:	fb83 2305 	smull	r2, r3, r3, r5
c0de2ec4:	f04f 0813 	mov.w	r8, #19
c0de2ec8:	e9cd 3211 	strd	r3, r2, [sp, #68]	@ 0x44
c0de2ecc:	fb01 f308 	mul.w	r3, r1, r8
c0de2ed0:	006a      	lsls	r2, r5, #1
c0de2ed2:	9616      	str	r6, [sp, #88]	@ 0x58
c0de2ed4:	fbc3 4a02 	smlal	r4, sl, r3, r2
c0de2ed8:	fb06 f808 	mul.w	r8, r6, r8
c0de2edc:	9e2a      	ldr	r6, [sp, #168]	@ 0xa8
c0de2ede:	9b2d      	ldr	r3, [sp, #180]	@ 0xb4
c0de2ee0:	f8cd b088 	str.w	fp, [sp, #136]	@ 0x88
c0de2ee4:	9218      	str	r2, [sp, #96]	@ 0x60
c0de2ee6:	f8de 200c 	ldr.w	r2, [lr, #12]
c0de2eea:	f8dd b02c 	ldr.w	fp, [sp, #44]	@ 0x2c
c0de2eee:	9115      	str	r1, [sp, #84]	@ 0x54
c0de2ef0:	fbc1 6307 	smlal	r6, r3, r1, r7
c0de2ef4:	2113      	movs	r1, #19
c0de2ef6:	fbc8 4a0c 	smlal	r4, sl, r8, ip
c0de2efa:	fbc8 6305 	smlal	r6, r3, r8, r5
c0de2efe:	fb02 f801 	mul.w	r8, r2, r1
c0de2f02:	ea4f 014b 	mov.w	r1, fp, lsl #1
c0de2f06:	9104      	str	r1, [sp, #16]
c0de2f08:	fbc8 4a01 	smlal	r4, sl, r8, r1
c0de2f0c:	9920      	ldr	r1, [sp, #128]	@ 0x80
c0de2f0e:	fbc8 630c 	smlal	r6, r3, r8, ip
c0de2f12:	932d      	str	r3, [sp, #180]	@ 0xb4
c0de2f14:	962a      	str	r6, [sp, #168]	@ 0xa8
c0de2f16:	004b      	lsls	r3, r1, #1
c0de2f18:	e9dd 5128 	ldrd	r5, r1, [sp, #160]	@ 0xa0
c0de2f1c:	9e15      	ldr	r6, [sp, #84]	@ 0x54
c0de2f1e:	9721      	str	r7, [sp, #132]	@ 0x84
c0de2f20:	920a      	str	r2, [sp, #40]	@ 0x28
c0de2f22:	4622      	mov	r2, r4
c0de2f24:	930c      	str	r3, [sp, #48]	@ 0x30
c0de2f26:	fbc6 1503 	smlal	r1, r5, r6, r3
c0de2f2a:	9c16      	ldr	r4, [sp, #88]	@ 0x58
c0de2f2c:	9b21      	ldr	r3, [sp, #132]	@ 0x84
c0de2f2e:	f8de 6010 	ldr.w	r6, [lr, #16]
c0de2f32:	fbc4 1503 	smlal	r1, r5, r4, r3
c0de2f36:	9b18      	ldr	r3, [sp, #96]	@ 0x60
c0de2f38:	4694      	mov	ip, r2
c0de2f3a:	fbc8 1503 	smlal	r1, r5, r8, r3
c0de2f3e:	2313      	movs	r3, #19
c0de2f40:	9a1a      	ldr	r2, [sp, #104]	@ 0x68
c0de2f42:	4373      	muls	r3, r6
c0de2f44:	fbc3 ca02 	smlal	ip, sl, r3, r2
c0de2f48:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de2f4a:	9f2d      	ldr	r7, [sp, #180]	@ 0xb4
c0de2f4c:	9614      	str	r6, [sp, #80]	@ 0x50
c0de2f4e:	fbc3 270b 	smlal	r2, r7, r3, fp
c0de2f52:	922a      	str	r2, [sp, #168]	@ 0xa8
c0de2f54:	9a1c      	ldr	r2, [sp, #112]	@ 0x70
c0de2f56:	972d      	str	r7, [sp, #180]	@ 0xb4
c0de2f58:	fbc3 1502 	smlal	r1, r5, r3, r2
c0de2f5c:	e9cd 5128 	strd	r5, r1, [sp, #160]	@ 0xa0
c0de2f60:	e9dd 8124 	ldrd	r8, r1, [sp, #144]	@ 0x90
c0de2f64:	9a15      	ldr	r2, [sp, #84]	@ 0x54
c0de2f66:	9d22      	ldr	r5, [sp, #136]	@ 0x88
c0de2f68:	9f20      	ldr	r7, [sp, #128]	@ 0x80
c0de2f6a:	fbc2 1805 	smlal	r1, r8, r2, r5
c0de2f6e:	fbc4 1807 	smlal	r1, r8, r4, r7
c0de2f72:	f8dd b084 	ldr.w	fp, [sp, #132]	@ 0x84
c0de2f76:	9f0a      	ldr	r7, [sp, #40]	@ 0x28
c0de2f78:	9d17      	ldr	r5, [sp, #92]	@ 0x5c
c0de2f7a:	fbc7 180b 	smlal	r1, r8, r7, fp
c0de2f7e:	4626      	mov	r6, r4
c0de2f80:	f8de 4014 	ldr.w	r4, [lr, #20]
c0de2f84:	fbc3 1805 	smlal	r1, r8, r3, r5
c0de2f88:	9125      	str	r1, [sp, #148]	@ 0x94
c0de2f8a:	2113      	movs	r1, #19
c0de2f8c:	fb04 f301 	mul.w	r3, r4, r1
c0de2f90:	9919      	ldr	r1, [sp, #100]	@ 0x64
c0de2f92:	9413      	str	r4, [sp, #76]	@ 0x4c
c0de2f94:	0049      	lsls	r1, r1, #1
c0de2f96:	fbc3 ca01 	smlal	ip, sl, r3, r1
c0de2f9a:	f8cd c08c 	str.w	ip, [sp, #140]	@ 0x8c
c0de2f9e:	f8dd c034 	ldr.w	ip, [sp, #52]	@ 0x34
c0de2fa2:	e9dd 542b 	ldrd	r5, r4, [sp, #172]	@ 0xac
c0de2fa6:	9107      	str	r1, [sp, #28]
c0de2fa8:	ea4f 014c 	mov.w	r1, ip, lsl #1
c0de2fac:	9108      	str	r1, [sp, #32]
c0de2fae:	fbc2 5401 	smlal	r5, r4, r2, r1
c0de2fb2:	9922      	ldr	r1, [sp, #136]	@ 0x88
c0de2fb4:	9a1a      	ldr	r2, [sp, #104]	@ 0x68
c0de2fb6:	fbc6 5401 	smlal	r5, r4, r6, r1
c0de2fba:	990c      	ldr	r1, [sp, #48]	@ 0x30
c0de2fbc:	f8de 6018 	ldr.w	r6, [lr, #24]
c0de2fc0:	fbc7 5401 	smlal	r5, r4, r7, r1
c0de2fc4:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de2fc6:	f8dd e094 	ldr.w	lr, [sp, #148]	@ 0x94
c0de2fca:	fbc1 540b 	smlal	r5, r4, r1, fp
c0de2fce:	9918      	ldr	r1, [sp, #96]	@ 0x60
c0de2fd0:	9609      	str	r6, [sp, #36]	@ 0x24
c0de2fd2:	fbc3 5401 	smlal	r5, r4, r3, r1
c0de2fd6:	e9cd 542b 	strd	r5, r4, [sp, #172]	@ 0xac
c0de2fda:	9c2d      	ldr	r4, [sp, #180]	@ 0xb4
c0de2fdc:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0de2fde:	e9dd 5728 	ldrd	r5, r7, [sp, #160]	@ 0xa0
c0de2fe2:	fbc3 1402 	smlal	r1, r4, r3, r2
c0de2fe6:	9a04      	ldr	r2, [sp, #16]
c0de2fe8:	fbc3 7502 	smlal	r7, r5, r3, r2
c0de2fec:	9a1c      	ldr	r2, [sp, #112]	@ 0x70
c0de2fee:	e9cd 5728 	strd	r5, r7, [sp, #160]	@ 0xa0
c0de2ff2:	fbc3 e802 	smlal	lr, r8, r3, r2
c0de2ff6:	2313      	movs	r3, #19
c0de2ff8:	e9dd 752b 	ldrd	r7, r5, [sp, #172]	@ 0xac
c0de2ffc:	4373      	muls	r3, r6
c0de2ffe:	fbc3 7502 	smlal	r7, r5, r3, r2
c0de3002:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de3004:	9e05      	ldr	r6, [sp, #20]
c0de3006:	fbc3 1402 	smlal	r1, r4, r3, r2
c0de300a:	912a      	str	r1, [sp, #168]	@ 0xa8
c0de300c:	942d      	str	r4, [sp, #180]	@ 0xb4
c0de300e:	e9dd 4126 	ldrd	r4, r1, [sp, #152]	@ 0x98
c0de3012:	9a15      	ldr	r2, [sp, #84]	@ 0x54
c0de3014:	f8cd 8090 	str.w	r8, [sp, #144]	@ 0x90
c0de3018:	f8dd 808c 	ldr.w	r8, [sp, #140]	@ 0x8c
c0de301c:	fbc2 1406 	smlal	r1, r4, r2, r6
c0de3020:	9a16      	ldr	r2, [sp, #88]	@ 0x58
c0de3022:	fbc3 8a06 	smlal	r8, sl, r3, r6
c0de3026:	f8cd a06c 	str.w	sl, [sp, #108]	@ 0x6c
c0de302a:	fbc2 140c 	smlal	r1, r4, r2, ip
c0de302e:	f8dd a028 	ldr.w	sl, [sp, #40]	@ 0x28
c0de3032:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de3034:	e9cd 752b 	strd	r7, r5, [sp, #172]	@ 0xac
c0de3038:	fbca 1402 	smlal	r1, r4, sl, r2
c0de303c:	9a20      	ldr	r2, [sp, #128]	@ 0x80
c0de303e:	9f14      	ldr	r7, [sp, #80]	@ 0x50
c0de3040:	f8cd 808c 	str.w	r8, [sp, #140]	@ 0x8c
c0de3044:	fbc7 1402 	smlal	r1, r4, r7, r2
c0de3048:	9a13      	ldr	r2, [sp, #76]	@ 0x4c
c0de304a:	9f1a      	ldr	r7, [sp, #104]	@ 0x68
c0de304c:	fbc2 140b 	smlal	r1, r4, r2, fp
c0de3050:	9a17      	ldr	r2, [sp, #92]	@ 0x5c
c0de3052:	9d0b      	ldr	r5, [sp, #44]	@ 0x2c
c0de3054:	fbc3 1402 	smlal	r1, r4, r3, r2
c0de3058:	9426      	str	r4, [sp, #152]	@ 0x98
c0de305a:	460a      	mov	r2, r1
c0de305c:	e9dd 1428 	ldrd	r1, r4, [sp, #160]	@ 0xa0
c0de3060:	f8dd 8090 	ldr.w	r8, [sp, #144]	@ 0x90
c0de3064:	fbc3 4107 	smlal	r4, r1, r3, r7
c0de3068:	9f06      	ldr	r7, [sp, #24]
c0de306a:	fbc3 e805 	smlal	lr, r8, r3, r5
c0de306e:	f8d7 b01c 	ldr.w	fp, [r7, #28]
c0de3072:	46f4      	mov	ip, lr
c0de3074:	2313      	movs	r3, #19
c0de3076:	9d1b      	ldr	r5, [sp, #108]	@ 0x6c
c0de3078:	f8dd e020 	ldr.w	lr, [sp, #32]
c0de307c:	9f23      	ldr	r7, [sp, #140]	@ 0x8c
c0de307e:	fb0b f303 	mul.w	r3, fp, r3
c0de3082:	fbc3 750e 	smlal	r7, r5, r3, lr
c0de3086:	f8cd b00c 	str.w	fp, [sp, #12]
c0de308a:	9723      	str	r7, [sp, #140]	@ 0x8c
c0de308c:	951b      	str	r5, [sp, #108]	@ 0x6c
c0de308e:	f8dd b010 	ldr.w	fp, [sp, #16]
c0de3092:	e9dd 752b 	ldrd	r7, r5, [sp, #172]	@ 0xac
c0de3096:	fbc3 750b 	smlal	r7, r5, r3, fp
c0de309a:	e9cd 752b 	strd	r7, r5, [sp, #172]	@ 0xac
c0de309e:	9d2d      	ldr	r5, [sp, #180]	@ 0xb4
c0de30a0:	9f2a      	ldr	r7, [sp, #168]	@ 0xa8
c0de30a2:	fbc3 7506 	smlal	r7, r5, r3, r6
c0de30a6:	972a      	str	r7, [sp, #168]	@ 0xa8
c0de30a8:	952d      	str	r5, [sp, #180]	@ 0xb4
c0de30aa:	9f1c      	ldr	r7, [sp, #112]	@ 0x70
c0de30ac:	9d26      	ldr	r5, [sp, #152]	@ 0x98
c0de30ae:	fbc3 2507 	smlal	r2, r5, r3, r7
c0de30b2:	e9cd 5226 	strd	r5, r2, [sp, #152]	@ 0x98
c0de30b6:	9a07      	ldr	r2, [sp, #28]
c0de30b8:	fbc3 4102 	smlal	r4, r1, r3, r2
c0de30bc:	e9cd 1428 	strd	r1, r4, [sp, #160]	@ 0xa0
c0de30c0:	e9dd 150e 	ldrd	r1, r5, [sp, #56]	@ 0x38
c0de30c4:	9c15      	ldr	r4, [sp, #84]	@ 0x54
c0de30c6:	fbc4 5102 	smlal	r5, r1, r4, r2
c0de30ca:	9a16      	ldr	r2, [sp, #88]	@ 0x58
c0de30cc:	fbc2 5106 	smlal	r5, r1, r2, r6
c0de30d0:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de30d2:	9e14      	ldr	r6, [sp, #80]	@ 0x50
c0de30d4:	fbca 510e 	smlal	r5, r1, sl, lr
c0de30d8:	fbc6 5102 	smlal	r5, r1, r6, r2
c0de30dc:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
c0de30de:	9e13      	ldr	r6, [sp, #76]	@ 0x4c
c0de30e0:	f8dd a068 	ldr.w	sl, [sp, #104]	@ 0x68
c0de30e4:	fbc6 5102 	smlal	r5, r1, r6, r2
c0de30e8:	9a09      	ldr	r2, [sp, #36]	@ 0x24
c0de30ea:	9e21      	ldr	r6, [sp, #132]	@ 0x84
c0de30ec:	fbc3 c80a 	smlal	ip, r8, r3, sl
c0de30f0:	fbc2 5106 	smlal	r5, r1, r2, r6
c0de30f4:	9a18      	ldr	r2, [sp, #96]	@ 0x60
c0de30f6:	2613      	movs	r6, #19
c0de30f8:	fbc3 5102 	smlal	r5, r1, r3, r2
c0de30fc:	9a06      	ldr	r2, [sp, #24]
c0de30fe:	e9cd 8c24 	strd	r8, ip, [sp, #144]	@ 0x90
c0de3102:	6a13      	ldr	r3, [r2, #32]
c0de3104:	6a52      	ldr	r2, [r2, #36]	@ 0x24
c0de3106:	9300      	str	r3, [sp, #0]
c0de3108:	4373      	muls	r3, r6
c0de310a:	9201      	str	r2, [sp, #4]
c0de310c:	fbc3 5107 	smlal	r5, r1, r3, r7
c0de3110:	4372      	muls	r2, r6
c0de3112:	fbc2 510b 	smlal	r5, r1, r2, fp
c0de3116:	9302      	str	r3, [sp, #8]
c0de3118:	46bc      	mov	ip, r7
c0de311a:	e9cd 150e 	strd	r1, r5, [sp, #56]	@ 0x38
c0de311e:	f8dd e074 	ldr.w	lr, [sp, #116]	@ 0x74
c0de3122:	9b10      	ldr	r3, [sp, #64]	@ 0x40
c0de3124:	e9dd 671e 	ldrd	r6, r7, [sp, #120]	@ 0x78
c0de3128:	e9dd 5811 	ldrd	r5, r8, [sp, #68]	@ 0x44
c0de312c:	9206      	str	r2, [sp, #24]
c0de312e:	fbc4 e30b 	smlal	lr, r3, r4, fp
c0de3132:	fbc4 670a 	smlal	r6, r7, r4, sl
c0de3136:	fbc4 850c 	smlal	r8, r5, r4, ip
c0de313a:	990b      	ldr	r1, [sp, #44]	@ 0x2c
c0de313c:	e9dd b226 	ldrd	fp, r2, [sp, #152]	@ 0x98
c0de3140:	9c02      	ldr	r4, [sp, #8]
c0de3142:	f8dd c058 	ldr.w	ip, [sp, #88]	@ 0x58
c0de3146:	fbc4 2b01 	smlal	r2, fp, r4, r1
c0de314a:	9227      	str	r2, [sp, #156]	@ 0x9c
c0de314c:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de314e:	fbcc 8501 	smlal	r8, r5, ip, r1
c0de3152:	4639      	mov	r1, r7
c0de3154:	fbcc 6102 	smlal	r6, r1, ip, r2
c0de3158:	e9dd 272b 	ldrd	r2, r7, [sp, #172]	@ 0xac
c0de315c:	fbcc e30a 	smlal	lr, r3, ip, sl
c0de3160:	fbc4 270a 	smlal	r2, r7, r4, sl
c0de3164:	e9dd c406 	ldrd	ip, r4, [sp, #24]
c0de3168:	fbcc 2704 	smlal	r2, r7, ip, r4
c0de316c:	e9cd 272b 	strd	r2, r7, [sp, #172]	@ 0xac
c0de3170:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0de3172:	9a07      	ldr	r2, [sp, #28]
c0de3174:	fbc4 850a 	smlal	r8, r5, r4, sl
c0de3178:	fbc4 e302 	smlal	lr, r3, r4, r2
c0de317c:	9a27      	ldr	r2, [sp, #156]	@ 0x9c
c0de317e:	9f13      	ldr	r7, [sp, #76]	@ 0x4c
c0de3180:	fbcc 2b0a 	smlal	r2, fp, ip, sl
c0de3184:	e9cd b226 	strd	fp, r2, [sp, #152]	@ 0x98
c0de3188:	f8dd b014 	ldr.w	fp, [sp, #20]
c0de318c:	f8dd a050 	ldr.w	sl, [sp, #80]	@ 0x50
c0de3190:	f8dd c034 	ldr.w	ip, [sp, #52]	@ 0x34
c0de3194:	fbc4 610b 	smlal	r6, r1, r4, fp
c0de3198:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de319a:	fbca 610c 	smlal	r6, r1, sl, ip
c0de319e:	fbc7 6102 	smlal	r6, r1, r7, r2
c0de31a2:	9c20      	ldr	r4, [sp, #128]	@ 0x80
c0de31a4:	9f09      	ldr	r7, [sp, #36]	@ 0x24
c0de31a6:	f8cd e074 	str.w	lr, [sp, #116]	@ 0x74
c0de31aa:	fbc7 6104 	smlal	r6, r1, r7, r4
c0de31ae:	9f03      	ldr	r7, [sp, #12]
c0de31b0:	9c21      	ldr	r4, [sp, #132]	@ 0x84
c0de31b2:	f8dd e0a8 	ldr.w	lr, [sp, #168]	@ 0xa8
c0de31b6:	fbc7 6104 	smlal	r6, r1, r7, r4
c0de31ba:	9f17      	ldr	r7, [sp, #92]	@ 0x5c
c0de31bc:	9c02      	ldr	r4, [sp, #8]
c0de31be:	fbc4 6107 	smlal	r6, r1, r4, r7
c0de31c2:	e9cd 611e 	strd	r6, r1, [sp, #120]	@ 0x78
c0de31c6:	991b      	ldr	r1, [sp, #108]	@ 0x6c
c0de31c8:	9f23      	ldr	r7, [sp, #140]	@ 0x8c
c0de31ca:	9e19      	ldr	r6, [sp, #100]	@ 0x64
c0de31cc:	fbc4 7102 	smlal	r7, r1, r4, r2
c0de31d0:	911b      	str	r1, [sp, #108]	@ 0x6c
c0de31d2:	992d      	ldr	r1, [sp, #180]	@ 0xb4
c0de31d4:	9723      	str	r7, [sp, #140]	@ 0x8c
c0de31d6:	e9dd 2728 	ldrd	r2, r7, [sp, #160]	@ 0xa0
c0de31da:	fbc4 e10c 	smlal	lr, r1, r4, ip
c0de31de:	912d      	str	r1, [sp, #180]	@ 0xb4
c0de31e0:	fbc4 720b 	smlal	r7, r2, r4, fp
c0de31e4:	4621      	mov	r1, r4
c0de31e6:	e9dd c424 	ldrd	ip, r4, [sp, #144]	@ 0x90
c0de31ea:	fbca 8506 	smlal	r8, r5, sl, r6
c0de31ee:	fbc1 4c06 	smlal	r4, ip, r1, r6
c0de31f2:	9e1d      	ldr	r6, [sp, #116]	@ 0x74
c0de31f4:	9908      	ldr	r1, [sp, #32]
c0de31f6:	fbca 630b 	smlal	r6, r3, sl, fp
c0de31fa:	f8dd a018 	ldr.w	sl, [sp, #24]
c0de31fe:	fbca 7201 	smlal	r7, r2, sl, r1
c0de3202:	e9cd 2728 	strd	r2, r7, [sp, #160]	@ 0xa0
c0de3206:	9f13      	ldr	r7, [sp, #76]	@ 0x4c
c0de3208:	9908      	ldr	r1, [sp, #32]
c0de320a:	fbc7 850b 	smlal	r8, r5, r7, fp
c0de320e:	fbc7 6301 	smlal	r6, r3, r7, r1
c0de3212:	9f06      	ldr	r7, [sp, #24]
c0de3214:	991c      	ldr	r1, [sp, #112]	@ 0x70
c0de3216:	fbc7 4c0b 	smlal	r4, ip, r7, fp
c0de321a:	e9cd c424 	strd	ip, r4, [sp, #144]	@ 0x90
c0de321e:	e9dd 241e 	ldrd	r2, r4, [sp, #120]	@ 0x78
c0de3222:	f8dd a088 	ldr.w	sl, [sp, #136]	@ 0x88
c0de3226:	fbc7 2401 	smlal	r2, r4, r7, r1
c0de322a:	e9cd 241e 	strd	r2, r4, [sp, #120]	@ 0x78
c0de322e:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de3230:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de3232:	4632      	mov	r2, r6
c0de3234:	fbc4 8501 	smlal	r8, r5, r4, r1
c0de3238:	fbc4 230a 	smlal	r2, r3, r4, sl
c0de323c:	9e23      	ldr	r6, [sp, #140]	@ 0x8c
c0de323e:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0de3240:	991b      	ldr	r1, [sp, #108]	@ 0x6c
c0de3242:	f8dd c00c 	ldr.w	ip, [sp, #12]
c0de3246:	fbc7 6104 	smlal	r6, r1, r7, r4
c0de324a:	fbcc 2304 	smlal	r2, r3, ip, r4
c0de324e:	f8dd b000 	ldr.w	fp, [sp]
c0de3252:	9c21      	ldr	r4, [sp, #132]	@ 0x84
c0de3254:	fbcc 850a 	smlal	r8, r5, ip, sl
c0de3258:	fbcb 2304 	smlal	r2, r3, fp, r4
c0de325c:	9c18      	ldr	r4, [sp, #96]	@ 0x60
c0de325e:	fbc7 2304 	smlal	r2, r3, r7, r4
c0de3262:	921d      	str	r2, [sp, #116]	@ 0x74
c0de3264:	9310      	str	r3, [sp, #64]	@ 0x40
c0de3266:	9a2d      	ldr	r2, [sp, #180]	@ 0xb4
c0de3268:	9b20      	ldr	r3, [sp, #128]	@ 0x80
c0de326a:	fbc7 e20a 	smlal	lr, r2, r7, sl
c0de326e:	fbcb 8503 	smlal	r8, r5, fp, r3
c0de3272:	9b01      	ldr	r3, [sp, #4]
c0de3274:	9f21      	ldr	r7, [sp, #132]	@ 0x84
c0de3276:	4674      	mov	r4, lr
c0de3278:	fbc3 8507 	smlal	r8, r5, r3, r7
c0de327c:	f116 7300 	adds.w	r3, r6, #33554432	@ 0x2000000
c0de3280:	e9cd 5811 	strd	r5, r8, [sp, #68]	@ 0x44
c0de3284:	f141 0700 	adc.w	r7, r1, #0
c0de3288:	0e9d      	lsrs	r5, r3, #26
c0de328a:	ea45 1587 	orr.w	r5, r5, r7, lsl #6
c0de328e:	eb14 0805 	adds.w	r8, r4, r5
c0de3292:	f003 437c 	and.w	r3, r3, #4227858432	@ 0xfc000000
c0de3296:	9d2b      	ldr	r5, [sp, #172]	@ 0xac
c0de3298:	468e      	mov	lr, r1
c0de329a:	eb42 6ca7 	adc.w	ip, r2, r7, asr #26
c0de329e:	1af1      	subs	r1, r6, r3
c0de32a0:	9a2c      	ldr	r2, [sp, #176]	@ 0xb0
c0de32a2:	912d      	str	r1, [sp, #180]	@ 0xb4
c0de32a4:	eb6e 0107 	sbc.w	r1, lr, r7
c0de32a8:	f115 7300 	adds.w	r3, r5, #33554432	@ 0x2000000
c0de32ac:	912a      	str	r1, [sp, #168]	@ 0xa8
c0de32ae:	f142 0700 	adc.w	r7, r2, #0
c0de32b2:	0e9c      	lsrs	r4, r3, #26
c0de32b4:	9927      	ldr	r1, [sp, #156]	@ 0x9c
c0de32b6:	ea44 1487 	orr.w	r4, r4, r7, lsl #6
c0de32ba:	1864      	adds	r4, r4, r1
c0de32bc:	9926      	ldr	r1, [sp, #152]	@ 0x98
c0de32be:	f003 437c 	and.w	r3, r3, #4227858432	@ 0xfc000000
c0de32c2:	eb41 66a7 	adc.w	r6, r1, r7, asr #26
c0de32c6:	1ae9      	subs	r1, r5, r3
c0de32c8:	9120      	str	r1, [sp, #128]	@ 0x80
c0de32ca:	eb62 0107 	sbc.w	r1, r2, r7
c0de32ce:	9121      	str	r1, [sp, #132]	@ 0x84
c0de32d0:	f118 7180 	adds.w	r1, r8, #16777216	@ 0x1000000
c0de32d4:	912b      	str	r1, [sp, #172]	@ 0xac
c0de32d6:	f14c 0500 	adc.w	r5, ip, #0
c0de32da:	0e49      	lsrs	r1, r1, #25
c0de32dc:	9a29      	ldr	r2, [sp, #164]	@ 0xa4
c0de32de:	ea41 11c5 	orr.w	r1, r1, r5, lsl #7
c0de32e2:	1852      	adds	r2, r2, r1
c0de32e4:	9928      	ldr	r1, [sp, #160]	@ 0xa0
c0de32e6:	9427      	str	r4, [sp, #156]	@ 0x9c
c0de32e8:	eb41 6565 	adc.w	r5, r1, r5, asr #25
c0de32ec:	f114 7180 	adds.w	r1, r4, #16777216	@ 0x1000000
c0de32f0:	9128      	str	r1, [sp, #160]	@ 0xa0
c0de32f2:	f146 0600 	adc.w	r6, r6, #0
c0de32f6:	0e4b      	lsrs	r3, r1, #25
c0de32f8:	990f      	ldr	r1, [sp, #60]	@ 0x3c
c0de32fa:	ea43 13c6 	orr.w	r3, r3, r6, lsl #7
c0de32fe:	185b      	adds	r3, r3, r1
c0de3300:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de3302:	922c      	str	r2, [sp, #176]	@ 0xb0
c0de3304:	eb41 6666 	adc.w	r6, r1, r6, asr #25
c0de3308:	f112 7100 	adds.w	r1, r2, #33554432	@ 0x2000000
c0de330c:	9122      	str	r1, [sp, #136]	@ 0x88
c0de330e:	f145 0500 	adc.w	r5, r5, #0
c0de3312:	ea4f 6a91 	mov.w	sl, r1, lsr #26
c0de3316:	9925      	ldr	r1, [sp, #148]	@ 0x94
c0de3318:	ea4a 1485 	orr.w	r4, sl, r5, lsl #6
c0de331c:	190f      	adds	r7, r1, r4
c0de331e:	9924      	ldr	r1, [sp, #144]	@ 0x90
c0de3320:	9a1e      	ldr	r2, [sp, #120]	@ 0x78
c0de3322:	eb41 65a5 	adc.w	r5, r1, r5, asr #26
c0de3326:	f113 7100 	adds.w	r1, r3, #33554432	@ 0x2000000
c0de332a:	f146 0600 	adc.w	r6, r6, #0
c0de332e:	ea4f 6b91 	mov.w	fp, r1, lsr #26
c0de3332:	9125      	str	r1, [sp, #148]	@ 0x94
c0de3334:	ea4b 1186 	orr.w	r1, fp, r6, lsl #6
c0de3338:	9329      	str	r3, [sp, #164]	@ 0xa4
c0de333a:	1853      	adds	r3, r2, r1
c0de333c:	991f      	ldr	r1, [sp, #124]	@ 0x7c
c0de333e:	f8cd 808c 	str.w	r8, [sp, #140]	@ 0x8c
c0de3342:	eb41 66a6 	adc.w	r6, r1, r6, asr #26
c0de3346:	f117 7b80 	adds.w	fp, r7, #16777216	@ 0x1000000
c0de334a:	f145 0500 	adc.w	r5, r5, #0
c0de334e:	ea4f 6e5b 	mov.w	lr, fp, lsr #25
c0de3352:	9920      	ldr	r1, [sp, #128]	@ 0x80
c0de3354:	ea4e 12c5 	orr.w	r2, lr, r5, lsl #7
c0de3358:	eb12 0e01 	adds.w	lr, r2, r1
c0de335c:	9921      	ldr	r1, [sp, #132]	@ 0x84
c0de335e:	ea4f 6565 	mov.w	r5, r5, asr #25
c0de3362:	414d      	adcs	r5, r1
c0de3364:	f113 7c80 	adds.w	ip, r3, #16777216	@ 0x1000000
c0de3368:	f146 0600 	adc.w	r6, r6, #0
c0de336c:	ea4f 685c 	mov.w	r8, ip, lsr #25
c0de3370:	991d      	ldr	r1, [sp, #116]	@ 0x74
c0de3372:	931e      	str	r3, [sp, #120]	@ 0x78
c0de3374:	ea48 13c6 	orr.w	r3, r8, r6, lsl #7
c0de3378:	eb11 0803 	adds.w	r8, r1, r3
c0de337c:	9910      	ldr	r1, [sp, #64]	@ 0x40
c0de337e:	9726      	str	r7, [sp, #152]	@ 0x98
c0de3380:	eb41 6666 	adc.w	r6, r1, r6, asr #25
c0de3384:	f11e 7300 	adds.w	r3, lr, #33554432	@ 0x2000000
c0de3388:	f145 0100 	adc.w	r1, r5, #0
c0de338c:	f118 7200 	adds.w	r2, r8, #33554432	@ 0x2000000
c0de3390:	9124      	str	r1, [sp, #144]	@ 0x90
c0de3392:	f146 0600 	adc.w	r6, r6, #0
c0de3396:	0e95      	lsrs	r5, r2, #26
c0de3398:	9912      	ldr	r1, [sp, #72]	@ 0x48
c0de339a:	ea45 1586 	orr.w	r5, r5, r6, lsl #6
c0de339e:	186d      	adds	r5, r5, r1
c0de33a0:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de33a2:	f04f 0413 	mov.w	r4, #19
c0de33a6:	eb41 66a6 	adc.w	r6, r1, r6, asr #26
c0de33aa:	f115 7180 	adds.w	r1, r5, #16777216	@ 0x1000000
c0de33ae:	f146 0600 	adc.w	r6, r6, #0
c0de33b2:	ea4f 6a51 	mov.w	sl, r1, lsr #25
c0de33b6:	ea4a 17c6 	orr.w	r7, sl, r6, lsl #7
c0de33ba:	fba7 a704 	umull	sl, r7, r7, r4
c0de33be:	1676      	asrs	r6, r6, #25
c0de33c0:	2413      	movs	r4, #19
c0de33c2:	fb06 7404 	mla	r4, r6, r4, r7
c0de33c6:	9e2b      	ldr	r6, [sp, #172]	@ 0xac
c0de33c8:	f8cd a084 	str.w	sl, [sp, #132]	@ 0x84
c0de33cc:	f006 477e 	and.w	r7, r6, #4261412864	@ 0xfe000000
c0de33d0:	9e23      	ldr	r6, [sp, #140]	@ 0x8c
c0de33d2:	9420      	str	r4, [sp, #128]	@ 0x80
c0de33d4:	1bf6      	subs	r6, r6, r7
c0de33d6:	9623      	str	r6, [sp, #140]	@ 0x8c
c0de33d8:	9e28      	ldr	r6, [sp, #160]	@ 0xa0
c0de33da:	f00b 447e 	and.w	r4, fp, #4261412864	@ 0xfe000000
c0de33de:	f006 477e 	and.w	r7, r6, #4261412864	@ 0xfe000000
c0de33e2:	9e27      	ldr	r6, [sp, #156]	@ 0x9c
c0de33e4:	f001 417e 	and.w	r1, r1, #4261412864	@ 0xfe000000
c0de33e8:	1bf7      	subs	r7, r6, r7
c0de33ea:	9e22      	ldr	r6, [sp, #136]	@ 0x88
c0de33ec:	1a69      	subs	r1, r5, r1
c0de33ee:	f006 4a7c 	and.w	sl, r6, #4227858432	@ 0xfc000000
c0de33f2:	9e2c      	ldr	r6, [sp, #176]	@ 0xb0
c0de33f4:	f002 427c 	and.w	r2, r2, #4227858432	@ 0xfc000000
c0de33f8:	eba6 060a 	sub.w	r6, r6, sl
c0de33fc:	962b      	str	r6, [sp, #172]	@ 0xac
c0de33fe:	9e25      	ldr	r6, [sp, #148]	@ 0x94
c0de3400:	eba8 0202 	sub.w	r2, r8, r2
c0de3404:	f006 4a7c 	and.w	sl, r6, #4227858432	@ 0xfc000000
c0de3408:	9e29      	ldr	r6, [sp, #164]	@ 0xa4
c0de340a:	e9c0 2108 	strd	r2, r1, [r0, #32]
c0de340e:	eba6 060a 	sub.w	r6, r6, sl
c0de3412:	962c      	str	r6, [sp, #176]	@ 0xb0
c0de3414:	9e26      	ldr	r6, [sp, #152]	@ 0x98
c0de3416:	eba6 0a04 	sub.w	sl, r6, r4
c0de341a:	9e1e      	ldr	r6, [sp, #120]	@ 0x78
c0de341c:	f00c 447e 	and.w	r4, ip, #4261412864	@ 0xfe000000
c0de3420:	eba6 0c04 	sub.w	ip, r6, r4
c0de3424:	9e24      	ldr	r6, [sp, #144]	@ 0x90
c0de3426:	0e9c      	lsrs	r4, r3, #26
c0de3428:	ea44 1486 	orr.w	r4, r4, r6, lsl #6
c0de342c:	eb07 0b04 	add.w	fp, r7, r4
c0de3430:	9f2d      	ldr	r7, [sp, #180]	@ 0xb4
c0de3432:	9e21      	ldr	r6, [sp, #132]	@ 0x84
c0de3434:	9c2a      	ldr	r4, [sp, #168]	@ 0xa8
c0de3436:	19bf      	adds	r7, r7, r6
c0de3438:	9e20      	ldr	r6, [sp, #128]	@ 0x80
c0de343a:	f003 437c 	and.w	r3, r3, #4227858432	@ 0xfc000000
c0de343e:	4166      	adcs	r6, r4
c0de3440:	f117 7500 	adds.w	r5, r7, #33554432	@ 0x2000000
c0de3444:	f146 0600 	adc.w	r6, r6, #0
c0de3448:	0eac      	lsrs	r4, r5, #26
c0de344a:	ea44 1686 	orr.w	r6, r4, r6, lsl #6
c0de344e:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
c0de3450:	f005 457c 	and.w	r5, r5, #4227858432	@ 0xfc000000
c0de3454:	ebae 0303 	sub.w	r3, lr, r3
c0de3458:	4426      	add	r6, r4
c0de345a:	1b7f      	subs	r7, r7, r5
c0de345c:	e9c0 7600 	strd	r7, r6, [r0]
c0de3460:	9f2b      	ldr	r7, [sp, #172]	@ 0xac
c0de3462:	e9c0 3b04 	strd	r3, fp, [r0, #16]
c0de3466:	9b2c      	ldr	r3, [sp, #176]	@ 0xb0
c0de3468:	e9c0 7a02 	strd	r7, sl, [r0, #8]
c0de346c:	e9c0 3c06 	strd	r3, ip, [r0, #24]
c0de3470:	b02e      	add	sp, #184	@ 0xb8
c0de3472:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de3476 <fe25519_sq>:
c0de3476:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de347a:	b0a4      	sub	sp, #144	@ 0x90
c0de347c:	694a      	ldr	r2, [r1, #20]
c0de347e:	e9d1 7c00 	ldrd	r7, ip, [r1]
c0de3482:	f101 0e08 	add.w	lr, r1, #8
c0de3486:	e89e 4120 	ldmia.w	lr, {r5, r8, lr}
c0de348a:	921c      	str	r2, [sp, #112]	@ 0x70
c0de348c:	ea4f 024e 	mov.w	r2, lr, lsl #1
c0de3490:	ea4f 0b47 	mov.w	fp, r7, lsl #1
c0de3494:	9209      	str	r2, [sp, #36]	@ 0x24
c0de3496:	fb87 2407 	smull	r2, r4, r7, r7
c0de349a:	ea4f 034c 	mov.w	r3, ip, lsl #1
c0de349e:	920f      	str	r2, [sp, #60]	@ 0x3c
c0de34a0:	fb8b 270c 	smull	r2, r7, fp, ip
c0de34a4:	006e      	lsls	r6, r5, #1
c0de34a6:	e9cd 2716 	strd	r2, r7, [sp, #88]	@ 0x58
c0de34aa:	fb83 270c 	smull	r2, r7, r3, ip
c0de34ae:	f8cd b038 	str.w	fp, [sp, #56]	@ 0x38
c0de34b2:	9220      	str	r2, [sp, #128]	@ 0x80
c0de34b4:	9723      	str	r7, [sp, #140]	@ 0x8c
c0de34b6:	462a      	mov	r2, r5
c0de34b8:	9501      	str	r5, [sp, #4]
c0de34ba:	fb83 5705 	smull	r5, r7, r3, r5
c0de34be:	469b      	mov	fp, r3
c0de34c0:	930a      	str	r3, [sp, #40]	@ 0x28
c0de34c2:	fb86 3c08 	smull	r3, ip, r6, r8
c0de34c6:	ea4f 0a48 	mov.w	sl, r8, lsl #1
c0de34ca:	e9cd 5711 	strd	r5, r7, [sp, #68]	@ 0x44
c0de34ce:	fb82 2702 	smull	r2, r7, r2, r2
c0de34d2:	960b      	str	r6, [sp, #44]	@ 0x2c
c0de34d4:	e9cd c31e 	strd	ip, r3, [sp, #120]	@ 0x78
c0de34d8:	fb8e 3606 	smull	r3, r6, lr, r6
c0de34dc:	921d      	str	r2, [sp, #116]	@ 0x74
c0de34de:	9322      	str	r3, [sp, #136]	@ 0x88
c0de34e0:	fb8a 320e 	smull	r3, r2, sl, lr
c0de34e4:	e9cd 3214 	strd	r3, r2, [sp, #80]	@ 0x50
c0de34e8:	fb8e 230e 	smull	r2, r3, lr, lr
c0de34ec:	4655      	mov	r5, sl
c0de34ee:	9221      	str	r2, [sp, #132]	@ 0x84
c0de34f0:	f8dd a070 	ldr.w	sl, [sp, #112]	@ 0x70
c0de34f4:	9a09      	ldr	r2, [sp, #36]	@ 0x24
c0de34f6:	9318      	str	r3, [sp, #96]	@ 0x60
c0de34f8:	fb82 230a 	smull	r2, r3, r2, sl
c0de34fc:	f8cd 8014 	str.w	r8, [sp, #20]
c0de3500:	9613      	str	r6, [sp, #76]	@ 0x4c
c0de3502:	4676      	mov	r6, lr
c0de3504:	e9cd 321a 	strd	r3, r2, [sp, #104]	@ 0x68
c0de3508:	2226      	movs	r2, #38	@ 0x26
c0de350a:	f8dd 803c 	ldr.w	r8, [sp, #60]	@ 0x3c
c0de350e:	f8dd e074 	ldr.w	lr, [sp, #116]	@ 0x74
c0de3512:	fb0a f302 	mul.w	r3, sl, r2
c0de3516:	fbc3 840a 	smlal	r8, r4, r3, sl
c0de351a:	46aa      	mov	sl, r5
c0de351c:	9508      	str	r5, [sp, #32]
c0de351e:	fbc5 e70b 	smlal	lr, r7, r5, fp
c0de3522:	69ca      	ldr	r2, [r1, #28]
c0de3524:	9d0e      	ldr	r5, [sp, #56]	@ 0x38
c0de3526:	f04f 0c26 	mov.w	ip, #38	@ 0x26
c0de352a:	fbc6 e705 	smlal	lr, r7, r6, r5
c0de352e:	46b3      	mov	fp, r6
c0de3530:	9603      	str	r6, [sp, #12]
c0de3532:	fb02 fc0c 	mul.w	ip, r2, ip
c0de3536:	698e      	ldr	r6, [r1, #24]
c0de3538:	6a0b      	ldr	r3, [r1, #32]
c0de353a:	920c      	str	r2, [sp, #48]	@ 0x30
c0de353c:	fbcc e702 	smlal	lr, r7, ip, r2
c0de3540:	6a4a      	ldr	r2, [r1, #36]	@ 0x24
c0de3542:	2113      	movs	r1, #19
c0de3544:	9410      	str	r4, [sp, #64]	@ 0x40
c0de3546:	4674      	mov	r4, lr
c0de3548:	930d      	str	r3, [sp, #52]	@ 0x34
c0de354a:	ea4f 0e46 	mov.w	lr, r6, lsl #1
c0de354e:	434b      	muls	r3, r1
c0de3550:	fbc3 470e 	smlal	r4, r7, r3, lr
c0de3554:	2126      	movs	r1, #38	@ 0x26
c0de3556:	9300      	str	r3, [sp, #0]
c0de3558:	9719      	str	r7, [sp, #100]	@ 0x64
c0de355a:	fb02 f301 	mul.w	r3, r2, r1
c0de355e:	9f20      	ldr	r7, [sp, #128]	@ 0x80
c0de3560:	9923      	ldr	r1, [sp, #140]	@ 0x8c
c0de3562:	f8dd e004 	ldr.w	lr, [sp, #4]
c0de3566:	941d      	str	r4, [sp, #116]	@ 0x74
c0de3568:	fbce 7105 	smlal	r7, r1, lr, r5
c0de356c:	9123      	str	r1, [sp, #140]	@ 0x8c
c0de356e:	991c      	ldr	r1, [sp, #112]	@ 0x70
c0de3570:	9206      	str	r2, [sp, #24]
c0de3572:	004c      	lsls	r4, r1, #1
c0de3574:	2113      	movs	r1, #19
c0de3576:	fb06 f501 	mul.w	r5, r6, r1
c0de357a:	e9dd 1216 	ldrd	r1, r2, [sp, #88]	@ 0x58
c0de357e:	9304      	str	r3, [sp, #16]
c0de3580:	fbc5 1204 	smlal	r1, r2, r5, r4
c0de3584:	fbcc 120b 	smlal	r1, r2, ip, fp
c0de3588:	46e3      	mov	fp, ip
c0de358a:	f8dd c000 	ldr.w	ip, [sp]
c0de358e:	9607      	str	r6, [sp, #28]
c0de3590:	fbcc 120a 	smlal	r1, r2, ip, sl
c0de3594:	fbc3 120e 	smlal	r1, r2, r3, lr
c0de3598:	e9cd 1216 	strd	r1, r2, [sp, #88]	@ 0x58
c0de359c:	9a09      	ldr	r2, [sp, #36]	@ 0x24
c0de359e:	f8dd a040 	ldr.w	sl, [sp, #64]	@ 0x40
c0de35a2:	4629      	mov	r1, r5
c0de35a4:	fbc5 8a02 	smlal	r8, sl, r5, r2
c0de35a8:	9d23      	ldr	r5, [sp, #140]	@ 0x8c
c0de35aa:	4643      	mov	r3, r8
c0de35ac:	46b8      	mov	r8, r7
c0de35ae:	fbc1 8506 	smlal	r8, r5, r1, r6
c0de35b2:	fbcb 8504 	smlal	r8, r5, fp, r4
c0de35b6:	fbcc 8502 	smlal	r8, r5, ip, r2
c0de35ba:	9402      	str	r4, [sp, #8]
c0de35bc:	4664      	mov	r4, ip
c0de35be:	f8cd 8080 	str.w	r8, [sp, #128]	@ 0x80
c0de35c2:	9523      	str	r5, [sp, #140]	@ 0x8c
c0de35c4:	f8dd e038 	ldr.w	lr, [sp, #56]	@ 0x38
c0de35c8:	e9dd c511 	ldrd	ip, r5, [sp, #68]	@ 0x44
c0de35cc:	9e05      	ldr	r6, [sp, #20]
c0de35ce:	f8dd 804c 	ldr.w	r8, [sp, #76]	@ 0x4c
c0de35d2:	9a08      	ldr	r2, [sp, #32]
c0de35d4:	9f22      	ldr	r7, [sp, #136]	@ 0x88
c0de35d6:	990b      	ldr	r1, [sp, #44]	@ 0x2c
c0de35d8:	fbc6 c50e 	smlal	ip, r5, r6, lr
c0de35dc:	fbc2 7806 	smlal	r7, r8, r2, r6
c0de35e0:	fbcb 3a02 	smlal	r3, sl, fp, r2
c0de35e4:	9e07      	ldr	r6, [sp, #28]
c0de35e6:	fbc4 3a01 	smlal	r3, sl, r4, r1
c0de35ea:	fbcb c506 	smlal	ip, r5, fp, r6
c0de35ee:	e9cd 3a0f 	strd	r3, sl, [sp, #60]	@ 0x3c
c0de35f2:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de35f4:	e9dd 231e 	ldrd	r2, r3, [sp, #120]	@ 0x78
c0de35f8:	f8dd b00c 	ldr.w	fp, [sp, #12]
c0de35fc:	9722      	str	r7, [sp, #136]	@ 0x88
c0de35fe:	9f1c      	ldr	r7, [sp, #112]	@ 0x70
c0de3600:	f8dd a030 	ldr.w	sl, [sp, #48]	@ 0x30
c0de3604:	fbcb 3201 	smlal	r3, r2, fp, r1
c0de3608:	fbc7 320e 	smlal	r3, r2, r7, lr
c0de360c:	ea4f 074a 	mov.w	r7, sl, lsl #1
c0de3610:	fbc4 3207 	smlal	r3, r2, r4, r7
c0de3614:	9709      	str	r7, [sp, #36]	@ 0x24
c0de3616:	e9cd 231e 	strd	r2, r3, [sp, #120]	@ 0x78
c0de361a:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de361c:	9f02      	ldr	r7, [sp, #8]
c0de361e:	fbc7 2801 	smlal	r2, r8, r7, r1
c0de3622:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de3624:	fbc6 280e 	smlal	r2, r8, r6, lr
c0de3628:	fbc4 2801 	smlal	r2, r8, r4, r1
c0de362c:	9222      	str	r2, [sp, #136]	@ 0x88
c0de362e:	9e0b      	ldr	r6, [sp, #44]	@ 0x2c
c0de3630:	e9dd 1314 	ldrd	r1, r3, [sp, #80]	@ 0x50
c0de3634:	9a1c      	ldr	r2, [sp, #112]	@ 0x70
c0de3636:	fbc4 c507 	smlal	ip, r5, r4, r7
c0de363a:	f8dd e010 	ldr.w	lr, [sp, #16]
c0de363e:	fbc2 1306 	smlal	r1, r3, r2, r6
c0de3642:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de3644:	9c1d      	ldr	r4, [sp, #116]	@ 0x74
c0de3646:	fbce c50b 	smlal	ip, r5, lr, fp
c0de364a:	fbce 4207 	smlal	r4, r2, lr, r7
c0de364e:	46ba      	mov	sl, r7
c0de3650:	e9cd c511 	strd	ip, r5, [sp, #68]	@ 0x44
c0de3654:	9219      	str	r2, [sp, #100]	@ 0x64
c0de3656:	f8dd c060 	ldr.w	ip, [sp, #96]	@ 0x60
c0de365a:	9a21      	ldr	r2, [sp, #132]	@ 0x84
c0de365c:	9f07      	ldr	r7, [sp, #28]
c0de365e:	941d      	str	r4, [sp, #116]	@ 0x74
c0de3660:	9c08      	ldr	r4, [sp, #32]
c0de3662:	fbc7 2c06 	smlal	r2, ip, r7, r6
c0de3666:	fbca 2c04 	smlal	r2, ip, sl, r4
c0de366a:	4693      	mov	fp, r2
c0de366c:	9a23      	ldr	r2, [sp, #140]	@ 0x8c
c0de366e:	9d20      	ldr	r5, [sp, #128]	@ 0x80
c0de3670:	f8cd 804c 	str.w	r8, [sp, #76]	@ 0x4c
c0de3674:	fbce 5204 	smlal	r5, r2, lr, r4
c0de3678:	9223      	str	r2, [sp, #140]	@ 0x8c
c0de367a:	e9dd 821a 	ldrd	r8, r2, [sp, #104]	@ 0x68
c0de367e:	9520      	str	r5, [sp, #128]	@ 0x80
c0de3680:	fbc7 2804 	smlal	r2, r8, r7, r4
c0de3684:	e9dd 541e 	ldrd	r5, r4, [sp, #120]	@ 0x78
c0de3688:	f8dd a04c 	ldr.w	sl, [sp, #76]	@ 0x4c
c0de368c:	fbce 4507 	smlal	r4, r5, lr, r7
c0de3690:	e9cd 541e 	strd	r5, r4, [sp, #120]	@ 0x78
c0de3694:	9d0a      	ldr	r5, [sp, #40]	@ 0x28
c0de3696:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de3698:	fbc7 1305 	smlal	r1, r3, r7, r5
c0de369c:	9f0c      	ldr	r7, [sp, #48]	@ 0x30
c0de369e:	fbc4 bc05 	smlal	fp, ip, r4, r5
c0de36a2:	fbc7 2806 	smlal	r2, r8, r7, r6
c0de36a6:	9e0e      	ldr	r6, [sp, #56]	@ 0x38
c0de36a8:	f8cd b084 	str.w	fp, [sp, #132]	@ 0x84
c0de36ac:	fbc7 1306 	smlal	r1, r3, r7, r6
c0de36b0:	9f22      	ldr	r7, [sp, #136]	@ 0x88
c0de36b2:	fbce 7a04 	smlal	r7, sl, lr, r4
c0de36b6:	9722      	str	r7, [sp, #136]	@ 0x88
c0de36b8:	e9dd b40f 	ldrd	fp, r4, [sp, #60]	@ 0x3c
c0de36bc:	9f0d      	ldr	r7, [sp, #52]	@ 0x34
c0de36be:	fbce b405 	smlal	fp, r4, lr, r5
c0de36c2:	fbc7 2805 	smlal	r2, r8, r7, r5
c0de36c6:	fbce 1307 	smlal	r1, r3, lr, r7
c0de36ca:	9d21      	ldr	r5, [sp, #132]	@ 0x84
c0de36cc:	e9cd 1314 	strd	r1, r3, [sp, #80]	@ 0x50
c0de36d0:	9906      	ldr	r1, [sp, #24]
c0de36d2:	fbc7 5c06 	smlal	r5, ip, r7, r6
c0de36d6:	fbce 5c01 	smlal	r5, ip, lr, r1
c0de36da:	fbc1 2806 	smlal	r2, r8, r1, r6
c0de36de:	f11b 7100 	adds.w	r1, fp, #33554432	@ 0x2000000
c0de36e2:	e9cd 821a 	strd	r8, r2, [sp, #104]	@ 0x68
c0de36e6:	f144 0200 	adc.w	r2, r4, #0
c0de36ea:	0e8b      	lsrs	r3, r1, #26
c0de36ec:	9f16      	ldr	r7, [sp, #88]	@ 0x58
c0de36ee:	ea43 1382 	orr.w	r3, r3, r2, lsl #6
c0de36f2:	f8cd c060 	str.w	ip, [sp, #96]	@ 0x60
c0de36f6:	eb17 0c03 	adds.w	ip, r7, r3
c0de36fa:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
c0de36fc:	f001 417c 	and.w	r1, r1, #4227858432	@ 0xfc000000
c0de3700:	eb43 63a2 	adc.w	r3, r3, r2, asr #26
c0de3704:	ebbb 0101 	subs.w	r1, fp, r1
c0de3708:	9f1d      	ldr	r7, [sp, #116]	@ 0x74
c0de370a:	911c      	str	r1, [sp, #112]	@ 0x70
c0de370c:	eb64 0102 	sbc.w	r1, r4, r2
c0de3710:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de3712:	9521      	str	r5, [sp, #132]	@ 0x84
c0de3714:	f117 7500 	adds.w	r5, r7, #33554432	@ 0x2000000
c0de3718:	9117      	str	r1, [sp, #92]	@ 0x5c
c0de371a:	f142 0400 	adc.w	r4, r2, #0
c0de371e:	0eae      	lsrs	r6, r5, #26
c0de3720:	991f      	ldr	r1, [sp, #124]	@ 0x7c
c0de3722:	ea46 1684 	orr.w	r6, r6, r4, lsl #6
c0de3726:	1876      	adds	r6, r6, r1
c0de3728:	991e      	ldr	r1, [sp, #120]	@ 0x78
c0de372a:	f005 457c 	and.w	r5, r5, #4227858432	@ 0xfc000000
c0de372e:	eb41 61a4 	adc.w	r1, r1, r4, asr #26
c0de3732:	ebb7 0805 	subs.w	r8, r7, r5
c0de3736:	eb62 0404 	sbc.w	r4, r2, r4
c0de373a:	f11c 7280 	adds.w	r2, ip, #16777216	@ 0x1000000
c0de373e:	921e      	str	r2, [sp, #120]	@ 0x78
c0de3740:	f143 0300 	adc.w	r3, r3, #0
c0de3744:	0e57      	lsrs	r7, r2, #25
c0de3746:	9a20      	ldr	r2, [sp, #128]	@ 0x80
c0de3748:	ea47 17c3 	orr.w	r7, r7, r3, lsl #7
c0de374c:	19d5      	adds	r5, r2, r7
c0de374e:	9a23      	ldr	r2, [sp, #140]	@ 0x8c
c0de3750:	9f22      	ldr	r7, [sp, #136]	@ 0x88
c0de3752:	eb42 6363 	adc.w	r3, r2, r3, asr #25
c0de3756:	f116 7280 	adds.w	r2, r6, #16777216	@ 0x1000000
c0de375a:	f141 0100 	adc.w	r1, r1, #0
c0de375e:	ea4f 6e52 	mov.w	lr, r2, lsr #25
c0de3762:	9223      	str	r2, [sp, #140]	@ 0x8c
c0de3764:	ea4e 12c1 	orr.w	r2, lr, r1, lsl #7
c0de3768:	18bf      	adds	r7, r7, r2
c0de376a:	eb4a 6161 	adc.w	r1, sl, r1, asr #25
c0de376e:	f115 7200 	adds.w	r2, r5, #33554432	@ 0x2000000
c0de3772:	9219      	str	r2, [sp, #100]	@ 0x64
c0de3774:	f143 0300 	adc.w	r3, r3, #0
c0de3778:	ea4f 6b92 	mov.w	fp, r2, lsr #26
c0de377c:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de377e:	961f      	str	r6, [sp, #124]	@ 0x7c
c0de3780:	ea4b 1683 	orr.w	r6, fp, r3, lsl #6
c0de3784:	18b6      	adds	r6, r6, r2
c0de3786:	9a12      	ldr	r2, [sp, #72]	@ 0x48
c0de3788:	9722      	str	r7, [sp, #136]	@ 0x88
c0de378a:	eb42 63a3 	adc.w	r3, r2, r3, asr #26
c0de378e:	f117 7200 	adds.w	r2, r7, #33554432	@ 0x2000000
c0de3792:	9213      	str	r2, [sp, #76]	@ 0x4c
c0de3794:	f141 0100 	adc.w	r1, r1, #0
c0de3798:	ea4f 6a92 	mov.w	sl, r2, lsr #26
c0de379c:	9a14      	ldr	r2, [sp, #80]	@ 0x50
c0de379e:	ea4a 1781 	orr.w	r7, sl, r1, lsl #6
c0de37a2:	18bf      	adds	r7, r7, r2
c0de37a4:	9a15      	ldr	r2, [sp, #84]	@ 0x54
c0de37a6:	f8cd c058 	str.w	ip, [sp, #88]	@ 0x58
c0de37aa:	eb42 61a1 	adc.w	r1, r2, r1, asr #26
c0de37ae:	f116 7e80 	adds.w	lr, r6, #16777216	@ 0x1000000
c0de37b2:	f143 0300 	adc.w	r3, r3, #0
c0de37b6:	ea4f 6c5e 	mov.w	ip, lr, lsr #25
c0de37ba:	9520      	str	r5, [sp, #128]	@ 0x80
c0de37bc:	ea4c 15c3 	orr.w	r5, ip, r3, lsl #7
c0de37c0:	eb15 0a08 	adds.w	sl, r5, r8
c0de37c4:	ea4f 6363 	mov.w	r3, r3, asr #25
c0de37c8:	4163      	adcs	r3, r4
c0de37ca:	f117 7580 	adds.w	r5, r7, #16777216	@ 0x1000000
c0de37ce:	f141 0100 	adc.w	r1, r1, #0
c0de37d2:	ea4f 6855 	mov.w	r8, r5, lsr #25
c0de37d6:	9a21      	ldr	r2, [sp, #132]	@ 0x84
c0de37d8:	ea48 14c1 	orr.w	r4, r8, r1, lsl #7
c0de37dc:	eb12 0804 	adds.w	r8, r2, r4
c0de37e0:	9a18      	ldr	r2, [sp, #96]	@ 0x60
c0de37e2:	961d      	str	r6, [sp, #116]	@ 0x74
c0de37e4:	eb42 6161 	adc.w	r1, r2, r1, asr #25
c0de37e8:	f11a 7400 	adds.w	r4, sl, #33554432	@ 0x2000000
c0de37ec:	f143 0200 	adc.w	r2, r3, #0
c0de37f0:	f118 7c00 	adds.w	ip, r8, #33554432	@ 0x2000000
c0de37f4:	9221      	str	r2, [sp, #132]	@ 0x84
c0de37f6:	f141 0100 	adc.w	r1, r1, #0
c0de37fa:	ea4f 639c 	mov.w	r3, ip, lsr #26
c0de37fe:	9a1b      	ldr	r2, [sp, #108]	@ 0x6c
c0de3800:	ea43 1381 	orr.w	r3, r3, r1, lsl #6
c0de3804:	189b      	adds	r3, r3, r2
c0de3806:	9a1a      	ldr	r2, [sp, #104]	@ 0x68
c0de3808:	9714      	str	r7, [sp, #80]	@ 0x50
c0de380a:	eb42 62a1 	adc.w	r2, r2, r1, asr #26
c0de380e:	f113 7180 	adds.w	r1, r3, #16777216	@ 0x1000000
c0de3812:	f142 0200 	adc.w	r2, r2, #0
c0de3816:	ea4f 6b51 	mov.w	fp, r1, lsr #25
c0de381a:	ea4b 16c2 	orr.w	r6, fp, r2, lsl #7
c0de381e:	2713      	movs	r7, #19
c0de3820:	fba6 b607 	umull	fp, r6, r6, r7
c0de3824:	2713      	movs	r7, #19
c0de3826:	1652      	asrs	r2, r2, #25
c0de3828:	fb02 6207 	mla	r2, r2, r7, r6
c0de382c:	f8cd b06c 	str.w	fp, [sp, #108]	@ 0x6c
c0de3830:	921a      	str	r2, [sp, #104]	@ 0x68
c0de3832:	9a1e      	ldr	r2, [sp, #120]	@ 0x78
c0de3834:	f00e 477e 	and.w	r7, lr, #4261412864	@ 0xfe000000
c0de3838:	f002 467e 	and.w	r6, r2, #4261412864	@ 0xfe000000
c0de383c:	9a16      	ldr	r2, [sp, #88]	@ 0x58
c0de383e:	f005 457e 	and.w	r5, r5, #4261412864	@ 0xfe000000
c0de3842:	1b92      	subs	r2, r2, r6
c0de3844:	921e      	str	r2, [sp, #120]	@ 0x78
c0de3846:	9a23      	ldr	r2, [sp, #140]	@ 0x8c
c0de3848:	f001 417e 	and.w	r1, r1, #4261412864	@ 0xfe000000
c0de384c:	f002 467e 	and.w	r6, r2, #4261412864	@ 0xfe000000
c0de3850:	9a1f      	ldr	r2, [sp, #124]	@ 0x7c
c0de3852:	1a59      	subs	r1, r3, r1
c0de3854:	1b96      	subs	r6, r2, r6
c0de3856:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de3858:	f002 4b7c 	and.w	fp, r2, #4227858432	@ 0xfc000000
c0de385c:	9a20      	ldr	r2, [sp, #128]	@ 0x80
c0de385e:	eba2 020b 	sub.w	r2, r2, fp
c0de3862:	9220      	str	r2, [sp, #128]	@ 0x80
c0de3864:	9a13      	ldr	r2, [sp, #76]	@ 0x4c
c0de3866:	f002 4b7c 	and.w	fp, r2, #4227858432	@ 0xfc000000
c0de386a:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de386c:	eba2 020b 	sub.w	r2, r2, fp
c0de3870:	9223      	str	r2, [sp, #140]	@ 0x8c
c0de3872:	9a1d      	ldr	r2, [sp, #116]	@ 0x74
c0de3874:	eba2 0b07 	sub.w	fp, r2, r7
c0de3878:	9a14      	ldr	r2, [sp, #80]	@ 0x50
c0de387a:	eba2 0e05 	sub.w	lr, r2, r5
c0de387e:	9a21      	ldr	r2, [sp, #132]	@ 0x84
c0de3880:	0ea5      	lsrs	r5, r4, #26
c0de3882:	ea45 1582 	orr.w	r5, r5, r2, lsl #6
c0de3886:	f004 447c 	and.w	r4, r4, #4227858432	@ 0xfc000000
c0de388a:	e9dd 271b 	ldrd	r2, r7, [sp, #108]	@ 0x6c
c0de388e:	4435      	add	r5, r6
c0de3890:	ebaa 0604 	sub.w	r6, sl, r4
c0de3894:	f00c 447c 	and.w	r4, ip, #4227858432	@ 0xfc000000
c0de3898:	eba8 0c04 	sub.w	ip, r8, r4
c0de389c:	19d4      	adds	r4, r2, r7
c0de389e:	9f17      	ldr	r7, [sp, #92]	@ 0x5c
c0de38a0:	9a1a      	ldr	r2, [sp, #104]	@ 0x68
c0de38a2:	e9c0 6504 	strd	r6, r5, [r0, #16]
c0de38a6:	417a      	adcs	r2, r7
c0de38a8:	f114 7300 	adds.w	r3, r4, #33554432	@ 0x2000000
c0de38ac:	f142 0200 	adc.w	r2, r2, #0
c0de38b0:	0e9f      	lsrs	r7, r3, #26
c0de38b2:	ea47 1282 	orr.w	r2, r7, r2, lsl #6
c0de38b6:	9f1e      	ldr	r7, [sp, #120]	@ 0x78
c0de38b8:	f003 437c 	and.w	r3, r3, #4227858432	@ 0xfc000000
c0de38bc:	443a      	add	r2, r7
c0de38be:	1ae3      	subs	r3, r4, r3
c0de38c0:	e9c0 3200 	strd	r3, r2, [r0]
c0de38c4:	9a20      	ldr	r2, [sp, #128]	@ 0x80
c0de38c6:	e9c0 c108 	strd	ip, r1, [r0, #32]
c0de38ca:	e9c0 2b02 	strd	r2, fp, [r0, #8]
c0de38ce:	9a23      	ldr	r2, [sp, #140]	@ 0x8c
c0de38d0:	e9c0 2e06 	strd	r2, lr, [r0, #24]
c0de38d4:	b024      	add	sp, #144	@ 0x90
c0de38d6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de38da <fe25519_frombytes>:
c0de38da:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de38de:	b087      	sub	sp, #28
c0de38e0:	780a      	ldrb	r2, [r1, #0]
c0de38e2:	784b      	ldrb	r3, [r1, #1]
c0de38e4:	788f      	ldrb	r7, [r1, #2]
c0de38e6:	78ce      	ldrb	r6, [r1, #3]
c0de38e8:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de38ec:	ea42 4207 	orr.w	r2, r2, r7, lsl #16
c0de38f0:	7f8f      	ldrb	r7, [r1, #30]
c0de38f2:	ea42 6206 	orr.w	r2, r2, r6, lsl #24
c0de38f6:	7f4b      	ldrb	r3, [r1, #29]
c0de38f8:	7fce      	ldrb	r6, [r1, #31]
c0de38fa:	02bf      	lsls	r7, r7, #10
c0de38fc:	ea47 0383 	orr.w	r3, r7, r3, lsl #2
c0de3900:	f006 077f 	and.w	r7, r6, #127	@ 0x7f
c0de3904:	ea43 4387 	orr.w	r3, r3, r7, lsl #18
c0de3908:	9306      	str	r3, [sp, #24]
c0de390a:	f103 7380 	add.w	r3, r3, #16777216	@ 0x1000000
c0de390e:	9305      	str	r3, [sp, #20]
c0de3910:	0e5c      	lsrs	r4, r3, #25
c0de3912:	2513      	movs	r5, #19
c0de3914:	2300      	movs	r3, #0
c0de3916:	fbe4 2305 	umlal	r2, r3, r4, r5
c0de391a:	794d      	ldrb	r5, [r1, #5]
c0de391c:	790c      	ldrb	r4, [r1, #4]
c0de391e:	798e      	ldrb	r6, [r1, #6]
c0de3920:	03ad      	lsls	r5, r5, #14
c0de3922:	ea45 1484 	orr.w	r4, r5, r4, lsl #6
c0de3926:	7a0d      	ldrb	r5, [r1, #8]
c0de3928:	ea44 5786 	orr.w	r7, r4, r6, lsl #22
c0de392c:	79cc      	ldrb	r4, [r1, #7]
c0de392e:	7a4e      	ldrb	r6, [r1, #9]
c0de3930:	036d      	lsls	r5, r5, #13
c0de3932:	ea45 1444 	orr.w	r4, r5, r4, lsl #5
c0de3936:	7acd      	ldrb	r5, [r1, #11]
c0de3938:	ea44 5b46 	orr.w	fp, r4, r6, lsl #21
c0de393c:	7a8c      	ldrb	r4, [r1, #10]
c0de393e:	7b0e      	ldrb	r6, [r1, #12]
c0de3940:	02ed      	lsls	r5, r5, #11
c0de3942:	ea45 04c4 	orr.w	r4, r5, r4, lsl #3
c0de3946:	ea44 4ac6 	orr.w	sl, r4, r6, lsl #19
c0de394a:	7b8e      	ldrb	r6, [r1, #14]
c0de394c:	7b4d      	ldrb	r5, [r1, #13]
c0de394e:	02b6      	lsls	r6, r6, #10
c0de3950:	ea46 0585 	orr.w	r5, r6, r5, lsl #2
c0de3954:	7c0e      	ldrb	r6, [r1, #16]
c0de3956:	f891 8011 	ldrb.w	r8, [r1, #17]
c0de395a:	9204      	str	r2, [sp, #16]
c0de395c:	7bca      	ldrb	r2, [r1, #15]
c0de395e:	ea46 2808 	orr.w	r8, r6, r8, lsl #8
c0de3962:	7c8e      	ldrb	r6, [r1, #18]
c0de3964:	ea45 4282 	orr.w	r2, r5, r2, lsl #18
c0de3968:	7ccd      	ldrb	r5, [r1, #19]
c0de396a:	ea48 4606 	orr.w	r6, r8, r6, lsl #16
c0de396e:	ea46 6405 	orr.w	r4, r6, r5, lsl #24
c0de3972:	7d4d      	ldrb	r5, [r1, #21]
c0de3974:	7d0e      	ldrb	r6, [r1, #20]
c0de3976:	9203      	str	r2, [sp, #12]
c0de3978:	7d8a      	ldrb	r2, [r1, #22]
c0de397a:	03ed      	lsls	r5, r5, #15
c0de397c:	ea45 15c6 	orr.w	r5, r5, r6, lsl #7
c0de3980:	ea45 5cc2 	orr.w	ip, r5, r2, lsl #23
c0de3984:	7e0d      	ldrb	r5, [r1, #24]
c0de3986:	7dce      	ldrb	r6, [r1, #23]
c0de3988:	036d      	lsls	r5, r5, #13
c0de398a:	7e4a      	ldrb	r2, [r1, #25]
c0de398c:	ea45 1546 	orr.w	r5, r5, r6, lsl #5
c0de3990:	ea45 5842 	orr.w	r8, r5, r2, lsl #21
c0de3994:	7ecd      	ldrb	r5, [r1, #27]
c0de3996:	7e8a      	ldrb	r2, [r1, #26]
c0de3998:	7f09      	ldrb	r1, [r1, #28]
c0de399a:	032d      	lsls	r5, r5, #12
c0de399c:	ea45 1202 	orr.w	r2, r5, r2, lsl #4
c0de39a0:	ea42 5101 	orr.w	r1, r2, r1, lsl #20
c0de39a4:	f107 7280 	add.w	r2, r7, #16777216	@ 0x1000000
c0de39a8:	eb0b 6552 	add.w	r5, fp, r2, lsr #25
c0de39ac:	f002 42fc 	and.w	r2, r2, #2113929216	@ 0x7e000000
c0de39b0:	eba7 0b02 	sub.w	fp, r7, r2
c0de39b4:	2700      	movs	r7, #0
c0de39b6:	f114 7280 	adds.w	r2, r4, #16777216	@ 0x1000000
c0de39ba:	9102      	str	r1, [sp, #8]
c0de39bc:	f147 0100 	adc.w	r1, r7, #0
c0de39c0:	ea4f 6e52 	mov.w	lr, r2, lsr #25
c0de39c4:	ea4e 11c1 	orr.w	r1, lr, r1, lsl #7
c0de39c8:	f8dd e010 	ldr.w	lr, [sp, #16]
c0de39cc:	448c      	add	ip, r1
c0de39ce:	f11e 7100 	adds.w	r1, lr, #33554432	@ 0x2000000
c0de39d2:	9400      	str	r4, [sp, #0]
c0de39d4:	f143 0300 	adc.w	r3, r3, #0
c0de39d8:	0e8c      	lsrs	r4, r1, #26
c0de39da:	ea44 1383 	orr.w	r3, r4, r3, lsl #6
c0de39de:	f001 417c 	and.w	r1, r1, #4227858432	@ 0xfc000000
c0de39e2:	445b      	add	r3, fp
c0de39e4:	ebae 0101 	sub.w	r1, lr, r1
c0de39e8:	f115 7400 	adds.w	r4, r5, #33554432	@ 0x2000000
c0de39ec:	9301      	str	r3, [sp, #4]
c0de39ee:	9104      	str	r1, [sp, #16]
c0de39f0:	f147 0300 	adc.w	r3, r7, #0
c0de39f4:	0ea1      	lsrs	r1, r4, #26
c0de39f6:	9e03      	ldr	r6, [sp, #12]
c0de39f8:	ea41 1183 	orr.w	r1, r1, r3, lsl #6
c0de39fc:	f10a 7380 	add.w	r3, sl, #16777216	@ 0x1000000
c0de3a00:	4451      	add	r1, sl
c0de3a02:	eb06 6a53 	add.w	sl, r6, r3, lsr #25
c0de3a06:	f003 6360 	and.w	r3, r3, #234881024	@ 0xe000000
c0de3a0a:	1ac9      	subs	r1, r1, r3
c0de3a0c:	f004 437c 	and.w	r3, r4, #4227858432	@ 0xfc000000
c0de3a10:	f11a 7400 	adds.w	r4, sl, #33554432	@ 0x2000000
c0de3a14:	9103      	str	r1, [sp, #12]
c0de3a16:	eba5 0b03 	sub.w	fp, r5, r3
c0de3a1a:	f147 0500 	adc.w	r5, r7, #0
c0de3a1e:	ea4f 6e94 	mov.w	lr, r4, lsr #26
c0de3a22:	9900      	ldr	r1, [sp, #0]
c0de3a24:	ea4e 1585 	orr.w	r5, lr, r5, lsl #6
c0de3a28:	440d      	add	r5, r1
c0de3a2a:	f002 427e 	and.w	r2, r2, #4261412864	@ 0xfe000000
c0de3a2e:	eba5 0e02 	sub.w	lr, r5, r2
c0de3a32:	f004 457c 	and.w	r5, r4, #4227858432	@ 0xfc000000
c0de3a36:	f11c 7400 	adds.w	r4, ip, #33554432	@ 0x2000000
c0de3a3a:	f147 0200 	adc.w	r2, r7, #0
c0de3a3e:	0ea1      	lsrs	r1, r4, #26
c0de3a40:	9b02      	ldr	r3, [sp, #8]
c0de3a42:	ea41 1182 	orr.w	r1, r1, r2, lsl #6
c0de3a46:	f108 7280 	add.w	r2, r8, #16777216	@ 0x1000000
c0de3a4a:	4441      	add	r1, r8
c0de3a4c:	eb03 6652 	add.w	r6, r3, r2, lsr #25
c0de3a50:	f002 5278 	and.w	r2, r2, #1040187392	@ 0x3e000000
c0de3a54:	1a89      	subs	r1, r1, r2
c0de3a56:	f004 427c 	and.w	r2, r4, #4227858432	@ 0xfc000000
c0de3a5a:	f116 7400 	adds.w	r4, r6, #33554432	@ 0x2000000
c0de3a5e:	f147 0700 	adc.w	r7, r7, #0
c0de3a62:	0ea3      	lsrs	r3, r4, #26
c0de3a64:	ea43 1387 	orr.w	r3, r3, r7, lsl #6
c0de3a68:	9f06      	ldr	r7, [sp, #24]
c0de3a6a:	ebaa 0505 	sub.w	r5, sl, r5
c0de3a6e:	443b      	add	r3, r7
c0de3a70:	9f05      	ldr	r7, [sp, #20]
c0de3a72:	ebac 0202 	sub.w	r2, ip, r2
c0de3a76:	f007 7700 	and.w	r7, r7, #33554432	@ 0x2000000
c0de3a7a:	1bdb      	subs	r3, r3, r7
c0de3a7c:	f004 477c 	and.w	r7, r4, #4227858432	@ 0xfc000000
c0de3a80:	1bf7      	subs	r7, r6, r7
c0de3a82:	9e04      	ldr	r6, [sp, #16]
c0de3a84:	e9c0 e205 	strd	lr, r2, [r0, #20]
c0de3a88:	6006      	str	r6, [r0, #0]
c0de3a8a:	9e01      	ldr	r6, [sp, #4]
c0de3a8c:	e9c0 1707 	strd	r1, r7, [r0, #28]
c0de3a90:	e9c0 6b01 	strd	r6, fp, [r0, #4]
c0de3a94:	9e03      	ldr	r6, [sp, #12]
c0de3a96:	6243      	str	r3, [r0, #36]	@ 0x24
c0de3a98:	e9c0 6503 	strd	r6, r5, [r0, #12]
c0de3a9c:	b007      	add	sp, #28
c0de3a9e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de3aa2 <fe25519_reduce>:
c0de3aa2:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3aa6:	e891 00e0 	ldmia.w	r1, {r5, r6, r7}
c0de3aaa:	f101 0b0c 	add.w	fp, r1, #12
c0de3aae:	e9d1 8e06 	ldrd	r8, lr, [r1, #24]
c0de3ab2:	e9d1 c108 	ldrd	ip, r1, [r1, #32]
c0de3ab6:	f04f 0a13 	mov.w	sl, #19
c0de3aba:	fb01 f30a 	mul.w	r3, r1, sl
c0de3abe:	f103 7380 	add.w	r3, r3, #16777216	@ 0x1000000
c0de3ac2:	eb05 6353 	add.w	r3, r5, r3, lsr #25
c0de3ac6:	e89b 0814 	ldmia.w	fp, {r2, r4, fp}
c0de3aca:	eb06 63a3 	add.w	r3, r6, r3, asr #26
c0de3ace:	eb07 6363 	add.w	r3, r7, r3, asr #25
c0de3ad2:	eb02 63a3 	add.w	r3, r2, r3, asr #26
c0de3ad6:	eb04 6363 	add.w	r3, r4, r3, asr #25
c0de3ada:	eb0b 63a3 	add.w	r3, fp, r3, asr #26
c0de3ade:	eb08 6363 	add.w	r3, r8, r3, asr #25
c0de3ae2:	eb0e 63a3 	add.w	r3, lr, r3, asr #26
c0de3ae6:	eb0c 6363 	add.w	r3, ip, r3, asr #25
c0de3aea:	eb01 63a3 	add.w	r3, r1, r3, asr #26
c0de3aee:	165b      	asrs	r3, r3, #25
c0de3af0:	fb03 530a 	mla	r3, r3, sl, r5
c0de3af4:	eb06 65a3 	add.w	r5, r6, r3, asr #26
c0de3af8:	eb07 6665 	add.w	r6, r7, r5, asr #25
c0de3afc:	eb02 62a6 	add.w	r2, r2, r6, asr #26
c0de3b00:	eb04 6462 	add.w	r4, r4, r2, asr #25
c0de3b04:	eb0b 67a4 	add.w	r7, fp, r4, asr #26
c0de3b08:	f023 4a7c 	bic.w	sl, r3, #4227858432	@ 0xfc000000
c0de3b0c:	eb08 6367 	add.w	r3, r8, r7, asr #25
c0de3b10:	f024 4b7c 	bic.w	fp, r4, #4227858432	@ 0xfc000000
c0de3b14:	eb0e 64a3 	add.w	r4, lr, r3, asr #26
c0de3b18:	f027 487e 	bic.w	r8, r7, #4261412864	@ 0xfe000000
c0de3b1c:	eb0c 6764 	add.w	r7, ip, r4, asr #25
c0de3b20:	f026 467c 	bic.w	r6, r6, #4227858432	@ 0xfc000000
c0de3b24:	f022 427e 	bic.w	r2, r2, #4261412864	@ 0xfe000000
c0de3b28:	eb01 61a7 	add.w	r1, r1, r7, asr #26
c0de3b2c:	f025 457e 	bic.w	r5, r5, #4261412864	@ 0xfe000000
c0de3b30:	f023 437c 	bic.w	r3, r3, #4227858432	@ 0xfc000000
c0de3b34:	f021 417e 	bic.w	r1, r1, #4261412864	@ 0xfe000000
c0de3b38:	e9c0 6202 	strd	r6, r2, [r0, #8]
c0de3b3c:	f100 0218 	add.w	r2, r0, #24
c0de3b40:	f024 447e 	bic.w	r4, r4, #4261412864	@ 0xfe000000
c0de3b44:	f027 477c 	bic.w	r7, r7, #4227858432	@ 0xfc000000
c0de3b48:	e9c0 a500 	strd	sl, r5, [r0]
c0de3b4c:	e9c0 b804 	strd	fp, r8, [r0, #16]
c0de3b50:	c298      	stmia	r2!, {r3, r4, r7}
c0de3b52:	6241      	str	r1, [r0, #36]	@ 0x24
c0de3b54:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de3b58 <fe25519_tobytes>:
c0de3b58:	b510      	push	{r4, lr}
c0de3b5a:	b08a      	sub	sp, #40	@ 0x28
c0de3b5c:	4604      	mov	r4, r0
c0de3b5e:	4668      	mov	r0, sp
c0de3b60:	f7ff ff9f 	bl	c0de3aa2 <fe25519_reduce>
c0de3b64:	e89d 100e 	ldmia.w	sp, {r1, r2, r3, ip}
c0de3b68:	0a08      	lsrs	r0, r1, #8
c0de3b6a:	7060      	strb	r0, [r4, #1]
c0de3b6c:	0c08      	lsrs	r0, r1, #16
c0de3b6e:	70a0      	strb	r0, [r4, #2]
c0de3b70:	0090      	lsls	r0, r2, #2
c0de3b72:	ea40 6011 	orr.w	r0, r0, r1, lsr #24
c0de3b76:	70e0      	strb	r0, [r4, #3]
c0de3b78:	0990      	lsrs	r0, r2, #6
c0de3b7a:	7120      	strb	r0, [r4, #4]
c0de3b7c:	0b90      	lsrs	r0, r2, #14
c0de3b7e:	7160      	strb	r0, [r4, #5]
c0de3b80:	00d8      	lsls	r0, r3, #3
c0de3b82:	ea40 5092 	orr.w	r0, r0, r2, lsr #22
c0de3b86:	71a0      	strb	r0, [r4, #6]
c0de3b88:	0958      	lsrs	r0, r3, #5
c0de3b8a:	71e0      	strb	r0, [r4, #7]
c0de3b8c:	0b58      	lsrs	r0, r3, #13
c0de3b8e:	7220      	strb	r0, [r4, #8]
c0de3b90:	ea4f 104c 	mov.w	r0, ip, lsl #5
c0de3b94:	ea40 5053 	orr.w	r0, r0, r3, lsr #21
c0de3b98:	7021      	strb	r1, [r4, #0]
c0de3b9a:	7260      	strb	r0, [r4, #9]
c0de3b9c:	ea4f 00dc 	mov.w	r0, ip, lsr #3
c0de3ba0:	9904      	ldr	r1, [sp, #16]
c0de3ba2:	72a0      	strb	r0, [r4, #10]
c0de3ba4:	ea4f 20dc 	mov.w	r0, ip, lsr #11
c0de3ba8:	72e0      	strb	r0, [r4, #11]
c0de3baa:	0188      	lsls	r0, r1, #6
c0de3bac:	ea40 40dc 	orr.w	r0, r0, ip, lsr #19
c0de3bb0:	7320      	strb	r0, [r4, #12]
c0de3bb2:	0888      	lsrs	r0, r1, #2
c0de3bb4:	7360      	strb	r0, [r4, #13]
c0de3bb6:	0a88      	lsrs	r0, r1, #10
c0de3bb8:	f10d 0c14 	add.w	ip, sp, #20
c0de3bbc:	73a0      	strb	r0, [r4, #14]
c0de3bbe:	0c88      	lsrs	r0, r1, #18
c0de3bc0:	e89c 100e 	ldmia.w	ip, {r1, r2, r3, ip}
c0de3bc4:	73e0      	strb	r0, [r4, #15]
c0de3bc6:	0a08      	lsrs	r0, r1, #8
c0de3bc8:	7460      	strb	r0, [r4, #17]
c0de3bca:	0c08      	lsrs	r0, r1, #16
c0de3bcc:	74a0      	strb	r0, [r4, #18]
c0de3bce:	0050      	lsls	r0, r2, #1
c0de3bd0:	ea40 6011 	orr.w	r0, r0, r1, lsr #24
c0de3bd4:	74e0      	strb	r0, [r4, #19]
c0de3bd6:	09d0      	lsrs	r0, r2, #7
c0de3bd8:	7520      	strb	r0, [r4, #20]
c0de3bda:	0bd0      	lsrs	r0, r2, #15
c0de3bdc:	7560      	strb	r0, [r4, #21]
c0de3bde:	00d8      	lsls	r0, r3, #3
c0de3be0:	ea40 50d2 	orr.w	r0, r0, r2, lsr #23
c0de3be4:	75a0      	strb	r0, [r4, #22]
c0de3be6:	0958      	lsrs	r0, r3, #5
c0de3be8:	75e0      	strb	r0, [r4, #23]
c0de3bea:	0b58      	lsrs	r0, r3, #13
c0de3bec:	7620      	strb	r0, [r4, #24]
c0de3bee:	ea4f 100c 	mov.w	r0, ip, lsl #4
c0de3bf2:	ea40 5053 	orr.w	r0, r0, r3, lsr #21
c0de3bf6:	7421      	strb	r1, [r4, #16]
c0de3bf8:	7660      	strb	r0, [r4, #25]
c0de3bfa:	ea4f 101c 	mov.w	r0, ip, lsr #4
c0de3bfe:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de3c00:	76a0      	strb	r0, [r4, #26]
c0de3c02:	ea4f 301c 	mov.w	r0, ip, lsr #12
c0de3c06:	76e0      	strb	r0, [r4, #27]
c0de3c08:	0188      	lsls	r0, r1, #6
c0de3c0a:	ea40 501c 	orr.w	r0, r0, ip, lsr #20
c0de3c0e:	7720      	strb	r0, [r4, #28]
c0de3c10:	0888      	lsrs	r0, r1, #2
c0de3c12:	7760      	strb	r0, [r4, #29]
c0de3c14:	0a88      	lsrs	r0, r1, #10
c0de3c16:	77a0      	strb	r0, [r4, #30]
c0de3c18:	0c88      	lsrs	r0, r1, #18
c0de3c1a:	77e0      	strb	r0, [r4, #31]
c0de3c1c:	b00a      	add	sp, #40	@ 0x28
c0de3c1e:	bd10      	pop	{r4, pc}

c0de3c20 <print_amount>:
c0de3c20:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3c24:	b082      	sub	sp, #8
c0de3c26:	4607      	mov	r7, r0
c0de3c28:	f240 0000 	movw	r0, #0
c0de3c2c:	f2c0 0000 	movt	r0, #0
c0de3c30:	460c      	mov	r4, r1
c0de3c32:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de3c34:	4448      	add	r0, r9
c0de3c36:	4615      	mov	r5, r2
c0de3c38:	f200 2001 	addw	r0, r0, #513	@ 0x201
c0de3c3c:	461e      	mov	r6, r3
c0de3c3e:	2a00      	cmp	r2, #0
c0de3c40:	bf08      	it	eq
c0de3c42:	f04f 35ff 	moveq.w	r5, #4294967295	@ 0xffffffff
c0de3c46:	f004 fc31 	bl	c0de84ac <__aeabi_memclr>
c0de3c4a:	ea57 0a04 	orrs.w	sl, r7, r4
c0de3c4e:	bf18      	it	ne
c0de3c50:	f04f 0a01 	movne.w	sl, #1
c0de3c54:	d104      	bne.n	c0de3c60 <print_amount+0x40>
c0de3c56:	f1b5 3fff 	cmp.w	r5, #4294967295	@ 0xffffffff
c0de3c5a:	da01      	bge.n	c0de3c60 <print_amount+0x40>
c0de3c5c:	2000      	movs	r0, #0
c0de3c5e:	e06f      	b.n	c0de3d40 <print_amount+0x120>
c0de3c60:	f240 0000 	movw	r0, #0
c0de3c64:	f2c0 0000 	movt	r0, #0
c0de3c68:	4448      	add	r0, r9
c0de3c6a:	4428      	add	r0, r5
c0de3c6c:	9601      	str	r6, [sp, #4]
c0de3c6e:	1e6e      	subs	r6, r5, #1
c0de3c70:	f200 2801 	addw	r8, r0, #513	@ 0x201
c0de3c74:	f04f 0b00 	mov.w	fp, #0
c0de3c78:	4638      	mov	r0, r7
c0de3c7a:	4621      	mov	r1, r4
c0de3c7c:	220a      	movs	r2, #10
c0de3c7e:	2300      	movs	r3, #0
c0de3c80:	f004 fa86 	bl	c0de8190 <__aeabi_uldivmod>
c0de3c84:	460c      	mov	r4, r1
c0de3c86:	eb00 0180 	add.w	r1, r0, r0, lsl #2
c0de3c8a:	eba7 0141 	sub.w	r1, r7, r1, lsl #1
c0de3c8e:	f01a 0701 	ands.w	r7, sl, #1
c0de3c92:	f04f 0230 	mov.w	r2, #48	@ 0x30
c0de3c96:	bf16      	itet	ne
c0de3c98:	f041 0230 	orrne.w	r2, r1, #48	@ 0x30
c0de3c9c:	463c      	moveq	r4, r7
c0de3c9e:	4607      	movne	r7, r0
c0de3ca0:	f240 0000 	movw	r0, #0
c0de3ca4:	f2c0 0000 	movt	r0, #0
c0de3ca8:	4448      	add	r0, r9
c0de3caa:	4458      	add	r0, fp
c0de3cac:	4659      	mov	r1, fp
c0de3cae:	f880 2201 	strb.w	r2, [r0, #513]	@ 0x201
c0de3cb2:	45b3      	cmp	fp, r6
c0de3cb4:	bf02      	ittt	eq
c0de3cb6:	202e      	moveq	r0, #46	@ 0x2e
c0de3cb8:	f888 0000 	strbeq.w	r0, [r8]
c0de3cbc:	4629      	moveq	r1, r5
c0de3cbe:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de3cc0:	4281      	cmp	r1, r0
c0de3cc2:	da36      	bge.n	c0de3d32 <print_amount+0x112>
c0de3cc4:	f101 0b01 	add.w	fp, r1, #1
c0de3cc8:	ea57 0a04 	orrs.w	sl, r7, r4
c0de3ccc:	bf18      	it	ne
c0de3cce:	f04f 0a01 	movne.w	sl, #1
c0de3cd2:	d1d1      	bne.n	c0de3c78 <print_amount+0x58>
c0de3cd4:	42a9      	cmp	r1, r5
c0de3cd6:	ddcf      	ble.n	c0de3c78 <print_amount+0x58>
c0de3cd8:	9e01      	ldr	r6, [sp, #4]
c0de3cda:	2900      	cmp	r1, #0
c0de3cdc:	f04f 0000 	mov.w	r0, #0
c0de3ce0:	d416      	bmi.n	c0de3d10 <print_amount+0xf0>
c0de3ce2:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
c0de3ce4:	2a02      	cmp	r2, #2
c0de3ce6:	d313      	bcc.n	c0de3d10 <print_amount+0xf0>
c0de3ce8:	3a01      	subs	r2, #1
c0de3cea:	2000      	movs	r0, #0
c0de3cec:	f240 0300 	movw	r3, #0
c0de3cf0:	f2c0 0300 	movt	r3, #0
c0de3cf4:	444b      	add	r3, r9
c0de3cf6:	440b      	add	r3, r1
c0de3cf8:	f893 3201 	ldrb.w	r3, [r3, #513]	@ 0x201
c0de3cfc:	1c4f      	adds	r7, r1, #1
c0de3cfe:	5433      	strb	r3, [r6, r0]
c0de3d00:	2f02      	cmp	r7, #2
c0de3d02:	f100 0001 	add.w	r0, r0, #1
c0de3d06:	d303      	bcc.n	c0de3d10 <print_amount+0xf0>
c0de3d08:	4290      	cmp	r0, r2
c0de3d0a:	f1a1 0101 	sub.w	r1, r1, #1
c0de3d0e:	dbed      	blt.n	c0de3cec <print_amount+0xcc>
c0de3d10:	2d01      	cmp	r5, #1
c0de3d12:	db15      	blt.n	c0de3d40 <print_amount+0x120>
c0de3d14:	4601      	mov	r1, r0
c0de3d16:	2801      	cmp	r0, #1
c0de3d18:	bfa8      	it	ge
c0de3d1a:	2101      	movge	r1, #1
c0de3d1c:	1e4a      	subs	r2, r1, #1
c0de3d1e:	1e77      	subs	r7, r6, #1
c0de3d20:	2801      	cmp	r0, #1
c0de3d22:	dd08      	ble.n	c0de3d36 <print_amount+0x116>
c0de3d24:	5c3b      	ldrb	r3, [r7, r0]
c0de3d26:	3801      	subs	r0, #1
c0de3d28:	2b30      	cmp	r3, #48	@ 0x30
c0de3d2a:	d0f9      	beq.n	c0de3d20 <print_amount+0x100>
c0de3d2c:	1c41      	adds	r1, r0, #1
c0de3d2e:	4602      	mov	r2, r0
c0de3d30:	e002      	b.n	c0de3d38 <print_amount+0x118>
c0de3d32:	2000      	movs	r0, #0
c0de3d34:	e007      	b.n	c0de3d46 <print_amount+0x126>
c0de3d36:	5cb3      	ldrb	r3, [r6, r2]
c0de3d38:	2b2e      	cmp	r3, #46	@ 0x2e
c0de3d3a:	bf08      	it	eq
c0de3d3c:	4611      	moveq	r1, r2
c0de3d3e:	4608      	mov	r0, r1
c0de3d40:	2100      	movs	r1, #0
c0de3d42:	5431      	strb	r1, [r6, r0]
c0de3d44:	2001      	movs	r0, #1
c0de3d46:	b002      	add	sp, #8
c0de3d48:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de3d4c <asset_callback>:
c0de3d4c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de3d50:	b082      	sub	sp, #8
c0de3d52:	f240 58f8 	movw	r8, #1528	@ 0x5f8
c0de3d56:	4606      	mov	r6, r0
c0de3d58:	202d      	movs	r0, #45	@ 0x2d
c0de3d5a:	f2c0 0800 	movt	r8, #0
c0de3d5e:	9001      	str	r0, [sp, #4]
c0de3d60:	68b5      	ldr	r5, [r6, #8]
c0de3d62:	eb09 0008 	add.w	r0, r9, r8
c0de3d66:	f100 0796 	add.w	r7, r0, #150	@ 0x96
c0de3d6a:	4638      	mov	r0, r7
c0de3d6c:	4629      	mov	r1, r5
c0de3d6e:	4614      	mov	r4, r2
c0de3d70:	f004 fb9c 	bl	c0de84ac <__aeabi_memclr>
c0de3d74:	68b2      	ldr	r2, [r6, #8]
c0de3d76:	4630      	mov	r0, r6
c0de3d78:	4639      	mov	r1, r7
c0de3d7a:	f7fe f80b 	bl	c0de1d94 <pb_read>
c0de3d7e:	b158      	cbz	r0, c0de3d98 <asset_callback+0x4c>
c0de3d80:	6820      	ldr	r0, [r4, #0]
c0de3d82:	2d20      	cmp	r5, #32
c0de3d84:	d10a      	bne.n	c0de3d9c <asset_callback+0x50>
c0de3d86:	eb09 0108 	add.w	r1, r9, r8
c0de3d8a:	f101 0296 	add.w	r2, r1, #150	@ 0x96
c0de3d8e:	a901      	add	r1, sp, #4
c0de3d90:	2320      	movs	r3, #32
c0de3d92:	f7fc f9a5 	bl	c0de00e0 <b58enc>
c0de3d96:	b948      	cbnz	r0, c0de3dac <asset_callback+0x60>
c0de3d98:	2000      	movs	r0, #0
c0de3d9a:	e008      	b.n	c0de3dae <asset_callback+0x62>
c0de3d9c:	f245 1173 	movw	r1, #20851	@ 0x5173
c0de3da0:	f2c0 0100 	movt	r1, #0
c0de3da4:	4479      	add	r1, pc
c0de3da6:	2205      	movs	r2, #5
c0de3da8:	f004 fb83 	bl	c0de84b2 <__aeabi_memcpy>
c0de3dac:	2001      	movs	r0, #1
c0de3dae:	b002      	add	sp, #8
c0de3db0:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de3db4 <from_callback>:
c0de3db4:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3db6:	b081      	sub	sp, #4
c0de3db8:	f240 57f8 	movw	r7, #1528	@ 0x5f8
c0de3dbc:	f2c0 0700 	movt	r7, #0
c0de3dc0:	4605      	mov	r5, r0
c0de3dc2:	eb09 0007 	add.w	r0, r9, r7
c0de3dc6:	f100 0696 	add.w	r6, r0, #150	@ 0x96
c0de3dca:	4630      	mov	r0, r6
c0de3dcc:	2120      	movs	r1, #32
c0de3dce:	4614      	mov	r4, r2
c0de3dd0:	f004 fb6c 	bl	c0de84ac <__aeabi_memclr>
c0de3dd4:	68aa      	ldr	r2, [r5, #8]
c0de3dd6:	4628      	mov	r0, r5
c0de3dd8:	4631      	mov	r1, r6
c0de3dda:	f7fd ffdb 	bl	c0de1d94 <pb_read>
c0de3dde:	4605      	mov	r5, r0
c0de3de0:	b130      	cbz	r0, c0de3df0 <from_callback+0x3c>
c0de3de2:	6820      	ldr	r0, [r4, #0]
c0de3de4:	eb09 0107 	add.w	r1, r9, r7
c0de3de8:	3196      	adds	r1, #150	@ 0x96
c0de3dea:	2220      	movs	r2, #32
c0de3dec:	f004 fb63 	bl	c0de84b6 <__aeabi_memmove>
c0de3df0:	4628      	mov	r0, r5
c0de3df2:	b001      	add	sp, #4
c0de3df4:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de3df6 <string_callback>:
c0de3df6:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de3dfa:	f240 58f8 	movw	r8, #1528	@ 0x5f8
c0de3dfe:	f2c0 0800 	movt	r8, #0
c0de3e02:	4606      	mov	r6, r0
c0de3e04:	6884      	ldr	r4, [r0, #8]
c0de3e06:	eb09 0008 	add.w	r0, r9, r8
c0de3e0a:	f100 0796 	add.w	r7, r0, #150	@ 0x96
c0de3e0e:	4638      	mov	r0, r7
c0de3e10:	4621      	mov	r1, r4
c0de3e12:	4615      	mov	r5, r2
c0de3e14:	f004 fb4a 	bl	c0de84ac <__aeabi_memclr>
c0de3e18:	68b2      	ldr	r2, [r6, #8]
c0de3e1a:	4630      	mov	r0, r6
c0de3e1c:	4639      	mov	r1, r7
c0de3e1e:	f7fd ffb9 	bl	c0de1d94 <pb_read>
c0de3e22:	4606      	mov	r6, r0
c0de3e24:	b130      	cbz	r0, c0de3e34 <string_callback+0x3e>
c0de3e26:	6828      	ldr	r0, [r5, #0]
c0de3e28:	eb09 0108 	add.w	r1, r9, r8
c0de3e2c:	3196      	adds	r1, #150	@ 0x96
c0de3e2e:	4622      	mov	r2, r4
c0de3e30:	f004 fb41 	bl	c0de84b6 <__aeabi_memmove>
c0de3e34:	4630      	mov	r0, r6
c0de3e36:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de3e3a <text_callback>:
c0de3e3a:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de3e3e:	b081      	sub	sp, #4
c0de3e40:	6886      	ldr	r6, [r0, #8]
c0de3e42:	4604      	mov	r4, r0
c0de3e44:	2e2a      	cmp	r6, #42	@ 0x2a
c0de3e46:	4615      	mov	r5, r2
c0de3e48:	db2c      	blt.n	c0de3ea4 <text_callback+0x6a>
c0de3e4a:	f240 5af8 	movw	sl, #1528	@ 0x5f8
c0de3e4e:	f2c0 0a00 	movt	sl, #0
c0de3e52:	eb09 000a 	add.w	r0, r9, sl
c0de3e56:	f100 0696 	add.w	r6, r0, #150	@ 0x96
c0de3e5a:	4630      	mov	r0, r6
c0de3e5c:	212d      	movs	r1, #45	@ 0x2d
c0de3e5e:	f004 fb25 	bl	c0de84ac <__aeabi_memclr>
c0de3e62:	68a7      	ldr	r7, [r4, #8]
c0de3e64:	4620      	mov	r0, r4
c0de3e66:	4631      	mov	r1, r6
c0de3e68:	2229      	movs	r2, #41	@ 0x29
c0de3e6a:	f7fd ff93 	bl	c0de1d94 <pb_read>
c0de3e6e:	f04f 0600 	mov.w	r6, #0
c0de3e72:	b398      	cbz	r0, c0de3edc <text_callback+0xa2>
c0de3e74:	eb09 010a 	add.w	r1, r9, sl
c0de3e78:	202e      	movs	r0, #46	@ 0x2e
c0de3e7a:	f801 0fbf 	strb.w	r0, [r1, #191]!
c0de3e7e:	70ce      	strb	r6, [r1, #3]
c0de3e80:	7088      	strb	r0, [r1, #2]
c0de3e82:	7048      	strb	r0, [r1, #1]
c0de3e84:	6828      	ldr	r0, [r5, #0]
c0de3e86:	3929      	subs	r1, #41	@ 0x29
c0de3e88:	222d      	movs	r2, #45	@ 0x2d
c0de3e8a:	f1a7 0829 	sub.w	r8, r7, #41	@ 0x29
c0de3e8e:	f004 fb12 	bl	c0de84b6 <__aeabi_memmove>
c0de3e92:	4620      	mov	r0, r4
c0de3e94:	2100      	movs	r1, #0
c0de3e96:	4642      	mov	r2, r8
c0de3e98:	f7fd ff7c 	bl	c0de1d94 <pb_read>
c0de3e9c:	2800      	cmp	r0, #0
c0de3e9e:	bf18      	it	ne
c0de3ea0:	2601      	movne	r6, #1
c0de3ea2:	e01b      	b.n	c0de3edc <text_callback+0xa2>
c0de3ea4:	f240 58f8 	movw	r8, #1528	@ 0x5f8
c0de3ea8:	f2c0 0800 	movt	r8, #0
c0de3eac:	eb09 0008 	add.w	r0, r9, r8
c0de3eb0:	f100 0796 	add.w	r7, r0, #150	@ 0x96
c0de3eb4:	4638      	mov	r0, r7
c0de3eb6:	4631      	mov	r1, r6
c0de3eb8:	f004 faf8 	bl	c0de84ac <__aeabi_memclr>
c0de3ebc:	68a2      	ldr	r2, [r4, #8]
c0de3ebe:	4620      	mov	r0, r4
c0de3ec0:	4639      	mov	r1, r7
c0de3ec2:	f7fd ff67 	bl	c0de1d94 <pb_read>
c0de3ec6:	b140      	cbz	r0, c0de3eda <text_callback+0xa0>
c0de3ec8:	6828      	ldr	r0, [r5, #0]
c0de3eca:	eb09 0108 	add.w	r1, r9, r8
c0de3ece:	3196      	adds	r1, #150	@ 0x96
c0de3ed0:	4632      	mov	r2, r6
c0de3ed2:	f004 faf0 	bl	c0de84b6 <__aeabi_memmove>
c0de3ed6:	2601      	movs	r6, #1
c0de3ed8:	e000      	b.n	c0de3edc <text_callback+0xa2>
c0de3eda:	2600      	movs	r6, #0
c0de3edc:	4630      	mov	r0, r6
c0de3ede:	b001      	add	sp, #4
c0de3ee0:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de3ee4 <issue_script_callback>:
c0de3ee4:	b510      	push	{r4, lr}
c0de3ee6:	6883      	ldr	r3, [r0, #8]
c0de3ee8:	4614      	mov	r4, r2
c0de3eea:	2100      	movs	r1, #0
c0de3eec:	461a      	mov	r2, r3
c0de3eee:	f7fd ff51 	bl	c0de1d94 <pb_read>
c0de3ef2:	b140      	cbz	r0, c0de3f06 <issue_script_callback+0x22>
c0de3ef4:	6820      	ldr	r0, [r4, #0]
c0de3ef6:	f245 11de 	movw	r1, #20958	@ 0x51de
c0de3efa:	f2c0 0100 	movt	r1, #0
c0de3efe:	4479      	add	r1, pc
c0de3f00:	2205      	movs	r2, #5
c0de3f02:	f004 fad6 	bl	c0de84b2 <__aeabi_memcpy>
c0de3f06:	2000      	movs	r0, #0
c0de3f08:	bd10      	pop	{r4, pc}

c0de3f0a <function_call_callback>:
c0de3f0a:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de3f0e:	b081      	sub	sp, #4
c0de3f10:	f240 57f8 	movw	r7, #1528	@ 0x5f8
c0de3f14:	f2c0 0700 	movt	r7, #0
c0de3f18:	4604      	mov	r4, r0
c0de3f1a:	eb09 0007 	add.w	r0, r9, r7
c0de3f1e:	3096      	adds	r0, #150	@ 0x96
c0de3f20:	212d      	movs	r1, #45	@ 0x2d
c0de3f22:	4692      	mov	sl, r2
c0de3f24:	f004 fac2 	bl	c0de84ac <__aeabi_memclr>
c0de3f28:	68a5      	ldr	r5, [r4, #8]
c0de3f2a:	2d07      	cmp	r5, #7
c0de3f2c:	dc0b      	bgt.n	c0de3f46 <function_call_callback+0x3c>
c0de3f2e:	f8da 0000 	ldr.w	r0, [sl]
c0de3f32:	f245 11aa 	movw	r1, #20906	@ 0x51aa
c0de3f36:	f2c0 0100 	movt	r1, #0
c0de3f3a:	4479      	add	r1, pc
c0de3f3c:	222d      	movs	r2, #45	@ 0x2d
c0de3f3e:	f004 fab8 	bl	c0de84b2 <__aeabi_memcpy>
c0de3f42:	2601      	movs	r6, #1
c0de3f44:	e04d      	b.n	c0de3fe2 <function_call_callback+0xd8>
c0de3f46:	eb09 0007 	add.w	r0, r9, r7
c0de3f4a:	f100 0196 	add.w	r1, r0, #150	@ 0x96
c0de3f4e:	4620      	mov	r0, r4
c0de3f50:	2207      	movs	r2, #7
c0de3f52:	f7fd ff1f 	bl	c0de1d94 <pb_read>
c0de3f56:	2800      	cmp	r0, #0
c0de3f58:	d042      	beq.n	c0de3fe0 <function_call_callback+0xd6>
c0de3f5a:	eb09 0007 	add.w	r0, r9, r7
c0de3f5e:	3099      	adds	r0, #153	@ 0x99
c0de3f60:	f7fc fcbb 	bl	c0de08da <deserialize_uint32_t>
c0de3f64:	282a      	cmp	r0, #42	@ 0x2a
c0de3f66:	d31e      	bcc.n	c0de3fa6 <function_call_callback+0x9c>
c0de3f68:	eb09 0007 	add.w	r0, r9, r7
c0de3f6c:	f100 0196 	add.w	r1, r0, #150	@ 0x96
c0de3f70:	4620      	mov	r0, r4
c0de3f72:	2229      	movs	r2, #41	@ 0x29
c0de3f74:	f7fd ff0e 	bl	c0de1d94 <pb_read>
c0de3f78:	f04f 0600 	mov.w	r6, #0
c0de3f7c:	b388      	cbz	r0, c0de3fe2 <function_call_callback+0xd8>
c0de3f7e:	eb09 0107 	add.w	r1, r9, r7
c0de3f82:	202e      	movs	r0, #46	@ 0x2e
c0de3f84:	f801 0fbf 	strb.w	r0, [r1, #191]!
c0de3f88:	70ce      	strb	r6, [r1, #3]
c0de3f8a:	7088      	strb	r0, [r1, #2]
c0de3f8c:	7048      	strb	r0, [r1, #1]
c0de3f8e:	f8da 0000 	ldr.w	r0, [sl]
c0de3f92:	3929      	subs	r1, #41	@ 0x29
c0de3f94:	222d      	movs	r2, #45	@ 0x2d
c0de3f96:	f1a5 0830 	sub.w	r8, r5, #48	@ 0x30
c0de3f9a:	f004 fa8c 	bl	c0de84b6 <__aeabi_memmove>
c0de3f9e:	4620      	mov	r0, r4
c0de3fa0:	2100      	movs	r1, #0
c0de3fa2:	4642      	mov	r2, r8
c0de3fa4:	e017      	b.n	c0de3fd6 <function_call_callback+0xcc>
c0de3fa6:	4606      	mov	r6, r0
c0de3fa8:	eb09 0007 	add.w	r0, r9, r7
c0de3fac:	f100 0196 	add.w	r1, r0, #150	@ 0x96
c0de3fb0:	4620      	mov	r0, r4
c0de3fb2:	4632      	mov	r2, r6
c0de3fb4:	f7fd feee 	bl	c0de1d94 <pb_read>
c0de3fb8:	b190      	cbz	r0, c0de3fe0 <function_call_callback+0xd6>
c0de3fba:	1fe8      	subs	r0, r5, #7
c0de3fbc:	1b86      	subs	r6, r0, r6
c0de3fbe:	f8da 0000 	ldr.w	r0, [sl]
c0de3fc2:	eb09 0107 	add.w	r1, r9, r7
c0de3fc6:	3196      	adds	r1, #150	@ 0x96
c0de3fc8:	222d      	movs	r2, #45	@ 0x2d
c0de3fca:	f004 fa74 	bl	c0de84b6 <__aeabi_memmove>
c0de3fce:	4620      	mov	r0, r4
c0de3fd0:	2100      	movs	r1, #0
c0de3fd2:	4632      	mov	r2, r6
c0de3fd4:	2600      	movs	r6, #0
c0de3fd6:	f7fd fedd 	bl	c0de1d94 <pb_read>
c0de3fda:	2800      	cmp	r0, #0
c0de3fdc:	d1b1      	bne.n	c0de3f42 <function_call_callback+0x38>
c0de3fde:	e000      	b.n	c0de3fe2 <function_call_callback+0xd8>
c0de3fe0:	2600      	movs	r6, #0
c0de3fe2:	4630      	mov	r0, r6
c0de3fe4:	b001      	add	sp, #4
c0de3fe6:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de3fea <transaction_data_callback>:
c0de3fea:	6882      	ldr	r2, [r0, #8]
c0de3fec:	2100      	movs	r1, #0
c0de3fee:	f7fd bed1 	b.w	c0de1d94 <pb_read>
	...

c0de3ff4 <pb_find_child>:
c0de3ff4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de3ff8:	b08d      	sub	sp, #52	@ 0x34
c0de3ffa:	f10d 0133 	add.w	r1, sp, #51	@ 0x33
c0de3ffe:	aa0b      	add	r2, sp, #44	@ 0x2c
c0de4000:	f10d 032b 	add.w	r3, sp, #43	@ 0x2b
c0de4004:	4604      	mov	r4, r0
c0de4006:	f7fd ffcb 	bl	c0de1fa0 <pb_decode_tag>
c0de400a:	b360      	cbz	r0, c0de4066 <pb_find_child+0x72>
c0de400c:	f244 78b2 	movw	r8, #18354	@ 0x47b2
c0de4010:	f2c0 0800 	movt	r8, #0
c0de4014:	44f8      	add	r8, pc
c0de4016:	46ea      	mov	sl, sp
c0de4018:	f10d 0733 	add.w	r7, sp, #51	@ 0x33
c0de401c:	ad0b      	add	r5, sp, #44	@ 0x2c
c0de401e:	f10d 062b 	add.w	r6, sp, #43	@ 0x2b
c0de4022:	bf00      	nop
c0de4024:	f89d 1033 	ldrb.w	r1, [sp, #51]	@ 0x33
c0de4028:	2902      	cmp	r1, #2
c0de402a:	d111      	bne.n	c0de4050 <pb_find_child+0x5c>
c0de402c:	4650      	mov	r0, sl
c0de402e:	4641      	mov	r1, r8
c0de4030:	2200      	movs	r2, #0
c0de4032:	f7fd fc09 	bl	c0de1848 <pb_field_iter_begin>
c0de4036:	b148      	cbz	r0, c0de404c <pb_find_child+0x58>
c0de4038:	990b      	ldr	r1, [sp, #44]	@ 0x2c
c0de403a:	4650      	mov	r0, sl
c0de403c:	f7fd fd52 	bl	c0de1ae4 <pb_field_iter_find>
c0de4040:	b120      	cbz	r0, c0de404c <pb_find_child+0x58>
c0de4042:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de4044:	f1a0 0167 	sub.w	r1, r0, #103	@ 0x67
c0de4048:	290f      	cmp	r1, #15
c0de404a:	d30d      	bcc.n	c0de4068 <pb_find_child+0x74>
c0de404c:	f89d 1033 	ldrb.w	r1, [sp, #51]	@ 0x33
c0de4050:	4620      	mov	r0, r4
c0de4052:	f7fd ffbb 	bl	c0de1fcc <pb_skip_field>
c0de4056:	4620      	mov	r0, r4
c0de4058:	4639      	mov	r1, r7
c0de405a:	462a      	mov	r2, r5
c0de405c:	4633      	mov	r3, r6
c0de405e:	f7fd ff9f 	bl	c0de1fa0 <pb_decode_tag>
c0de4062:	2800      	cmp	r0, #0
c0de4064:	d1de      	bne.n	c0de4024 <pb_find_child+0x30>
c0de4066:	2000      	movs	r0, #0
c0de4068:	b00d      	add	sp, #52	@ 0x34
c0de406a:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de406e <pb_decode_child>:
c0de406e:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de4070:	b085      	sub	sp, #20
c0de4072:	460e      	mov	r6, r1
c0de4074:	a901      	add	r1, sp, #4
c0de4076:	4615      	mov	r5, r2
c0de4078:	4604      	mov	r4, r0
c0de407a:	f7fd ffe9 	bl	c0de2050 <pb_make_string_substream>
c0de407e:	b168      	cbz	r0, c0de409c <pb_decode_child+0x2e>
c0de4080:	af01      	add	r7, sp, #4
c0de4082:	4638      	mov	r0, r7
c0de4084:	4631      	mov	r1, r6
c0de4086:	462a      	mov	r2, r5
c0de4088:	f7fe fa53 	bl	c0de2532 <pb_decode>
c0de408c:	4605      	mov	r5, r0
c0de408e:	4620      	mov	r0, r4
c0de4090:	4639      	mov	r1, r7
c0de4092:	f7fe f804 	bl	c0de209e <pb_close_string_substream>
c0de4096:	b10d      	cbz	r5, c0de409c <pb_decode_child+0x2e>
c0de4098:	b005      	add	sp, #20
c0de409a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de409c:	f249 1005 	movw	r0, #37125	@ 0x9105
c0de40a0:	f003 fd5b 	bl	c0de7b5a <os_longjmp>

c0de40a4 <build_issue_protobuf>:
c0de40a4:	b570      	push	{r4, r5, r6, lr}
c0de40a6:	b08c      	sub	sp, #48	@ 0x30
c0de40a8:	2100      	movs	r1, #0
c0de40aa:	f240 0600 	movw	r6, #0
c0de40ae:	e9cd 1108 	strd	r1, r1, [sp, #32]
c0de40b2:	e9cd 1106 	strd	r1, r1, [sp, #24]
c0de40b6:	f64f 5171 	movw	r1, #64881	@ 0xfd71
c0de40ba:	f2c0 0600 	movt	r6, #0
c0de40be:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de40c2:	eb09 0506 	add.w	r5, r9, r6
c0de40c6:	4479      	add	r1, pc
c0de40c8:	f105 02fd 	add.w	r2, r5, #253	@ 0xfd
c0de40cc:	9102      	str	r1, [sp, #8]
c0de40ce:	e9cd 2103 	strd	r2, r1, [sp, #12]
c0de40d2:	f505 7195 	add.w	r1, r5, #298	@ 0x12a
c0de40d6:	9105      	str	r1, [sp, #20]
c0de40d8:	f64f 6101 	movw	r1, #65025	@ 0xfe01
c0de40dc:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de40e0:	4479      	add	r1, pc
c0de40e2:	910a      	str	r1, [sp, #40]	@ 0x28
c0de40e4:	f205 11d5 	addw	r1, r5, #469	@ 0x1d5
c0de40e8:	910b      	str	r1, [sp, #44]	@ 0x2c
c0de40ea:	f244 71a6 	movw	r1, #18342	@ 0x47a6
c0de40ee:	f2c0 0100 	movt	r1, #0
c0de40f2:	4479      	add	r1, pc
c0de40f4:	aa02      	add	r2, sp, #8
c0de40f6:	f7ff ffba 	bl	c0de406e <pb_decode_child>
c0de40fa:	9b08      	ldr	r3, [sp, #32]
c0de40fc:	f644 2250 	movw	r2, #19024	@ 0x4a50
c0de4100:	f2c0 0200 	movt	r2, #0
c0de4104:	f205 107b 	addw	r0, r5, #379	@ 0x17b
c0de4108:	447a      	add	r2, pc
c0de410a:	212d      	movs	r1, #45	@ 0x2d
c0de410c:	f003 fd2c 	bl	c0de7b68 <snprintf>
c0de4110:	e9dd 0106 	ldrd	r0, r1, [sp, #24]
c0de4114:	f89d 2020 	ldrb.w	r2, [sp, #32]
c0de4118:	2416      	movs	r4, #22
c0de411a:	f205 1357 	addw	r3, r5, #343	@ 0x157
c0de411e:	9400      	str	r4, [sp, #0]
c0de4120:	f7ff fd7e 	bl	c0de3c20 <print_amount>
c0de4124:	f89d 0024 	ldrb.w	r0, [sp, #36]	@ 0x24
c0de4128:	b150      	cbz	r0, c0de4140 <build_issue_protobuf+0x9c>
c0de412a:	f644 71a2 	movw	r1, #20386	@ 0x4fa2
c0de412e:	eb09 0006 	add.w	r0, r9, r6
c0de4132:	f2c0 0100 	movt	r1, #0
c0de4136:	f500 70d4 	add.w	r0, r0, #424	@ 0x1a8
c0de413a:	4479      	add	r1, pc
c0de413c:	2205      	movs	r2, #5
c0de413e:	e009      	b.n	c0de4154 <build_issue_protobuf+0xb0>
c0de4140:	f644 719d 	movw	r1, #20381	@ 0x4f9d
c0de4144:	eb09 0006 	add.w	r0, r9, r6
c0de4148:	f2c0 0100 	movt	r1, #0
c0de414c:	f500 70d4 	add.w	r0, r0, #424	@ 0x1a8
c0de4150:	4479      	add	r1, pc
c0de4152:	2206      	movs	r2, #6
c0de4154:	f004 f9ad 	bl	c0de84b2 <__aeabi_memcpy>
c0de4158:	eb09 0006 	add.w	r0, r9, r6
c0de415c:	f200 10d5 	addw	r0, r0, #469	@ 0x1d5
c0de4160:	f004 fa04 	bl	c0de856c <strlen>
c0de4164:	b958      	cbnz	r0, c0de417e <build_issue_protobuf+0xda>
c0de4166:	f644 7177 	movw	r1, #20343	@ 0x4f77
c0de416a:	eb09 0006 	add.w	r0, r9, r6
c0de416e:	f2c0 0100 	movt	r1, #0
c0de4172:	f200 10d5 	addw	r0, r0, #469	@ 0x1d5
c0de4176:	4479      	add	r1, pc
c0de4178:	2206      	movs	r2, #6
c0de417a:	f004 f99a 	bl	c0de84b2 <__aeabi_memcpy>
c0de417e:	b00c      	add	sp, #48	@ 0x30
c0de4180:	bd70      	pop	{r4, r5, r6, pc}

c0de4182 <build_transfer_protobuf>:
c0de4182:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de4184:	b093      	sub	sp, #76	@ 0x4c
c0de4186:	ac02      	add	r4, sp, #8
c0de4188:	4605      	mov	r5, r0
c0de418a:	4620      	mov	r0, r4
c0de418c:	2138      	movs	r1, #56	@ 0x38
c0de418e:	f004 f98d 	bl	c0de84ac <__aeabi_memclr>
c0de4192:	f64f 30a7 	movw	r0, #64423	@ 0xfba7
c0de4196:	f240 0600 	movw	r6, #0
c0de419a:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de419e:	f2c0 0600 	movt	r6, #0
c0de41a2:	4478      	add	r0, pc
c0de41a4:	eb09 0706 	add.w	r7, r9, r6
c0de41a8:	900c      	str	r0, [sp, #48]	@ 0x30
c0de41aa:	f507 7095 	add.w	r0, r7, #298	@ 0x12a
c0de41ae:	900d      	str	r0, [sp, #52]	@ 0x34
c0de41b0:	f64f 407f 	movw	r0, #64639	@ 0xfc7f
c0de41b4:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de41b8:	4478      	add	r0, pc
c0de41ba:	9010      	str	r0, [sp, #64]	@ 0x40
c0de41bc:	f207 107b 	addw	r0, r7, #379	@ 0x17b
c0de41c0:	9011      	str	r0, [sp, #68]	@ 0x44
c0de41c2:	f244 61e0 	movw	r1, #18144	@ 0x46e0
c0de41c6:	f2c0 0100 	movt	r1, #0
c0de41ca:	4479      	add	r1, pc
c0de41cc:	4628      	mov	r0, r5
c0de41ce:	4622      	mov	r2, r4
c0de41d0:	f7ff ff4d 	bl	c0de406e <pb_decode_child>
c0de41d4:	e9dd 010e 	ldrd	r0, r1, [sp, #56]	@ 0x38
c0de41d8:	f897 2321 	ldrb.w	r2, [r7, #801]	@ 0x321
c0de41dc:	2516      	movs	r5, #22
c0de41de:	f107 03fd 	add.w	r3, r7, #253	@ 0xfd
c0de41e2:	9500      	str	r5, [sp, #0]
c0de41e4:	f7ff fd1c 	bl	c0de3c20 <print_amount>
c0de41e8:	f8bd 000a 	ldrh.w	r0, [sp, #10]
c0de41ec:	1d23      	adds	r3, r4, #4
c0de41ee:	2801      	cmp	r0, #1
c0de41f0:	eb09 0006 	add.w	r0, r9, r6
c0de41f4:	d107      	bne.n	c0de4206 <build_transfer_protobuf+0x84>
c0de41f6:	f890 132c 	ldrb.w	r1, [r0, #812]	@ 0x32c
c0de41fa:	f200 1257 	addw	r2, r0, #343	@ 0x157
c0de41fe:	4618      	mov	r0, r3
c0de4200:	f7fc fb26 	bl	c0de0850 <waves_public_key_hash_to_address>
c0de4204:	e005      	b.n	c0de4212 <build_transfer_protobuf+0x90>
c0de4206:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de420a:	4619      	mov	r1, r3
c0de420c:	221f      	movs	r2, #31
c0de420e:	f004 f950 	bl	c0de84b2 <__aeabi_memcpy>
c0de4212:	eb09 0006 	add.w	r0, r9, r6
c0de4216:	f500 7095 	add.w	r0, r0, #298	@ 0x12a
c0de421a:	f004 f9a7 	bl	c0de856c <strlen>
c0de421e:	b958      	cbnz	r0, c0de4238 <build_transfer_protobuf+0xb6>
c0de4220:	f644 41e7 	movw	r1, #19687	@ 0x4ce7
c0de4224:	eb09 0006 	add.w	r0, r9, r6
c0de4228:	f2c0 0100 	movt	r1, #0
c0de422c:	f500 7095 	add.w	r0, r0, #298	@ 0x12a
c0de4230:	4479      	add	r1, pc
c0de4232:	2205      	movs	r2, #5
c0de4234:	f004 f93d 	bl	c0de84b2 <__aeabi_memcpy>
c0de4238:	b013      	add	sp, #76	@ 0x4c
c0de423a:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de423c <build_reissue_protobuf>:
c0de423c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de423e:	b08b      	sub	sp, #44	@ 0x2c
c0de4240:	ad02      	add	r5, sp, #8
c0de4242:	4604      	mov	r4, r0
c0de4244:	4628      	mov	r0, r5
c0de4246:	2120      	movs	r1, #32
c0de4248:	f004 f930 	bl	c0de84ac <__aeabi_memclr>
c0de424c:	f64f 20ed 	movw	r0, #64237	@ 0xfaed
c0de4250:	f240 0600 	movw	r6, #0
c0de4254:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de4258:	f2c0 0600 	movt	r6, #0
c0de425c:	4478      	add	r0, pc
c0de425e:	eb09 0706 	add.w	r7, r9, r6
c0de4262:	9004      	str	r0, [sp, #16]
c0de4264:	f507 7095 	add.w	r0, r7, #298	@ 0x12a
c0de4268:	9005      	str	r0, [sp, #20]
c0de426a:	f244 614a 	movw	r1, #17994	@ 0x464a
c0de426e:	f2c0 0100 	movt	r1, #0
c0de4272:	4479      	add	r1, pc
c0de4274:	4620      	mov	r0, r4
c0de4276:	462a      	mov	r2, r5
c0de4278:	f7ff fef9 	bl	c0de406e <pb_decode_child>
c0de427c:	e9dd 0106 	ldrd	r0, r1, [sp, #24]
c0de4280:	f897 2321 	ldrb.w	r2, [r7, #801]	@ 0x321
c0de4284:	2516      	movs	r5, #22
c0de4286:	f107 03fd 	add.w	r3, r7, #253	@ 0xfd
c0de428a:	9500      	str	r5, [sp, #0]
c0de428c:	f7ff fcc8 	bl	c0de3c20 <print_amount>
c0de4290:	f89d 0020 	ldrb.w	r0, [sp, #32]
c0de4294:	b150      	cbz	r0, c0de42ac <build_reissue_protobuf+0x70>
c0de4296:	f644 6136 	movw	r1, #20022	@ 0x4e36
c0de429a:	eb09 0006 	add.w	r0, r9, r6
c0de429e:	f2c0 0100 	movt	r1, #0
c0de42a2:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de42a6:	4479      	add	r1, pc
c0de42a8:	2205      	movs	r2, #5
c0de42aa:	e009      	b.n	c0de42c0 <build_reissue_protobuf+0x84>
c0de42ac:	f644 6131 	movw	r1, #20017	@ 0x4e31
c0de42b0:	eb09 0006 	add.w	r0, r9, r6
c0de42b4:	f2c0 0100 	movt	r1, #0
c0de42b8:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de42bc:	4479      	add	r1, pc
c0de42be:	2206      	movs	r2, #6
c0de42c0:	f004 f8f7 	bl	c0de84b2 <__aeabi_memcpy>
c0de42c4:	b00b      	add	sp, #44	@ 0x2c
c0de42c6:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de42c8 <build_burn_protobuf>:
c0de42c8:	b570      	push	{r4, r5, r6, lr}
c0de42ca:	b088      	sub	sp, #32
c0de42cc:	ad02      	add	r5, sp, #8
c0de42ce:	4604      	mov	r4, r0
c0de42d0:	4628      	mov	r0, r5
c0de42d2:	2118      	movs	r1, #24
c0de42d4:	f004 f8ea 	bl	c0de84ac <__aeabi_memclr>
c0de42d8:	f64f 2069 	movw	r0, #64105	@ 0xfa69
c0de42dc:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de42e0:	4478      	add	r0, pc
c0de42e2:	9004      	str	r0, [sp, #16]
c0de42e4:	f240 0000 	movw	r0, #0
c0de42e8:	f2c0 0000 	movt	r0, #0
c0de42ec:	eb09 0600 	add.w	r6, r9, r0
c0de42f0:	f506 7095 	add.w	r0, r6, #298	@ 0x12a
c0de42f4:	9005      	str	r0, [sp, #20]
c0de42f6:	f244 51d0 	movw	r1, #17872	@ 0x45d0
c0de42fa:	f2c0 0100 	movt	r1, #0
c0de42fe:	4479      	add	r1, pc
c0de4300:	4620      	mov	r0, r4
c0de4302:	462a      	mov	r2, r5
c0de4304:	f7ff feb3 	bl	c0de406e <pb_decode_child>
c0de4308:	e9dd 0106 	ldrd	r0, r1, [sp, #24]
c0de430c:	f896 2321 	ldrb.w	r2, [r6, #801]	@ 0x321
c0de4310:	2516      	movs	r5, #22
c0de4312:	f106 03fd 	add.w	r3, r6, #253	@ 0xfd
c0de4316:	9500      	str	r5, [sp, #0]
c0de4318:	f7ff fc82 	bl	c0de3c20 <print_amount>
c0de431c:	b008      	add	sp, #32
c0de431e:	bd70      	pop	{r4, r5, r6, pc}

c0de4320 <build_lease_protobuf>:
c0de4320:	b570      	push	{r4, r5, r6, lr}
c0de4322:	b08e      	sub	sp, #56	@ 0x38
c0de4324:	ac02      	add	r4, sp, #8
c0de4326:	4605      	mov	r5, r0
c0de4328:	4620      	mov	r0, r4
c0de432a:	2130      	movs	r1, #48	@ 0x30
c0de432c:	f004 f8be 	bl	c0de84ac <__aeabi_memclr>
c0de4330:	f244 51ba 	movw	r1, #17850	@ 0x45ba
c0de4334:	f2c0 0100 	movt	r1, #0
c0de4338:	4479      	add	r1, pc
c0de433a:	4628      	mov	r0, r5
c0de433c:	4622      	mov	r2, r4
c0de433e:	f7ff fe96 	bl	c0de406e <pb_decode_child>
c0de4342:	f240 0600 	movw	r6, #0
c0de4346:	f2c0 0600 	movt	r6, #0
c0de434a:	eb09 0306 	add.w	r3, r9, r6
c0de434e:	e9dd 010c 	ldrd	r0, r1, [sp, #48]	@ 0x30
c0de4352:	f893 2321 	ldrb.w	r2, [r3, #801]	@ 0x321
c0de4356:	2516      	movs	r5, #22
c0de4358:	33fd      	adds	r3, #253	@ 0xfd
c0de435a:	9500      	str	r5, [sp, #0]
c0de435c:	f7ff fc60 	bl	c0de3c20 <print_amount>
c0de4360:	f8bd 000a 	ldrh.w	r0, [sp, #10]
c0de4364:	1d23      	adds	r3, r4, #4
c0de4366:	2801      	cmp	r0, #1
c0de4368:	eb09 0006 	add.w	r0, r9, r6
c0de436c:	d107      	bne.n	c0de437e <build_lease_protobuf+0x5e>
c0de436e:	f890 132c 	ldrb.w	r1, [r0, #812]	@ 0x32c
c0de4372:	f200 1257 	addw	r2, r0, #343	@ 0x157
c0de4376:	4618      	mov	r0, r3
c0de4378:	f7fc fa6a 	bl	c0de0850 <waves_public_key_hash_to_address>
c0de437c:	e005      	b.n	c0de438a <build_lease_protobuf+0x6a>
c0de437e:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de4382:	4619      	mov	r1, r3
c0de4384:	221f      	movs	r2, #31
c0de4386:	f004 f894 	bl	c0de84b2 <__aeabi_memcpy>
c0de438a:	b00e      	add	sp, #56	@ 0x38
c0de438c:	bd70      	pop	{r4, r5, r6, pc}

c0de438e <build_mass_transfer_protobuf>:
c0de438e:	b5b0      	push	{r4, r5, r7, lr}
c0de4390:	b084      	sub	sp, #16
c0de4392:	f64f 11ab 	movw	r1, #63915	@ 0xf9ab
c0de4396:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de439a:	f240 0500 	movw	r5, #0
c0de439e:	4479      	add	r1, pc
c0de43a0:	f2c0 0500 	movt	r5, #0
c0de43a4:	9100      	str	r1, [sp, #0]
c0de43a6:	eb09 0105 	add.w	r1, r9, r5
c0de43aa:	f101 04fd 	add.w	r4, r1, #253	@ 0xfd
c0de43ae:	9401      	str	r4, [sp, #4]
c0de43b0:	f64f 227f 	movw	r2, #64127	@ 0xfa7f
c0de43b4:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de43b8:	447a      	add	r2, pc
c0de43ba:	f501 7195 	add.w	r1, r1, #298	@ 0x12a
c0de43be:	9202      	str	r2, [sp, #8]
c0de43c0:	9103      	str	r1, [sp, #12]
c0de43c2:	f244 515e 	movw	r1, #17758	@ 0x455e
c0de43c6:	f2c0 0100 	movt	r1, #0
c0de43ca:	4479      	add	r1, pc
c0de43cc:	466a      	mov	r2, sp
c0de43ce:	f7ff fe4e 	bl	c0de406e <pb_decode_child>
c0de43d2:	4620      	mov	r0, r4
c0de43d4:	f004 f8ca 	bl	c0de856c <strlen>
c0de43d8:	b950      	cbnz	r0, c0de43f0 <build_mass_transfer_protobuf+0x62>
c0de43da:	f644 312f 	movw	r1, #19247	@ 0x4b2f
c0de43de:	eb09 0005 	add.w	r0, r9, r5
c0de43e2:	f2c0 0100 	movt	r1, #0
c0de43e6:	30fd      	adds	r0, #253	@ 0xfd
c0de43e8:	4479      	add	r1, pc
c0de43ea:	2205      	movs	r2, #5
c0de43ec:	f004 f861 	bl	c0de84b2 <__aeabi_memcpy>
c0de43f0:	b004      	add	sp, #16
c0de43f2:	bdb0      	pop	{r4, r5, r7, pc}

c0de43f4 <build_sponsor_fee_protobuf>:
c0de43f4:	b570      	push	{r4, r5, r6, lr}
c0de43f6:	b088      	sub	sp, #32
c0de43f8:	ad02      	add	r5, sp, #8
c0de43fa:	4604      	mov	r4, r0
c0de43fc:	4628      	mov	r0, r5
c0de43fe:	2118      	movs	r1, #24
c0de4400:	f004 f854 	bl	c0de84ac <__aeabi_memclr>
c0de4404:	f64f 103d 	movw	r0, #63805	@ 0xf93d
c0de4408:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de440c:	4478      	add	r0, pc
c0de440e:	9004      	str	r0, [sp, #16]
c0de4410:	f240 0000 	movw	r0, #0
c0de4414:	f2c0 0000 	movt	r0, #0
c0de4418:	eb09 0600 	add.w	r6, r9, r0
c0de441c:	f506 7095 	add.w	r0, r6, #298	@ 0x12a
c0de4420:	9005      	str	r0, [sp, #20]
c0de4422:	f244 5134 	movw	r1, #17716	@ 0x4534
c0de4426:	f2c0 0100 	movt	r1, #0
c0de442a:	4479      	add	r1, pc
c0de442c:	4620      	mov	r0, r4
c0de442e:	462a      	mov	r2, r5
c0de4430:	f7ff fe1d 	bl	c0de406e <pb_decode_child>
c0de4434:	e9dd 0106 	ldrd	r0, r1, [sp, #24]
c0de4438:	f896 2321 	ldrb.w	r2, [r6, #801]	@ 0x321
c0de443c:	2516      	movs	r5, #22
c0de443e:	f106 03fd 	add.w	r3, r6, #253	@ 0xfd
c0de4442:	9500      	str	r5, [sp, #0]
c0de4444:	f7ff fbec 	bl	c0de3c20 <print_amount>
c0de4448:	b008      	add	sp, #32
c0de444a:	bd70      	pop	{r4, r5, r6, pc}

c0de444c <build_invoke_script_protobuf>:
c0de444c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de444e:	b097      	sub	sp, #92	@ 0x5c
c0de4450:	af02      	add	r7, sp, #8
c0de4452:	4605      	mov	r5, r0
c0de4454:	4638      	mov	r0, r7
c0de4456:	2150      	movs	r1, #80	@ 0x50
c0de4458:	f004 f828 	bl	c0de84ac <__aeabi_memclr>
c0de445c:	f64f 209f 	movw	r0, #64159	@ 0xfa9f
c0de4460:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de4464:	f240 0600 	movw	r6, #0
c0de4468:	4478      	add	r0, pc
c0de446a:	f2c0 0600 	movt	r6, #0
c0de446e:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de4470:	eb09 0006 	add.w	r0, r9, r6
c0de4474:	f500 7195 	add.w	r1, r0, #298	@ 0x12a
c0de4478:	910c      	str	r1, [sp, #48]	@ 0x30
c0de447a:	f64f 01c7 	movw	r1, #63687	@ 0xf8c7
c0de447e:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de4482:	4479      	add	r1, pc
c0de4484:	f100 02fd 	add.w	r2, r0, #253	@ 0xfd
c0de4488:	f500 70d4 	add.w	r0, r0, #424	@ 0x1a8
c0de448c:	910e      	str	r1, [sp, #56]	@ 0x38
c0de448e:	920f      	str	r2, [sp, #60]	@ 0x3c
c0de4490:	9112      	str	r1, [sp, #72]	@ 0x48
c0de4492:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de4494:	f244 41e6 	movw	r1, #17638	@ 0x44e6
c0de4498:	f2c0 0100 	movt	r1, #0
c0de449c:	4479      	add	r1, pc
c0de449e:	4628      	mov	r0, r5
c0de44a0:	463a      	mov	r2, r7
c0de44a2:	f7ff fde4 	bl	c0de406e <pb_decode_child>
c0de44a6:	f8bd 0034 	ldrh.w	r0, [sp, #52]	@ 0x34
c0de44aa:	b3d8      	cbz	r0, c0de4524 <build_invoke_script_protobuf+0xd8>
c0de44ac:	eb09 0506 	add.w	r5, r9, r6
c0de44b0:	e9dd 0110 	ldrd	r0, r1, [sp, #64]	@ 0x40
c0de44b4:	f895 2321 	ldrb.w	r2, [r5, #801]	@ 0x321
c0de44b8:	2416      	movs	r4, #22
c0de44ba:	f205 137b 	addw	r3, r5, #379	@ 0x17b
c0de44be:	9400      	str	r4, [sp, #0]
c0de44c0:	f7ff fbae 	bl	c0de3c20 <print_amount>
c0de44c4:	f105 00fd 	add.w	r0, r5, #253	@ 0xfd
c0de44c8:	f004 f850 	bl	c0de856c <strlen>
c0de44cc:	b950      	cbnz	r0, c0de44e4 <build_invoke_script_protobuf+0x98>
c0de44ce:	f644 213b 	movw	r1, #19003	@ 0x4a3b
c0de44d2:	eb09 0006 	add.w	r0, r9, r6
c0de44d6:	f2c0 0100 	movt	r1, #0
c0de44da:	30fd      	adds	r0, #253	@ 0xfd
c0de44dc:	4479      	add	r1, pc
c0de44de:	2205      	movs	r2, #5
c0de44e0:	f003 ffe7 	bl	c0de84b2 <__aeabi_memcpy>
c0de44e4:	f8bd 0034 	ldrh.w	r0, [sp, #52]	@ 0x34
c0de44e8:	2802      	cmp	r0, #2
c0de44ea:	d11b      	bne.n	c0de4524 <build_invoke_script_protobuf+0xd8>
c0de44ec:	eb09 0406 	add.w	r4, r9, r6
c0de44f0:	e9dd 0114 	ldrd	r0, r1, [sp, #80]	@ 0x50
c0de44f4:	f894 2322 	ldrb.w	r2, [r4, #802]	@ 0x322
c0de44f8:	2516      	movs	r5, #22
c0de44fa:	f204 13d5 	addw	r3, r4, #469	@ 0x1d5
c0de44fe:	9500      	str	r5, [sp, #0]
c0de4500:	f7ff fb8e 	bl	c0de3c20 <print_amount>
c0de4504:	f504 70d4 	add.w	r0, r4, #424	@ 0x1a8
c0de4508:	f004 f830 	bl	c0de856c <strlen>
c0de450c:	b950      	cbnz	r0, c0de4524 <build_invoke_script_protobuf+0xd8>
c0de450e:	f644 11fb 	movw	r1, #18939	@ 0x49fb
c0de4512:	eb09 0006 	add.w	r0, r9, r6
c0de4516:	f2c0 0100 	movt	r1, #0
c0de451a:	30fd      	adds	r0, #253	@ 0xfd
c0de451c:	4479      	add	r1, pc
c0de451e:	2205      	movs	r2, #5
c0de4520:	f003 ffc7 	bl	c0de84b2 <__aeabi_memcpy>
c0de4524:	f8bd 000a 	ldrh.w	r0, [sp, #10]
c0de4528:	1d3b      	adds	r3, r7, #4
c0de452a:	2801      	cmp	r0, #1
c0de452c:	eb09 0006 	add.w	r0, r9, r6
c0de4530:	d107      	bne.n	c0de4542 <build_invoke_script_protobuf+0xf6>
c0de4532:	f890 132c 	ldrb.w	r1, [r0, #812]	@ 0x32c
c0de4536:	f200 1257 	addw	r2, r0, #343	@ 0x157
c0de453a:	4618      	mov	r0, r3
c0de453c:	f7fc f988 	bl	c0de0850 <waves_public_key_hash_to_address>
c0de4540:	e005      	b.n	c0de454e <build_invoke_script_protobuf+0x102>
c0de4542:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de4546:	4619      	mov	r1, r3
c0de4548:	221f      	movs	r2, #31
c0de454a:	f003 ffb2 	bl	c0de84b2 <__aeabi_memcpy>
c0de454e:	b017      	add	sp, #92	@ 0x5c
c0de4550:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de4552 <build_protobuf_child_tx>:
c0de4552:	b510      	push	{r4, lr}
c0de4554:	b08c      	sub	sp, #48	@ 0x30
c0de4556:	4694      	mov	ip, r2
c0de4558:	ac02      	add	r4, sp, #8
c0de455a:	460a      	mov	r2, r1
c0de455c:	4601      	mov	r1, r0
c0de455e:	f04f 0e00 	mov.w	lr, #0
c0de4562:	9300      	str	r3, [sp, #0]
c0de4564:	4620      	mov	r0, r4
c0de4566:	4663      	mov	r3, ip
c0de4568:	f8cd e004 	str.w	lr, [sp, #4]
c0de456c:	f7fd fbc6 	bl	c0de1cfc <pb_istream_from_apdu>
c0de4570:	4620      	mov	r0, r4
c0de4572:	f7ff fd3f 	bl	c0de3ff4 <pb_find_child>
c0de4576:	f240 0400 	movw	r4, #0
c0de457a:	286e      	cmp	r0, #110	@ 0x6e
c0de457c:	f2c0 0400 	movt	r4, #0
c0de4580:	dc0c      	bgt.n	c0de459c <build_protobuf_child_tx+0x4a>
c0de4582:	2869      	cmp	r0, #105	@ 0x69
c0de4584:	dd23      	ble.n	c0de45ce <build_protobuf_child_tx+0x7c>
c0de4586:	286c      	cmp	r0, #108	@ 0x6c
c0de4588:	dc3c      	bgt.n	c0de4604 <build_protobuf_child_tx+0xb2>
c0de458a:	286a      	cmp	r0, #106	@ 0x6a
c0de458c:	d075      	beq.n	c0de467a <build_protobuf_child_tx+0x128>
c0de458e:	286c      	cmp	r0, #108	@ 0x6c
c0de4590:	f040 80b1 	bne.w	c0de46f6 <build_protobuf_child_tx+0x1a4>
c0de4594:	a802      	add	r0, sp, #8
c0de4596:	f7ff fec3 	bl	c0de4320 <build_lease_protobuf>
c0de459a:	e09e      	b.n	c0de46da <build_protobuf_child_tx+0x188>
c0de459c:	2871      	cmp	r0, #113	@ 0x71
c0de459e:	dd21      	ble.n	c0de45e4 <build_protobuf_child_tx+0x92>
c0de45a0:	2873      	cmp	r0, #115	@ 0x73
c0de45a2:	dc43      	bgt.n	c0de462c <build_protobuf_child_tx+0xda>
c0de45a4:	2872      	cmp	r0, #114	@ 0x72
c0de45a6:	d06c      	beq.n	c0de4682 <build_protobuf_child_tx+0x130>
c0de45a8:	2873      	cmp	r0, #115	@ 0x73
c0de45aa:	f040 80a4 	bne.w	c0de46f6 <build_protobuf_child_tx+0x1a4>
c0de45ae:	f24f 7093 	movw	r0, #63379	@ 0xf793
c0de45b2:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de45b6:	4478      	add	r0, pc
c0de45b8:	9006      	str	r0, [sp, #24]
c0de45ba:	eb09 0004 	add.w	r0, r9, r4
c0de45be:	30fd      	adds	r0, #253	@ 0xfd
c0de45c0:	9007      	str	r0, [sp, #28]
c0de45c2:	f244 31a6 	movw	r1, #17318	@ 0x43a6
c0de45c6:	f2c0 0100 	movt	r1, #0
c0de45ca:	4479      	add	r1, pc
c0de45cc:	e081      	b.n	c0de46d2 <build_protobuf_child_tx+0x180>
c0de45ce:	2867      	cmp	r0, #103	@ 0x67
c0de45d0:	d05b      	beq.n	c0de468a <build_protobuf_child_tx+0x138>
c0de45d2:	2868      	cmp	r0, #104	@ 0x68
c0de45d4:	d05d      	beq.n	c0de4692 <build_protobuf_child_tx+0x140>
c0de45d6:	2869      	cmp	r0, #105	@ 0x69
c0de45d8:	f040 808d 	bne.w	c0de46f6 <build_protobuf_child_tx+0x1a4>
c0de45dc:	a802      	add	r0, sp, #8
c0de45de:	f7ff fe2d 	bl	c0de423c <build_reissue_protobuf>
c0de45e2:	e07a      	b.n	c0de46da <build_protobuf_child_tx+0x188>
c0de45e4:	286f      	cmp	r0, #111	@ 0x6f
c0de45e6:	d058      	beq.n	c0de469a <build_protobuf_child_tx+0x148>
c0de45e8:	2870      	cmp	r0, #112	@ 0x70
c0de45ea:	d05a      	beq.n	c0de46a2 <build_protobuf_child_tx+0x150>
c0de45ec:	2871      	cmp	r0, #113	@ 0x71
c0de45ee:	f040 8082 	bne.w	c0de46f6 <build_protobuf_child_tx+0x1a4>
c0de45f2:	2000      	movs	r0, #0
c0de45f4:	f88d 0018 	strb.w	r0, [sp, #24]
c0de45f8:	f244 314c 	movw	r1, #17228	@ 0x434c
c0de45fc:	f2c0 0100 	movt	r1, #0
c0de4600:	4479      	add	r1, pc
c0de4602:	e066      	b.n	c0de46d2 <build_protobuf_child_tx+0x180>
c0de4604:	286d      	cmp	r0, #109	@ 0x6d
c0de4606:	d055      	beq.n	c0de46b4 <build_protobuf_child_tx+0x162>
c0de4608:	286e      	cmp	r0, #110	@ 0x6e
c0de460a:	d174      	bne.n	c0de46f6 <build_protobuf_child_tx+0x1a4>
c0de460c:	f24f 70df 	movw	r0, #63455	@ 0xf7df
c0de4610:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de4614:	4478      	add	r0, pc
c0de4616:	9006      	str	r0, [sp, #24]
c0de4618:	eb09 0004 	add.w	r0, r9, r4
c0de461c:	30fd      	adds	r0, #253	@ 0xfd
c0de461e:	9007      	str	r0, [sp, #28]
c0de4620:	f244 21ee 	movw	r1, #17134	@ 0x42ee
c0de4624:	f2c0 0100 	movt	r1, #0
c0de4628:	4479      	add	r1, pc
c0de462a:	e052      	b.n	c0de46d2 <build_protobuf_child_tx+0x180>
c0de462c:	2874      	cmp	r0, #116	@ 0x74
c0de462e:	d05e      	beq.n	c0de46ee <build_protobuf_child_tx+0x19c>
c0de4630:	2875      	cmp	r0, #117	@ 0x75
c0de4632:	d160      	bne.n	c0de46f6 <build_protobuf_child_tx+0x1a4>
c0de4634:	f24f 700d 	movw	r0, #63245	@ 0xf70d
c0de4638:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de463c:	4478      	add	r0, pc
c0de463e:	9006      	str	r0, [sp, #24]
c0de4640:	eb09 0004 	add.w	r0, r9, r4
c0de4644:	f100 01fd 	add.w	r1, r0, #253	@ 0xfd
c0de4648:	9107      	str	r1, [sp, #28]
c0de464a:	f24f 71a1 	movw	r1, #63393	@ 0xf7a1
c0de464e:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de4652:	4479      	add	r1, pc
c0de4654:	9108      	str	r1, [sp, #32]
c0de4656:	f500 7195 	add.w	r1, r0, #298	@ 0x12a
c0de465a:	9109      	str	r1, [sp, #36]	@ 0x24
c0de465c:	f24f 71d3 	movw	r1, #63443	@ 0xf7d3
c0de4660:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de4664:	4479      	add	r1, pc
c0de4666:	f200 107b 	addw	r0, r0, #379	@ 0x17b
c0de466a:	910a      	str	r1, [sp, #40]	@ 0x28
c0de466c:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de466e:	f244 311e 	movw	r1, #17182	@ 0x431e
c0de4672:	f2c0 0100 	movt	r1, #0
c0de4676:	4479      	add	r1, pc
c0de4678:	e02b      	b.n	c0de46d2 <build_protobuf_child_tx+0x180>
c0de467a:	a802      	add	r0, sp, #8
c0de467c:	f7ff fe24 	bl	c0de42c8 <build_burn_protobuf>
c0de4680:	e02b      	b.n	c0de46da <build_protobuf_child_tx+0x188>
c0de4682:	a802      	add	r0, sp, #8
c0de4684:	f7ff feb6 	bl	c0de43f4 <build_sponsor_fee_protobuf>
c0de4688:	e027      	b.n	c0de46da <build_protobuf_child_tx+0x188>
c0de468a:	a802      	add	r0, sp, #8
c0de468c:	f7ff fd0a 	bl	c0de40a4 <build_issue_protobuf>
c0de4690:	e023      	b.n	c0de46da <build_protobuf_child_tx+0x188>
c0de4692:	a802      	add	r0, sp, #8
c0de4694:	f7ff fd75 	bl	c0de4182 <build_transfer_protobuf>
c0de4698:	e01f      	b.n	c0de46da <build_protobuf_child_tx+0x188>
c0de469a:	a802      	add	r0, sp, #8
c0de469c:	f7ff fe77 	bl	c0de438e <build_mass_transfer_protobuf>
c0de46a0:	e01b      	b.n	c0de46da <build_protobuf_child_tx+0x188>
c0de46a2:	2000      	movs	r0, #0
c0de46a4:	f88d 0018 	strb.w	r0, [sp, #24]
c0de46a8:	f244 218a 	movw	r1, #17034	@ 0x428a
c0de46ac:	f2c0 0100 	movt	r1, #0
c0de46b0:	4479      	add	r1, pc
c0de46b2:	e00e      	b.n	c0de46d2 <build_protobuf_child_tx+0x180>
c0de46b4:	f24f 608d 	movw	r0, #63117	@ 0xf68d
c0de46b8:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de46bc:	4478      	add	r0, pc
c0de46be:	9006      	str	r0, [sp, #24]
c0de46c0:	eb09 0004 	add.w	r0, r9, r4
c0de46c4:	30fd      	adds	r0, #253	@ 0xfd
c0de46c6:	9007      	str	r0, [sp, #28]
c0de46c8:	f244 2134 	movw	r1, #16948	@ 0x4234
c0de46cc:	f2c0 0100 	movt	r1, #0
c0de46d0:	4479      	add	r1, pc
c0de46d2:	a802      	add	r0, sp, #8
c0de46d4:	aa06      	add	r2, sp, #24
c0de46d6:	f7ff fcca 	bl	c0de406e <pb_decode_child>
c0de46da:	eb09 0004 	add.w	r0, r9, r4
c0de46de:	2101      	movs	r1, #1
c0de46e0:	f880 1218 	strb.w	r1, [r0, #536]	@ 0x218
c0de46e4:	2108      	movs	r1, #8
c0de46e6:	f880 139a 	strb.w	r1, [r0, #922]	@ 0x39a
c0de46ea:	b00c      	add	sp, #48	@ 0x30
c0de46ec:	bd10      	pop	{r4, pc}
c0de46ee:	a802      	add	r0, sp, #8
c0de46f0:	f7ff feac 	bl	c0de444c <build_invoke_script_protobuf>
c0de46f4:	e7f1      	b.n	c0de46da <build_protobuf_child_tx+0x188>
c0de46f6:	f249 1005 	movw	r0, #37125	@ 0x9105
c0de46fa:	f003 fa2e 	bl	c0de7b5a <os_longjmp>

c0de46fe <build_protobuf_root_tx>:
c0de46fe:	b570      	push	{r4, r5, r6, lr}
c0de4700:	b0a8      	sub	sp, #160	@ 0xa0
c0de4702:	4614      	mov	r4, r2
c0de4704:	9e2c      	ldr	r6, [sp, #176]	@ 0xb0
c0de4706:	ad24      	add	r5, sp, #144	@ 0x90
c0de4708:	460a      	mov	r2, r1
c0de470a:	4601      	mov	r1, r0
c0de470c:	9300      	str	r3, [sp, #0]
c0de470e:	4628      	mov	r0, r5
c0de4710:	4623      	mov	r3, r4
c0de4712:	9601      	str	r6, [sp, #4]
c0de4714:	f7fd faf2 	bl	c0de1cfc <pb_istream_from_apdu>
c0de4718:	ac02      	add	r4, sp, #8
c0de471a:	f104 0008 	add.w	r0, r4, #8
c0de471e:	2180      	movs	r1, #128	@ 0x80
c0de4720:	f003 fec4 	bl	c0de84ac <__aeabi_memclr>
c0de4724:	f64f 00bb 	movw	r0, #63675	@ 0xf8bb
c0de4728:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de472c:	4478      	add	r0, pc
c0de472e:	900c      	str	r0, [sp, #48]	@ 0x30
c0de4730:	f24f 6075 	movw	r0, #63093	@ 0xf675
c0de4734:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de4738:	f240 0600 	movw	r6, #0
c0de473c:	4478      	add	r0, pc
c0de473e:	f2c0 0600 	movt	r6, #0
c0de4742:	9002      	str	r0, [sp, #8]
c0de4744:	eb09 0006 	add.w	r0, r9, r6
c0de4748:	f100 01ac 	add.w	r1, r0, #172	@ 0xac
c0de474c:	9103      	str	r1, [sp, #12]
c0de474e:	f24f 51f3 	movw	r1, #62963	@ 0xf5f3
c0de4752:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de4756:	4479      	add	r1, pc
c0de4758:	30d0      	adds	r0, #208	@ 0xd0
c0de475a:	9108      	str	r1, [sp, #32]
c0de475c:	9009      	str	r0, [sp, #36]	@ 0x24
c0de475e:	f244 0160 	movw	r1, #16480	@ 0x4060
c0de4762:	f2c0 0100 	movt	r1, #0
c0de4766:	4479      	add	r1, pc
c0de4768:	4628      	mov	r0, r5
c0de476a:	4622      	mov	r2, r4
c0de476c:	2300      	movs	r3, #0
c0de476e:	f7fd fca8 	bl	c0de20c2 <pb_decode_ex>
c0de4772:	b310      	cbz	r0, c0de47ba <build_protobuf_root_tx+0xbc>
c0de4774:	eb09 0406 	add.w	r4, r9, r6
c0de4778:	e9dd 010a 	ldrd	r0, r1, [sp, #40]	@ 0x28
c0de477c:	f894 2323 	ldrb.w	r2, [r4, #803]	@ 0x323
c0de4780:	2516      	movs	r5, #22
c0de4782:	f204 13eb 	addw	r3, r4, #491	@ 0x1eb
c0de4786:	9500      	str	r5, [sp, #0]
c0de4788:	f7ff fa4a 	bl	c0de3c20 <print_amount>
c0de478c:	f104 00d0 	add.w	r0, r4, #208	@ 0xd0
c0de4790:	f003 feec 	bl	c0de856c <strlen>
c0de4794:	b950      	cbnz	r0, c0de47ac <build_protobuf_root_tx+0xae>
c0de4796:	f244 7173 	movw	r1, #18291	@ 0x4773
c0de479a:	eb09 0006 	add.w	r0, r9, r6
c0de479e:	f2c0 0100 	movt	r1, #0
c0de47a2:	30d0      	adds	r0, #208	@ 0xd0
c0de47a4:	4479      	add	r1, pc
c0de47a6:	2205      	movs	r2, #5
c0de47a8:	f003 fe83 	bl	c0de84b2 <__aeabi_memcpy>
c0de47ac:	eb09 0006 	add.w	r0, r9, r6
c0de47b0:	2107      	movs	r1, #7
c0de47b2:	f880 139a 	strb.w	r1, [r0, #922]	@ 0x39a
c0de47b6:	b028      	add	sp, #160	@ 0xa0
c0de47b8:	bd70      	pop	{r4, r5, r6, pc}
c0de47ba:	f249 1005 	movw	r0, #37125	@ 0x9105
c0de47be:	f003 f9cc 	bl	c0de7b5a <os_longjmp>

c0de47c2 <build_protobuf_order>:
c0de47c2:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de47c6:	b0a2      	sub	sp, #136	@ 0x88
c0de47c8:	f10d 0818 	add.w	r8, sp, #24
c0de47cc:	460e      	mov	r6, r1
c0de47ce:	f8dd b0a8 	ldr.w	fp, [sp, #168]	@ 0xa8
c0de47d2:	4604      	mov	r4, r0
c0de47d4:	4640      	mov	r0, r8
c0de47d6:	2170      	movs	r1, #112	@ 0x70
c0de47d8:	461f      	mov	r7, r3
c0de47da:	4615      	mov	r5, r2
c0de47dc:	f003 fe66 	bl	c0de84ac <__aeabi_memclr>
c0de47e0:	f240 0a00 	movw	sl, #0
c0de47e4:	f24f 50bd 	movw	r0, #62909	@ 0xf5bd
c0de47e8:	f2c0 0a00 	movt	sl, #0
c0de47ec:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de47f0:	eb09 010a 	add.w	r1, r9, sl
c0de47f4:	4478      	add	r0, pc
c0de47f6:	f101 02ac 	add.w	r2, r1, #172	@ 0xac
c0de47fa:	9007      	str	r0, [sp, #28]
c0de47fc:	e9cd 2008 	strd	r2, r0, [sp, #32]
c0de4800:	f501 7095 	add.w	r0, r1, #298	@ 0x12a
c0de4804:	900a      	str	r0, [sp, #40]	@ 0x28
c0de4806:	f24f 503b 	movw	r0, #62779	@ 0xf53b
c0de480a:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de480e:	4478      	add	r0, pc
c0de4810:	901c      	str	r0, [sp, #112]	@ 0x70
c0de4812:	f101 02d0 	add.w	r2, r1, #208	@ 0xd0
c0de4816:	900c      	str	r0, [sp, #48]	@ 0x30
c0de4818:	f101 00fd 	add.w	r0, r1, #253	@ 0xfd
c0de481c:	9700      	str	r7, [sp, #0]
c0de481e:	af02      	add	r7, sp, #8
c0de4820:	921d      	str	r2, [sp, #116]	@ 0x74
c0de4822:	900d      	str	r0, [sp, #52]	@ 0x34
c0de4824:	4638      	mov	r0, r7
c0de4826:	4621      	mov	r1, r4
c0de4828:	4632      	mov	r2, r6
c0de482a:	462b      	mov	r3, r5
c0de482c:	f8cd b004 	str.w	fp, [sp, #4]
c0de4830:	f7fd fa64 	bl	c0de1cfc <pb_istream_from_apdu>
c0de4834:	f643 714c 	movw	r1, #16204	@ 0x3f4c
c0de4838:	f2c0 0100 	movt	r1, #0
c0de483c:	4479      	add	r1, pc
c0de483e:	4638      	mov	r0, r7
c0de4840:	4642      	mov	r2, r8
c0de4842:	f7fd fe76 	bl	c0de2532 <pb_decode>
c0de4846:	2800      	cmp	r0, #0
c0de4848:	d04e      	beq.n	c0de48e8 <build_protobuf_order+0x126>
c0de484a:	eb09 040a 	add.w	r4, r9, sl
c0de484e:	e9dd 0112 	ldrd	r0, r1, [sp, #72]	@ 0x48
c0de4852:	f894 2321 	ldrb.w	r2, [r4, #801]	@ 0x321
c0de4856:	2516      	movs	r5, #22
c0de4858:	f204 137b 	addw	r3, r4, #379	@ 0x17b
c0de485c:	9500      	str	r5, [sp, #0]
c0de485e:	f7ff f9df 	bl	c0de3c20 <print_amount>
c0de4862:	e9dd 011e 	ldrd	r0, r1, [sp, #120]	@ 0x78
c0de4866:	f894 2323 	ldrb.w	r2, [r4, #803]	@ 0x323
c0de486a:	f204 13eb 	addw	r3, r4, #491	@ 0x1eb
c0de486e:	9500      	str	r5, [sp, #0]
c0de4870:	f7ff f9d6 	bl	c0de3c20 <print_amount>
c0de4874:	f89d 0040 	ldrb.w	r0, [sp, #64]	@ 0x40
c0de4878:	b150      	cbz	r0, c0de4890 <build_protobuf_order+0xce>
c0de487a:	f644 0176 	movw	r1, #18550	@ 0x4876
c0de487e:	eb09 000a 	add.w	r0, r9, sl
c0de4882:	f2c0 0100 	movt	r1, #0
c0de4886:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de488a:	4479      	add	r1, pc
c0de488c:	220b      	movs	r2, #11
c0de488e:	e009      	b.n	c0de48a4 <build_protobuf_order+0xe2>
c0de4890:	f644 0154 	movw	r1, #18516	@ 0x4854
c0de4894:	eb09 000a 	add.w	r0, r9, sl
c0de4898:	f2c0 0100 	movt	r1, #0
c0de489c:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de48a0:	4479      	add	r1, pc
c0de48a2:	220a      	movs	r2, #10
c0de48a4:	f003 fe05 	bl	c0de84b2 <__aeabi_memcpy>
c0de48a8:	eb09 000a 	add.w	r0, r9, sl
c0de48ac:	30d0      	adds	r0, #208	@ 0xd0
c0de48ae:	f003 fe5d 	bl	c0de856c <strlen>
c0de48b2:	b950      	cbnz	r0, c0de48ca <build_protobuf_order+0x108>
c0de48b4:	f244 6155 	movw	r1, #18005	@ 0x4655
c0de48b8:	eb09 000a 	add.w	r0, r9, sl
c0de48bc:	f2c0 0100 	movt	r1, #0
c0de48c0:	30d0      	adds	r0, #208	@ 0xd0
c0de48c2:	4479      	add	r1, pc
c0de48c4:	2205      	movs	r2, #5
c0de48c6:	f003 fdf4 	bl	c0de84b2 <__aeabi_memcpy>
c0de48ca:	eb09 040a 	add.w	r4, r9, sl
c0de48ce:	f894 132c 	ldrb.w	r1, [r4, #812]	@ 0x32c
c0de48d2:	f504 7095 	add.w	r0, r4, #298	@ 0x12a
c0de48d6:	4602      	mov	r2, r0
c0de48d8:	f7fb ff7f 	bl	c0de07da <waves_public_key_to_address>
c0de48dc:	2007      	movs	r0, #7
c0de48de:	f884 039a 	strb.w	r0, [r4, #922]	@ 0x39a
c0de48e2:	b022      	add	sp, #136	@ 0x88
c0de48e4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de48e8:	f44f 40da 	mov.w	r0, #27904	@ 0x6d00
c0de48ec:	f003 f935 	bl	c0de7b5a <os_longjmp>

c0de48f0 <update_transfer_wait_in_buffer>:
c0de48f0:	f240 0000 	movw	r0, #0
c0de48f4:	f2c0 0000 	movt	r0, #0
c0de48f8:	eb09 0100 	add.w	r1, r9, r0
c0de48fc:	f891 2096 	ldrb.w	r2, [r1, #150]	@ 0x96
c0de4900:	2300      	movs	r3, #0
c0de4902:	f881 3098 	strb.w	r3, [r1, #152]	@ 0x98
c0de4906:	2a08      	cmp	r2, #8
c0de4908:	f04f 0101 	mov.w	r1, #1
c0de490c:	dc08      	bgt.n	c0de4920 <update_transfer_wait_in_buffer+0x30>
c0de490e:	2a03      	cmp	r2, #3
c0de4910:	dc10      	bgt.n	c0de4934 <update_transfer_wait_in_buffer+0x44>
c0de4912:	2a01      	cmp	r2, #1
c0de4914:	d026      	beq.n	c0de4964 <update_transfer_wait_in_buffer+0x74>
c0de4916:	2a02      	cmp	r2, #2
c0de4918:	d038      	beq.n	c0de498c <update_transfer_wait_in_buffer+0x9c>
c0de491a:	2a03      	cmp	r2, #3
c0de491c:	d022      	beq.n	c0de4964 <update_transfer_wait_in_buffer+0x74>
c0de491e:	e038      	b.n	c0de4992 <update_transfer_wait_in_buffer+0xa2>
c0de4920:	2a0b      	cmp	r2, #11
c0de4922:	dd0c      	ble.n	c0de493e <update_transfer_wait_in_buffer+0x4e>
c0de4924:	2a0d      	cmp	r2, #13
c0de4926:	dc12      	bgt.n	c0de494e <update_transfer_wait_in_buffer+0x5e>
c0de4928:	2a0c      	cmp	r2, #12
c0de492a:	d01d      	beq.n	c0de4968 <update_transfer_wait_in_buffer+0x78>
c0de492c:	2a0d      	cmp	r2, #13
c0de492e:	d130      	bne.n	c0de4992 <update_transfer_wait_in_buffer+0xa2>
c0de4930:	2102      	movs	r1, #2
c0de4932:	e02b      	b.n	c0de498c <update_transfer_wait_in_buffer+0x9c>
c0de4934:	1f93      	subs	r3, r2, #6
c0de4936:	2b03      	cmp	r3, #3
c0de4938:	d210      	bcs.n	c0de495c <update_transfer_wait_in_buffer+0x6c>
c0de493a:	2108      	movs	r1, #8
c0de493c:	e026      	b.n	c0de498c <update_transfer_wait_in_buffer+0x9c>
c0de493e:	2a09      	cmp	r2, #9
c0de4940:	d024      	beq.n	c0de498c <update_transfer_wait_in_buffer+0x9c>
c0de4942:	2a0a      	cmp	r2, #10
c0de4944:	d015      	beq.n	c0de4972 <update_transfer_wait_in_buffer+0x82>
c0de4946:	2a0b      	cmp	r2, #11
c0de4948:	d123      	bne.n	c0de4992 <update_transfer_wait_in_buffer+0xa2>
c0de494a:	2103      	movs	r1, #3
c0de494c:	e01e      	b.n	c0de498c <update_transfer_wait_in_buffer+0x9c>
c0de494e:	2a0e      	cmp	r2, #14
c0de4950:	d018      	beq.n	c0de4984 <update_transfer_wait_in_buffer+0x94>
c0de4952:	2a0f      	cmp	r2, #15
c0de4954:	bf18      	it	ne
c0de4956:	4770      	bxne	lr
c0de4958:	2100      	movs	r1, #0
c0de495a:	e017      	b.n	c0de498c <update_transfer_wait_in_buffer+0x9c>
c0de495c:	2a04      	cmp	r2, #4
c0de495e:	d015      	beq.n	c0de498c <update_transfer_wait_in_buffer+0x9c>
c0de4960:	2a05      	cmp	r2, #5
c0de4962:	d116      	bne.n	c0de4992 <update_transfer_wait_in_buffer+0xa2>
c0de4964:	2120      	movs	r1, #32
c0de4966:	e011      	b.n	c0de498c <update_transfer_wait_in_buffer+0x9c>
c0de4968:	eb09 0100 	add.w	r1, r9, r0
c0de496c:	f891 10a4 	ldrb.w	r1, [r1, #164]	@ 0xa4
c0de4970:	e00c      	b.n	c0de498c <update_transfer_wait_in_buffer+0x9c>
c0de4972:	eb09 0100 	add.w	r1, r9, r0
c0de4976:	f8d1 209c 	ldr.w	r2, [r1, #156]	@ 0x9c
c0de497a:	3a01      	subs	r2, #1
c0de497c:	f8c1 209c 	str.w	r2, [r1, #156]	@ 0x9c
c0de4980:	211a      	movs	r1, #26
c0de4982:	e003      	b.n	c0de498c <update_transfer_wait_in_buffer+0x9c>
c0de4984:	eb09 0100 	add.w	r1, r9, r0
c0de4988:	f891 10a6 	ldrb.w	r1, [r1, #166]	@ 0xa6
c0de498c:	4448      	add	r0, r9
c0de498e:	f880 1097 	strb.w	r1, [r0, #151]	@ 0x97
c0de4992:	4770      	bx	lr

c0de4994 <build_transfer_ui_step>:
c0de4994:	b570      	push	{r4, r5, r6, lr}
c0de4996:	b088      	sub	sp, #32
c0de4998:	f240 0400 	movw	r4, #0
c0de499c:	f2c0 0400 	movt	r4, #0
c0de49a0:	eb09 0004 	add.w	r0, r9, r4
c0de49a4:	f890 0097 	ldrb.w	r0, [r0, #151]	@ 0x97
c0de49a8:	b168      	cbz	r0, c0de49c6 <build_transfer_ui_step+0x32>
c0de49aa:	f240 50f8 	movw	r0, #1528	@ 0x5f8
c0de49ae:	f2c0 0000 	movt	r0, #0
c0de49b2:	4448      	add	r0, r9
c0de49b4:	7901      	ldrb	r1, [r0, #4]
c0de49b6:	2005      	movs	r0, #5
c0de49b8:	f000 fa7f 	bl	c0de4eba <try_to_fill_buffer>
c0de49bc:	eb09 0004 	add.w	r0, r9, r4
c0de49c0:	f890 0097 	ldrb.w	r0, [r0, #151]	@ 0x97
c0de49c4:	e000      	b.n	c0de49c8 <build_transfer_ui_step+0x34>
c0de49c6:	2000      	movs	r0, #0
c0de49c8:	2800      	cmp	r0, #0
c0de49ca:	f040 8145 	bne.w	c0de4c58 <build_transfer_ui_step+0x2c4>
c0de49ce:	eb09 0004 	add.w	r0, r9, r4
c0de49d2:	f890 0218 	ldrb.w	r0, [r0, #536]	@ 0x218
c0de49d6:	2800      	cmp	r0, #0
c0de49d8:	f040 813e 	bne.w	c0de4c58 <build_transfer_ui_step+0x2c4>
c0de49dc:	202d      	movs	r0, #45	@ 0x2d
c0de49de:	9007      	str	r0, [sp, #28]
c0de49e0:	eb09 0004 	add.w	r0, r9, r4
c0de49e4:	f890 0096 	ldrb.w	r0, [r0, #150]	@ 0x96
c0de49e8:	f819 1004 	ldrb.w	r1, [r9, r4]
c0de49ec:	2200      	movs	r2, #0
c0de49ee:	2807      	cmp	r0, #7
c0de49f0:	e9cd 2204 	strd	r2, r2, [sp, #16]
c0de49f4:	9203      	str	r2, [sp, #12]
c0de49f6:	9202      	str	r2, [sp, #8]
c0de49f8:	dc19      	bgt.n	c0de4a2e <build_transfer_ui_step+0x9a>
c0de49fa:	2803      	cmp	r0, #3
c0de49fc:	dc29      	bgt.n	c0de4a52 <build_transfer_ui_step+0xbe>
c0de49fe:	2801      	cmp	r0, #1
c0de4a00:	dc4f      	bgt.n	c0de4aa2 <build_transfer_ui_step+0x10e>
c0de4a02:	2800      	cmp	r0, #0
c0de4a04:	f000 8098 	beq.w	c0de4b38 <build_transfer_ui_step+0x1a4>
c0de4a08:	2801      	cmp	r0, #1
c0de4a0a:	f040 812b 	bne.w	c0de4c64 <build_transfer_ui_step+0x2d0>
c0de4a0e:	eb09 0c04 	add.w	ip, r9, r4
c0de4a12:	4662      	mov	r2, ip
c0de4a14:	ca1b      	ldmia	r2!, {r0, r1, r3, r4}
c0de4a16:	f10c 0eac 	add.w	lr, ip, #172	@ 0xac
c0de4a1a:	e8ae 001b 	stmia.w	lr!, {r0, r1, r3, r4}
c0de4a1e:	e892 001b 	ldmia.w	r2, {r0, r1, r3, r4}
c0de4a22:	e88e 001b 	stmia.w	lr, {r0, r1, r3, r4}
c0de4a26:	2002      	movs	r0, #2
c0de4a28:	f88c 0096 	strb.w	r0, [ip, #150]	@ 0x96
c0de4a2c:	e112      	b.n	c0de4c54 <build_transfer_ui_step+0x2c0>
c0de4a2e:	280b      	cmp	r0, #11
c0de4a30:	dc26      	bgt.n	c0de4a80 <build_transfer_ui_step+0xec>
c0de4a32:	2809      	cmp	r0, #9
c0de4a34:	dc4a      	bgt.n	c0de4acc <build_transfer_ui_step+0x138>
c0de4a36:	2808      	cmp	r0, #8
c0de4a38:	f000 8092 	beq.w	c0de4b60 <build_transfer_ui_step+0x1cc>
c0de4a3c:	2809      	cmp	r0, #9
c0de4a3e:	f040 8111 	bne.w	c0de4c64 <build_transfer_ui_step+0x2d0>
c0de4a42:	2901      	cmp	r1, #1
c0de4a44:	f000 8101 	beq.w	c0de4c4a <build_transfer_ui_step+0x2b6>
c0de4a48:	2902      	cmp	r1, #2
c0de4a4a:	f040 8107 	bne.w	c0de4c5c <build_transfer_ui_step+0x2c8>
c0de4a4e:	200b      	movs	r0, #11
c0de4a50:	e0fc      	b.n	c0de4c4c <build_transfer_ui_step+0x2b8>
c0de4a52:	2805      	cmp	r0, #5
c0de4a54:	dc49      	bgt.n	c0de4aea <build_transfer_ui_step+0x156>
c0de4a56:	2804      	cmp	r0, #4
c0de4a58:	f000 8094 	beq.w	c0de4b84 <build_transfer_ui_step+0x1f0>
c0de4a5c:	2805      	cmp	r0, #5
c0de4a5e:	f040 8101 	bne.w	c0de4c64 <build_transfer_ui_step+0x2d0>
c0de4a62:	eb09 0204 	add.w	r2, r9, r4
c0de4a66:	f102 00d0 	add.w	r0, r2, #208	@ 0xd0
c0de4a6a:	a907      	add	r1, sp, #28
c0de4a6c:	2320      	movs	r3, #32
c0de4a6e:	f7fb fb37 	bl	c0de00e0 <b58enc>
c0de4a72:	2800      	cmp	r0, #0
c0de4a74:	f000 80f2 	beq.w	c0de4c5c <build_transfer_ui_step+0x2c8>
c0de4a78:	eb09 0004 	add.w	r0, r9, r4
c0de4a7c:	2106      	movs	r1, #6
c0de4a7e:	e0ab      	b.n	c0de4bd8 <build_transfer_ui_step+0x244>
c0de4a80:	280d      	cmp	r0, #13
c0de4a82:	dc4b      	bgt.n	c0de4b1c <build_transfer_ui_step+0x188>
c0de4a84:	280c      	cmp	r0, #12
c0de4a86:	f000 8081 	beq.w	c0de4b8c <build_transfer_ui_step+0x1f8>
c0de4a8a:	280d      	cmp	r0, #13
c0de4a8c:	f040 80ea 	bne.w	c0de4c64 <build_transfer_ui_step+0x2d0>
c0de4a90:	444c      	add	r4, r9
c0de4a92:	f104 00a6 	add.w	r0, r4, #166	@ 0xa6
c0de4a96:	4621      	mov	r1, r4
c0de4a98:	2202      	movs	r2, #2
c0de4a9a:	f7fb ff0b 	bl	c0de08b4 <copy_in_reverse_order>
c0de4a9e:	200e      	movs	r0, #14
c0de4aa0:	e0b5      	b.n	c0de4c0e <build_transfer_ui_step+0x27a>
c0de4aa2:	2802      	cmp	r0, #2
c0de4aa4:	f000 8083 	beq.w	c0de4bae <build_transfer_ui_step+0x21a>
c0de4aa8:	2803      	cmp	r0, #3
c0de4aaa:	f040 80db 	bne.w	c0de4c64 <build_transfer_ui_step+0x2d0>
c0de4aae:	eb09 0204 	add.w	r2, r9, r4
c0de4ab2:	f502 7095 	add.w	r0, r2, #298	@ 0x12a
c0de4ab6:	a907      	add	r1, sp, #28
c0de4ab8:	2320      	movs	r3, #32
c0de4aba:	f7fb fb11 	bl	c0de00e0 <b58enc>
c0de4abe:	2800      	cmp	r0, #0
c0de4ac0:	f000 80cc 	beq.w	c0de4c5c <build_transfer_ui_step+0x2c8>
c0de4ac4:	eb09 0004 	add.w	r0, r9, r4
c0de4ac8:	2104      	movs	r1, #4
c0de4aca:	e085      	b.n	c0de4bd8 <build_transfer_ui_step+0x244>
c0de4acc:	280a      	cmp	r0, #10
c0de4ace:	d072      	beq.n	c0de4bb6 <build_transfer_ui_step+0x222>
c0de4ad0:	280b      	cmp	r0, #11
c0de4ad2:	f040 80c7 	bne.w	c0de4c64 <build_transfer_ui_step+0x2d0>
c0de4ad6:	eb09 0004 	add.w	r0, r9, r4
c0de4ada:	7841      	ldrb	r1, [r0, #1]
c0de4adc:	7882      	ldrb	r2, [r0, #2]
c0de4ade:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de4ae2:	f8a0 10a4 	strh.w	r1, [r0, #164]	@ 0xa4
c0de4ae6:	210c      	movs	r1, #12
c0de4ae8:	e076      	b.n	c0de4bd8 <build_transfer_ui_step+0x244>
c0de4aea:	2806      	cmp	r0, #6
c0de4aec:	d071      	beq.n	c0de4bd2 <build_transfer_ui_step+0x23e>
c0de4aee:	2807      	cmp	r0, #7
c0de4af0:	f040 80b8 	bne.w	c0de4c64 <build_transfer_ui_step+0x2d0>
c0de4af4:	444c      	add	r4, r9
c0de4af6:	a804      	add	r0, sp, #16
c0de4af8:	4621      	mov	r1, r4
c0de4afa:	2208      	movs	r2, #8
c0de4afc:	2608      	movs	r6, #8
c0de4afe:	f7fb fed9 	bl	c0de08b4 <copy_in_reverse_order>
c0de4b02:	e9dd 0104 	ldrd	r0, r1, [sp, #16]
c0de4b06:	f894 2321 	ldrb.w	r2, [r4, #801]	@ 0x321
c0de4b0a:	2514      	movs	r5, #20
c0de4b0c:	f104 03fd 	add.w	r3, r4, #253	@ 0xfd
c0de4b10:	9500      	str	r5, [sp, #0]
c0de4b12:	f7ff f885 	bl	c0de3c20 <print_amount>
c0de4b16:	f884 6096 	strb.w	r6, [r4, #150]	@ 0x96
c0de4b1a:	e09b      	b.n	c0de4c54 <build_transfer_ui_step+0x2c0>
c0de4b1c:	280e      	cmp	r0, #14
c0de4b1e:	d05e      	beq.n	c0de4bde <build_transfer_ui_step+0x24a>
c0de4b20:	280f      	cmp	r0, #15
c0de4b22:	f040 809f 	bne.w	c0de4c64 <build_transfer_ui_step+0x2d0>
c0de4b26:	eb09 0004 	add.w	r0, r9, r4
c0de4b2a:	2101      	movs	r1, #1
c0de4b2c:	f880 1218 	strb.w	r1, [r0, #536]	@ 0x218
c0de4b30:	2107      	movs	r1, #7
c0de4b32:	f880 139a 	strb.w	r1, [r0, #922]	@ 0x39a
c0de4b36:	e08f      	b.n	c0de4c58 <build_transfer_ui_step+0x2c4>
c0de4b38:	eb09 0104 	add.w	r1, r9, r4
c0de4b3c:	f8d1 03b8 	ldr.w	r0, [r1, #952]	@ 0x3b8
c0de4b40:	f891 2325 	ldrb.w	r2, [r1, #805]	@ 0x325
c0de4b44:	1c43      	adds	r3, r0, #1
c0de4b46:	2a02      	cmp	r2, #2
c0de4b48:	f8c1 309c 	str.w	r3, [r1, #156]	@ 0x9c
c0de4b4c:	bf02      	ittt	eq
c0de4b4e:	3002      	addeq	r0, #2
c0de4b50:	eb09 0104 	addeq.w	r1, r9, r4
c0de4b54:	f8c1 009c 	streq.w	r0, [r1, #156]	@ 0x9c
c0de4b58:	eb09 0004 	add.w	r0, r9, r4
c0de4b5c:	2101      	movs	r1, #1
c0de4b5e:	e03b      	b.n	c0de4bd8 <build_transfer_ui_step+0x244>
c0de4b60:	444c      	add	r4, r9
c0de4b62:	a802      	add	r0, sp, #8
c0de4b64:	4621      	mov	r1, r4
c0de4b66:	2208      	movs	r2, #8
c0de4b68:	f7fb fea4 	bl	c0de08b4 <copy_in_reverse_order>
c0de4b6c:	e9dd 0102 	ldrd	r0, r1, [sp, #8]
c0de4b70:	f894 2323 	ldrb.w	r2, [r4, #803]	@ 0x323
c0de4b74:	2614      	movs	r6, #20
c0de4b76:	f204 13eb 	addw	r3, r4, #491	@ 0x1eb
c0de4b7a:	9600      	str	r6, [sp, #0]
c0de4b7c:	f7ff f850 	bl	c0de3c20 <print_amount>
c0de4b80:	2009      	movs	r0, #9
c0de4b82:	e044      	b.n	c0de4c0e <build_transfer_ui_step+0x27a>
c0de4b84:	2901      	cmp	r1, #1
c0de4b86:	d145      	bne.n	c0de4c14 <build_transfer_ui_step+0x280>
c0de4b88:	2005      	movs	r0, #5
c0de4b8a:	e05f      	b.n	c0de4c4c <build_transfer_ui_step+0x2b8>
c0de4b8c:	eb09 0004 	add.w	r0, r9, r4
c0de4b90:	f8b0 20a4 	ldrh.w	r2, [r0, #164]	@ 0xa4
c0de4b94:	f1a2 001f 	sub.w	r0, r2, #31
c0de4b98:	f110 0f1c 	cmn.w	r0, #28
c0de4b9c:	d965      	bls.n	c0de4c6a <build_transfer_ui_step+0x2d6>
c0de4b9e:	444c      	add	r4, r9
c0de4ba0:	f204 1057 	addw	r0, r4, #343	@ 0x157
c0de4ba4:	4621      	mov	r1, r4
c0de4ba6:	f003 fc86 	bl	c0de84b6 <__aeabi_memmove>
c0de4baa:	200d      	movs	r0, #13
c0de4bac:	e02f      	b.n	c0de4c0e <build_transfer_ui_step+0x27a>
c0de4bae:	2901      	cmp	r1, #1
c0de4bb0:	d13d      	bne.n	c0de4c2e <build_transfer_ui_step+0x29a>
c0de4bb2:	2003      	movs	r0, #3
c0de4bb4:	e04a      	b.n	c0de4c4c <build_transfer_ui_step+0x2b8>
c0de4bb6:	eb09 0204 	add.w	r2, r9, r4
c0de4bba:	f202 1057 	addw	r0, r2, #343	@ 0x157
c0de4bbe:	a907      	add	r1, sp, #28
c0de4bc0:	231a      	movs	r3, #26
c0de4bc2:	f7fb fa8d 	bl	c0de00e0 <b58enc>
c0de4bc6:	2800      	cmp	r0, #0
c0de4bc8:	d048      	beq.n	c0de4c5c <build_transfer_ui_step+0x2c8>
c0de4bca:	eb09 0004 	add.w	r0, r9, r4
c0de4bce:	210d      	movs	r1, #13
c0de4bd0:	e002      	b.n	c0de4bd8 <build_transfer_ui_step+0x244>
c0de4bd2:	eb09 0004 	add.w	r0, r9, r4
c0de4bd6:	2107      	movs	r1, #7
c0de4bd8:	f880 1096 	strb.w	r1, [r0, #150]	@ 0x96
c0de4bdc:	e03a      	b.n	c0de4c54 <build_transfer_ui_step+0x2c0>
c0de4bde:	eb09 0004 	add.w	r0, r9, r4
c0de4be2:	f8b0 20a6 	ldrh.w	r2, [r0, #166]	@ 0xa6
c0de4be6:	2a2a      	cmp	r2, #42	@ 0x2a
c0de4be8:	d30a      	bcc.n	c0de4c00 <build_transfer_ui_step+0x26c>
c0de4bea:	f642 612e 	movw	r1, #11822	@ 0x2e2e
c0de4bee:	eb09 0004 	add.w	r0, r9, r4
c0de4bf2:	f2c0 012e 	movt	r1, #46	@ 0x2e
c0de4bf6:	2229      	movs	r2, #41	@ 0x29
c0de4bf8:	f8c0 11a4 	str.w	r1, [r0, #420]	@ 0x1a4
c0de4bfc:	f8a0 20a6 	strh.w	r2, [r0, #166]	@ 0xa6
c0de4c00:	444c      	add	r4, r9
c0de4c02:	f204 107b 	addw	r0, r4, #379	@ 0x17b
c0de4c06:	4621      	mov	r1, r4
c0de4c08:	f003 fc55 	bl	c0de84b6 <__aeabi_memmove>
c0de4c0c:	200f      	movs	r0, #15
c0de4c0e:	f884 0096 	strb.w	r0, [r4, #150]	@ 0x96
c0de4c12:	e01f      	b.n	c0de4c54 <build_transfer_ui_step+0x2c0>
c0de4c14:	f244 21f5 	movw	r1, #17141	@ 0x42f5
c0de4c18:	eb09 0004 	add.w	r0, r9, r4
c0de4c1c:	f2c0 0100 	movt	r1, #0
c0de4c20:	30d0      	adds	r0, #208	@ 0xd0
c0de4c22:	4479      	add	r1, pc
c0de4c24:	2205      	movs	r2, #5
c0de4c26:	f003 fc44 	bl	c0de84b2 <__aeabi_memcpy>
c0de4c2a:	2006      	movs	r0, #6
c0de4c2c:	e00e      	b.n	c0de4c4c <build_transfer_ui_step+0x2b8>
c0de4c2e:	f244 21d9 	movw	r1, #17113	@ 0x42d9
c0de4c32:	eb09 0004 	add.w	r0, r9, r4
c0de4c36:	f2c0 0100 	movt	r1, #0
c0de4c3a:	f500 7095 	add.w	r0, r0, #298	@ 0x12a
c0de4c3e:	4479      	add	r1, pc
c0de4c40:	2205      	movs	r2, #5
c0de4c42:	f003 fc36 	bl	c0de84b2 <__aeabi_memcpy>
c0de4c46:	2004      	movs	r0, #4
c0de4c48:	e000      	b.n	c0de4c4c <build_transfer_ui_step+0x2b8>
c0de4c4a:	200a      	movs	r0, #10
c0de4c4c:	eb09 0104 	add.w	r1, r9, r4
c0de4c50:	f881 0096 	strb.w	r0, [r1, #150]	@ 0x96
c0de4c54:	f7ff fe4c 	bl	c0de48f0 <update_transfer_wait_in_buffer>
c0de4c58:	b008      	add	sp, #32
c0de4c5a:	bd70      	pop	{r4, r5, r6, pc}
c0de4c5c:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de4c60:	f002 ff7b 	bl	c0de7b5a <os_longjmp>
c0de4c64:	200a      	movs	r0, #10
c0de4c66:	f002 ff78 	bl	c0de7b5a <os_longjmp>
c0de4c6a:	f249 1006 	movw	r0, #37126	@ 0x9106
c0de4c6e:	f002 ff74 	bl	c0de7b5a <os_longjmp>

c0de4c72 <ux_idle_flow_3_step_validateinit>:
c0de4c72:	20ff      	movs	r0, #255	@ 0xff
c0de4c74:	f003 f9f8 	bl	c0de8068 <os_sched_exit>

c0de4c78 <ux_display_address_flow_5_step_validateinit>:
c0de4c78:	2000      	movs	r0, #0
c0de4c7a:	f000 bdf2 	b.w	c0de5862 <io_seproxyhal_touch_address_ok>

c0de4c7e <ux_display_address_flow_6_step_validateinit>:
c0de4c7e:	2000      	movs	r0, #0
c0de4c80:	f000 be07 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4c84 <display_if_buffer_not_empty>:
c0de4c84:	b580      	push	{r7, lr}
c0de4c86:	f003 fc79 	bl	c0de857c <strnlen>
c0de4c8a:	b100      	cbz	r0, c0de4c8e <display_if_buffer_not_empty+0xa>
c0de4c8c:	bd80      	pop	{r7, pc}
c0de4c8e:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de4c92:	f2c0 0000 	movt	r0, #0
c0de4c96:	4448      	add	r0, r9
c0de4c98:	8c01      	ldrh	r1, [r0, #32]
c0de4c9a:	8c40      	ldrh	r0, [r0, #34]	@ 0x22
c0de4c9c:	4281      	cmp	r1, r0
c0de4c9e:	d203      	bcs.n	c0de4ca8 <display_if_buffer_not_empty+0x24>
c0de4ca0:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de4ca4:	f002 b8ac 	b.w	c0de6e00 <ux_flow_prev>
c0de4ca8:	d9f0      	bls.n	c0de4c8c <display_if_buffer_not_empty+0x8>
c0de4caa:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de4cae:	f002 b8a4 	b.w	c0de6dfa <ux_flow_next>

c0de4cb2 <ux_transfer_7_step_init>:
c0de4cb2:	b510      	push	{r4, lr}
c0de4cb4:	4604      	mov	r4, r0
c0de4cb6:	f240 0000 	movw	r0, #0
c0de4cba:	f2c0 0000 	movt	r0, #0
c0de4cbe:	4448      	add	r0, r9
c0de4cc0:	f200 107b 	addw	r0, r0, #379	@ 0x17b
c0de4cc4:	212d      	movs	r1, #45	@ 0x2d
c0de4cc6:	f7ff ffdd 	bl	c0de4c84 <display_if_buffer_not_empty>
c0de4cca:	4620      	mov	r0, r4
c0de4ccc:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de4cd0:	f002 bc29 	b.w	c0de7526 <ux_layout_bn_paging_init>

c0de4cd4 <ux_transfer_10_step_validateinit>:
c0de4cd4:	2000      	movs	r0, #0
c0de4cd6:	f000 bdf1 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4cda <ux_transfer_11_step_validateinit>:
c0de4cda:	2000      	movs	r0, #0
c0de4cdc:	f000 bdd9 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4ce0 <ux_data_6_step_validateinit>:
c0de4ce0:	2000      	movs	r0, #0
c0de4ce2:	f000 bdeb 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4ce6 <ux_data_7_step_validateinit>:
c0de4ce6:	2000      	movs	r0, #0
c0de4ce8:	f000 bdd3 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4cec <ux_issue_12_step_validateinit>:
c0de4cec:	2000      	movs	r0, #0
c0de4cee:	f000 bde5 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4cf2 <ux_issue_13_step_validateinit>:
c0de4cf2:	2000      	movs	r0, #0
c0de4cf4:	f000 bdcd 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4cf8 <ux_reissue_9_step_validateinit>:
c0de4cf8:	2000      	movs	r0, #0
c0de4cfa:	f000 bddf 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4cfe <ux_reissue_10_step_validateinit>:
c0de4cfe:	2000      	movs	r0, #0
c0de4d00:	f000 bdc7 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4d04 <ux_burn_8_step_validateinit>:
c0de4d04:	2000      	movs	r0, #0
c0de4d06:	f000 bdd9 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4d0a <ux_burn_9_step_validateinit>:
c0de4d0a:	2000      	movs	r0, #0
c0de4d0c:	f000 bdc1 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4d10 <ux_lease_8_step_validateinit>:
c0de4d10:	2000      	movs	r0, #0
c0de4d12:	f000 bdd3 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4d16 <ux_lease_9_step_validateinit>:
c0de4d16:	2000      	movs	r0, #0
c0de4d18:	f000 bdbb 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4d1c <ux_cancel_lease_7_step_validateinit>:
c0de4d1c:	2000      	movs	r0, #0
c0de4d1e:	f000 bdcd 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4d22 <ux_cancel_lease_8_step_validateinit>:
c0de4d22:	2000      	movs	r0, #0
c0de4d24:	f000 bdb5 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4d28 <ux_create_alias_7_step_validateinit>:
c0de4d28:	2000      	movs	r0, #0
c0de4d2a:	f000 bdc7 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4d2e <ux_create_alias_8_step_validateinit>:
c0de4d2e:	2000      	movs	r0, #0
c0de4d30:	f000 bdaf 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4d34 <ux_masstransfer_5_step_init>:
c0de4d34:	b510      	push	{r4, lr}
c0de4d36:	4604      	mov	r4, r0
c0de4d38:	f240 0000 	movw	r0, #0
c0de4d3c:	f2c0 0000 	movt	r0, #0
c0de4d40:	4448      	add	r0, r9
c0de4d42:	f500 7095 	add.w	r0, r0, #298	@ 0x12a
c0de4d46:	212d      	movs	r1, #45	@ 0x2d
c0de4d48:	f7ff ff9c 	bl	c0de4c84 <display_if_buffer_not_empty>
c0de4d4c:	4620      	mov	r0, r4
c0de4d4e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de4d52:	f002 bbe8 	b.w	c0de7526 <ux_layout_bn_paging_init>

c0de4d56 <ux_masstransfer_8_step_validateinit>:
c0de4d56:	2000      	movs	r0, #0
c0de4d58:	f000 bdb0 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4d5c <ux_masstransfer_9_step_validateinit>:
c0de4d5c:	2000      	movs	r0, #0
c0de4d5e:	f000 bd98 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4d62 <ux_set_ac_script_6_step_validateinit>:
c0de4d62:	2000      	movs	r0, #0
c0de4d64:	f000 bdaa 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4d68 <ux_set_ac_script_7_step_validateinit>:
c0de4d68:	2000      	movs	r0, #0
c0de4d6a:	f000 bd92 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4d6e <ux_set_as_script_7_step_validateinit>:
c0de4d6e:	2000      	movs	r0, #0
c0de4d70:	f000 bda4 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4d74 <ux_set_as_script_8_step_validateinit>:
c0de4d74:	2000      	movs	r0, #0
c0de4d76:	f000 bd8c 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4d7a <ux_sponsorship_8_step_validateinit>:
c0de4d7a:	2000      	movs	r0, #0
c0de4d7c:	f000 bd9e 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4d80 <ux_sponsorship_9_step_validateinit>:
c0de4d80:	2000      	movs	r0, #0
c0de4d82:	f000 bd86 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4d86 <ux_update_asset_9_step_validateinit>:
c0de4d86:	2000      	movs	r0, #0
c0de4d88:	f000 bd98 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4d8c <ux_update_asset_10_step_validateinit>:
c0de4d8c:	2000      	movs	r0, #0
c0de4d8e:	f000 bd80 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4d92 <ux_invoke_4_step_init>:
c0de4d92:	b510      	push	{r4, lr}
c0de4d94:	4604      	mov	r4, r0
c0de4d96:	f240 0000 	movw	r0, #0
c0de4d9a:	f2c0 0000 	movt	r0, #0
c0de4d9e:	4448      	add	r0, r9
c0de4da0:	f200 107b 	addw	r0, r0, #379	@ 0x17b
c0de4da4:	212d      	movs	r1, #45	@ 0x2d
c0de4da6:	f7ff ff6d 	bl	c0de4c84 <display_if_buffer_not_empty>
c0de4daa:	4620      	mov	r0, r4
c0de4dac:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de4db0:	f002 bbb9 	b.w	c0de7526 <ux_layout_bn_paging_init>

c0de4db4 <ux_invoke_5_step_init>:
c0de4db4:	b510      	push	{r4, lr}
c0de4db6:	4604      	mov	r4, r0
c0de4db8:	f240 0000 	movw	r0, #0
c0de4dbc:	f2c0 0000 	movt	r0, #0
c0de4dc0:	4448      	add	r0, r9
c0de4dc2:	30fd      	adds	r0, #253	@ 0xfd
c0de4dc4:	212d      	movs	r1, #45	@ 0x2d
c0de4dc6:	f7ff ff5d 	bl	c0de4c84 <display_if_buffer_not_empty>
c0de4dca:	4620      	mov	r0, r4
c0de4dcc:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de4dd0:	f002 bba9 	b.w	c0de7526 <ux_layout_bn_paging_init>

c0de4dd4 <ux_invoke_6_step_init>:
c0de4dd4:	b510      	push	{r4, lr}
c0de4dd6:	4604      	mov	r4, r0
c0de4dd8:	f240 0000 	movw	r0, #0
c0de4ddc:	f2c0 0000 	movt	r0, #0
c0de4de0:	4448      	add	r0, r9
c0de4de2:	f200 10d5 	addw	r0, r0, #469	@ 0x1d5
c0de4de6:	2116      	movs	r1, #22
c0de4de8:	f7ff ff4c 	bl	c0de4c84 <display_if_buffer_not_empty>
c0de4dec:	4620      	mov	r0, r4
c0de4dee:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de4df2:	f002 bb98 	b.w	c0de7526 <ux_layout_bn_paging_init>

c0de4df6 <ux_invoke_7_step_init>:
c0de4df6:	b510      	push	{r4, lr}
c0de4df8:	4604      	mov	r4, r0
c0de4dfa:	f240 0000 	movw	r0, #0
c0de4dfe:	f2c0 0000 	movt	r0, #0
c0de4e02:	4448      	add	r0, r9
c0de4e04:	f500 70d4 	add.w	r0, r0, #424	@ 0x1a8
c0de4e08:	212d      	movs	r1, #45	@ 0x2d
c0de4e0a:	f7ff ff3b 	bl	c0de4c84 <display_if_buffer_not_empty>
c0de4e0e:	4620      	mov	r0, r4
c0de4e10:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de4e14:	f002 bb87 	b.w	c0de7526 <ux_layout_bn_paging_init>

c0de4e18 <ux_invoke_12_step_validateinit>:
c0de4e18:	2000      	movs	r0, #0
c0de4e1a:	f000 bd4f 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4e1e <ux_invoke_13_step_validateinit>:
c0de4e1e:	2000      	movs	r0, #0
c0de4e20:	f000 bd37 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4e24 <ux_order_9_step_validateinit>:
c0de4e24:	2000      	movs	r0, #0
c0de4e26:	f000 bd49 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4e2a <ux_order_10_step_validateinit>:
c0de4e2a:	2000      	movs	r0, #0
c0de4e2c:	f000 bd31 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4e30 <ux_verify_transaction_4_step_validateinit>:
c0de4e30:	2000      	movs	r0, #0
c0de4e32:	f000 bd43 	b.w	c0de58bc <io_seproxyhal_touch_sign_approve>

c0de4e36 <ux_verify_transaction_5_step_validateinit>:
c0de4e36:	2000      	movs	r0, #0
c0de4e38:	f000 bd2b 	b.w	c0de5892 <io_seproxyhal_cancel>

c0de4e3c <menu_address_init>:
c0de4e3c:	f240 50e0 	movw	r0, #1504	@ 0x5e0
c0de4e40:	f2c0 0000 	movt	r0, #0
c0de4e44:	2100      	movs	r1, #0
c0de4e46:	f849 1000 	str.w	r1, [r9, r0]
c0de4e4a:	f244 31b8 	movw	r1, #17336	@ 0x43b8
c0de4e4e:	f240 5ce4 	movw	ip, #1508	@ 0x5e4
c0de4e52:	f2c0 0100 	movt	r1, #0
c0de4e56:	f2c0 0c00 	movt	ip, #0
c0de4e5a:	2302      	movs	r3, #2
c0de4e5c:	4479      	add	r1, pc
c0de4e5e:	2000      	movs	r0, #0
c0de4e60:	2200      	movs	r2, #0
c0de4e62:	f849 300c 	str.w	r3, [r9, ip]
c0de4e66:	f002 b8c5 	b.w	c0de6ff4 <ux_flow_init>

c0de4e6a <ui_idle>:
c0de4e6a:	b580      	push	{r7, lr}
c0de4e6c:	f240 50e0 	movw	r0, #1504	@ 0x5e0
c0de4e70:	f2c0 0000 	movt	r0, #0
c0de4e74:	2100      	movs	r1, #0
c0de4e76:	f240 42d0 	movw	r2, #1232	@ 0x4d0
c0de4e7a:	f849 1000 	str.w	r1, [r9, r0]
c0de4e7e:	f240 50e4 	movw	r0, #1508	@ 0x5e4
c0de4e82:	f2c0 0200 	movt	r2, #0
c0de4e86:	f2c0 0000 	movt	r0, #0
c0de4e8a:	f819 2002 	ldrb.w	r2, [r9, r2]
c0de4e8e:	f849 1000 	str.w	r1, [r9, r0]
c0de4e92:	f240 50e8 	movw	r0, #1512	@ 0x5e8
c0de4e96:	f2c0 0000 	movt	r0, #0
c0de4e9a:	f809 1000 	strb.w	r1, [r9, r0]
c0de4e9e:	b90a      	cbnz	r2, c0de4ea4 <ui_idle+0x3a>
c0de4ea0:	f002 fd46 	bl	c0de7930 <ux_stack_push>
c0de4ea4:	f244 21c4 	movw	r1, #17092	@ 0x42c4
c0de4ea8:	f2c0 0100 	movt	r1, #0
c0de4eac:	4479      	add	r1, pc
c0de4eae:	2000      	movs	r0, #0
c0de4eb0:	2200      	movs	r2, #0
c0de4eb2:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de4eb6:	f002 b89d 	b.w	c0de6ff4 <ux_flow_init>

c0de4eba <try_to_fill_buffer>:
c0de4eba:	b5b0      	push	{r4, r5, r7, lr}
c0de4ebc:	f240 0c00 	movw	ip, #0
c0de4ec0:	f2c0 0c00 	movt	ip, #0
c0de4ec4:	eb09 040c 	add.w	r4, r9, ip
c0de4ec8:	f8d4 309c 	ldr.w	r3, [r4, #156]	@ 0x9c
c0de4ecc:	f894 2097 	ldrb.w	r2, [r4, #151]	@ 0x97
c0de4ed0:	1acc      	subs	r4, r1, r3
c0de4ed2:	4294      	cmp	r4, r2
c0de4ed4:	bf28      	it	cs
c0de4ed6:	4614      	movcs	r4, r2
c0de4ed8:	b302      	cbz	r2, c0de4f1c <try_to_fill_buffer+0x62>
c0de4eda:	1819      	adds	r1, r3, r0
c0de4edc:	2997      	cmp	r1, #151	@ 0x97
c0de4ede:	d21d      	bcs.n	c0de4f1c <try_to_fill_buffer+0x62>
c0de4ee0:	eb09 050c 	add.w	r5, r9, ip
c0de4ee4:	f240 52f8 	movw	r2, #1528	@ 0x5f8
c0de4ee8:	f895 0098 	ldrb.w	r0, [r5, #152]	@ 0x98
c0de4eec:	f2c0 0200 	movt	r2, #0
c0de4ef0:	444a      	add	r2, r9
c0de4ef2:	4428      	add	r0, r5
c0de4ef4:	4411      	add	r1, r2
c0de4ef6:	4622      	mov	r2, r4
c0de4ef8:	f003 fadb 	bl	c0de84b2 <__aeabi_memcpy>
c0de4efc:	f8d5 009c 	ldr.w	r0, [r5, #156]	@ 0x9c
c0de4f00:	f895 1097 	ldrb.w	r1, [r5, #151]	@ 0x97
c0de4f04:	4420      	add	r0, r4
c0de4f06:	f8c5 009c 	str.w	r0, [r5, #156]	@ 0x9c
c0de4f0a:	f895 0098 	ldrb.w	r0, [r5, #152]	@ 0x98
c0de4f0e:	4420      	add	r0, r4
c0de4f10:	f885 0098 	strb.w	r0, [r5, #152]	@ 0x98
c0de4f14:	1b08      	subs	r0, r1, r4
c0de4f16:	f885 0097 	strb.w	r0, [r5, #151]	@ 0x97
c0de4f1a:	bdb0      	pop	{r4, r5, r7, pc}
c0de4f1c:	2007      	movs	r0, #7
c0de4f1e:	f002 fe1c 	bl	c0de7b5a <os_longjmp>

c0de4f22 <build_other_data_ui>:
c0de4f22:	b5b0      	push	{r4, r5, r7, lr}
c0de4f24:	b094      	sub	sp, #80	@ 0x50
c0de4f26:	f240 0500 	movw	r5, #0
c0de4f2a:	f2c0 0500 	movt	r5, #0
c0de4f2e:	eb09 0005 	add.w	r0, r9, r5
c0de4f32:	f890 4324 	ldrb.w	r4, [r0, #804]	@ 0x324
c0de4f36:	f245 61ba 	movw	r1, #22202	@ 0x56ba
c0de4f3a:	f2c0 0100 	movt	r1, #0
c0de4f3e:	f500 7095 	add.w	r0, r0, #298	@ 0x12a
c0de4f42:	4479      	add	r1, pc
c0de4f44:	220f      	movs	r2, #15
c0de4f46:	f003 fab4 	bl	c0de84b2 <__aeabi_memcpy>
c0de4f4a:	2c0a      	cmp	r4, #10
c0de4f4c:	dc11      	bgt.n	c0de4f72 <build_other_data_ui+0x50>
c0de4f4e:	2c05      	cmp	r4, #5
c0de4f50:	dd22      	ble.n	c0de4f98 <build_other_data_ui+0x76>
c0de4f52:	2c08      	cmp	r4, #8
c0de4f54:	dc55      	bgt.n	c0de5002 <build_other_data_ui+0xe0>
c0de4f56:	2c06      	cmp	r4, #6
c0de4f58:	d078      	beq.n	c0de504c <build_other_data_ui+0x12a>
c0de4f5a:	2c08      	cmp	r4, #8
c0de4f5c:	f040 80bb 	bne.w	c0de50d6 <build_other_data_ui+0x1b4>
c0de4f60:	f245 61e6 	movw	r1, #22246	@ 0x56e6
c0de4f64:	eb09 0005 	add.w	r0, r9, r5
c0de4f68:	f2c0 0100 	movt	r1, #0
c0de4f6c:	30fd      	adds	r0, #253	@ 0xfd
c0de4f6e:	4479      	add	r1, pc
c0de4f70:	e09b      	b.n	c0de50aa <build_other_data_ui+0x188>
c0de4f72:	2c0d      	cmp	r4, #13
c0de4f74:	dd34      	ble.n	c0de4fe0 <build_other_data_ui+0xbe>
c0de4f76:	2c0f      	cmp	r4, #15
c0de4f78:	dc5b      	bgt.n	c0de5032 <build_other_data_ui+0x110>
c0de4f7a:	2c0e      	cmp	r4, #14
c0de4f7c:	d06f      	beq.n	c0de505e <build_other_data_ui+0x13c>
c0de4f7e:	2c0f      	cmp	r4, #15
c0de4f80:	f040 80a9 	bne.w	c0de50d6 <build_other_data_ui+0x1b4>
c0de4f84:	f245 712e 	movw	r1, #22318	@ 0x572e
c0de4f88:	eb09 0005 	add.w	r0, r9, r5
c0de4f8c:	f2c0 0100 	movt	r1, #0
c0de4f90:	30fd      	adds	r0, #253	@ 0xfd
c0de4f92:	4479      	add	r1, pc
c0de4f94:	220d      	movs	r2, #13
c0de4f96:	e0bb      	b.n	c0de5110 <build_other_data_ui+0x1ee>
c0de4f98:	2c03      	cmp	r4, #3
c0de4f9a:	d06a      	beq.n	c0de5072 <build_other_data_ui+0x150>
c0de4f9c:	2c04      	cmp	r4, #4
c0de4f9e:	d072      	beq.n	c0de5086 <build_other_data_ui+0x164>
c0de4fa0:	2c05      	cmp	r4, #5
c0de4fa2:	f040 8098 	bne.w	c0de50d6 <build_other_data_ui+0x1b4>
c0de4fa6:	f246 5172 	movw	r1, #25970	@ 0x6572
c0de4faa:	eb09 0005 	add.w	r0, r9, r5
c0de4fae:	f2c7 3169 	movt	r1, #29545	@ 0x7369
c0de4fb2:	f800 1ffd 	strb.w	r1, [r0, #253]!
c0de4fb6:	f247 5173 	movw	r1, #30067	@ 0x7573
c0de4fba:	f2c0 0165 	movt	r1, #101	@ 0x65
c0de4fbe:	f800 1f04 	strb.w	r1, [r0, #4]!
c0de4fc2:	2100      	movs	r1, #0
c0de4fc4:	2275      	movs	r2, #117	@ 0x75
c0de4fc6:	70c1      	strb	r1, [r0, #3]
c0de4fc8:	2165      	movs	r1, #101	@ 0x65
c0de4fca:	7042      	strb	r2, [r0, #1]
c0de4fcc:	2273      	movs	r2, #115	@ 0x73
c0de4fce:	7081      	strb	r1, [r0, #2]
c0de4fd0:	f800 2c01 	strb.w	r2, [r0, #-1]
c0de4fd4:	2269      	movs	r2, #105	@ 0x69
c0de4fd6:	f800 2c02 	strb.w	r2, [r0, #-2]
c0de4fda:	f800 1c03 	strb.w	r1, [r0, #-3]
c0de4fde:	e099      	b.n	c0de5114 <build_other_data_ui+0x1f2>
c0de4fe0:	2c0b      	cmp	r4, #11
c0de4fe2:	d05a      	beq.n	c0de509a <build_other_data_ui+0x178>
c0de4fe4:	2c0c      	cmp	r4, #12
c0de4fe6:	f000 808a 	beq.w	c0de50fe <build_other_data_ui+0x1dc>
c0de4fea:	2c0d      	cmp	r4, #13
c0de4fec:	d173      	bne.n	c0de50d6 <build_other_data_ui+0x1b4>
c0de4fee:	f245 61a8 	movw	r1, #22184	@ 0x56a8
c0de4ff2:	eb09 0005 	add.w	r0, r9, r5
c0de4ff6:	f2c0 0100 	movt	r1, #0
c0de4ffa:	30fd      	adds	r0, #253	@ 0xfd
c0de4ffc:	4479      	add	r1, pc
c0de4ffe:	220b      	movs	r2, #11
c0de5000:	e086      	b.n	c0de5110 <build_other_data_ui+0x1ee>
c0de5002:	2c09      	cmp	r4, #9
c0de5004:	d053      	beq.n	c0de50ae <build_other_data_ui+0x18c>
c0de5006:	2c0a      	cmp	r4, #10
c0de5008:	d165      	bne.n	c0de50d6 <build_other_data_ui+0x1b4>
c0de500a:	f245 614a 	movw	r1, #22090	@ 0x564a
c0de500e:	eb09 0405 	add.w	r4, r9, r5
c0de5012:	f2c0 0100 	movt	r1, #0
c0de5016:	f504 7095 	add.w	r0, r4, #298	@ 0x12a
c0de501a:	4479      	add	r1, pc
c0de501c:	2211      	movs	r2, #17
c0de501e:	f003 fa48 	bl	c0de84b2 <__aeabi_memcpy>
c0de5022:	f245 614a 	movw	r1, #22090	@ 0x564a
c0de5026:	f2c0 0100 	movt	r1, #0
c0de502a:	f104 00fd 	add.w	r0, r4, #253	@ 0xfd
c0de502e:	4479      	add	r1, pc
c0de5030:	e04f      	b.n	c0de50d2 <build_other_data_ui+0x1b0>
c0de5032:	2c10      	cmp	r4, #16
c0de5034:	d045      	beq.n	c0de50c2 <build_other_data_ui+0x1a0>
c0de5036:	2c11      	cmp	r4, #17
c0de5038:	d14d      	bne.n	c0de50d6 <build_other_data_ui+0x1b4>
c0de503a:	f245 619c 	movw	r1, #22172	@ 0x569c
c0de503e:	eb09 0005 	add.w	r0, r9, r5
c0de5042:	f2c0 0100 	movt	r1, #0
c0de5046:	30fd      	adds	r0, #253	@ 0xfd
c0de5048:	4479      	add	r1, pc
c0de504a:	e042      	b.n	c0de50d2 <build_other_data_ui+0x1b0>
c0de504c:	f245 51f4 	movw	r1, #22004	@ 0x55f4
c0de5050:	eb09 0005 	add.w	r0, r9, r5
c0de5054:	f2c0 0100 	movt	r1, #0
c0de5058:	30fd      	adds	r0, #253	@ 0xfd
c0de505a:	4479      	add	r1, pc
c0de505c:	e057      	b.n	c0de510e <build_other_data_ui+0x1ec>
c0de505e:	f245 6144 	movw	r1, #22084	@ 0x5644
c0de5062:	eb09 0005 	add.w	r0, r9, r5
c0de5066:	f2c0 0100 	movt	r1, #0
c0de506a:	30fd      	adds	r0, #253	@ 0xfd
c0de506c:	4479      	add	r1, pc
c0de506e:	220c      	movs	r2, #12
c0de5070:	e04e      	b.n	c0de5110 <build_other_data_ui+0x1ee>
c0de5072:	f245 51bc 	movw	r1, #21948	@ 0x55bc
c0de5076:	eb09 0005 	add.w	r0, r9, r5
c0de507a:	f2c0 0100 	movt	r1, #0
c0de507e:	30fd      	adds	r0, #253	@ 0xfd
c0de5080:	4479      	add	r1, pc
c0de5082:	2206      	movs	r2, #6
c0de5084:	e044      	b.n	c0de5110 <build_other_data_ui+0x1ee>
c0de5086:	f245 51b0 	movw	r1, #21936	@ 0x55b0
c0de508a:	eb09 0005 	add.w	r0, r9, r5
c0de508e:	f2c0 0100 	movt	r1, #0
c0de5092:	30fd      	adds	r0, #253	@ 0xfd
c0de5094:	4479      	add	r1, pc
c0de5096:	2209      	movs	r2, #9
c0de5098:	e03a      	b.n	c0de5110 <build_other_data_ui+0x1ee>
c0de509a:	f245 51e4 	movw	r1, #21988	@ 0x55e4
c0de509e:	eb09 0005 	add.w	r0, r9, r5
c0de50a2:	f2c0 0100 	movt	r1, #0
c0de50a6:	30fd      	adds	r0, #253	@ 0xfd
c0de50a8:	4479      	add	r1, pc
c0de50aa:	220e      	movs	r2, #14
c0de50ac:	e030      	b.n	c0de5110 <build_other_data_ui+0x1ee>
c0de50ae:	f245 5170 	movw	r1, #21872	@ 0x5570
c0de50b2:	eb09 0005 	add.w	r0, r9, r5
c0de50b6:	f2c0 0100 	movt	r1, #0
c0de50ba:	30fd      	adds	r0, #253	@ 0xfd
c0de50bc:	4479      	add	r1, pc
c0de50be:	220f      	movs	r2, #15
c0de50c0:	e026      	b.n	c0de5110 <build_other_data_ui+0x1ee>
c0de50c2:	f245 6100 	movw	r1, #22016	@ 0x5600
c0de50c6:	eb09 0005 	add.w	r0, r9, r5
c0de50ca:	f2c0 0100 	movt	r1, #0
c0de50ce:	30fd      	adds	r0, #253	@ 0xfd
c0de50d0:	4479      	add	r1, pc
c0de50d2:	2212      	movs	r2, #18
c0de50d4:	e01c      	b.n	c0de5110 <build_other_data_ui+0x1ee>
c0de50d6:	2cc9      	cmp	r4, #201	@ 0xc9
c0de50d8:	d31c      	bcc.n	c0de5114 <build_other_data_ui+0x1f2>
c0de50da:	f245 610d 	movw	r1, #22029	@ 0x560d
c0de50de:	eb09 0005 	add.w	r0, r9, r5
c0de50e2:	f2c0 0100 	movt	r1, #0
c0de50e6:	f500 7095 	add.w	r0, r0, #298	@ 0x12a
c0de50ea:	4479      	add	r1, pc
c0de50ec:	2205      	movs	r2, #5
c0de50ee:	f003 f9e0 	bl	c0de84b2 <__aeabi_memcpy>
c0de50f2:	2cfd      	cmp	r4, #253	@ 0xfd
c0de50f4:	dc39      	bgt.n	c0de516a <build_other_data_ui+0x248>
c0de50f6:	2cfc      	cmp	r4, #252	@ 0xfc
c0de50f8:	d04d      	beq.n	c0de5196 <build_other_data_ui+0x274>
c0de50fa:	2cfd      	cmp	r4, #253	@ 0xfd
c0de50fc:	d179      	bne.n	c0de51f2 <build_other_data_ui+0x2d0>
c0de50fe:	f245 518f 	movw	r1, #21903	@ 0x558f
c0de5102:	eb09 0005 	add.w	r0, r9, r5
c0de5106:	f2c0 0100 	movt	r1, #0
c0de510a:	30fd      	adds	r0, #253	@ 0xfd
c0de510c:	4479      	add	r1, pc
c0de510e:	2205      	movs	r2, #5
c0de5110:	f003 f9cf 	bl	c0de84b2 <__aeabi_memcpy>
c0de5114:	eb09 0005 	add.w	r0, r9, r5
c0de5118:	30fd      	adds	r0, #253	@ 0xfd
c0de511a:	f003 fa27 	bl	c0de856c <strlen>
c0de511e:	b950      	cbnz	r0, c0de5136 <build_other_data_ui+0x214>
c0de5120:	f245 51e2 	movw	r1, #21986	@ 0x55e2
c0de5124:	eb09 0005 	add.w	r0, r9, r5
c0de5128:	f2c0 0100 	movt	r1, #0
c0de512c:	30fd      	adds	r0, #253	@ 0xfd
c0de512e:	4479      	add	r1, pc
c0de5130:	220c      	movs	r2, #12
c0de5132:	f003 f9be 	bl	c0de84b2 <__aeabi_memcpy>
c0de5136:	eb09 0005 	add.w	r0, r9, r5
c0de513a:	ac01      	add	r4, sp, #4
c0de513c:	f500 7067 	add.w	r0, r0, #924	@ 0x39c
c0de5140:	4621      	mov	r1, r4
c0de5142:	f7fb f8c3 	bl	c0de02cc <get_curve25519_public_key_for_path>
c0de5146:	2800      	cmp	r0, #0
c0de5148:	d05d      	beq.n	c0de5206 <build_other_data_ui+0x2e4>
c0de514a:	f104 0008 	add.w	r0, r4, #8
c0de514e:	eb09 0c05 	add.w	ip, r9, r5
c0de5152:	c83a      	ldmia	r0!, {r1, r3, r4, r5}
c0de5154:	f10c 02ac 	add.w	r2, ip, #172	@ 0xac
c0de5158:	c23a      	stmia	r2!, {r1, r3, r4, r5}
c0de515a:	e890 003a 	ldmia.w	r0, {r1, r3, r4, r5}
c0de515e:	2001      	movs	r0, #1
c0de5160:	c23a      	stmia	r2!, {r1, r3, r4, r5}
c0de5162:	f88c 0218 	strb.w	r0, [ip, #536]	@ 0x218
c0de5166:	b014      	add	sp, #80	@ 0x50
c0de5168:	bdb0      	pop	{r4, r5, r7, pc}
c0de516a:	2cfe      	cmp	r4, #254	@ 0xfe
c0de516c:	d01c      	beq.n	c0de51a8 <build_other_data_ui+0x286>
c0de516e:	2cff      	cmp	r4, #255	@ 0xff
c0de5170:	d13f      	bne.n	c0de51f2 <build_other_data_ui+0x2d0>
c0de5172:	eb09 0005 	add.w	r0, r9, r5
c0de5176:	216d      	movs	r1, #109	@ 0x6d
c0de5178:	f800 1ffd 	strb.w	r1, [r0, #253]!
c0de517c:	2161      	movs	r1, #97	@ 0x61
c0de517e:	f800 1f04 	strb.w	r1, [r0, #4]!
c0de5182:	2100      	movs	r1, #0
c0de5184:	2267      	movs	r2, #103	@ 0x67
c0de5186:	70c1      	strb	r1, [r0, #3]
c0de5188:	2165      	movs	r1, #101	@ 0x65
c0de518a:	7042      	strb	r2, [r0, #1]
c0de518c:	2273      	movs	r2, #115	@ 0x73
c0de518e:	7081      	strb	r1, [r0, #2]
c0de5190:	f800 2c01 	strb.w	r2, [r0, #-1]
c0de5194:	e71f      	b.n	c0de4fd6 <build_other_data_ui+0xb4>
c0de5196:	f245 5159 	movw	r1, #21849	@ 0x5559
c0de519a:	eb09 0005 	add.w	r0, r9, r5
c0de519e:	f2c0 0100 	movt	r1, #0
c0de51a2:	30fd      	adds	r0, #253	@ 0xfd
c0de51a4:	4479      	add	r1, pc
c0de51a6:	e76c      	b.n	c0de5082 <build_other_data_ui+0x160>
c0de51a8:	f64f 50f2 	movw	r0, #65010	@ 0xfdf2
c0de51ac:	f247 5173 	movw	r1, #30067	@ 0x7573
c0de51b0:	f2c0 000e 	movt	r0, #14
c0de51b4:	f2c0 0165 	movt	r1, #101	@ 0x65
c0de51b8:	4408      	add	r0, r1
c0de51ba:	f246 5172 	movw	r1, #25970	@ 0x6572
c0de51be:	f2c7 3169 	movt	r1, #29545	@ 0x7369
c0de51c2:	f101 7102 	add.w	r1, r1, #34078720	@ 0x2080000
c0de51c6:	eb09 0205 	add.w	r2, r9, r5
c0de51ca:	f802 1ffd 	strb.w	r1, [r2, #253]!
c0de51ce:	f802 0f04 	strb.w	r0, [r2, #4]!
c0de51d2:	2000      	movs	r0, #0
c0de51d4:	70d0      	strb	r0, [r2, #3]
c0de51d6:	2074      	movs	r0, #116	@ 0x74
c0de51d8:	7090      	strb	r0, [r2, #2]
c0de51da:	2073      	movs	r0, #115	@ 0x73
c0de51dc:	7050      	strb	r0, [r2, #1]
c0de51de:	2075      	movs	r0, #117	@ 0x75
c0de51e0:	f802 0c01 	strb.w	r0, [r2, #-1]
c0de51e4:	2071      	movs	r0, #113	@ 0x71
c0de51e6:	f802 0c02 	strb.w	r0, [r2, #-2]
c0de51ea:	2065      	movs	r0, #101	@ 0x65
c0de51ec:	f802 0c03 	strb.w	r0, [r2, #-3]
c0de51f0:	e790      	b.n	c0de5114 <build_other_data_ui+0x1f2>
c0de51f2:	f245 5104 	movw	r1, #21764	@ 0x5504
c0de51f6:	eb09 0005 	add.w	r0, r9, r5
c0de51fa:	f2c0 0100 	movt	r1, #0
c0de51fe:	30fd      	adds	r0, #253	@ 0xfd
c0de5200:	4479      	add	r1, pc
c0de5202:	220a      	movs	r2, #10
c0de5204:	e784      	b.n	c0de5110 <build_other_data_ui+0x1ee>
c0de5206:	2002      	movs	r0, #2
c0de5208:	f002 fca7 	bl	c0de7b5a <os_longjmp>

c0de520c <getMessageType>:
c0de520c:	b580      	push	{r7, lr}
c0de520e:	f240 0000 	movw	r0, #0
c0de5212:	f2c0 0000 	movt	r0, #0
c0de5216:	4448      	add	r0, r9
c0de5218:	f890 2324 	ldrb.w	r2, [r0, #804]	@ 0x324
c0de521c:	f890 1325 	ldrb.w	r1, [r0, #805]	@ 0x325
c0de5220:	2a0a      	cmp	r2, #10
c0de5222:	dc08      	bgt.n	c0de5236 <getMessageType+0x2a>
c0de5224:	2a05      	cmp	r2, #5
c0de5226:	dd0f      	ble.n	c0de5248 <getMessageType+0x3c>
c0de5228:	2a08      	cmp	r2, #8
c0de522a:	dc1b      	bgt.n	c0de5264 <getMessageType+0x58>
c0de522c:	2a06      	cmp	r2, #6
c0de522e:	d01d      	beq.n	c0de526c <getMessageType+0x60>
c0de5230:	2a08      	cmp	r2, #8
c0de5232:	d01b      	beq.n	c0de526c <getMessageType+0x60>
c0de5234:	e023      	b.n	c0de527e <getMessageType+0x72>
c0de5236:	2a0d      	cmp	r2, #13
c0de5238:	dd0d      	ble.n	c0de5256 <getMessageType+0x4a>
c0de523a:	2a0f      	cmp	r2, #15
c0de523c:	dc1b      	bgt.n	c0de5276 <getMessageType+0x6a>
c0de523e:	2a0e      	cmp	r2, #14
c0de5240:	d027      	beq.n	c0de5292 <getMessageType+0x86>
c0de5242:	2a0f      	cmp	r2, #15
c0de5244:	d025      	beq.n	c0de5292 <getMessageType+0x86>
c0de5246:	e01a      	b.n	c0de527e <getMessageType+0x72>
c0de5248:	2a03      	cmp	r2, #3
c0de524a:	d00f      	beq.n	c0de526c <getMessageType+0x60>
c0de524c:	2a04      	cmp	r2, #4
c0de524e:	d00d      	beq.n	c0de526c <getMessageType+0x60>
c0de5250:	2a05      	cmp	r2, #5
c0de5252:	d00b      	beq.n	c0de526c <getMessageType+0x60>
c0de5254:	e013      	b.n	c0de527e <getMessageType+0x72>
c0de5256:	2a0b      	cmp	r2, #11
c0de5258:	d01b      	beq.n	c0de5292 <getMessageType+0x86>
c0de525a:	2a0c      	cmp	r2, #12
c0de525c:	d019      	beq.n	c0de5292 <getMessageType+0x86>
c0de525e:	2a0d      	cmp	r2, #13
c0de5260:	d017      	beq.n	c0de5292 <getMessageType+0x86>
c0de5262:	e00c      	b.n	c0de527e <getMessageType+0x72>
c0de5264:	2a09      	cmp	r2, #9
c0de5266:	d001      	beq.n	c0de526c <getMessageType+0x60>
c0de5268:	2a0a      	cmp	r2, #10
c0de526a:	d108      	bne.n	c0de527e <getMessageType+0x72>
c0de526c:	2002      	movs	r0, #2
c0de526e:	2903      	cmp	r1, #3
c0de5270:	bf38      	it	cc
c0de5272:	2001      	movcc	r0, #1
c0de5274:	bd80      	pop	{r7, pc}
c0de5276:	2a10      	cmp	r2, #16
c0de5278:	d00b      	beq.n	c0de5292 <getMessageType+0x86>
c0de527a:	2a11      	cmp	r2, #17
c0de527c:	d00e      	beq.n	c0de529c <getMessageType+0x90>
c0de527e:	2ac9      	cmp	r2, #201	@ 0xc9
c0de5280:	d30e      	bcc.n	c0de52a0 <getMessageType+0x94>
c0de5282:	2002      	movs	r0, #2
c0de5284:	2904      	cmp	r1, #4
c0de5286:	bf38      	it	cc
c0de5288:	2001      	movcc	r0, #1
c0de528a:	2afc      	cmp	r2, #252	@ 0xfc
c0de528c:	bf18      	it	ne
c0de528e:	2001      	movne	r0, #1
c0de5290:	bd80      	pop	{r7, pc}
c0de5292:	2901      	cmp	r1, #1
c0de5294:	bf04      	itt	eq
c0de5296:	2001      	moveq	r0, #1
c0de5298:	bd80      	popeq	{r7, pc}
c0de529a:	b109      	cbz	r1, c0de52a0 <getMessageType+0x94>
c0de529c:	2002      	movs	r0, #2
c0de529e:	bd80      	pop	{r7, pc}
c0de52a0:	f249 1004 	movw	r0, #37124	@ 0x9104
c0de52a4:	f002 fc59 	bl	c0de7b5a <os_longjmp>

c0de52a8 <make_allowed_ui_steps>:
c0de52a8:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de52ac:	b083      	sub	sp, #12
c0de52ae:	f240 0700 	movw	r7, #0
c0de52b2:	f2c0 0700 	movt	r7, #0
c0de52b6:	eb09 0107 	add.w	r1, r9, r7
c0de52ba:	f8d1 1328 	ldr.w	r1, [r1, #808]	@ 0x328
c0de52be:	4604      	mov	r4, r0
c0de52c0:	2902      	cmp	r1, #2
c0de52c2:	d176      	bne.n	c0de53b2 <make_allowed_ui_steps+0x10a>
c0de52c4:	b17c      	cbz	r4, c0de52e6 <make_allowed_ui_steps+0x3e>
c0de52c6:	f240 50f8 	movw	r0, #1528	@ 0x5f8
c0de52ca:	f2c0 0000 	movt	r0, #0
c0de52ce:	4448      	add	r0, r9
c0de52d0:	7901      	ldrb	r1, [r0, #4]
c0de52d2:	eb09 0007 	add.w	r0, r9, r7
c0de52d6:	f8d0 23b8 	ldr.w	r2, [r0, #952]	@ 0x3b8
c0de52da:	428a      	cmp	r2, r1
c0de52dc:	d103      	bne.n	c0de52e6 <make_allowed_ui_steps+0x3e>
c0de52de:	f890 039a 	ldrb.w	r0, [r0, #922]	@ 0x39a
c0de52e2:	2806      	cmp	r0, #6
c0de52e4:	d07e      	beq.n	c0de53e4 <make_allowed_ui_steps+0x13c>
c0de52e6:	eb09 0007 	add.w	r0, r9, r7
c0de52ea:	f890 0218 	ldrb.w	r0, [r0, #536]	@ 0x218
c0de52ee:	2801      	cmp	r0, #1
c0de52f0:	f000 81c3 	beq.w	c0de567a <make_allowed_ui_steps+0x3d2>
c0de52f4:	f240 58f8 	movw	r8, #1528	@ 0x5f8
c0de52f8:	f2c0 0800 	movt	r8, #0
c0de52fc:	eb09 0007 	add.w	r0, r9, r7
c0de5300:	eb09 0308 	add.w	r3, r9, r8
c0de5304:	f890 23b8 	ldrb.w	r2, [r0, #952]	@ 0x3b8
c0de5308:	791b      	ldrb	r3, [r3, #4]
c0de530a:	f8d0 53bc 	ldr.w	r5, [r0, #956]	@ 0x3bc
c0de530e:	f890 1324 	ldrb.w	r1, [r0, #804]	@ 0x324
c0de5312:	1a98      	subs	r0, r3, r2
c0de5314:	2d00      	cmp	r5, #0
c0de5316:	f04f 0305 	mov.w	r3, #5
c0de531a:	bf08      	it	eq
c0de531c:	381d      	subeq	r0, #29
c0de531e:	bf08      	it	eq
c0de5320:	2322      	moveq	r3, #34	@ 0x22
c0de5322:	29fc      	cmp	r1, #252	@ 0xfc
c0de5324:	eb03 0102 	add.w	r1, r3, r2
c0de5328:	d165      	bne.n	c0de53f6 <make_allowed_ui_steps+0x14e>
c0de532a:	eb09 0207 	add.w	r2, r9, r7
c0de532e:	f892 239a 	ldrb.w	r2, [r2, #922]	@ 0x39a
c0de5332:	2a06      	cmp	r2, #6
c0de5334:	d131      	bne.n	c0de539a <make_allowed_ui_steps+0xf2>
c0de5336:	eb09 0507 	add.w	r5, r9, r7
c0de533a:	b2ce      	uxtb	r6, r1
c0de533c:	eb09 0108 	add.w	r1, r9, r8
c0de5340:	f8b5 33b4 	ldrh.w	r3, [r5, #948]	@ 0x3b4
c0de5344:	4431      	add	r1, r6
c0de5346:	b2c2      	uxtb	r2, r0
c0de5348:	4628      	mov	r0, r5
c0de534a:	9600      	str	r6, [sp, #0]
c0de534c:	f7ff fa39 	bl	c0de47c2 <build_protobuf_order>
c0de5350:	f105 060a 	add.w	r6, r5, #10
c0de5354:	4630      	mov	r0, r6
c0de5356:	2140      	movs	r1, #64	@ 0x40
c0de5358:	f003 f8a8 	bl	c0de84ac <__aeabi_memclr>
c0de535c:	f04f 0c20 	mov.w	ip, #32
c0de5360:	f505 7008 	add.w	r0, r5, #544	@ 0x220
c0de5364:	2101      	movs	r1, #1
c0de5366:	2200      	movs	r2, #0
c0de5368:	2300      	movs	r3, #0
c0de536a:	9600      	str	r6, [sp, #0]
c0de536c:	f8cd c004 	str.w	ip, [sp, #4]
c0de5370:	f002 fbcf 	bl	c0de7b12 <cx_hash_no_throw>
c0de5374:	2800      	cmp	r0, #0
c0de5376:	f040 817a 	bne.w	c0de566e <make_allowed_ui_steps+0x3c6>
c0de537a:	eb09 0507 	add.w	r5, r9, r7
c0de537e:	f505 7008 	add.w	r0, r5, #544	@ 0x220
c0de5382:	f002 fbc2 	bl	c0de7b0a <cx_hash_get_size>
c0de5386:	f205 306d 	addw	r0, r5, #877	@ 0x36d
c0de538a:	f105 010a 	add.w	r1, r5, #10
c0de538e:	2220      	movs	r2, #32
c0de5390:	f003 f89e 	bl	c0de84d0 <memcmp>
c0de5394:	2800      	cmp	r0, #0
c0de5396:	f040 816c 	bne.w	c0de5672 <make_allowed_ui_steps+0x3ca>
c0de539a:	2c00      	cmp	r4, #0
c0de539c:	f000 8171 	beq.w	c0de5682 <make_allowed_ui_steps+0x3da>
c0de53a0:	eb09 0007 	add.w	r0, r9, r7
c0de53a4:	2108      	movs	r1, #8
c0de53a6:	f880 139a 	strb.w	r1, [r0, #922]	@ 0x39a
c0de53aa:	2101      	movs	r1, #1
c0de53ac:	f880 1218 	strb.w	r1, [r0, #536]	@ 0x218
c0de53b0:	e15a      	b.n	c0de5668 <make_allowed_ui_steps+0x3c0>
c0de53b2:	eb09 0107 	add.w	r1, r9, r7
c0de53b6:	f891 0096 	ldrb.w	r0, [r1, #150]	@ 0x96
c0de53ba:	f891 139a 	ldrb.w	r1, [r1, #922]	@ 0x39a
c0de53be:	b9a8      	cbnz	r0, c0de53ec <make_allowed_ui_steps+0x144>
c0de53c0:	2906      	cmp	r1, #6
c0de53c2:	d113      	bne.n	c0de53ec <make_allowed_ui_steps+0x144>
c0de53c4:	2c00      	cmp	r4, #0
c0de53c6:	f000 808f 	beq.w	c0de54e8 <make_allowed_ui_steps+0x240>
c0de53ca:	f240 52f8 	movw	r2, #1528	@ 0x5f8
c0de53ce:	f2c0 0200 	movt	r2, #0
c0de53d2:	444a      	add	r2, r9
c0de53d4:	eb09 0307 	add.w	r3, r9, r7
c0de53d8:	7912      	ldrb	r2, [r2, #4]
c0de53da:	f8d3 53b8 	ldr.w	r5, [r3, #952]	@ 0x3b8
c0de53de:	4295      	cmp	r5, r2
c0de53e0:	f040 8086 	bne.w	c0de54f0 <make_allowed_ui_steps+0x248>
c0de53e4:	f249 1002 	movw	r0, #37122	@ 0x9102
c0de53e8:	f002 fbb7 	bl	c0de7b5a <os_longjmp>
c0de53ec:	eb09 0207 	add.w	r2, r9, r7
c0de53f0:	f892 509c 	ldrb.w	r5, [r2, #156]	@ 0x9c
c0de53f4:	e084      	b.n	c0de5500 <make_allowed_ui_steps+0x258>
c0de53f6:	eb09 0407 	add.w	r4, r9, r7
c0de53fa:	b2ce      	uxtb	r6, r1
c0de53fc:	eb09 0108 	add.w	r1, r9, r8
c0de5400:	f8b4 33b4 	ldrh.w	r3, [r4, #948]	@ 0x3b4
c0de5404:	4431      	add	r1, r6
c0de5406:	b2c2      	uxtb	r2, r0
c0de5408:	4620      	mov	r0, r4
c0de540a:	9600      	str	r6, [sp, #0]
c0de540c:	f7ff f977 	bl	c0de46fe <build_protobuf_root_tx>
c0de5410:	f104 050a 	add.w	r5, r4, #10
c0de5414:	4628      	mov	r0, r5
c0de5416:	2140      	movs	r1, #64	@ 0x40
c0de5418:	f003 f848 	bl	c0de84ac <__aeabi_memclr>
c0de541c:	2620      	movs	r6, #32
c0de541e:	f504 7008 	add.w	r0, r4, #544	@ 0x220
c0de5422:	2101      	movs	r1, #1
c0de5424:	2200      	movs	r2, #0
c0de5426:	2300      	movs	r3, #0
c0de5428:	9500      	str	r5, [sp, #0]
c0de542a:	9601      	str	r6, [sp, #4]
c0de542c:	f002 fb71 	bl	c0de7b12 <cx_hash_no_throw>
c0de5430:	2800      	cmp	r0, #0
c0de5432:	f040 811c 	bne.w	c0de566e <make_allowed_ui_steps+0x3c6>
c0de5436:	eb09 0407 	add.w	r4, r9, r7
c0de543a:	f504 7008 	add.w	r0, r4, #544	@ 0x220
c0de543e:	f002 fb64 	bl	c0de7b0a <cx_hash_get_size>
c0de5442:	f204 306d 	addw	r0, r4, #877	@ 0x36d
c0de5446:	f104 010a 	add.w	r1, r4, #10
c0de544a:	2220      	movs	r2, #32
c0de544c:	f003 f840 	bl	c0de84d0 <memcmp>
c0de5450:	2800      	cmp	r0, #0
c0de5452:	f040 810e 	bne.w	c0de5672 <make_allowed_ui_steps+0x3ca>
c0de5456:	eb09 0407 	add.w	r4, r9, r7
c0de545a:	4620      	mov	r0, r4
c0de545c:	21aa      	movs	r1, #170	@ 0xaa
c0de545e:	f003 f825 	bl	c0de84ac <__aeabi_memclr>
c0de5462:	f504 7408 	add.w	r4, r4, #544	@ 0x220
c0de5466:	4620      	mov	r0, r4
c0de5468:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de546c:	f003 f81e 	bl	c0de84ac <__aeabi_memclr>
c0de5470:	4620      	mov	r0, r4
c0de5472:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de5476:	f002 fb30 	bl	c0de7ada <cx_blake2b_init_no_throw>
c0de547a:	2800      	cmp	r0, #0
c0de547c:	f040 80f7 	bne.w	c0de566e <make_allowed_ui_steps+0x3c6>
c0de5480:	eb09 0407 	add.w	r4, r9, r7
c0de5484:	eb09 0108 	add.w	r1, r9, r8
c0de5488:	f894 039b 	ldrb.w	r0, [r4, #923]	@ 0x39b
c0de548c:	790b      	ldrb	r3, [r1, #4]
c0de548e:	180a      	adds	r2, r1, r0
c0de5490:	1a18      	subs	r0, r3, r0
c0de5492:	f8b4 33b4 	ldrh.w	r3, [r4, #948]	@ 0x3b4
c0de5496:	1d51      	adds	r1, r2, #5
c0de5498:	b2c2      	uxtb	r2, r0
c0de549a:	4620      	mov	r0, r4
c0de549c:	f7ff f859 	bl	c0de4552 <build_protobuf_child_tx>
c0de54a0:	f104 050a 	add.w	r5, r4, #10
c0de54a4:	4628      	mov	r0, r5
c0de54a6:	2140      	movs	r1, #64	@ 0x40
c0de54a8:	f003 f800 	bl	c0de84ac <__aeabi_memclr>
c0de54ac:	2620      	movs	r6, #32
c0de54ae:	f504 7008 	add.w	r0, r4, #544	@ 0x220
c0de54b2:	2101      	movs	r1, #1
c0de54b4:	2200      	movs	r2, #0
c0de54b6:	2300      	movs	r3, #0
c0de54b8:	9500      	str	r5, [sp, #0]
c0de54ba:	9601      	str	r6, [sp, #4]
c0de54bc:	f002 fb29 	bl	c0de7b12 <cx_hash_no_throw>
c0de54c0:	2800      	cmp	r0, #0
c0de54c2:	f040 80d4 	bne.w	c0de566e <make_allowed_ui_steps+0x3c6>
c0de54c6:	eb09 0407 	add.w	r4, r9, r7
c0de54ca:	f504 7008 	add.w	r0, r4, #544	@ 0x220
c0de54ce:	f002 fb1c 	bl	c0de7b0a <cx_hash_get_size>
c0de54d2:	f204 306d 	addw	r0, r4, #877	@ 0x36d
c0de54d6:	f104 010a 	add.w	r1, r4, #10
c0de54da:	2220      	movs	r2, #32
c0de54dc:	f002 fff8 	bl	c0de84d0 <memcmp>
c0de54e0:	2800      	cmp	r0, #0
c0de54e2:	f000 80c1 	beq.w	c0de5668 <make_allowed_ui_steps+0x3c0>
c0de54e6:	e0c4      	b.n	c0de5672 <make_allowed_ui_steps+0x3ca>
c0de54e8:	eb09 0207 	add.w	r2, r9, r7
c0de54ec:	f892 53b8 	ldrb.w	r5, [r2, #952]	@ 0x3b8
c0de54f0:	eb09 0207 	add.w	r2, r9, r7
c0de54f4:	f8d2 23bc 	ldr.w	r2, [r2, #956]	@ 0x3bc
c0de54f8:	b912      	cbnz	r2, c0de5500 <make_allowed_ui_steps+0x258>
c0de54fa:	b2ea      	uxtb	r2, r5
c0de54fc:	f102 051d 	add.w	r5, r2, #29
c0de5500:	2906      	cmp	r1, #6
c0de5502:	f040 80a6 	bne.w	c0de5652 <make_allowed_ui_steps+0x3aa>
c0de5506:	eb09 0107 	add.w	r1, r9, r7
c0de550a:	f891 1324 	ldrb.w	r1, [r1, #804]	@ 0x324
c0de550e:	f240 58f8 	movw	r8, #1528	@ 0x5f8
c0de5512:	2904      	cmp	r1, #4
c0de5514:	f2c0 0800 	movt	r8, #0
c0de5518:	d11e      	bne.n	c0de5558 <make_allowed_ui_steps+0x2b0>
c0de551a:	eb09 0108 	add.w	r1, r9, r8
c0de551e:	790e      	ldrb	r6, [r1, #4]
c0de5520:	e006      	b.n	c0de5530 <make_allowed_ui_steps+0x288>
c0de5522:	bf00      	nop
c0de5524:	f7ff fa36 	bl	c0de4994 <build_transfer_ui_step>
c0de5528:	eb09 0007 	add.w	r0, r9, r7
c0de552c:	f890 0096 	ldrb.w	r0, [r0, #150]	@ 0x96
c0de5530:	eb09 0107 	add.w	r1, r9, r7
c0de5534:	f8d1 109c 	ldr.w	r1, [r1, #156]	@ 0x9c
c0de5538:	42b1      	cmp	r1, r6
c0de553a:	d002      	beq.n	c0de5542 <make_allowed_ui_steps+0x29a>
c0de553c:	b2c1      	uxtb	r1, r0
c0de553e:	290f      	cmp	r1, #15
c0de5540:	d3f0      	bcc.n	c0de5524 <make_allowed_ui_steps+0x27c>
c0de5542:	b2c0      	uxtb	r0, r0
c0de5544:	280f      	cmp	r0, #15
c0de5546:	bf02      	ittt	eq
c0de5548:	eb09 0007 	addeq.w	r0, r9, r7
c0de554c:	f890 0218 	ldrbeq.w	r0, [r0, #536]	@ 0x218
c0de5550:	f010 0001 	andseq.w	r0, r0, #1
c0de5554:	d105      	bne.n	c0de5562 <make_allowed_ui_steps+0x2ba>
c0de5556:	e7e5      	b.n	c0de5524 <make_allowed_ui_steps+0x27c>
c0de5558:	3001      	adds	r0, #1
c0de555a:	eb09 0107 	add.w	r1, r9, r7
c0de555e:	f881 0096 	strb.w	r0, [r1, #150]	@ 0x96
c0de5562:	eb09 0008 	add.w	r0, r9, r8
c0de5566:	7900      	ldrb	r0, [r0, #4]
c0de5568:	eb09 0207 	add.w	r2, r9, r7
c0de556c:	1b40      	subs	r0, r0, r5
c0de556e:	f8d2 10a0 	ldr.w	r1, [r2, #160]	@ 0xa0
c0de5572:	b2c3      	uxtb	r3, r0
c0de5574:	f8d2 23b4 	ldr.w	r2, [r2, #948]	@ 0x3b4
c0de5578:	18c8      	adds	r0, r1, r3
c0de557a:	4290      	cmp	r0, r2
c0de557c:	b2ee      	uxtb	r6, r5
c0de557e:	d218      	bcs.n	c0de55b2 <make_allowed_ui_steps+0x30a>
c0de5580:	eb09 0107 	add.w	r1, r9, r7
c0de5584:	f8c1 00a0 	str.w	r0, [r1, #160]	@ 0xa0
c0de5588:	eb09 0008 	add.w	r0, r9, r8
c0de558c:	4430      	add	r0, r6
c0de558e:	1d42      	adds	r2, r0, #5
c0de5590:	2600      	movs	r6, #0
c0de5592:	f501 7008 	add.w	r0, r1, #544	@ 0x220
c0de5596:	2100      	movs	r1, #0
c0de5598:	9600      	str	r6, [sp, #0]
c0de559a:	9601      	str	r6, [sp, #4]
c0de559c:	f002 fab9 	bl	c0de7b12 <cx_hash_no_throw>
c0de55a0:	2800      	cmp	r0, #0
c0de55a2:	d164      	bne.n	c0de566e <make_allowed_ui_steps+0x3c6>
c0de55a4:	eb09 0007 	add.w	r0, r9, r7
c0de55a8:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de55ac:	f002 faad 	bl	c0de7b0a <cx_hash_get_size>
c0de55b0:	e04f      	b.n	c0de5652 <make_allowed_ui_steps+0x3aa>
c0de55b2:	eb09 0007 	add.w	r0, r9, r7
c0de55b6:	1a55      	subs	r5, r2, r1
c0de55b8:	f890 1324 	ldrb.w	r1, [r0, #804]	@ 0x324
c0de55bc:	f04f 0a00 	mov.w	sl, #0
c0de55c0:	2904      	cmp	r1, #4
c0de55c2:	f8c0 a0a0 	str.w	sl, [r0, #160]	@ 0xa0
c0de55c6:	d105      	bne.n	c0de55d4 <make_allowed_ui_steps+0x32c>
c0de55c8:	b2eb      	uxtb	r3, r5
c0de55ca:	eb09 0007 	add.w	r0, r9, r7
c0de55ce:	f8c0 30a0 	str.w	r3, [r0, #160]	@ 0xa0
c0de55d2:	e00c      	b.n	c0de55ee <make_allowed_ui_steps+0x346>
c0de55d4:	f7ff fca5 	bl	c0de4f22 <build_other_data_ui>
c0de55d8:	eb09 0007 	add.w	r0, r9, r7
c0de55dc:	2107      	movs	r1, #7
c0de55de:	f880 139a 	strb.w	r1, [r0, #922]	@ 0x39a
c0de55e2:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de55e6:	b2eb      	uxtb	r3, r5
c0de55e8:	4419      	add	r1, r3
c0de55ea:	f8c0 10a0 	str.w	r1, [r0, #160]	@ 0xa0
c0de55ee:	eb09 0108 	add.w	r1, r9, r8
c0de55f2:	4431      	add	r1, r6
c0de55f4:	1d4a      	adds	r2, r1, #5
c0de55f6:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de55fa:	2100      	movs	r1, #0
c0de55fc:	f8cd a000 	str.w	sl, [sp]
c0de5600:	f8cd a004 	str.w	sl, [sp, #4]
c0de5604:	f002 fa85 	bl	c0de7b12 <cx_hash_no_throw>
c0de5608:	bb88      	cbnz	r0, c0de566e <make_allowed_ui_steps+0x3c6>
c0de560a:	eb09 0507 	add.w	r5, r9, r7
c0de560e:	f505 7608 	add.w	r6, r5, #544	@ 0x220
c0de5612:	4630      	mov	r0, r6
c0de5614:	f002 fa79 	bl	c0de7b0a <cx_hash_get_size>
c0de5618:	4628      	mov	r0, r5
c0de561a:	2140      	movs	r1, #64	@ 0x40
c0de561c:	f002 ff46 	bl	c0de84ac <__aeabi_memclr>
c0de5620:	f04f 0c20 	mov.w	ip, #32
c0de5624:	4630      	mov	r0, r6
c0de5626:	2101      	movs	r1, #1
c0de5628:	2200      	movs	r2, #0
c0de562a:	2300      	movs	r3, #0
c0de562c:	9500      	str	r5, [sp, #0]
c0de562e:	f8cd c004 	str.w	ip, [sp, #4]
c0de5632:	f002 fa6e 	bl	c0de7b12 <cx_hash_no_throw>
c0de5636:	b9d0      	cbnz	r0, c0de566e <make_allowed_ui_steps+0x3c6>
c0de5638:	eb09 0507 	add.w	r5, r9, r7
c0de563c:	f505 7008 	add.w	r0, r5, #544	@ 0x220
c0de5640:	f002 fa63 	bl	c0de7b0a <cx_hash_get_size>
c0de5644:	f205 306d 	addw	r0, r5, #877	@ 0x36d
c0de5648:	4629      	mov	r1, r5
c0de564a:	2220      	movs	r2, #32
c0de564c:	f002 ff40 	bl	c0de84d0 <memcmp>
c0de5650:	b978      	cbnz	r0, c0de5672 <make_allowed_ui_steps+0x3ca>
c0de5652:	b124      	cbz	r4, c0de565e <make_allowed_ui_steps+0x3b6>
c0de5654:	eb09 0007 	add.w	r0, r9, r7
c0de5658:	2108      	movs	r1, #8
c0de565a:	f880 139a 	strb.w	r1, [r0, #922]	@ 0x39a
c0de565e:	eb09 0007 	add.w	r0, r9, r7
c0de5662:	2100      	movs	r1, #0
c0de5664:	f8c0 109c 	str.w	r1, [r0, #156]	@ 0x9c
c0de5668:	b003      	add	sp, #12
c0de566a:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de566e:	f002 fa74 	bl	c0de7b5a <os_longjmp>
c0de5672:	f249 1001 	movw	r0, #37121	@ 0x9101
c0de5676:	f002 fa70 	bl	c0de7b5a <os_longjmp>
c0de567a:	f44f 40da 	mov.w	r0, #27904	@ 0x6d00
c0de567e:	f002 fa6c 	bl	c0de7b5a <os_longjmp>
c0de5682:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de5686:	f002 fa68 	bl	c0de7b5a <os_longjmp>

c0de568a <show_sign_ui>:
c0de568a:	f240 0000 	movw	r0, #0
c0de568e:	f2c0 0000 	movt	r0, #0
c0de5692:	4448      	add	r0, r9
c0de5694:	f240 51e0 	movw	r1, #1504	@ 0x5e0
c0de5698:	f890 0324 	ldrb.w	r0, [r0, #804]	@ 0x324
c0de569c:	f2c0 0100 	movt	r1, #0
c0de56a0:	2200      	movs	r2, #0
c0de56a2:	f849 2001 	str.w	r2, [r9, r1]
c0de56a6:	2203      	movs	r2, #3
c0de56a8:	2804      	cmp	r0, #4
c0de56aa:	bf08      	it	eq
c0de56ac:	2209      	moveq	r2, #9
c0de56ae:	f643 40aa 	movw	r0, #15530	@ 0x3caa
c0de56b2:	f2c0 0000 	movt	r0, #0
c0de56b6:	f644 7104 	movw	r1, #20228	@ 0x4f04
c0de56ba:	f2c0 0100 	movt	r1, #0
c0de56be:	4478      	add	r0, pc
c0de56c0:	4479      	add	r1, pc
c0de56c2:	bf08      	it	eq
c0de56c4:	4601      	moveq	r1, r0
c0de56c6:	f240 50e4 	movw	r0, #1508	@ 0x5e4
c0de56ca:	f2c0 0000 	movt	r0, #0
c0de56ce:	f240 5ce8 	movw	ip, #1512	@ 0x5e8
c0de56d2:	f849 2000 	str.w	r2, [r9, r0]
c0de56d6:	f2c0 0c00 	movt	ip, #0
c0de56da:	2301      	movs	r3, #1
c0de56dc:	2000      	movs	r0, #0
c0de56de:	2200      	movs	r2, #0
c0de56e0:	f809 300c 	strb.w	r3, [r9, ip]
c0de56e4:	f001 bc86 	b.w	c0de6ff4 <ux_flow_init>

c0de56e8 <show_sign_protobuf_ui>:
c0de56e8:	f240 0000 	movw	r0, #0
c0de56ec:	f2c0 0000 	movt	r0, #0
c0de56f0:	4448      	add	r0, r9
c0de56f2:	f240 51e0 	movw	r1, #1504	@ 0x5e0
c0de56f6:	f890 0324 	ldrb.w	r0, [r0, #804]	@ 0x324
c0de56fa:	f2c0 0100 	movt	r1, #0
c0de56fe:	2200      	movs	r2, #0
c0de5700:	f849 2001 	str.w	r2, [r9, r1]
c0de5704:	f240 51e8 	movw	r1, #1512	@ 0x5e8
c0de5708:	f2c0 0100 	movt	r1, #0
c0de570c:	2201      	movs	r2, #1
c0de570e:	280a      	cmp	r0, #10
c0de5710:	f809 2001 	strb.w	r2, [r9, r1]
c0de5714:	dd0e      	ble.n	c0de5734 <show_sign_protobuf_ui+0x4c>
c0de5716:	280e      	cmp	r0, #14
c0de5718:	dc1b      	bgt.n	c0de5752 <show_sign_protobuf_ui+0x6a>
c0de571a:	280c      	cmp	r0, #12
c0de571c:	dc33      	bgt.n	c0de5786 <show_sign_protobuf_ui+0x9e>
c0de571e:	280b      	cmp	r0, #11
c0de5720:	d050      	beq.n	c0de57c4 <show_sign_protobuf_ui+0xdc>
c0de5722:	280c      	cmp	r0, #12
c0de5724:	f040 8093 	bne.w	c0de584e <show_sign_protobuf_ui+0x166>
c0de5728:	f643 5148 	movw	r1, #15688	@ 0x3d48
c0de572c:	f2c0 0100 	movt	r1, #0
c0de5730:	4479      	add	r1, pc
c0de5732:	e070      	b.n	c0de5816 <show_sign_protobuf_ui+0x12e>
c0de5734:	2805      	cmp	r0, #5
c0de5736:	dd1a      	ble.n	c0de576e <show_sign_protobuf_ui+0x86>
c0de5738:	2808      	cmp	r0, #8
c0de573a:	dc2e      	bgt.n	c0de579a <show_sign_protobuf_ui+0xb2>
c0de573c:	2806      	cmp	r0, #6
c0de573e:	d047      	beq.n	c0de57d0 <show_sign_protobuf_ui+0xe8>
c0de5740:	2808      	cmp	r0, #8
c0de5742:	f040 8084 	bne.w	c0de584e <show_sign_protobuf_ui+0x166>
c0de5746:	f244 218e 	movw	r1, #17038	@ 0x428e
c0de574a:	f2c0 0100 	movt	r1, #0
c0de574e:	4479      	add	r1, pc
c0de5750:	e043      	b.n	c0de57da <show_sign_protobuf_ui+0xf2>
c0de5752:	2810      	cmp	r0, #16
c0de5754:	dc2b      	bgt.n	c0de57ae <show_sign_protobuf_ui+0xc6>
c0de5756:	280f      	cmp	r0, #15
c0de5758:	d042      	beq.n	c0de57e0 <show_sign_protobuf_ui+0xf8>
c0de575a:	2810      	cmp	r0, #16
c0de575c:	d177      	bne.n	c0de584e <show_sign_protobuf_ui+0x166>
c0de575e:	f644 4126 	movw	r1, #19494	@ 0x4c26
c0de5762:	f2c0 0100 	movt	r1, #0
c0de5766:	4479      	add	r1, pc
c0de5768:	f04f 0c0b 	mov.w	ip, #11
c0de576c:	e065      	b.n	c0de583a <show_sign_protobuf_ui+0x152>
c0de576e:	2803      	cmp	r0, #3
c0de5770:	d03c      	beq.n	c0de57ec <show_sign_protobuf_ui+0x104>
c0de5772:	2804      	cmp	r0, #4
c0de5774:	d042      	beq.n	c0de57fc <show_sign_protobuf_ui+0x114>
c0de5776:	2805      	cmp	r0, #5
c0de5778:	d169      	bne.n	c0de584e <show_sign_protobuf_ui+0x166>
c0de577a:	f643 71e6 	movw	r1, #16358	@ 0x3fe6
c0de577e:	f2c0 0100 	movt	r1, #0
c0de5782:	4479      	add	r1, pc
c0de5784:	e029      	b.n	c0de57da <show_sign_protobuf_ui+0xf2>
c0de5786:	280d      	cmp	r0, #13
c0de5788:	d040      	beq.n	c0de580c <show_sign_protobuf_ui+0x124>
c0de578a:	280e      	cmp	r0, #14
c0de578c:	d15f      	bne.n	c0de584e <show_sign_protobuf_ui+0x166>
c0de578e:	f644 110a 	movw	r1, #18698	@ 0x490a
c0de5792:	f2c0 0100 	movt	r1, #0
c0de5796:	4479      	add	r1, pc
c0de5798:	e01f      	b.n	c0de57da <show_sign_protobuf_ui+0xf2>
c0de579a:	2809      	cmp	r0, #9
c0de579c:	d03e      	beq.n	c0de581c <show_sign_protobuf_ui+0x134>
c0de579e:	280a      	cmp	r0, #10
c0de57a0:	d155      	bne.n	c0de584e <show_sign_protobuf_ui+0x166>
c0de57a2:	f244 416e 	movw	r1, #17518	@ 0x446e
c0de57a6:	f2c0 0100 	movt	r1, #0
c0de57aa:	4479      	add	r1, pc
c0de57ac:	e03b      	b.n	c0de5826 <show_sign_protobuf_ui+0x13e>
c0de57ae:	2811      	cmp	r0, #17
c0de57b0:	d03c      	beq.n	c0de582c <show_sign_protobuf_ui+0x144>
c0de57b2:	28fc      	cmp	r0, #252	@ 0xfc
c0de57b4:	bf18      	it	ne
c0de57b6:	4770      	bxne	lr
c0de57b8:	f644 512c 	movw	r1, #19756	@ 0x4d2c
c0de57bc:	f2c0 0100 	movt	r1, #0
c0de57c0:	4479      	add	r1, pc
c0de57c2:	e038      	b.n	c0de5836 <show_sign_protobuf_ui+0x14e>
c0de57c4:	f244 5180 	movw	r1, #17792	@ 0x4580
c0de57c8:	f2c0 0100 	movt	r1, #0
c0de57cc:	4479      	add	r1, pc
c0de57ce:	e004      	b.n	c0de57da <show_sign_protobuf_ui+0xf2>
c0de57d0:	f244 01cc 	movw	r1, #16588	@ 0x40cc
c0de57d4:	f2c0 0100 	movt	r1, #0
c0de57d8:	4479      	add	r1, pc
c0de57da:	f04f 0c07 	mov.w	ip, #7
c0de57de:	e02c      	b.n	c0de583a <show_sign_protobuf_ui+0x152>
c0de57e0:	f244 7184 	movw	r1, #18308	@ 0x4784
c0de57e4:	f2c0 0100 	movt	r1, #0
c0de57e8:	4479      	add	r1, pc
c0de57ea:	e01c      	b.n	c0de5826 <show_sign_protobuf_ui+0x13e>
c0de57ec:	f643 6114 	movw	r1, #15892	@ 0x3e14
c0de57f0:	f2c0 0100 	movt	r1, #0
c0de57f4:	4479      	add	r1, pc
c0de57f6:	f04f 0c0a 	mov.w	ip, #10
c0de57fa:	e01e      	b.n	c0de583a <show_sign_protobuf_ui+0x152>
c0de57fc:	f643 3164 	movw	r1, #15204	@ 0x3b64
c0de5800:	f2c0 0100 	movt	r1, #0
c0de5804:	4479      	add	r1, pc
c0de5806:	f04f 0c09 	mov.w	ip, #9
c0de580a:	e016      	b.n	c0de583a <show_sign_protobuf_ui+0x152>
c0de580c:	f244 6140 	movw	r1, #17984	@ 0x4640
c0de5810:	f2c0 0100 	movt	r1, #0
c0de5814:	4479      	add	r1, pc
c0de5816:	f04f 0c05 	mov.w	ip, #5
c0de581a:	e00e      	b.n	c0de583a <show_sign_protobuf_ui+0x152>
c0de581c:	f244 21d8 	movw	r1, #17112	@ 0x42d8
c0de5820:	f2c0 0100 	movt	r1, #0
c0de5824:	4479      	add	r1, pc
c0de5826:	f04f 0c06 	mov.w	ip, #6
c0de582a:	e006      	b.n	c0de583a <show_sign_protobuf_ui+0x152>
c0de582c:	f644 11bc 	movw	r1, #18876	@ 0x49bc
c0de5830:	f2c0 0100 	movt	r1, #0
c0de5834:	4479      	add	r1, pc
c0de5836:	f04f 0c08 	mov.w	ip, #8
c0de583a:	f240 53e4 	movw	r3, #1508	@ 0x5e4
c0de583e:	f2c0 0300 	movt	r3, #0
c0de5842:	2000      	movs	r0, #0
c0de5844:	2200      	movs	r2, #0
c0de5846:	f849 c003 	str.w	ip, [r9, r3]
c0de584a:	f001 bbd3 	b.w	c0de6ff4 <ux_flow_init>
c0de584e:	4770      	bx	lr

c0de5850 <show_processing>:
c0de5850:	f644 519c 	movw	r1, #19868	@ 0x4d9c
c0de5854:	f2c0 0100 	movt	r1, #0
c0de5858:	4479      	add	r1, pc
c0de585a:	2000      	movs	r0, #0
c0de585c:	2200      	movs	r2, #0
c0de585e:	f001 bbc9 	b.w	c0de6ff4 <ux_flow_init>

c0de5862 <io_seproxyhal_touch_address_ok>:
c0de5862:	b580      	push	{r7, lr}
c0de5864:	f7fb f99d 	bl	c0de0ba2 <set_result_get_address>
c0de5868:	f240 51f8 	movw	r1, #1528	@ 0x5f8
c0de586c:	f2c0 0100 	movt	r1, #0
c0de5870:	4449      	add	r1, r9
c0de5872:	2390      	movs	r3, #144	@ 0x90
c0de5874:	180a      	adds	r2, r1, r0
c0de5876:	540b      	strb	r3, [r1, r0]
c0de5878:	2100      	movs	r1, #0
c0de587a:	3002      	adds	r0, #2
c0de587c:	7051      	strb	r1, [r2, #1]
c0de587e:	b281      	uxth	r1, r0
c0de5880:	2020      	movs	r0, #32
c0de5882:	f000 f979 	bl	c0de5b78 <io_exchange>
c0de5886:	f7fb fb80 	bl	c0de0f8a <init_context>
c0de588a:	f7ff faee 	bl	c0de4e6a <ui_idle>
c0de588e:	2000      	movs	r0, #0
c0de5890:	bd80      	pop	{r7, pc}

c0de5892 <io_seproxyhal_cancel>:
c0de5892:	b580      	push	{r7, lr}
c0de5894:	f240 50f8 	movw	r0, #1528	@ 0x5f8
c0de5898:	f2c0 0000 	movt	r0, #0
c0de589c:	2191      	movs	r1, #145	@ 0x91
c0de589e:	f809 1000 	strb.w	r1, [r9, r0]
c0de58a2:	4448      	add	r0, r9
c0de58a4:	2100      	movs	r1, #0
c0de58a6:	7041      	strb	r1, [r0, #1]
c0de58a8:	2020      	movs	r0, #32
c0de58aa:	2102      	movs	r1, #2
c0de58ac:	f000 f964 	bl	c0de5b78 <io_exchange>
c0de58b0:	f7fb fb6b 	bl	c0de0f8a <init_context>
c0de58b4:	f7ff fad9 	bl	c0de4e6a <ui_idle>
c0de58b8:	2000      	movs	r0, #0
c0de58ba:	bd80      	pop	{r7, pc}

c0de58bc <io_seproxyhal_touch_sign_approve>:
c0de58bc:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de58be:	b08d      	sub	sp, #52	@ 0x34
c0de58c0:	ac01      	add	r4, sp, #4
c0de58c2:	4620      	mov	r0, r4
c0de58c4:	f002 fe44 	bl	c0de8550 <setjmp>
c0de58c8:	4605      	mov	r5, r0
c0de58ca:	0400      	lsls	r0, r0, #16
c0de58cc:	f8ad 5030 	strh.w	r5, [sp, #48]	@ 0x30
c0de58d0:	d00a      	beq.n	c0de58e8 <io_seproxyhal_touch_sign_approve+0x2c>
c0de58d2:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de58d4:	2700      	movs	r7, #0
c0de58d6:	462e      	mov	r6, r5
c0de58d8:	f8ad 7030 	strh.w	r7, [sp, #48]	@ 0x30
c0de58dc:	f002 fc08 	bl	c0de80f0 <try_context_set>
c0de58e0:	0a28      	lsrs	r0, r5, #8
c0de58e2:	463d      	mov	r5, r7
c0de58e4:	4607      	mov	r7, r0
c0de58e6:	e008      	b.n	c0de58fa <io_seproxyhal_touch_sign_approve+0x3e>
c0de58e8:	a801      	add	r0, sp, #4
c0de58ea:	f002 fc01 	bl	c0de80f0 <try_context_set>
c0de58ee:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de58f0:	2790      	movs	r7, #144	@ 0x90
c0de58f2:	2600      	movs	r6, #0
c0de58f4:	f7fb f936 	bl	c0de0b64 <set_result_sign>
c0de58f8:	4605      	mov	r5, r0
c0de58fa:	f002 fbef 	bl	c0de80dc <try_context_get>
c0de58fe:	42a0      	cmp	r0, r4
c0de5900:	d102      	bne.n	c0de5908 <io_seproxyhal_touch_sign_approve+0x4c>
c0de5902:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de5904:	f002 fbf4 	bl	c0de80f0 <try_context_set>
c0de5908:	f8bd 0030 	ldrh.w	r0, [sp, #48]	@ 0x30
c0de590c:	b9a0      	cbnz	r0, c0de5938 <io_seproxyhal_touch_sign_approve+0x7c>
c0de590e:	f240 51f8 	movw	r1, #1528	@ 0x5f8
c0de5912:	f2c0 0100 	movt	r1, #0
c0de5916:	eb09 0001 	add.w	r0, r9, r1
c0de591a:	1941      	adds	r1, r0, r5
c0de591c:	5547      	strb	r7, [r0, r5]
c0de591e:	1ca8      	adds	r0, r5, #2
c0de5920:	704e      	strb	r6, [r1, #1]
c0de5922:	b281      	uxth	r1, r0
c0de5924:	2020      	movs	r0, #32
c0de5926:	f000 f927 	bl	c0de5b78 <io_exchange>
c0de592a:	f7fb fb2e 	bl	c0de0f8a <init_context>
c0de592e:	f7ff fa9c 	bl	c0de4e6a <ui_idle>
c0de5932:	2000      	movs	r0, #0
c0de5934:	b00d      	add	sp, #52	@ 0x34
c0de5936:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de5938:	f002 f90f 	bl	c0de7b5a <os_longjmp>

c0de593c <os_io_handle_default_apdu>:
c0de593c:	b5b0      	push	{r4, r5, r7, lr}
c0de593e:	b09e      	sub	sp, #120	@ 0x78
c0de5940:	9d22      	ldr	r5, [sp, #136]	@ 0x88
c0de5942:	b1d0      	cbz	r0, c0de597a <os_io_handle_default_apdu+0x3e>
c0de5944:	b1c9      	cbz	r1, c0de597a <os_io_handle_default_apdu+0x3e>
c0de5946:	b1c2      	cbz	r2, c0de597a <os_io_handle_default_apdu+0x3e>
c0de5948:	b1bb      	cbz	r3, c0de597a <os_io_handle_default_apdu+0x3e>
c0de594a:	b10d      	cbz	r5, c0de5950 <os_io_handle_default_apdu+0x14>
c0de594c:	2100      	movs	r1, #0
c0de594e:	7029      	strb	r1, [r5, #0]
c0de5950:	7801      	ldrb	r1, [r0, #0]
c0de5952:	29b0      	cmp	r1, #176	@ 0xb0
c0de5954:	d113      	bne.n	c0de597e <os_io_handle_default_apdu+0x42>
c0de5956:	7841      	ldrb	r1, [r0, #1]
c0de5958:	29a7      	cmp	r1, #167	@ 0xa7
c0de595a:	d013      	beq.n	c0de5984 <os_io_handle_default_apdu+0x48>
c0de595c:	2906      	cmp	r1, #6
c0de595e:	d018      	beq.n	c0de5992 <os_io_handle_default_apdu+0x56>
c0de5960:	2901      	cmp	r1, #1
c0de5962:	d113      	bne.n	c0de598c <os_io_handle_default_apdu+0x50>
c0de5964:	7881      	ldrb	r1, [r0, #2]
c0de5966:	b989      	cbnz	r1, c0de598c <os_io_handle_default_apdu+0x50>
c0de5968:	78c0      	ldrb	r0, [r0, #3]
c0de596a:	b978      	cbnz	r0, c0de598c <os_io_handle_default_apdu+0x50>
c0de596c:	4610      	mov	r0, r2
c0de596e:	4619      	mov	r1, r3
c0de5970:	b01e      	add	sp, #120	@ 0x78
c0de5972:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0de5976:	f000 b82d 	b.w	c0de59d4 <get_version>
c0de597a:	782c      	ldrb	r4, [r5, #0]
c0de597c:	e01f      	b.n	c0de59be <os_io_handle_default_apdu+0x82>
c0de597e:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de5982:	e01c      	b.n	c0de59be <os_io_handle_default_apdu+0x82>
c0de5984:	7881      	ldrb	r1, [r0, #2]
c0de5986:	b909      	cbnz	r1, c0de598c <os_io_handle_default_apdu+0x50>
c0de5988:	78c0      	ldrb	r0, [r0, #3]
c0de598a:	b1d8      	cbz	r0, c0de59c4 <os_io_handle_default_apdu+0x88>
c0de598c:	f44f 44dc 	mov.w	r4, #28160	@ 0x6e00
c0de5990:	e015      	b.n	c0de59be <os_io_handle_default_apdu+0x82>
c0de5992:	2400      	movs	r4, #0
c0de5994:	601c      	str	r4, [r3, #0]
c0de5996:	7883      	ldrb	r3, [r0, #2]
c0de5998:	7902      	ldrb	r2, [r0, #4]
c0de599a:	1d41      	adds	r1, r0, #5
c0de599c:	ad03      	add	r5, sp, #12
c0de599e:	4618      	mov	r0, r3
c0de59a0:	2300      	movs	r3, #0
c0de59a2:	9400      	str	r4, [sp, #0]
c0de59a4:	9501      	str	r5, [sp, #4]
c0de59a6:	f002 fb16 	bl	c0de7fd6 <os_pki_load_certificate>
c0de59aa:	4604      	mov	r4, r0
c0de59ac:	2800      	cmp	r0, #0
c0de59ae:	4628      	mov	r0, r5
c0de59b0:	f04f 016c 	mov.w	r1, #108	@ 0x6c
c0de59b4:	bf08      	it	eq
c0de59b6:	f44f 4410 	moveq.w	r4, #36864	@ 0x9000
c0de59ba:	f002 fd83 	bl	c0de84c4 <explicit_bzero>
c0de59be:	4620      	mov	r0, r4
c0de59c0:	b01e      	add	sp, #120	@ 0x78
c0de59c2:	bdb0      	pop	{r4, r5, r7, pc}
c0de59c4:	2000      	movs	r0, #0
c0de59c6:	6018      	str	r0, [r3, #0]
c0de59c8:	b10d      	cbz	r5, c0de59ce <os_io_handle_default_apdu+0x92>
c0de59ca:	2001      	movs	r0, #1
c0de59cc:	7028      	strb	r0, [r5, #0]
c0de59ce:	f44f 4410 	mov.w	r4, #36864	@ 0x9000
c0de59d2:	e7f4      	b.n	c0de59be <os_io_handle_default_apdu+0x82>

c0de59d4 <get_version>:
c0de59d4:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de59d6:	b081      	sub	sp, #4
c0de59d8:	4604      	mov	r4, r0
c0de59da:	6808      	ldr	r0, [r1, #0]
c0de59dc:	460d      	mov	r5, r1
c0de59de:	2100      	movs	r1, #0
c0de59e0:	2803      	cmp	r0, #3
c0de59e2:	6029      	str	r1, [r5, #0]
c0de59e4:	d329      	bcc.n	c0de5a3a <get_version+0x66>
c0de59e6:	2601      	movs	r6, #1
c0de59e8:	602e      	str	r6, [r5, #0]
c0de59ea:	7026      	strb	r6, [r4, #0]
c0de59ec:	682a      	ldr	r2, [r5, #0]
c0de59ee:	1ec7      	subs	r7, r0, #3
c0de59f0:	1911      	adds	r1, r2, r4
c0de59f2:	3101      	adds	r1, #1
c0de59f4:	1aba      	subs	r2, r7, r2
c0de59f6:	2001      	movs	r0, #1
c0de59f8:	f002 fb2a 	bl	c0de8050 <os_registry_get_current_app_tag>
c0de59fc:	6829      	ldr	r1, [r5, #0]
c0de59fe:	1c4a      	adds	r2, r1, #1
c0de5a00:	602a      	str	r2, [r5, #0]
c0de5a02:	5460      	strb	r0, [r4, r1]
c0de5a04:	6829      	ldr	r1, [r5, #0]
c0de5a06:	4408      	add	r0, r1
c0de5a08:	1901      	adds	r1, r0, r4
c0de5a0a:	6028      	str	r0, [r5, #0]
c0de5a0c:	3101      	adds	r1, #1
c0de5a0e:	1a3a      	subs	r2, r7, r0
c0de5a10:	2002      	movs	r0, #2
c0de5a12:	f002 fb1d 	bl	c0de8050 <os_registry_get_current_app_tag>
c0de5a16:	6829      	ldr	r1, [r5, #0]
c0de5a18:	1c4a      	adds	r2, r1, #1
c0de5a1a:	602a      	str	r2, [r5, #0]
c0de5a1c:	5460      	strb	r0, [r4, r1]
c0de5a1e:	6829      	ldr	r1, [r5, #0]
c0de5a20:	4408      	add	r0, r1
c0de5a22:	1c41      	adds	r1, r0, #1
c0de5a24:	6029      	str	r1, [r5, #0]
c0de5a26:	5426      	strb	r6, [r4, r0]
c0de5a28:	f002 fb08 	bl	c0de803c <os_flags>
c0de5a2c:	6829      	ldr	r1, [r5, #0]
c0de5a2e:	1c4a      	adds	r2, r1, #1
c0de5a30:	602a      	str	r2, [r5, #0]
c0de5a32:	5460      	strb	r0, [r4, r1]
c0de5a34:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de5a38:	e001      	b.n	c0de5a3e <get_version+0x6a>
c0de5a3a:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de5a3e:	b001      	add	sp, #4
c0de5a40:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de5a42 <os_io_seph_cmd_general_status>:
c0de5a42:	f644 41d3 	movw	r1, #19667	@ 0x4cd3
c0de5a46:	f2c0 0100 	movt	r1, #0
c0de5a4a:	4479      	add	r1, pc
c0de5a4c:	2001      	movs	r0, #1
c0de5a4e:	2205      	movs	r2, #5
c0de5a50:	2300      	movs	r3, #0
c0de5a52:	f002 bb2b 	b.w	c0de80ac <os_io_tx_cmd>

c0de5a56 <io_seph_ux_init_button>:
c0de5a56:	f640 001c 	movw	r0, #2076	@ 0x81c
c0de5a5a:	f2c0 0000 	movt	r0, #0
c0de5a5e:	2100      	movs	r1, #0
c0de5a60:	f849 1000 	str.w	r1, [r9, r0]
c0de5a64:	4448      	add	r0, r9
c0de5a66:	6041      	str	r1, [r0, #4]
c0de5a68:	4770      	bx	lr

c0de5a6a <io_process_itc_ux_event>:
c0de5a6a:	b580      	push	{r7, lr}
c0de5a6c:	78c0      	ldrb	r0, [r0, #3]
c0de5a6e:	2820      	cmp	r0, #32
c0de5a70:	4608      	mov	r0, r1
c0de5a72:	bf18      	it	ne
c0de5a74:	bd80      	popne	{r7, pc}
c0de5a76:	f001 ff73 	bl	c0de7960 <ux_stack_redisplay>
c0de5a7a:	2000      	movs	r0, #0
c0de5a7c:	bd80      	pop	{r7, pc}

c0de5a7e <io_seph_ux_display_bagl_element>:
c0de5a7e:	b570      	push	{r4, r5, r6, lr}
c0de5a80:	b088      	sub	sp, #32
c0de5a82:	f002 fa41 	bl	c0de7f08 <pic>
c0de5a86:	4604      	mov	r4, r0
c0de5a88:	7801      	ldrb	r1, [r0, #0]
c0de5a8a:	69c0      	ldr	r0, [r0, #28]
c0de5a8c:	f001 067f 	and.w	r6, r1, #127	@ 0x7f
c0de5a90:	f002 fa3a 	bl	c0de7f08 <pic>
c0de5a94:	b37e      	cbz	r6, c0de5af6 <io_seph_ux_display_bagl_element+0x78>
c0de5a96:	4605      	mov	r5, r0
c0de5a98:	b150      	cbz	r0, c0de5ab0 <io_seph_ux_display_bagl_element+0x32>
c0de5a9a:	2e05      	cmp	r6, #5
c0de5a9c:	d101      	bne.n	c0de5aa2 <io_seph_ux_display_bagl_element+0x24>
c0de5a9e:	7ea0      	ldrb	r0, [r4, #26]
c0de5aa0:	b178      	cbz	r0, c0de5ac2 <io_seph_ux_display_bagl_element+0x44>
c0de5aa2:	4628      	mov	r0, r5
c0de5aa4:	f002 fd62 	bl	c0de856c <strlen>
c0de5aa8:	b282      	uxth	r2, r0
c0de5aaa:	4620      	mov	r0, r4
c0de5aac:	4629      	mov	r1, r5
c0de5aae:	e002      	b.n	c0de5ab6 <io_seph_ux_display_bagl_element+0x38>
c0de5ab0:	4620      	mov	r0, r4
c0de5ab2:	2100      	movs	r1, #0
c0de5ab4:	2200      	movs	r2, #0
c0de5ab6:	2300      	movs	r3, #0
c0de5ab8:	b008      	add	sp, #32
c0de5aba:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de5abe:	f000 ba49 	b.w	c0de5f54 <bagl_draw_with_context>
c0de5ac2:	4628      	mov	r0, r5
c0de5ac4:	f002 fa20 	bl	c0de7f08 <pic>
c0de5ac8:	b1a8      	cbz	r0, c0de5af6 <io_seph_ux_display_bagl_element+0x78>
c0de5aca:	4605      	mov	r5, r0
c0de5acc:	6900      	ldr	r0, [r0, #16]
c0de5ace:	b190      	cbz	r0, c0de5af6 <io_seph_ux_display_bagl_element+0x78>
c0de5ad0:	4620      	mov	r0, r4
c0de5ad2:	f002 fa19 	bl	c0de7f08 <pic>
c0de5ad6:	ac01      	add	r4, sp, #4
c0de5ad8:	4601      	mov	r1, r0
c0de5ada:	4620      	mov	r0, r4
c0de5adc:	221c      	movs	r2, #28
c0de5ade:	f002 fce8 	bl	c0de84b2 <__aeabi_memcpy>
c0de5ae2:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de5ae6:	f8ad 000a 	strh.w	r0, [sp, #10]
c0de5aea:	f8ad 100c 	strh.w	r1, [sp, #12]
c0de5aee:	4620      	mov	r0, r4
c0de5af0:	4629      	mov	r1, r5
c0de5af2:	f001 f875 	bl	c0de6be0 <bagl_draw_glyph>
c0de5af6:	b008      	add	sp, #32
c0de5af8:	bd70      	pop	{r4, r5, r6, pc}

c0de5afa <io_seproxyhal_button_push>:
c0de5afa:	b1c0      	cbz	r0, c0de5b2e <io_seproxyhal_button_push+0x34>
c0de5afc:	b510      	push	{r4, lr}
c0de5afe:	f640 0e1c 	movw	lr, #2076	@ 0x81c
c0de5b02:	f2c0 0e00 	movt	lr, #0
c0de5b06:	4684      	mov	ip, r0
c0de5b08:	f859 000e 	ldr.w	r0, [r9, lr]
c0de5b0c:	460b      	mov	r3, r1
c0de5b0e:	eb09 010e 	add.w	r1, r9, lr
c0de5b12:	6849      	ldr	r1, [r1, #4]
c0de5b14:	4298      	cmp	r0, r3
c0de5b16:	bf02      	ittt	eq
c0de5b18:	3101      	addeq	r1, #1
c0de5b1a:	eb09 020e 	addeq.w	r2, r9, lr
c0de5b1e:	6051      	streq	r1, [r2, #4]
c0de5b20:	ea40 0003 	orr.w	r0, r0, r3
c0de5b24:	b123      	cbz	r3, c0de5b30 <io_seproxyhal_button_push+0x36>
c0de5b26:	4602      	mov	r2, r0
c0de5b28:	f849 000e 	str.w	r0, [r9, lr]
c0de5b2c:	e008      	b.n	c0de5b40 <io_seproxyhal_button_push+0x46>
c0de5b2e:	4770      	bx	lr
c0de5b30:	2200      	movs	r2, #0
c0de5b32:	eb09 040e 	add.w	r4, r9, lr
c0de5b36:	f849 200e 	str.w	r2, [r9, lr]
c0de5b3a:	6062      	str	r2, [r4, #4]
c0de5b3c:	f040 4000 	orr.w	r0, r0, #2147483648	@ 0x80000000
c0de5b40:	429a      	cmp	r2, r3
c0de5b42:	bf1e      	ittt	ne
c0de5b44:	eb09 020e 	addne.w	r2, r9, lr
c0de5b48:	2300      	movne	r3, #0
c0de5b4a:	6053      	strne	r3, [r2, #4]
c0de5b4c:	2908      	cmp	r1, #8
c0de5b4e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de5b52:	d30b      	bcc.n	c0de5b6c <io_seproxyhal_button_push+0x72>
c0de5b54:	f64a 22ab 	movw	r2, #43691	@ 0xaaab
c0de5b58:	f6ca 22aa 	movt	r2, #43690	@ 0xaaaa
c0de5b5c:	434a      	muls	r2, r1
c0de5b5e:	f112 3faa 	cmn.w	r2, #2863311530	@ 0xaaaaaaaa
c0de5b62:	bf38      	it	cc
c0de5b64:	f040 4080 	orrcc.w	r0, r0, #1073741824	@ 0x40000000
c0de5b68:	f020 4000 	bic.w	r0, r0, #2147483648	@ 0x80000000
c0de5b6c:	4760      	bx	ip

c0de5b6e <io_seproxyhal_general_status>:
c0de5b6e:	f7ff bf68 	b.w	c0de5a42 <os_io_seph_cmd_general_status>

c0de5b72 <io_seph_is_status_sent>:
c0de5b72:	2001      	movs	r0, #1
c0de5b74:	4770      	bx	lr
	...

c0de5b78 <io_exchange>:
c0de5b78:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de5b7c:	f640 0624 	movw	r6, #2084	@ 0x824
c0de5b80:	f2c0 0600 	movt	r6, #0
c0de5b84:	f819 2006 	ldrb.w	r2, [r9, r6]
c0de5b88:	460d      	mov	r5, r1
c0de5b8a:	2a01      	cmp	r2, #1
c0de5b8c:	4604      	mov	r4, r0
c0de5b8e:	d104      	bne.n	c0de5b9a <io_exchange+0x22>
c0de5b90:	f002 fa80 	bl	c0de8094 <os_io_start>
c0de5b94:	2000      	movs	r0, #0
c0de5b96:	f809 0006 	strb.w	r0, [r9, r6]
c0de5b9a:	0760      	lsls	r0, r4, #29
c0de5b9c:	d001      	beq.n	c0de5ba2 <io_exchange+0x2a>
c0de5b9e:	2500      	movs	r5, #0
c0de5ba0:	e03d      	b.n	c0de5c1e <io_exchange+0xa6>
c0de5ba2:	f640 0626 	movw	r6, #2086	@ 0x826
c0de5ba6:	f004 0710 	and.w	r7, r4, #16
c0de5baa:	f2c0 0600 	movt	r6, #0
c0de5bae:	b1ed      	cbz	r5, c0de5bec <io_exchange+0x74>
c0de5bb0:	b9e7      	cbnz	r7, c0de5bec <io_exchange+0x74>
c0de5bb2:	f640 082e 	movw	r8, #2094	@ 0x82e
c0de5bb6:	f2c0 0800 	movt	r8, #0
c0de5bba:	f240 51f8 	movw	r1, #1528	@ 0x5f8
c0de5bbe:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de5bc2:	f2c0 0100 	movt	r1, #0
c0de5bc6:	4449      	add	r1, r9
c0de5bc8:	462a      	mov	r2, r5
c0de5bca:	2300      	movs	r3, #0
c0de5bcc:	2500      	movs	r5, #0
c0de5bce:	f002 fa6d 	bl	c0de80ac <os_io_tx_cmd>
c0de5bd2:	f640 002f 	movw	r0, #2095	@ 0x82f
c0de5bd6:	f2c0 0000 	movt	r0, #0
c0de5bda:	f809 5000 	strb.w	r5, [r9, r0]
c0de5bde:	eb09 0006 	add.w	r0, r9, r6
c0de5be2:	7185      	strb	r5, [r0, #6]
c0de5be4:	06a0      	lsls	r0, r4, #26
c0de5be6:	f809 5008 	strb.w	r5, [r9, r8]
c0de5bea:	d418      	bmi.n	c0de5c1e <io_exchange+0xa6>
c0de5bec:	b94f      	cbnz	r7, c0de5c02 <io_exchange+0x8a>
c0de5bee:	eb09 0006 	add.w	r0, r9, r6
c0de5bf2:	2100      	movs	r1, #0
c0de5bf4:	7181      	strb	r1, [r0, #6]
c0de5bf6:	f640 002e 	movw	r0, #2094	@ 0x82e
c0de5bfa:	f2c0 0000 	movt	r0, #0
c0de5bfe:	f809 1000 	strb.w	r1, [r9, r0]
c0de5c02:	eb09 0006 	add.w	r0, r9, r6
c0de5c06:	2100      	movs	r1, #0
c0de5c08:	8041      	strh	r1, [r0, #2]
c0de5c0a:	bf00      	nop
c0de5c0c:	2001      	movs	r0, #1
c0de5c0e:	f000 f809 	bl	c0de5c24 <io_legacy_apdu_rx>
c0de5c12:	2801      	cmp	r0, #1
c0de5c14:	dbfa      	blt.n	c0de5c0c <io_exchange+0x94>
c0de5c16:	4605      	mov	r5, r0
c0de5c18:	eb09 0006 	add.w	r0, r9, r6
c0de5c1c:	8045      	strh	r5, [r0, #2]
c0de5c1e:	b2a8      	uxth	r0, r5
c0de5c20:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de5c24 <io_legacy_apdu_rx>:
c0de5c24:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de5c28:	b084      	sub	sp, #16
c0de5c2a:	f240 7609 	movw	r6, #1801	@ 0x709
c0de5c2e:	4605      	mov	r5, r0
c0de5c30:	2000      	movs	r0, #0
c0de5c32:	f2c0 0600 	movt	r6, #0
c0de5c36:	f88d 000f 	strb.w	r0, [sp, #15]
c0de5c3a:	eb09 0006 	add.w	r0, r9, r6
c0de5c3e:	f240 1111 	movw	r1, #273	@ 0x111
c0de5c42:	2200      	movs	r2, #0
c0de5c44:	2301      	movs	r3, #1
c0de5c46:	f002 fa3d 	bl	c0de80c4 <os_io_rx_evt>
c0de5c4a:	4604      	mov	r4, r0
c0de5c4c:	2801      	cmp	r0, #1
c0de5c4e:	f2c0 8149 	blt.w	c0de5ee4 <io_legacy_apdu_rx+0x2c0>
c0de5c52:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de5c56:	282f      	cmp	r0, #47	@ 0x2f
c0de5c58:	dc75      	bgt.n	c0de5d46 <io_legacy_apdu_rx+0x122>
c0de5c5a:	f1a0 0110 	sub.w	r1, r0, #16
c0de5c5e:	2916      	cmp	r1, #22
c0de5c60:	d879      	bhi.n	c0de5d56 <io_legacy_apdu_rx+0x132>
c0de5c62:	2201      	movs	r2, #1
c0de5c64:	fa02 f101 	lsl.w	r1, r2, r1
c0de5c68:	2201      	movs	r2, #1
c0de5c6a:	f2c0 027f 	movt	r2, #127	@ 0x7f
c0de5c6e:	4211      	tst	r1, r2
c0de5c70:	d071      	beq.n	c0de5d56 <io_legacy_apdu_rx+0x132>
c0de5c72:	f640 052e 	movw	r5, #2094	@ 0x82e
c0de5c76:	f2c0 0500 	movt	r5, #0
c0de5c7a:	f809 0005 	strb.w	r0, [r9, r5]
c0de5c7e:	f002 f9ba 	bl	c0de7ff6 <os_perso_is_pin_set>
c0de5c82:	28aa      	cmp	r0, #170	@ 0xaa
c0de5c84:	d103      	bne.n	c0de5c8e <io_legacy_apdu_rx+0x6a>
c0de5c86:	f002 f9c1 	bl	c0de800c <os_global_pin_is_validated>
c0de5c8a:	28aa      	cmp	r0, #170	@ 0xaa
c0de5c8c:	d17e      	bne.n	c0de5d8c <io_legacy_apdu_rx+0x168>
c0de5c8e:	eb09 0006 	add.w	r0, r9, r6
c0de5c92:	7840      	ldrb	r0, [r0, #1]
c0de5c94:	28b0      	cmp	r0, #176	@ 0xb0
c0de5c96:	d130      	bne.n	c0de5cfa <io_legacy_apdu_rx+0xd6>
c0de5c98:	f240 1011 	movw	r0, #273	@ 0x111
c0de5c9c:	9002      	str	r0, [sp, #8]
c0de5c9e:	f240 50f8 	movw	r0, #1528	@ 0x5f8
c0de5ca2:	f2c0 0000 	movt	r0, #0
c0de5ca6:	1e61      	subs	r1, r4, #1
c0de5ca8:	eb09 0400 	add.w	r4, r9, r0
c0de5cac:	eb09 0006 	add.w	r0, r9, r6
c0de5cb0:	f10d 070f 	add.w	r7, sp, #15
c0de5cb4:	3001      	adds	r0, #1
c0de5cb6:	ab02      	add	r3, sp, #8
c0de5cb8:	4622      	mov	r2, r4
c0de5cba:	9700      	str	r7, [sp, #0]
c0de5cbc:	f7ff fe3e 	bl	c0de593c <os_io_handle_default_apdu>
c0de5cc0:	9902      	ldr	r1, [sp, #8]
c0de5cc2:	2600      	movs	r6, #0
c0de5cc4:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de5cc8:	bf18      	it	ne
c0de5cca:	4631      	movne	r1, r6
c0de5ccc:	0a02      	lsrs	r2, r0, #8
c0de5cce:	1863      	adds	r3, r4, r1
c0de5cd0:	5462      	strb	r2, [r4, r1]
c0de5cd2:	3102      	adds	r1, #2
c0de5cd4:	7058      	strb	r0, [r3, #1]
c0de5cd6:	f819 0005 	ldrb.w	r0, [r9, r5]
c0de5cda:	9102      	str	r1, [sp, #8]
c0de5cdc:	b28a      	uxth	r2, r1
c0de5cde:	4621      	mov	r1, r4
c0de5ce0:	2300      	movs	r3, #0
c0de5ce2:	f002 f9e3 	bl	c0de80ac <os_io_tx_cmd>
c0de5ce6:	f89d 100f 	ldrb.w	r1, [sp, #15]
c0de5cea:	f809 6005 	strb.w	r6, [r9, r5]
c0de5cee:	2901      	cmp	r1, #1
c0de5cf0:	f000 8107 	beq.w	c0de5f02 <io_legacy_apdu_rx+0x2de>
c0de5cf4:	ea00 74e0 	and.w	r4, r0, r0, asr #31
c0de5cf8:	e0f4      	b.n	c0de5ee4 <io_legacy_apdu_rx+0x2c0>
c0de5cfa:	f819 7005 	ldrb.w	r7, [r9, r5]
c0de5cfe:	2f21      	cmp	r7, #33	@ 0x21
c0de5d00:	dd58      	ble.n	c0de5db4 <io_legacy_apdu_rx+0x190>
c0de5d02:	2f2f      	cmp	r7, #47	@ 0x2f
c0de5d04:	dc5e      	bgt.n	c0de5dc4 <io_legacy_apdu_rx+0x1a0>
c0de5d06:	2f22      	cmp	r7, #34	@ 0x22
c0de5d08:	f000 8084 	beq.w	c0de5e14 <io_legacy_apdu_rx+0x1f0>
c0de5d0c:	2f23      	cmp	r7, #35	@ 0x23
c0de5d0e:	f040 8099 	bne.w	c0de5e44 <io_legacy_apdu_rx+0x220>
c0de5d12:	f640 0526 	movw	r5, #2086	@ 0x826
c0de5d16:	f2c0 0500 	movt	r5, #0
c0de5d1a:	eb09 0005 	add.w	r0, r9, r5
c0de5d1e:	2107      	movs	r1, #7
c0de5d20:	7181      	strb	r1, [r0, #6]
c0de5d22:	f240 50f8 	movw	r0, #1528	@ 0x5f8
c0de5d26:	3c01      	subs	r4, #1
c0de5d28:	f2c0 0000 	movt	r0, #0
c0de5d2c:	eb09 0106 	add.w	r1, r9, r6
c0de5d30:	4448      	add	r0, r9
c0de5d32:	3101      	adds	r1, #1
c0de5d34:	4622      	mov	r2, r4
c0de5d36:	f002 fbbc 	bl	c0de84b2 <__aeabi_memcpy>
c0de5d3a:	f640 002f 	movw	r0, #2095	@ 0x82f
c0de5d3e:	f2c0 0000 	movt	r0, #0
c0de5d42:	2101      	movs	r1, #1
c0de5d44:	e05b      	b.n	c0de5dfe <io_legacy_apdu_rx+0x1da>
c0de5d46:	2830      	cmp	r0, #48	@ 0x30
c0de5d48:	d093      	beq.n	c0de5c72 <io_legacy_apdu_rx+0x4e>
c0de5d4a:	2840      	cmp	r0, #64	@ 0x40
c0de5d4c:	d091      	beq.n	c0de5c72 <io_legacy_apdu_rx+0x4e>
c0de5d4e:	2842      	cmp	r0, #66	@ 0x42
c0de5d50:	bf18      	it	ne
c0de5d52:	2400      	movne	r4, #0
c0de5d54:	e0c6      	b.n	c0de5ee4 <io_legacy_apdu_rx+0x2c0>
c0de5d56:	3801      	subs	r0, #1
c0de5d58:	2802      	cmp	r0, #2
c0de5d5a:	f080 80c2 	bcs.w	c0de5ee2 <io_legacy_apdu_rx+0x2be>
c0de5d5e:	f240 37c0 	movw	r7, #960	@ 0x3c0
c0de5d62:	3c01      	subs	r4, #1
c0de5d64:	f2c0 0700 	movt	r7, #0
c0de5d68:	444e      	add	r6, r9
c0de5d6a:	eb09 0007 	add.w	r0, r9, r7
c0de5d6e:	1c71      	adds	r1, r6, #1
c0de5d70:	4622      	mov	r2, r4
c0de5d72:	f002 fb9e 	bl	c0de84b2 <__aeabi_memcpy>
c0de5d76:	7870      	ldrb	r0, [r6, #1]
c0de5d78:	281a      	cmp	r0, #26
c0de5d7a:	d144      	bne.n	c0de5e06 <io_legacy_apdu_rx+0x1e2>
c0de5d7c:	eb09 0007 	add.w	r0, r9, r7
c0de5d80:	4621      	mov	r1, r4
c0de5d82:	b004      	add	sp, #16
c0de5d84:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de5d88:	f7ff be6f 	b.w	c0de5a6a <io_process_itc_ux_event>
c0de5d8c:	f240 50f8 	movw	r0, #1528	@ 0x5f8
c0de5d90:	f2c0 0000 	movt	r0, #0
c0de5d94:	2155      	movs	r1, #85	@ 0x55
c0de5d96:	f809 1000 	strb.w	r1, [r9, r0]
c0de5d9a:	eb09 0100 	add.w	r1, r9, r0
c0de5d9e:	f819 0005 	ldrb.w	r0, [r9, r5]
c0de5da2:	2715      	movs	r7, #21
c0de5da4:	2202      	movs	r2, #2
c0de5da6:	2300      	movs	r3, #0
c0de5da8:	704f      	strb	r7, [r1, #1]
c0de5daa:	b004      	add	sp, #16
c0de5dac:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de5db0:	f002 b97c 	b.w	c0de80ac <os_io_tx_cmd>
c0de5db4:	2f10      	cmp	r7, #16
c0de5db6:	d02f      	beq.n	c0de5e18 <io_legacy_apdu_rx+0x1f4>
c0de5db8:	2f20      	cmp	r7, #32
c0de5dba:	d067      	beq.n	c0de5e8c <io_legacy_apdu_rx+0x268>
c0de5dbc:	2f21      	cmp	r7, #33	@ 0x21
c0de5dbe:	d141      	bne.n	c0de5e44 <io_legacy_apdu_rx+0x220>
c0de5dc0:	2005      	movs	r0, #5
c0de5dc2:	e02c      	b.n	c0de5e1e <io_legacy_apdu_rx+0x1fa>
c0de5dc4:	2f30      	cmp	r7, #48	@ 0x30
c0de5dc6:	d029      	beq.n	c0de5e1c <io_legacy_apdu_rx+0x1f8>
c0de5dc8:	2f40      	cmp	r7, #64	@ 0x40
c0de5dca:	d13b      	bne.n	c0de5e44 <io_legacy_apdu_rx+0x220>
c0de5dcc:	f640 0526 	movw	r5, #2086	@ 0x826
c0de5dd0:	f2c0 0500 	movt	r5, #0
c0de5dd4:	eb09 0005 	add.w	r0, r9, r5
c0de5dd8:	2103      	movs	r1, #3
c0de5dda:	7181      	strb	r1, [r0, #6]
c0de5ddc:	f240 50f8 	movw	r0, #1528	@ 0x5f8
c0de5de0:	3c01      	subs	r4, #1
c0de5de2:	f2c0 0000 	movt	r0, #0
c0de5de6:	eb09 0106 	add.w	r1, r9, r6
c0de5dea:	4448      	add	r0, r9
c0de5dec:	3101      	adds	r1, #1
c0de5dee:	4622      	mov	r2, r4
c0de5df0:	f002 fb5f 	bl	c0de84b2 <__aeabi_memcpy>
c0de5df4:	f640 002f 	movw	r0, #2095	@ 0x82f
c0de5df8:	f2c0 0000 	movt	r0, #0
c0de5dfc:	2102      	movs	r1, #2
c0de5dfe:	f809 1000 	strb.w	r1, [r9, r0]
c0de5e02:	200a      	movs	r0, #10
c0de5e04:	e05d      	b.n	c0de5ec2 <io_legacy_apdu_rx+0x29e>
c0de5e06:	2d00      	cmp	r5, #0
c0de5e08:	d05e      	beq.n	c0de5ec8 <io_legacy_apdu_rx+0x2a4>
c0de5e0a:	2000      	movs	r0, #0
c0de5e0c:	2400      	movs	r4, #0
c0de5e0e:	f7fb f8c7 	bl	c0de0fa0 <io_event>
c0de5e12:	e067      	b.n	c0de5ee4 <io_legacy_apdu_rx+0x2c0>
c0de5e14:	2004      	movs	r0, #4
c0de5e16:	e002      	b.n	c0de5e1e <io_legacy_apdu_rx+0x1fa>
c0de5e18:	2006      	movs	r0, #6
c0de5e1a:	e000      	b.n	c0de5e1e <io_legacy_apdu_rx+0x1fa>
c0de5e1c:	2002      	movs	r0, #2
c0de5e1e:	f640 0126 	movw	r1, #2086	@ 0x826
c0de5e22:	f2c0 0100 	movt	r1, #0
c0de5e26:	4449      	add	r1, r9
c0de5e28:	7188      	strb	r0, [r1, #6]
c0de5e2a:	f240 50f8 	movw	r0, #1528	@ 0x5f8
c0de5e2e:	3c01      	subs	r4, #1
c0de5e30:	f2c0 0000 	movt	r0, #0
c0de5e34:	eb09 0106 	add.w	r1, r9, r6
c0de5e38:	4448      	add	r0, r9
c0de5e3a:	3101      	adds	r1, #1
c0de5e3c:	4622      	mov	r2, r4
c0de5e3e:	f002 fb38 	bl	c0de84b2 <__aeabi_memcpy>
c0de5e42:	e04f      	b.n	c0de5ee4 <io_legacy_apdu_rx+0x2c0>
c0de5e44:	f640 0826 	movw	r8, #2086	@ 0x826
c0de5e48:	f2c0 0800 	movt	r8, #0
c0de5e4c:	eb09 0008 	add.w	r0, r9, r8
c0de5e50:	2100      	movs	r1, #0
c0de5e52:	7181      	strb	r1, [r0, #6]
c0de5e54:	f240 50f8 	movw	r0, #1528	@ 0x5f8
c0de5e58:	1e65      	subs	r5, r4, #1
c0de5e5a:	f2c0 0000 	movt	r0, #0
c0de5e5e:	eb09 0106 	add.w	r1, r9, r6
c0de5e62:	4448      	add	r0, r9
c0de5e64:	3101      	adds	r1, #1
c0de5e66:	462a      	mov	r2, r5
c0de5e68:	f002 fb23 	bl	c0de84b2 <__aeabi_memcpy>
c0de5e6c:	2f25      	cmp	r7, #37	@ 0x25
c0de5e6e:	d03d      	beq.n	c0de5eec <io_legacy_apdu_rx+0x2c8>
c0de5e70:	2f24      	cmp	r7, #36	@ 0x24
c0de5e72:	d109      	bne.n	c0de5e88 <io_legacy_apdu_rx+0x264>
c0de5e74:	f640 002f 	movw	r0, #2095	@ 0x82f
c0de5e78:	f2c0 0000 	movt	r0, #0
c0de5e7c:	2101      	movs	r1, #1
c0de5e7e:	f809 1000 	strb.w	r1, [r9, r0]
c0de5e82:	200b      	movs	r0, #11
c0de5e84:	f809 0008 	strb.w	r0, [r9, r8]
c0de5e88:	462c      	mov	r4, r5
c0de5e8a:	e02b      	b.n	c0de5ee4 <io_legacy_apdu_rx+0x2c0>
c0de5e8c:	f640 0526 	movw	r5, #2086	@ 0x826
c0de5e90:	f2c0 0500 	movt	r5, #0
c0de5e94:	eb09 0005 	add.w	r0, r9, r5
c0de5e98:	2701      	movs	r7, #1
c0de5e9a:	7187      	strb	r7, [r0, #6]
c0de5e9c:	f240 50f8 	movw	r0, #1528	@ 0x5f8
c0de5ea0:	3c01      	subs	r4, #1
c0de5ea2:	f2c0 0000 	movt	r0, #0
c0de5ea6:	eb09 0106 	add.w	r1, r9, r6
c0de5eaa:	4448      	add	r0, r9
c0de5eac:	3101      	adds	r1, #1
c0de5eae:	4622      	mov	r2, r4
c0de5eb0:	f002 faff 	bl	c0de84b2 <__aeabi_memcpy>
c0de5eb4:	f640 002f 	movw	r0, #2095	@ 0x82f
c0de5eb8:	f2c0 0000 	movt	r0, #0
c0de5ebc:	f809 7000 	strb.w	r7, [r9, r0]
c0de5ec0:	2008      	movs	r0, #8
c0de5ec2:	f809 0005 	strb.w	r0, [r9, r5]
c0de5ec6:	e00d      	b.n	c0de5ee4 <io_legacy_apdu_rx+0x2c0>
c0de5ec8:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de5ecc:	2815      	cmp	r0, #21
c0de5ece:	d89c      	bhi.n	c0de5e0a <io_legacy_apdu_rx+0x1e6>
c0de5ed0:	2101      	movs	r1, #1
c0de5ed2:	fa01 f000 	lsl.w	r0, r1, r0
c0de5ed6:	f245 0120 	movw	r1, #20512	@ 0x5020
c0de5eda:	f2c0 0120 	movt	r1, #32
c0de5ede:	4208      	tst	r0, r1
c0de5ee0:	d093      	beq.n	c0de5e0a <io_legacy_apdu_rx+0x1e6>
c0de5ee2:	2400      	movs	r4, #0
c0de5ee4:	4620      	mov	r0, r4
c0de5ee6:	b004      	add	sp, #16
c0de5ee8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de5eec:	f640 002f 	movw	r0, #2095	@ 0x82f
c0de5ef0:	f2c0 0000 	movt	r0, #0
c0de5ef4:	2101      	movs	r1, #1
c0de5ef6:	f809 1000 	strb.w	r1, [r9, r0]
c0de5efa:	200c      	movs	r0, #12
c0de5efc:	f809 0008 	strb.w	r0, [r9, r8]
c0de5f00:	e7f0      	b.n	c0de5ee4 <io_legacy_apdu_rx+0x2c0>
c0de5f02:	20ff      	movs	r0, #255	@ 0xff
c0de5f04:	f002 f8b0 	bl	c0de8068 <os_sched_exit>

c0de5f08 <io_seproxyhal_init>:
c0de5f08:	b570      	push	{r4, r5, r6, lr}
c0de5f0a:	b08a      	sub	sp, #40	@ 0x28
c0de5f0c:	f640 002e 	movw	r0, #2094	@ 0x82e
c0de5f10:	f2c0 0000 	movt	r0, #0
c0de5f14:	2500      	movs	r5, #0
c0de5f16:	ac01      	add	r4, sp, #4
c0de5f18:	f809 5000 	strb.w	r5, [r9, r0]
c0de5f1c:	4620      	mov	r0, r4
c0de5f1e:	2118      	movs	r1, #24
c0de5f20:	f002 fac4 	bl	c0de84ac <__aeabi_memclr>
c0de5f24:	2015      	movs	r0, #21
c0de5f26:	f2c0 0002 	movt	r0, #2
c0de5f2a:	9007      	str	r0, [sp, #28]
c0de5f2c:	2601      	movs	r6, #1
c0de5f2e:	4620      	mov	r0, r4
c0de5f30:	f8ad 6020 	strh.w	r6, [sp, #32]
c0de5f34:	f88d 5022 	strb.w	r5, [sp, #34]	@ 0x22
c0de5f38:	f8ad 5024 	strh.w	r5, [sp, #36]	@ 0x24
c0de5f3c:	f002 f89f 	bl	c0de807e <os_io_init>
c0de5f40:	f640 0024 	movw	r0, #2084	@ 0x824
c0de5f44:	f2c0 0000 	movt	r0, #0
c0de5f48:	f809 6000 	strb.w	r6, [r9, r0]
c0de5f4c:	b00a      	add	sp, #40	@ 0x28
c0de5f4e:	bd70      	pop	{r4, r5, r6, pc}

c0de5f50 <USB_power>:
c0de5f50:	4770      	bx	lr
	...

c0de5f54 <bagl_draw_with_context>:
c0de5f54:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de5f58:	b08e      	sub	sp, #56	@ 0x38
c0de5f5a:	f890 8000 	ldrb.w	r8, [r0]
c0de5f5e:	4604      	mov	r4, r0
c0de5f60:	f008 0b7f 	and.w	fp, r8, #127	@ 0x7f
c0de5f64:	f1bb 0f05 	cmp.w	fp, #5
c0de5f68:	910d      	str	r1, [sp, #52]	@ 0x34
c0de5f6a:	920a      	str	r2, [sp, #40]	@ 0x28
c0de5f6c:	f000 80b7 	beq.w	c0de60de <bagl_draw_with_context+0x18a>
c0de5f70:	8b20      	ldrh	r0, [r4, #24]
c0de5f72:	4616      	mov	r6, r2
c0de5f74:	f000 facc 	bl	c0de6510 <bagl_get_font>
c0de5f78:	2800      	cmp	r0, #0
c0de5f7a:	f000 80b0 	beq.w	c0de60de <bagl_draw_with_context+0x18a>
c0de5f7e:	f890 a005 	ldrb.w	sl, [r0, #5]
c0de5f82:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de5f84:	8921      	ldrh	r1, [r4, #8]
c0de5f86:	2800      	cmp	r0, #0
c0de5f88:	f04f 0c00 	mov.w	ip, #0
c0de5f8c:	f8cd a02c 	str.w	sl, [sp, #44]	@ 0x2c
c0de5f90:	9109      	str	r1, [sp, #36]	@ 0x24
c0de5f92:	f000 8179 	beq.w	c0de6288 <bagl_draw_with_context+0x334>
c0de5f96:	2e00      	cmp	r6, #0
c0de5f98:	f000 8176 	beq.w	c0de6288 <bagl_draw_with_context+0x334>
c0de5f9c:	88e1      	ldrh	r1, [r4, #6]
c0de5f9e:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de5fa2:	3164      	adds	r1, #100	@ 0x64
c0de5fa4:	b289      	uxth	r1, r1
c0de5fa6:	8b20      	ldrh	r0, [r4, #24]
c0de5fa8:	e9cd 3100 	strd	r3, r1, [sp]
c0de5fac:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de5fae:	b2f2      	uxtb	r2, r6
c0de5fb0:	2500      	movs	r5, #0
c0de5fb2:	e9cd 1203 	strd	r1, r2, [sp, #12]
c0de5fb6:	2100      	movs	r1, #0
c0de5fb8:	2200      	movs	r2, #0
c0de5fba:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de5fbe:	2700      	movs	r7, #0
c0de5fc0:	9502      	str	r5, [sp, #8]
c0de5fc2:	970c      	str	r7, [sp, #48]	@ 0x30
c0de5fc4:	9505      	str	r5, [sp, #20]
c0de5fc6:	f000 fae1 	bl	c0de658c <bagl_draw_string>
c0de5fca:	88e1      	ldrh	r1, [r4, #6]
c0de5fcc:	2e05      	cmp	r6, #5
c0de5fce:	b285      	uxth	r5, r0
c0de5fd0:	f0c0 81a7 	bcc.w	c0de6322 <bagl_draw_with_context+0x3ce>
c0de5fd4:	42a9      	cmp	r1, r5
c0de5fd6:	f080 81a4 	bcs.w	c0de6322 <bagl_draw_with_context+0x3ce>
c0de5fda:	8b20      	ldrh	r0, [r4, #24]
c0de5fdc:	f642 52f1 	movw	r2, #11761	@ 0x2df1
c0de5fe0:	f2c0 0200 	movt	r2, #0
c0de5fe4:	2700      	movs	r7, #0
c0de5fe6:	2103      	movs	r1, #3
c0de5fe8:	447a      	add	r2, pc
c0de5fea:	2364      	movs	r3, #100	@ 0x64
c0de5fec:	f243 0639 	movw	r6, #12345	@ 0x3039
c0de5ff0:	9600      	str	r6, [sp, #0]
c0de5ff2:	9e0a      	ldr	r6, [sp, #40]	@ 0x28
c0de5ff4:	e9cd 3701 	strd	r3, r7, [sp, #4]
c0de5ff8:	e9cd 2103 	strd	r2, r1, [sp, #12]
c0de5ffc:	2100      	movs	r1, #0
c0de5ffe:	2200      	movs	r2, #0
c0de6000:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de6004:	9705      	str	r7, [sp, #20]
c0de6006:	f000 fac1 	bl	c0de658c <bagl_draw_string>
c0de600a:	88e1      	ldrh	r1, [r4, #6]
c0de600c:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
c0de600e:	ea4f 0c56 	mov.w	ip, r6, lsr #1
c0de6012:	428d      	cmp	r5, r1
c0de6014:	eb02 0256 	add.w	r2, r2, r6, lsr #1
c0de6018:	920c      	str	r2, [sp, #48]	@ 0x30
c0de601a:	f240 8183 	bls.w	c0de6324 <bagl_draw_with_context+0x3d0>
c0de601e:	ebb6 0a0c 	subs.w	sl, r6, ip
c0de6022:	f000 817f 	beq.w	c0de6324 <bagl_draw_with_context+0x3d0>
c0de6026:	b280      	uxth	r0, r0
c0de6028:	9008      	str	r0, [sp, #32]
c0de602a:	2600      	movs	r6, #0
c0de602c:	f8cd 801c 	str.w	r8, [sp, #28]
c0de6030:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de6034:	8b20      	ldrh	r0, [r4, #24]
c0de6036:	e9cd 3100 	strd	r3, r1, [sp]
c0de603a:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de603c:	fa5f f28c 	uxtb.w	r2, ip
c0de6040:	465f      	mov	r7, fp
c0de6042:	f04f 0b00 	mov.w	fp, #0
c0de6046:	e9cd 1203 	strd	r1, r2, [sp, #12]
c0de604a:	2100      	movs	r1, #0
c0de604c:	2200      	movs	r2, #0
c0de604e:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de6052:	46e0      	mov	r8, ip
c0de6054:	f8cd b008 	str.w	fp, [sp, #8]
c0de6058:	f8cd b014 	str.w	fp, [sp, #20]
c0de605c:	f000 fa96 	bl	c0de658c <bagl_draw_string>
c0de6060:	88e1      	ldrh	r1, [r4, #6]
c0de6062:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de6066:	b285      	uxth	r5, r0
c0de6068:	8b20      	ldrh	r0, [r4, #24]
c0de606a:	e9cd 3100 	strd	r3, r1, [sp]
c0de606e:	990c      	ldr	r1, [sp, #48]	@ 0x30
c0de6070:	fa5f f28a 	uxtb.w	r2, sl
c0de6074:	e9cd 1203 	strd	r1, r2, [sp, #12]
c0de6078:	2100      	movs	r1, #0
c0de607a:	2200      	movs	r2, #0
c0de607c:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de6080:	f8cd b008 	str.w	fp, [sp, #8]
c0de6084:	f8cd b014 	str.w	fp, [sp, #20]
c0de6088:	f000 fa80 	bl	c0de658c <bagl_draw_string>
c0de608c:	9908      	ldr	r1, [sp, #32]
c0de608e:	b280      	uxth	r0, r0
c0de6090:	186a      	adds	r2, r5, r1
c0de6092:	88e1      	ldrh	r1, [r4, #6]
c0de6094:	1815      	adds	r5, r2, r0
c0de6096:	428d      	cmp	r5, r1
c0de6098:	f240 8234 	bls.w	c0de6504 <bagl_draw_with_context+0x5b0>
c0de609c:	2e01      	cmp	r6, #1
c0de609e:	d007      	beq.n	c0de60b0 <bagl_draw_with_context+0x15c>
c0de60a0:	46c4      	mov	ip, r8
c0de60a2:	46bb      	mov	fp, r7
c0de60a4:	b90e      	cbnz	r6, c0de60aa <bagl_draw_with_context+0x156>
c0de60a6:	f1ac 0c01 	sub.w	ip, ip, #1
c0de60aa:	f8dd 801c 	ldr.w	r8, [sp, #28]
c0de60ae:	e006      	b.n	c0de60be <bagl_draw_with_context+0x16a>
c0de60b0:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de60b2:	46c4      	mov	ip, r8
c0de60b4:	f8dd 801c 	ldr.w	r8, [sp, #28]
c0de60b8:	3001      	adds	r0, #1
c0de60ba:	46bb      	mov	fp, r7
c0de60bc:	900c      	str	r0, [sp, #48]	@ 0x30
c0de60be:	f1bc 0f00 	cmp.w	ip, #0
c0de60c2:	f000 812f 	beq.w	c0de6324 <bagl_draw_with_context+0x3d0>
c0de60c6:	e9dd 200c 	ldrd	r2, r0, [sp, #48]	@ 0x30
c0de60ca:	1a80      	subs	r0, r0, r2
c0de60cc:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
c0de60ce:	eb10 0a02 	adds.w	sl, r0, r2
c0de60d2:	f04f 0001 	mov.w	r0, #1
c0de60d6:	ea20 0606 	bic.w	r6, r0, r6
c0de60da:	d1a9      	bne.n	c0de6030 <bagl_draw_with_context+0xdc>
c0de60dc:	e122      	b.n	c0de6324 <bagl_draw_with_context+0x3d0>
c0de60de:	2000      	movs	r0, #0
c0de60e0:	900c      	str	r0, [sp, #48]	@ 0x30
c0de60e2:	2000      	movs	r0, #0
c0de60e4:	9009      	str	r0, [sp, #36]	@ 0x24
c0de60e6:	2000      	movs	r0, #0
c0de60e8:	f04f 0c00 	mov.w	ip, #0
c0de60ec:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de60ee:	f04f 0e00 	mov.w	lr, #0
c0de60f2:	2500      	movs	r5, #0
c0de60f4:	88e3      	ldrh	r3, [r4, #6]
c0de60f6:	8926      	ldrh	r6, [r4, #8]
c0de60f8:	7ae7      	ldrb	r7, [r4, #11]
c0de60fa:	0858      	lsrs	r0, r3, #1
c0de60fc:	0871      	lsrs	r1, r6, #1
c0de60fe:	ebb0 0f56 	cmp.w	r0, r6, lsr #1
c0de6102:	460a      	mov	r2, r1
c0de6104:	bf38      	it	cc
c0de6106:	085a      	lsrcc	r2, r3, #1
c0de6108:	42ba      	cmp	r2, r7
c0de610a:	46ba      	mov	sl, r7
c0de610c:	d803      	bhi.n	c0de6116 <bagl_draw_with_context+0x1c2>
c0de610e:	4288      	cmp	r0, r1
c0de6110:	bf2c      	ite	cs
c0de6112:	468a      	movcs	sl, r1
c0de6114:	4682      	movcc	sl, r0
c0de6116:	f1ab 0001 	sub.w	r0, fp, #1
c0de611a:	2804      	cmp	r0, #4
c0de611c:	d307      	bcc.n	c0de612e <bagl_draw_with_context+0x1da>
c0de611e:	f1bb 0f06 	cmp.w	fp, #6
c0de6122:	f000 80b4 	beq.w	c0de628e <bagl_draw_with_context+0x33a>
c0de6126:	f1bb 0f07 	cmp.w	fp, #7
c0de612a:	f040 80c8 	bne.w	c0de62be <bagl_draw_with_context+0x36a>
c0de612e:	f1bb 0f04 	cmp.w	fp, #4
c0de6132:	bf08      	it	eq
c0de6134:	2f00      	cmpeq	r7, #0
c0de6136:	d00a      	beq.n	c0de614e <bagl_draw_with_context+0x1fa>
c0de6138:	f1b8 0f81 	cmp.w	r8, #129	@ 0x81
c0de613c:	9508      	str	r5, [sp, #32]
c0de613e:	dc0f      	bgt.n	c0de6160 <bagl_draw_with_context+0x20c>
c0de6140:	f1b8 0f02 	cmp.w	r8, #2
c0de6144:	d013      	beq.n	c0de616e <bagl_draw_with_context+0x21a>
c0de6146:	f1b8 0f07 	cmp.w	r8, #7
c0de614a:	d010      	beq.n	c0de616e <bagl_draw_with_context+0x21a>
c0de614c:	e0ba      	b.n	c0de62c4 <bagl_draw_with_context+0x370>
c0de614e:	6920      	ldr	r0, [r4, #16]
c0de6150:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de6154:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de6158:	9600      	str	r6, [sp, #0]
c0de615a:	f002 f808 	bl	c0de816e <bagl_hal_draw_rect>
c0de615e:	e0ae      	b.n	c0de62be <bagl_draw_with_context+0x36a>
c0de6160:	f1b8 0f87 	cmp.w	r8, #135	@ 0x87
c0de6164:	d003      	beq.n	c0de616e <bagl_draw_with_context+0x21a>
c0de6166:	f1b8 0f82 	cmp.w	r8, #130	@ 0x82
c0de616a:	f040 80ab 	bne.w	c0de62c4 <bagl_draw_with_context+0x370>
c0de616e:	6960      	ldr	r0, [r4, #20]
c0de6170:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de6174:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de6178:	9d0b      	ldr	r5, [sp, #44]	@ 0x2c
c0de617a:	f1bb 0f07 	cmp.w	fp, #7
c0de617e:	bf08      	it	eq
c0de6180:	1b52      	subeq	r2, r2, r5
c0de6182:	9d09      	ldr	r5, [sp, #36]	@ 0x24
c0de6184:	bf08      	it	eq
c0de6186:	462e      	moveq	r6, r5
c0de6188:	9600      	str	r6, [sp, #0]
c0de618a:	4665      	mov	r5, ip
c0de618c:	4676      	mov	r6, lr
c0de618e:	f001 ffee 	bl	c0de816e <bagl_hal_draw_rect>
c0de6192:	9f08      	ldr	r7, [sp, #32]
c0de6194:	46ac      	mov	ip, r5
c0de6196:	f1bb 0f04 	cmp.w	fp, #4
c0de619a:	f000 8090 	beq.w	c0de62be <bagl_draw_with_context+0x36a>
c0de619e:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de61a0:	2800      	cmp	r0, #0
c0de61a2:	f000 808c 	beq.w	c0de62be <bagl_draw_with_context+0x36a>
c0de61a6:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de61a8:	2800      	cmp	r0, #0
c0de61aa:	f000 8088 	beq.w	c0de62be <bagl_draw_with_context+0x36a>
c0de61ae:	f8dd e02c 	ldr.w	lr, [sp, #44]	@ 0x2c
c0de61b2:	e9d4 a204 	ldrd	sl, r2, [r4, #16]
c0de61b6:	f008 007d 	and.w	r0, r8, #125	@ 0x7d
c0de61ba:	2801      	cmp	r0, #1
c0de61bc:	d106      	bne.n	c0de61cc <bagl_draw_with_context+0x278>
c0de61be:	7b20      	ldrb	r0, [r4, #12]
c0de61c0:	2801      	cmp	r0, #1
c0de61c2:	4650      	mov	r0, sl
c0de61c4:	bf04      	itt	eq
c0de61c6:	4610      	moveq	r0, r2
c0de61c8:	4652      	moveq	r2, sl
c0de61ca:	4682      	mov	sl, r0
c0de61cc:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de61d0:	46b0      	mov	r8, r6
c0de61d2:	8b20      	ldrh	r0, [r4, #24]
c0de61d4:	f9b4 5004 	ldrsh.w	r5, [r4, #4]
c0de61d8:	187b      	adds	r3, r7, r1
c0de61da:	f1bb 0f07 	cmp.w	fp, #7
c0de61de:	bf08      	it	eq
c0de61e0:	f1ce 0800 	rsbeq	r8, lr, #0
c0de61e4:	88e1      	ldrh	r1, [r4, #6]
c0de61e6:	eb08 0e05 	add.w	lr, r8, r5
c0de61ea:	1bc9      	subs	r1, r1, r7
c0de61ec:	f1bb 0707 	subs.w	r7, fp, #7
c0de61f0:	8925      	ldrh	r5, [r4, #8]
c0de61f2:	bf18      	it	ne
c0de61f4:	4637      	movne	r7, r6
c0de61f6:	e9cd e100 	strd	lr, r1, [sp]
c0de61fa:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de61fc:	1bed      	subs	r5, r5, r7
c0de61fe:	2600      	movs	r6, #0
c0de6200:	e9cd 1c03 	strd	r1, ip, [sp, #12]
c0de6204:	4651      	mov	r1, sl
c0de6206:	9502      	str	r5, [sp, #8]
c0de6208:	9605      	str	r6, [sp, #20]
c0de620a:	4693      	mov	fp, r2
c0de620c:	f000 f9be 	bl	c0de658c <bagl_draw_string>
c0de6210:	990c      	ldr	r1, [sp, #48]	@ 0x30
c0de6212:	9e08      	ldr	r6, [sp, #32]
c0de6214:	2900      	cmp	r1, #0
c0de6216:	d052      	beq.n	c0de62be <bagl_draw_with_context+0x36a>
c0de6218:	f9b4 5004 	ldrsh.w	r5, [r4, #4]
c0de621c:	f8b4 e018 	ldrh.w	lr, [r4, #24]
c0de6220:	b283      	uxth	r3, r0
c0de6222:	eb08 0005 	add.w	r0, r8, r5
c0de6226:	88e1      	ldrh	r1, [r4, #6]
c0de6228:	8925      	ldrh	r5, [r4, #8]
c0de622a:	f642 329f 	movw	r2, #11167	@ 0x2b9f
c0de622e:	f2c0 0200 	movt	r2, #0
c0de6232:	1b89      	subs	r1, r1, r6
c0de6234:	1bed      	subs	r5, r5, r7
c0de6236:	f04f 0c03 	mov.w	ip, #3
c0de623a:	447a      	add	r2, pc
c0de623c:	e88d 0023 	stmia.w	sp, {r0, r1, r5}
c0de6240:	e9cd 2c03 	strd	r2, ip, [sp, #12]
c0de6244:	4670      	mov	r0, lr
c0de6246:	4651      	mov	r1, sl
c0de6248:	465a      	mov	r2, fp
c0de624a:	2500      	movs	r5, #0
c0de624c:	9505      	str	r5, [sp, #20]
c0de624e:	f000 f99d 	bl	c0de658c <bagl_draw_string>
c0de6252:	88e3      	ldrh	r3, [r4, #6]
c0de6254:	8925      	ldrh	r5, [r4, #8]
c0de6256:	1b9e      	subs	r6, r3, r6
c0de6258:	b283      	uxth	r3, r0
c0de625a:	1be8      	subs	r0, r5, r7
c0de625c:	9f0a      	ldr	r7, [sp, #40]	@ 0x28
c0de625e:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
c0de6260:	f9b4 1004 	ldrsh.w	r1, [r4, #4]
c0de6264:	442f      	add	r7, r5
c0de6266:	9d0c      	ldr	r5, [sp, #48]	@ 0x30
c0de6268:	eb08 0201 	add.w	r2, r8, r1
c0de626c:	8b21      	ldrh	r1, [r4, #24]
c0de626e:	1b7f      	subs	r7, r7, r5
c0de6270:	e9cd 2600 	strd	r2, r6, [sp]
c0de6274:	aa02      	add	r2, sp, #8
c0de6276:	c2a1      	stmia	r2!, {r0, r5, r7}
c0de6278:	4608      	mov	r0, r1
c0de627a:	4651      	mov	r1, sl
c0de627c:	465a      	mov	r2, fp
c0de627e:	2700      	movs	r7, #0
c0de6280:	9705      	str	r7, [sp, #20]
c0de6282:	f000 f983 	bl	c0de658c <bagl_draw_string>
c0de6286:	e01a      	b.n	c0de62be <bagl_draw_with_context+0x36a>
c0de6288:	2000      	movs	r0, #0
c0de628a:	900c      	str	r0, [sp, #48]	@ 0x30
c0de628c:	e72f      	b.n	c0de60ee <bagl_draw_with_context+0x19a>
c0de628e:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de6292:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de6296:	7b23      	ldrb	r3, [r4, #12]
c0de6298:	6920      	ldr	r0, [r4, #16]
c0de629a:	4439      	add	r1, r7
c0de629c:	2b01      	cmp	r3, #1
c0de629e:	443a      	add	r2, r7
c0de62a0:	d004      	beq.n	c0de62ac <bagl_draw_with_context+0x358>
c0de62a2:	7aa3      	ldrb	r3, [r4, #10]
c0de62a4:	429f      	cmp	r7, r3
c0de62a6:	d901      	bls.n	c0de62ac <bagl_draw_with_context+0x358>
c0de62a8:	1afb      	subs	r3, r7, r3
c0de62aa:	e000      	b.n	c0de62ae <bagl_draw_with_context+0x35a>
c0de62ac:	2300      	movs	r3, #0
c0de62ae:	6966      	ldr	r6, [r4, #20]
c0de62b0:	25ff      	movs	r5, #255	@ 0xff
c0de62b2:	e9cd 5300 	strd	r5, r3, [sp]
c0de62b6:	463b      	mov	r3, r7
c0de62b8:	9602      	str	r6, [sp, #8]
c0de62ba:	f000 fab7 	bl	c0de682c <bagl_draw_circle_helper>
c0de62be:	b00e      	add	sp, #56	@ 0x38
c0de62c0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de62c4:	7b20      	ldrb	r0, [r4, #12]
c0de62c6:	f8cd e018 	str.w	lr, [sp, #24]
c0de62ca:	2801      	cmp	r0, #1
c0de62cc:	f8cd c024 	str.w	ip, [sp, #36]	@ 0x24
c0de62d0:	d151      	bne.n	c0de6376 <bagl_draw_with_context+0x422>
c0de62d2:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de62d6:	6920      	ldr	r0, [r4, #16]
c0de62d8:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de62dc:	4451      	add	r1, sl
c0de62de:	eba3 034a 	sub.w	r3, r3, sl, lsl #1
c0de62e2:	9600      	str	r6, [sp, #0]
c0de62e4:	f001 ff43 	bl	c0de816e <bagl_hal_draw_rect>
c0de62e8:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de62ec:	8923      	ldrh	r3, [r4, #8]
c0de62ee:	6920      	ldr	r0, [r4, #16]
c0de62f0:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de62f4:	4452      	add	r2, sl
c0de62f6:	eba3 074a 	sub.w	r7, r3, sl, lsl #1
c0de62fa:	4653      	mov	r3, sl
c0de62fc:	9700      	str	r7, [sp, #0]
c0de62fe:	f001 ff36 	bl	c0de816e <bagl_hal_draw_rect>
c0de6302:	f9b4 2002 	ldrsh.w	r2, [r4, #2]
c0de6306:	88e1      	ldrh	r1, [r4, #6]
c0de6308:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
c0de630c:	8927      	ldrh	r7, [r4, #8]
c0de630e:	6920      	ldr	r0, [r4, #16]
c0de6310:	eba2 020a 	sub.w	r2, r2, sl
c0de6314:	4411      	add	r1, r2
c0de6316:	eb0a 0203 	add.w	r2, sl, r3
c0de631a:	eba7 074a 	sub.w	r7, r7, sl, lsl #1
c0de631e:	4653      	mov	r3, sl
c0de6320:	e08c      	b.n	c0de643c <bagl_draw_with_context+0x4e8>
c0de6322:	46b4      	mov	ip, r6
c0de6324:	8b20      	ldrh	r0, [r4, #24]
c0de6326:	f400 4240 	and.w	r2, r0, #49152	@ 0xc000
c0de632a:	f5b2 4f00 	cmp.w	r2, #32768	@ 0x8000
c0de632e:	d005      	beq.n	c0de633c <bagl_draw_with_context+0x3e8>
c0de6330:	f5b2 4f80 	cmp.w	r2, #16384	@ 0x4000
c0de6334:	9a0b      	ldr	r2, [sp, #44]	@ 0x2c
c0de6336:	d108      	bne.n	c0de634a <bagl_draw_with_context+0x3f6>
c0de6338:	1b49      	subs	r1, r1, r5
c0de633a:	e003      	b.n	c0de6344 <bagl_draw_with_context+0x3f0>
c0de633c:	0849      	lsrs	r1, r1, #1
c0de633e:	eba1 0155 	sub.w	r1, r1, r5, lsr #1
c0de6342:	9a0b      	ldr	r2, [sp, #44]	@ 0x2c
c0de6344:	ea21 75e1 	bic.w	r5, r1, r1, asr #31
c0de6348:	e000      	b.n	c0de634c <bagl_draw_with_context+0x3f8>
c0de634a:	2500      	movs	r5, #0
c0de634c:	f400 5040 	and.w	r0, r0, #12288	@ 0x3000
c0de6350:	f5b0 5f00 	cmp.w	r0, #8192	@ 0x2000
c0de6354:	d006      	beq.n	c0de6364 <bagl_draw_with_context+0x410>
c0de6356:	f5b0 5f80 	cmp.w	r0, #4096	@ 0x1000
c0de635a:	d109      	bne.n	c0de6370 <bagl_draw_with_context+0x41c>
c0de635c:	8920      	ldrh	r0, [r4, #8]
c0de635e:	eba0 0e02 	sub.w	lr, r0, r2
c0de6362:	e6c7      	b.n	c0de60f4 <bagl_draw_with_context+0x1a0>
c0de6364:	8920      	ldrh	r0, [r4, #8]
c0de6366:	ea6f 0152 	mvn.w	r1, r2, lsr #1
c0de636a:	eb01 0e50 	add.w	lr, r1, r0, lsr #1
c0de636e:	e6c1      	b.n	c0de60f4 <bagl_draw_with_context+0x1a0>
c0de6370:	f04f 0e00 	mov.w	lr, #0
c0de6374:	e6be      	b.n	c0de60f4 <bagl_draw_with_context+0x1a0>
c0de6376:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de637a:	6960      	ldr	r0, [r4, #20]
c0de637c:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de6380:	4451      	add	r1, sl
c0de6382:	eba3 034a 	sub.w	r3, r3, sl, lsl #1
c0de6386:	9600      	str	r6, [sp, #0]
c0de6388:	f001 fef1 	bl	c0de816e <bagl_hal_draw_rect>
c0de638c:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de6390:	8923      	ldrh	r3, [r4, #8]
c0de6392:	6960      	ldr	r0, [r4, #20]
c0de6394:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de6398:	4452      	add	r2, sl
c0de639a:	eba3 074a 	sub.w	r7, r3, sl, lsl #1
c0de639e:	4653      	mov	r3, sl
c0de63a0:	9700      	str	r7, [sp, #0]
c0de63a2:	f001 fee4 	bl	c0de816e <bagl_hal_draw_rect>
c0de63a6:	f9b4 3002 	ldrsh.w	r3, [r4, #2]
c0de63aa:	ea6f 020a 	mvn.w	r2, sl
c0de63ae:	88e1      	ldrh	r1, [r4, #6]
c0de63b0:	f9b4 7004 	ldrsh.w	r7, [r4, #4]
c0de63b4:	441a      	add	r2, r3
c0de63b6:	8923      	ldrh	r3, [r4, #8]
c0de63b8:	6960      	ldr	r0, [r4, #20]
c0de63ba:	4411      	add	r1, r2
c0de63bc:	eb0a 0207 	add.w	r2, sl, r7
c0de63c0:	eba3 074a 	sub.w	r7, r3, sl, lsl #1
c0de63c4:	4653      	mov	r3, sl
c0de63c6:	9700      	str	r7, [sp, #0]
c0de63c8:	f001 fed1 	bl	c0de816e <bagl_hal_draw_rect>
c0de63cc:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de63d0:	88e3      	ldrh	r3, [r4, #6]
c0de63d2:	6920      	ldr	r0, [r4, #16]
c0de63d4:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de63d8:	7aa7      	ldrb	r7, [r4, #10]
c0de63da:	4451      	add	r1, sl
c0de63dc:	eba3 034a 	sub.w	r3, r3, sl, lsl #1
c0de63e0:	9700      	str	r7, [sp, #0]
c0de63e2:	f001 fec4 	bl	c0de816e <bagl_hal_draw_rect>
c0de63e6:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de63ea:	8923      	ldrh	r3, [r4, #8]
c0de63ec:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de63f0:	441a      	add	r2, r3
c0de63f2:	88e3      	ldrh	r3, [r4, #6]
c0de63f4:	6920      	ldr	r0, [r4, #16]
c0de63f6:	7aa7      	ldrb	r7, [r4, #10]
c0de63f8:	4451      	add	r1, sl
c0de63fa:	3a01      	subs	r2, #1
c0de63fc:	eba3 034a 	sub.w	r3, r3, sl, lsl #1
c0de6400:	9700      	str	r7, [sp, #0]
c0de6402:	f001 feb4 	bl	c0de816e <bagl_hal_draw_rect>
c0de6406:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de640a:	8927      	ldrh	r7, [r4, #8]
c0de640c:	6920      	ldr	r0, [r4, #16]
c0de640e:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de6412:	7aa3      	ldrb	r3, [r4, #10]
c0de6414:	4452      	add	r2, sl
c0de6416:	eba7 074a 	sub.w	r7, r7, sl, lsl #1
c0de641a:	9700      	str	r7, [sp, #0]
c0de641c:	f001 fea7 	bl	c0de816e <bagl_hal_draw_rect>
c0de6420:	88e1      	ldrh	r1, [r4, #6]
c0de6422:	f9b4 2002 	ldrsh.w	r2, [r4, #2]
c0de6426:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
c0de642a:	8927      	ldrh	r7, [r4, #8]
c0de642c:	6920      	ldr	r0, [r4, #16]
c0de642e:	4411      	add	r1, r2
c0de6430:	eb0a 0203 	add.w	r2, sl, r3
c0de6434:	7aa3      	ldrb	r3, [r4, #10]
c0de6436:	3901      	subs	r1, #1
c0de6438:	eba7 074a 	sub.w	r7, r7, sl, lsl #1
c0de643c:	9700      	str	r7, [sp, #0]
c0de643e:	f001 fe96 	bl	c0de816e <bagl_hal_draw_rect>
c0de6442:	e9dd 7c08 	ldrd	r7, ip, [sp, #32]
c0de6446:	9e06      	ldr	r6, [sp, #24]
c0de6448:	f1ba 0f02 	cmp.w	sl, #2
c0de644c:	f4ff aea3 	bcc.w	c0de6196 <bagl_draw_with_context+0x242>
c0de6450:	7b20      	ldrb	r0, [r4, #12]
c0de6452:	2500      	movs	r5, #0
c0de6454:	2801      	cmp	r0, #1
c0de6456:	d004      	beq.n	c0de6462 <bagl_draw_with_context+0x50e>
c0de6458:	7aa0      	ldrb	r0, [r4, #10]
c0de645a:	ebba 0000 	subs.w	r0, sl, r0
c0de645e:	bf28      	it	cs
c0de6460:	4605      	movcs	r5, r0
c0de6462:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de6466:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de646a:	e9d4 0704 	ldrd	r0, r7, [r4, #16]
c0de646e:	23c0      	movs	r3, #192	@ 0xc0
c0de6470:	4451      	add	r1, sl
c0de6472:	4452      	add	r2, sl
c0de6474:	e9cd 3500 	strd	r3, r5, [sp]
c0de6478:	4653      	mov	r3, sl
c0de647a:	9702      	str	r7, [sp, #8]
c0de647c:	f000 f9d6 	bl	c0de682c <bagl_draw_circle_helper>
c0de6480:	88e1      	ldrh	r1, [r4, #6]
c0de6482:	7aa2      	ldrb	r2, [r4, #10]
c0de6484:	f9b4 3002 	ldrsh.w	r3, [r4, #2]
c0de6488:	f9b4 7004 	ldrsh.w	r7, [r4, #4]
c0de648c:	6920      	ldr	r0, [r4, #16]
c0de648e:	4419      	add	r1, r3
c0de6490:	4452      	add	r2, sl
c0de6492:	6966      	ldr	r6, [r4, #20]
c0de6494:	2330      	movs	r3, #48	@ 0x30
c0de6496:	1a89      	subs	r1, r1, r2
c0de6498:	eb0a 0207 	add.w	r2, sl, r7
c0de649c:	e9cd 3500 	strd	r3, r5, [sp]
c0de64a0:	4653      	mov	r3, sl
c0de64a2:	9602      	str	r6, [sp, #8]
c0de64a4:	f000 f9c2 	bl	c0de682c <bagl_draw_circle_helper>
c0de64a8:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de64ac:	8923      	ldrh	r3, [r4, #8]
c0de64ae:	7aa7      	ldrb	r7, [r4, #10]
c0de64b0:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de64b4:	441a      	add	r2, r3
c0de64b6:	eb0a 0307 	add.w	r3, sl, r7
c0de64ba:	6920      	ldr	r0, [r4, #16]
c0de64bc:	6967      	ldr	r7, [r4, #20]
c0de64be:	1ad2      	subs	r2, r2, r3
c0de64c0:	230c      	movs	r3, #12
c0de64c2:	4451      	add	r1, sl
c0de64c4:	e9cd 3500 	strd	r3, r5, [sp]
c0de64c8:	4653      	mov	r3, sl
c0de64ca:	9702      	str	r7, [sp, #8]
c0de64cc:	f000 f9ae 	bl	c0de682c <bagl_draw_circle_helper>
c0de64d0:	88e1      	ldrh	r1, [r4, #6]
c0de64d2:	f9b4 2002 	ldrsh.w	r2, [r4, #2]
c0de64d6:	7aa7      	ldrb	r7, [r4, #10]
c0de64d8:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
c0de64dc:	4411      	add	r1, r2
c0de64de:	eb0a 0207 	add.w	r2, sl, r7
c0de64e2:	8927      	ldrh	r7, [r4, #8]
c0de64e4:	6920      	ldr	r0, [r4, #16]
c0de64e6:	1a89      	subs	r1, r1, r2
c0de64e8:	1a9a      	subs	r2, r3, r2
c0de64ea:	6966      	ldr	r6, [r4, #20]
c0de64ec:	2303      	movs	r3, #3
c0de64ee:	443a      	add	r2, r7
c0de64f0:	e9cd 3500 	strd	r3, r5, [sp]
c0de64f4:	4653      	mov	r3, sl
c0de64f6:	9602      	str	r6, [sp, #8]
c0de64f8:	f000 f998 	bl	c0de682c <bagl_draw_circle_helper>
c0de64fc:	e9dd 7c08 	ldrd	r7, ip, [sp, #32]
c0de6500:	9e06      	ldr	r6, [sp, #24]
c0de6502:	e648      	b.n	c0de6196 <bagl_draw_with_context+0x242>
c0de6504:	46c4      	mov	ip, r8
c0de6506:	f8dd 801c 	ldr.w	r8, [sp, #28]
c0de650a:	46bb      	mov	fp, r7
c0de650c:	e70a      	b.n	c0de6324 <bagl_draw_with_context+0x3d0>
	...

c0de6510 <bagl_get_font>:
c0de6510:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de6512:	b081      	sub	sp, #4
c0de6514:	4604      	mov	r4, r0
c0de6516:	f644 5086 	movw	r0, #19846	@ 0x4d86
c0de651a:	f2c0 0000 	movt	r0, #0
c0de651e:	4478      	add	r0, pc
c0de6520:	f644 576a 	movw	r7, #19818	@ 0x4d6a
c0de6524:	6806      	ldr	r6, [r0, #0]
c0de6526:	f2c0 0700 	movt	r7, #0
c0de652a:	f36f 341f 	bfc	r4, #12, #20
c0de652e:	447f      	add	r7, pc
c0de6530:	b186      	cbz	r6, c0de6554 <bagl_get_font+0x44>
c0de6532:	eb07 0086 	add.w	r0, r7, r6, lsl #2
c0de6536:	f850 5c04 	ldr.w	r5, [r0, #-4]
c0de653a:	4628      	mov	r0, r5
c0de653c:	f001 fce4 	bl	c0de7f08 <pic>
c0de6540:	7880      	ldrb	r0, [r0, #2]
c0de6542:	3e01      	subs	r6, #1
c0de6544:	4284      	cmp	r4, r0
c0de6546:	d1f3      	bne.n	c0de6530 <bagl_get_font+0x20>
c0de6548:	4628      	mov	r0, r5
c0de654a:	b001      	add	sp, #4
c0de654c:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de6550:	f001 bcda 	b.w	c0de7f08 <pic>
c0de6554:	2000      	movs	r0, #0
c0de6556:	b001      	add	sp, #4
c0de6558:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de655a <bagl_compute_line_width>:
c0de655a:	b580      	push	{r7, lr}
c0de655c:	b086      	sub	sp, #24
c0de655e:	469c      	mov	ip, r3
c0de6560:	f04f 0e00 	mov.w	lr, #0
c0de6564:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de6568:	e9cd 3100 	strd	r3, r1, [sp]
c0de656c:	e9cd e202 	strd	lr, r2, [sp, #8]
c0de6570:	2100      	movs	r1, #0
c0de6572:	2200      	movs	r2, #0
c0de6574:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de6578:	f8cd e014 	str.w	lr, [sp, #20]
c0de657c:	f8cd c010 	str.w	ip, [sp, #16]
c0de6580:	f000 f804 	bl	c0de658c <bagl_draw_string>
c0de6584:	b280      	uxth	r0, r0
c0de6586:	b006      	add	sp, #24
c0de6588:	bd80      	pop	{r7, pc}
	...

c0de658c <bagl_draw_string>:
c0de658c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6590:	b0a4      	sub	sp, #144	@ 0x90
c0de6592:	9f2c      	ldr	r7, [sp, #176]	@ 0xb0
c0de6594:	f243 0539 	movw	r5, #12345	@ 0x3039
c0de6598:	ea83 0605 	eor.w	r6, r3, r5
c0de659c:	407d      	eors	r5, r7
c0de659e:	4335      	orrs	r5, r6
c0de65a0:	462c      	mov	r4, r5
c0de65a2:	bf08      	it	eq
c0de65a4:	462f      	moveq	r7, r5
c0de65a6:	9711      	str	r7, [sp, #68]	@ 0x44
c0de65a8:	9308      	str	r3, [sp, #32]
c0de65aa:	bf18      	it	ne
c0de65ac:	461c      	movne	r4, r3
c0de65ae:	9206      	str	r2, [sp, #24]
c0de65b0:	e9cd 2114 	strd	r2, r1, [sp, #80]	@ 0x50
c0de65b4:	f7ff ffac 	bl	c0de6510 <bagl_get_font>
c0de65b8:	2800      	cmp	r0, #0
c0de65ba:	f000 8125 	beq.w	c0de6808 <bagl_draw_string+0x27c>
c0de65be:	f8dd a0c0 	ldr.w	sl, [sp, #192]	@ 0xc0
c0de65c2:	4606      	mov	r6, r0
c0de65c4:	fab5 f085 	clz	r0, r5
c0de65c8:	f1ba 0f00 	cmp.w	sl, #0
c0de65cc:	ea4f 1050 	mov.w	r0, r0, lsr #5
c0de65d0:	9010      	str	r0, [sp, #64]	@ 0x40
c0de65d2:	f000 811c 	beq.w	c0de680e <bagl_draw_string+0x282>
c0de65d6:	e9dd 102d 	ldrd	r1, r0, [sp, #180]	@ 0xb4
c0de65da:	78f2      	ldrb	r2, [r6, #3]
c0de65dc:	1867      	adds	r7, r4, r1
c0de65de:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de65e0:	9b2f      	ldr	r3, [sp, #188]	@ 0xbc
c0de65e2:	4408      	add	r0, r1
c0de65e4:	9005      	str	r0, [sp, #20]
c0de65e6:	2001      	movs	r0, #1
c0de65e8:	46a4      	mov	ip, r4
c0de65ea:	4090      	lsls	r0, r2
c0de65ec:	920f      	str	r2, [sp, #60]	@ 0x3c
c0de65ee:	9007      	str	r0, [sp, #28]
c0de65f0:	960c      	str	r6, [sp, #48]	@ 0x30
c0de65f2:	970e      	str	r7, [sp, #56]	@ 0x38
c0de65f4:	f813 5b01 	ldrb.w	r5, [r3], #1
c0de65f8:	79b1      	ldrb	r1, [r6, #6]
c0de65fa:	f896 e004 	ldrb.w	lr, [r6, #4]
c0de65fe:	428d      	cmp	r5, r1
c0de6600:	d302      	bcc.n	c0de6608 <bagl_draw_string+0x7c>
c0de6602:	79f0      	ldrb	r0, [r6, #7]
c0de6604:	4285      	cmp	r5, r0
c0de6606:	d919      	bls.n	c0de663c <bagl_draw_string+0xb0>
c0de6608:	2dc0      	cmp	r5, #192	@ 0xc0
c0de660a:	d303      	bcc.n	c0de6614 <bagl_draw_string+0x88>
c0de660c:	f005 043f 	and.w	r4, r5, #63	@ 0x3f
c0de6610:	e005      	b.n	c0de661e <bagl_draw_string+0x92>
c0de6612:	bf00      	nop
c0de6614:	b268      	sxtb	r0, r5
c0de6616:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de661a:	dd25      	ble.n	c0de6668 <bagl_draw_string+0xdc>
c0de661c:	2400      	movs	r4, #0
c0de661e:	2000      	movs	r0, #0
c0de6620:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de6622:	9012      	str	r0, [sp, #72]	@ 0x48
c0de6624:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de6626:	f04f 0800 	mov.w	r8, #0
c0de662a:	fb0e f000 	mul.w	r0, lr, r0
c0de662e:	fb00 f504 	mul.w	r5, r0, r4
c0de6632:	2000      	movs	r0, #0
c0de6634:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de6636:	f04f 0b00 	mov.w	fp, #0
c0de663a:	e08d      	b.n	c0de6758 <bagl_draw_string+0x1cc>
c0de663c:	68f0      	ldr	r0, [r6, #12]
c0de663e:	f8cd c034 	str.w	ip, [sp, #52]	@ 0x34
c0de6642:	e9cd e30a 	strd	lr, r3, [sp, #40]	@ 0x28
c0de6646:	1a6f      	subs	r7, r5, r1
c0de6648:	f001 fc5e 	bl	c0de7f08 <pic>
c0de664c:	68b1      	ldr	r1, [r6, #8]
c0de664e:	4680      	mov	r8, r0
c0de6650:	4608      	mov	r0, r1
c0de6652:	f001 fc59 	bl	c0de7f08 <pic>
c0de6656:	79b1      	ldrb	r1, [r6, #6]
c0de6658:	79f2      	ldrb	r2, [r6, #7]
c0de665a:	f850 5027 	ldr.w	r5, [r0, r7, lsl #2]
c0de665e:	1a50      	subs	r0, r2, r1
c0de6660:	4287      	cmp	r7, r0
c0de6662:	d132      	bne.n	c0de66ca <bagl_draw_string+0x13e>
c0de6664:	8834      	ldrh	r4, [r6, #0]
c0de6666:	e038      	b.n	c0de66da <bagl_draw_string+0x14e>
c0de6668:	06a8      	lsls	r0, r5, #26
c0de666a:	f04f 000f 	mov.w	r0, #15
c0de666e:	46f3      	mov	fp, lr
c0de6670:	f8cd c034 	str.w	ip, [sp, #52]	@ 0x34
c0de6674:	4698      	mov	r8, r3
c0de6676:	bf58      	it	pl
c0de6678:	200e      	movpl	r0, #14
c0de667a:	f7ff ff49 	bl	c0de6510 <bagl_get_font>
c0de667e:	2800      	cmp	r0, #0
c0de6680:	f000 80b9 	beq.w	c0de67f6 <bagl_draw_string+0x26a>
c0de6684:	4607      	mov	r7, r0
c0de6686:	68c0      	ldr	r0, [r0, #12]
c0de6688:	f001 fc3e 	bl	c0de7f08 <pic>
c0de668c:	68b9      	ldr	r1, [r7, #8]
c0de668e:	4604      	mov	r4, r0
c0de6690:	4608      	mov	r0, r1
c0de6692:	f001 fc39 	bl	c0de7f08 <pic>
c0de6696:	f005 051f 	and.w	r5, r5, #31
c0de669a:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de669e:	f3c0 018b 	ubfx	r1, r0, #2, #12
c0de66a2:	68b8      	ldr	r0, [r7, #8]
c0de66a4:	4421      	add	r1, r4
c0de66a6:	9112      	str	r1, [sp, #72]	@ 0x48
c0de66a8:	f001 fc2e 	bl	c0de7f08 <pic>
c0de66ac:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de66b0:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de66b2:	f3c0 3484 	ubfx	r4, r0, #14, #5
c0de66b6:	7970      	ldrb	r0, [r6, #5]
c0de66b8:	7979      	ldrb	r1, [r7, #5]
c0de66ba:	f897 e004 	ldrb.w	lr, [r7, #4]
c0de66be:	4410      	add	r0, r2
c0de66c0:	e9dd c70d 	ldrd	ip, r7, [sp, #52]	@ 0x34
c0de66c4:	1a42      	subs	r2, r0, r1
c0de66c6:	4643      	mov	r3, r8
c0de66c8:	e7ac      	b.n	c0de6624 <bagl_draw_string+0x98>
c0de66ca:	68b0      	ldr	r0, [r6, #8]
c0de66cc:	f001 fc1c 	bl	c0de7f08 <pic>
c0de66d0:	eb00 0087 	add.w	r0, r0, r7, lsl #2
c0de66d4:	6840      	ldr	r0, [r0, #4]
c0de66d6:	f3c0 048b 	ubfx	r4, r0, #2, #12
c0de66da:	f3c5 018b 	ubfx	r1, r5, #2, #12
c0de66de:	68b0      	ldr	r0, [r6, #8]
c0de66e0:	4441      	add	r1, r8
c0de66e2:	9112      	str	r1, [sp, #72]	@ 0x48
c0de66e4:	f001 fc10 	bl	c0de7f08 <pic>
c0de66e8:	f850 0027 	ldr.w	r0, [r0, r7, lsl #2]
c0de66ec:	f3c0 008b 	ubfx	r0, r0, #2, #12
c0de66f0:	1a21      	subs	r1, r4, r0
c0de66f2:	68b0      	ldr	r0, [r6, #8]
c0de66f4:	00cd      	lsls	r5, r1, #3
c0de66f6:	f001 fc07 	bl	c0de7f08 <pic>
c0de66fa:	f850 1027 	ldr.w	r1, [r0, r7, lsl #2]
c0de66fe:	68b0      	ldr	r0, [r6, #8]
c0de6700:	f3c1 3184 	ubfx	r1, r1, #14, #5
c0de6704:	9109      	str	r1, [sp, #36]	@ 0x24
c0de6706:	f001 fbff 	bl	c0de7f08 <pic>
c0de670a:	f850 1027 	ldr.w	r1, [r0, r7, lsl #2]
c0de670e:	68b0      	ldr	r0, [r6, #8]
c0de6710:	f3c1 48c3 	ubfx	r8, r1, #19, #4
c0de6714:	f001 fbf8 	bl	c0de7f08 <pic>
c0de6718:	f850 4027 	ldr.w	r4, [r0, r7, lsl #2]
c0de671c:	68b0      	ldr	r0, [r6, #8]
c0de671e:	0f21      	lsrs	r1, r4, #28
c0de6720:	9113      	str	r1, [sp, #76]	@ 0x4c
c0de6722:	f001 fbf1 	bl	c0de7f08 <pic>
c0de6726:	f850 0027 	ldr.w	r0, [r0, r7, lsl #2]
c0de672a:	7971      	ldrb	r1, [r6, #5]
c0de672c:	f3c0 50c4 	ubfx	r0, r0, #23, #5
c0de6730:	1a41      	subs	r1, r0, r1
c0de6732:	68b0      	ldr	r0, [r6, #8]
c0de6734:	f101 0b09 	add.w	fp, r1, #9
c0de6738:	f001 fbe6 	bl	c0de7f08 <pic>
c0de673c:	f850 0027 	ldr.w	r0, [r0, r7, lsl #2]
c0de6740:	9a09      	ldr	r2, [sp, #36]	@ 0x24
c0de6742:	f3c0 40c3 	ubfx	r0, r0, #19, #4
c0de6746:	eb00 7014 	add.w	r0, r0, r4, lsr #28
c0de674a:	1a10      	subs	r0, r2, r0
c0de674c:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de674e:	e9dd c70d 	ldrd	ip, r7, [sp, #52]	@ 0x34
c0de6752:	e9dd e30a 	ldrd	lr, r3, [sp, #40]	@ 0x28
c0de6756:	b2c4      	uxtb	r4, r0
c0de6758:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de675a:	b138      	cbz	r0, c0de676c <bagl_draw_string+0x1e0>
c0de675c:	2f00      	cmp	r7, #0
c0de675e:	dd2f      	ble.n	c0de67c0 <bagl_draw_string+0x234>
c0de6760:	eb08 000c 	add.w	r0, r8, ip
c0de6764:	1901      	adds	r1, r0, r4
c0de6766:	42b9      	cmp	r1, r7
c0de6768:	dd2c      	ble.n	c0de67c4 <bagl_draw_string+0x238>
c0de676a:	e05a      	b.n	c0de6822 <bagl_draw_string+0x296>
c0de676c:	eb08 000c 	add.w	r0, r8, ip
c0de6770:	4420      	add	r0, r4
c0de6772:	42b8      	cmp	r0, r7
c0de6774:	dd0a      	ble.n	c0de678c <bagl_draw_string+0x200>
c0de6776:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de6778:	9905      	ldr	r1, [sp, #20]
c0de677a:	320c      	adds	r2, #12
c0de677c:	eb02 000e 	add.w	r0, r2, lr
c0de6780:	4458      	add	r0, fp
c0de6782:	9f08      	ldr	r7, [sp, #32]
c0de6784:	4288      	cmp	r0, r1
c0de6786:	9211      	str	r2, [sp, #68]	@ 0x44
c0de6788:	dd01      	ble.n	c0de678e <bagl_draw_string+0x202>
c0de678a:	e043      	b.n	c0de6814 <bagl_draw_string+0x288>
c0de678c:	4667      	mov	r7, ip
c0de678e:	9812      	ldr	r0, [sp, #72]	@ 0x48
c0de6790:	461e      	mov	r6, r3
c0de6792:	b1e0      	cbz	r0, c0de67ce <bagl_draw_string+0x242>
c0de6794:	eb02 010b 	add.w	r1, r2, fp
c0de6798:	9a07      	ldr	r2, [sp, #28]
c0de679a:	eb07 0008 	add.w	r0, r7, r8
c0de679e:	9200      	str	r2, [sp, #0]
c0de67a0:	aa14      	add	r2, sp, #80	@ 0x50
c0de67a2:	9201      	str	r2, [sp, #4]
c0de67a4:	9a0f      	ldr	r2, [sp, #60]	@ 0x3c
c0de67a6:	b2ad      	uxth	r5, r5
c0de67a8:	9202      	str	r2, [sp, #8]
c0de67aa:	9a12      	ldr	r2, [sp, #72]	@ 0x48
c0de67ac:	4673      	mov	r3, lr
c0de67ae:	9203      	str	r2, [sp, #12]
c0de67b0:	4622      	mov	r2, r4
c0de67b2:	9504      	str	r5, [sp, #16]
c0de67b4:	f001 fcc2 	bl	c0de813c <bagl_hal_draw_bitmap_within_rect>
c0de67b8:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de67bc:	d00e      	beq.n	c0de67dc <bagl_draw_string+0x250>
c0de67be:	e02f      	b.n	c0de6820 <bagl_draw_string+0x294>
c0de67c0:	eb08 000c 	add.w	r0, r8, ip
c0de67c4:	9913      	ldr	r1, [sp, #76]	@ 0x4c
c0de67c6:	4408      	add	r0, r1
c0de67c8:	eb00 0c04 	add.w	ip, r0, r4
c0de67cc:	e00e      	b.n	c0de67ec <bagl_draw_string+0x260>
c0de67ce:	9806      	ldr	r0, [sp, #24]
c0de67d0:	4639      	mov	r1, r7
c0de67d2:	4623      	mov	r3, r4
c0de67d4:	f8cd e000 	str.w	lr, [sp]
c0de67d8:	f001 fcc9 	bl	c0de816e <bagl_hal_draw_rect>
c0de67dc:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de67de:	4633      	mov	r3, r6
c0de67e0:	4440      	add	r0, r8
c0de67e2:	4420      	add	r0, r4
c0de67e4:	eb00 0c07 	add.w	ip, r0, r7
c0de67e8:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0de67ea:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
c0de67ec:	f1ba 0a01 	subs.w	sl, sl, #1
c0de67f0:	f47f af00 	bne.w	c0de65f4 <bagl_draw_string+0x68>
c0de67f4:	e00c      	b.n	c0de6810 <bagl_draw_string+0x284>
c0de67f6:	2000      	movs	r0, #0
c0de67f8:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de67fa:	e9dd c70d 	ldrd	ip, r7, [sp, #52]	@ 0x34
c0de67fe:	2400      	movs	r4, #0
c0de6800:	9012      	str	r0, [sp, #72]	@ 0x48
c0de6802:	4643      	mov	r3, r8
c0de6804:	46de      	mov	lr, fp
c0de6806:	e70d      	b.n	c0de6624 <bagl_draw_string+0x98>
c0de6808:	f04f 0c00 	mov.w	ip, #0
c0de680c:	e009      	b.n	c0de6822 <bagl_draw_string+0x296>
c0de680e:	46a4      	mov	ip, r4
c0de6810:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de6812:	b930      	cbnz	r0, c0de6822 <bagl_draw_string+0x296>
c0de6814:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de6816:	fa1f f08c 	uxth.w	r0, ip
c0de681a:	ea40 4c01 	orr.w	ip, r0, r1, lsl #16
c0de681e:	e000      	b.n	c0de6822 <bagl_draw_string+0x296>
c0de6820:	46bc      	mov	ip, r7
c0de6822:	4660      	mov	r0, ip
c0de6824:	b024      	add	sp, #144	@ 0x90
c0de6826:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
	...

c0de682c <bagl_draw_circle_helper>:
c0de682c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6830:	b098      	sub	sp, #96	@ 0x60
c0de6832:	9217      	str	r2, [sp, #92]	@ 0x5c
c0de6834:	9a21      	ldr	r2, [sp, #132]	@ 0x84
c0de6836:	4607      	mov	r7, r0
c0de6838:	1a9e      	subs	r6, r3, r2
c0de683a:	2a00      	cmp	r2, #0
c0de683c:	4610      	mov	r0, r2
c0de683e:	bf18      	it	ne
c0de6840:	2001      	movne	r0, #1
c0de6842:	2500      	movs	r5, #0
c0de6844:	2e00      	cmp	r6, #0
c0de6846:	9612      	str	r6, [sp, #72]	@ 0x48
c0de6848:	bfc8      	it	gt
c0de684a:	2501      	movgt	r5, #1
c0de684c:	2b00      	cmp	r3, #0
c0de684e:	9313      	str	r3, [sp, #76]	@ 0x4c
c0de6850:	9116      	str	r1, [sp, #88]	@ 0x58
c0de6852:	f100 81c2 	bmi.w	c0de6bda <bagl_draw_circle_helper+0x3ae>
c0de6856:	9e13      	ldr	r6, [sp, #76]	@ 0x4c
c0de6858:	9920      	ldr	r1, [sp, #128]	@ 0x80
c0de685a:	4028      	ands	r0, r5
c0de685c:	9015      	str	r0, [sp, #84]	@ 0x54
c0de685e:	f1c6 0001 	rsb	r0, r6, #1
c0de6862:	9011      	str	r0, [sp, #68]	@ 0x44
c0de6864:	f001 0001 	and.w	r0, r1, #1
c0de6868:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de686a:	9010      	str	r0, [sp, #64]	@ 0x40
c0de686c:	f001 0002 	and.w	r0, r1, #2
c0de6870:	900c      	str	r0, [sp, #48]	@ 0x30
c0de6872:	1e58      	subs	r0, r3, #1
c0de6874:	9007      	str	r0, [sp, #28]
c0de6876:	f001 0004 	and.w	r0, r1, #4
c0de687a:	900d      	str	r0, [sp, #52]	@ 0x34
c0de687c:	f001 0008 	and.w	r0, r1, #8
c0de6880:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de6882:	f001 0010 	and.w	r0, r1, #16
c0de6886:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de6888:	f001 0020 	and.w	r0, r1, #32
c0de688c:	900a      	str	r0, [sp, #40]	@ 0x28
c0de688e:	f001 0040 	and.w	r0, r1, #64	@ 0x40
c0de6892:	900e      	str	r0, [sp, #56]	@ 0x38
c0de6894:	f001 0080 	and.w	r0, r1, #128	@ 0x80
c0de6898:	9009      	str	r0, [sp, #36]	@ 0x24
c0de689a:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de689c:	1b91      	subs	r1, r2, r6
c0de689e:	4410      	add	r0, r2
c0de68a0:	1b80      	subs	r0, r0, r6
c0de68a2:	9103      	str	r1, [sp, #12]
c0de68a4:	f1c3 0101 	rsb	r1, r3, #1
c0de68a8:	e9cd 1005 	strd	r1, r0, [sp, #20]
c0de68ac:	3001      	adds	r0, #1
c0de68ae:	f04f 0b00 	mov.w	fp, #0
c0de68b2:	f04f 31ff 	mov.w	r1, #4294967295	@ 0xffffffff
c0de68b6:	f04f 0a01 	mov.w	sl, #1
c0de68ba:	f04f 0800 	mov.w	r8, #0
c0de68be:	9004      	str	r0, [sp, #16]
c0de68c0:	9708      	str	r7, [sp, #32]
c0de68c2:	bf00      	nop
c0de68c4:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de68c6:	1c4c      	adds	r4, r1, #1
c0de68c8:	9114      	str	r1, [sp, #80]	@ 0x50
c0de68ca:	b928      	cbnz	r0, c0de68d8 <bagl_draw_circle_helper+0xac>
c0de68cc:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de68ce:	2800      	cmp	r0, #0
c0de68d0:	d053      	beq.n	c0de697a <bagl_draw_circle_helper+0x14e>
c0de68d2:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de68d4:	bb18      	cbnz	r0, c0de691e <bagl_draw_circle_helper+0xf2>
c0de68d6:	e046      	b.n	c0de6966 <bagl_draw_circle_helper+0x13a>
c0de68d8:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de68da:	b3c8      	cbz	r0, c0de6950 <bagl_draw_circle_helper+0x124>
c0de68dc:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de68de:	46a2      	mov	sl, r4
c0de68e0:	4408      	add	r0, r1
c0de68e2:	1c45      	adds	r5, r0, #1
c0de68e4:	9807      	ldr	r0, [sp, #28]
c0de68e6:	463c      	mov	r4, r7
c0de68e8:	9f16      	ldr	r7, [sp, #88]	@ 0x58
c0de68ea:	1a33      	subs	r3, r6, r0
c0de68ec:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de68ee:	f04f 0c01 	mov.w	ip, #1
c0de68f2:	4639      	mov	r1, r7
c0de68f4:	462a      	mov	r2, r5
c0de68f6:	f8cd c000 	str.w	ip, [sp]
c0de68fa:	f001 fc38 	bl	c0de816e <bagl_hal_draw_rect>
c0de68fe:	9905      	ldr	r1, [sp, #20]
c0de6900:	19f0      	adds	r0, r6, r7
c0de6902:	4627      	mov	r7, r4
c0de6904:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6906:	4654      	mov	r4, sl
c0de6908:	f04f 0a01 	mov.w	sl, #1
c0de690c:	4401      	add	r1, r0
c0de690e:	4638      	mov	r0, r7
c0de6910:	462a      	mov	r2, r5
c0de6912:	f8cd a000 	str.w	sl, [sp]
c0de6916:	f001 fc2a 	bl	c0de816e <bagl_hal_draw_rect>
c0de691a:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de691c:	b368      	cbz	r0, c0de697a <bagl_draw_circle_helper+0x14e>
c0de691e:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de6920:	42b0      	cmp	r0, r6
c0de6922:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6924:	eb06 0500 	add.w	r5, r6, r0
c0de6928:	d00a      	beq.n	c0de6940 <bagl_draw_circle_helper+0x114>
c0de692a:	9803      	ldr	r0, [sp, #12]
c0de692c:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de692e:	462a      	mov	r2, r5
c0de6930:	4408      	add	r0, r1
c0de6932:	1c83      	adds	r3, r0, #2
c0de6934:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de6936:	9916      	ldr	r1, [sp, #88]	@ 0x58
c0de6938:	f8cd a000 	str.w	sl, [sp]
c0de693c:	f001 fc17 	bl	c0de816e <bagl_hal_draw_rect>
c0de6940:	9806      	ldr	r0, [sp, #24]
c0de6942:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de6944:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6946:	4408      	add	r0, r1
c0de6948:	1c81      	adds	r1, r0, #2
c0de694a:	4638      	mov	r0, r7
c0de694c:	462a      	mov	r2, r5
c0de694e:	e010      	b.n	c0de6972 <bagl_draw_circle_helper+0x146>
c0de6950:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6952:	4633      	mov	r3, r6
c0de6954:	1842      	adds	r2, r0, r1
c0de6956:	9916      	ldr	r1, [sp, #88]	@ 0x58
c0de6958:	4638      	mov	r0, r7
c0de695a:	f8cd a000 	str.w	sl, [sp]
c0de695e:	f001 fc06 	bl	c0de816e <bagl_hal_draw_rect>
c0de6962:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de6964:	b148      	cbz	r0, c0de697a <bagl_draw_circle_helper+0x14e>
c0de6966:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6968:	9916      	ldr	r1, [sp, #88]	@ 0x58
c0de696a:	4430      	add	r0, r6
c0de696c:	1e42      	subs	r2, r0, #1
c0de696e:	4638      	mov	r0, r7
c0de6970:	4623      	mov	r3, r4
c0de6972:	f8cd a000 	str.w	sl, [sp]
c0de6976:	f001 fbfa 	bl	c0de816e <bagl_hal_draw_rect>
c0de697a:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de697c:	b930      	cbnz	r0, c0de698c <bagl_draw_circle_helper+0x160>
c0de697e:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de6980:	2800      	cmp	r0, #0
c0de6982:	d05d      	beq.n	c0de6a40 <bagl_draw_circle_helper+0x214>
c0de6984:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de6986:	bb30      	cbnz	r0, c0de69d6 <bagl_draw_circle_helper+0x1aa>
c0de6988:	e038      	b.n	c0de69fc <bagl_draw_circle_helper+0x1d0>
c0de698a:	bf00      	nop
c0de698c:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de698e:	2800      	cmp	r0, #0
c0de6990:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de6992:	eba0 0506 	sub.w	r5, r0, r6
c0de6996:	d025      	beq.n	c0de69e4 <bagl_draw_circle_helper+0x1b8>
c0de6998:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de699a:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de699c:	f8dd a01c 	ldr.w	sl, [sp, #28]
c0de69a0:	4408      	add	r0, r1
c0de69a2:	1c47      	adds	r7, r0, #1
c0de69a4:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de69a6:	f04f 0c01 	mov.w	ip, #1
c0de69aa:	eba6 030a 	sub.w	r3, r6, sl
c0de69ae:	4629      	mov	r1, r5
c0de69b0:	463a      	mov	r2, r7
c0de69b2:	f8cd c000 	str.w	ip, [sp]
c0de69b6:	f001 fbda 	bl	c0de816e <bagl_hal_draw_rect>
c0de69ba:	9808      	ldr	r0, [sp, #32]
c0de69bc:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de69be:	eba5 010a 	sub.w	r1, r5, sl
c0de69c2:	f04f 0a01 	mov.w	sl, #1
c0de69c6:	463a      	mov	r2, r7
c0de69c8:	9f08      	ldr	r7, [sp, #32]
c0de69ca:	f8cd a000 	str.w	sl, [sp]
c0de69ce:	f001 fbce 	bl	c0de816e <bagl_hal_draw_rect>
c0de69d2:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de69d4:	b3a0      	cbz	r0, c0de6a40 <bagl_draw_circle_helper+0x214>
c0de69d6:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de69d8:	42b0      	cmp	r0, r6
c0de69da:	d118      	bne.n	c0de6a0e <bagl_draw_circle_helper+0x1e2>
c0de69dc:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de69de:	1835      	adds	r5, r6, r0
c0de69e0:	e024      	b.n	c0de6a2c <bagl_draw_circle_helper+0x200>
c0de69e2:	bf00      	nop
c0de69e4:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de69e6:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de69e8:	4633      	mov	r3, r6
c0de69ea:	1842      	adds	r2, r0, r1
c0de69ec:	4638      	mov	r0, r7
c0de69ee:	4629      	mov	r1, r5
c0de69f0:	f8cd a000 	str.w	sl, [sp]
c0de69f4:	f001 fbbb 	bl	c0de816e <bagl_hal_draw_rect>
c0de69f8:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de69fa:	b308      	cbz	r0, c0de6a40 <bagl_draw_circle_helper+0x214>
c0de69fc:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de69fe:	4623      	mov	r3, r4
c0de6a00:	eb00 010b 	add.w	r1, r0, fp
c0de6a04:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6a06:	4430      	add	r0, r6
c0de6a08:	1e42      	subs	r2, r0, #1
c0de6a0a:	4638      	mov	r0, r7
c0de6a0c:	e014      	b.n	c0de6a38 <bagl_draw_circle_helper+0x20c>
c0de6a0e:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de6a10:	9a14      	ldr	r2, [sp, #80]	@ 0x50
c0de6a12:	eb00 010b 	add.w	r1, r0, fp
c0de6a16:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6a18:	f8cd a000 	str.w	sl, [sp]
c0de6a1c:	1835      	adds	r5, r6, r0
c0de6a1e:	9803      	ldr	r0, [sp, #12]
c0de6a20:	4410      	add	r0, r2
c0de6a22:	1c83      	adds	r3, r0, #2
c0de6a24:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de6a26:	462a      	mov	r2, r5
c0de6a28:	f001 fba1 	bl	c0de816e <bagl_hal_draw_rect>
c0de6a2c:	9804      	ldr	r0, [sp, #16]
c0de6a2e:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6a30:	eb00 010b 	add.w	r1, r0, fp
c0de6a34:	4638      	mov	r0, r7
c0de6a36:	462a      	mov	r2, r5
c0de6a38:	f8cd a000 	str.w	sl, [sp]
c0de6a3c:	f001 fb97 	bl	c0de816e <bagl_hal_draw_rect>
c0de6a40:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de6a42:	b928      	cbnz	r0, c0de6a50 <bagl_draw_circle_helper+0x224>
c0de6a44:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de6a46:	2800      	cmp	r0, #0
c0de6a48:	d055      	beq.n	c0de6af6 <bagl_draw_circle_helper+0x2ca>
c0de6a4a:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de6a4c:	bb28      	cbnz	r0, c0de6a9a <bagl_draw_circle_helper+0x26e>
c0de6a4e:	e049      	b.n	c0de6ae4 <bagl_draw_circle_helper+0x2b8>
c0de6a50:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de6a52:	f8dd a05c 	ldr.w	sl, [sp, #92]	@ 0x5c
c0de6a56:	44da      	add	sl, fp
c0de6a58:	b3c0      	cbz	r0, c0de6acc <bagl_draw_circle_helper+0x2a0>
c0de6a5a:	9807      	ldr	r0, [sp, #28]
c0de6a5c:	f8cd 8008 	str.w	r8, [sp, #8]
c0de6a60:	46a0      	mov	r8, r4
c0de6a62:	463c      	mov	r4, r7
c0de6a64:	9f16      	ldr	r7, [sp, #88]	@ 0x58
c0de6a66:	1a33      	subs	r3, r6, r0
c0de6a68:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de6a6a:	4639      	mov	r1, r7
c0de6a6c:	4652      	mov	r2, sl
c0de6a6e:	2501      	movs	r5, #1
c0de6a70:	9500      	str	r5, [sp, #0]
c0de6a72:	f001 fb7c 	bl	c0de816e <bagl_hal_draw_rect>
c0de6a76:	9905      	ldr	r1, [sp, #20]
c0de6a78:	19f0      	adds	r0, r6, r7
c0de6a7a:	4627      	mov	r7, r4
c0de6a7c:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6a7e:	4644      	mov	r4, r8
c0de6a80:	f8dd 8008 	ldr.w	r8, [sp, #8]
c0de6a84:	4401      	add	r1, r0
c0de6a86:	4638      	mov	r0, r7
c0de6a88:	4652      	mov	r2, sl
c0de6a8a:	f04f 0a01 	mov.w	sl, #1
c0de6a8e:	f8cd a000 	str.w	sl, [sp]
c0de6a92:	f001 fb6c 	bl	c0de816e <bagl_hal_draw_rect>
c0de6a96:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de6a98:	b368      	cbz	r0, c0de6af6 <bagl_draw_circle_helper+0x2ca>
c0de6a9a:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de6a9c:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de6a9e:	42b0      	cmp	r0, r6
c0de6aa0:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6aa2:	eba0 0506 	sub.w	r5, r0, r6
c0de6aa6:	d00a      	beq.n	c0de6abe <bagl_draw_circle_helper+0x292>
c0de6aa8:	9803      	ldr	r0, [sp, #12]
c0de6aaa:	462a      	mov	r2, r5
c0de6aac:	4408      	add	r0, r1
c0de6aae:	1c83      	adds	r3, r0, #2
c0de6ab0:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de6ab2:	9916      	ldr	r1, [sp, #88]	@ 0x58
c0de6ab4:	f8cd a000 	str.w	sl, [sp]
c0de6ab8:	f001 fb59 	bl	c0de816e <bagl_hal_draw_rect>
c0de6abc:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de6abe:	9806      	ldr	r0, [sp, #24]
c0de6ac0:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6ac2:	4408      	add	r0, r1
c0de6ac4:	1c81      	adds	r1, r0, #2
c0de6ac6:	4638      	mov	r0, r7
c0de6ac8:	462a      	mov	r2, r5
c0de6aca:	e010      	b.n	c0de6aee <bagl_draw_circle_helper+0x2c2>
c0de6acc:	9916      	ldr	r1, [sp, #88]	@ 0x58
c0de6ace:	4638      	mov	r0, r7
c0de6ad0:	4652      	mov	r2, sl
c0de6ad2:	4633      	mov	r3, r6
c0de6ad4:	f04f 0a01 	mov.w	sl, #1
c0de6ad8:	f8cd a000 	str.w	sl, [sp]
c0de6adc:	f001 fb47 	bl	c0de816e <bagl_hal_draw_rect>
c0de6ae0:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de6ae2:	b140      	cbz	r0, c0de6af6 <bagl_draw_circle_helper+0x2ca>
c0de6ae4:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6ae6:	9916      	ldr	r1, [sp, #88]	@ 0x58
c0de6ae8:	1b82      	subs	r2, r0, r6
c0de6aea:	4638      	mov	r0, r7
c0de6aec:	4623      	mov	r3, r4
c0de6aee:	f8cd a000 	str.w	sl, [sp]
c0de6af2:	f001 fb3c 	bl	c0de816e <bagl_hal_draw_rect>
c0de6af6:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de6af8:	b930      	cbnz	r0, c0de6b08 <bagl_draw_circle_helper+0x2dc>
c0de6afa:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de6afc:	2800      	cmp	r0, #0
c0de6afe:	d057      	beq.n	c0de6bb0 <bagl_draw_circle_helper+0x384>
c0de6b00:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de6b02:	bb18      	cbnz	r0, c0de6b4c <bagl_draw_circle_helper+0x320>
c0de6b04:	e033      	b.n	c0de6b6e <bagl_draw_circle_helper+0x342>
c0de6b06:	bf00      	nop
c0de6b08:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de6b0a:	1b87      	subs	r7, r0, r6
c0de6b0c:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de6b0e:	2800      	cmp	r0, #0
c0de6b10:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6b12:	eb00 050b 	add.w	r5, r0, fp
c0de6b16:	d01f      	beq.n	c0de6b58 <bagl_draw_circle_helper+0x32c>
c0de6b18:	46a2      	mov	sl, r4
c0de6b1a:	9c07      	ldr	r4, [sp, #28]
c0de6b1c:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de6b1e:	f04f 0c01 	mov.w	ip, #1
c0de6b22:	1b33      	subs	r3, r6, r4
c0de6b24:	4639      	mov	r1, r7
c0de6b26:	462a      	mov	r2, r5
c0de6b28:	f8cd c000 	str.w	ip, [sp]
c0de6b2c:	f001 fb1f 	bl	c0de816e <bagl_hal_draw_rect>
c0de6b30:	1b39      	subs	r1, r7, r4
c0de6b32:	9f08      	ldr	r7, [sp, #32]
c0de6b34:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6b36:	4654      	mov	r4, sl
c0de6b38:	f04f 0a01 	mov.w	sl, #1
c0de6b3c:	4638      	mov	r0, r7
c0de6b3e:	462a      	mov	r2, r5
c0de6b40:	f8cd a000 	str.w	sl, [sp]
c0de6b44:	f001 fb13 	bl	c0de816e <bagl_hal_draw_rect>
c0de6b48:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de6b4a:	b388      	cbz	r0, c0de6bb0 <bagl_draw_circle_helper+0x384>
c0de6b4c:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de6b4e:	42b0      	cmp	r0, r6
c0de6b50:	d115      	bne.n	c0de6b7e <bagl_draw_circle_helper+0x352>
c0de6b52:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6b54:	1b85      	subs	r5, r0, r6
c0de6b56:	e021      	b.n	c0de6b9c <bagl_draw_circle_helper+0x370>
c0de6b58:	9808      	ldr	r0, [sp, #32]
c0de6b5a:	4639      	mov	r1, r7
c0de6b5c:	462a      	mov	r2, r5
c0de6b5e:	4633      	mov	r3, r6
c0de6b60:	4607      	mov	r7, r0
c0de6b62:	f8cd a000 	str.w	sl, [sp]
c0de6b66:	f001 fb02 	bl	c0de816e <bagl_hal_draw_rect>
c0de6b6a:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de6b6c:	b300      	cbz	r0, c0de6bb0 <bagl_draw_circle_helper+0x384>
c0de6b6e:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de6b70:	4623      	mov	r3, r4
c0de6b72:	eb00 010b 	add.w	r1, r0, fp
c0de6b76:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6b78:	1b82      	subs	r2, r0, r6
c0de6b7a:	4638      	mov	r0, r7
c0de6b7c:	e014      	b.n	c0de6ba8 <bagl_draw_circle_helper+0x37c>
c0de6b7e:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de6b80:	9a14      	ldr	r2, [sp, #80]	@ 0x50
c0de6b82:	eb00 010b 	add.w	r1, r0, fp
c0de6b86:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6b88:	f8cd a000 	str.w	sl, [sp]
c0de6b8c:	1b85      	subs	r5, r0, r6
c0de6b8e:	9803      	ldr	r0, [sp, #12]
c0de6b90:	4410      	add	r0, r2
c0de6b92:	1c83      	adds	r3, r0, #2
c0de6b94:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de6b96:	462a      	mov	r2, r5
c0de6b98:	f001 fae9 	bl	c0de816e <bagl_hal_draw_rect>
c0de6b9c:	9804      	ldr	r0, [sp, #16]
c0de6b9e:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6ba0:	eb00 010b 	add.w	r1, r0, fp
c0de6ba4:	4638      	mov	r0, r7
c0de6ba6:	462a      	mov	r2, r5
c0de6ba8:	f8cd a000 	str.w	sl, [sp]
c0de6bac:	f001 fadf 	bl	c0de816e <bagl_hal_draw_rect>
c0de6bb0:	f108 0801 	add.w	r8, r8, #1
c0de6bb4:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de6bb6:	1e70      	subs	r0, r6, #1
c0de6bb8:	4641      	mov	r1, r8
c0de6bba:	2a01      	cmp	r2, #1
c0de6bbc:	bfac      	ite	ge
c0de6bbe:	1a09      	subge	r1, r1, r0
c0de6bc0:	4630      	movlt	r0, r6
c0de6bc2:	eb02 0141 	add.w	r1, r2, r1, lsl #1
c0de6bc6:	3101      	adds	r1, #1
c0de6bc8:	9111      	str	r1, [sp, #68]	@ 0x44
c0de6bca:	f1ab 0b01 	sub.w	fp, fp, #1
c0de6bce:	4284      	cmp	r4, r0
c0de6bd0:	4621      	mov	r1, r4
c0de6bd2:	9613      	str	r6, [sp, #76]	@ 0x4c
c0de6bd4:	4606      	mov	r6, r0
c0de6bd6:	f6ff ae75 	blt.w	c0de68c4 <bagl_draw_circle_helper+0x98>
c0de6bda:	b018      	add	sp, #96	@ 0x60
c0de6bdc:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de6be0 <bagl_draw_glyph>:
c0de6be0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6be4:	b088      	sub	sp, #32
c0de6be6:	460c      	mov	r4, r1
c0de6be8:	6889      	ldr	r1, [r1, #8]
c0de6bea:	2902      	cmp	r1, #2
c0de6bec:	d826      	bhi.n	c0de6c3c <bagl_draw_glyph+0x5c>
c0de6bee:	f9b0 2002 	ldrsh.w	r2, [r0, #2]
c0de6bf2:	f9b0 0004 	ldrsh.w	r0, [r0, #4]
c0de6bf6:	9207      	str	r2, [sp, #28]
c0de6bf8:	9006      	str	r0, [sp, #24]
c0de6bfa:	68e0      	ldr	r0, [r4, #12]
c0de6bfc:	2201      	movs	r2, #1
c0de6bfe:	e9d4 b700 	ldrd	fp, r7, [r4]
c0de6c02:	fa02 f801 	lsl.w	r8, r2, r1
c0de6c06:	f001 f97f 	bl	c0de7f08 <pic>
c0de6c0a:	6921      	ldr	r1, [r4, #16]
c0de6c0c:	f8d4 a008 	ldr.w	sl, [r4, #8]
c0de6c10:	4605      	mov	r5, r0
c0de6c12:	4608      	mov	r0, r1
c0de6c14:	f001 f978 	bl	c0de7f08 <pic>
c0de6c18:	4606      	mov	r6, r0
c0de6c1a:	68a1      	ldr	r1, [r4, #8]
c0de6c1c:	e9d4 0200 	ldrd	r0, r2, [r4]
c0de6c20:	463b      	mov	r3, r7
c0de6c22:	4348      	muls	r0, r1
c0de6c24:	4350      	muls	r0, r2
c0de6c26:	9004      	str	r0, [sp, #16]
c0de6c28:	e9dd 1006 	ldrd	r1, r0, [sp, #24]
c0de6c2c:	465a      	mov	r2, fp
c0de6c2e:	e9cd 8500 	strd	r8, r5, [sp]
c0de6c32:	f8cd a008 	str.w	sl, [sp, #8]
c0de6c36:	9603      	str	r6, [sp, #12]
c0de6c38:	f001 fa80 	bl	c0de813c <bagl_hal_draw_bitmap_within_rect>
c0de6c3c:	b008      	add	sp, #32
c0de6c3e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de6c42 <ux_flow_is_first>:
c0de6c42:	f240 41d0 	movw	r1, #1232	@ 0x4d0
c0de6c46:	f2c0 0100 	movt	r1, #0
c0de6c4a:	f819 0001 	ldrb.w	r0, [r9, r1]
c0de6c4e:	2801      	cmp	r0, #1
c0de6c50:	d823      	bhi.n	c0de6c9a <ux_flow_is_first+0x58>
c0de6c52:	3801      	subs	r0, #1
c0de6c54:	eb09 0201 	add.w	r2, r9, r1
c0de6c58:	eb00 0340 	add.w	r3, r0, r0, lsl #1
c0de6c5c:	eb02 0083 	add.w	r0, r2, r3, lsl #2
c0de6c60:	8c80      	ldrh	r0, [r0, #36]	@ 0x24
c0de6c62:	b1d0      	cbz	r0, c0de6c9a <ux_flow_is_first+0x58>
c0de6c64:	eb09 0201 	add.w	r2, r9, r1
c0de6c68:	eb02 0283 	add.w	r2, r2, r3, lsl #2
c0de6c6c:	69d2      	ldr	r2, [r2, #28]
c0de6c6e:	b1a2      	cbz	r2, c0de6c9a <ux_flow_is_first+0x58>
c0de6c70:	4449      	add	r1, r9
c0de6c72:	eb01 0183 	add.w	r1, r1, r3, lsl #2
c0de6c76:	8c09      	ldrh	r1, [r1, #32]
c0de6c78:	b929      	cbnz	r1, c0de6c86 <ux_flow_is_first+0x44>
c0de6c7a:	eb02 0380 	add.w	r3, r2, r0, lsl #2
c0de6c7e:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de6c82:	3303      	adds	r3, #3
c0de6c84:	d109      	bne.n	c0de6c9a <ux_flow_is_first+0x58>
c0de6c86:	4281      	cmp	r1, r0
c0de6c88:	d205      	bcs.n	c0de6c96 <ux_flow_is_first+0x54>
c0de6c8a:	eb02 0081 	add.w	r0, r2, r1, lsl #2
c0de6c8e:	f850 0c04 	ldr.w	r0, [r0, #-4]
c0de6c92:	3002      	adds	r0, #2
c0de6c94:	d001      	beq.n	c0de6c9a <ux_flow_is_first+0x58>
c0de6c96:	2000      	movs	r0, #0
c0de6c98:	4770      	bx	lr
c0de6c9a:	2001      	movs	r0, #1
c0de6c9c:	4770      	bx	lr

c0de6c9e <ux_flow_is_last>:
c0de6c9e:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de6ca2:	f2c0 0000 	movt	r0, #0
c0de6ca6:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de6caa:	2901      	cmp	r1, #1
c0de6cac:	d81f      	bhi.n	c0de6cee <ux_flow_is_last+0x50>
c0de6cae:	3901      	subs	r1, #1
c0de6cb0:	eb09 0200 	add.w	r2, r9, r0
c0de6cb4:	eb01 0341 	add.w	r3, r1, r1, lsl #1
c0de6cb8:	eb02 0183 	add.w	r1, r2, r3, lsl #2
c0de6cbc:	8c89      	ldrh	r1, [r1, #36]	@ 0x24
c0de6cbe:	b1b1      	cbz	r1, c0de6cee <ux_flow_is_last+0x50>
c0de6cc0:	eb09 0200 	add.w	r2, r9, r0
c0de6cc4:	eb02 0283 	add.w	r2, r2, r3, lsl #2
c0de6cc8:	69d2      	ldr	r2, [r2, #28]
c0de6cca:	b182      	cbz	r2, c0de6cee <ux_flow_is_last+0x50>
c0de6ccc:	4448      	add	r0, r9
c0de6cce:	eb00 0083 	add.w	r0, r0, r3, lsl #2
c0de6cd2:	8c00      	ldrh	r0, [r0, #32]
c0de6cd4:	1e4b      	subs	r3, r1, #1
c0de6cd6:	4283      	cmp	r3, r0
c0de6cd8:	d909      	bls.n	c0de6cee <ux_flow_is_last+0x50>
c0de6cda:	3902      	subs	r1, #2
c0de6cdc:	4281      	cmp	r1, r0
c0de6cde:	d904      	bls.n	c0de6cea <ux_flow_is_last+0x4c>
c0de6ce0:	eb02 0080 	add.w	r0, r2, r0, lsl #2
c0de6ce4:	6840      	ldr	r0, [r0, #4]
c0de6ce6:	3002      	adds	r0, #2
c0de6ce8:	d001      	beq.n	c0de6cee <ux_flow_is_last+0x50>
c0de6cea:	2000      	movs	r0, #0
c0de6cec:	4770      	bx	lr
c0de6cee:	2001      	movs	r0, #1
c0de6cf0:	4770      	bx	lr

c0de6cf2 <ux_flow_direction>:
c0de6cf2:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de6cf6:	f2c0 0000 	movt	r0, #0
c0de6cfa:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de6cfe:	b169      	cbz	r1, c0de6d1c <ux_flow_direction+0x2a>
c0de6d00:	eb01 0141 	add.w	r1, r1, r1, lsl #1
c0de6d04:	4448      	add	r0, r9
c0de6d06:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de6d0a:	8a81      	ldrh	r1, [r0, #20]
c0de6d0c:	8ac0      	ldrh	r0, [r0, #22]
c0de6d0e:	4281      	cmp	r1, r0
c0de6d10:	d901      	bls.n	c0de6d16 <ux_flow_direction+0x24>
c0de6d12:	2001      	movs	r0, #1
c0de6d14:	e003      	b.n	c0de6d1e <ux_flow_direction+0x2c>
c0de6d16:	d201      	bcs.n	c0de6d1c <ux_flow_direction+0x2a>
c0de6d18:	20ff      	movs	r0, #255	@ 0xff
c0de6d1a:	e000      	b.n	c0de6d1e <ux_flow_direction+0x2c>
c0de6d1c:	2000      	movs	r0, #0
c0de6d1e:	b240      	sxtb	r0, r0
c0de6d20:	4770      	bx	lr

c0de6d22 <ux_flow_get_current>:
c0de6d22:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de6d26:	f2c0 0000 	movt	r0, #0
c0de6d2a:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de6d2e:	2901      	cmp	r1, #1
c0de6d30:	d81b      	bhi.n	c0de6d6a <ux_flow_get_current+0x48>
c0de6d32:	3901      	subs	r1, #1
c0de6d34:	eb09 0200 	add.w	r2, r9, r0
c0de6d38:	eb01 0141 	add.w	r1, r1, r1, lsl #1
c0de6d3c:	eb02 0281 	add.w	r2, r2, r1, lsl #2
c0de6d40:	8c92      	ldrh	r2, [r2, #36]	@ 0x24
c0de6d42:	b192      	cbz	r2, c0de6d6a <ux_flow_get_current+0x48>
c0de6d44:	eb09 0300 	add.w	r3, r9, r0
c0de6d48:	eb03 0381 	add.w	r3, r3, r1, lsl #2
c0de6d4c:	69db      	ldr	r3, [r3, #28]
c0de6d4e:	b163      	cbz	r3, c0de6d6a <ux_flow_get_current+0x48>
c0de6d50:	4448      	add	r0, r9
c0de6d52:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de6d56:	8c00      	ldrh	r0, [r0, #32]
c0de6d58:	4290      	cmp	r0, r2
c0de6d5a:	d206      	bcs.n	c0de6d6a <ux_flow_get_current+0x48>
c0de6d5c:	f853 0020 	ldr.w	r0, [r3, r0, lsl #2]
c0de6d60:	f110 0f04 	cmn.w	r0, #4
c0de6d64:	bf98      	it	ls
c0de6d66:	f001 b8cf 	bls.w	c0de7f08 <pic>
c0de6d6a:	2000      	movs	r0, #0
c0de6d6c:	4770      	bx	lr

c0de6d6e <ux_flow_next_internal>:
c0de6d6e:	b570      	push	{r4, r5, r6, lr}
c0de6d70:	f240 42d0 	movw	r2, #1232	@ 0x4d0
c0de6d74:	f2c0 0200 	movt	r2, #0
c0de6d78:	f819 1002 	ldrb.w	r1, [r9, r2]
c0de6d7c:	f1b1 0e01 	subs.w	lr, r1, #1
c0de6d80:	d83a      	bhi.n	c0de6df8 <ux_flow_next_internal+0x8a>
c0de6d82:	eb09 0102 	add.w	r1, r9, r2
c0de6d86:	eb0e 034e 	add.w	r3, lr, lr, lsl #1
c0de6d8a:	eb01 0183 	add.w	r1, r1, r3, lsl #2
c0de6d8e:	8c89      	ldrh	r1, [r1, #36]	@ 0x24
c0de6d90:	b391      	cbz	r1, c0de6df8 <ux_flow_next_internal+0x8a>
c0de6d92:	eb09 0502 	add.w	r5, r9, r2
c0de6d96:	eb05 0583 	add.w	r5, r5, r3, lsl #2
c0de6d9a:	69ed      	ldr	r5, [r5, #28]
c0de6d9c:	b365      	cbz	r5, c0de6df8 <ux_flow_next_internal+0x8a>
c0de6d9e:	2902      	cmp	r1, #2
c0de6da0:	d32a      	bcc.n	c0de6df8 <ux_flow_next_internal+0x8a>
c0de6da2:	eb09 0402 	add.w	r4, r9, r2
c0de6da6:	eb04 0c83 	add.w	ip, r4, r3, lsl #2
c0de6daa:	f83c 4f20 	ldrh.w	r4, [ip, #32]!
c0de6dae:	1e4e      	subs	r6, r1, #1
c0de6db0:	42a6      	cmp	r6, r4
c0de6db2:	d921      	bls.n	c0de6df8 <ux_flow_next_internal+0x8a>
c0de6db4:	3902      	subs	r1, #2
c0de6db6:	42a1      	cmp	r1, r4
c0de6db8:	d310      	bcc.n	c0de6ddc <ux_flow_next_internal+0x6e>
c0de6dba:	eb05 0184 	add.w	r1, r5, r4, lsl #2
c0de6dbe:	6849      	ldr	r1, [r1, #4]
c0de6dc0:	1c8d      	adds	r5, r1, #2
c0de6dc2:	bf08      	it	eq
c0de6dc4:	bd70      	popeq	{r4, r5, r6, pc}
c0de6dc6:	3103      	adds	r1, #3
c0de6dc8:	d108      	bne.n	c0de6ddc <ux_flow_next_internal+0x6e>
c0de6dca:	eb09 0102 	add.w	r1, r9, r2
c0de6dce:	2000      	movs	r0, #0
c0de6dd0:	eb01 0183 	add.w	r1, r1, r3, lsl #2
c0de6dd4:	f8ac 0000 	strh.w	r0, [ip]
c0de6dd8:	8448      	strh	r0, [r1, #34]	@ 0x22
c0de6dda:	e008      	b.n	c0de6dee <ux_flow_next_internal+0x80>
c0de6ddc:	eb09 0102 	add.w	r1, r9, r2
c0de6de0:	eb01 0183 	add.w	r1, r1, r3, lsl #2
c0de6de4:	844c      	strh	r4, [r1, #34]	@ 0x22
c0de6de6:	1c61      	adds	r1, r4, #1
c0de6de8:	f8ac 1000 	strh.w	r1, [ip]
c0de6dec:	b120      	cbz	r0, c0de6df8 <ux_flow_next_internal+0x8a>
c0de6dee:	4670      	mov	r0, lr
c0de6df0:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de6df4:	f000 b849 	b.w	c0de6e8a <ux_flow_engine_init_step>
c0de6df8:	bd70      	pop	{r4, r5, r6, pc}

c0de6dfa <ux_flow_next>:
c0de6dfa:	2001      	movs	r0, #1
c0de6dfc:	f7ff bfb7 	b.w	c0de6d6e <ux_flow_next_internal>

c0de6e00 <ux_flow_prev>:
c0de6e00:	b510      	push	{r4, lr}
c0de6e02:	f240 41d0 	movw	r1, #1232	@ 0x4d0
c0de6e06:	f2c0 0100 	movt	r1, #0
c0de6e0a:	f819 0001 	ldrb.w	r0, [r9, r1]
c0de6e0e:	3801      	subs	r0, #1
c0de6e10:	d812      	bhi.n	c0de6e38 <ux_flow_prev+0x38>
c0de6e12:	eb09 0301 	add.w	r3, r9, r1
c0de6e16:	eb00 0240 	add.w	r2, r0, r0, lsl #1
c0de6e1a:	eb03 0382 	add.w	r3, r3, r2, lsl #2
c0de6e1e:	8c9b      	ldrh	r3, [r3, #36]	@ 0x24
c0de6e20:	b153      	cbz	r3, c0de6e38 <ux_flow_prev+0x38>
c0de6e22:	eb09 0401 	add.w	r4, r9, r1
c0de6e26:	eb04 0482 	add.w	r4, r4, r2, lsl #2
c0de6e2a:	f8d4 e01c 	ldr.w	lr, [r4, #28]
c0de6e2e:	f1be 0f00 	cmp.w	lr, #0
c0de6e32:	d001      	beq.n	c0de6e38 <ux_flow_prev+0x38>
c0de6e34:	2b02      	cmp	r3, #2
c0de6e36:	d200      	bcs.n	c0de6e3a <ux_flow_prev+0x3a>
c0de6e38:	bd10      	pop	{r4, pc}
c0de6e3a:	eb09 0401 	add.w	r4, r9, r1
c0de6e3e:	eb04 0c82 	add.w	ip, r4, r2, lsl #2
c0de6e42:	f83c 4f20 	ldrh.w	r4, [ip, #32]!
c0de6e46:	b18c      	cbz	r4, c0de6e6c <ux_flow_prev+0x6c>
c0de6e48:	eb0e 0384 	add.w	r3, lr, r4, lsl #2
c0de6e4c:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de6e50:	3302      	adds	r3, #2
c0de6e52:	bf08      	it	eq
c0de6e54:	bd10      	popeq	{r4, pc}
c0de6e56:	4449      	add	r1, r9
c0de6e58:	eb01 0182 	add.w	r1, r1, r2, lsl #2
c0de6e5c:	844c      	strh	r4, [r1, #34]	@ 0x22
c0de6e5e:	1e61      	subs	r1, r4, #1
c0de6e60:	f8ac 1000 	strh.w	r1, [ip]
c0de6e64:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de6e68:	f000 b80f 	b.w	c0de6e8a <ux_flow_engine_init_step>
c0de6e6c:	eb0e 0483 	add.w	r4, lr, r3, lsl #2
c0de6e70:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de6e74:	3403      	adds	r4, #3
c0de6e76:	d1df      	bne.n	c0de6e38 <ux_flow_prev+0x38>
c0de6e78:	4449      	add	r1, r9
c0de6e7a:	1e9c      	subs	r4, r3, #2
c0de6e7c:	3b01      	subs	r3, #1
c0de6e7e:	eb01 0182 	add.w	r1, r1, r2, lsl #2
c0de6e82:	f8ac 4000 	strh.w	r4, [ip]
c0de6e86:	844b      	strh	r3, [r1, #34]	@ 0x22
c0de6e88:	e7ec      	b.n	c0de6e64 <ux_flow_prev+0x64>

c0de6e8a <ux_flow_engine_init_step>:
c0de6e8a:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de6e8c:	b081      	sub	sp, #4
c0de6e8e:	4604      	mov	r4, r0
c0de6e90:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de6e94:	f2c0 0000 	movt	r0, #0
c0de6e98:	4448      	add	r0, r9
c0de6e9a:	eb04 0144 	add.w	r1, r4, r4, lsl #1
c0de6e9e:	eb00 0581 	add.w	r5, r0, r1, lsl #2
c0de6ea2:	f855 0f1c 	ldr.w	r0, [r5, #28]!
c0de6ea6:	462e      	mov	r6, r5
c0de6ea8:	f836 1f04 	ldrh.w	r1, [r6, #4]!
c0de6eac:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de6eb0:	f110 0f04 	cmn.w	r0, #4
c0de6eb4:	bf84      	itt	hi
c0de6eb6:	b001      	addhi	sp, #4
c0de6eb8:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de6eba:	f001 f825 	bl	c0de7f08 <pic>
c0de6ebe:	6829      	ldr	r1, [r5, #0]
c0de6ec0:	8832      	ldrh	r2, [r6, #0]
c0de6ec2:	6807      	ldr	r7, [r0, #0]
c0de6ec4:	f851 0022 	ldr.w	r0, [r1, r2, lsl #2]
c0de6ec8:	f001 f81e 	bl	c0de7f08 <pic>
c0de6ecc:	b147      	cbz	r7, c0de6ee0 <ux_flow_engine_init_step+0x56>
c0de6ece:	6800      	ldr	r0, [r0, #0]
c0de6ed0:	f001 f81a 	bl	c0de7f08 <pic>
c0de6ed4:	4601      	mov	r1, r0
c0de6ed6:	4620      	mov	r0, r4
c0de6ed8:	b001      	add	sp, #4
c0de6eda:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de6ede:	4708      	bx	r1
c0de6ee0:	6880      	ldr	r0, [r0, #8]
c0de6ee2:	f001 f811 	bl	c0de7f08 <pic>
c0de6ee6:	6829      	ldr	r1, [r5, #0]
c0de6ee8:	8832      	ldrh	r2, [r6, #0]
c0de6eea:	4605      	mov	r5, r0
c0de6eec:	f851 1022 	ldr.w	r1, [r1, r2, lsl #2]
c0de6ef0:	4608      	mov	r0, r1
c0de6ef2:	f001 f809 	bl	c0de7f08 <pic>
c0de6ef6:	6840      	ldr	r0, [r0, #4]
c0de6ef8:	f001 f806 	bl	c0de7f08 <pic>
c0de6efc:	4602      	mov	r2, r0
c0de6efe:	4620      	mov	r0, r4
c0de6f00:	4629      	mov	r1, r5
c0de6f02:	b001      	add	sp, #4
c0de6f04:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de6f08:	f000 b874 	b.w	c0de6ff4 <ux_flow_init>

c0de6f0c <ux_flow_validate>:
c0de6f0c:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de6f10:	b081      	sub	sp, #4
c0de6f12:	f240 45d0 	movw	r5, #1232	@ 0x4d0
c0de6f16:	f2c0 0500 	movt	r5, #0
c0de6f1a:	f819 0005 	ldrb.w	r0, [r9, r5]
c0de6f1e:	f1b0 0a01 	subs.w	sl, r0, #1
c0de6f22:	d856      	bhi.n	c0de6fd2 <ux_flow_validate+0xc6>
c0de6f24:	eb09 0005 	add.w	r0, r9, r5
c0de6f28:	eb0a 064a 	add.w	r6, sl, sl, lsl #1
c0de6f2c:	eb00 0486 	add.w	r4, r0, r6, lsl #2
c0de6f30:	f834 0f24 	ldrh.w	r0, [r4, #36]!
c0de6f34:	2800      	cmp	r0, #0
c0de6f36:	d04c      	beq.n	c0de6fd2 <ux_flow_validate+0xc6>
c0de6f38:	eb09 0105 	add.w	r1, r9, r5
c0de6f3c:	eb01 0786 	add.w	r7, r1, r6, lsl #2
c0de6f40:	f857 1f1c 	ldr.w	r1, [r7, #28]!
c0de6f44:	2900      	cmp	r1, #0
c0de6f46:	d044      	beq.n	c0de6fd2 <ux_flow_validate+0xc6>
c0de6f48:	eb09 0205 	add.w	r2, r9, r5
c0de6f4c:	eb02 0886 	add.w	r8, r2, r6, lsl #2
c0de6f50:	f838 2f20 	ldrh.w	r2, [r8, #32]!
c0de6f54:	4282      	cmp	r2, r0
c0de6f56:	d23c      	bcs.n	c0de6fd2 <ux_flow_validate+0xc6>
c0de6f58:	f851 0022 	ldr.w	r0, [r1, r2, lsl #2]
c0de6f5c:	f000 ffd4 	bl	c0de7f08 <pic>
c0de6f60:	6880      	ldr	r0, [r0, #8]
c0de6f62:	b188      	cbz	r0, c0de6f88 <ux_flow_validate+0x7c>
c0de6f64:	6838      	ldr	r0, [r7, #0]
c0de6f66:	f8b8 1000 	ldrh.w	r1, [r8]
c0de6f6a:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de6f6e:	f000 ffcb 	bl	c0de7f08 <pic>
c0de6f72:	6880      	ldr	r0, [r0, #8]
c0de6f74:	f000 ffc8 	bl	c0de7f08 <pic>
c0de6f78:	4601      	mov	r1, r0
c0de6f7a:	4650      	mov	r0, sl
c0de6f7c:	2200      	movs	r2, #0
c0de6f7e:	b001      	add	sp, #4
c0de6f80:	e8bd 45f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de6f84:	f000 b836 	b.w	c0de6ff4 <ux_flow_init>
c0de6f88:	8820      	ldrh	r0, [r4, #0]
c0de6f8a:	b310      	cbz	r0, c0de6fd2 <ux_flow_validate+0xc6>
c0de6f8c:	f8b8 2000 	ldrh.w	r2, [r8]
c0de6f90:	3802      	subs	r0, #2
c0de6f92:	4290      	cmp	r0, r2
c0de6f94:	db1d      	blt.n	c0de6fd2 <ux_flow_validate+0xc6>
c0de6f96:	6839      	ldr	r1, [r7, #0]
c0de6f98:	eb01 0382 	add.w	r3, r1, r2, lsl #2
c0de6f9c:	685b      	ldr	r3, [r3, #4]
c0de6f9e:	1cdf      	adds	r7, r3, #3
c0de6fa0:	d01a      	beq.n	c0de6fd8 <ux_flow_validate+0xcc>
c0de6fa2:	3302      	adds	r3, #2
c0de6fa4:	d115      	bne.n	c0de6fd2 <ux_flow_validate+0xc6>
c0de6fa6:	4613      	mov	r3, r2
c0de6fa8:	eb01 0282 	add.w	r2, r1, r2, lsl #2
c0de6fac:	6852      	ldr	r2, [r2, #4]
c0de6fae:	3202      	adds	r2, #2
c0de6fb0:	d105      	bne.n	c0de6fbe <ux_flow_validate+0xb2>
c0de6fb2:	3301      	adds	r3, #1
c0de6fb4:	b29a      	uxth	r2, r3
c0de6fb6:	4290      	cmp	r0, r2
c0de6fb8:	f8a8 3000 	strh.w	r3, [r8]
c0de6fbc:	daf4      	bge.n	c0de6fa8 <ux_flow_validate+0x9c>
c0de6fbe:	eb09 0005 	add.w	r0, r9, r5
c0de6fc2:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0de6fc6:	8443      	strh	r3, [r0, #34]	@ 0x22
c0de6fc8:	1c59      	adds	r1, r3, #1
c0de6fca:	4650      	mov	r0, sl
c0de6fcc:	f8a8 1000 	strh.w	r1, [r8]
c0de6fd0:	e00b      	b.n	c0de6fea <ux_flow_validate+0xde>
c0de6fd2:	b001      	add	sp, #4
c0de6fd4:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de6fd8:	eb09 0005 	add.w	r0, r9, r5
c0de6fdc:	2100      	movs	r1, #0
c0de6fde:	eb00 0286 	add.w	r2, r0, r6, lsl #2
c0de6fe2:	f8a8 1000 	strh.w	r1, [r8]
c0de6fe6:	4650      	mov	r0, sl
c0de6fe8:	8451      	strh	r1, [r2, #34]	@ 0x22
c0de6fea:	b001      	add	sp, #4
c0de6fec:	e8bd 45f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de6ff0:	f7ff bf4b 	b.w	c0de6e8a <ux_flow_engine_init_step>

c0de6ff4 <ux_flow_init>:
c0de6ff4:	b570      	push	{r4, r5, r6, lr}
c0de6ff6:	b100      	cbz	r0, c0de6ffa <ux_flow_init+0x6>
c0de6ff8:	bd70      	pop	{r4, r5, r6, pc}
c0de6ffa:	f240 46d0 	movw	r6, #1232	@ 0x4d0
c0de6ffe:	f2c0 0600 	movt	r6, #0
c0de7002:	eb09 0006 	add.w	r0, r9, r6
c0de7006:	460d      	mov	r5, r1
c0de7008:	3004      	adds	r0, #4
c0de700a:	2122      	movs	r1, #34	@ 0x22
c0de700c:	4614      	mov	r4, r2
c0de700e:	f001 fa4d 	bl	c0de84ac <__aeabi_memclr>
c0de7012:	2d00      	cmp	r5, #0
c0de7014:	d0f0      	beq.n	c0de6ff8 <ux_flow_init+0x4>
c0de7016:	4628      	mov	r0, r5
c0de7018:	f000 ff76 	bl	c0de7f08 <pic>
c0de701c:	eb09 0206 	add.w	r2, r9, r6
c0de7020:	8c91      	ldrh	r1, [r2, #36]	@ 0x24
c0de7022:	61d0      	str	r0, [r2, #28]
c0de7024:	f850 2021 	ldr.w	r2, [r0, r1, lsl #2]
c0de7028:	3201      	adds	r2, #1
c0de702a:	d008      	beq.n	c0de703e <ux_flow_init+0x4a>
c0de702c:	3101      	adds	r1, #1
c0de702e:	b28a      	uxth	r2, r1
c0de7030:	f850 2022 	ldr.w	r2, [r0, r2, lsl #2]
c0de7034:	3201      	adds	r2, #1
c0de7036:	d1f9      	bne.n	c0de702c <ux_flow_init+0x38>
c0de7038:	eb09 0006 	add.w	r0, r9, r6
c0de703c:	8481      	strh	r1, [r0, #36]	@ 0x24
c0de703e:	b1e4      	cbz	r4, c0de707a <ux_flow_init+0x86>
c0de7040:	4620      	mov	r0, r4
c0de7042:	f000 ff61 	bl	c0de7f08 <pic>
c0de7046:	eb09 0106 	add.w	r1, r9, r6
c0de704a:	69ca      	ldr	r2, [r1, #28]
c0de704c:	8c09      	ldrh	r1, [r1, #32]
c0de704e:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de7052:	1c4a      	adds	r2, r1, #1
c0de7054:	d011      	beq.n	c0de707a <ux_flow_init+0x86>
c0de7056:	4604      	mov	r4, r0
c0de7058:	4608      	mov	r0, r1
c0de705a:	f000 ff55 	bl	c0de7f08 <pic>
c0de705e:	42a0      	cmp	r0, r4
c0de7060:	d00b      	beq.n	c0de707a <ux_flow_init+0x86>
c0de7062:	eb09 0006 	add.w	r0, r9, r6
c0de7066:	8c02      	ldrh	r2, [r0, #32]
c0de7068:	69c1      	ldr	r1, [r0, #28]
c0de706a:	1c53      	adds	r3, r2, #1
c0de706c:	b29d      	uxth	r5, r3
c0de706e:	f851 1025 	ldr.w	r1, [r1, r5, lsl #2]
c0de7072:	8442      	strh	r2, [r0, #34]	@ 0x22
c0de7074:	1c4a      	adds	r2, r1, #1
c0de7076:	8403      	strh	r3, [r0, #32]
c0de7078:	d1ee      	bne.n	c0de7058 <ux_flow_init+0x64>
c0de707a:	2000      	movs	r0, #0
c0de707c:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de7080:	f7ff bf03 	b.w	c0de6e8a <ux_flow_engine_init_step>

c0de7084 <ux_flow_button_callback>:
c0de7084:	b580      	push	{r7, lr}
c0de7086:	2103      	movs	r1, #3
c0de7088:	f2c8 0100 	movt	r1, #32768	@ 0x8000
c0de708c:	4288      	cmp	r0, r1
c0de708e:	d00c      	beq.n	c0de70aa <ux_flow_button_callback+0x26>
c0de7090:	2102      	movs	r1, #2
c0de7092:	f2c8 0100 	movt	r1, #32768	@ 0x8000
c0de7096:	4288      	cmp	r0, r1
c0de7098:	d00a      	beq.n	c0de70b0 <ux_flow_button_callback+0x2c>
c0de709a:	2101      	movs	r1, #1
c0de709c:	f2c8 0100 	movt	r1, #32768	@ 0x8000
c0de70a0:	4288      	cmp	r0, r1
c0de70a2:	d108      	bne.n	c0de70b6 <ux_flow_button_callback+0x32>
c0de70a4:	f7ff feac 	bl	c0de6e00 <ux_flow_prev>
c0de70a8:	e005      	b.n	c0de70b6 <ux_flow_button_callback+0x32>
c0de70aa:	f7ff ff2f 	bl	c0de6f0c <ux_flow_validate>
c0de70ae:	e002      	b.n	c0de70b6 <ux_flow_button_callback+0x32>
c0de70b0:	2001      	movs	r0, #1
c0de70b2:	f7ff fe5c 	bl	c0de6d6e <ux_flow_next_internal>
c0de70b6:	2000      	movs	r0, #0
c0de70b8:	bd80      	pop	{r7, pc}

c0de70ba <ux_stack_get_step_params>:
c0de70ba:	b510      	push	{r4, lr}
c0de70bc:	b108      	cbz	r0, c0de70c2 <ux_stack_get_step_params+0x8>
c0de70be:	2000      	movs	r0, #0
c0de70c0:	bd10      	pop	{r4, pc}
c0de70c2:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de70c6:	f2c0 0000 	movt	r0, #0
c0de70ca:	eb09 0100 	add.w	r1, r9, r0
c0de70ce:	8c8a      	ldrh	r2, [r1, #36]	@ 0x24
c0de70d0:	2a00      	cmp	r2, #0
c0de70d2:	d0f4      	beq.n	c0de70be <ux_stack_get_step_params+0x4>
c0de70d4:	8c09      	ldrh	r1, [r1, #32]
c0de70d6:	4291      	cmp	r1, r2
c0de70d8:	d2f1      	bcs.n	c0de70be <ux_stack_get_step_params+0x4>
c0de70da:	eb09 0400 	add.w	r4, r9, r0
c0de70de:	69e0      	ldr	r0, [r4, #28]
c0de70e0:	f000 ff12 	bl	c0de7f08 <pic>
c0de70e4:	8c21      	ldrh	r1, [r4, #32]
c0de70e6:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de70ea:	f000 ff0d 	bl	c0de7f08 <pic>
c0de70ee:	6840      	ldr	r0, [r0, #4]
c0de70f0:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de70f4:	f000 bf08 	b.w	c0de7f08 <pic>

c0de70f8 <ux_stack_get_current_step_params>:
c0de70f8:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de70fc:	f2c0 0000 	movt	r0, #0
c0de7100:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de7104:	3801      	subs	r0, #1
c0de7106:	f7ff bfd8 	b.w	c0de70ba <ux_stack_get_step_params>

c0de710a <ux_flow_relayout>:
c0de710a:	b580      	push	{r7, lr}
c0de710c:	f7ff fe09 	bl	c0de6d22 <ux_flow_get_current>
c0de7110:	b150      	cbz	r0, c0de7128 <ux_flow_relayout+0x1e>
c0de7112:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de7116:	f2c0 0000 	movt	r0, #0
c0de711a:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de711e:	3801      	subs	r0, #1
c0de7120:	f7ff feb3 	bl	c0de6e8a <ux_flow_engine_init_step>
c0de7124:	2001      	movs	r0, #1
c0de7126:	bd80      	pop	{r7, pc}
c0de7128:	2000      	movs	r0, #0
c0de712a:	bd80      	pop	{r7, pc}

c0de712c <ux_layout_bb_init_common>:
c0de712c:	b510      	push	{r4, lr}
c0de712e:	4604      	mov	r4, r0
c0de7130:	f000 fc62 	bl	c0de79f8 <ux_stack_init>
c0de7134:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de7138:	f2c0 0000 	movt	r0, #0
c0de713c:	4448      	add	r0, r9
c0de713e:	eb04 01c4 	add.w	r1, r4, r4, lsl #3
c0de7142:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de7146:	f244 115a 	movw	r1, #16730	@ 0x415a
c0de714a:	f2c0 0100 	movt	r1, #0
c0de714e:	4479      	add	r1, pc
c0de7150:	f8c0 10cc 	str.w	r1, [r0, #204]	@ 0xcc
c0de7154:	2105      	movs	r1, #5
c0de7156:	f880 10d0 	strb.w	r1, [r0, #208]	@ 0xd0
c0de715a:	2101      	movs	r1, #1
c0de715c:	f880 10c9 	strb.w	r1, [r0, #201]	@ 0xc9
c0de7160:	f64f 7119 	movw	r1, #65305	@ 0xff19
c0de7164:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de7168:	4479      	add	r1, pc
c0de716a:	f8c0 10dc 	str.w	r1, [r0, #220]	@ 0xdc
c0de716e:	bd10      	pop	{r4, pc}

c0de7170 <ux_layout_bn_prepro>:
c0de7170:	b580      	push	{r7, lr}
c0de7172:	f000 fbad 	bl	c0de78d0 <ux_layout_strings_prepro>
c0de7176:	b170      	cbz	r0, c0de7196 <ux_layout_bn_prepro+0x26>
c0de7178:	f240 41d0 	movw	r1, #1232	@ 0x4d0
c0de717c:	f2c0 0100 	movt	r1, #0
c0de7180:	eb09 0201 	add.w	r2, r9, r1
c0de7184:	f892 20a9 	ldrb.w	r2, [r2, #169]	@ 0xa9
c0de7188:	2a11      	cmp	r2, #17
c0de718a:	bf02      	ittt	eq
c0de718c:	4449      	addeq	r1, r9
c0de718e:	f248 020a 	movweq	r2, #32778	@ 0x800a
c0de7192:	f8a1 20c0 	strheq.w	r2, [r1, #192]	@ 0xc0
c0de7196:	bd80      	pop	{r7, pc}

c0de7198 <ux_layout_bn_init>:
c0de7198:	b510      	push	{r4, lr}
c0de719a:	4604      	mov	r4, r0
c0de719c:	f7ff ffc6 	bl	c0de712c <ux_layout_bb_init_common>
c0de71a0:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de71a4:	f2c0 0000 	movt	r0, #0
c0de71a8:	f64f 72b3 	movw	r2, #65459	@ 0xffb3
c0de71ac:	4448      	add	r0, r9
c0de71ae:	eb04 01c4 	add.w	r1, r4, r4, lsl #3
c0de71b2:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de71b6:	eb00 0181 	add.w	r1, r0, r1, lsl #2
c0de71ba:	447a      	add	r2, pc
c0de71bc:	4620      	mov	r0, r4
c0de71be:	f8c1 20d8 	str.w	r2, [r1, #216]	@ 0xd8
c0de71c2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de71c6:	f000 bbed 	b.w	c0de79a4 <ux_stack_display>

c0de71ca <ux_layout_paging_prepro_common>:
c0de71ca:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de71ce:	b082      	sub	sp, #8
c0de71d0:	f240 48d0 	movw	r8, #1232	@ 0x4d0
c0de71d4:	f2c0 0800 	movt	r8, #0
c0de71d8:	4606      	mov	r6, r0
c0de71da:	eb09 0008 	add.w	r0, r9, r8
c0de71de:	4614      	mov	r4, r2
c0de71e0:	460d      	mov	r5, r1
c0de71e2:	30a8      	adds	r0, #168	@ 0xa8
c0de71e4:	4631      	mov	r1, r6
c0de71e6:	2220      	movs	r2, #32
c0de71e8:	f001 f965 	bl	c0de84b6 <__aeabi_memmove>
c0de71ec:	7870      	ldrb	r0, [r6, #1]
c0de71ee:	2810      	cmp	r0, #16
c0de71f0:	dc26      	bgt.n	c0de7240 <ux_layout_paging_prepro_common+0x76>
c0de71f2:	2801      	cmp	r0, #1
c0de71f4:	d03c      	beq.n	c0de7270 <ux_layout_paging_prepro_common+0xa6>
c0de71f6:	2802      	cmp	r0, #2
c0de71f8:	d043      	beq.n	c0de7282 <ux_layout_paging_prepro_common+0xb8>
c0de71fa:	2810      	cmp	r0, #16
c0de71fc:	f040 809b 	bne.w	c0de7336 <ux_layout_paging_prepro_common+0x16c>
c0de7200:	2d00      	cmp	r5, #0
c0de7202:	d04b      	beq.n	c0de729c <ux_layout_paging_prepro_common+0xd2>
c0de7204:	eb09 0608 	add.w	r6, r9, r8
c0de7208:	68b0      	ldr	r0, [r6, #8]
c0de720a:	f641 115a 	movw	r1, #6490	@ 0x195a
c0de720e:	f2c0 0100 	movt	r1, #0
c0de7212:	f641 241d 	movw	r4, #6685	@ 0x1a1d
c0de7216:	f2c0 0400 	movt	r4, #0
c0de721a:	447c      	add	r4, pc
c0de721c:	2801      	cmp	r0, #1
c0de721e:	4628      	mov	r0, r5
c0de7220:	4479      	add	r1, pc
c0de7222:	bf88      	it	hi
c0de7224:	460c      	movhi	r4, r1
c0de7226:	f000 fe6f 	bl	c0de7f08 <pic>
c0de722a:	4603      	mov	r3, r0
c0de722c:	e9d6 0501 	ldrd	r0, r5, [r6, #4]
c0de7230:	2180      	movs	r1, #128	@ 0x80
c0de7232:	3001      	adds	r0, #1
c0de7234:	9000      	str	r0, [sp, #0]
c0de7236:	f106 0028 	add.w	r0, r6, #40	@ 0x28
c0de723a:	4622      	mov	r2, r4
c0de723c:	9501      	str	r5, [sp, #4]
c0de723e:	e03a      	b.n	c0de72b6 <ux_layout_paging_prepro_common+0xec>
c0de7240:	f1a0 0111 	sub.w	r1, r0, #17
c0de7244:	2903      	cmp	r1, #3
c0de7246:	d276      	bcs.n	c0de7336 <ux_layout_paging_prepro_common+0x16c>
c0de7248:	f000 000f 	and.w	r0, r0, #15
c0de724c:	1e46      	subs	r6, r0, #1
c0de724e:	2e02      	cmp	r6, #2
c0de7250:	d871      	bhi.n	c0de7336 <ux_layout_paging_prepro_common+0x16c>
c0de7252:	eb09 0008 	add.w	r0, r9, r8
c0de7256:	eb00 0046 	add.w	r0, r0, r6, lsl #1
c0de725a:	8a85      	ldrh	r5, [r0, #20]
c0de725c:	2d00      	cmp	r5, #0
c0de725e:	d06a      	beq.n	c0de7336 <ux_layout_paging_prepro_common+0x16c>
c0de7260:	2d7f      	cmp	r5, #127	@ 0x7f
c0de7262:	bf28      	it	cs
c0de7264:	257f      	movcs	r5, #127	@ 0x7f
c0de7266:	b3ec      	cbz	r4, c0de72e4 <ux_layout_paging_prepro_common+0x11a>
c0de7268:	4620      	mov	r0, r4
c0de726a:	f000 fe4d 	bl	c0de7f08 <pic>
c0de726e:	e03d      	b.n	c0de72ec <ux_layout_paging_prepro_common+0x122>
c0de7270:	f7ff fce7 	bl	c0de6c42 <ux_flow_is_first>
c0de7274:	2800      	cmp	r0, #0
c0de7276:	d05e      	beq.n	c0de7336 <ux_layout_paging_prepro_common+0x16c>
c0de7278:	eb09 0008 	add.w	r0, r9, r8
c0de727c:	6840      	ldr	r0, [r0, #4]
c0de727e:	b158      	cbz	r0, c0de7298 <ux_layout_paging_prepro_common+0xce>
c0de7280:	e059      	b.n	c0de7336 <ux_layout_paging_prepro_common+0x16c>
c0de7282:	f7ff fd0c 	bl	c0de6c9e <ux_flow_is_last>
c0de7286:	2800      	cmp	r0, #0
c0de7288:	d055      	beq.n	c0de7336 <ux_layout_paging_prepro_common+0x16c>
c0de728a:	eb09 0008 	add.w	r0, r9, r8
c0de728e:	e9d0 0101 	ldrd	r0, r1, [r0, #4]
c0de7292:	3901      	subs	r1, #1
c0de7294:	4288      	cmp	r0, r1
c0de7296:	d14e      	bne.n	c0de7336 <ux_layout_paging_prepro_common+0x16c>
c0de7298:	2000      	movs	r0, #0
c0de729a:	e04f      	b.n	c0de733c <ux_layout_paging_prepro_common+0x172>
c0de729c:	eb09 0008 	add.w	r0, r9, r8
c0de72a0:	e9d0 1601 	ldrd	r1, r6, [r0, #4]
c0de72a4:	f641 42bd 	movw	r2, #7357	@ 0x1cbd
c0de72a8:	f2c0 0200 	movt	r2, #0
c0de72ac:	1c4b      	adds	r3, r1, #1
c0de72ae:	3028      	adds	r0, #40	@ 0x28
c0de72b0:	447a      	add	r2, pc
c0de72b2:	2180      	movs	r1, #128	@ 0x80
c0de72b4:	9600      	str	r6, [sp, #0]
c0de72b6:	f000 fc57 	bl	c0de7b68 <snprintf>
c0de72ba:	eb09 0008 	add.w	r0, r9, r8
c0de72be:	7b01      	ldrb	r1, [r0, #12]
c0de72c0:	f248 0208 	movw	r2, #32776	@ 0x8008
c0de72c4:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de72c8:	3202      	adds	r2, #2
c0de72ca:	29ef      	cmp	r1, #239	@ 0xef
c0de72cc:	f100 0128 	add.w	r1, r0, #40	@ 0x28
c0de72d0:	bf84      	itt	hi
c0de72d2:	f248 0208 	movwhi	r2, #32776	@ 0x8008
c0de72d6:	f6cf 72ff 	movthi	r2, #65535	@ 0xffff
c0de72da:	f8a0 20c0 	strh.w	r2, [r0, #192]	@ 0xc0
c0de72de:	f8c0 10c4 	str.w	r1, [r0, #196]	@ 0xc4
c0de72e2:	e028      	b.n	c0de7336 <ux_layout_paging_prepro_common+0x16c>
c0de72e4:	eb09 0008 	add.w	r0, r9, r8
c0de72e8:	f8d0 010c 	ldr.w	r0, [r0, #268]	@ 0x10c
c0de72ec:	eb09 0708 	add.w	r7, r9, r8
c0de72f0:	eb07 0146 	add.w	r1, r7, r6, lsl #1
c0de72f4:	89c9      	ldrh	r1, [r1, #14]
c0de72f6:	f641 02cb 	movw	r2, #6347	@ 0x18cb
c0de72fa:	f107 0428 	add.w	r4, r7, #40	@ 0x28
c0de72fe:	f2c0 0200 	movt	r2, #0
c0de7302:	1846      	adds	r6, r0, r1
c0de7304:	447a      	add	r2, pc
c0de7306:	4620      	mov	r0, r4
c0de7308:	2180      	movs	r1, #128	@ 0x80
c0de730a:	462b      	mov	r3, r5
c0de730c:	9600      	str	r6, [sp, #0]
c0de730e:	f000 fc2b 	bl	c0de7b68 <snprintf>
c0de7312:	7b38      	ldrb	r0, [r7, #12]
c0de7314:	f248 0108 	movw	r1, #32776	@ 0x8008
c0de7318:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de731c:	f000 000f 	and.w	r0, r0, #15
c0de7320:	3102      	adds	r1, #2
c0de7322:	f8c7 40c4 	str.w	r4, [r7, #196]	@ 0xc4
c0de7326:	280f      	cmp	r0, #15
c0de7328:	bf04      	itt	eq
c0de732a:	f248 0108 	movweq	r1, #32776	@ 0x8008
c0de732e:	f6cf 71ff 	movteq	r1, #65535	@ 0xffff
c0de7332:	f8a7 10c0 	strh.w	r1, [r7, #192]	@ 0xc0
c0de7336:	eb09 0008 	add.w	r0, r9, r8
c0de733a:	30a8      	adds	r0, #168	@ 0xa8
c0de733c:	b002      	add	sp, #8
c0de733e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de7342 <ux_layout_paging_redisplay_common>:
c0de7342:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de7346:	4606      	mov	r6, r0
c0de7348:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de734c:	f2c0 0000 	movt	r0, #0
c0de7350:	4690      	mov	r8, r2
c0de7352:	eb09 0200 	add.w	r2, r9, r0
c0de7356:	eb06 00c6 	add.w	r0, r6, r6, lsl #3
c0de735a:	eb02 0780 	add.w	r7, r2, r0, lsl #2
c0de735e:	f643 70e2 	movw	r0, #16354	@ 0x3fe2
c0de7362:	f2c0 0000 	movt	r0, #0
c0de7366:	4478      	add	r0, pc
c0de7368:	f8c7 00cc 	str.w	r0, [r7, #204]	@ 0xcc
c0de736c:	2007      	movs	r0, #7
c0de736e:	f887 00d0 	strb.w	r0, [r7, #208]	@ 0xd0
c0de7372:	2001      	movs	r0, #1
c0de7374:	f887 00c9 	strb.w	r0, [r7, #201]	@ 0xc9
c0de7378:	7b10      	ldrb	r0, [r2, #12]
c0de737a:	460c      	mov	r4, r1
c0de737c:	f852 1f04 	ldr.w	r1, [r2, #4]!
c0de7380:	0700      	lsls	r0, r0, #28
c0de7382:	461d      	mov	r5, r3
c0de7384:	f04f 0308 	mov.w	r3, #8
c0de7388:	4620      	mov	r0, r4
c0de738a:	bf08      	it	eq
c0de738c:	230a      	moveq	r3, #10
c0de738e:	f000 f8e1 	bl	c0de7554 <ux_layout_paging_compute>
c0de7392:	f8c7 50d8 	str.w	r5, [r7, #216]	@ 0xd8
c0de7396:	4630      	mov	r0, r6
c0de7398:	f8c7 80dc 	str.w	r8, [r7, #220]	@ 0xdc
c0de739c:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de73a0:	f000 bb00 	b.w	c0de79a4 <ux_stack_display>

c0de73a4 <ux_layout_paging_redisplay_by_addr>:
c0de73a4:	b510      	push	{r4, lr}
c0de73a6:	4604      	mov	r4, r0
c0de73a8:	f7ff fea6 	bl	c0de70f8 <ux_stack_get_current_step_params>
c0de73ac:	b178      	cbz	r0, c0de73ce <ux_layout_paging_redisplay_by_addr+0x2a>
c0de73ae:	6841      	ldr	r1, [r0, #4]
c0de73b0:	f240 020d 	movw	r2, #13
c0de73b4:	f2c0 0200 	movt	r2, #0
c0de73b8:	f240 0397 	movw	r3, #151	@ 0x97
c0de73bc:	f2c0 0300 	movt	r3, #0
c0de73c0:	447a      	add	r2, pc
c0de73c2:	447b      	add	r3, pc
c0de73c4:	4620      	mov	r0, r4
c0de73c6:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de73ca:	f7ff bfba 	b.w	c0de7342 <ux_layout_paging_redisplay_common>
c0de73ce:	bd10      	pop	{r4, pc}

c0de73d0 <ux_layout_paging_button_callback_by_addr>:
c0de73d0:	b580      	push	{r7, lr}
c0de73d2:	2103      	movs	r1, #3
c0de73d4:	f2c8 0100 	movt	r1, #32768	@ 0x8000
c0de73d8:	4288      	cmp	r0, r1
c0de73da:	d013      	beq.n	c0de7404 <ux_layout_paging_button_callback_by_addr+0x34>
c0de73dc:	2102      	movs	r1, #2
c0de73de:	f2c8 0100 	movt	r1, #32768	@ 0x8000
c0de73e2:	4288      	cmp	r0, r1
c0de73e4:	d01e      	beq.n	c0de7424 <ux_layout_paging_button_callback_by_addr+0x54>
c0de73e6:	2101      	movs	r1, #1
c0de73e8:	f2c8 0100 	movt	r1, #32768	@ 0x8000
c0de73ec:	4288      	cmp	r0, r1
c0de73ee:	d133      	bne.n	c0de7458 <ux_layout_paging_button_callback_by_addr+0x88>
c0de73f0:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de73f4:	f2c0 0000 	movt	r0, #0
c0de73f8:	eb09 0100 	add.w	r1, r9, r0
c0de73fc:	6849      	ldr	r1, [r1, #4]
c0de73fe:	b349      	cbz	r1, c0de7454 <ux_layout_paging_button_callback_by_addr+0x84>
c0de7400:	3901      	subs	r1, #1
c0de7402:	e01e      	b.n	c0de7442 <ux_layout_paging_button_callback_by_addr+0x72>
c0de7404:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de7408:	f2c0 0000 	movt	r0, #0
c0de740c:	eb09 0100 	add.w	r1, r9, r0
c0de7410:	6889      	ldr	r1, [r1, #8]
c0de7412:	b121      	cbz	r1, c0de741e <ux_layout_paging_button_callback_by_addr+0x4e>
c0de7414:	4448      	add	r0, r9
c0de7416:	6840      	ldr	r0, [r0, #4]
c0de7418:	3901      	subs	r1, #1
c0de741a:	4281      	cmp	r1, r0
c0de741c:	d11c      	bne.n	c0de7458 <ux_layout_paging_button_callback_by_addr+0x88>
c0de741e:	f7ff fd75 	bl	c0de6f0c <ux_flow_validate>
c0de7422:	e019      	b.n	c0de7458 <ux_layout_paging_button_callback_by_addr+0x88>
c0de7424:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de7428:	f2c0 0000 	movt	r0, #0
c0de742c:	eb09 0100 	add.w	r1, r9, r0
c0de7430:	e9d1 1201 	ldrd	r1, r2, [r1, #4]
c0de7434:	3a01      	subs	r2, #1
c0de7436:	4291      	cmp	r1, r2
c0de7438:	d102      	bne.n	c0de7440 <ux_layout_paging_button_callback_by_addr+0x70>
c0de743a:	f7ff fcde 	bl	c0de6dfa <ux_flow_next>
c0de743e:	e00b      	b.n	c0de7458 <ux_layout_paging_button_callback_by_addr+0x88>
c0de7440:	3101      	adds	r1, #1
c0de7442:	eb09 0200 	add.w	r2, r9, r0
c0de7446:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de744a:	6051      	str	r1, [r2, #4]
c0de744c:	3801      	subs	r0, #1
c0de744e:	f7ff ffa9 	bl	c0de73a4 <ux_layout_paging_redisplay_by_addr>
c0de7452:	e001      	b.n	c0de7458 <ux_layout_paging_button_callback_by_addr+0x88>
c0de7454:	f7ff fcd4 	bl	c0de6e00 <ux_flow_prev>
c0de7458:	2000      	movs	r0, #0
c0de745a:	bd80      	pop	{r7, pc}

c0de745c <ux_layout_paging_prepro_by_addr>:
c0de745c:	b510      	push	{r4, lr}
c0de745e:	4604      	mov	r4, r0
c0de7460:	f7ff fe4a 	bl	c0de70f8 <ux_stack_get_current_step_params>
c0de7464:	b130      	cbz	r0, c0de7474 <ux_layout_paging_prepro_by_addr+0x18>
c0de7466:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de746a:	4620      	mov	r0, r4
c0de746c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de7470:	f7ff beab 	b.w	c0de71ca <ux_layout_paging_prepro_common>
c0de7474:	2000      	movs	r0, #0
c0de7476:	bd10      	pop	{r4, pc}

c0de7478 <ux_layout_paging_init_common>:
c0de7478:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de747c:	b081      	sub	sp, #4
c0de747e:	f240 48d0 	movw	r8, #1232	@ 0x4d0
c0de7482:	f2c0 0800 	movt	r8, #0
c0de7486:	460d      	mov	r5, r1
c0de7488:	eb09 0108 	add.w	r1, r9, r8
c0de748c:	7b0e      	ldrb	r6, [r1, #12]
c0de748e:	4692      	mov	sl, r2
c0de7490:	4604      	mov	r4, r0
c0de7492:	f7ff fc2e 	bl	c0de6cf2 <ux_flow_direction>
c0de7496:	2801      	cmp	r0, #1
c0de7498:	d00c      	beq.n	c0de74b4 <ux_layout_paging_init_common+0x3c>
c0de749a:	3001      	adds	r0, #1
c0de749c:	d110      	bne.n	c0de74c0 <ux_layout_paging_init_common+0x48>
c0de749e:	eb09 0708 	add.w	r7, r9, r8
c0de74a2:	f107 0008 	add.w	r0, r7, #8
c0de74a6:	2114      	movs	r1, #20
c0de74a8:	f001 f800 	bl	c0de84ac <__aeabi_memclr>
c0de74ac:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de74b0:	6078      	str	r0, [r7, #4]
c0de74b2:	e005      	b.n	c0de74c0 <ux_layout_paging_init_common+0x48>
c0de74b4:	eb09 0008 	add.w	r0, r9, r8
c0de74b8:	3004      	adds	r0, #4
c0de74ba:	2118      	movs	r1, #24
c0de74bc:	f000 fff6 	bl	c0de84ac <__aeabi_memclr>
c0de74c0:	eb09 0708 	add.w	r7, r9, r8
c0de74c4:	4620      	mov	r0, r4
c0de74c6:	733e      	strb	r6, [r7, #12]
c0de74c8:	1d3e      	adds	r6, r7, #4
c0de74ca:	f000 fa95 	bl	c0de79f8 <ux_stack_init>
c0de74ce:	f8d7 010c 	ldr.w	r0, [r7, #268]	@ 0x10c
c0de74d2:	2308      	movs	r3, #8
c0de74d4:	4328      	orrs	r0, r5
c0de74d6:	f641 10d0 	movw	r0, #6608	@ 0x19d0
c0de74da:	f2c0 0000 	movt	r0, #0
c0de74de:	7b39      	ldrb	r1, [r7, #12]
c0de74e0:	4478      	add	r0, pc
c0de74e2:	bf18      	it	ne
c0de74e4:	4628      	movne	r0, r5
c0de74e6:	0709      	lsls	r1, r1, #28
c0de74e8:	f04f 31ff 	mov.w	r1, #4294967295	@ 0xffffffff
c0de74ec:	4632      	mov	r2, r6
c0de74ee:	bf08      	it	eq
c0de74f0:	230a      	moveq	r3, #10
c0de74f2:	f000 f82f 	bl	c0de7554 <ux_layout_paging_compute>
c0de74f6:	60b8      	str	r0, [r7, #8]
c0de74f8:	b148      	cbz	r0, c0de750e <ux_layout_paging_init_common+0x96>
c0de74fa:	eb09 0108 	add.w	r1, r9, r8
c0de74fe:	6849      	ldr	r1, [r1, #4]
c0de7500:	3801      	subs	r0, #1
c0de7502:	4281      	cmp	r1, r0
c0de7504:	bf84      	itt	hi
c0de7506:	eb09 0108 	addhi.w	r1, r9, r8
c0de750a:	6048      	strhi	r0, [r1, #4]
c0de750c:	e005      	b.n	c0de751a <ux_layout_paging_init_common+0xa2>
c0de750e:	eb09 0008 	add.w	r0, r9, r8
c0de7512:	3004      	adds	r0, #4
c0de7514:	2118      	movs	r1, #24
c0de7516:	f000 ffc9 	bl	c0de84ac <__aeabi_memclr>
c0de751a:	4620      	mov	r0, r4
c0de751c:	4651      	mov	r1, sl
c0de751e:	b001      	add	sp, #4
c0de7520:	e8bd 45f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de7524:	4708      	bx	r1

c0de7526 <ux_layout_bn_paging_init>:
c0de7526:	b510      	push	{r4, lr}
c0de7528:	4604      	mov	r4, r0
c0de752a:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de752e:	f2c0 0000 	movt	r0, #0
c0de7532:	4448      	add	r0, r9
c0de7534:	21f0      	movs	r1, #240	@ 0xf0
c0de7536:	7301      	strb	r1, [r0, #12]
c0de7538:	4620      	mov	r0, r4
c0de753a:	f7ff fdbe 	bl	c0de70ba <ux_stack_get_step_params>
c0de753e:	6841      	ldr	r1, [r0, #4]
c0de7540:	f64f 6259 	movw	r2, #65113	@ 0xfe59
c0de7544:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de7548:	447a      	add	r2, pc
c0de754a:	4620      	mov	r0, r4
c0de754c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de7550:	f7ff bf92 	b.w	c0de7478 <ux_layout_paging_init_common>

c0de7554 <ux_layout_paging_compute>:
c0de7554:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7558:	b088      	sub	sp, #32
c0de755a:	460e      	mov	r6, r1
c0de755c:	4607      	mov	r7, r0
c0de755e:	f102 000a 	add.w	r0, r2, #10
c0de7562:	210c      	movs	r1, #12
c0de7564:	9307      	str	r3, [sp, #28]
c0de7566:	4614      	mov	r4, r2
c0de7568:	f000 ffa0 	bl	c0de84ac <__aeabi_memclr>
c0de756c:	1c70      	adds	r0, r6, #1
c0de756e:	9004      	str	r0, [sp, #16]
c0de7570:	d004      	beq.n	c0de757c <ux_layout_paging_compute+0x28>
c0de7572:	6860      	ldr	r0, [r4, #4]
c0de7574:	42b0      	cmp	r0, r6
c0de7576:	d801      	bhi.n	c0de757c <ux_layout_paging_compute+0x28>
c0de7578:	2000      	movs	r0, #0
c0de757a:	e097      	b.n	c0de76ac <ux_layout_paging_compute+0x158>
c0de757c:	b127      	cbz	r7, c0de7588 <ux_layout_paging_compute+0x34>
c0de757e:	4638      	mov	r0, r7
c0de7580:	f000 fcc2 	bl	c0de7f08 <pic>
c0de7584:	4607      	mov	r7, r0
c0de7586:	e006      	b.n	c0de7596 <ux_layout_paging_compute+0x42>
c0de7588:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de758c:	f2c0 0000 	movt	r0, #0
c0de7590:	4448      	add	r0, r9
c0de7592:	f8d0 710c 	ldr.w	r7, [r0, #268]	@ 0x10c
c0de7596:	4638      	mov	r0, r7
c0de7598:	f000 ffe8 	bl	c0de856c <strlen>
c0de759c:	2801      	cmp	r0, #1
c0de759e:	f2c0 8082 	blt.w	c0de76a6 <ux_layout_paging_compute+0x152>
c0de75a2:	eb07 0b00 	add.w	fp, r7, r0
c0de75a6:	2200      	movs	r2, #0
c0de75a8:	2300      	movs	r3, #0
c0de75aa:	2500      	movs	r5, #0
c0de75ac:	9402      	str	r4, [sp, #8]
c0de75ae:	4638      	mov	r0, r7
c0de75b0:	9701      	str	r7, [sp, #4]
c0de75b2:	9603      	str	r6, [sp, #12]
c0de75b4:	2600      	movs	r6, #0
c0de75b6:	46ba      	mov	sl, r7
c0de75b8:	e9cd 3205 	strd	r3, r2, [sp, #20]
c0de75bc:	eb07 0806 	add.w	r8, r7, r6
c0de75c0:	45d8      	cmp	r8, fp
c0de75c2:	d21d      	bcs.n	c0de7600 <ux_layout_paging_compute+0xac>
c0de75c4:	1c74      	adds	r4, r6, #1
c0de75c6:	9807      	ldr	r0, [sp, #28]
c0de75c8:	b2e3      	uxtb	r3, r4
c0de75ca:	2100      	movs	r1, #0
c0de75cc:	463a      	mov	r2, r7
c0de75ce:	9500      	str	r5, [sp, #0]
c0de75d0:	f7fe ffc3 	bl	c0de655a <bagl_compute_line_width>
c0de75d4:	2872      	cmp	r0, #114	@ 0x72
c0de75d6:	d813      	bhi.n	c0de7600 <ux_layout_paging_compute+0xac>
c0de75d8:	f898 0000 	ldrb.w	r0, [r8]
c0de75dc:	282c      	cmp	r0, #44	@ 0x2c
c0de75de:	dc05      	bgt.n	c0de75ec <ux_layout_paging_compute+0x98>
c0de75e0:	280a      	cmp	r0, #10
c0de75e2:	d007      	beq.n	c0de75f4 <ux_layout_paging_compute+0xa0>
c0de75e4:	2820      	cmp	r0, #32
c0de75e6:	bf08      	it	eq
c0de75e8:	46c2      	moveq	sl, r8
c0de75ea:	e004      	b.n	c0de75f6 <ux_layout_paging_compute+0xa2>
c0de75ec:	285f      	cmp	r0, #95	@ 0x5f
c0de75ee:	d001      	beq.n	c0de75f4 <ux_layout_paging_compute+0xa0>
c0de75f0:	282d      	cmp	r0, #45	@ 0x2d
c0de75f2:	d100      	bne.n	c0de75f6 <ux_layout_paging_compute+0xa2>
c0de75f4:	46c2      	mov	sl, r8
c0de75f6:	280a      	cmp	r0, #10
c0de75f8:	4626      	mov	r6, r4
c0de75fa:	d1df      	bne.n	c0de75bc <ux_layout_paging_compute+0x68>
c0de75fc:	e001      	b.n	c0de7602 <ux_layout_paging_compute+0xae>
c0de75fe:	bf00      	nop
c0de7600:	4634      	mov	r4, r6
c0de7602:	1938      	adds	r0, r7, r4
c0de7604:	4558      	cmp	r0, fp
c0de7606:	d203      	bcs.n	c0de7610 <ux_layout_paging_compute+0xbc>
c0de7608:	45ba      	cmp	sl, r7
c0de760a:	bf18      	it	ne
c0de760c:	2c00      	cmpne	r4, #0
c0de760e:	d126      	bne.n	c0de765e <ux_layout_paging_compute+0x10a>
c0de7610:	9e03      	ldr	r6, [sp, #12]
c0de7612:	e9dd 3205 	ldrd	r3, r2, [sp, #20]
c0de7616:	9804      	ldr	r0, [sp, #16]
c0de7618:	b170      	cbz	r0, c0de7638 <ux_layout_paging_compute+0xe4>
c0de761a:	42b2      	cmp	r2, r6
c0de761c:	d10c      	bne.n	c0de7638 <ux_layout_paging_compute+0xe4>
c0de761e:	9802      	ldr	r0, [sp, #8]
c0de7620:	6840      	ldr	r0, [r0, #4]
c0de7622:	42b0      	cmp	r0, r6
c0de7624:	d908      	bls.n	c0de7638 <ux_layout_paging_compute+0xe4>
c0de7626:	9801      	ldr	r0, [sp, #4]
c0de7628:	9902      	ldr	r1, [sp, #8]
c0de762a:	1a38      	subs	r0, r7, r0
c0de762c:	eb01 0143 	add.w	r1, r1, r3, lsl #1
c0de7630:	2b01      	cmp	r3, #1
c0de7632:	8148      	strh	r0, [r1, #10]
c0de7634:	820c      	strh	r4, [r1, #16]
c0de7636:	d836      	bhi.n	c0de76a6 <ux_layout_paging_compute+0x152>
c0de7638:	3301      	adds	r3, #1
c0de763a:	4427      	add	r7, r4
c0de763c:	2b02      	cmp	r3, #2
c0de763e:	f04f 0000 	mov.w	r0, #0
c0de7642:	bf88      	it	hi
c0de7644:	2001      	movhi	r0, #1
c0de7646:	455f      	cmp	r7, fp
c0de7648:	f04f 0100 	mov.w	r1, #0
c0de764c:	bf38      	it	cc
c0de764e:	2101      	movcc	r1, #1
c0de7650:	4008      	ands	r0, r1
c0de7652:	bf18      	it	ne
c0de7654:	2300      	movne	r3, #0
c0de7656:	455f      	cmp	r7, fp
c0de7658:	4402      	add	r2, r0
c0de765a:	d3ab      	bcc.n	c0de75b4 <ux_layout_paging_compute+0x60>
c0de765c:	e025      	b.n	c0de76aa <ux_layout_paging_compute+0x156>
c0de765e:	f810 1c01 	ldrb.w	r1, [r0, #-1]
c0de7662:	292c      	cmp	r1, #44	@ 0x2c
c0de7664:	dc07      	bgt.n	c0de7676 <ux_layout_paging_compute+0x122>
c0de7666:	9e03      	ldr	r6, [sp, #12]
c0de7668:	e9dd 3205 	ldrd	r3, r2, [sp, #20]
c0de766c:	290a      	cmp	r1, #10
c0de766e:	d0d2      	beq.n	c0de7616 <ux_layout_paging_compute+0xc2>
c0de7670:	2920      	cmp	r1, #32
c0de7672:	d0d0      	beq.n	c0de7616 <ux_layout_paging_compute+0xc2>
c0de7674:	e006      	b.n	c0de7684 <ux_layout_paging_compute+0x130>
c0de7676:	9e03      	ldr	r6, [sp, #12]
c0de7678:	e9dd 3205 	ldrd	r3, r2, [sp, #20]
c0de767c:	292d      	cmp	r1, #45	@ 0x2d
c0de767e:	d0ca      	beq.n	c0de7616 <ux_layout_paging_compute+0xc2>
c0de7680:	295f      	cmp	r1, #95	@ 0x5f
c0de7682:	d0c8      	beq.n	c0de7616 <ux_layout_paging_compute+0xc2>
c0de7684:	7800      	ldrb	r0, [r0, #0]
c0de7686:	282c      	cmp	r0, #44	@ 0x2c
c0de7688:	dc06      	bgt.n	c0de7698 <ux_layout_paging_compute+0x144>
c0de768a:	280a      	cmp	r0, #10
c0de768c:	d0c3      	beq.n	c0de7616 <ux_layout_paging_compute+0xc2>
c0de768e:	2820      	cmp	r0, #32
c0de7690:	bf18      	it	ne
c0de7692:	ebaa 0407 	subne.w	r4, sl, r7
c0de7696:	e7be      	b.n	c0de7616 <ux_layout_paging_compute+0xc2>
c0de7698:	282d      	cmp	r0, #45	@ 0x2d
c0de769a:	d0bc      	beq.n	c0de7616 <ux_layout_paging_compute+0xc2>
c0de769c:	285f      	cmp	r0, #95	@ 0x5f
c0de769e:	d0ba      	beq.n	c0de7616 <ux_layout_paging_compute+0xc2>
c0de76a0:	ebaa 0407 	sub.w	r4, sl, r7
c0de76a4:	e7b7      	b.n	c0de7616 <ux_layout_paging_compute+0xc2>
c0de76a6:	2001      	movs	r0, #1
c0de76a8:	e000      	b.n	c0de76ac <ux_layout_paging_compute+0x158>
c0de76aa:	1c50      	adds	r0, r2, #1
c0de76ac:	b008      	add	sp, #32
c0de76ae:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de76b2 <ux_layout_pb_prepro>:
c0de76b2:	b570      	push	{r4, r5, r6, lr}
c0de76b4:	4605      	mov	r5, r0
c0de76b6:	f7ff fd1f 	bl	c0de70f8 <ux_stack_get_current_step_params>
c0de76ba:	f240 46d0 	movw	r6, #1232	@ 0x4d0
c0de76be:	f2c0 0600 	movt	r6, #0
c0de76c2:	4604      	mov	r4, r0
c0de76c4:	eb09 0006 	add.w	r0, r9, r6
c0de76c8:	30a8      	adds	r0, #168	@ 0xa8
c0de76ca:	4629      	mov	r1, r5
c0de76cc:	2220      	movs	r2, #32
c0de76ce:	f000 fef2 	bl	c0de84b6 <__aeabi_memmove>
c0de76d2:	7868      	ldrb	r0, [r5, #1]
c0de76d4:	280f      	cmp	r0, #15
c0de76d6:	dc06      	bgt.n	c0de76e6 <ux_layout_pb_prepro+0x34>
c0de76d8:	2801      	cmp	r0, #1
c0de76da:	d00f      	beq.n	c0de76fc <ux_layout_pb_prepro+0x4a>
c0de76dc:	2802      	cmp	r0, #2
c0de76de:	d112      	bne.n	c0de7706 <ux_layout_pb_prepro+0x54>
c0de76e0:	f7ff fadd 	bl	c0de6c9e <ux_flow_is_last>
c0de76e4:	e00c      	b.n	c0de7700 <ux_layout_pb_prepro+0x4e>
c0de76e6:	2810      	cmp	r0, #16
c0de76e8:	d002      	beq.n	c0de76f0 <ux_layout_pb_prepro+0x3e>
c0de76ea:	2811      	cmp	r0, #17
c0de76ec:	d10b      	bne.n	c0de7706 <ux_layout_pb_prepro+0x54>
c0de76ee:	3404      	adds	r4, #4
c0de76f0:	6820      	ldr	r0, [r4, #0]
c0de76f2:	eb09 0106 	add.w	r1, r9, r6
c0de76f6:	f8c1 00c4 	str.w	r0, [r1, #196]	@ 0xc4
c0de76fa:	e004      	b.n	c0de7706 <ux_layout_pb_prepro+0x54>
c0de76fc:	f7ff faa1 	bl	c0de6c42 <ux_flow_is_first>
c0de7700:	b108      	cbz	r0, c0de7706 <ux_layout_pb_prepro+0x54>
c0de7702:	2000      	movs	r0, #0
c0de7704:	bd70      	pop	{r4, r5, r6, pc}
c0de7706:	eb09 0006 	add.w	r0, r9, r6
c0de770a:	30a8      	adds	r0, #168	@ 0xa8
c0de770c:	bd70      	pop	{r4, r5, r6, pc}

c0de770e <ux_layout_pb_init>:
c0de770e:	b510      	push	{r4, lr}
c0de7710:	4604      	mov	r4, r0
c0de7712:	f000 f971 	bl	c0de79f8 <ux_stack_init>
c0de7716:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de771a:	f2c0 0000 	movt	r0, #0
c0de771e:	4448      	add	r0, r9
c0de7720:	eb04 01c4 	add.w	r1, r4, r4, lsl #3
c0de7724:	eb00 0181 	add.w	r1, r0, r1, lsl #2
c0de7728:	f643 40f8 	movw	r0, #15608	@ 0x3cf8
c0de772c:	f2c0 0000 	movt	r0, #0
c0de7730:	4478      	add	r0, pc
c0de7732:	f8c1 00cc 	str.w	r0, [r1, #204]	@ 0xcc
c0de7736:	2005      	movs	r0, #5
c0de7738:	f881 00d0 	strb.w	r0, [r1, #208]	@ 0xd0
c0de773c:	2001      	movs	r0, #1
c0de773e:	f881 00c9 	strb.w	r0, [r1, #201]	@ 0xc9
c0de7742:	f64f 705d 	movw	r0, #65373	@ 0xff5d
c0de7746:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de774a:	f64f 122d 	movw	r2, #63789	@ 0xf92d
c0de774e:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de7752:	4478      	add	r0, pc
c0de7754:	447a      	add	r2, pc
c0de7756:	f8c1 00d8 	str.w	r0, [r1, #216]	@ 0xd8
c0de775a:	4620      	mov	r0, r4
c0de775c:	f8c1 20dc 	str.w	r2, [r1, #220]	@ 0xdc
c0de7760:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de7764:	f000 b91e 	b.w	c0de79a4 <ux_stack_display>

c0de7768 <ux_layout_pbb_prepro>:
c0de7768:	b570      	push	{r4, r5, r6, lr}
c0de776a:	4605      	mov	r5, r0
c0de776c:	f7ff fcc4 	bl	c0de70f8 <ux_stack_get_current_step_params>
c0de7770:	f240 46d0 	movw	r6, #1232	@ 0x4d0
c0de7774:	f2c0 0600 	movt	r6, #0
c0de7778:	4604      	mov	r4, r0
c0de777a:	eb09 0006 	add.w	r0, r9, r6
c0de777e:	30a8      	adds	r0, #168	@ 0xa8
c0de7780:	4629      	mov	r1, r5
c0de7782:	2220      	movs	r2, #32
c0de7784:	f000 fe97 	bl	c0de84b6 <__aeabi_memmove>
c0de7788:	7868      	ldrb	r0, [r5, #1]
c0de778a:	280f      	cmp	r0, #15
c0de778c:	dc06      	bgt.n	c0de779c <ux_layout_pbb_prepro+0x34>
c0de778e:	2801      	cmp	r0, #1
c0de7790:	d019      	beq.n	c0de77c6 <ux_layout_pbb_prepro+0x5e>
c0de7792:	2802      	cmp	r0, #2
c0de7794:	d01a      	beq.n	c0de77cc <ux_layout_pbb_prepro+0x64>
c0de7796:	280f      	cmp	r0, #15
c0de7798:	d00c      	beq.n	c0de77b4 <ux_layout_pbb_prepro+0x4c>
c0de779a:	e010      	b.n	c0de77be <ux_layout_pbb_prepro+0x56>
c0de779c:	3810      	subs	r0, #16
c0de779e:	2802      	cmp	r0, #2
c0de77a0:	d20d      	bcs.n	c0de77be <ux_layout_pbb_prepro+0x56>
c0de77a2:	eb09 0006 	add.w	r0, r9, r6
c0de77a6:	f890 00a9 	ldrb.w	r0, [r0, #169]	@ 0xa9
c0de77aa:	f000 000f 	and.w	r0, r0, #15
c0de77ae:	eb04 0080 	add.w	r0, r4, r0, lsl #2
c0de77b2:	1d04      	adds	r4, r0, #4
c0de77b4:	6820      	ldr	r0, [r4, #0]
c0de77b6:	eb09 0106 	add.w	r1, r9, r6
c0de77ba:	f8c1 00c4 	str.w	r0, [r1, #196]	@ 0xc4
c0de77be:	eb09 0006 	add.w	r0, r9, r6
c0de77c2:	30a8      	adds	r0, #168	@ 0xa8
c0de77c4:	bd70      	pop	{r4, r5, r6, pc}
c0de77c6:	f7ff fa3c 	bl	c0de6c42 <ux_flow_is_first>
c0de77ca:	e001      	b.n	c0de77d0 <ux_layout_pbb_prepro+0x68>
c0de77cc:	f7ff fa67 	bl	c0de6c9e <ux_flow_is_last>
c0de77d0:	2800      	cmp	r0, #0
c0de77d2:	d0f4      	beq.n	c0de77be <ux_layout_pbb_prepro+0x56>
c0de77d4:	2000      	movs	r0, #0
c0de77d6:	bd70      	pop	{r4, r5, r6, pc}

c0de77d8 <ux_layout_pbb_init_common>:
c0de77d8:	b510      	push	{r4, lr}
c0de77da:	4604      	mov	r4, r0
c0de77dc:	f000 f90c 	bl	c0de79f8 <ux_stack_init>
c0de77e0:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de77e4:	f2c0 0000 	movt	r0, #0
c0de77e8:	4448      	add	r0, r9
c0de77ea:	eb04 01c4 	add.w	r1, r4, r4, lsl #3
c0de77ee:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de77f2:	f643 41ce 	movw	r1, #15566	@ 0x3cce
c0de77f6:	f2c0 0100 	movt	r1, #0
c0de77fa:	4479      	add	r1, pc
c0de77fc:	f8c0 10cc 	str.w	r1, [r0, #204]	@ 0xcc
c0de7800:	2106      	movs	r1, #6
c0de7802:	f880 10d0 	strb.w	r1, [r0, #208]	@ 0xd0
c0de7806:	2101      	movs	r1, #1
c0de7808:	f880 10c9 	strb.w	r1, [r0, #201]	@ 0xc9
c0de780c:	f64f 016d 	movw	r1, #63597	@ 0xf86d
c0de7810:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de7814:	4479      	add	r1, pc
c0de7816:	f8c0 10dc 	str.w	r1, [r0, #220]	@ 0xdc
c0de781a:	bd10      	pop	{r4, pc}

c0de781c <ux_layout_pbb_init>:
c0de781c:	b510      	push	{r4, lr}
c0de781e:	4604      	mov	r4, r0
c0de7820:	f000 f8ea 	bl	c0de79f8 <ux_stack_init>
c0de7824:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de7828:	f2c0 0000 	movt	r0, #0
c0de782c:	4448      	add	r0, r9
c0de782e:	eb04 01c4 	add.w	r1, r4, r4, lsl #3
c0de7832:	eb00 0181 	add.w	r1, r0, r1, lsl #2
c0de7836:	f643 408a 	movw	r0, #15498	@ 0x3c8a
c0de783a:	f2c0 0000 	movt	r0, #0
c0de783e:	4478      	add	r0, pc
c0de7840:	f8c1 00cc 	str.w	r0, [r1, #204]	@ 0xcc
c0de7844:	2006      	movs	r0, #6
c0de7846:	f881 00d0 	strb.w	r0, [r1, #208]	@ 0xd0
c0de784a:	2001      	movs	r0, #1
c0de784c:	f881 00c9 	strb.w	r0, [r1, #201]	@ 0xc9
c0de7850:	f64f 0221 	movw	r2, #63521	@ 0xf821
c0de7854:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de7858:	f64f 7003 	movw	r0, #65283	@ 0xff03
c0de785c:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de7860:	447a      	add	r2, pc
c0de7862:	4478      	add	r0, pc
c0de7864:	f8c1 00d8 	str.w	r0, [r1, #216]	@ 0xd8
c0de7868:	4620      	mov	r0, r4
c0de786a:	f8c1 20dc 	str.w	r2, [r1, #220]	@ 0xdc
c0de786e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de7872:	f000 b897 	b.w	c0de79a4 <ux_stack_display>

c0de7876 <ux_layout_pnn_prepro>:
c0de7876:	b580      	push	{r7, lr}
c0de7878:	f7ff ff76 	bl	c0de7768 <ux_layout_pbb_prepro>
c0de787c:	b170      	cbz	r0, c0de789c <ux_layout_pnn_prepro+0x26>
c0de787e:	f240 41d0 	movw	r1, #1232	@ 0x4d0
c0de7882:	f2c0 0100 	movt	r1, #0
c0de7886:	eb09 0201 	add.w	r2, r9, r1
c0de788a:	f892 20a9 	ldrb.w	r2, [r2, #169]	@ 0xa9
c0de788e:	2a10      	cmp	r2, #16
c0de7890:	bf22      	ittt	cs
c0de7892:	4449      	addcs	r1, r9
c0de7894:	f248 020a 	movwcs	r2, #32778	@ 0x800a
c0de7898:	f8a1 20c0 	strhcs.w	r2, [r1, #192]	@ 0xc0
c0de789c:	bd80      	pop	{r7, pc}

c0de789e <ux_layout_pnn_init>:
c0de789e:	b510      	push	{r4, lr}
c0de78a0:	4604      	mov	r4, r0
c0de78a2:	f7ff ff99 	bl	c0de77d8 <ux_layout_pbb_init_common>
c0de78a6:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de78aa:	f2c0 0000 	movt	r0, #0
c0de78ae:	f64f 72b3 	movw	r2, #65459	@ 0xffb3
c0de78b2:	4448      	add	r0, r9
c0de78b4:	eb04 01c4 	add.w	r1, r4, r4, lsl #3
c0de78b8:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de78bc:	eb00 0181 	add.w	r1, r0, r1, lsl #2
c0de78c0:	447a      	add	r2, pc
c0de78c2:	4620      	mov	r0, r4
c0de78c4:	f8c1 20d8 	str.w	r2, [r1, #216]	@ 0xd8
c0de78c8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de78cc:	f000 b86a 	b.w	c0de79a4 <ux_stack_display>

c0de78d0 <ux_layout_strings_prepro>:
c0de78d0:	b570      	push	{r4, r5, r6, lr}
c0de78d2:	4605      	mov	r5, r0
c0de78d4:	f7ff fc10 	bl	c0de70f8 <ux_stack_get_current_step_params>
c0de78d8:	f240 46d0 	movw	r6, #1232	@ 0x4d0
c0de78dc:	f2c0 0600 	movt	r6, #0
c0de78e0:	4604      	mov	r4, r0
c0de78e2:	eb09 0006 	add.w	r0, r9, r6
c0de78e6:	30a8      	adds	r0, #168	@ 0xa8
c0de78e8:	4629      	mov	r1, r5
c0de78ea:	2220      	movs	r2, #32
c0de78ec:	f000 fde3 	bl	c0de84b6 <__aeabi_memmove>
c0de78f0:	7868      	ldrb	r0, [r5, #1]
c0de78f2:	2802      	cmp	r0, #2
c0de78f4:	d004      	beq.n	c0de7900 <ux_layout_strings_prepro+0x30>
c0de78f6:	2801      	cmp	r0, #1
c0de78f8:	d107      	bne.n	c0de790a <ux_layout_strings_prepro+0x3a>
c0de78fa:	f7ff f9a2 	bl	c0de6c42 <ux_flow_is_first>
c0de78fe:	e001      	b.n	c0de7904 <ux_layout_strings_prepro+0x34>
c0de7900:	f7ff f9cd 	bl	c0de6c9e <ux_flow_is_last>
c0de7904:	b180      	cbz	r0, c0de7928 <ux_layout_strings_prepro+0x58>
c0de7906:	2000      	movs	r0, #0
c0de7908:	bd70      	pop	{r4, r5, r6, pc}
c0de790a:	eb09 0006 	add.w	r0, r9, r6
c0de790e:	f890 00a9 	ldrb.w	r0, [r0, #169]	@ 0xa9
c0de7912:	f010 0ff0 	tst.w	r0, #240	@ 0xf0
c0de7916:	d007      	beq.n	c0de7928 <ux_layout_strings_prepro+0x58>
c0de7918:	f000 000f 	and.w	r0, r0, #15
c0de791c:	f854 0020 	ldr.w	r0, [r4, r0, lsl #2]
c0de7920:	eb09 0106 	add.w	r1, r9, r6
c0de7924:	f8c1 00c4 	str.w	r0, [r1, #196]	@ 0xc4
c0de7928:	eb09 0006 	add.w	r0, r9, r6
c0de792c:	30a8      	adds	r0, #168	@ 0xa8
c0de792e:	bd70      	pop	{r4, r5, r6, pc}

c0de7930 <ux_stack_push>:
c0de7930:	b5b0      	push	{r4, r5, r7, lr}
c0de7932:	f240 44d0 	movw	r4, #1232	@ 0x4d0
c0de7936:	f2c0 0400 	movt	r4, #0
c0de793a:	f819 0004 	ldrb.w	r0, [r9, r4]
c0de793e:	b968      	cbnz	r0, c0de795c <ux_stack_push+0x2c>
c0de7940:	eb09 0504 	add.w	r5, r9, r4
c0de7944:	f105 00c8 	add.w	r0, r5, #200	@ 0xc8
c0de7948:	2124      	movs	r1, #36	@ 0x24
c0de794a:	f000 fdaf 	bl	c0de84ac <__aeabi_memclr>
c0de794e:	2000      	movs	r0, #0
c0de7950:	e9c5 0007 	strd	r0, r0, [r5, #28]
c0de7954:	6268      	str	r0, [r5, #36]	@ 0x24
c0de7956:	2001      	movs	r0, #1
c0de7958:	f809 0004 	strb.w	r0, [r9, r4]
c0de795c:	3801      	subs	r0, #1
c0de795e:	bdb0      	pop	{r4, r5, r7, pc}

c0de7960 <ux_stack_redisplay>:
c0de7960:	b580      	push	{r7, lr}
c0de7962:	f7ff fbd2 	bl	c0de710a <ux_flow_relayout>
c0de7966:	b100      	cbz	r0, c0de796a <ux_stack_redisplay+0xa>
c0de7968:	bd80      	pop	{r7, pc}
c0de796a:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de796e:	f2c0 0000 	movt	r0, #0
c0de7972:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de7976:	2901      	cmp	r1, #1
c0de7978:	d109      	bne.n	c0de798e <ux_stack_redisplay+0x2e>
c0de797a:	eb09 0100 	add.w	r1, r9, r0
c0de797e:	2200      	movs	r2, #0
c0de7980:	2000      	movs	r0, #0
c0de7982:	f8a1 20ca 	strh.w	r2, [r1, #202]	@ 0xca
c0de7986:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de798a:	f000 b80b 	b.w	c0de79a4 <ux_stack_display>
c0de798e:	2900      	cmp	r1, #0
c0de7990:	d1ea      	bne.n	c0de7968 <ux_stack_redisplay+0x8>
c0de7992:	eb09 0100 	add.w	r1, r9, r0
c0de7996:	7849      	ldrb	r1, [r1, #1]
c0de7998:	29aa      	cmp	r1, #170	@ 0xaa
c0de799a:	bf02      	ittt	eq
c0de799c:	4448      	addeq	r0, r9
c0de799e:	2169      	moveq	r1, #105	@ 0x69
c0de79a0:	7041      	strbeq	r1, [r0, #1]
c0de79a2:	bd80      	pop	{r7, pc}

c0de79a4 <ux_stack_display>:
c0de79a4:	f240 41d0 	movw	r1, #1232	@ 0x4d0
c0de79a8:	f2c0 0100 	movt	r1, #0
c0de79ac:	f819 2001 	ldrb.w	r2, [r9, r1]
c0de79b0:	1c43      	adds	r3, r0, #1
c0de79b2:	b16a      	cbz	r2, c0de79d0 <ux_stack_display+0x2c>
c0de79b4:	4293      	cmp	r3, r2
c0de79b6:	d10b      	bne.n	c0de79d0 <ux_stack_display+0x2c>
c0de79b8:	4449      	add	r1, r9
c0de79ba:	eb00 00c0 	add.w	r0, r0, r0, lsl #3
c0de79be:	eb01 0180 	add.w	r1, r1, r0, lsl #2
c0de79c2:	f101 00c8 	add.w	r0, r1, #200	@ 0xc8
c0de79c6:	2200      	movs	r2, #0
c0de79c8:	f8a1 20ca 	strh.w	r2, [r1, #202]	@ 0xca
c0de79cc:	f000 b824 	b.w	c0de7a18 <ux_stack_display_elements>
c0de79d0:	fab3 f083 	clz	r0, r3
c0de79d4:	fab2 f282 	clz	r2, r2
c0de79d8:	0940      	lsrs	r0, r0, #5
c0de79da:	0952      	lsrs	r2, r2, #5
c0de79dc:	4310      	orrs	r0, r2
c0de79de:	2801      	cmp	r0, #1
c0de79e0:	bf18      	it	ne
c0de79e2:	4770      	bxne	lr
c0de79e4:	eb09 0001 	add.w	r0, r9, r1
c0de79e8:	7840      	ldrb	r0, [r0, #1]
c0de79ea:	28aa      	cmp	r0, #170	@ 0xaa
c0de79ec:	bf02      	ittt	eq
c0de79ee:	eb09 0001 	addeq.w	r0, r9, r1
c0de79f2:	2169      	moveq	r1, #105	@ 0x69
c0de79f4:	7041      	strbeq	r1, [r0, #1]
c0de79f6:	4770      	bx	lr

c0de79f8 <ux_stack_init>:
c0de79f8:	b100      	cbz	r0, c0de79fc <ux_stack_init+0x4>
c0de79fa:	4770      	bx	lr
c0de79fc:	b580      	push	{r7, lr}
c0de79fe:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de7a02:	f2c0 0000 	movt	r0, #0
c0de7a06:	4448      	add	r0, r9
c0de7a08:	30c8      	adds	r0, #200	@ 0xc8
c0de7a0a:	2124      	movs	r1, #36	@ 0x24
c0de7a0c:	f000 fd4e 	bl	c0de84ac <__aeabi_memclr>
c0de7a10:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de7a14:	4770      	bx	lr
	...

c0de7a18 <ux_stack_display_elements>:
c0de7a18:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de7a1c:	b081      	sub	sp, #4
c0de7a1e:	4604      	mov	r4, r0
c0de7a20:	f000 faba 	bl	c0de7f98 <os_perso_isonboarded>
c0de7a24:	28aa      	cmp	r0, #170	@ 0xaa
c0de7a26:	d103      	bne.n	c0de7a30 <ux_stack_display_elements+0x18>
c0de7a28:	f000 faf0 	bl	c0de800c <os_global_pin_is_validated>
c0de7a2c:	28aa      	cmp	r0, #170	@ 0xaa
c0de7a2e:	d151      	bne.n	c0de7ad4 <ux_stack_display_elements+0xbc>
c0de7a30:	7860      	ldrb	r0, [r4, #1]
c0de7a32:	b3b0      	cbz	r0, c0de7aa2 <ux_stack_display_elements+0x8a>
c0de7a34:	8860      	ldrh	r0, [r4, #2]
c0de7a36:	f894 8008 	ldrb.w	r8, [r4, #8]
c0de7a3a:	4540      	cmp	r0, r8
c0de7a3c:	d233      	bcs.n	c0de7aa6 <ux_stack_display_elements+0x8e>
c0de7a3e:	f240 4ad0 	movw	sl, #1232	@ 0x4d0
c0de7a42:	1c47      	adds	r7, r0, #1
c0de7a44:	0146      	lsls	r6, r0, #5
c0de7a46:	f2c0 0a00 	movt	sl, #0
c0de7a4a:	bf00      	nop
c0de7a4c:	3001      	adds	r0, #1
c0de7a4e:	8060      	strh	r0, [r4, #2]
c0de7a50:	f819 000a 	ldrb.w	r0, [r9, sl]
c0de7a54:	6861      	ldr	r1, [r4, #4]
c0de7a56:	eb01 0506 	add.w	r5, r1, r6
c0de7a5a:	b168      	cbz	r0, c0de7a78 <ux_stack_display_elements+0x60>
c0de7a5c:	eb00 00c0 	add.w	r0, r0, r0, lsl #3
c0de7a60:	eb09 010a 	add.w	r1, r9, sl
c0de7a64:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de7a68:	f8d0 10b4 	ldr.w	r1, [r0, #180]	@ 0xb4
c0de7a6c:	b121      	cbz	r1, c0de7a78 <ux_stack_display_elements+0x60>
c0de7a6e:	4628      	mov	r0, r5
c0de7a70:	4788      	blx	r1
c0de7a72:	b1a0      	cbz	r0, c0de7a9e <ux_stack_display_elements+0x86>
c0de7a74:	2801      	cmp	r0, #1
c0de7a76:	d100      	bne.n	c0de7a7a <ux_stack_display_elements+0x62>
c0de7a78:	4628      	mov	r0, r5
c0de7a7a:	b128      	cbz	r0, c0de7a88 <ux_stack_display_elements+0x70>
c0de7a7c:	2801      	cmp	r0, #1
c0de7a7e:	bf08      	it	eq
c0de7a80:	4628      	moveq	r0, r5
c0de7a82:	f7fd fffc 	bl	c0de5a7e <io_seph_ux_display_bagl_element>
c0de7a86:	e003      	b.n	c0de7a90 <ux_stack_display_elements+0x78>
c0de7a88:	eb09 000a 	add.w	r0, r9, sl
c0de7a8c:	7840      	ldrb	r0, [r0, #1]
c0de7a8e:	bb08      	cbnz	r0, c0de7ad4 <ux_stack_display_elements+0xbc>
c0de7a90:	7a20      	ldrb	r0, [r4, #8]
c0de7a92:	4287      	cmp	r7, r0
c0de7a94:	d207      	bcs.n	c0de7aa6 <ux_stack_display_elements+0x8e>
c0de7a96:	8860      	ldrh	r0, [r4, #2]
c0de7a98:	3701      	adds	r7, #1
c0de7a9a:	3620      	adds	r6, #32
c0de7a9c:	e7d6      	b.n	c0de7a4c <ux_stack_display_elements+0x34>
c0de7a9e:	2000      	movs	r0, #0
c0de7aa0:	e7eb      	b.n	c0de7a7a <ux_stack_display_elements+0x62>
c0de7aa2:	f04f 0800 	mov.w	r8, #0
c0de7aa6:	8860      	ldrh	r0, [r4, #2]
c0de7aa8:	4540      	cmp	r0, r8
c0de7aaa:	d113      	bne.n	c0de7ad4 <ux_stack_display_elements+0xbc>
c0de7aac:	f000 fb3c 	bl	c0de8128 <screen_update>
c0de7ab0:	8860      	ldrh	r0, [r4, #2]
c0de7ab2:	68e1      	ldr	r1, [r4, #12]
c0de7ab4:	3001      	adds	r0, #1
c0de7ab6:	8060      	strh	r0, [r4, #2]
c0de7ab8:	b119      	cbz	r1, c0de7ac2 <ux_stack_display_elements+0xaa>
c0de7aba:	2000      	movs	r0, #0
c0de7abc:	2500      	movs	r5, #0
c0de7abe:	4788      	blx	r1
c0de7ac0:	b108      	cbz	r0, c0de7ac6 <ux_stack_display_elements+0xae>
c0de7ac2:	7825      	ldrb	r5, [r4, #0]
c0de7ac4:	e000      	b.n	c0de7ac8 <ux_stack_display_elements+0xb0>
c0de7ac6:	8065      	strh	r5, [r4, #2]
c0de7ac8:	f240 40d0 	movw	r0, #1232	@ 0x4d0
c0de7acc:	f2c0 0000 	movt	r0, #0
c0de7ad0:	4448      	add	r0, r9
c0de7ad2:	7045      	strb	r5, [r0, #1]
c0de7ad4:	b001      	add	sp, #4
c0de7ad6:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de7ada <cx_blake2b_init_no_throw>:
c0de7ada:	b403      	push	{r0, r1}
c0de7adc:	f04f 001a 	mov.w	r0, #26
c0de7ae0:	e034      	b.n	c0de7b4c <cx_trampoline_helper>

c0de7ae2 <cx_ecfp_generate_pair_no_throw>:
c0de7ae2:	b403      	push	{r0, r1}
c0de7ae4:	f04f 0032 	mov.w	r0, #50	@ 0x32
c0de7ae8:	e030      	b.n	c0de7b4c <cx_trampoline_helper>

c0de7aea <cx_ecfp_init_private_key_no_throw>:
c0de7aea:	b403      	push	{r0, r1}
c0de7aec:	f04f 0033 	mov.w	r0, #51	@ 0x33
c0de7af0:	e02c      	b.n	c0de7b4c <cx_trampoline_helper>

c0de7af2 <cx_ecfp_init_public_key_no_throw>:
c0de7af2:	b403      	push	{r0, r1}
c0de7af4:	f04f 0034 	mov.w	r0, #52	@ 0x34
c0de7af8:	e028      	b.n	c0de7b4c <cx_trampoline_helper>

c0de7afa <cx_ecfp_scalar_mult_no_throw>:
c0de7afa:	b403      	push	{r0, r1}
c0de7afc:	f04f 0035 	mov.w	r0, #53	@ 0x35
c0de7b00:	e024      	b.n	c0de7b4c <cx_trampoline_helper>

c0de7b02 <cx_edwards_compress_point_no_throw>:
c0de7b02:	b403      	push	{r0, r1}
c0de7b04:	f04f 003c 	mov.w	r0, #60	@ 0x3c
c0de7b08:	e020      	b.n	c0de7b4c <cx_trampoline_helper>

c0de7b0a <cx_hash_get_size>:
c0de7b0a:	b403      	push	{r0, r1}
c0de7b0c:	f04f 0041 	mov.w	r0, #65	@ 0x41
c0de7b10:	e01c      	b.n	c0de7b4c <cx_trampoline_helper>

c0de7b12 <cx_hash_no_throw>:
c0de7b12:	b403      	push	{r0, r1}
c0de7b14:	f04f 0044 	mov.w	r0, #68	@ 0x44
c0de7b18:	e018      	b.n	c0de7b4c <cx_trampoline_helper>

c0de7b1a <cx_keccak_init_no_throw>:
c0de7b1a:	b403      	push	{r0, r1}
c0de7b1c:	f04f 0056 	mov.w	r0, #86	@ 0x56
c0de7b20:	e014      	b.n	c0de7b4c <cx_trampoline_helper>

c0de7b22 <cx_math_addm_no_throw>:
c0de7b22:	b403      	push	{r0, r1}
c0de7b24:	f04f 0057 	mov.w	r0, #87	@ 0x57
c0de7b28:	e010      	b.n	c0de7b4c <cx_trampoline_helper>

c0de7b2a <cx_math_modm_no_throw>:
c0de7b2a:	b403      	push	{r0, r1}
c0de7b2c:	f04f 005d 	mov.w	r0, #93	@ 0x5d
c0de7b30:	e00c      	b.n	c0de7b4c <cx_trampoline_helper>

c0de7b32 <cx_math_multm_no_throw>:
c0de7b32:	b403      	push	{r0, r1}
c0de7b34:	f04f 005e 	mov.w	r0, #94	@ 0x5e
c0de7b38:	e008      	b.n	c0de7b4c <cx_trampoline_helper>

c0de7b3a <cx_sha512_init_no_throw>:
c0de7b3a:	b403      	push	{r0, r1}
c0de7b3c:	f04f 007a 	mov.w	r0, #122	@ 0x7a
c0de7b40:	e004      	b.n	c0de7b4c <cx_trampoline_helper>
	...

c0de7b44 <cx_aes_siv_reset>:
c0de7b44:	b403      	push	{r0, r1}
c0de7b46:	f04f 0090 	mov.w	r0, #144	@ 0x90
c0de7b4a:	e7ff      	b.n	c0de7b4c <cx_trampoline_helper>

c0de7b4c <cx_trampoline_helper>:
c0de7b4c:	4900      	ldr	r1, [pc, #0]	@ (c0de7b50 <cx_trampoline_helper+0x4>)
c0de7b4e:	4708      	bx	r1
c0de7b50:	00808001 	.word	0x00808001

c0de7b54 <os_boot>:
c0de7b54:	2000      	movs	r0, #0
c0de7b56:	f000 bacb 	b.w	c0de80f0 <try_context_set>

c0de7b5a <os_longjmp>:
c0de7b5a:	4604      	mov	r4, r0
c0de7b5c:	f000 fabe 	bl	c0de80dc <try_context_get>
c0de7b60:	4621      	mov	r1, r4
c0de7b62:	f000 fcfb 	bl	c0de855c <longjmp>
	...

c0de7b68 <snprintf>:
c0de7b68:	b081      	sub	sp, #4
c0de7b6a:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7b6e:	b089      	sub	sp, #36	@ 0x24
c0de7b70:	2800      	cmp	r0, #0
c0de7b72:	9311      	str	r3, [sp, #68]	@ 0x44
c0de7b74:	f000 81c1 	beq.w	c0de7efa <snprintf+0x392>
c0de7b78:	460e      	mov	r6, r1
c0de7b7a:	2900      	cmp	r1, #0
c0de7b7c:	f000 81bd 	beq.w	c0de7efa <snprintf+0x392>
c0de7b80:	4631      	mov	r1, r6
c0de7b82:	4615      	mov	r5, r2
c0de7b84:	4604      	mov	r4, r0
c0de7b86:	f000 fc91 	bl	c0de84ac <__aeabi_memclr>
c0de7b8a:	f1b6 0b01 	subs.w	fp, r6, #1
c0de7b8e:	f000 81b4 	beq.w	c0de7efa <snprintf+0x392>
c0de7b92:	7828      	ldrb	r0, [r5, #0]
c0de7b94:	a911      	add	r1, sp, #68	@ 0x44
c0de7b96:	2800      	cmp	r0, #0
c0de7b98:	9104      	str	r1, [sp, #16]
c0de7b9a:	f000 81ae 	beq.w	c0de7efa <snprintf+0x392>
c0de7b9e:	46a6      	mov	lr, r4
c0de7ba0:	2400      	movs	r4, #0
c0de7ba2:	bf00      	nop
c0de7ba4:	b130      	cbz	r0, c0de7bb4 <snprintf+0x4c>
c0de7ba6:	2825      	cmp	r0, #37	@ 0x25
c0de7ba8:	d004      	beq.n	c0de7bb4 <snprintf+0x4c>
c0de7baa:	1928      	adds	r0, r5, r4
c0de7bac:	7840      	ldrb	r0, [r0, #1]
c0de7bae:	3401      	adds	r4, #1
c0de7bb0:	e7f8      	b.n	c0de7ba4 <snprintf+0x3c>
c0de7bb2:	bf00      	nop
c0de7bb4:	465f      	mov	r7, fp
c0de7bb6:	455c      	cmp	r4, fp
c0de7bb8:	bf38      	it	cc
c0de7bba:	4627      	movcc	r7, r4
c0de7bbc:	4670      	mov	r0, lr
c0de7bbe:	4629      	mov	r1, r5
c0de7bc0:	463a      	mov	r2, r7
c0de7bc2:	4676      	mov	r6, lr
c0de7bc4:	f000 fc77 	bl	c0de84b6 <__aeabi_memmove>
c0de7bc8:	ebbb 0807 	subs.w	r8, fp, r7
c0de7bcc:	f000 8195 	beq.w	c0de7efa <snprintf+0x392>
c0de7bd0:	5de8      	ldrb	r0, [r5, r7]
c0de7bd2:	46b6      	mov	lr, r6
c0de7bd4:	eb06 0e07 	add.w	lr, r6, r7
c0de7bd8:	2825      	cmp	r0, #37	@ 0x25
c0de7bda:	443d      	add	r5, r7
c0de7bdc:	f040 8174 	bne.w	c0de7ec8 <snprintf+0x360>
c0de7be0:	3501      	adds	r5, #1
c0de7be2:	f04f 0a00 	mov.w	sl, #0
c0de7be6:	2220      	movs	r2, #32
c0de7be8:	2600      	movs	r6, #0
c0de7bea:	2000      	movs	r0, #0
c0de7bec:	3501      	adds	r5, #1
c0de7bee:	f815 1c01 	ldrb.w	r1, [r5, #-1]
c0de7bf2:	3501      	adds	r5, #1
c0de7bf4:	292d      	cmp	r1, #45	@ 0x2d
c0de7bf6:	dc11      	bgt.n	c0de7c1c <snprintf+0xb4>
c0de7bf8:	f04f 0000 	mov.w	r0, #0
c0de7bfc:	d0f7      	beq.n	c0de7bee <snprintf+0x86>
c0de7bfe:	2925      	cmp	r1, #37	@ 0x25
c0de7c00:	d06e      	beq.n	c0de7ce0 <snprintf+0x178>
c0de7c02:	292a      	cmp	r1, #42	@ 0x2a
c0de7c04:	f040 815e 	bne.w	c0de7ec4 <snprintf+0x35c>
c0de7c08:	462b      	mov	r3, r5
c0de7c0a:	f813 0d01 	ldrb.w	r0, [r3, #-1]!
c0de7c0e:	2873      	cmp	r0, #115	@ 0x73
c0de7c10:	f040 8171 	bne.w	c0de7ef6 <snprintf+0x38e>
c0de7c14:	9904      	ldr	r1, [sp, #16]
c0de7c16:	2002      	movs	r0, #2
c0de7c18:	461d      	mov	r5, r3
c0de7c1a:	e025      	b.n	c0de7c68 <snprintf+0x100>
c0de7c1c:	2947      	cmp	r1, #71	@ 0x47
c0de7c1e:	dc27      	bgt.n	c0de7c70 <snprintf+0x108>
c0de7c20:	f1a1 0330 	sub.w	r3, r1, #48	@ 0x30
c0de7c24:	2b0a      	cmp	r3, #10
c0de7c26:	d20d      	bcs.n	c0de7c44 <snprintf+0xdc>
c0de7c28:	f081 0330 	eor.w	r3, r1, #48	@ 0x30
c0de7c2c:	ea53 030a 	orrs.w	r3, r3, sl
c0de7c30:	eb0a 038a 	add.w	r3, sl, sl, lsl #2
c0de7c34:	eb01 0143 	add.w	r1, r1, r3, lsl #1
c0de7c38:	bf08      	it	eq
c0de7c3a:	2230      	moveq	r2, #48	@ 0x30
c0de7c3c:	f1a1 0a30 	sub.w	sl, r1, #48	@ 0x30
c0de7c40:	3d01      	subs	r5, #1
c0de7c42:	e7d3      	b.n	c0de7bec <snprintf+0x84>
c0de7c44:	292e      	cmp	r1, #46	@ 0x2e
c0de7c46:	f040 813d 	bne.w	c0de7ec4 <snprintf+0x35c>
c0de7c4a:	f815 0c01 	ldrb.w	r0, [r5, #-1]
c0de7c4e:	282a      	cmp	r0, #42	@ 0x2a
c0de7c50:	f040 8151 	bne.w	c0de7ef6 <snprintf+0x38e>
c0de7c54:	7828      	ldrb	r0, [r5, #0]
c0de7c56:	2848      	cmp	r0, #72	@ 0x48
c0de7c58:	d004      	beq.n	c0de7c64 <snprintf+0xfc>
c0de7c5a:	2873      	cmp	r0, #115	@ 0x73
c0de7c5c:	d002      	beq.n	c0de7c64 <snprintf+0xfc>
c0de7c5e:	2868      	cmp	r0, #104	@ 0x68
c0de7c60:	f040 8148 	bne.w	c0de7ef4 <snprintf+0x38c>
c0de7c64:	9904      	ldr	r1, [sp, #16]
c0de7c66:	2001      	movs	r0, #1
c0de7c68:	1d0b      	adds	r3, r1, #4
c0de7c6a:	9304      	str	r3, [sp, #16]
c0de7c6c:	680e      	ldr	r6, [r1, #0]
c0de7c6e:	e7bd      	b.n	c0de7bec <snprintf+0x84>
c0de7c70:	2967      	cmp	r1, #103	@ 0x67
c0de7c72:	dd08      	ble.n	c0de7c86 <snprintf+0x11e>
c0de7c74:	2972      	cmp	r1, #114	@ 0x72
c0de7c76:	dd11      	ble.n	c0de7c9c <snprintf+0x134>
c0de7c78:	2973      	cmp	r1, #115	@ 0x73
c0de7c7a:	d036      	beq.n	c0de7cea <snprintf+0x182>
c0de7c7c:	2975      	cmp	r1, #117	@ 0x75
c0de7c7e:	d037      	beq.n	c0de7cf0 <snprintf+0x188>
c0de7c80:	2978      	cmp	r1, #120	@ 0x78
c0de7c82:	d011      	beq.n	c0de7ca8 <snprintf+0x140>
c0de7c84:	e11e      	b.n	c0de7ec4 <snprintf+0x35c>
c0de7c86:	2962      	cmp	r1, #98	@ 0x62
c0de7c88:	dc17      	bgt.n	c0de7cba <snprintf+0x152>
c0de7c8a:	2948      	cmp	r1, #72	@ 0x48
c0de7c8c:	f000 80ae 	beq.w	c0de7dec <snprintf+0x284>
c0de7c90:	2958      	cmp	r1, #88	@ 0x58
c0de7c92:	f040 8117 	bne.w	c0de7ec4 <snprintf+0x35c>
c0de7c96:	f04f 0c01 	mov.w	ip, #1
c0de7c9a:	e007      	b.n	c0de7cac <snprintf+0x144>
c0de7c9c:	2968      	cmp	r1, #104	@ 0x68
c0de7c9e:	f000 80ad 	beq.w	c0de7dfc <snprintf+0x294>
c0de7ca2:	2970      	cmp	r1, #112	@ 0x70
c0de7ca4:	f040 810e 	bne.w	c0de7ec4 <snprintf+0x35c>
c0de7ca8:	f04f 0c00 	mov.w	ip, #0
c0de7cac:	9804      	ldr	r0, [sp, #16]
c0de7cae:	2600      	movs	r6, #0
c0de7cb0:	1d01      	adds	r1, r0, #4
c0de7cb2:	9104      	str	r1, [sp, #16]
c0de7cb4:	6804      	ldr	r4, [r0, #0]
c0de7cb6:	2710      	movs	r7, #16
c0de7cb8:	e022      	b.n	c0de7d00 <snprintf+0x198>
c0de7cba:	2963      	cmp	r1, #99	@ 0x63
c0de7cbc:	f000 80f7 	beq.w	c0de7eae <snprintf+0x346>
c0de7cc0:	2964      	cmp	r1, #100	@ 0x64
c0de7cc2:	f040 80ff 	bne.w	c0de7ec4 <snprintf+0x35c>
c0de7cc6:	9804      	ldr	r0, [sp, #16]
c0de7cc8:	1d01      	adds	r1, r0, #4
c0de7cca:	9104      	str	r1, [sp, #16]
c0de7ccc:	6800      	ldr	r0, [r0, #0]
c0de7cce:	2800      	cmp	r0, #0
c0de7cd0:	4604      	mov	r4, r0
c0de7cd2:	d500      	bpl.n	c0de7cd6 <snprintf+0x16e>
c0de7cd4:	4244      	negs	r4, r0
c0de7cd6:	0fc6      	lsrs	r6, r0, #31
c0de7cd8:	f04f 0c00 	mov.w	ip, #0
c0de7cdc:	270a      	movs	r7, #10
c0de7cde:	e00f      	b.n	c0de7d00 <snprintf+0x198>
c0de7ce0:	f1b8 0801 	subs.w	r8, r8, #1
c0de7ce4:	f04f 0025 	mov.w	r0, #37	@ 0x25
c0de7ce8:	e0e8      	b.n	c0de7ebc <snprintf+0x354>
c0de7cea:	f04f 0c00 	mov.w	ip, #0
c0de7cee:	e087      	b.n	c0de7e00 <snprintf+0x298>
c0de7cf0:	9804      	ldr	r0, [sp, #16]
c0de7cf2:	2600      	movs	r6, #0
c0de7cf4:	1d01      	adds	r1, r0, #4
c0de7cf6:	9104      	str	r1, [sp, #16]
c0de7cf8:	6804      	ldr	r4, [r0, #0]
c0de7cfa:	270a      	movs	r7, #10
c0de7cfc:	f04f 0c00 	mov.w	ip, #0
c0de7d00:	42a7      	cmp	r7, r4
c0de7d02:	d902      	bls.n	c0de7d0a <snprintf+0x1a2>
c0de7d04:	f04f 0b01 	mov.w	fp, #1
c0de7d08:	e00f      	b.n	c0de7d2a <snprintf+0x1c2>
c0de7d0a:	f1aa 0101 	sub.w	r1, sl, #1
c0de7d0e:	4638      	mov	r0, r7
c0de7d10:	4683      	mov	fp, r0
c0de7d12:	fba7 0300 	umull	r0, r3, r7, r0
c0de7d16:	2b00      	cmp	r3, #0
c0de7d18:	bf18      	it	ne
c0de7d1a:	2301      	movne	r3, #1
c0de7d1c:	42a0      	cmp	r0, r4
c0de7d1e:	468a      	mov	sl, r1
c0de7d20:	d803      	bhi.n	c0de7d2a <snprintf+0x1c2>
c0de7d22:	2b00      	cmp	r3, #0
c0de7d24:	f1aa 0101 	sub.w	r1, sl, #1
c0de7d28:	d0f2      	beq.n	c0de7d10 <snprintf+0x1a8>
c0de7d2a:	2e00      	cmp	r6, #0
c0de7d2c:	4633      	mov	r3, r6
c0de7d2e:	4650      	mov	r0, sl
c0de7d30:	bf1c      	itt	ne
c0de7d32:	f04f 33ff 	movne.w	r3, #4294967295	@ 0xffffffff
c0de7d36:	3801      	subne	r0, #1
c0de7d38:	9603      	str	r6, [sp, #12]
c0de7d3a:	2e00      	cmp	r6, #0
c0de7d3c:	f04f 0600 	mov.w	r6, #0
c0de7d40:	d008      	beq.n	c0de7d54 <snprintf+0x1ec>
c0de7d42:	b2d1      	uxtb	r1, r2
c0de7d44:	2930      	cmp	r1, #48	@ 0x30
c0de7d46:	d105      	bne.n	c0de7d54 <snprintf+0x1ec>
c0de7d48:	212d      	movs	r1, #45	@ 0x2d
c0de7d4a:	f88d 1014 	strb.w	r1, [sp, #20]
c0de7d4e:	2100      	movs	r1, #0
c0de7d50:	2601      	movs	r6, #1
c0de7d52:	9103      	str	r1, [sp, #12]
c0de7d54:	f1a0 0110 	sub.w	r1, r0, #16
c0de7d58:	f111 0f0e 	cmn.w	r1, #14
c0de7d5c:	d30e      	bcc.n	c0de7d7c <snprintf+0x214>
c0de7d5e:	1e41      	subs	r1, r0, #1
c0de7d60:	a805      	add	r0, sp, #20
c0de7d62:	4430      	add	r0, r6
c0de7d64:	b2d2      	uxtb	r2, r2
c0de7d66:	e88d 5008 	stmia.w	sp, {r3, ip, lr}
c0de7d6a:	f000 fba6 	bl	c0de84ba <__aeabi_memset>
c0de7d6e:	9900      	ldr	r1, [sp, #0]
c0de7d70:	eb0a 0006 	add.w	r0, sl, r6
c0de7d74:	e9dd ce01 	ldrd	ip, lr, [sp, #4]
c0de7d78:	4408      	add	r0, r1
c0de7d7a:	1e46      	subs	r6, r0, #1
c0de7d7c:	9803      	ldr	r0, [sp, #12]
c0de7d7e:	b120      	cbz	r0, c0de7d8a <snprintf+0x222>
c0de7d80:	202d      	movs	r0, #45	@ 0x2d
c0de7d82:	a905      	add	r1, sp, #20
c0de7d84:	5588      	strb	r0, [r1, r6]
c0de7d86:	3601      	adds	r6, #1
c0de7d88:	e000      	b.n	c0de7d8c <snprintf+0x224>
c0de7d8a:	a905      	add	r1, sp, #20
c0de7d8c:	f1bb 0f00 	cmp.w	fp, #0
c0de7d90:	d01c      	beq.n	c0de7dcc <snprintf+0x264>
c0de7d92:	f642 007e 	movw	r0, #10366	@ 0x287e
c0de7d96:	f2c0 0000 	movt	r0, #0
c0de7d9a:	f642 0264 	movw	r2, #10340	@ 0x2864
c0de7d9e:	4478      	add	r0, pc
c0de7da0:	f2c0 0200 	movt	r2, #0
c0de7da4:	f1bc 0f00 	cmp.w	ip, #0
c0de7da8:	447a      	add	r2, pc
c0de7daa:	bf08      	it	eq
c0de7dac:	4610      	moveq	r0, r2
c0de7dae:	bf00      	nop
c0de7db0:	fbb4 f3fb 	udiv	r3, r4, fp
c0de7db4:	455f      	cmp	r7, fp
c0de7db6:	fbb3 f2f7 	udiv	r2, r3, r7
c0de7dba:	fbbb fbf7 	udiv	fp, fp, r7
c0de7dbe:	fb02 3217 	mls	r2, r2, r7, r3
c0de7dc2:	5c82      	ldrb	r2, [r0, r2]
c0de7dc4:	558a      	strb	r2, [r1, r6]
c0de7dc6:	f106 0601 	add.w	r6, r6, #1
c0de7dca:	d9f1      	bls.n	c0de7db0 <snprintf+0x248>
c0de7dcc:	4546      	cmp	r6, r8
c0de7dce:	bf28      	it	cs
c0de7dd0:	4646      	movcs	r6, r8
c0de7dd2:	4670      	mov	r0, lr
c0de7dd4:	4632      	mov	r2, r6
c0de7dd6:	4674      	mov	r4, lr
c0de7dd8:	f000 fb6d 	bl	c0de84b6 <__aeabi_memmove>
c0de7ddc:	ebb8 0806 	subs.w	r8, r8, r6
c0de7de0:	f000 808b 	beq.w	c0de7efa <snprintf+0x392>
c0de7de4:	46a6      	mov	lr, r4
c0de7de6:	eb04 0e06 	add.w	lr, r4, r6
c0de7dea:	e06b      	b.n	c0de7ec4 <snprintf+0x35c>
c0de7dec:	f642 0224 	movw	r2, #10276	@ 0x2824
c0de7df0:	f2c0 0200 	movt	r2, #0
c0de7df4:	f04f 0c01 	mov.w	ip, #1
c0de7df8:	447a      	add	r2, pc
c0de7dfa:	e006      	b.n	c0de7e0a <snprintf+0x2a2>
c0de7dfc:	f04f 0c01 	mov.w	ip, #1
c0de7e00:	f642 0204 	movw	r2, #10244	@ 0x2804
c0de7e04:	f2c0 0200 	movt	r2, #0
c0de7e08:	447a      	add	r2, pc
c0de7e0a:	9904      	ldr	r1, [sp, #16]
c0de7e0c:	b2c0      	uxtb	r0, r0
c0de7e0e:	1d0b      	adds	r3, r1, #4
c0de7e10:	9304      	str	r3, [sp, #16]
c0de7e12:	6809      	ldr	r1, [r1, #0]
c0de7e14:	2802      	cmp	r0, #2
c0de7e16:	d05c      	beq.n	c0de7ed2 <snprintf+0x36a>
c0de7e18:	2801      	cmp	r0, #1
c0de7e1a:	d008      	beq.n	c0de7e2e <snprintf+0x2c6>
c0de7e1c:	463e      	mov	r6, r7
c0de7e1e:	b930      	cbnz	r0, c0de7e2e <snprintf+0x2c6>
c0de7e20:	2000      	movs	r0, #0
c0de7e22:	bf00      	nop
c0de7e24:	5c0b      	ldrb	r3, [r1, r0]
c0de7e26:	3001      	adds	r0, #1
c0de7e28:	2b00      	cmp	r3, #0
c0de7e2a:	d1fb      	bne.n	c0de7e24 <snprintf+0x2bc>
c0de7e2c:	1e46      	subs	r6, r0, #1
c0de7e2e:	f1bc 0f00 	cmp.w	ip, #0
c0de7e32:	d020      	beq.n	c0de7e76 <snprintf+0x30e>
c0de7e34:	2e00      	cmp	r6, #0
c0de7e36:	d045      	beq.n	c0de7ec4 <snprintf+0x35c>
c0de7e38:	ebbb 0004 	subs.w	r0, fp, r4
c0de7e3c:	bf38      	it	cc
c0de7e3e:	2000      	movcc	r0, #0
c0de7e40:	eba0 0046 	sub.w	r0, r0, r6, lsl #1
c0de7e44:	f1b8 0f02 	cmp.w	r8, #2
c0de7e48:	d357      	bcc.n	c0de7efa <snprintf+0x392>
c0de7e4a:	780b      	ldrb	r3, [r1, #0]
c0de7e4c:	f1b8 0802 	subs.w	r8, r8, #2
c0de7e50:	ea4f 1713 	mov.w	r7, r3, lsr #4
c0de7e54:	5dd7      	ldrb	r7, [r2, r7]
c0de7e56:	f003 030f 	and.w	r3, r3, #15
c0de7e5a:	f88e 7000 	strb.w	r7, [lr]
c0de7e5e:	5cd3      	ldrb	r3, [r2, r3]
c0de7e60:	f88e 3001 	strb.w	r3, [lr, #1]
c0de7e64:	d049      	beq.n	c0de7efa <snprintf+0x392>
c0de7e66:	f10e 0e02 	add.w	lr, lr, #2
c0de7e6a:	3e01      	subs	r6, #1
c0de7e6c:	f101 0101 	add.w	r1, r1, #1
c0de7e70:	d1e8      	bne.n	c0de7e44 <snprintf+0x2dc>
c0de7e72:	4680      	mov	r8, r0
c0de7e74:	e026      	b.n	c0de7ec4 <snprintf+0x35c>
c0de7e76:	4546      	cmp	r6, r8
c0de7e78:	bf28      	it	cs
c0de7e7a:	4646      	movcs	r6, r8
c0de7e7c:	4670      	mov	r0, lr
c0de7e7e:	4632      	mov	r2, r6
c0de7e80:	4674      	mov	r4, lr
c0de7e82:	f000 fb18 	bl	c0de84b6 <__aeabi_memmove>
c0de7e86:	ebb8 0806 	subs.w	r8, r8, r6
c0de7e8a:	d036      	beq.n	c0de7efa <snprintf+0x392>
c0de7e8c:	46a6      	mov	lr, r4
c0de7e8e:	4637      	mov	r7, r6
c0de7e90:	45ba      	cmp	sl, r7
c0de7e92:	44b6      	add	lr, r6
c0de7e94:	d916      	bls.n	c0de7ec4 <snprintf+0x35c>
c0de7e96:	ebaa 0607 	sub.w	r6, sl, r7
c0de7e9a:	4546      	cmp	r6, r8
c0de7e9c:	bf28      	it	cs
c0de7e9e:	4646      	movcs	r6, r8
c0de7ea0:	4670      	mov	r0, lr
c0de7ea2:	4631      	mov	r1, r6
c0de7ea4:	2220      	movs	r2, #32
c0de7ea6:	4674      	mov	r4, lr
c0de7ea8:	f000 fb07 	bl	c0de84ba <__aeabi_memset>
c0de7eac:	e796      	b.n	c0de7ddc <snprintf+0x274>
c0de7eae:	9804      	ldr	r0, [sp, #16]
c0de7eb0:	f1b8 0801 	subs.w	r8, r8, #1
c0de7eb4:	f100 0104 	add.w	r1, r0, #4
c0de7eb8:	9104      	str	r1, [sp, #16]
c0de7eba:	6800      	ldr	r0, [r0, #0]
c0de7ebc:	f80e 0b01 	strb.w	r0, [lr], #1
c0de7ec0:	d01b      	beq.n	c0de7efa <snprintf+0x392>
c0de7ec2:	bf00      	nop
c0de7ec4:	f815 0d01 	ldrb.w	r0, [r5, #-1]!
c0de7ec8:	2800      	cmp	r0, #0
c0de7eca:	46c3      	mov	fp, r8
c0de7ecc:	f47f ae68 	bne.w	c0de7ba0 <snprintf+0x38>
c0de7ed0:	e013      	b.n	c0de7efa <snprintf+0x392>
c0de7ed2:	7808      	ldrb	r0, [r1, #0]
c0de7ed4:	2800      	cmp	r0, #0
c0de7ed6:	d1f5      	bne.n	c0de7ec4 <snprintf+0x35c>
c0de7ed8:	4546      	cmp	r6, r8
c0de7eda:	bf28      	it	cs
c0de7edc:	4646      	movcs	r6, r8
c0de7ede:	4670      	mov	r0, lr
c0de7ee0:	4631      	mov	r1, r6
c0de7ee2:	2220      	movs	r2, #32
c0de7ee4:	4674      	mov	r4, lr
c0de7ee6:	f000 fae8 	bl	c0de84ba <__aeabi_memset>
c0de7eea:	ebb8 0806 	subs.w	r8, r8, r6
c0de7eee:	d004      	beq.n	c0de7efa <snprintf+0x392>
c0de7ef0:	46a6      	mov	lr, r4
c0de7ef2:	e7cd      	b.n	c0de7e90 <snprintf+0x328>
c0de7ef4:	202a      	movs	r0, #42	@ 0x2a
c0de7ef6:	3d01      	subs	r5, #1
c0de7ef8:	e7e6      	b.n	c0de7ec8 <snprintf+0x360>
c0de7efa:	2000      	movs	r0, #0
c0de7efc:	b009      	add	sp, #36	@ 0x24
c0de7efe:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7f02:	b001      	add	sp, #4
c0de7f04:	4770      	bx	lr
	...

c0de7f08 <pic>:
c0de7f08:	490a      	ldr	r1, [pc, #40]	@ (c0de7f34 <pic+0x2c>)
c0de7f0a:	4281      	cmp	r1, r0
c0de7f0c:	490a      	ldr	r1, [pc, #40]	@ (c0de7f38 <pic+0x30>)
c0de7f0e:	d806      	bhi.n	c0de7f1e <pic+0x16>
c0de7f10:	4281      	cmp	r1, r0
c0de7f12:	d304      	bcc.n	c0de7f1e <pic+0x16>
c0de7f14:	b580      	push	{r7, lr}
c0de7f16:	f000 f815 	bl	c0de7f44 <pic_internal>
c0de7f1a:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de7f1e:	4907      	ldr	r1, [pc, #28]	@ (c0de7f3c <pic+0x34>)
c0de7f20:	4288      	cmp	r0, r1
c0de7f22:	4a07      	ldr	r2, [pc, #28]	@ (c0de7f40 <pic+0x38>)
c0de7f24:	d305      	bcc.n	c0de7f32 <pic+0x2a>
c0de7f26:	4290      	cmp	r0, r2
c0de7f28:	bf88      	it	hi
c0de7f2a:	4770      	bxhi	lr
c0de7f2c:	1a40      	subs	r0, r0, r1
c0de7f2e:	464a      	mov	r2, r9
c0de7f30:	4410      	add	r0, r2
c0de7f32:	4770      	bx	lr
c0de7f34:	c0de0000 	.word	0xc0de0000
c0de7f38:	c0deb83d 	.word	0xc0deb83d
c0de7f3c:	da7a0000 	.word	0xda7a0000
c0de7f40:	da7aa000 	.word	0xda7aa000

c0de7f44 <pic_internal>:
c0de7f44:	467a      	mov	r2, pc
c0de7f46:	4902      	ldr	r1, [pc, #8]	@ (c0de7f50 <pic_internal+0xc>)
c0de7f48:	1cc9      	adds	r1, r1, #3
c0de7f4a:	1a89      	subs	r1, r1, r2
c0de7f4c:	1a40      	subs	r0, r0, r1
c0de7f4e:	4770      	bx	lr
c0de7f50:	c0de7f45 	.word	0xc0de7f45

c0de7f54 <SVC_Call>:
c0de7f54:	df01      	svc	1
c0de7f56:	2900      	cmp	r1, #0
c0de7f58:	d100      	bne.n	c0de7f5c <exception>
c0de7f5a:	4770      	bx	lr

c0de7f5c <exception>:
c0de7f5c:	4608      	mov	r0, r1
c0de7f5e:	f7ff fdfc 	bl	c0de7b5a <os_longjmp>

c0de7f62 <SVC_cx_call>:
c0de7f62:	df01      	svc	1
c0de7f64:	4770      	bx	lr

c0de7f66 <nvm_write>:
c0de7f66:	b580      	push	{r7, lr}
c0de7f68:	b084      	sub	sp, #16
c0de7f6a:	ab01      	add	r3, sp, #4
c0de7f6c:	c307      	stmia	r3!, {r0, r1, r2}
c0de7f6e:	2003      	movs	r0, #3
c0de7f70:	f2c0 3000 	movt	r0, #768	@ 0x300
c0de7f74:	a901      	add	r1, sp, #4
c0de7f76:	f7ff ffed 	bl	c0de7f54 <SVC_Call>
c0de7f7a:	b004      	add	sp, #16
c0de7f7c:	bd80      	pop	{r7, pc}

c0de7f7e <cx_ecdomain_parameters_length>:
c0de7f7e:	b580      	push	{r7, lr}
c0de7f80:	b082      	sub	sp, #8
c0de7f82:	e9cd 0100 	strd	r0, r1, [sp]
c0de7f86:	f240 102f 	movw	r0, #303	@ 0x12f
c0de7f8a:	f2c0 2000 	movt	r0, #512	@ 0x200
c0de7f8e:	4669      	mov	r1, sp
c0de7f90:	f7ff ffe7 	bl	c0de7f62 <SVC_cx_call>
c0de7f94:	b002      	add	sp, #8
c0de7f96:	bd80      	pop	{r7, pc}

c0de7f98 <os_perso_isonboarded>:
c0de7f98:	b580      	push	{r7, lr}
c0de7f9a:	b082      	sub	sp, #8
c0de7f9c:	2000      	movs	r0, #0
c0de7f9e:	9001      	str	r0, [sp, #4]
c0de7fa0:	4669      	mov	r1, sp
c0de7fa2:	209f      	movs	r0, #159	@ 0x9f
c0de7fa4:	f7ff ffd6 	bl	c0de7f54 <SVC_Call>
c0de7fa8:	b2c0      	uxtb	r0, r0
c0de7faa:	b002      	add	sp, #8
c0de7fac:	bd80      	pop	{r7, pc}

c0de7fae <os_perso_derive_node_with_seed_key>:
c0de7fae:	b5b0      	push	{r4, r5, r7, lr}
c0de7fb0:	b088      	sub	sp, #32
c0de7fb2:	e9dd ec0e 	ldrd	lr, ip, [sp, #56]	@ 0x38
c0de7fb6:	e9dd 540c 	ldrd	r5, r4, [sp, #48]	@ 0x30
c0de7fba:	e88d 002f 	stmia.w	sp, {r0, r1, r2, r3, r5}
c0de7fbe:	20a6      	movs	r0, #166	@ 0xa6
c0de7fc0:	f6c0 0000 	movt	r0, #2048	@ 0x800
c0de7fc4:	4669      	mov	r1, sp
c0de7fc6:	e9cd 4e05 	strd	r4, lr, [sp, #20]
c0de7fca:	f8cd c01c 	str.w	ip, [sp, #28]
c0de7fce:	f7ff ffc1 	bl	c0de7f54 <SVC_Call>
c0de7fd2:	b008      	add	sp, #32
c0de7fd4:	bdb0      	pop	{r4, r5, r7, pc}

c0de7fd6 <os_pki_load_certificate>:
c0de7fd6:	b580      	push	{r7, lr}
c0de7fd8:	b086      	sub	sp, #24
c0de7fda:	e9dd ec08 	ldrd	lr, ip, [sp, #32]
c0de7fde:	e88d 400f 	stmia.w	sp, {r0, r1, r2, r3, lr}
c0de7fe2:	20aa      	movs	r0, #170	@ 0xaa
c0de7fe4:	f2c0 6000 	movt	r0, #1536	@ 0x600
c0de7fe8:	4669      	mov	r1, sp
c0de7fea:	f8cd c014 	str.w	ip, [sp, #20]
c0de7fee:	f7ff ffb1 	bl	c0de7f54 <SVC_Call>
c0de7ff2:	b006      	add	sp, #24
c0de7ff4:	bd80      	pop	{r7, pc}

c0de7ff6 <os_perso_is_pin_set>:
c0de7ff6:	b580      	push	{r7, lr}
c0de7ff8:	b082      	sub	sp, #8
c0de7ffa:	2000      	movs	r0, #0
c0de7ffc:	9001      	str	r0, [sp, #4]
c0de7ffe:	4669      	mov	r1, sp
c0de8000:	209e      	movs	r0, #158	@ 0x9e
c0de8002:	f7ff ffa7 	bl	c0de7f54 <SVC_Call>
c0de8006:	b2c0      	uxtb	r0, r0
c0de8008:	b002      	add	sp, #8
c0de800a:	bd80      	pop	{r7, pc}

c0de800c <os_global_pin_is_validated>:
c0de800c:	b580      	push	{r7, lr}
c0de800e:	b082      	sub	sp, #8
c0de8010:	2000      	movs	r0, #0
c0de8012:	9001      	str	r0, [sp, #4]
c0de8014:	4669      	mov	r1, sp
c0de8016:	20a0      	movs	r0, #160	@ 0xa0
c0de8018:	f7ff ff9c 	bl	c0de7f54 <SVC_Call>
c0de801c:	b2c0      	uxtb	r0, r0
c0de801e:	b002      	add	sp, #8
c0de8020:	bd80      	pop	{r7, pc}

c0de8022 <os_ux>:
c0de8022:	b580      	push	{r7, lr}
c0de8024:	b082      	sub	sp, #8
c0de8026:	9000      	str	r0, [sp, #0]
c0de8028:	2000      	movs	r0, #0
c0de802a:	9001      	str	r0, [sp, #4]
c0de802c:	2064      	movs	r0, #100	@ 0x64
c0de802e:	f2c0 1000 	movt	r0, #256	@ 0x100
c0de8032:	4669      	mov	r1, sp
c0de8034:	f7ff ff8e 	bl	c0de7f54 <SVC_Call>
c0de8038:	b002      	add	sp, #8
c0de803a:	bd80      	pop	{r7, pc}

c0de803c <os_flags>:
c0de803c:	b580      	push	{r7, lr}
c0de803e:	b082      	sub	sp, #8
c0de8040:	2000      	movs	r0, #0
c0de8042:	9001      	str	r0, [sp, #4]
c0de8044:	4669      	mov	r1, sp
c0de8046:	206a      	movs	r0, #106	@ 0x6a
c0de8048:	f7ff ff84 	bl	c0de7f54 <SVC_Call>
c0de804c:	b002      	add	sp, #8
c0de804e:	bd80      	pop	{r7, pc}

c0de8050 <os_registry_get_current_app_tag>:
c0de8050:	b580      	push	{r7, lr}
c0de8052:	b084      	sub	sp, #16
c0de8054:	ab01      	add	r3, sp, #4
c0de8056:	c307      	stmia	r3!, {r0, r1, r2}
c0de8058:	2074      	movs	r0, #116	@ 0x74
c0de805a:	f2c0 3000 	movt	r0, #768	@ 0x300
c0de805e:	a901      	add	r1, sp, #4
c0de8060:	f7ff ff78 	bl	c0de7f54 <SVC_Call>
c0de8064:	b004      	add	sp, #16
c0de8066:	bd80      	pop	{r7, pc}

c0de8068 <os_sched_exit>:
c0de8068:	b082      	sub	sp, #8
c0de806a:	9000      	str	r0, [sp, #0]
c0de806c:	2000      	movs	r0, #0
c0de806e:	9001      	str	r0, [sp, #4]
c0de8070:	209a      	movs	r0, #154	@ 0x9a
c0de8072:	f2c0 1000 	movt	r0, #256	@ 0x100
c0de8076:	4669      	mov	r1, sp
c0de8078:	f7ff ff6c 	bl	c0de7f54 <SVC_Call>
c0de807c:	deff      	udf	#255	@ 0xff

c0de807e <os_io_init>:
c0de807e:	b580      	push	{r7, lr}
c0de8080:	b082      	sub	sp, #8
c0de8082:	9001      	str	r0, [sp, #4]
c0de8084:	2084      	movs	r0, #132	@ 0x84
c0de8086:	f2c0 1000 	movt	r0, #256	@ 0x100
c0de808a:	a901      	add	r1, sp, #4
c0de808c:	f7ff ff62 	bl	c0de7f54 <SVC_Call>
c0de8090:	b002      	add	sp, #8
c0de8092:	bd80      	pop	{r7, pc}

c0de8094 <os_io_start>:
c0de8094:	b580      	push	{r7, lr}
c0de8096:	b082      	sub	sp, #8
c0de8098:	2000      	movs	r0, #0
c0de809a:	9001      	str	r0, [sp, #4]
c0de809c:	2085      	movs	r0, #133	@ 0x85
c0de809e:	f2c0 1000 	movt	r0, #256	@ 0x100
c0de80a2:	4669      	mov	r1, sp
c0de80a4:	f7ff ff56 	bl	c0de7f54 <SVC_Call>
c0de80a8:	b002      	add	sp, #8
c0de80aa:	bd80      	pop	{r7, pc}

c0de80ac <os_io_tx_cmd>:
c0de80ac:	b580      	push	{r7, lr}
c0de80ae:	b084      	sub	sp, #16
c0de80b0:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de80b4:	2088      	movs	r0, #136	@ 0x88
c0de80b6:	f2c0 4000 	movt	r0, #1024	@ 0x400
c0de80ba:	4669      	mov	r1, sp
c0de80bc:	f7ff ff4a 	bl	c0de7f54 <SVC_Call>
c0de80c0:	b004      	add	sp, #16
c0de80c2:	bd80      	pop	{r7, pc}

c0de80c4 <os_io_rx_evt>:
c0de80c4:	b580      	push	{r7, lr}
c0de80c6:	b084      	sub	sp, #16
c0de80c8:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de80cc:	2089      	movs	r0, #137	@ 0x89
c0de80ce:	f2c0 3000 	movt	r0, #768	@ 0x300
c0de80d2:	4669      	mov	r1, sp
c0de80d4:	f7ff ff3e 	bl	c0de7f54 <SVC_Call>
c0de80d8:	b004      	add	sp, #16
c0de80da:	bd80      	pop	{r7, pc}

c0de80dc <try_context_get>:
c0de80dc:	b580      	push	{r7, lr}
c0de80de:	b082      	sub	sp, #8
c0de80e0:	2000      	movs	r0, #0
c0de80e2:	9001      	str	r0, [sp, #4]
c0de80e4:	4669      	mov	r1, sp
c0de80e6:	2087      	movs	r0, #135	@ 0x87
c0de80e8:	f7ff ff34 	bl	c0de7f54 <SVC_Call>
c0de80ec:	b002      	add	sp, #8
c0de80ee:	bd80      	pop	{r7, pc}

c0de80f0 <try_context_set>:
c0de80f0:	b580      	push	{r7, lr}
c0de80f2:	b082      	sub	sp, #8
c0de80f4:	9000      	str	r0, [sp, #0]
c0de80f6:	2000      	movs	r0, #0
c0de80f8:	9001      	str	r0, [sp, #4]
c0de80fa:	f240 100b 	movw	r0, #267	@ 0x10b
c0de80fe:	f2c0 1000 	movt	r0, #256	@ 0x100
c0de8102:	4669      	mov	r1, sp
c0de8104:	f7ff ff26 	bl	c0de7f54 <SVC_Call>
c0de8108:	b002      	add	sp, #8
c0de810a:	bd80      	pop	{r7, pc}

c0de810c <os_sched_last_status>:
c0de810c:	b580      	push	{r7, lr}
c0de810e:	b082      	sub	sp, #8
c0de8110:	9000      	str	r0, [sp, #0]
c0de8112:	2000      	movs	r0, #0
c0de8114:	9001      	str	r0, [sp, #4]
c0de8116:	209c      	movs	r0, #156	@ 0x9c
c0de8118:	f2c0 1000 	movt	r0, #256	@ 0x100
c0de811c:	4669      	mov	r1, sp
c0de811e:	f7ff ff19 	bl	c0de7f54 <SVC_Call>
c0de8122:	b2c0      	uxtb	r0, r0
c0de8124:	b002      	add	sp, #8
c0de8126:	bd80      	pop	{r7, pc}

c0de8128 <screen_update>:
c0de8128:	b580      	push	{r7, lr}
c0de812a:	b082      	sub	sp, #8
c0de812c:	2000      	movs	r0, #0
c0de812e:	9001      	str	r0, [sp, #4]
c0de8130:	4669      	mov	r1, sp
c0de8132:	207a      	movs	r0, #122	@ 0x7a
c0de8134:	f7ff ff0e 	bl	c0de7f54 <SVC_Call>
c0de8138:	b002      	add	sp, #8
c0de813a:	bd80      	pop	{r7, pc}

c0de813c <bagl_hal_draw_bitmap_within_rect>:
c0de813c:	b570      	push	{r4, r5, r6, lr}
c0de813e:	b08a      	sub	sp, #40	@ 0x28
c0de8140:	f8dd c048 	ldr.w	ip, [sp, #72]	@ 0x48
c0de8144:	e9dd 4e10 	ldrd	r4, lr, [sp, #64]	@ 0x40
c0de8148:	e9dd 650e 	ldrd	r6, r5, [sp, #56]	@ 0x38
c0de814c:	9001      	str	r0, [sp, #4]
c0de814e:	207c      	movs	r0, #124	@ 0x7c
c0de8150:	9102      	str	r1, [sp, #8]
c0de8152:	f6c0 1000 	movt	r0, #2304	@ 0x900
c0de8156:	a901      	add	r1, sp, #4
c0de8158:	9203      	str	r2, [sp, #12]
c0de815a:	9304      	str	r3, [sp, #16]
c0de815c:	9605      	str	r6, [sp, #20]
c0de815e:	e9cd 5406 	strd	r5, r4, [sp, #24]
c0de8162:	e9cd ec08 	strd	lr, ip, [sp, #32]
c0de8166:	f7ff fef5 	bl	c0de7f54 <SVC_Call>
c0de816a:	b00a      	add	sp, #40	@ 0x28
c0de816c:	bd70      	pop	{r4, r5, r6, pc}

c0de816e <bagl_hal_draw_rect>:
c0de816e:	b580      	push	{r7, lr}
c0de8170:	b086      	sub	sp, #24
c0de8172:	f10d 0e04 	add.w	lr, sp, #4
c0de8176:	f8dd c020 	ldr.w	ip, [sp, #32]
c0de817a:	e88e 100f 	stmia.w	lr, {r0, r1, r2, r3, ip}
c0de817e:	207d      	movs	r0, #125	@ 0x7d
c0de8180:	f2c0 5000 	movt	r0, #1280	@ 0x500
c0de8184:	a901      	add	r1, sp, #4
c0de8186:	f7ff fee5 	bl	c0de7f54 <SVC_Call>
c0de818a:	b006      	add	sp, #24
c0de818c:	bd80      	pop	{r7, pc}
	...

c0de8190 <__aeabi_uldivmod>:
c0de8190:	b953      	cbnz	r3, c0de81a8 <__aeabi_uldivmod+0x18>
c0de8192:	b94a      	cbnz	r2, c0de81a8 <__aeabi_uldivmod+0x18>
c0de8194:	2900      	cmp	r1, #0
c0de8196:	bf08      	it	eq
c0de8198:	2800      	cmpeq	r0, #0
c0de819a:	bf1c      	itt	ne
c0de819c:	f04f 31ff 	movne.w	r1, #4294967295	@ 0xffffffff
c0de81a0:	f04f 30ff 	movne.w	r0, #4294967295	@ 0xffffffff
c0de81a4:	f000 b80c 	b.w	c0de81c0 <__aeabi_idiv0>
c0de81a8:	f1ad 0c08 	sub.w	ip, sp, #8
c0de81ac:	e96d ce04 	strd	ip, lr, [sp, #-16]!
c0de81b0:	f000 f808 	bl	c0de81c4 <__udivmoddi4>
c0de81b4:	f8dd e004 	ldr.w	lr, [sp, #4]
c0de81b8:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
c0de81bc:	b004      	add	sp, #16
c0de81be:	4770      	bx	lr

c0de81c0 <__aeabi_idiv0>:
c0de81c0:	4770      	bx	lr
c0de81c2:	bf00      	nop

c0de81c4 <__udivmoddi4>:
c0de81c4:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
c0de81c8:	9e09      	ldr	r6, [sp, #36]	@ 0x24
c0de81ca:	460d      	mov	r5, r1
c0de81cc:	4604      	mov	r4, r0
c0de81ce:	460f      	mov	r7, r1
c0de81d0:	2b00      	cmp	r3, #0
c0de81d2:	d147      	bne.n	c0de8264 <__udivmoddi4+0xa0>
c0de81d4:	428a      	cmp	r2, r1
c0de81d6:	4694      	mov	ip, r2
c0de81d8:	d95f      	bls.n	c0de829a <__udivmoddi4+0xd6>
c0de81da:	fab2 f382 	clz	r3, r2
c0de81de:	b143      	cbz	r3, c0de81f2 <__udivmoddi4+0x2e>
c0de81e0:	f1c3 0120 	rsb	r1, r3, #32
c0de81e4:	409f      	lsls	r7, r3
c0de81e6:	fa02 fc03 	lsl.w	ip, r2, r3
c0de81ea:	409c      	lsls	r4, r3
c0de81ec:	fa20 f101 	lsr.w	r1, r0, r1
c0de81f0:	430f      	orrs	r7, r1
c0de81f2:	ea4f 451c 	mov.w	r5, ip, lsr #16
c0de81f6:	fa1f fe8c 	uxth.w	lr, ip
c0de81fa:	0c22      	lsrs	r2, r4, #16
c0de81fc:	fbb7 f1f5 	udiv	r1, r7, r5
c0de8200:	fb05 7711 	mls	r7, r5, r1, r7
c0de8204:	fb01 f00e 	mul.w	r0, r1, lr
c0de8208:	ea42 4207 	orr.w	r2, r2, r7, lsl #16
c0de820c:	4290      	cmp	r0, r2
c0de820e:	d908      	bls.n	c0de8222 <__udivmoddi4+0x5e>
c0de8210:	eb1c 0202 	adds.w	r2, ip, r2
c0de8214:	f101 37ff 	add.w	r7, r1, #4294967295	@ 0xffffffff
c0de8218:	d202      	bcs.n	c0de8220 <__udivmoddi4+0x5c>
c0de821a:	4290      	cmp	r0, r2
c0de821c:	f200 8134 	bhi.w	c0de8488 <__udivmoddi4+0x2c4>
c0de8220:	4639      	mov	r1, r7
c0de8222:	1a12      	subs	r2, r2, r0
c0de8224:	b2a4      	uxth	r4, r4
c0de8226:	fbb2 f0f5 	udiv	r0, r2, r5
c0de822a:	fb05 2210 	mls	r2, r5, r0, r2
c0de822e:	fb00 fe0e 	mul.w	lr, r0, lr
c0de8232:	ea44 4402 	orr.w	r4, r4, r2, lsl #16
c0de8236:	45a6      	cmp	lr, r4
c0de8238:	d908      	bls.n	c0de824c <__udivmoddi4+0x88>
c0de823a:	eb1c 0404 	adds.w	r4, ip, r4
c0de823e:	f100 32ff 	add.w	r2, r0, #4294967295	@ 0xffffffff
c0de8242:	d202      	bcs.n	c0de824a <__udivmoddi4+0x86>
c0de8244:	45a6      	cmp	lr, r4
c0de8246:	f200 8119 	bhi.w	c0de847c <__udivmoddi4+0x2b8>
c0de824a:	4610      	mov	r0, r2
c0de824c:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de8250:	eba4 040e 	sub.w	r4, r4, lr
c0de8254:	2100      	movs	r1, #0
c0de8256:	b11e      	cbz	r6, c0de8260 <__udivmoddi4+0x9c>
c0de8258:	40dc      	lsrs	r4, r3
c0de825a:	2300      	movs	r3, #0
c0de825c:	e9c6 4300 	strd	r4, r3, [r6]
c0de8260:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
c0de8264:	428b      	cmp	r3, r1
c0de8266:	d908      	bls.n	c0de827a <__udivmoddi4+0xb6>
c0de8268:	2e00      	cmp	r6, #0
c0de826a:	f000 80fb 	beq.w	c0de8464 <__udivmoddi4+0x2a0>
c0de826e:	2100      	movs	r1, #0
c0de8270:	e9c6 0500 	strd	r0, r5, [r6]
c0de8274:	4608      	mov	r0, r1
c0de8276:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
c0de827a:	fab3 f183 	clz	r1, r3
c0de827e:	2900      	cmp	r1, #0
c0de8280:	d14b      	bne.n	c0de831a <__udivmoddi4+0x156>
c0de8282:	42ab      	cmp	r3, r5
c0de8284:	f0c0 80f1 	bcc.w	c0de846a <__udivmoddi4+0x2a6>
c0de8288:	4282      	cmp	r2, r0
c0de828a:	f240 80ee 	bls.w	c0de846a <__udivmoddi4+0x2a6>
c0de828e:	4608      	mov	r0, r1
c0de8290:	2e00      	cmp	r6, #0
c0de8292:	d0e5      	beq.n	c0de8260 <__udivmoddi4+0x9c>
c0de8294:	e9c6 4700 	strd	r4, r7, [r6]
c0de8298:	e7e2      	b.n	c0de8260 <__udivmoddi4+0x9c>
c0de829a:	b902      	cbnz	r2, c0de829e <__udivmoddi4+0xda>
c0de829c:	deff      	udf	#255	@ 0xff
c0de829e:	fab2 f382 	clz	r3, r2
c0de82a2:	2b00      	cmp	r3, #0
c0de82a4:	f040 809d 	bne.w	c0de83e2 <__udivmoddi4+0x21e>
c0de82a8:	1a8d      	subs	r5, r1, r2
c0de82aa:	ea4f 4e12 	mov.w	lr, r2, lsr #16
c0de82ae:	b297      	uxth	r7, r2
c0de82b0:	2101      	movs	r1, #1
c0de82b2:	fbb5 f2fe 	udiv	r2, r5, lr
c0de82b6:	fb0e 5012 	mls	r0, lr, r2, r5
c0de82ba:	0c25      	lsrs	r5, r4, #16
c0de82bc:	ea45 4500 	orr.w	r5, r5, r0, lsl #16
c0de82c0:	fb07 f002 	mul.w	r0, r7, r2
c0de82c4:	42a8      	cmp	r0, r5
c0de82c6:	d90f      	bls.n	c0de82e8 <__udivmoddi4+0x124>
c0de82c8:	eb1c 0505 	adds.w	r5, ip, r5
c0de82cc:	f102 38ff 	add.w	r8, r2, #4294967295	@ 0xffffffff
c0de82d0:	bf2c      	ite	cs
c0de82d2:	f04f 0901 	movcs.w	r9, #1
c0de82d6:	f04f 0900 	movcc.w	r9, #0
c0de82da:	42a8      	cmp	r0, r5
c0de82dc:	d903      	bls.n	c0de82e6 <__udivmoddi4+0x122>
c0de82de:	f1b9 0f00 	cmp.w	r9, #0
c0de82e2:	f000 80ce 	beq.w	c0de8482 <__udivmoddi4+0x2be>
c0de82e6:	4642      	mov	r2, r8
c0de82e8:	1a2d      	subs	r5, r5, r0
c0de82ea:	b2a4      	uxth	r4, r4
c0de82ec:	fbb5 f0fe 	udiv	r0, r5, lr
c0de82f0:	fb0e 5510 	mls	r5, lr, r0, r5
c0de82f4:	fb00 f707 	mul.w	r7, r0, r7
c0de82f8:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de82fc:	42a7      	cmp	r7, r4
c0de82fe:	d908      	bls.n	c0de8312 <__udivmoddi4+0x14e>
c0de8300:	eb1c 0404 	adds.w	r4, ip, r4
c0de8304:	f100 35ff 	add.w	r5, r0, #4294967295	@ 0xffffffff
c0de8308:	d202      	bcs.n	c0de8310 <__udivmoddi4+0x14c>
c0de830a:	42a7      	cmp	r7, r4
c0de830c:	f200 80b3 	bhi.w	c0de8476 <__udivmoddi4+0x2b2>
c0de8310:	4628      	mov	r0, r5
c0de8312:	1be4      	subs	r4, r4, r7
c0de8314:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de8318:	e79d      	b.n	c0de8256 <__udivmoddi4+0x92>
c0de831a:	f1c1 0720 	rsb	r7, r1, #32
c0de831e:	408b      	lsls	r3, r1
c0de8320:	fa05 f401 	lsl.w	r4, r5, r1
c0de8324:	fa22 fc07 	lsr.w	ip, r2, r7
c0de8328:	40fd      	lsrs	r5, r7
c0de832a:	408a      	lsls	r2, r1
c0de832c:	ea4c 0c03 	orr.w	ip, ip, r3
c0de8330:	fa20 f307 	lsr.w	r3, r0, r7
c0de8334:	ea4f 491c 	mov.w	r9, ip, lsr #16
c0de8338:	431c      	orrs	r4, r3
c0de833a:	fa1f fe8c 	uxth.w	lr, ip
c0de833e:	fa00 f301 	lsl.w	r3, r0, r1
c0de8342:	0c20      	lsrs	r0, r4, #16
c0de8344:	fbb5 f8f9 	udiv	r8, r5, r9
c0de8348:	fb09 5518 	mls	r5, r9, r8, r5
c0de834c:	ea40 4505 	orr.w	r5, r0, r5, lsl #16
c0de8350:	fb08 f00e 	mul.w	r0, r8, lr
c0de8354:	42a8      	cmp	r0, r5
c0de8356:	d90f      	bls.n	c0de8378 <__udivmoddi4+0x1b4>
c0de8358:	eb1c 0505 	adds.w	r5, ip, r5
c0de835c:	f108 3aff 	add.w	sl, r8, #4294967295	@ 0xffffffff
c0de8360:	bf2c      	ite	cs
c0de8362:	f04f 0b01 	movcs.w	fp, #1
c0de8366:	f04f 0b00 	movcc.w	fp, #0
c0de836a:	42a8      	cmp	r0, r5
c0de836c:	d903      	bls.n	c0de8376 <__udivmoddi4+0x1b2>
c0de836e:	f1bb 0f00 	cmp.w	fp, #0
c0de8372:	f000 808c 	beq.w	c0de848e <__udivmoddi4+0x2ca>
c0de8376:	46d0      	mov	r8, sl
c0de8378:	1a2d      	subs	r5, r5, r0
c0de837a:	b2a4      	uxth	r4, r4
c0de837c:	fbb5 f0f9 	udiv	r0, r5, r9
c0de8380:	fb09 5510 	mls	r5, r9, r0, r5
c0de8384:	fb00 fe0e 	mul.w	lr, r0, lr
c0de8388:	ea44 4505 	orr.w	r5, r4, r5, lsl #16
c0de838c:	45ae      	cmp	lr, r5
c0de838e:	d907      	bls.n	c0de83a0 <__udivmoddi4+0x1dc>
c0de8390:	eb1c 0505 	adds.w	r5, ip, r5
c0de8394:	f100 34ff 	add.w	r4, r0, #4294967295	@ 0xffffffff
c0de8398:	d201      	bcs.n	c0de839e <__udivmoddi4+0x1da>
c0de839a:	45ae      	cmp	lr, r5
c0de839c:	d87e      	bhi.n	c0de849c <__udivmoddi4+0x2d8>
c0de839e:	4620      	mov	r0, r4
c0de83a0:	ea40 4008 	orr.w	r0, r0, r8, lsl #16
c0de83a4:	eba5 050e 	sub.w	r5, r5, lr
c0de83a8:	fba0 9802 	umull	r9, r8, r0, r2
c0de83ac:	4545      	cmp	r5, r8
c0de83ae:	464c      	mov	r4, r9
c0de83b0:	46c6      	mov	lr, r8
c0de83b2:	d302      	bcc.n	c0de83ba <__udivmoddi4+0x1f6>
c0de83b4:	d106      	bne.n	c0de83c4 <__udivmoddi4+0x200>
c0de83b6:	454b      	cmp	r3, r9
c0de83b8:	d204      	bcs.n	c0de83c4 <__udivmoddi4+0x200>
c0de83ba:	3801      	subs	r0, #1
c0de83bc:	ebb9 0402 	subs.w	r4, r9, r2
c0de83c0:	eb68 0e0c 	sbc.w	lr, r8, ip
c0de83c4:	2e00      	cmp	r6, #0
c0de83c6:	d06f      	beq.n	c0de84a8 <__udivmoddi4+0x2e4>
c0de83c8:	1b1a      	subs	r2, r3, r4
c0de83ca:	eb65 050e 	sbc.w	r5, r5, lr
c0de83ce:	fa22 f301 	lsr.w	r3, r2, r1
c0de83d2:	fa05 f707 	lsl.w	r7, r5, r7
c0de83d6:	40cd      	lsrs	r5, r1
c0de83d8:	2100      	movs	r1, #0
c0de83da:	431f      	orrs	r7, r3
c0de83dc:	e9c6 7500 	strd	r7, r5, [r6]
c0de83e0:	e73e      	b.n	c0de8260 <__udivmoddi4+0x9c>
c0de83e2:	fa02 fc03 	lsl.w	ip, r2, r3
c0de83e6:	f1c3 0020 	rsb	r0, r3, #32
c0de83ea:	fa01 f203 	lsl.w	r2, r1, r3
c0de83ee:	ea4f 4e1c 	mov.w	lr, ip, lsr #16
c0de83f2:	40c1      	lsrs	r1, r0
c0de83f4:	fa24 f500 	lsr.w	r5, r4, r0
c0de83f8:	fa1f f78c 	uxth.w	r7, ip
c0de83fc:	409c      	lsls	r4, r3
c0de83fe:	4315      	orrs	r5, r2
c0de8400:	fbb1 f0fe 	udiv	r0, r1, lr
c0de8404:	0c2a      	lsrs	r2, r5, #16
c0de8406:	fb0e 1110 	mls	r1, lr, r0, r1
c0de840a:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de840e:	fb00 f107 	mul.w	r1, r0, r7
c0de8412:	4291      	cmp	r1, r2
c0de8414:	d90e      	bls.n	c0de8434 <__udivmoddi4+0x270>
c0de8416:	eb1c 0202 	adds.w	r2, ip, r2
c0de841a:	f100 38ff 	add.w	r8, r0, #4294967295	@ 0xffffffff
c0de841e:	bf2c      	ite	cs
c0de8420:	f04f 0901 	movcs.w	r9, #1
c0de8424:	f04f 0900 	movcc.w	r9, #0
c0de8428:	4291      	cmp	r1, r2
c0de842a:	d902      	bls.n	c0de8432 <__udivmoddi4+0x26e>
c0de842c:	f1b9 0f00 	cmp.w	r9, #0
c0de8430:	d031      	beq.n	c0de8496 <__udivmoddi4+0x2d2>
c0de8432:	4640      	mov	r0, r8
c0de8434:	1a52      	subs	r2, r2, r1
c0de8436:	b2ad      	uxth	r5, r5
c0de8438:	fbb2 f1fe 	udiv	r1, r2, lr
c0de843c:	fb0e 2211 	mls	r2, lr, r1, r2
c0de8440:	ea45 4502 	orr.w	r5, r5, r2, lsl #16
c0de8444:	fb01 f207 	mul.w	r2, r1, r7
c0de8448:	42aa      	cmp	r2, r5
c0de844a:	d907      	bls.n	c0de845c <__udivmoddi4+0x298>
c0de844c:	eb1c 0505 	adds.w	r5, ip, r5
c0de8450:	f101 38ff 	add.w	r8, r1, #4294967295	@ 0xffffffff
c0de8454:	d201      	bcs.n	c0de845a <__udivmoddi4+0x296>
c0de8456:	42aa      	cmp	r2, r5
c0de8458:	d823      	bhi.n	c0de84a2 <__udivmoddi4+0x2de>
c0de845a:	4641      	mov	r1, r8
c0de845c:	1aad      	subs	r5, r5, r2
c0de845e:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de8462:	e726      	b.n	c0de82b2 <__udivmoddi4+0xee>
c0de8464:	4631      	mov	r1, r6
c0de8466:	4630      	mov	r0, r6
c0de8468:	e6fa      	b.n	c0de8260 <__udivmoddi4+0x9c>
c0de846a:	1a84      	subs	r4, r0, r2
c0de846c:	eb65 0303 	sbc.w	r3, r5, r3
c0de8470:	2001      	movs	r0, #1
c0de8472:	461f      	mov	r7, r3
c0de8474:	e70c      	b.n	c0de8290 <__udivmoddi4+0xcc>
c0de8476:	4464      	add	r4, ip
c0de8478:	3802      	subs	r0, #2
c0de847a:	e74a      	b.n	c0de8312 <__udivmoddi4+0x14e>
c0de847c:	4464      	add	r4, ip
c0de847e:	3802      	subs	r0, #2
c0de8480:	e6e4      	b.n	c0de824c <__udivmoddi4+0x88>
c0de8482:	3a02      	subs	r2, #2
c0de8484:	4465      	add	r5, ip
c0de8486:	e72f      	b.n	c0de82e8 <__udivmoddi4+0x124>
c0de8488:	3902      	subs	r1, #2
c0de848a:	4462      	add	r2, ip
c0de848c:	e6c9      	b.n	c0de8222 <__udivmoddi4+0x5e>
c0de848e:	f1a8 0802 	sub.w	r8, r8, #2
c0de8492:	4465      	add	r5, ip
c0de8494:	e770      	b.n	c0de8378 <__udivmoddi4+0x1b4>
c0de8496:	3802      	subs	r0, #2
c0de8498:	4462      	add	r2, ip
c0de849a:	e7cb      	b.n	c0de8434 <__udivmoddi4+0x270>
c0de849c:	3802      	subs	r0, #2
c0de849e:	4465      	add	r5, ip
c0de84a0:	e77e      	b.n	c0de83a0 <__udivmoddi4+0x1dc>
c0de84a2:	3902      	subs	r1, #2
c0de84a4:	4465      	add	r5, ip
c0de84a6:	e7d9      	b.n	c0de845c <__udivmoddi4+0x298>
c0de84a8:	4631      	mov	r1, r6
c0de84aa:	e6d9      	b.n	c0de8260 <__udivmoddi4+0x9c>

c0de84ac <__aeabi_memclr>:
c0de84ac:	2200      	movs	r2, #0
c0de84ae:	f000 b804 	b.w	c0de84ba <__aeabi_memset>

c0de84b2 <__aeabi_memcpy>:
c0de84b2:	f000 b81d 	b.w	c0de84f0 <memcpy>

c0de84b6 <__aeabi_memmove>:
c0de84b6:	f000 b829 	b.w	c0de850c <memmove>

c0de84ba <__aeabi_memset>:
c0de84ba:	4613      	mov	r3, r2
c0de84bc:	460a      	mov	r2, r1
c0de84be:	4619      	mov	r1, r3
c0de84c0:	f000 b83e 	b.w	c0de8540 <memset>

c0de84c4 <explicit_bzero>:
c0de84c4:	f000 b800 	b.w	c0de84c8 <bzero>

c0de84c8 <bzero>:
c0de84c8:	460a      	mov	r2, r1
c0de84ca:	2100      	movs	r1, #0
c0de84cc:	f000 b838 	b.w	c0de8540 <memset>

c0de84d0 <memcmp>:
c0de84d0:	b510      	push	{r4, lr}
c0de84d2:	3901      	subs	r1, #1
c0de84d4:	4402      	add	r2, r0
c0de84d6:	4290      	cmp	r0, r2
c0de84d8:	d101      	bne.n	c0de84de <memcmp+0xe>
c0de84da:	2000      	movs	r0, #0
c0de84dc:	e005      	b.n	c0de84ea <memcmp+0x1a>
c0de84de:	7803      	ldrb	r3, [r0, #0]
c0de84e0:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0de84e4:	42a3      	cmp	r3, r4
c0de84e6:	d001      	beq.n	c0de84ec <memcmp+0x1c>
c0de84e8:	1b18      	subs	r0, r3, r4
c0de84ea:	bd10      	pop	{r4, pc}
c0de84ec:	3001      	adds	r0, #1
c0de84ee:	e7f2      	b.n	c0de84d6 <memcmp+0x6>

c0de84f0 <memcpy>:
c0de84f0:	440a      	add	r2, r1
c0de84f2:	4291      	cmp	r1, r2
c0de84f4:	f100 33ff 	add.w	r3, r0, #4294967295	@ 0xffffffff
c0de84f8:	d100      	bne.n	c0de84fc <memcpy+0xc>
c0de84fa:	4770      	bx	lr
c0de84fc:	b510      	push	{r4, lr}
c0de84fe:	f811 4b01 	ldrb.w	r4, [r1], #1
c0de8502:	4291      	cmp	r1, r2
c0de8504:	f803 4f01 	strb.w	r4, [r3, #1]!
c0de8508:	d1f9      	bne.n	c0de84fe <memcpy+0xe>
c0de850a:	bd10      	pop	{r4, pc}

c0de850c <memmove>:
c0de850c:	4288      	cmp	r0, r1
c0de850e:	b510      	push	{r4, lr}
c0de8510:	eb01 0402 	add.w	r4, r1, r2
c0de8514:	d902      	bls.n	c0de851c <memmove+0x10>
c0de8516:	4284      	cmp	r4, r0
c0de8518:	4623      	mov	r3, r4
c0de851a:	d807      	bhi.n	c0de852c <memmove+0x20>
c0de851c:	1e43      	subs	r3, r0, #1
c0de851e:	42a1      	cmp	r1, r4
c0de8520:	d008      	beq.n	c0de8534 <memmove+0x28>
c0de8522:	f811 2b01 	ldrb.w	r2, [r1], #1
c0de8526:	f803 2f01 	strb.w	r2, [r3, #1]!
c0de852a:	e7f8      	b.n	c0de851e <memmove+0x12>
c0de852c:	4601      	mov	r1, r0
c0de852e:	4402      	add	r2, r0
c0de8530:	428a      	cmp	r2, r1
c0de8532:	d100      	bne.n	c0de8536 <memmove+0x2a>
c0de8534:	bd10      	pop	{r4, pc}
c0de8536:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
c0de853a:	f802 4d01 	strb.w	r4, [r2, #-1]!
c0de853e:	e7f7      	b.n	c0de8530 <memmove+0x24>

c0de8540 <memset>:
c0de8540:	4603      	mov	r3, r0
c0de8542:	4402      	add	r2, r0
c0de8544:	4293      	cmp	r3, r2
c0de8546:	d100      	bne.n	c0de854a <memset+0xa>
c0de8548:	4770      	bx	lr
c0de854a:	f803 1b01 	strb.w	r1, [r3], #1
c0de854e:	e7f9      	b.n	c0de8544 <memset+0x4>

c0de8550 <setjmp>:
c0de8550:	46ec      	mov	ip, sp
c0de8552:	e8a0 5ff0 	stmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0de8556:	f04f 0000 	mov.w	r0, #0
c0de855a:	4770      	bx	lr

c0de855c <longjmp>:
c0de855c:	e8b0 5ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0de8560:	46e5      	mov	sp, ip
c0de8562:	0008      	movs	r0, r1
c0de8564:	bf08      	it	eq
c0de8566:	2001      	moveq	r0, #1
c0de8568:	4770      	bx	lr
c0de856a:	bf00      	nop

c0de856c <strlen>:
c0de856c:	4603      	mov	r3, r0
c0de856e:	f813 2b01 	ldrb.w	r2, [r3], #1
c0de8572:	2a00      	cmp	r2, #0
c0de8574:	d1fb      	bne.n	c0de856e <strlen+0x2>
c0de8576:	1a18      	subs	r0, r3, r0
c0de8578:	3801      	subs	r0, #1
c0de857a:	4770      	bx	lr

c0de857c <strnlen>:
c0de857c:	4602      	mov	r2, r0
c0de857e:	b510      	push	{r4, lr}
c0de8580:	4401      	add	r1, r0
c0de8582:	428a      	cmp	r2, r1
c0de8584:	4613      	mov	r3, r2
c0de8586:	d003      	beq.n	c0de8590 <strnlen+0x14>
c0de8588:	781c      	ldrb	r4, [r3, #0]
c0de858a:	3201      	adds	r2, #1
c0de858c:	2c00      	cmp	r4, #0
c0de858e:	d1f8      	bne.n	c0de8582 <strnlen+0x6>
c0de8590:	1a18      	subs	r0, r3, r0
c0de8592:	bd10      	pop	{r4, pc}

c0de8594 <C_badge_loading_v2_colors>:
c0de8594:	0000 0000 ffff 00ff                         ........

c0de859c <C_badge_loading_v2_bitmap>:
c0de859c:	0060 c01e 1801 0600 00c0 0030 c00c b003     `.........0.....
c0de85ac:	6601 7180 f838 7807 0000 0000               .f.q8..x....

c0de85b8 <C_badge_loading_v2>:
c0de85b8:	000e 0000 000e 0000 0001 0000 8594 c0de     ................
c0de85c8:	859c c0de                                   ....

c0de85cc <C_icon_crossmark_bitmap>:
c0de85cc:	8000 e601 71c0 3838 fc07 1e00 0780 03f0     .....q88........
c0de85dc:	c1ce 38e1 0670 0018 0000 0000               ...8p.......

c0de85e8 <C_icon_crossmark>:
c0de85e8:	000e 0000 000e 0000 0001 0000 8594 c0de     ................
c0de85f8:	85cc c0de                                   ....

c0de85fc <C_icon_dashboard_x_bitmap>:
c0de85fc:	0000 0000 800c f007 fe03 ffc1 3ff0 03f0     .............?..
c0de860c:	00cc c033 000c 0000 0000 0000               ..3.........

c0de8618 <C_icon_dashboard_x>:
c0de8618:	000e 0000 000e 0000 0001 0000 8594 c0de     ................
c0de8628:	85fc c0de                                   ....

c0de862c <C_icon_eye_bitmap>:
c0de862c:	0000 0000 e01e 1c1f 030e 8c63 6319 0c0c     ..........c..c..
c0de863c:	8387 807f 0007 0000 0000 0000               ............

c0de8648 <C_icon_eye>:
c0de8648:	000e 0000 000e 0000 0001 0000 8594 c0de     ................
c0de8658:	862c c0de                                   ,...

c0de865c <C_icon_validate_14_bitmap>:
c0de865c:	0000 0000 0000 00c0 0038 e067 1c38 039c     ........8.g.8...
c0de866c:	007e 800f 0001 0000 0000 0000               ~...........

c0de8678 <C_icon_validate_14>:
c0de8678:	000e 0000 000e 0000 0001 0000 8594 c0de     ................
c0de8688:	865c c0de                                   \...

c0de868c <C_icon_waves_bitmap>:
c0de868c:	87f8 e7cf 3de1 07f0 00f8 001c 8006 f003     .....=..........
c0de869c:	fe01 7bc0 3e78 fe1f 0001 0000               ...{x>......

c0de86a8 <C_icon_waves>:
c0de86a8:	000e 0000 000e 0000 0001 0000 8594 c0de     ................
c0de86b8:	868c c0de                                   ....

c0de86bc <C_icon_left_bitmap>:
c0de86bc:	1248 0842                                   H.B.

c0de86c0 <C_icon_left>:
c0de86c0:	0004 0000 0007 0000 0001 0000 8594 c0de     ................
c0de86d0:	86bc c0de                                   ....

c0de86d4 <C_icon_right_bitmap>:
c0de86d4:	8421 0124                                   !.$.

c0de86d8 <C_icon_right>:
c0de86d8:	0004 0000 0007 0000 0001 0000 8594 c0de     ................
c0de86e8:	86d4 c0de                                   ....

c0de86ec <waves_Amount_field_info>:
c0de86ec:	5605 0001 0000 0008 1108 8008 0000 0000     .V..............

c0de86fc <waves_Amount_submsg_info>:
c0de86fc:	0000 0000                                   ....

c0de8700 <waves_Amount_msg>:
c0de8700:	0002 86ec c0de 86fc c0de 0000 0000 1b55     ..............U.
c0de8710:	c0de 0000                                   ....

c0de8714 <waves_AssetPair_field_info>:
c0de8714:	5605 0001 0000 0008 5609 0001 0008 0008     .V.......V......
c0de8724:	0000 0000                                   ....

c0de8728 <waves_AssetPair_submsg_info>:
c0de8728:	0000 0000                                   ....

c0de872c <waves_AssetPair_msg>:
c0de872c:	0002 8714 c0de 8728 c0de 0000 0000 1b55     ......(.......U.
c0de873c:	c0de 0000                                   ....

c0de8740 <waves_Order_field_info>:
c0de8740:	1104 4000 5609 0001 0004 0008 560d 0001     ...@.V.......V..
c0de8750:	000c 0008 1811 4001 0018 0010 1214 1028     .......@......(.
c0de8760:	1118 8030 111c 8038 1120 8040 1124 8048     ..0...8. .@.$.H.
c0de8770:	1829 8001 0058 0010 112c 4068 0000 0000     )...X...,.h@....

c0de8780 <waves_Order_submsg_info>:
c0de8780:	872c c0de 8700 c0de 0000 0000               ,...........

c0de878c <waves_Order_msg>:
c0de878c:	000b 8740 c0de 8780 c0de 0000 0000 1b55     ..@...........U.
c0de879c:	c0de 0000                                   ....

c0de87a0 <waves_Recipient_field_info>:
c0de87a0:	3b05 2001 0002 0014 3709 2001 0002 001f     .;. .....7. ....
c0de87b0:	0000 0000                                   ....

c0de87b4 <waves_Recipient_submsg_info>:
c0de87b4:	0000 0000                                   ....

c0de87b8 <waves_Recipient_msg>:
c0de87b8:	0002 87a0 c0de 87b4 c0de 0000 0000 0000     ................
	...

c0de87ca <waves_Transaction_msg>:
c0de87ca:	0013 87dc c0de 89ac c0de 0000 0000 1b55     ..............U.
c0de87da:	c0de                                        ..

c0de87dc <waves_Transaction_field_info>:
c0de87dc:	5609 0001 0000 0008 190d 8001 0018 0010     .V..............
c0de87ec:	3995 8001 0038 1001 3999 8001 0038 1001     .9..8....9..8...
c0de87fc:	399d 8001 0038 1028 39a1 8001 0038 1040     .9..8.(..9..8.@.
c0de880c:	39a5 8001 0038 1020 39a9 8001 0038 1018     .9..8. ..9..8...
c0de881c:	39ad 8001 0038 1001 39b1 8001 0038 1030     .9..8....9..8.0.
c0de882c:	39b5 8001 0038 1008 39b9 8001 0038 1008     .9..8....9..8...
c0de883c:	39bd 8001 0038 1010 39c1 8001 0038 1001     .9..8....9..8...
c0de884c:	39c5 8001 0038 1001 39c9 8001 0038 1018     .9..8....9..8...
c0de885c:	39cd 8001 0038 1008 39d1 8001 0038 1050     .9..8....9..8.P.
c0de886c:	39d5 8001 0038 1018 0000 0000               .9..8.......

c0de8878 <waves_GenesisTransactionData_msg>:
c0de8878:	0000 89f8 c0de 89fc c0de 0000 0000 0000     ................
	...

c0de888a <waves_PaymentTransactionData_msg>:
c0de888a:	0000 8a00 c0de 8a04 c0de 0000 0000 0000     ................
	...

c0de889c <waves_IssueTransactionData_msg>:
c0de889c:	0006 8a9c c0de 8ac4 c0de 0000 0000 1b55     ..............U.
c0de88ac:	c0de                                        ..

c0de88ae <waves_TransferTransactionData_msg>:
c0de88ae:	0003 8a08 c0de 8a24 c0de 0000 0000 1b55     ......$.......U.
c0de88be:	c0de                                        ..

c0de88c0 <waves_ReissueTransactionData_msg>:
c0de88c0:	0002 8ac8 c0de 8ad8 c0de 0000 0000 0000     ................
	...

c0de88d2 <waves_BurnTransactionData_msg>:
c0de88d2:	0001 8a88 c0de 8a94 c0de 0000 0000 0000     ................
	...

c0de88e4 <waves_ExchangeTransactionData_msg>:
c0de88e4:	0000 8af8 c0de 8afc c0de 0000 0000 0000     ................
	...

c0de88f6 <waves_LeaseTransactionData_msg>:
c0de88f6:	0002 8a60 c0de 8a70 c0de 0000 0000 0000     ..`...p.........
	...

c0de8908 <waves_LeaseCancelTransactionData_msg>:
c0de8908:	0001 8a78 c0de 8a84 c0de 0000 0000 1b55     ..x...........U.
c0de8918:	c0de                                        ..

c0de891a <waves_CreateAliasTransactionData_msg>:
c0de891a:	0001 8a30 c0de 8a3c c0de 0000 0000 1b55     ..0...<.......U.
c0de892a:	c0de                                        ..

c0de892c <waves_MassTransferTransactionData_msg>:
c0de892c:	0002 8a48 c0de 8a5c c0de 0000 0000 1b55     ..H...\.......U.
c0de893c:	c0de                                        ..

c0de893e <waves_DataTransactionData_msg>:
c0de893e:	0000 8a40 c0de 8a44 c0de 0000 0000 0000     ..@...D.........
	...

c0de8950 <waves_SetScriptTransactionData_msg>:
c0de8950:	0000 8af0 c0de 8af4 c0de 0000 0000 0000     ................
	...

c0de8962 <waves_SponsorFeeTransactionData_msg>:
c0de8962:	0001 8b00 c0de 8b0c c0de 0000 0000 0000     ................
	...

c0de8974 <waves_SetAssetScriptTransactionData_msg>:
c0de8974:	0001 8ae0 c0de 8aec c0de 0000 0000 1b55     ..............U.
c0de8984:	c0de                                        ..

c0de8986 <waves_InvokeScriptTransactionData_msg>:
c0de8986:	0003 8b14 c0de 8b30 c0de 0000 0000 1b55     ......0.......U.
c0de8996:	c0de                                        ..

c0de8998 <waves_UpdateAssetInfoTransactionData_msg>:
c0de8998:	0003 8b3c c0de 8b58 c0de 0000 0000 1b55     ..<...X.......U.
c0de89a8:	c0de 0000                                   ....

c0de89ac <waves_Transaction_submsg_info>:
c0de89ac:	8700 c0de 8878 c0de 888a c0de 889c c0de     ....x...........
c0de89bc:	88ae c0de 88c0 c0de 88d2 c0de 88e4 c0de     ................
c0de89cc:	88f6 c0de 8908 c0de 891a c0de 892c c0de     ............,...
c0de89dc:	893e c0de 8950 c0de 8962 c0de 8974 c0de     >...P...b...t...
c0de89ec:	8986 c0de 8998 c0de 0000 0000               ............

c0de89f8 <waves_GenesisTransactionData_field_info>:
c0de89f8:	0000 0000                                   ....

c0de89fc <waves_GenesisTransactionData_submsg_info>:
c0de89fc:	0000 0000                                   ....

c0de8a00 <waves_PaymentTransactionData_field_info>:
c0de8a00:	0000 0000                                   ....

c0de8a04 <waves_PaymentTransactionData_submsg_info>:
c0de8a04:	0000 0000                                   ....

c0de8a08 <waves_TransferTransactionData_field_info>:
c0de8a08:	1805 2001 0002 0022 1809 4001 0028 0010     ... .."....@(...
c0de8a18:	560d 0001 0038 0008 0000 0000               .V..8.......

c0de8a24 <waves_TransferTransactionData_submsg_info>:
c0de8a24:	87b8 c0de 8700 c0de 0000 0000               ............

c0de8a30 <waves_CreateAliasTransactionData_field_info>:
c0de8a30:	5705 0001 0000 0008 0000 0000               .W..........

c0de8a3c <waves_CreateAliasTransactionData_submsg_info>:
c0de8a3c:	0000 0000                                   ....

c0de8a40 <waves_DataTransactionData_field_info>:
c0de8a40:	0000 0000                                   ....

c0de8a44 <waves_DataTransactionData_submsg_info>:
c0de8a44:	0000 0000                                   ....

c0de8a48 <waves_MassTransferTransactionData_field_info>:
c0de8a48:	5605 0001 0000 0008 560d 0001 0008 0008     .V.......V......
c0de8a58:	0000 0000                                   ....

c0de8a5c <waves_MassTransferTransactionData_submsg_info>:
c0de8a5c:	0000 0000                                   ....

c0de8a60 <waves_LeaseTransactionData_field_info>:
c0de8a60:	1805 2001 0002 0022 1108 8028 0000 0000     ... .."...(.....

c0de8a70 <waves_LeaseTransactionData_submsg_info>:
c0de8a70:	87b8 c0de 0000 0000                         ........

c0de8a78 <waves_LeaseCancelTransactionData_field_info>:
c0de8a78:	5605 0001 0000 0008 0000 0000               .V..........

c0de8a84 <waves_LeaseCancelTransactionData_submsg_info>:
c0de8a84:	0000 0000                                   ....

c0de8a88 <waves_BurnTransactionData_field_info>:
c0de8a88:	1805 8001 0008 0010 0000 0000               ............

c0de8a94 <waves_BurnTransactionData_submsg_info>:
c0de8a94:	8700 c0de 0000 0000                         ........

c0de8a9c <waves_IssueTransactionData_field_info>:
c0de8a9c:	5705 0001 0000 0008 5709 0001 0008 0008     .W.......W......
c0de8aac:	110c 8010 1110 4018 1014 101c 5619 0001     .......@.....V..
c0de8abc:	0020 0008 0000 0000                          .......

c0de8ac4 <waves_IssueTransactionData_submsg_info>:
c0de8ac4:	0000 0000                                   ....

c0de8ac8 <waves_ReissueTransactionData_field_info>:
c0de8ac8:	1805 8001 0008 0010 1008 1018 0000 0000     ................

c0de8ad8 <waves_ReissueTransactionData_submsg_info>:
c0de8ad8:	8700 c0de 0000 0000                         ........

c0de8ae0 <waves_SetAssetScriptTransactionData_field_info>:
c0de8ae0:	5605 0001 0000 0008 0000 0000               .V..........

c0de8aec <waves_SetAssetScriptTransactionData_submsg_info>:
c0de8aec:	0000 0000                                   ....

c0de8af0 <waves_SetScriptTransactionData_field_info>:
c0de8af0:	0000 0000                                   ....

c0de8af4 <waves_SetScriptTransactionData_submsg_info>:
c0de8af4:	0000 0000                                   ....

c0de8af8 <waves_ExchangeTransactionData_field_info>:
c0de8af8:	0000 0000                                   ....

c0de8afc <waves_ExchangeTransactionData_submsg_info>:
c0de8afc:	0000 0000                                   ....

c0de8b00 <waves_SponsorFeeTransactionData_field_info>:
c0de8b00:	1805 8001 0008 0010 0000 0000               ............

c0de8b0c <waves_SponsorFeeTransactionData_submsg_info>:
c0de8b0c:	8700 c0de 0000 0000                         ........

c0de8b14 <waves_InvokeScriptTransactionData_field_info>:
c0de8b14:	1805 2001 0002 0022 5609 0001 0024 0008     ... .."..V..$...
c0de8b24:	280d 4002 0030 0010 0000 0000               .(.@0.......

c0de8b30 <waves_InvokeScriptTransactionData_submsg_info>:
c0de8b30:	87b8 c0de 8700 c0de 0000 0000               ............

c0de8b3c <waves_UpdateAssetInfoTransactionData_field_info>:
c0de8b3c:	5605 0001 0000 0008 5709 0001 0008 0008     .V.......W......
c0de8b4c:	570d 0001 0010 0008 0000 0000               .W..........

c0de8b58 <waves_UpdateAssetInfoTransactionData_submsg_info>:
c0de8b58:	0000 0000 6425 4100 7070 6f72 6576 4100     ....%d.Approve.A
c0de8b68:	7373 7465 6920 7373 6575 5000 6f72 6563     sset issue.Proce
c0de8b78:	7373 6e69 0067 7325 2820 6425 252f 2964     ssing.%s (%d/%d)
c0de8b88:	5000 7961 656d 746e 3220 6120 6f6d 6e75     .Payment 2 amoun
c0de8b98:	0074 7341 6573 0074 7254 6e61 6173 7463     t.Asset.Transact
c0de8ba8:	6f69 206e 6449 6100 646e 7320 6e65 0064     ion Id.and send.
c0de8bb8:	6353 6972 7470 6920 766e 636f 7461 6f69     Script invocatio
c0de8bc8:	006e 7546 636e 6974 6e6f 2500 2a2e 0073     n.Function.%.*s.
c0de8bd8:	6552 656a 7463 4600 6565 6120 7373 7465     Reject.Fee asset
c0de8be8:	5300 7465 6120 6363 756f 746e 7320 7263     .Set account scr
c0de8bf8:	7069 0074 6148 6873 6e00 206f 616d 6c6c     ipt.Hash.no mall
c0de8c08:	636f 7320 7075 6f70 7472 7700 6f72 676e     oc support.wrong
c0de8c18:	7320 7a69 2065 6f66 2072 6966 6578 2064      size for fixed 
c0de8c28:	6f63 6e75 2074 6966 6c65 0064 6d41 756f     count field.Amou
c0de8c38:	746e 2500 0073 6e69 6176 696c 2064 6164     nt.%s.invalid da
c0de8c48:	6174 735f 7a69 0065 6f54 4100 7474 6361     ta_size.To.Attac
c0de8c58:	6d68 6e65 0074 7246 6d6f 4400 7365 7263     hment.From.Descr
c0de8c68:	7069 6974 6e6f 6800 7361 6353 6972 7470     iption.hasScript
c0de8c78:	7300 7274 6e69 2067 766f 7265 6c66 776f     .string overflow
c0de8c88:	4100 6363 7065 0074 6166 6c69 6465 7420     .Accept.failed t
c0de8c98:	206f 6573 2074 6564 6166 6c75 7374 3100     o set defaults.1
c0de8ca8:	322e 322e 5600 7265 6669 0079 4164 7070     .2.2.Verify.dApp
c0de8cb8:	6900 746e 6765 7265 7420 6f6f 6c20 7261     .integer too lar
c0de8cc8:	6567 4c00 6165 6573 6920 0064 6f69 6520     ge.Lease id.io e
c0de8cd8:	7272 726f 6900 766e 6c61 6469 6620 6569     rror.invalid fie
c0de8ce8:	646c 7420 7079 0065 6546 0065 6150 6d79     ld type.Fee.Paym
c0de8cf8:	6e65 2074 2031 7361 6573 0074 6556 7372     ent 1 asset.Vers
c0de8d08:	6f69 006e 7341 6573 2074 6572 7369 7573     ion.Asset reissu
c0de8d18:	0065 6546 2065 7073 6e6f 6f73 6972 676e     e.Fee sponsoring
c0de8d28:	4d00 7461 6863 7265 4620 6565 6100 7272     .Matcher Fee.arr
c0de8d38:	7961 6f20 6576 6672 6f6c 0077 6e69 6176     ay overflow.inva
c0de8d48:	696c 2064 6966 6c65 2064 6564 6373 6972     lid field descri
c0de8d58:	7470 726f 6200 7479 7365 6f20 6576 6672     ptor.bytes overf
c0de8d68:	6f6c 0077 6552 7369 7573 6261 656c 7a00     low.Reissuable.z
c0de8d78:	7265 206f 6174 0067 614e 656d 4100 7373     ero tag.Name.Ass
c0de8d88:	7465 6c20 6165 6973 676e 6320 6e61 6563     et leasing cance
c0de8d98:	006c 6e61 2064 6973 6e67 6500 646e 6f2d     l.and sign.end-o
c0de8da8:	2d66 7473 6572 6d61 5300 7465 6120 7373     f-stream.Set ass
c0de8db8:	7465 7320 7263 7069 0074 6d41 756f 746e     et script.Amount
c0de8dc8:	6120 7373 7465 4100 7373 7465 6c20 6165      asset.Asset lea
c0de8dd8:	6973 676e 2e00 2e2e 4d00 7361 2073 7274     sing.....Mass tr
c0de8de8:	6e61 6673 7265 6900 766e 6c61 6469 6520     ansfer.invalid e
c0de8df8:	7478 6e65 6973 6e6f 6300 6c61 626c 6361     xtension.callbac
c0de8e08:	206b 6166 6c69 6465 5100 6975 0074 6441     k failed.Quit.Ad
c0de8e18:	7264 7365 0073 7254 6e61 6673 7265 4100     dress.Transfer.A
c0de8e28:	7070 696c 6163 6974 6e6f 6100 6464 6572     pplication.addre
c0de8e38:	7373 5000 7961 656d 746e 3120 6120 6f6d     ss.Payment 1 amo
c0de8e48:	6e75 0074 6465 3532 3135 2039 6573 6465     unt.ed25519 seed
c0de8e58:	4400 7461 2061 7274 6e61 6173 7463 6f69     .Data transactio
c0de8e68:	006e 6170 6572 746e 7320 7274 6165 206d     n.parent stream 
c0de8e78:	6f74 206f 6873 726f 0074 6e69 6f63 7272     too short.incorr
c0de8e88:	6365 2074 6966 6578 2064 656c 676e 6874     ect fixed length
c0de8e98:	6220 7479 7365 7320 7a69 0065 6150 6d79      bytes size.Paym
c0de8ea8:	6e65 2074 2032 7361 6573 0074                ent 2 asset..

c0de8eb5 <b58digits_ordered>:
c0de8eb5:	3231 3433 3635 3837 4139 4342 4544 4746     123456789ABCDEFG
c0de8ec5:	4a48 4c4b 4e4d 5150 5352 5554 5756 5958     HJKLMNPQRSTUVWXY
c0de8ed5:	615a 6362 6564 6766 6968 6b6a 6e6d 706f     Zabcdefghijkmnop
c0de8ee5:	7271 7473 7675 7877 7a79 7300 7a69 2065     qrstuvwxyz.size 
c0de8ef5:	6f74 206f 616c 6772 0065 7369 7220 6165     too large.is rea
c0de8f05:	7964 4100 7373 7465 6220 7275 006e 614d     dy.Asset burn.Ma
c0de8f15:	6374 6568 0072                              tcher.

c0de8f1b <WAVES_CONST>:
c0de8f1b:	6157 6576 0073 6176 6972 746e 6f20 6576     Waves.varint ove
c0de8f2b:	6672 6f6c 0077 6e69 6176 696c 2064 6977     rflow.invalid wi
c0de8f3b:	6572 745f 7079 0065 696d 7373 6e69 2067     re_type.missing 
c0de8f4b:	6572 7571 7269 6465 6620 6569 646c 4300     required field.C
c0de8f5b:	6e6f 6966 6d72 4400 6365 6d69 6c61 0073     onfirm.Decimals.
c0de8f6b:	6c41 6169 0073 6425 252f 0064 7243 6165     Alias.%d/%d.Crea
c0de8f7b:	6974 676e 6120 696c 7361 5500 6470 7461     ting alias.Updat
c0de8f8b:	2065 7361 6573 2074 6e69 6f66                e asset info.

c0de8f98 <C_cx_Ed25519_Bx>:
c0de8f98:	6921 d336 6ecd fe53 a4c0 31e2 d6fd 5cdc     !i6..nS....1...\
c0de8fa8:	2c69 60c7 2595 b2a7 56c9 602d 258f 1ad5     i,.`.%...V-`.%..

c0de8fb8 <C_cx_Ed25519_By>:
c0de8fb8:	6666 6666 6666 6666 6666 6666 6666 6666     ffffffffffffffff
c0de8fc8:	6666 6666 6666 6666 6666 6666 6666 5866     fffffffffffffffX

c0de8fd8 <C_cx_Ed25519_l>:
c0de8fd8:	0010 0000 0000 0000 0000 0000 0000 0000     ................
c0de8fe8:	de14 def9 f7a2 d69c 1258 1a63 f55c edd3     ........X.c.\...
	...

c0de9000 <ge25519_has_small_order.blacklist>:
	...
c0de9020:	0001 0000 0000 0000 0000 0000 0000 0000     ................
	...
c0de9040:	e826 8f95 b2c2 b027 c345 89f4 eff2 f098     &.....'.E.......
c0de9050:	dfd5 05ac c6d3 3933 38b1 8802 536d 05fc     ......39.8..mS..
c0de9060:	17c7 706a 4d3d 4fd8 3cba 760b 100d 0f67     ..jp=M.O.<.v..g.
c0de9070:	202a fa53 392c c6cc c74e 77fd ac92 7a03     * S.,9..N..w...z
c0de9080:	ffec ffff ffff ffff ffff ffff ffff ffff     ................
c0de9090:	ffff ffff ffff ffff ffff ffff ffff 7fff     ................
c0de90a0:	ffed ffff ffff ffff ffff ffff ffff ffff     ................
c0de90b0:	ffff ffff ffff ffff ffff ffff ffff 7fff     ................
c0de90c0:	ffee ffff ffff ffff ffff ffff ffff ffff     ................
c0de90d0:	ffff ffff ffff ffff ffff ffff ffff 7fff     ................

c0de90e0 <.L.str.1>:
c0de90e0:	7254 6575 0000 0000                         True....

c0de90e8 <.L.str.2>:
c0de90e8:	6564 6166 6c75 0074                          default..

c0de90f1 <.L.str.4>:
c0de90f1:	6146 736c 0065                               False..

c0de90f8 <.L.str.5>:
c0de90f8:	7542 2079 726f 6564 0072 0000               Buy order...

c0de9104 <.L.str.6>:
c0de9104:	6553 6c6c 6f20 6472 7265 0000               Sell order..

c0de9110 <ux_idle_flow_1_step_val>:
c0de9110:	86a8 c0de 8e27 c0de 8eff c0de               ....'.......

c0de911c <ux_idle_flow_1_step>:
c0de911c:	789f c0de 9110 c0de 0000 0000 0000 0000     .x..............

c0de912c <ux_idle_flow_2_step_val>:
c0de912c:	8d04 c0de 8ca7 c0de                         ........

c0de9134 <ux_idle_flow_2_step>:
c0de9134:	7199 c0de 912c c0de 0000 0000 0000 0000     .q..,...........

c0de9144 <ux_idle_flow_3_step_validate_step>:
c0de9144:	4c73 c0de 0000 0000 0000 0000 0000 0000     sL..............

c0de9154 <ux_idle_flow_3_step_validate>:
c0de9154:	9144 c0de ffff ffff                         D.......

c0de915c <ux_idle_flow_3_step_val>:
c0de915c:	8618 c0de 8e11 c0de                         ........

c0de9164 <ux_idle_flow_3_step>:
c0de9164:	770f c0de 915c c0de 9154 c0de 0000 0000     .w..\...T.......

c0de9174 <ux_idle_flow>:
c0de9174:	911c c0de 9134 c0de 9164 c0de ffff ffff     ....4...d.......

c0de9184 <ux_display_address_flow_1_step_val>:
c0de9184:	8648 c0de 8cad c0de 8e33 c0de               H.......3...

c0de9190 <ux_display_address_flow_1_step>:
c0de9190:	789f c0de 9184 c0de 0000 0000 0000 0000     .x..............

c0de91a0 <ux_display_address_flow_4_step_val>:
c0de91a0:	8e16 c0de 0000 da7a                         ......z.

c0de91a8 <ux_display_address_flow_4_step>:
c0de91a8:	7527 c0de 91a0 c0de 0000 0000 0000 0000     'u..............

c0de91b8 <ux_display_address_flow_5_step_validate_step>:
c0de91b8:	4c79 c0de 0000 0000 0000 0000 0000 0000     yL..............

c0de91c8 <ux_display_address_flow_5_step_validate>:
c0de91c8:	91b8 c0de ffff ffff                         ........

c0de91d0 <ux_display_address_flow_5_step_val>:
c0de91d0:	8678 c0de 8b5f c0de                         x..._...

c0de91d8 <ux_display_address_flow_5_step>:
c0de91d8:	770f c0de 91d0 c0de 91c8 c0de 0000 0000     .w..............

c0de91e8 <ux_display_address_flow_6_step_validate_step>:
c0de91e8:	4c7f c0de 0000 0000 0000 0000 0000 0000     .L..............

c0de91f8 <ux_display_address_flow_6_step_validate>:
c0de91f8:	91e8 c0de ffff ffff                         ........

c0de9200 <ux_display_address_flow_6_step_val>:
c0de9200:	85e8 c0de 8bd8 c0de                         ........

c0de9208 <ux_display_address_flow_6_step>:
c0de9208:	770f c0de 9200 c0de 91f8 c0de 0000 0000     .w..............

c0de9218 <ux_display_address_flow>:
c0de9218:	9190 c0de 91a8 c0de 91d8 c0de 9208 c0de     ................
c0de9228:	ffff ffff                                   ....

c0de922c <ux_transfer_1_step_val>:
c0de922c:	8648 c0de 8f5a c0de 8e1e c0de               H...Z.......

c0de9238 <ux_transfer_1_step>:
c0de9238:	789f c0de 922c c0de 0000 0000 0000 0000     .x..,...........

c0de9248 <ux_transfer_2_step_val>:
c0de9248:	8c34 c0de 00fd da7a                         4.....z.

c0de9250 <ux_transfer_2_step>:
c0de9250:	7527 c0de 9248 c0de 0000 0000 0000 0000     'u..H...........

c0de9260 <ux_transfer_3_step_val>:
c0de9260:	8b9a c0de 012a da7a                         ....*.z.

c0de9268 <ux_transfer_3_step>:
c0de9268:	7527 c0de 9260 c0de 0000 0000 0000 0000     'u..`...........

c0de9278 <ux_transfer_4_step_val>:
c0de9278:	8c50 c0de 0157 da7a                         P...W.z.

c0de9280 <ux_transfer_4_step>:
c0de9280:	7527 c0de 9278 c0de 0000 0000 0000 0000     'u..x...........

c0de9290 <ux_transfer_5_step_val>:
c0de9290:	8cf0 c0de 01eb da7a                         ......z.

c0de9298 <ux_transfer_5_step>:
c0de9298:	7527 c0de 9290 c0de 0000 0000 0000 0000     'u..............

c0de92a8 <ux_transfer_6_step_val>:
c0de92a8:	8bdf c0de 00d0 da7a                         ......z.

c0de92b0 <ux_transfer_6_step>:
c0de92b0:	7527 c0de 92a8 c0de 0000 0000 0000 0000     'u..............

c0de92c0 <ux_transfer_7_step_val>:
c0de92c0:	8c53 c0de 017b da7a                         S...{.z.

c0de92c8 <ux_transfer_7_step>:
c0de92c8:	4cb3 c0de 92c0 c0de 0000 0000 0000 0000     .L..............

c0de92d8 <ux_transfer_8_step_val>:
c0de92d8:	8c5e c0de 00ac da7a                         ^.....z.

c0de92e0 <ux_transfer_8_step>:
c0de92e0:	7527 c0de 92d8 c0de 0000 0000 0000 0000     'u..............

c0de92f0 <ux_transfer_9_step_val>:
c0de92f0:	8ba0 c0de 036d da7a                         ....m.z.

c0de92f8 <ux_transfer_9_step>:
c0de92f8:	7527 c0de 92f0 c0de 0000 0000 0000 0000     'u..............

c0de9308 <ux_transfer_10_step_validate_step>:
c0de9308:	4cd5 c0de 0000 0000 0000 0000 0000 0000     .L..............

c0de9318 <ux_transfer_10_step_validate>:
c0de9318:	9308 c0de ffff ffff                         ........

c0de9320 <ux_transfer_10_step_val>:
c0de9320:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de932c <ux_transfer_10_step>:
c0de932c:	781d c0de 9320 c0de 9318 c0de 0000 0000     .x.. ...........

c0de933c <ux_transfer_11_step_validate_step>:
c0de933c:	4cdb c0de 0000 0000 0000 0000 0000 0000     .L..............

c0de934c <ux_transfer_11_step_validate>:
c0de934c:	933c c0de ffff ffff                         <.......

c0de9354 <ux_transfer_11_step_val>:
c0de9354:	85e8 c0de 8bd8 c0de                         ........

c0de935c <ux_transfer_11_step>:
c0de935c:	770f c0de 9354 c0de 934c c0de 0000 0000     .w..T...L.......

c0de936c <ux_transfer_flow>:
c0de936c:	9238 c0de 9250 c0de 9268 c0de 9280 c0de     8...P...h.......
c0de937c:	9298 c0de 92b0 c0de 92c8 c0de 92e0 c0de     ................
c0de938c:	92f8 c0de 932c c0de 935c c0de ffff ffff     ....,...\.......

c0de939c <ux_data_1_step_val>:
c0de939c:	8648 c0de 8f5a c0de 8e59 c0de               H...Z...Y...

c0de93a8 <ux_data_1_step>:
c0de93a8:	789f c0de 939c c0de 0000 0000 0000 0000     .x..............

c0de93b8 <ux_data_2_step_val>:
c0de93b8:	8cf0 c0de 01eb da7a                         ......z.

c0de93c0 <ux_data_2_step>:
c0de93c0:	7527 c0de 93b8 c0de 0000 0000 0000 0000     'u..............

c0de93d0 <ux_data_3_step_val>:
c0de93d0:	8bdf c0de 00d0 da7a                         ......z.

c0de93d8 <ux_data_3_step>:
c0de93d8:	7527 c0de 93d0 c0de 0000 0000 0000 0000     'u..............

c0de93e8 <ux_data_4_step_val>:
c0de93e8:	8c5e c0de 00ac da7a                         ^.....z.

c0de93f0 <ux_data_4_step>:
c0de93f0:	7527 c0de 93e8 c0de 0000 0000 0000 0000     'u..............

c0de9400 <ux_data_5_step_val>:
c0de9400:	8ba0 c0de 036d da7a                         ....m.z.

c0de9408 <ux_data_5_step>:
c0de9408:	7527 c0de 9400 c0de 0000 0000 0000 0000     'u..............

c0de9418 <ux_data_6_step_validate_step>:
c0de9418:	4ce1 c0de 0000 0000 0000 0000 0000 0000     .L..............

c0de9428 <ux_data_6_step_validate>:
c0de9428:	9418 c0de ffff ffff                         ........

c0de9430 <ux_data_6_step_val>:
c0de9430:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de943c <ux_data_6_step>:
c0de943c:	781d c0de 9430 c0de 9428 c0de 0000 0000     .x..0...(.......

c0de944c <ux_data_7_step_validate_step>:
c0de944c:	4ce7 c0de 0000 0000 0000 0000 0000 0000     .L..............

c0de945c <ux_data_7_step_validate>:
c0de945c:	944c c0de ffff ffff                         L.......

c0de9464 <ux_data_7_step_val>:
c0de9464:	85e8 c0de 8bd8 c0de                         ........

c0de946c <ux_data_7_step>:
c0de946c:	770f c0de 9464 c0de 945c c0de 0000 0000     .w..d...\.......

c0de947c <ux_data_flow>:
c0de947c:	93a8 c0de 93c0 c0de 93d8 c0de 93f0 c0de     ................
c0de948c:	9408 c0de 943c c0de 946c c0de ffff ffff     ....<...l.......

c0de949c <ux_issue_1_step_val>:
c0de949c:	8648 c0de 8f5a c0de 8b67 c0de               H...Z...g...

c0de94a8 <ux_issue_1_step>:
c0de94a8:	789f c0de 949c c0de 0000 0000 0000 0000     .x..............

c0de94b8 <ux_issue_2_step_val>:
c0de94b8:	8d80 c0de 00fd da7a                         ......z.

c0de94c0 <ux_issue_2_step>:
c0de94c0:	7527 c0de 94b8 c0de 0000 0000 0000 0000     'u..............

c0de94d0 <ux_issue_3_step_val>:
c0de94d0:	8c63 c0de 012a da7a                         c...*.z.

c0de94d8 <ux_issue_3_step>:
c0de94d8:	7527 c0de 94d0 c0de 0000 0000 0000 0000     'u..............

c0de94e8 <ux_issue_4_step_val>:
c0de94e8:	8c34 c0de 0157 da7a                         4...W.z.

c0de94f0 <ux_issue_4_step>:
c0de94f0:	7527 c0de 94e8 c0de 0000 0000 0000 0000     'u..............

c0de9500 <ux_issue_5_step_val>:
c0de9500:	8f62 c0de 017b da7a                         b...{.z.

c0de9508 <ux_issue_5_step>:
c0de9508:	7527 c0de 9500 c0de 0000 0000 0000 0000     'u..............

c0de9518 <ux_issue_6_step_val>:
c0de9518:	8d6c c0de 01a8 da7a                         l.....z.

c0de9520 <ux_issue_6_step>:
c0de9520:	7527 c0de 9518 c0de 0000 0000 0000 0000     'u..............

c0de9530 <ux_issue_7_step_val>:
c0de9530:	8c6f c0de 01d5 da7a                         o.....z.

c0de9538 <ux_issue_7_step>:
c0de9538:	7527 c0de 9530 c0de 0000 0000 0000 0000     'u..0...........

c0de9548 <ux_issue_8_step_val>:
c0de9548:	8cf0 c0de 01eb da7a                         ......z.

c0de9550 <ux_issue_8_step>:
c0de9550:	7527 c0de 9548 c0de 0000 0000 0000 0000     'u..H...........

c0de9560 <ux_issue_9_step_val>:
c0de9560:	8bdf c0de 00d0 da7a                         ......z.

c0de9568 <ux_issue_9_step>:
c0de9568:	7527 c0de 9560 c0de 0000 0000 0000 0000     'u..`...........

c0de9578 <ux_issue_10_step_val>:
c0de9578:	8c5e c0de 00ac da7a                         ^.....z.

c0de9580 <ux_issue_10_step>:
c0de9580:	7527 c0de 9578 c0de 0000 0000 0000 0000     'u..x...........

c0de9590 <ux_issue_11_step_val>:
c0de9590:	8ba0 c0de 036d da7a                         ....m.z.

c0de9598 <ux_issue_11_step>:
c0de9598:	7527 c0de 9590 c0de 0000 0000 0000 0000     'u..............

c0de95a8 <ux_issue_12_step_validate_step>:
c0de95a8:	4ced c0de 0000 0000 0000 0000 0000 0000     .L..............

c0de95b8 <ux_issue_12_step_validate>:
c0de95b8:	95a8 c0de ffff ffff                         ........

c0de95c0 <ux_issue_12_step_val>:
c0de95c0:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de95cc <ux_issue_12_step>:
c0de95cc:	781d c0de 95c0 c0de 95b8 c0de 0000 0000     .x..............

c0de95dc <ux_issue_13_step_validate_step>:
c0de95dc:	4cf3 c0de 0000 0000 0000 0000 0000 0000     .L..............

c0de95ec <ux_issue_13_step_validate>:
c0de95ec:	95dc c0de ffff ffff                         ........

c0de95f4 <ux_issue_13_step_val>:
c0de95f4:	85e8 c0de 8bd8 c0de                         ........

c0de95fc <ux_issue_13_step>:
c0de95fc:	770f c0de 95f4 c0de 95ec c0de 0000 0000     .w..............

c0de960c <ux_issue_flow>:
c0de960c:	94a8 c0de 94c0 c0de 94d8 c0de 94f0 c0de     ................
c0de961c:	9508 c0de 9520 c0de 9538 c0de 9550 c0de     .... ...8...P...
c0de962c:	9568 c0de 9580 c0de 9598 c0de 95cc c0de     h...............
c0de963c:	95fc c0de ffff ffff                         ........

c0de9644 <ux_reissue_1_step_val>:
c0de9644:	8648 c0de 8f5a c0de 8d0c c0de               H...Z.......

c0de9650 <ux_reissue_1_step>:
c0de9650:	789f c0de 9644 c0de 0000 0000 0000 0000     .x..D...........

c0de9660 <ux_reissue_2_step_val>:
c0de9660:	8c34 c0de 00fd da7a                         4.....z.

c0de9668 <ux_reissue_2_step>:
c0de9668:	7527 c0de 9660 c0de 0000 0000 0000 0000     'u..`...........

c0de9678 <ux_reissue_3_step_val>:
c0de9678:	8b9a c0de 012a da7a                         ....*.z.

c0de9680 <ux_reissue_3_step>:
c0de9680:	7527 c0de 9678 c0de 0000 0000 0000 0000     'u..x...........

c0de9690 <ux_reissue_4_step_val>:
c0de9690:	8d6c c0de 0157 da7a                         l...W.z.

c0de9698 <ux_reissue_4_step>:
c0de9698:	7527 c0de 9690 c0de 0000 0000 0000 0000     'u..............

c0de96a8 <ux_reissue_5_step_val>:
c0de96a8:	8cf0 c0de 01eb da7a                         ......z.

c0de96b0 <ux_reissue_5_step>:
c0de96b0:	7527 c0de 96a8 c0de 0000 0000 0000 0000     'u..............

c0de96c0 <ux_reissue_6_step_val>:
c0de96c0:	8bdf c0de 00d0 da7a                         ......z.

c0de96c8 <ux_reissue_6_step>:
c0de96c8:	7527 c0de 96c0 c0de 0000 0000 0000 0000     'u..............

c0de96d8 <ux_reissue_7_step_val>:
c0de96d8:	8c5e c0de 00ac da7a                         ^.....z.

c0de96e0 <ux_reissue_7_step>:
c0de96e0:	7527 c0de 96d8 c0de 0000 0000 0000 0000     'u..............

c0de96f0 <ux_reissue_8_step_val>:
c0de96f0:	8ba0 c0de 036d da7a                         ....m.z.

c0de96f8 <ux_reissue_8_step>:
c0de96f8:	7527 c0de 96f0 c0de 0000 0000 0000 0000     'u..............

c0de9708 <ux_reissue_9_step_validate_step>:
c0de9708:	4cf9 c0de 0000 0000 0000 0000 0000 0000     .L..............

c0de9718 <ux_reissue_9_step_validate>:
c0de9718:	9708 c0de ffff ffff                         ........

c0de9720 <ux_reissue_9_step_val>:
c0de9720:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de972c <ux_reissue_9_step>:
c0de972c:	781d c0de 9720 c0de 9718 c0de 0000 0000     .x.. ...........

c0de973c <ux_reissue_10_step_validate_step>:
c0de973c:	4cff c0de 0000 0000 0000 0000 0000 0000     .L..............

c0de974c <ux_reissue_10_step_validate>:
c0de974c:	973c c0de ffff ffff                         <.......

c0de9754 <ux_reissue_10_step_val>:
c0de9754:	85e8 c0de 8bd8 c0de                         ........

c0de975c <ux_reissue_10_step>:
c0de975c:	770f c0de 9754 c0de 974c c0de 0000 0000     .w..T...L.......

c0de976c <ux_reissue_flow>:
c0de976c:	9650 c0de 9668 c0de 9680 c0de 9698 c0de     P...h...........
c0de977c:	96b0 c0de 96c8 c0de 96e0 c0de 96f8 c0de     ................
c0de978c:	972c c0de 975c c0de ffff ffff               ,...\.......

c0de9798 <ux_burn_1_step_val>:
c0de9798:	8648 c0de 8f5a c0de 8f08 c0de               H...Z.......

c0de97a4 <ux_burn_1_step>:
c0de97a4:	789f c0de 9798 c0de 0000 0000 0000 0000     .x..............

c0de97b4 <ux_burn_2_step_val>:
c0de97b4:	8c34 c0de 00fd da7a                         4.....z.

c0de97bc <ux_burn_2_step>:
c0de97bc:	7527 c0de 97b4 c0de 0000 0000 0000 0000     'u..............

c0de97cc <ux_burn_3_step_val>:
c0de97cc:	8b9a c0de 012a da7a                         ....*.z.

c0de97d4 <ux_burn_3_step>:
c0de97d4:	7527 c0de 97cc c0de 0000 0000 0000 0000     'u..............

c0de97e4 <ux_burn_4_step_val>:
c0de97e4:	8cf0 c0de 01eb da7a                         ......z.

c0de97ec <ux_burn_4_step>:
c0de97ec:	7527 c0de 97e4 c0de 0000 0000 0000 0000     'u..............

c0de97fc <ux_burn_5_step_val>:
c0de97fc:	8bdf c0de 00d0 da7a                         ......z.

c0de9804 <ux_burn_5_step>:
c0de9804:	7527 c0de 97fc c0de 0000 0000 0000 0000     'u..............

c0de9814 <ux_burn_6_step_val>:
c0de9814:	8c5e c0de 00ac da7a                         ^.....z.

c0de981c <ux_burn_6_step>:
c0de981c:	7527 c0de 9814 c0de 0000 0000 0000 0000     'u..............

c0de982c <ux_burn_7_step_val>:
c0de982c:	8ba0 c0de 036d da7a                         ....m.z.

c0de9834 <ux_burn_7_step>:
c0de9834:	7527 c0de 982c c0de 0000 0000 0000 0000     'u..,...........

c0de9844 <ux_burn_8_step_validate_step>:
c0de9844:	4d05 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de9854 <ux_burn_8_step_validate>:
c0de9854:	9844 c0de ffff ffff                         D.......

c0de985c <ux_burn_8_step_val>:
c0de985c:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de9868 <ux_burn_8_step>:
c0de9868:	781d c0de 985c c0de 9854 c0de 0000 0000     .x..\...T.......

c0de9878 <ux_burn_9_step_validate_step>:
c0de9878:	4d0b c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de9888 <ux_burn_9_step_validate>:
c0de9888:	9878 c0de ffff ffff                         x.......

c0de9890 <ux_burn_9_step_val>:
c0de9890:	85e8 c0de 8bd8 c0de                         ........

c0de9898 <ux_burn_9_step>:
c0de9898:	770f c0de 9890 c0de 9888 c0de 0000 0000     .w..............

c0de98a8 <ux_burn_flow>:
c0de98a8:	97a4 c0de 97bc c0de 97d4 c0de 97ec c0de     ................
c0de98b8:	9804 c0de 981c c0de 9834 c0de 9868 c0de     ........4...h...
c0de98c8:	9898 c0de ffff ffff                         ........

c0de98d0 <ux_lease_1_step_val>:
c0de98d0:	8648 c0de 8f5a c0de 8dcf c0de               H...Z.......

c0de98dc <ux_lease_1_step>:
c0de98dc:	789f c0de 98d0 c0de 0000 0000 0000 0000     .x..............

c0de98ec <ux_lease_2_step_val>:
c0de98ec:	8c34 c0de 00fd da7a                         4.....z.

c0de98f4 <ux_lease_2_step>:
c0de98f4:	7527 c0de 98ec c0de 0000 0000 0000 0000     'u..............

c0de9904 <ux_lease_3_step_val>:
c0de9904:	8c50 c0de 0157 da7a                         P...W.z.

c0de990c <ux_lease_3_step>:
c0de990c:	7527 c0de 9904 c0de 0000 0000 0000 0000     'u..............

c0de991c <ux_lease_4_step_val>:
c0de991c:	8cf0 c0de 01eb da7a                         ......z.

c0de9924 <ux_lease_4_step>:
c0de9924:	7527 c0de 991c c0de 0000 0000 0000 0000     'u..............

c0de9934 <ux_lease_5_step_val>:
c0de9934:	8bdf c0de 00d0 da7a                         ......z.

c0de993c <ux_lease_5_step>:
c0de993c:	7527 c0de 9934 c0de 0000 0000 0000 0000     'u..4...........

c0de994c <ux_lease_6_step_val>:
c0de994c:	8c5e c0de 00ac da7a                         ^.....z.

c0de9954 <ux_lease_6_step>:
c0de9954:	7527 c0de 994c c0de 0000 0000 0000 0000     'u..L...........

c0de9964 <ux_lease_7_step_val>:
c0de9964:	8ba0 c0de 036d da7a                         ....m.z.

c0de996c <ux_lease_7_step>:
c0de996c:	7527 c0de 9964 c0de 0000 0000 0000 0000     'u..d...........

c0de997c <ux_lease_8_step_validate_step>:
c0de997c:	4d11 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de998c <ux_lease_8_step_validate>:
c0de998c:	997c c0de ffff ffff                         |.......

c0de9994 <ux_lease_8_step_val>:
c0de9994:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de99a0 <ux_lease_8_step>:
c0de99a0:	781d c0de 9994 c0de 998c c0de 0000 0000     .x..............

c0de99b0 <ux_lease_9_step_validate_step>:
c0de99b0:	4d17 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de99c0 <ux_lease_9_step_validate>:
c0de99c0:	99b0 c0de ffff ffff                         ........

c0de99c8 <ux_lease_9_step_val>:
c0de99c8:	85e8 c0de 8bd8 c0de                         ........

c0de99d0 <ux_lease_9_step>:
c0de99d0:	770f c0de 99c8 c0de 99c0 c0de 0000 0000     .w..............

c0de99e0 <ux_lease_flow>:
c0de99e0:	98dc c0de 98f4 c0de 990c c0de 9924 c0de     ............$...
c0de99f0:	993c c0de 9954 c0de 996c c0de 99a0 c0de     <...T...l.......
c0de9a00:	99d0 c0de ffff ffff                         ........

c0de9a08 <ux_cancel_lease_1_step_val>:
c0de9a08:	8648 c0de 8f5a c0de 8d85 c0de               H...Z.......

c0de9a14 <ux_cancel_lease_1_step>:
c0de9a14:	789f c0de 9a08 c0de 0000 0000 0000 0000     .x..............

c0de9a24 <ux_cancel_lease_2_step_val>:
c0de9a24:	8ccb c0de 00fd da7a                         ......z.

c0de9a2c <ux_cancel_lease_2_step>:
c0de9a2c:	7527 c0de 9a24 c0de 0000 0000 0000 0000     'u..$...........

c0de9a3c <ux_cancel_lease_3_step_val>:
c0de9a3c:	8cf0 c0de 01eb da7a                         ......z.

c0de9a44 <ux_cancel_lease_3_step>:
c0de9a44:	7527 c0de 9a3c c0de 0000 0000 0000 0000     'u..<...........

c0de9a54 <ux_cancel_lease_4_step_val>:
c0de9a54:	8bdf c0de 00d0 da7a                         ......z.

c0de9a5c <ux_cancel_lease_4_step>:
c0de9a5c:	7527 c0de 9a54 c0de 0000 0000 0000 0000     'u..T...........

c0de9a6c <ux_cancel_lease_5_step_val>:
c0de9a6c:	8c5e c0de 00ac da7a                         ^.....z.

c0de9a74 <ux_cancel_lease_5_step>:
c0de9a74:	7527 c0de 9a6c c0de 0000 0000 0000 0000     'u..l...........

c0de9a84 <ux_cancel_lease_6_step_val>:
c0de9a84:	8ba0 c0de 036d da7a                         ....m.z.

c0de9a8c <ux_cancel_lease_6_step>:
c0de9a8c:	7527 c0de 9a84 c0de 0000 0000 0000 0000     'u..............

c0de9a9c <ux_cancel_lease_7_step_validate_step>:
c0de9a9c:	4d1d c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de9aac <ux_cancel_lease_7_step_validate>:
c0de9aac:	9a9c c0de ffff ffff                         ........

c0de9ab4 <ux_cancel_lease_7_step_val>:
c0de9ab4:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de9ac0 <ux_cancel_lease_7_step>:
c0de9ac0:	781d c0de 9ab4 c0de 9aac c0de 0000 0000     .x..............

c0de9ad0 <ux_cancel_lease_8_step_validate_step>:
c0de9ad0:	4d23 c0de 0000 0000 0000 0000 0000 0000     #M..............

c0de9ae0 <ux_cancel_lease_8_step_validate>:
c0de9ae0:	9ad0 c0de ffff ffff                         ........

c0de9ae8 <ux_cancel_lease_8_step_val>:
c0de9ae8:	85e8 c0de 8bd8 c0de                         ........

c0de9af0 <ux_cancel_lease_8_step>:
c0de9af0:	770f c0de 9ae8 c0de 9ae0 c0de 0000 0000     .w..............

c0de9b00 <ux_cancel_lease_flow>:
c0de9b00:	9a14 c0de 9a2c c0de 9a44 c0de 9a5c c0de     ....,...D...\...
c0de9b10:	9a74 c0de 9a8c c0de 9ac0 c0de 9af0 c0de     t...............
c0de9b20:	ffff ffff                                   ....

c0de9b24 <ux_create_alias_1_step_val>:
c0de9b24:	8648 c0de 8f5a c0de 8f77 c0de               H...Z...w...

c0de9b30 <ux_create_alias_1_step>:
c0de9b30:	789f c0de 9b24 c0de 0000 0000 0000 0000     .x..$...........

c0de9b40 <ux_create_alias_2_step_val>:
c0de9b40:	8f6b c0de 00fd da7a                         k.....z.

c0de9b48 <ux_create_alias_2_step>:
c0de9b48:	7527 c0de 9b40 c0de 0000 0000 0000 0000     'u..@...........

c0de9b58 <ux_create_alias_3_step_val>:
c0de9b58:	8cf0 c0de 01eb da7a                         ......z.

c0de9b60 <ux_create_alias_3_step>:
c0de9b60:	7527 c0de 9b58 c0de 0000 0000 0000 0000     'u..X...........

c0de9b70 <ux_create_alias_4_step_val>:
c0de9b70:	8bdf c0de 00d0 da7a                         ......z.

c0de9b78 <ux_create_alias_4_step>:
c0de9b78:	7527 c0de 9b70 c0de 0000 0000 0000 0000     'u..p...........

c0de9b88 <ux_create_alias_5_step_val>:
c0de9b88:	8c5e c0de 00ac da7a                         ^.....z.

c0de9b90 <ux_create_alias_5_step>:
c0de9b90:	7527 c0de 9b88 c0de 0000 0000 0000 0000     'u..............

c0de9ba0 <ux_create_alias_6_step_val>:
c0de9ba0:	8ba0 c0de 036d da7a                         ....m.z.

c0de9ba8 <ux_create_alias_6_step>:
c0de9ba8:	7527 c0de 9ba0 c0de 0000 0000 0000 0000     'u..............

c0de9bb8 <ux_create_alias_7_step_validate_step>:
c0de9bb8:	4d29 c0de 0000 0000 0000 0000 0000 0000     )M..............

c0de9bc8 <ux_create_alias_7_step_validate>:
c0de9bc8:	9bb8 c0de ffff ffff                         ........

c0de9bd0 <ux_create_alias_7_step_val>:
c0de9bd0:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de9bdc <ux_create_alias_7_step>:
c0de9bdc:	781d c0de 9bd0 c0de 9bc8 c0de 0000 0000     .x..............

c0de9bec <ux_create_alias_8_step_validate_step>:
c0de9bec:	4d2f c0de 0000 0000 0000 0000 0000 0000     /M..............

c0de9bfc <ux_create_alias_8_step_validate>:
c0de9bfc:	9bec c0de ffff ffff                         ........

c0de9c04 <ux_create_alias_8_step_val>:
c0de9c04:	85e8 c0de 8bd8 c0de                         ........

c0de9c0c <ux_create_alias_8_step>:
c0de9c0c:	770f c0de 9c04 c0de 9bfc c0de 0000 0000     .w..............

c0de9c1c <ux_create_alias_flow>:
c0de9c1c:	9b30 c0de 9b48 c0de 9b60 c0de 9b78 c0de     0...H...`...x...
c0de9c2c:	9b90 c0de 9ba8 c0de 9bdc c0de 9c0c c0de     ................
c0de9c3c:	ffff ffff                                   ....

c0de9c40 <ux_masstransfer_1_step_val>:
c0de9c40:	8648 c0de 8f5a c0de 8de1 c0de               H...Z.......

c0de9c4c <ux_masstransfer_1_step>:
c0de9c4c:	789f c0de 9c40 c0de 0000 0000 0000 0000     .x..@...........

c0de9c5c <ux_masstransfer_2_step_val>:
c0de9c5c:	8b9a c0de 00fd da7a                         ......z.

c0de9c64 <ux_masstransfer_2_step>:
c0de9c64:	7527 c0de 9c5c c0de 0000 0000 0000 0000     'u..\...........

c0de9c74 <ux_masstransfer_3_step_val>:
c0de9c74:	8cf0 c0de 01eb da7a                         ......z.

c0de9c7c <ux_masstransfer_3_step>:
c0de9c7c:	7527 c0de 9c74 c0de 0000 0000 0000 0000     'u..t...........

c0de9c8c <ux_masstransfer_4_step_val>:
c0de9c8c:	8bdf c0de 00d0 da7a                         ......z.

c0de9c94 <ux_masstransfer_4_step>:
c0de9c94:	7527 c0de 9c8c c0de 0000 0000 0000 0000     'u..............

c0de9ca4 <ux_masstransfer_5_step_val>:
c0de9ca4:	8c53 c0de 012a da7a                         S...*.z.

c0de9cac <ux_masstransfer_5_step>:
c0de9cac:	4d35 c0de 9ca4 c0de 0000 0000 0000 0000     5M..............

c0de9cbc <ux_masstransfer_6_step_val>:
c0de9cbc:	8c5e c0de 00ac da7a                         ^.....z.

c0de9cc4 <ux_masstransfer_6_step>:
c0de9cc4:	7527 c0de 9cbc c0de 0000 0000 0000 0000     'u..............

c0de9cd4 <ux_masstransfer_7_step_val>:
c0de9cd4:	8ba0 c0de 036d da7a                         ....m.z.

c0de9cdc <ux_masstransfer_7_step>:
c0de9cdc:	7527 c0de 9cd4 c0de 0000 0000 0000 0000     'u..............

c0de9cec <ux_masstransfer_8_step_validate_step>:
c0de9cec:	4d57 c0de 0000 0000 0000 0000 0000 0000     WM..............

c0de9cfc <ux_masstransfer_8_step_validate>:
c0de9cfc:	9cec c0de ffff ffff                         ........

c0de9d04 <ux_masstransfer_8_step_val>:
c0de9d04:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de9d10 <ux_masstransfer_8_step>:
c0de9d10:	781d c0de 9d04 c0de 9cfc c0de 0000 0000     .x..............

c0de9d20 <ux_masstransfer_9_step_validate_step>:
c0de9d20:	4d5d c0de 0000 0000 0000 0000 0000 0000     ]M..............

c0de9d30 <ux_masstransfer_9_step_validate>:
c0de9d30:	9d20 c0de ffff ffff                          .......

c0de9d38 <ux_masstransfer_9_step_val>:
c0de9d38:	85e8 c0de 8bd8 c0de                         ........

c0de9d40 <ux_masstransfer_9_step>:
c0de9d40:	770f c0de 9d38 c0de 9d30 c0de 0000 0000     .w..8...0.......

c0de9d50 <ux_masstransfer_flow>:
c0de9d50:	9c4c c0de 9c64 c0de 9c7c c0de 9c94 c0de     L...d...|.......
c0de9d60:	9cac c0de 9cc4 c0de 9cdc c0de 9d10 c0de     ................
c0de9d70:	9d40 c0de ffff ffff                         @.......

c0de9d78 <ux_set_ac_script_1_step_val>:
c0de9d78:	8648 c0de 8f5a c0de 8be9 c0de               H...Z.......

c0de9d84 <ux_set_ac_script_1_step>:
c0de9d84:	789f c0de 9d78 c0de 0000 0000 0000 0000     .x..x...........

c0de9d94 <ux_set_ac_script_2_step_val>:
c0de9d94:	8cf0 c0de 01eb da7a                         ......z.

c0de9d9c <ux_set_ac_script_2_step>:
c0de9d9c:	7527 c0de 9d94 c0de 0000 0000 0000 0000     'u..............

c0de9dac <ux_set_ac_script_3_step_val>:
c0de9dac:	8bdf c0de 00d0 da7a                         ......z.

c0de9db4 <ux_set_ac_script_3_step>:
c0de9db4:	7527 c0de 9dac c0de 0000 0000 0000 0000     'u..............

c0de9dc4 <ux_set_ac_script_4_step_val>:
c0de9dc4:	8c5e c0de 00ac da7a                         ^.....z.

c0de9dcc <ux_set_ac_script_4_step>:
c0de9dcc:	7527 c0de 9dc4 c0de 0000 0000 0000 0000     'u..............

c0de9ddc <ux_set_ac_script_5_step_val>:
c0de9ddc:	8ba0 c0de 036d da7a                         ....m.z.

c0de9de4 <ux_set_ac_script_5_step>:
c0de9de4:	7527 c0de 9ddc c0de 0000 0000 0000 0000     'u..............

c0de9df4 <ux_set_ac_script_6_step_validate_step>:
c0de9df4:	4d63 c0de 0000 0000 0000 0000 0000 0000     cM..............

c0de9e04 <ux_set_ac_script_6_step_validate>:
c0de9e04:	9df4 c0de ffff ffff                         ........

c0de9e0c <ux_set_ac_script_6_step_val>:
c0de9e0c:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de9e18 <ux_set_ac_script_6_step>:
c0de9e18:	781d c0de 9e0c c0de 9e04 c0de 0000 0000     .x..............

c0de9e28 <ux_set_ac_script_7_step_validate_step>:
c0de9e28:	4d69 c0de 0000 0000 0000 0000 0000 0000     iM..............

c0de9e38 <ux_set_ac_script_7_step_validate>:
c0de9e38:	9e28 c0de ffff ffff                         (.......

c0de9e40 <ux_set_ac_script_7_step_val>:
c0de9e40:	85e8 c0de 8bd8 c0de                         ........

c0de9e48 <ux_set_ac_script_7_step>:
c0de9e48:	770f c0de 9e40 c0de 9e38 c0de 0000 0000     .w..@...8.......

c0de9e58 <ux_set_ac_script_flow>:
c0de9e58:	9d84 c0de 9d9c c0de 9db4 c0de 9dcc c0de     ................
c0de9e68:	9de4 c0de 9e18 c0de 9e48 c0de ffff ffff     ........H.......

c0de9e78 <ux_set_as_script_1_step_val>:
c0de9e78:	8648 c0de 8f5a c0de 8db1 c0de               H...Z.......

c0de9e84 <ux_set_as_script_1_step>:
c0de9e84:	789f c0de 9e78 c0de 0000 0000 0000 0000     .x..x...........

c0de9e94 <ux_set_as_script_2_step_val>:
c0de9e94:	8b9a c0de 00fd da7a                         ......z.

c0de9e9c <ux_set_as_script_2_step>:
c0de9e9c:	7527 c0de 9e94 c0de 0000 0000 0000 0000     'u..............

c0de9eac <ux_set_as_script_3_step_val>:
c0de9eac:	8cf0 c0de 01eb da7a                         ......z.

c0de9eb4 <ux_set_as_script_3_step>:
c0de9eb4:	7527 c0de 9eac c0de 0000 0000 0000 0000     'u..............

c0de9ec4 <ux_set_as_script_4_step_val>:
c0de9ec4:	8bdf c0de 00d0 da7a                         ......z.

c0de9ecc <ux_set_as_script_4_step>:
c0de9ecc:	7527 c0de 9ec4 c0de 0000 0000 0000 0000     'u..............

c0de9edc <ux_set_as_script_5_step_val>:
c0de9edc:	8c5e c0de 00ac da7a                         ^.....z.

c0de9ee4 <ux_set_as_script_5_step>:
c0de9ee4:	7527 c0de 9edc c0de 0000 0000 0000 0000     'u..............

c0de9ef4 <ux_set_as_script_6_step_val>:
c0de9ef4:	8ba0 c0de 036d da7a                         ....m.z.

c0de9efc <ux_set_as_script_6_step>:
c0de9efc:	7527 c0de 9ef4 c0de 0000 0000 0000 0000     'u..............

c0de9f0c <ux_set_as_script_7_step_validate_step>:
c0de9f0c:	4d6f c0de 0000 0000 0000 0000 0000 0000     oM..............

c0de9f1c <ux_set_as_script_7_step_validate>:
c0de9f1c:	9f0c c0de ffff ffff                         ........

c0de9f24 <ux_set_as_script_7_step_val>:
c0de9f24:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de9f30 <ux_set_as_script_7_step>:
c0de9f30:	781d c0de 9f24 c0de 9f1c c0de 0000 0000     .x..$...........

c0de9f40 <ux_set_as_script_8_step_validate_step>:
c0de9f40:	4d75 c0de 0000 0000 0000 0000 0000 0000     uM..............

c0de9f50 <ux_set_as_script_8_step_validate>:
c0de9f50:	9f40 c0de ffff ffff                         @.......

c0de9f58 <ux_set_as_script_8_step_val>:
c0de9f58:	85e8 c0de 8bd8 c0de                         ........

c0de9f60 <ux_set_as_script_8_step>:
c0de9f60:	770f c0de 9f58 c0de 9f50 c0de 0000 0000     .w..X...P.......

c0de9f70 <ux_set_as_script_flow>:
c0de9f70:	9e84 c0de 9e9c c0de 9eb4 c0de 9ecc c0de     ................
c0de9f80:	9ee4 c0de 9efc c0de 9f30 c0de 9f60 c0de     ........0...`...
c0de9f90:	ffff ffff                                   ....

c0de9f94 <ux_sponsorship_1_step_val>:
c0de9f94:	8648 c0de 8f5a c0de 8d1a c0de               H...Z.......

c0de9fa0 <ux_sponsorship_1_step>:
c0de9fa0:	789f c0de 9f94 c0de 0000 0000 0000 0000     .x..............

c0de9fb0 <ux_sponsorship_2_step_val>:
c0de9fb0:	8c34 c0de 00fd da7a                         4.....z.

c0de9fb8 <ux_sponsorship_2_step>:
c0de9fb8:	7527 c0de 9fb0 c0de 0000 0000 0000 0000     'u..............

c0de9fc8 <ux_sponsorship_3_step_val>:
c0de9fc8:	8b9a c0de 012a da7a                         ....*.z.

c0de9fd0 <ux_sponsorship_3_step>:
c0de9fd0:	7527 c0de 9fc8 c0de 0000 0000 0000 0000     'u..............

c0de9fe0 <ux_sponsorship_4_step_val>:
c0de9fe0:	8cf0 c0de 01eb da7a                         ......z.

c0de9fe8 <ux_sponsorship_4_step>:
c0de9fe8:	7527 c0de 9fe0 c0de 0000 0000 0000 0000     'u..............

c0de9ff8 <ux_sponsorship_5_step_val>:
c0de9ff8:	8bdf c0de 00d0 da7a                         ......z.

c0dea000 <ux_sponsorship_5_step>:
c0dea000:	7527 c0de 9ff8 c0de 0000 0000 0000 0000     'u..............

c0dea010 <ux_sponsorship_6_step_val>:
c0dea010:	8c5e c0de 00ac da7a                         ^.....z.

c0dea018 <ux_sponsorship_6_step>:
c0dea018:	7527 c0de a010 c0de 0000 0000 0000 0000     'u..............

c0dea028 <ux_sponsorship_7_step_val>:
c0dea028:	8ba0 c0de 036d da7a                         ....m.z.

c0dea030 <ux_sponsorship_7_step>:
c0dea030:	7527 c0de a028 c0de 0000 0000 0000 0000     'u..(...........

c0dea040 <ux_sponsorship_8_step_validate_step>:
c0dea040:	4d7b c0de 0000 0000 0000 0000 0000 0000     {M..............

c0dea050 <ux_sponsorship_8_step_validate>:
c0dea050:	a040 c0de ffff ffff                         @.......

c0dea058 <ux_sponsorship_8_step_val>:
c0dea058:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0dea064 <ux_sponsorship_8_step>:
c0dea064:	781d c0de a058 c0de a050 c0de 0000 0000     .x..X...P.......

c0dea074 <ux_sponsorship_9_step_validate_step>:
c0dea074:	4d81 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0dea084 <ux_sponsorship_9_step_validate>:
c0dea084:	a074 c0de ffff ffff                         t.......

c0dea08c <ux_sponsorship_9_step_val>:
c0dea08c:	85e8 c0de 8bd8 c0de                         ........

c0dea094 <ux_sponsorship_9_step>:
c0dea094:	770f c0de a08c c0de a084 c0de 0000 0000     .w..............

c0dea0a4 <ux_sponsorship_flow>:
c0dea0a4:	9fa0 c0de 9fb8 c0de 9fd0 c0de 9fe8 c0de     ................
c0dea0b4:	a000 c0de a018 c0de a030 c0de a064 c0de     ........0...d...
c0dea0c4:	a094 c0de ffff ffff                         ........

c0dea0cc <ux_update_asset_1_step_val>:
c0dea0cc:	8648 c0de 8f5a c0de 8f86 c0de               H...Z.......

c0dea0d8 <ux_update_asset_1_step>:
c0dea0d8:	789f c0de a0cc c0de 0000 0000 0000 0000     .x..............

c0dea0e8 <ux_update_asset_2_step_val>:
c0dea0e8:	8b9a c0de 00fd da7a                         ......z.

c0dea0f0 <ux_update_asset_2_step>:
c0dea0f0:	7527 c0de a0e8 c0de 0000 0000 0000 0000     'u..............

c0dea100 <ux_update_asset_3_step_val>:
c0dea100:	8d80 c0de 012a da7a                         ....*.z.

c0dea108 <ux_update_asset_3_step>:
c0dea108:	7527 c0de a100 c0de 0000 0000 0000 0000     'u..............

c0dea118 <ux_update_asset_4_step_val>:
c0dea118:	8c63 c0de 017b da7a                         c...{.z.

c0dea120 <ux_update_asset_4_step>:
c0dea120:	7527 c0de a118 c0de 0000 0000 0000 0000     'u..............

c0dea130 <ux_update_asset_5_step_val>:
c0dea130:	8cf0 c0de 01eb da7a                         ......z.

c0dea138 <ux_update_asset_5_step>:
c0dea138:	7527 c0de a130 c0de 0000 0000 0000 0000     'u..0...........

c0dea148 <ux_update_asset_6_step_val>:
c0dea148:	8bdf c0de 00d0 da7a                         ......z.

c0dea150 <ux_update_asset_6_step>:
c0dea150:	7527 c0de a148 c0de 0000 0000 0000 0000     'u..H...........

c0dea160 <ux_update_asset_7_step_val>:
c0dea160:	8c5e c0de 00ac da7a                         ^.....z.

c0dea168 <ux_update_asset_7_step>:
c0dea168:	7527 c0de a160 c0de 0000 0000 0000 0000     'u..`...........

c0dea178 <ux_update_asset_8_step_val>:
c0dea178:	8ba0 c0de 036d da7a                         ....m.z.

c0dea180 <ux_update_asset_8_step>:
c0dea180:	7527 c0de a178 c0de 0000 0000 0000 0000     'u..x...........

c0dea190 <ux_update_asset_9_step_validate_step>:
c0dea190:	4d87 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0dea1a0 <ux_update_asset_9_step_validate>:
c0dea1a0:	a190 c0de ffff ffff                         ........

c0dea1a8 <ux_update_asset_9_step_val>:
c0dea1a8:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0dea1b4 <ux_update_asset_9_step>:
c0dea1b4:	781d c0de a1a8 c0de a1a0 c0de 0000 0000     .x..............

c0dea1c4 <ux_update_asset_10_step_validate_step>:
c0dea1c4:	4d8d c0de 0000 0000 0000 0000 0000 0000     .M..............

c0dea1d4 <ux_update_asset_10_step_validate>:
c0dea1d4:	a1c4 c0de ffff ffff                         ........

c0dea1dc <ux_update_asset_10_step_val>:
c0dea1dc:	85e8 c0de 8bd8 c0de                         ........

c0dea1e4 <ux_update_asset_10_step>:
c0dea1e4:	770f c0de a1dc c0de a1d4 c0de 0000 0000     .w..............

c0dea1f4 <ux_update_asset_flow>:
c0dea1f4:	a0d8 c0de a0f0 c0de a108 c0de a120 c0de     ............ ...
c0dea204:	a138 c0de a150 c0de a168 c0de a180 c0de     8...P...h.......
c0dea214:	a1b4 c0de a1e4 c0de ffff ffff               ............

c0dea220 <ux_invoke_1_step_val>:
c0dea220:	8648 c0de 8f5a c0de 8bb8 c0de               H...Z.......

c0dea22c <ux_invoke_1_step>:
c0dea22c:	789f c0de a220 c0de 0000 0000 0000 0000     .x.. ...........

c0dea23c <ux_invoke_2_step_val>:
c0dea23c:	8cb4 c0de 0157 da7a                         ....W.z.

c0dea244 <ux_invoke_2_step>:
c0dea244:	7527 c0de a23c c0de 0000 0000 0000 0000     'u..<...........

c0dea254 <ux_invoke_3_step_val>:
c0dea254:	8bca c0de 012a da7a                         ....*.z.

c0dea25c <ux_invoke_3_step>:
c0dea25c:	7527 c0de a254 c0de 0000 0000 0000 0000     'u..T...........

c0dea26c <ux_invoke_4_step_val>:
c0dea26c:	8e3b c0de 017b da7a                         ;...{.z.

c0dea274 <ux_invoke_4_step>:
c0dea274:	4d93 c0de a26c c0de 0000 0000 0000 0000     .M..l...........

c0dea284 <ux_invoke_5_step_val>:
c0dea284:	8cf4 c0de 00fd da7a                         ......z.

c0dea28c <ux_invoke_5_step>:
c0dea28c:	4db5 c0de a284 c0de 0000 0000 0000 0000     .M..............

c0dea29c <ux_invoke_6_step_val>:
c0dea29c:	8b89 c0de 01d5 da7a                         ......z.

c0dea2a4 <ux_invoke_6_step>:
c0dea2a4:	4dd5 c0de a29c c0de 0000 0000 0000 0000     .M..............

c0dea2b4 <ux_invoke_7_step_val>:
c0dea2b4:	8ea4 c0de 01a8 da7a                         ......z.

c0dea2bc <ux_invoke_7_step>:
c0dea2bc:	4df7 c0de a2b4 c0de 0000 0000 0000 0000     .M..............

c0dea2cc <ux_invoke_8_step_val>:
c0dea2cc:	8cf0 c0de 01eb da7a                         ......z.

c0dea2d4 <ux_invoke_8_step>:
c0dea2d4:	7527 c0de a2cc c0de 0000 0000 0000 0000     'u..............

c0dea2e4 <ux_invoke_9_step_val>:
c0dea2e4:	8bdf c0de 00d0 da7a                         ......z.

c0dea2ec <ux_invoke_9_step>:
c0dea2ec:	7527 c0de a2e4 c0de 0000 0000 0000 0000     'u..............

c0dea2fc <ux_invoke_10_step_val>:
c0dea2fc:	8c5e c0de 00ac da7a                         ^.....z.

c0dea304 <ux_invoke_10_step>:
c0dea304:	7527 c0de a2fc c0de 0000 0000 0000 0000     'u..............

c0dea314 <ux_invoke_11_step_val>:
c0dea314:	8ba0 c0de 036d da7a                         ....m.z.

c0dea31c <ux_invoke_11_step>:
c0dea31c:	7527 c0de a314 c0de 0000 0000 0000 0000     'u..............

c0dea32c <ux_invoke_12_step_validate_step>:
c0dea32c:	4e19 c0de 0000 0000 0000 0000 0000 0000     .N..............

c0dea33c <ux_invoke_12_step_validate>:
c0dea33c:	a32c c0de ffff ffff                         ,.......

c0dea344 <ux_invoke_12_step_val>:
c0dea344:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0dea350 <ux_invoke_12_step>:
c0dea350:	781d c0de a344 c0de a33c c0de 0000 0000     .x..D...<.......

c0dea360 <ux_invoke_13_step_validate_step>:
c0dea360:	4e1f c0de 0000 0000 0000 0000 0000 0000     .N..............

c0dea370 <ux_invoke_13_step_validate>:
c0dea370:	a360 c0de ffff ffff                         `.......

c0dea378 <ux_invoke_13_step_val>:
c0dea378:	85e8 c0de 8bd8 c0de                         ........

c0dea380 <ux_invoke_13_step>:
c0dea380:	770f c0de a378 c0de a370 c0de 0000 0000     .w..x...p.......

c0dea390 <ux_invoke_flow>:
c0dea390:	a22c c0de a244 c0de a25c c0de a274 c0de     ,...D...\...t...
c0dea3a0:	a28c c0de a2a4 c0de a2bc c0de a2d4 c0de     ................
c0dea3b0:	a2ec c0de a304 c0de a31c c0de a350 c0de     ............P...
c0dea3c0:	a380 c0de ffff ffff                         ........

c0dea3c8 <ux_order_1_step_val>:
c0dea3c8:	8648 c0de 8f5a c0de 0157 da7a               H...Z...W.z.

c0dea3d4 <ux_order_1_step>:
c0dea3d4:	789f c0de a3c8 c0de 0000 0000 0000 0000     .x..............

c0dea3e4 <ux_order_2_step_val>:
c0dea3e4:	8c34 c0de 017b da7a                         4...{.z.

c0dea3ec <ux_order_2_step>:
c0dea3ec:	7527 c0de a3e4 c0de 0000 0000 0000 0000     'u..............

c0dea3fc <ux_order_3_step_val>:
c0dea3fc:	8dc2 c0de 00fd da7a                         ......z.

c0dea404 <ux_order_3_step>:
c0dea404:	7527 c0de a3fc c0de 0000 0000 0000 0000     'u..............

c0dea414 <ux_order_4_step_val>:
c0dea414:	8c5e c0de 00ac da7a                         ^.....z.

c0dea41c <ux_order_4_step>:
c0dea41c:	7527 c0de a414 c0de 0000 0000 0000 0000     'u..............

c0dea42c <ux_order_5_step_val>:
c0dea42c:	8f13 c0de 012a da7a                         ....*.z.

c0dea434 <ux_order_5_step>:
c0dea434:	7527 c0de a42c c0de 0000 0000 0000 0000     'u..,...........

c0dea444 <ux_order_6_step_val>:
c0dea444:	8d29 c0de 01eb da7a                         ).....z.

c0dea44c <ux_order_6_step>:
c0dea44c:	7527 c0de a444 c0de 0000 0000 0000 0000     'u..D...........

c0dea45c <ux_order_7_step_val>:
c0dea45c:	8bdf c0de 00d0 da7a                         ......z.

c0dea464 <ux_order_7_step>:
c0dea464:	7527 c0de a45c c0de 0000 0000 0000 0000     'u..\...........

c0dea474 <ux_order_8_step_val>:
c0dea474:	8bfc c0de 036d da7a                         ....m.z.

c0dea47c <ux_order_8_step>:
c0dea47c:	7527 c0de a474 c0de 0000 0000 0000 0000     'u..t...........

c0dea48c <ux_order_9_step_validate_step>:
c0dea48c:	4e25 c0de 0000 0000 0000 0000 0000 0000     %N..............

c0dea49c <ux_order_9_step_validate>:
c0dea49c:	a48c c0de ffff ffff                         ........

c0dea4a4 <ux_order_9_step_val>:
c0dea4a4:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0dea4b0 <ux_order_9_step>:
c0dea4b0:	781d c0de a4a4 c0de a49c c0de 0000 0000     .x..............

c0dea4c0 <ux_order_10_step_validate_step>:
c0dea4c0:	4e2b c0de 0000 0000 0000 0000 0000 0000     +N..............

c0dea4d0 <ux_order_10_step_validate>:
c0dea4d0:	a4c0 c0de ffff ffff                         ........

c0dea4d8 <ux_order_10_step_val>:
c0dea4d8:	85e8 c0de 8bd8 c0de                         ........

c0dea4e0 <ux_order_10_step>:
c0dea4e0:	770f c0de a4d8 c0de a4d0 c0de 0000 0000     .w..............

c0dea4f0 <ux_order_flow>:
c0dea4f0:	a3d4 c0de a3ec c0de a404 c0de a41c c0de     ................
c0dea500:	a434 c0de a44c c0de a464 c0de a47c c0de     4...L...d...|...
c0dea510:	a4b0 c0de a4e0 c0de ffff ffff               ............

c0dea51c <ux_verify_transaction_1_step_val>:
c0dea51c:	8f5a c0de 00fd da7a                         Z.....z.

c0dea524 <ux_verify_transaction_1_step>:
c0dea524:	7527 c0de a51c c0de 0000 0000 0000 0000     'u..............

c0dea534 <ux_verify_transaction_2_step_val>:
c0dea534:	012a da7a 036d da7a                         *.z.m.z.

c0dea53c <ux_verify_transaction_2_step>:
c0dea53c:	7527 c0de a534 c0de 0000 0000 0000 0000     'u..4...........

c0dea54c <ux_verify_transaction_3_step_val>:
c0dea54c:	8c5e c0de 00ac da7a                         ^.....z.

c0dea554 <ux_verify_transaction_3_step>:
c0dea554:	7527 c0de a54c c0de 0000 0000 0000 0000     'u..L...........

c0dea564 <ux_verify_transaction_4_step_validate_step>:
c0dea564:	4e31 c0de 0000 0000 0000 0000 0000 0000     1N..............

c0dea574 <ux_verify_transaction_4_step_validate>:
c0dea574:	a564 c0de ffff ffff                         d.......

c0dea57c <ux_verify_transaction_4_step_val>:
c0dea57c:	8678 c0de 8c89 c0de 8d9a c0de               x...........

c0dea588 <ux_verify_transaction_4_step>:
c0dea588:	781d c0de a57c c0de a574 c0de 0000 0000     .x..|...t.......

c0dea598 <ux_verify_transaction_5_step_validate_step>:
c0dea598:	4e37 c0de 0000 0000 0000 0000 0000 0000     7N..............

c0dea5a8 <ux_verify_transaction_5_step_validate>:
c0dea5a8:	a598 c0de ffff ffff                         ........

c0dea5b0 <ux_verify_transaction_5_step_val>:
c0dea5b0:	85e8 c0de 8bd8 c0de                         ........

c0dea5b8 <ux_verify_transaction_5_step>:
c0dea5b8:	770f c0de a5b0 c0de a5a8 c0de 0000 0000     .w..............

c0dea5c8 <ux_verify_transaction_flow>:
c0dea5c8:	a524 c0de a53c c0de a554 c0de a588 c0de     $...<...T.......
c0dea5d8:	a5b8 c0de ffff ffff                         ........

c0dea5e0 <ux_processing_step_val>:
c0dea5e0:	85b8 c0de 8b73 c0de                         ....s...

c0dea5e8 <ux_processing_step>:
c0dea5e8:	770f c0de a5e0 c0de 0000 0000 0000 0000     .w..............

c0dea5f8 <ux_processing_flow>:
c0dea5f8:	a5e8 c0de ffff ffff 7254 6e61 6173 7463     ........Transact
c0dea608:	6f69 206e 6449 0000                         ion Id..

c0dea610 <g_pcHex>:
c0dea610:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef

c0dea620 <g_pcHex_cap>:
c0dea620:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF
c0dea630:	6163 636e 6c65 6c20 6165 6973 676e 0000     cancel leasing..

c0dea640 <.L.str.55>:
c0dea640:	7369 7573 0065 0000                         issue...

c0dea648 <.L.str.56>:
c0dea648:	7274 6e61 6673 7265 0000                    transfer..

c0dea652 <.L.str.58>:
c0dea652:	7562 6e72 0000                              burn..

c0dea658 <.L.str.59>:
c0dea658:	7473 7261 2074 656c 7361 6e69 0067 0000     start leasing...

c0dea668 <.L.str.61>:
c0dea668:	7254 6e61 6173 7463 6f69 206e 6148 6873     Transaction Hash
c0dea678:	0000 0000                                   ....

c0dea67c <.L.str.62>:
c0dea67c:	7263 6165 6974 676e 6120 206e 6c61 6169     creating an alia
c0dea68c:	0073 0000                                   s...

c0dea690 <.L.str.63>:
c0dea690:	616d 7373 7420 6172 736e 6566 0072           mass transfer..

c0dea69f <.L.str.64>:
c0dea69f:	6164 6174 0000 0000                          data.....

c0dea6a8 <.L.str.65>:
c0dea6a8:	6573 2074 6373 6972 7470 0000               set script..

c0dea6b4 <.L.str.66>:
c0dea6b4:	7073 6e6f 6f73 7372 6968 0070 0000 0000     sponsorship.....

c0dea6c4 <.L.str.67>:
c0dea6c4:	7361 6573 2074 6373 6972 7470 0000 0000     asset script....

c0dea6d4 <.L.str.68>:
c0dea6d4:	6373 6972 7470 6920 766e 636f 7461 6f69     script invocatio
c0dea6e4:	006e 0000                                   n...

c0dea6e8 <.L.str.69>:
c0dea6e8:	7075 6164 6574 6120 7373 7465 6920 666e     update asset inf
c0dea6f8:	006f                                         o..

c0dea6fb <.L.str.70>:
c0dea6fb:	6148 6873 0000                              Hash..

c0dea701 <.L.str.71>:
c0dea701:	726f 6564 0072                               order..

c0dea708 <.L.str.74>:
c0dea708:	6f73 656d 6874 6e69 0067 0000               something...

c0dea714 <.L.str.75>:
c0dea714:	7274 6e61 6173 7463 6f69 006e                transaction..

c0dea721 <seph_io_general_status>:
c0dea721:	0060 0002                                    `....

c0dea726 <bitmapOPEN_SANS_EXTRABOLD_11PX>:
c0dea726:	f3ff 253b 9224 f29f 4897 8824 2cb7 870e     ..;%$....H$..,..
c0dea736:	1fa6 4e02 b1ac 7ec2 637e 358d 3c72 d86c     ...N...~~c.5r<l.
c0dea746:	e0e0 9eed df3d b417 cdb7 d926 7b6c 4c0b     ....=.....&.l{.L
c0dea756:	7bfb 0c1e 33f3 d60c 0fff 3118 8c66 de18     .{...3.....1f...
c0dea766:	cf3c 3cf3 ec7b cccf 6ecc cc63 f99c 630f     <..<{....nc....c
c0dea776:	3187 187e 69c7 8fda 3f61 ccf3 9cfc 7c21     .1~..i..a?....!|
c0dea786:	3cf3 1f7b cc63 3318 3cde f37b 7b3c 3cde     .<{.c..3.<{.<{.<
c0dea796:	3ecf 398c 0f0f 6036 980d 6199 0618 f03f     .>.9..6`...a..?.
c0dea7a6:	c303 cc30 0fcc 6763 3180 30f8 f766 4bd6     ..0...cg.1.0f..K
c0dea7b6:	bdaf 019f 01f8 3c18 7e3c 7e66 c3e7 ef7f     .......<<~f~....
c0dea7c6:	f7b7 7efe 318c f0c6 3cdf f3cf 7f3c f33f     ...~.1...<..<.?.
c0dea7d6:	f333 8c7f c637 fe18 ec30 3cf3 f3fb ff3c     3...7...0..<..<.
c0dea7e6:	3cf3 ffcf ccff cccc cccc f307 e6d9 d9f1     .<..............
c0dea7f6:	e6cc 8c63 c631 c7f8 bf8f ff7f f57e ddee     ..c.1.......~...
c0dea806:	f3e7 bdfb cfdf bee7 78f1 1e3c 7d8f ef7f     .........x<..}..
c0dea816:	c7fd be18 78f1 1e3c 7d8f 3030 b6cf cf6d     .....x<..}00..m.
c0dea826:	cdb6 8c7e 38e3 3f7f 30c3 c30c f330 cf3c     ..~..8.?.0..0.<.
c0dea836:	3cf3 f37b cf3c e79e 7331 9bb6 acdd 3566     .<{.<...1s....f5
c0dea846:	70ee 1b07 66c3 3c3c 3c3c c366 9b63 838d     .p...f<<<<f.c...
c0dea856:	60c1 7f30 0e18 70c3 fe18 333f 3333 43f3     .`0....p..?333.C
c0dea866:	c318 c218 cccf cccc 0cfc 49e3 3f33 1e33     ...........I3?3.
c0dea876:	cfec 0fb3 f0c3 fb6d 7dbe 71bc 061c 300f     ......m..}.q...0
c0dea886:	dbcc 6df7 3cf3 fff3 e060 dc01 637c 318c     ...m.<..`...|c.1
c0dea896:	9b7e 63cd 8df0 3ec7 fc63 f7bd f3de 0cff     ~..c...>c.......
c0dea8a6:	cccc cccc c307 7db0 b3cf ffed edff dbdb     .......}........
c0dea8b6:	dbdb 7ddb bdef 1c37 fddb e36e b6df dbef     ...}..7...n.....
c0dea8c6:	0c37 be03 df7d 0fb6 30c3 33fd 6f33 8f3c     7...}....0.33o<.
c0dea8d6:	e61f 631b 070c ef7b 2fbd 9b63 c6cd 33e1     ...c..{../c....3
c0dea8e6:	e6db 7f9f 30cc 7703 871b bb63 6303 8d9b     .....0.w..c..c..
c0dea8f6:	e1c6 1870 3f0e 30c6 0fc6 319c 0e76 8c63     ..p..?.0...1v.c.
c0dea906:	ff03 3fff 18c7 b9c3 e631 0f6f 0000          ...?....1.o...

c0dea914 <charactersOPEN_SANS_EXTRABOLD_11PX>:
c0dea914:	c000 0000 c000 0088 8008 0089 c010 0081     ................
c0dea924:	802c 0001 c04c 1082 4074 0082 c098 0088     ,...L...t@......
c0dea934:	009c 1081 00ac 0089 80bc 0081 80cc 0101     ................
c0dea944:	c0dc 0380 00e0 0281 c0e4 0388 40e8 0081     .............@..
c0dea954:	00fc 108a 8114 1089 c124 1089 c138 1089     ........$...8...
c0dea964:	014c 108a 8164 1089 0174 108a c18c 1089     L...d...t.......
c0dea974:	01a0 108a 01b8 108a c1d0 0188 c1d8 0180     ................
c0dea984:	41e4 0101 81f8 0201 4204 0101 8214 1081     .A.......B......
c0dea994:	8228 0082 0258 0082 c278 1089 c28c 1089     (...X...x.......
c0dea9a4:	02a0 108a 82b8 1089 82c8 0089 02dc 108a     ................
c0dea9b4:	02f4 108a 030c 1089 4314 1081 032c 008a     .........C..,...
c0dea9c4:	8348 0089 c35c 108a 4380 108a 439c 108a     H...\....C...C..
c0dea9d4:	c3b8 1089 43cc 108a 03f0 108a 8408 0089     .....C..........
c0dea9e4:	841c 0081 0434 108a 844c 0081 c464 0082     ....4...L...d...
c0dea9f4:	0490 0082 c4b0 0081 c4cc 0081 44e8 0089     .............D..
c0deaa04:	44fc 0081 4510 1081 c524 1081 c534 1501     .D...E..$...4...
c0deaa14:	c538 2011 c53c 1181 c550 0089 8568 0181     8.. <...P...h...
c0deaa24:	c57c 1081 c594 0181 85ac 1081 c5c0 0181     |...............
c0deaa34:	c5e0 1089 05f4 1089 45fc 1081 c614 0089     .........E......
c0deaa44:	062c 1089 8634 118a c64c 1189 c65c 0181     ,...4...L...\...
c0deaa54:	c670 0189 c68c 1181 46a8 0189 86b4 0189     p........F......
c0deaa64:	46c4 0101 c6d8 1189 c6e8 0181 86fc 0182     .F..............
c0deaa74:	c71c 0181 0734 1182 8754 0181 4768 0081     ....4...T...hG..
c0deaa84:	8784 2091 4790 0081 87a8 0201               ... .G......

c0deaa90 <fontOPEN_SANS_EXTRABOLD_11PX>:
c0deaa90:	01ec 0108 090c 7e20 a914 c0de a726 c0de     ...... ~....&...

c0deaaa0 <bitmapOPEN_SANS_LIGHT_16PX>:
c0deaaa0:	0cff 9999 4090 0882 fe22 8123 7fc4 1044     .....@..".#...D.
c0deaab0:	0241 0809 229e 5091 7070 6448 83ca 4906     A....".PppHd...I
c0deaac0:	2244 9092 9484 1299 9092 2444 0922 1c06     D"........D$"...
c0deaad0:	8844 4110 8181 90c4 0341 f30d 0f09 555a     D..A....A.....ZU
c0deaae0:	2955 aaa5 16aa 0408 4fe2 88a1 0408 8fe2     U).......O......
c0deaaf0:	2040 076a 100f 4421 2108 8842 511c 1830     @ j...!D.!B..Q0.
c0deab00:	060c c183 88a0 7403 9249 0924 109e 0408     .......tI.$.....
c0deab10:	4102 0410 e041 9e0f 1010 f304 8080 2040     .A..A.........@ 
c0deab20:	03e8 c040 4140 8482 1088 ff21 0081 0201     ..@.@A....!.....
c0deab30:	813e 1040 80f8 4081 c860 3803 2083 e810     >.@....@`..8. ..
c0deab40:	830d a0c1 0790 207f 0408 4082 0810 8104     ....... ...@....
c0deab50:	511c 2830 88e2 c182 d060 9e07 3050 0c18     .Q0(....`...P0..
c0deab60:	817b 1040 01cc c00f 0f03 0540 1840 c063     {.@.......@.@.c.
c0deab70:	0180 7f01 e000 010f 0603 318c 0f04 0842     ...........1..B.
c0deab80:	1111 0802 f001 20c1 2402 119e 9099 9909     ....... .$......
c0deab90:	8990 7719 2001 0400 0f80 c030 0300 4812     ...w. ....0....H
c0deaba0:	4120 3f08 0902 5024 9f80 3050 fa18 8284      A.?..$P..P0....
c0deabb0:	60c1 03e8 04f8 0102 0101 0101 0201 f804     .`..............
c0deabc0:	211f 8141 8181 8181 4181 1f21 107f c104     .!A......A!.....
c0deabd0:	041f 1041 7ffc 0410 f041 4107 0410 11f8     ..A.....A..A....
c0deabe0:	4020 0100 1004 807e 0a01 2048 817e 8181      @....~...H ~...
c0deabf0:	8181 81ff 8181 8181 ff81 240f 9249 4924     ...........$I.$I
c0deac00:	c10e 2450 1851 1214 4891 0828 1041 4104     ..P$Q....H(.A..A
c0deac10:	0410 1041 01fc 3c06 c0f0 1685 685a 4992     ..A....<....Zh.I
c0deac20:	18c6 8063 8381 8583 8985 9191 c1a1 81c1     ..c.............
c0deac30:	1078 5022 0180 1806 8060 0a01 0844 5f1e     x."P....`...D.._
c0deac40:	8618 f861 4105 0410 1078 5022 0180 1806     ..a..A..x."P....
c0deac50:	8060 0a01 0844 401e 0200 9f18 3050 0c18     `...D..@....P0..
c0deac60:	227d 5091 0830 60be 1020 c070 4080 f020     }".P0..` .p..@ .
c0deac70:	7f07 0204 4081 1020 0408 0102 8181 8181     .....@ .........
c0deac80:	8181 8181 8181 3c42 0301 120a 8824 1108     ......B<....$...
c0deac90:	2822 4050 c180 30a0 0c24 4489 1122 4249     "(P@...0$..D".IB
c0deaca0:	5092 1428 860a 6181 1020 0482 4111 0282     .P(....a ....A..
c0deacb0:	0a02 4414 0888 080a 4281 2442 1824 1018     ...D.....BB$$...
c0deacc0:	1010 1010 207f 0408 2041 0208 e041 1f0f     ..... ..A ..A...
c0deacd0:	1111 1111 1111 410f 4108 2108 2108 8f08     .......A.A.!.!..
c0deace0:	8888 8888 8888 080f 450a 0a24 0106 117f     .........E$.....
c0deacf0:	1e01 8208 187e 2ec6 0101 0101 433d 8181     ....~.......=C..
c0dead00:	8181 4381 bc3d 0410 1041 3c08 8080 8080     ...C=...A..<....
c0dead10:	c2bc 8181 8181 c281 1cbc 3051 0ff8 8404     ..........Q0....
c0dead20:	383c 1041 411f 0410 1041 fc04 4222 2242     <8A..A..A..."BB"
c0dead30:	043c 7c02 8142 3e43 4081 d020 0519 c183     <..|B.C>.@ .....
c0dead40:	3060 0418 07f9 4804 2492 1e49 4081 1020     `0.....H.$I..@ .
c0dead50:	248a 850a 2445 0414 1fff 339d 4146 8418     .$..E$.....3FA..
c0dead60:	1841 4184 8418 0841 519d 1830 060c 4183     A..A..A..Q0....A
c0dead70:	511c 1830 060c 1c45 433d 8181 8181 4381     .Q0...E.=C.....C
c0dead80:	013d 0101 bc01 81c2 8181 8181 bcc2 8080     =...............
c0dead90:	8080 847d 4210 0108 843e 20c1 0f84 09e2     ..}..B..>.. ....
c0deada0:	8421 8210 c103 3060 0c18 c506 c15e 48a0     !.....`0....^..H
c0deadb0:	a224 2850 6108 4628 2462 9249 2944 830c     $.P(.a(Fb$I.D)..
c0deadc0:	0810 6101 3128 230c 2185 a0c1 2448 50a2     ...a(1.#.!..H$.P
c0deadd0:	0828 8104 1f30 4422 0884 981f 4210 1908     (...0."D.....B..
c0deade0:	1084 0842 ff06 01ff 1043 0842 84c1 4210     ..B.....C.B....B
c0deadf0:	07c4 003c                                   ..<.

c0deadf4 <charactersOPEN_SANS_LIGHT_16PX>:
c0deadf4:	0000 0001 c000 1088 8008 1089 8010 0082     ................
c0deae04:	404c 108a 4078 108b c0bc 108a c0f4 1088     L@..x@..........
c0deae14:	00f8 1089 0108 1089 4118 100a 4130 110a     .........A..0A..
c0deae24:	c148 1580 414c 1409 0150 1589 8154 1081     H...LA..P...T...
c0deae34:	4170 108a 419c 4092 41b0 108a 41dc 108a     pA...A.@.A...A..
c0deae44:	4208 0082 4240 108a 426c 108a 4298 108a     .B..@B..lB...B..
c0deae54:	42c0 108a 42ec 108a 0318 1209 0324 1209     .B...B......$...
c0deae64:	4330 118a 434c 128a 435c 118a c374 1089     0C..LC..\C..t...
c0deae74:	8394 108b 83e8 0082 8424 1092 8450 108a     ........$...P...
c0deae84:	c480 1092 44b0 1092 04d4 0092 04f8 108b     .....D..........
c0deae94:	0534 2093 0564 1091 856c 3081 4584 0092     4.. d...l..0.E..
c0deaea4:	05b0 0092 85d4 2093 0610 2093 0640 108b     ....... ... @...
c0deaeb4:	467c 1092 06a0 108b 86ec 1092 4718 108a     |F...........G..
c0deaec4:	c744 0081 0770 2093 87a0 1082 87d4 0083     D...p.. ........
c0deaed4:	4828 0082 4860 1082 4890 108a 48bc 0089     (H..`H...H...H..
c0deaee4:	88dc 1081 48fc 1081 491c 108a 0938 1702     .....H...I..8...
c0deaef4:	493c 301a 0944 120a 8960 100a 0994 120a     <I.0D...`.......
c0deaf04:	89b0 100a 49e4 120a 8a04 0001 0a2c 0202     .....I......,...
c0deaf14:	4a60 100a 0a90 2109 4a98 2101 0ab0 000a     `J.....!.J.!....
c0deaf24:	0ae0 2009 8ae8 120b 4b20 120a 4b40 120a     ... .... K..@K..
c0deaf34:	8b60 120a 8b94 120a 8bc8 0209 cbe0 1209     `...............
c0deaf44:	4bf8 0181 4c14 120a 0c34 1202 0c54 0203     .K...L..4...T...
c0deaf54:	0c8c 120a 0ca8 1202 ccd4 1209 8cec 1081     ................
c0deaf64:	8d14 4009 8d20 0089 4d44 130a               ...@ ...DM..

c0deaf70 <fontOPEN_SANS_LIGHT_16PX>:
c0deaf70:	0353 0109 0d11 7e20 adf4 c0de aaa0 c0de     S..... ~........

c0deaf80 <bitmapOPEN_SANS_REGULAR_11PX>:
c0deaf80:	0fbf 9220 429f 49f9 5f04 cc65 a30f a54a     .. ..B.I._e...J.
c0deaf90:	a5bd c552 924e 6518 bd1a 6a03 0a95 6a95     ..R.N..e...j...j
c0deafa0:	0405 33f1 c812 1a8f 0103 4448 1222 9996     ...3......HD"...
c0deafb0:	6999 492e 8792 2488 87f1 8868 1078 4946     .i.I...$..h.x.FI
c0deafc0:	0fd2 1f41 88f1 1e78 99f1 8f69 2448 9622     ..A...x...i.H$".
c0deafd0:	9969 9669 8f99 2178 6802 3348 0f84 210f     i.i...x!.hH3...!
c0deafe0:	12cc 4887 2022 827c a5b9 a5a5 01fd 083e     ...H" |.......>.
c0deaff0:	850a f222 8289 c63f 6317 7efc 1084 f0c2     .."...?..c.~....
c0deb000:	185f 6186 7e18 f11f f111 843f 43f0 7e08     _..a.~....?..C.~
c0deb010:	0410 1871 61fa fe18 1861 ff86 4924 1c92     ..q..a..a...$I..
c0deb020:	5251 450c 8512 8421 4210 c3f8 c3c3 a5a5     QR.E..!..B......
c0deb030:	9999 e199 9658 1a69 be87 3060 0c18 7d06     ....X.i...`0...}
c0deb040:	c62f 42f8 be08 3060 0c18 7d06 1010 c62f     /..B..`0...}../.
c0deb050:	52f8 1e8c 8c31 9f78 4210 2108 1861 6186     .R..1.x..B.!a..a
c0deb060:	7a18 9141 4448 50a1 3110 24ca 5293 294a     .zA.HD.P.1.$.RJ)
c0deb070:	0845 a121 30c4 248c a185 3124 8208 8f20     E.!..0.$..$1.. .
c0deb080:	1244 4ff1 2492 2139 4422 2784 9249 0c3c     D..O.$9!"D.'I.<.
c0deb090:	4923 1f21 8f09 f99f bc21 6318 1e7c e111     #I!.....!..c|...
c0deb0a0:	fa10 6318 9ef4 e11f 2f2c 2222 24be 8239     ...c....,/"".$9.
c0deb0b0:	8617 211e 18bc 8c63 04fd 9249 01e4 5911     ...!..c...I....Y
c0deb0c0:	9953 efff 9191 9191 2f91 18c6 2e23 18c6     S......../..#...
c0deb0d0:	2f1d 18c6 085f 3e01 18c6 843d 4f10 1792     ./.._..>..=..O..
c0deb0e0:	7843 22f2 0e22 c631 3f18 24a1 0c49 1103     Cx."".1..?.$I...
c0deb0f0:	a955 4552 0884 6699 a199 4924 430c 0310     U.RE...f..$I.C..
c0deb100:	111f 3e22 9496 3248 07ff 4493 1a4a 00c3     ..">..H2...DJ...

c0deb110 <charactersOPEN_SANS_REGULAR_11PX>:
c0deb110:	c000 0000 c000 1088 0004 1089 c008 0081     ................
c0deb120:	8024 1109 4034 108a 4050 208a 8068 0088     $...4@..P@. h...
c0deb130:	c06c 1080 c078 0088 8084 0081 8094 0201     l...x...........
c0deb140:	c09c 1400 00a0 1309 c0a4 1408 00a8 0081     ................
c0deb150:	80b8 1089 80c8 2089 80d4 1089 80e4 1089     ....... ........
c0deb160:	00f4 108a 810c 1089 811c 1089 812c 1089     ............,...
c0deb170:	813c 1089 814c 1089 c15c 1188 c160 1180     <...L...\...`...
c0deb180:	8168 1109 8174 1209 817c 1109 4188 0089     h...t...|....A..
c0deb190:	8198 108a c1bc 0081 c1d8 1089 c1ec 1089     ................
c0deb1a0:	0200 108a 8218 1089 8228 0089 023c 108a     ........(...<...
c0deb1b0:	0254 108a c26c 1088 0270 1081 c280 0089     T...l...p.......
c0deb1c0:	8298 0089 82ac 108a 02cc 108a 42e4 108a     .............B..
c0deb1d0:	c300 1089 4314 108a c338 1089 834c 1089     .....C..8...L...
c0deb1e0:	c35c 1089 0370 108a c388 0081 83a4 0082     \...p...........
c0deb1f0:	c3cc 1081 83e4 0081 83fc 1089 040c 0089     ................
c0deb200:	041c 0081 042c 1081 843c 0081 844c 1501     ....,...<...L...
c0deb210:	8450 2011 8454 1189 c460 1089 4474 0189     P.. T...`...tD..
c0deb220:	c480 1089 8494 1189 44a0 1081 84b0 0181     .........D......
c0deb230:	c4cc 1089 c4e0 1088 04e4 1081 84f8 1089     ................
c0deb240:	c508 1088 850c 118a c524 1189 c534 1189     ........$...4...
c0deb250:	c544 1189 c55c 1189 0574 0189 457c 0189     D...\...t...|E..
c0deb260:	0588 0101 c598 1189 85a8 0181 45bc 0182     .............E..
c0deb270:	85d8 1189 85e4 0181 4600 0181 0610 0089     .........F......
c0deb280:	8620 2099 0628 1081 8638 1209                .. (...8...

c0deb28c <fontOPEN_SANS_REGULAR_11PX>:
c0deb28c:	018f 010a 090c 7e20 b110 c0de af80 c0de     ...... ~........

c0deb29c <C_bagl_fonts>:
c0deb29c:	aa90 c0de af70 c0de b28c c0de               ....p.......

c0deb2a8 <C_bagl_fonts_count>:
c0deb2a8:	0003 0000                                   ....

c0deb2ac <ux_layout_bb_elements>:
c0deb2ac:	0003 0000 0000 0080 0040 0000 0001 0000     ........@.......
c0deb2bc:	0000 0000 ffff 00ff 0000 0000 0000 0000     ................
c0deb2cc:	0105 0002 001c 0004 0007 0000 0000 0000     ................
c0deb2dc:	ffff 00ff 0000 0000 0000 0000 86c0 c0de     ................
c0deb2ec:	0205 007a 001c 0004 0007 0000 0000 0000     ..z.............
c0deb2fc:	ffff 00ff 0000 0000 0000 0000 86d8 c0de     ................
c0deb30c:	1007 0006 001d 0074 0020 0000 0000 0000     ......t. .......
c0deb31c:	ffff 00ff 0000 0000 8008 0000 0000 0000     ................
c0deb32c:	1107 0006 002b 0074 0020 0000 0000 0000     ....+.t. .......
c0deb33c:	ffff 00ff 0000 0000 8008 0000 0000 0000     ................

c0deb34c <ux_layout_paging_elements>:
c0deb34c:	0003 0000 0000 0080 0040 0000 0001 0000     ........@.......
c0deb35c:	0000 0000 ffff 00ff 0000 0000 0000 0000     ................
c0deb36c:	0105 0002 001c 0004 0007 0000 0000 0000     ................
c0deb37c:	ffff 00ff 0000 0000 0000 0000 86c0 c0de     ................
c0deb38c:	0205 007a 001c 0004 0007 0000 0000 0000     ..z.............
c0deb39c:	ffff 00ff 0000 0000 0000 0000 86d8 c0de     ................
c0deb3ac:	1007 0000 000f 0080 000c 0000 0000 0000     ................
c0deb3bc:	ffff 00ff 0000 0000 8008 0000 0000 0000     ................
c0deb3cc:	1107 0007 001d 0072 000c 0000 0000 0000     ......r.........
c0deb3dc:	ffff 00ff 0000 0000 800a 0000 0000 0000     ................
c0deb3ec:	1207 0007 002b 0072 000c 0000 0000 0000     ....+.r.........
c0deb3fc:	ffff 00ff 0000 0000 800a 0000 0000 0000     ................
c0deb40c:	1307 0007 0039 0072 000c 0000 0000 0000     ....9.r.........
c0deb41c:	ffff 00ff 0000 0000 800a 0000 0000 0000     ................

c0deb42c <ux_layout_pb_elements>:
c0deb42c:	0003 0000 0000 0080 0040 0000 0001 0000     ........@.......
c0deb43c:	0000 0000 ffff 00ff 0000 0000 0000 0000     ................
c0deb44c:	0105 0002 001c 0004 0007 0000 0000 0000     ................
c0deb45c:	ffff 00ff 0000 0000 0000 0000 86c0 c0de     ................
c0deb46c:	0205 007a 001c 0004 0007 0000 0000 0000     ..z.............
c0deb47c:	ffff 00ff 0000 0000 0000 0000 86d8 c0de     ................
c0deb48c:	1005 0039 0011 000e 000e 0000 0000 0000     ..9.............
c0deb49c:	ffff 00ff 0000 0000 800a 0000 0000 0000     ................
c0deb4ac:	1107 0000 002c 0080 0020 0000 0000 0000     ....,... .......
c0deb4bc:	ffff 00ff 0000 0000 8008 0000 0000 0000     ................

c0deb4cc <ux_layout_pbb_elements>:
c0deb4cc:	0003 0000 0000 0080 0040 0000 0001 0000     ........@.......
c0deb4dc:	0000 0000 ffff 00ff 0000 0000 0000 0000     ................
c0deb4ec:	0105 0002 001c 0004 0007 0000 0000 0000     ................
c0deb4fc:	ffff 00ff 0000 0000 0000 0000 86c0 c0de     ................
c0deb50c:	0205 007a 001c 0004 0007 0000 0000 0000     ..z.............
c0deb51c:	ffff 00ff 0000 0000 0000 0000 86d8 c0de     ................
c0deb52c:	0f05 0039 000a 000e 000e 0000 0000 0000     ..9.............
c0deb53c:	ffff 00ff 0000 0000 800a 0000 0000 0000     ................
c0deb54c:	1007 0006 0025 0074 0020 0000 0000 0000     ....%.t. .......
c0deb55c:	ffff 00ff 0000 0000 8008 0000 0000 0000     ................
c0deb56c:	1107 0006 0033 0074 0020 0000 0000 0000     ....3.t. .......
c0deb57c:	ffff 00ff 0000 0000 8008 0000 0000 0000     ................

c0deb58c <_etext>:
	...

c0deb600 <N_storage_real>:
	...

c0deb800 <install_parameters>:
c0deb800:	0501 6157 6576 0273 3105 322e 322e 2103     ..Waves..1.2.2.!
c0deb810:	000e 000e 1900 0000 0000 000c 0378 1ff0     ............x...
c0deb820:	ffe0 ffc7 fe9f f03f 807f 01fc 03e0 0000     ......?.........
c0deb830:	0400 050a 8002 0000 802c 9b57                ........,.W..
