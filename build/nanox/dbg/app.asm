
build/nanox/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0de0000 <main>:
c0de0000:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de0004:	b08d      	sub	sp, #52	@ 0x34
c0de0006:	b662      	cpsie	i
c0de0008:	f007 fe08 	bl	c0de7c1c <os_boot>
c0de000c:	f240 48d8 	movw	r8, #1240	@ 0x4d8
c0de0010:	f240 57f0 	movw	r7, #1520	@ 0x5f0
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
c0de004c:	f008 f8c0 	bl	c0de81d0 <try_context_set>
c0de0050:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de0052:	f008 f8bd 	bl	c0de81d0 <try_context_set>
c0de0056:	e7e7      	b.n	c0de0028 <main+0x28>
c0de0058:	b171      	cbz	r1, c0de0078 <main+0x78>
c0de005a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de005c:	2400      	movs	r4, #0
c0de005e:	f8ad 4030 	strh.w	r4, [sp, #48]	@ 0x30
c0de0062:	f008 f8b5 	bl	c0de81d0 <try_context_set>
c0de0066:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de0068:	f008 f8b2 	bl	c0de81d0 <try_context_set>
c0de006c:	f001 fb72 	bl	c0de1754 <app_exit>
c0de0070:	4620      	mov	r0, r4
c0de0072:	b00d      	add	sp, #52	@ 0x34
c0de0074:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de0078:	a801      	add	r0, sp, #4
c0de007a:	f008 f8a9 	bl	c0de81d0 <try_context_set>
c0de007e:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de0080:	f005 ffa6 	bl	c0de5fd0 <io_seproxyhal_init>
c0de0084:	2100      	movs	r1, #0
c0de0086:	2006      	movs	r0, #6
c0de0088:	460a      	mov	r2, r1
c0de008a:	f008 f845 	bl	c0de8118 <os_setting_get>
c0de008e:	f640 0244 	movw	r2, #2116	@ 0x844
c0de0092:	f2c0 0200 	movt	r2, #0
c0de0096:	444a      	add	r2, r9
c0de0098:	6090      	str	r0, [r2, #8]
c0de009a:	f240 0008 	movw	r0, #8
c0de009e:	f2c0 0000 	movt	r0, #0
c0de00a2:	4448      	add	r0, r9
c0de00a4:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de00a8:	f008 fa00 	bl	c0de84ac <__aeabi_memclr>
c0de00ac:	f24b 5048 	movw	r0, #46408	@ 0xb548
c0de00b0:	f2c0 0000 	movt	r0, #0
c0de00b4:	4478      	add	r0, pc
c0de00b6:	f007 ff8b 	bl	c0de7fd0 <pic>
c0de00ba:	7840      	ldrb	r0, [r0, #1]
c0de00bc:	2801      	cmp	r0, #1
c0de00be:	d00e      	beq.n	c0de00de <main+0xde>
c0de00c0:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de00c4:	f8ad 0000 	strh.w	r0, [sp]
c0de00c8:	f24b 502c 	movw	r0, #46380	@ 0xb52c
c0de00cc:	f2c0 0000 	movt	r0, #0
c0de00d0:	4478      	add	r0, pc
c0de00d2:	f007 ff7d 	bl	c0de7fd0 <pic>
c0de00d6:	4669      	mov	r1, sp
c0de00d8:	2202      	movs	r2, #2
c0de00da:	f007 ffa8 	bl	c0de802e <nvm_write>
c0de00de:	2400      	movs	r4, #0
c0de00e0:	4620      	mov	r0, r4
c0de00e2:	f005 ff99 	bl	c0de6018 <USB_power>
c0de00e6:	2501      	movs	r5, #1
c0de00e8:	4628      	mov	r0, r5
c0de00ea:	f005 ff95 	bl	c0de6018 <USB_power>
c0de00ee:	f004 feda 	bl	c0de4ea6 <ui_idle>
c0de00f2:	4620      	mov	r0, r4
c0de00f4:	4621      	mov	r1, r4
c0de00f6:	f005 ff90 	bl	c0de601a <BLE_power>
c0de00fa:	f648 41e9 	movw	r1, #36073	@ 0x8ce9
c0de00fe:	f2c0 0100 	movt	r1, #0
c0de0102:	4479      	add	r1, pc
c0de0104:	4628      	mov	r0, r5
c0de0106:	f005 ff88 	bl	c0de601a <BLE_power>
c0de010a:	f001 fb43 	bl	c0de1794 <waves_main>

c0de010e <_code>:
c0de010e:	d4d4      	bmi.n	c0de00ba <main+0xba>

c0de0110 <b58enc>:
c0de0110:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0114:	af03      	add	r7, sp, #12
c0de0116:	b086      	sub	sp, #24
c0de0118:	4698      	mov	r8, r3
c0de011a:	2b01      	cmp	r3, #1
c0de011c:	f04f 0b00 	mov.w	fp, #0
c0de0120:	e947 1206 	strd	r1, r2, [r7, #-24]
c0de0124:	f847 0c20 	str.w	r0, [r7, #-32]
c0de0128:	db0a      	blt.n	c0de0140 <b58enc+0x30>
c0de012a:	bf00      	nop
c0de012c:	f857 1c14 	ldr.w	r1, [r7, #-20]
c0de0130:	f811 100b 	ldrb.w	r1, [r1, fp]
c0de0134:	b921      	cbnz	r1, c0de0140 <b58enc+0x30>
c0de0136:	f10b 0b01 	add.w	fp, fp, #1
c0de013a:	45d8      	cmp	r8, fp
c0de013c:	d1f6      	bne.n	c0de012c <b58enc+0x1c>
c0de013e:	46c3      	mov	fp, r8
c0de0140:	eba8 000b 	sub.w	r0, r8, fp
c0de0144:	218a      	movs	r1, #138	@ 0x8a
c0de0146:	4348      	muls	r0, r1
c0de0148:	f248 511f 	movw	r1, #34079	@ 0x851f
c0de014c:	f2c5 11eb 	movt	r1, #20971	@ 0x51eb
c0de0150:	fba0 0201 	umull	r0, r2, r0, r1
c0de0154:	2001      	movs	r0, #1
c0de0156:	eb00 1152 	add.w	r1, r0, r2, lsr #5
c0de015a:	2008      	movs	r0, #8
c0de015c:	eb00 1052 	add.w	r0, r0, r2, lsr #5
c0de0160:	f020 0007 	bic.w	r0, r0, #7
c0de0164:	ea4f 1a52 	mov.w	sl, r2, lsr #5
c0de0168:	ebad 0400 	sub.w	r4, sp, r0
c0de016c:	46a5      	mov	sp, r4
c0de016e:	4620      	mov	r0, r4
c0de0170:	f847 1c1c 	str.w	r1, [r7, #-28]
c0de0174:	f008 f99a 	bl	c0de84ac <__aeabi_memclr>
c0de0178:	45d8      	cmp	r8, fp
c0de017a:	dd26      	ble.n	c0de01ca <b58enc+0xba>
c0de017c:	f64c 3c09 	movw	ip, #51977	@ 0xcb09
c0de0180:	f6c8 5c3d 	movt	ip, #36157	@ 0x8d3d
c0de0184:	f04f 0e3a 	mov.w	lr, #58	@ 0x3a
c0de0188:	465a      	mov	r2, fp
c0de018a:	4655      	mov	r5, sl
c0de018c:	f857 0c14 	ldr.w	r0, [r7, #-20]
c0de0190:	45aa      	cmp	sl, r5
c0de0192:	5c86      	ldrb	r6, [r0, r2]
c0de0194:	dc01      	bgt.n	c0de019a <b58enc+0x8a>
c0de0196:	4653      	mov	r3, sl
c0de0198:	b19e      	cbz	r6, c0de01c2 <b58enc+0xb2>
c0de019a:	4653      	mov	r3, sl
c0de019c:	5ce0      	ldrb	r0, [r4, r3]
c0de019e:	eb06 2000 	add.w	r0, r6, r0, lsl #8
c0de01a2:	fb80 610c 	smull	r6, r1, r0, ip
c0de01a6:	4401      	add	r1, r0
c0de01a8:	114e      	asrs	r6, r1, #5
c0de01aa:	eb06 76d1 	add.w	r6, r6, r1, lsr #31
c0de01ae:	fb06 011e 	mls	r1, r6, lr, r0
c0de01b2:	54e1      	strb	r1, [r4, r3]
c0de01b4:	3b01      	subs	r3, #1
c0de01b6:	42ab      	cmp	r3, r5
c0de01b8:	dcf0      	bgt.n	c0de019c <b58enc+0x8c>
c0de01ba:	383a      	subs	r0, #58	@ 0x3a
c0de01bc:	f110 0f73 	cmn.w	r0, #115	@ 0x73
c0de01c0:	d3ec      	bcc.n	c0de019c <b58enc+0x8c>
c0de01c2:	3201      	adds	r2, #1
c0de01c4:	4542      	cmp	r2, r8
c0de01c6:	461d      	mov	r5, r3
c0de01c8:	d1e0      	bne.n	c0de018c <b58enc+0x7c>
c0de01ca:	e957 1207 	ldrd	r1, r2, [r7, #-28]
c0de01ce:	f04f 0800 	mov.w	r8, #0
c0de01d2:	bf00      	nop
c0de01d4:	f814 0008 	ldrb.w	r0, [r4, r8]
c0de01d8:	b920      	cbnz	r0, c0de01e4 <b58enc+0xd4>
c0de01da:	f108 0801 	add.w	r8, r8, #1
c0de01de:	4541      	cmp	r1, r8
c0de01e0:	d1f8      	bne.n	c0de01d4 <b58enc+0xc4>
c0de01e2:	4688      	mov	r8, r1
c0de01e4:	6816      	ldr	r6, [r2, #0]
c0de01e6:	eb01 000b 	add.w	r0, r1, fp
c0de01ea:	eba0 0508 	sub.w	r5, r0, r8
c0de01ee:	42ae      	cmp	r6, r5
c0de01f0:	4629      	mov	r1, r5
c0de01f2:	d928      	bls.n	c0de0246 <b58enc+0x136>
c0de01f4:	f1bb 0f00 	cmp.w	fp, #0
c0de01f8:	d005      	beq.n	c0de0206 <b58enc+0xf6>
c0de01fa:	f857 0c20 	ldr.w	r0, [r7, #-32]
c0de01fe:	4659      	mov	r1, fp
c0de0200:	2231      	movs	r2, #49	@ 0x31
c0de0202:	f008 f95a 	bl	c0de84ba <__aeabi_memset>
c0de0206:	45d0      	cmp	r8, sl
c0de0208:	d902      	bls.n	c0de0210 <b58enc+0x100>
c0de020a:	f857 4c20 	ldr.w	r4, [r7, #-32]
c0de020e:	e014      	b.n	c0de023a <b58enc+0x12a>
c0de0210:	f648 4292 	movw	r2, #35986	@ 0x8c92
c0de0214:	ebaa 0008 	sub.w	r0, sl, r8
c0de0218:	eb04 0108 	add.w	r1, r4, r8
c0de021c:	f2c0 0200 	movt	r2, #0
c0de0220:	f857 4c20 	ldr.w	r4, [r7, #-32]
c0de0224:	3001      	adds	r0, #1
c0de0226:	447a      	add	r2, pc
c0de0228:	f811 3b01 	ldrb.w	r3, [r1], #1
c0de022c:	3801      	subs	r0, #1
c0de022e:	5cd3      	ldrb	r3, [r2, r3]
c0de0230:	f804 300b 	strb.w	r3, [r4, fp]
c0de0234:	f10b 0b01 	add.w	fp, fp, #1
c0de0238:	d1f6      	bne.n	c0de0228 <b58enc+0x118>
c0de023a:	f857 2c18 	ldr.w	r2, [r7, #-24]
c0de023e:	2000      	movs	r0, #0
c0de0240:	4659      	mov	r1, fp
c0de0242:	f804 000b 	strb.w	r0, [r4, fp]
c0de0246:	2000      	movs	r0, #0
c0de0248:	3101      	adds	r1, #1
c0de024a:	f1a7 040c 	sub.w	r4, r7, #12
c0de024e:	42ae      	cmp	r6, r5
c0de0250:	bf88      	it	hi
c0de0252:	2001      	movhi	r0, #1
c0de0254:	6011      	str	r1, [r2, #0]
c0de0256:	46a5      	mov	sp, r4
c0de0258:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de025c <public_key_le_to_be>:
c0de025c:	b5b0      	push	{r4, r5, r7, lr}
c0de025e:	b088      	sub	sp, #32
c0de0260:	f100 0148 	add.w	r1, r0, #72	@ 0x48
c0de0264:	2200      	movs	r2, #0
c0de0266:	466c      	mov	r4, sp
c0de0268:	f811 3901 	ldrb.w	r3, [r1], #-1
c0de026c:	54a3      	strb	r3, [r4, r2]
c0de026e:	3201      	adds	r2, #1
c0de0270:	2a20      	cmp	r2, #32
c0de0272:	d1f9      	bne.n	c0de0268 <public_key_le_to_be+0xc>
c0de0274:	f890 1028 	ldrb.w	r1, [r0, #40]	@ 0x28
c0de0278:	07c9      	lsls	r1, r1, #31
c0de027a:	d005      	beq.n	c0de0288 <public_key_le_to_be+0x2c>
c0de027c:	f89d 101f 	ldrb.w	r1, [sp, #31]
c0de0280:	f041 0180 	orr.w	r1, r1, #128	@ 0x80
c0de0284:	f88d 101f 	strb.w	r1, [sp, #31]
c0de0288:	f100 0508 	add.w	r5, r0, #8
c0de028c:	3028      	adds	r0, #40	@ 0x28
c0de028e:	2121      	movs	r1, #33	@ 0x21
c0de0290:	f008 f90c 	bl	c0de84ac <__aeabi_memclr>
c0de0294:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
c0de0296:	c50f      	stmia	r5!, {r0, r1, r2, r3}
c0de0298:	e894 000f 	ldmia.w	r4, {r0, r1, r2, r3}
c0de029c:	c50f      	stmia	r5!, {r0, r1, r2, r3}
c0de029e:	b008      	add	sp, #32
c0de02a0:	bdb0      	pop	{r4, r5, r7, pc}

c0de02a2 <get_keypair_by_path>:
c0de02a2:	b570      	push	{r4, r5, r6, lr}
c0de02a4:	b08c      	sub	sp, #48	@ 0x30
c0de02a6:	460d      	mov	r5, r1
c0de02a8:	f648 3199 	movw	r1, #35737	@ 0x8b99
c0de02ac:	f2c0 0100 	movt	r1, #0
c0de02b0:	4614      	mov	r4, r2
c0de02b2:	4602      	mov	r2, r0
c0de02b4:	200c      	movs	r0, #12
c0de02b6:	4479      	add	r1, pc
c0de02b8:	2300      	movs	r3, #0
c0de02ba:	ae04      	add	r6, sp, #16
c0de02bc:	e9cd 3101 	strd	r3, r1, [sp, #4]
c0de02c0:	9003      	str	r0, [sp, #12]
c0de02c2:	2001      	movs	r0, #1
c0de02c4:	2171      	movs	r1, #113	@ 0x71
c0de02c6:	2305      	movs	r3, #5
c0de02c8:	9600      	str	r6, [sp, #0]
c0de02ca:	f007 fed4 	bl	c0de8076 <os_perso_derive_node_with_seed_key>
c0de02ce:	2071      	movs	r0, #113	@ 0x71
c0de02d0:	4631      	mov	r1, r6
c0de02d2:	2220      	movs	r2, #32
c0de02d4:	4623      	mov	r3, r4
c0de02d6:	f007 fc6c 	bl	c0de7bb2 <cx_ecfp_init_private_key_no_throw>
c0de02da:	2071      	movs	r0, #113	@ 0x71
c0de02dc:	2100      	movs	r1, #0
c0de02de:	2200      	movs	r2, #0
c0de02e0:	462b      	mov	r3, r5
c0de02e2:	f007 fc6a 	bl	c0de7bba <cx_ecfp_init_public_key_no_throw>
c0de02e6:	2071      	movs	r0, #113	@ 0x71
c0de02e8:	4629      	mov	r1, r5
c0de02ea:	4622      	mov	r2, r4
c0de02ec:	2301      	movs	r3, #1
c0de02ee:	f007 fc5c 	bl	c0de7baa <cx_ecfp_generate_pair_no_throw>
c0de02f2:	b908      	cbnz	r0, c0de02f8 <get_keypair_by_path+0x56>
c0de02f4:	b00c      	add	sp, #48	@ 0x30
c0de02f6:	bd70      	pop	{r4, r5, r6, pc}
c0de02f8:	f007 fc93 	bl	c0de7c22 <os_longjmp>

c0de02fc <get_curve25519_public_key_for_path>:
c0de02fc:	b5b0      	push	{r4, r5, r7, lr}
c0de02fe:	b08a      	sub	sp, #40	@ 0x28
c0de0300:	466d      	mov	r5, sp
c0de0302:	462a      	mov	r2, r5
c0de0304:	460c      	mov	r4, r1
c0de0306:	f7ff ffcc 	bl	c0de02a2 <get_keypair_by_path>
c0de030a:	4628      	mov	r0, r5
c0de030c:	2128      	movs	r1, #40	@ 0x28
c0de030e:	f008 f8cd 	bl	c0de84ac <__aeabi_memclr>
c0de0312:	4620      	mov	r0, r4
c0de0314:	f7ff ffa2 	bl	c0de025c <public_key_le_to_be>
c0de0318:	f104 0008 	add.w	r0, r4, #8
c0de031c:	4601      	mov	r1, r0
c0de031e:	f002 fc19 	bl	c0de2b54 <ed25519_pk_to_curve25519>
c0de0322:	fab0 f080 	clz	r0, r0
c0de0326:	0940      	lsrs	r0, r0, #5
c0de0328:	b00a      	add	sp, #40	@ 0x28
c0de032a:	bdb0      	pop	{r4, r5, r7, pc}

c0de032c <blake2b_256>:
c0de032c:	b570      	push	{r4, r5, r6, lr}
c0de032e:	b0c2      	sub	sp, #264	@ 0x108
c0de0330:	460c      	mov	r4, r1
c0de0332:	4605      	mov	r5, r0
c0de0334:	a802      	add	r0, sp, #8
c0de0336:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de033a:	4616      	mov	r6, r2
c0de033c:	f007 fc31 	bl	c0de7ba2 <cx_blake2b_init_no_throw>
c0de0340:	b980      	cbnz	r0, c0de0364 <blake2b_256+0x38>
c0de0342:	f04f 0c20 	mov.w	ip, #32
c0de0346:	a802      	add	r0, sp, #8
c0de0348:	2101      	movs	r1, #1
c0de034a:	462a      	mov	r2, r5
c0de034c:	4623      	mov	r3, r4
c0de034e:	9600      	str	r6, [sp, #0]
c0de0350:	f8cd c004 	str.w	ip, [sp, #4]
c0de0354:	f007 fc41 	bl	c0de7bda <cx_hash_no_throw>
c0de0358:	b920      	cbnz	r0, c0de0364 <blake2b_256+0x38>
c0de035a:	a802      	add	r0, sp, #8
c0de035c:	f007 fc39 	bl	c0de7bd2 <cx_hash_get_size>
c0de0360:	b042      	add	sp, #264	@ 0x108
c0de0362:	bd70      	pop	{r4, r5, r6, pc}
c0de0364:	f007 fc5d 	bl	c0de7c22 <os_longjmp>

c0de0368 <keccak_256>:
c0de0368:	b570      	push	{r4, r5, r6, lr}
c0de036a:	b0ec      	sub	sp, #432	@ 0x1b0
c0de036c:	460c      	mov	r4, r1
c0de036e:	4605      	mov	r5, r0
c0de0370:	a802      	add	r0, sp, #8
c0de0372:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de0376:	4616      	mov	r6, r2
c0de0378:	f007 fc33 	bl	c0de7be2 <cx_keccak_init_no_throw>
c0de037c:	b980      	cbnz	r0, c0de03a0 <keccak_256+0x38>
c0de037e:	f04f 0c20 	mov.w	ip, #32
c0de0382:	a802      	add	r0, sp, #8
c0de0384:	2101      	movs	r1, #1
c0de0386:	462a      	mov	r2, r5
c0de0388:	4623      	mov	r3, r4
c0de038a:	9600      	str	r6, [sp, #0]
c0de038c:	f8cd c004 	str.w	ip, [sp, #4]
c0de0390:	f007 fc23 	bl	c0de7bda <cx_hash_no_throw>
c0de0394:	b920      	cbnz	r0, c0de03a0 <keccak_256+0x38>
c0de0396:	a802      	add	r0, sp, #8
c0de0398:	f007 fc1b 	bl	c0de7bd2 <cx_hash_get_size>
c0de039c:	b06c      	add	sp, #432	@ 0x1b0
c0de039e:	bd70      	pop	{r4, r5, r6, pc}
c0de03a0:	f007 fc3f 	bl	c0de7c22 <os_longjmp>

c0de03a4 <stream_eddsa_sign_step1>:
c0de03a4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de03a8:	b0c6      	sub	sp, #280	@ 0x118
c0de03aa:	460e      	mov	r6, r1
c0de03ac:	f44f 712e 	mov.w	r1, #696	@ 0x2b8
c0de03b0:	4605      	mov	r5, r0
c0de03b2:	f008 f87b 	bl	c0de84ac <__aeabi_memclr>
c0de03b6:	a812      	add	r0, sp, #72	@ 0x48
c0de03b8:	f007 fc23 	bl	c0de7c02 <cx_sha512_init_no_throw>
c0de03bc:	6872      	ldr	r2, [r6, #4]
c0de03be:	2a20      	cmp	r2, #32
c0de03c0:	d12e      	bne.n	c0de0420 <stream_eddsa_sign_step1+0x7c>
c0de03c2:	f106 0208 	add.w	r2, r6, #8
c0de03c6:	2700      	movs	r7, #0
c0de03c8:	a812      	add	r0, sp, #72	@ 0x48
c0de03ca:	2100      	movs	r1, #0
c0de03cc:	2320      	movs	r3, #32
c0de03ce:	9700      	str	r7, [sp, #0]
c0de03d0:	9701      	str	r7, [sp, #4]
c0de03d2:	f007 fc02 	bl	c0de7bda <cx_hash_no_throw>
c0de03d6:	2800      	cmp	r0, #0
c0de03d8:	f040 8093 	bne.w	c0de0502 <stream_eddsa_sign_step1+0x15e>
c0de03dc:	ac12      	add	r4, sp, #72	@ 0x48
c0de03de:	4620      	mov	r0, r4
c0de03e0:	f007 fbf7 	bl	c0de7bd2 <cx_hash_get_size>
c0de03e4:	2040      	movs	r0, #64	@ 0x40
c0de03e6:	a902      	add	r1, sp, #8
c0de03e8:	e9cd 1000 	strd	r1, r0, [sp]
c0de03ec:	4620      	mov	r0, r4
c0de03ee:	2101      	movs	r1, #1
c0de03f0:	2200      	movs	r2, #0
c0de03f2:	2300      	movs	r3, #0
c0de03f4:	2401      	movs	r4, #1
c0de03f6:	f007 fbf0 	bl	c0de7bda <cx_hash_no_throw>
c0de03fa:	2800      	cmp	r0, #0
c0de03fc:	f040 8081 	bne.w	c0de0502 <stream_eddsa_sign_step1+0x15e>
c0de0400:	a812      	add	r0, sp, #72	@ 0x48
c0de0402:	f007 fbe6 	bl	c0de7bd2 <cx_hash_get_size>
c0de0406:	f89d 0008 	ldrb.w	r0, [sp, #8]
c0de040a:	f89d 1027 	ldrb.w	r1, [sp, #39]	@ 0x27
c0de040e:	f000 00f8 	and.w	r0, r0, #248	@ 0xf8
c0de0412:	f364 119f 	bfi	r1, r4, #6, #26
c0de0416:	f88d 0008 	strb.w	r0, [sp, #8]
c0de041a:	f88d 1027 	strb.w	r1, [sp, #39]	@ 0x27
c0de041e:	e004      	b.n	c0de042a <stream_eddsa_sign_step1+0x86>
c0de0420:	f106 0108 	add.w	r1, r6, #8
c0de0424:	a802      	add	r0, sp, #8
c0de0426:	f008 f844 	bl	c0de84b2 <__aeabi_memcpy>
c0de042a:	f105 0020 	add.w	r0, r5, #32
c0de042e:	f105 0840 	add.w	r8, r5, #64	@ 0x40
c0de0432:	2100      	movs	r1, #0
c0de0434:	221f      	movs	r2, #31
c0de0436:	af02      	add	r7, sp, #8
c0de0438:	5cbb      	ldrb	r3, [r7, r2]
c0de043a:	5c7c      	ldrb	r4, [r7, r1]
c0de043c:	547b      	strb	r3, [r7, r1]
c0de043e:	3101      	adds	r1, #1
c0de0440:	54bc      	strb	r4, [r7, r2]
c0de0442:	2910      	cmp	r1, #16
c0de0444:	f1a2 0201 	sub.w	r2, r2, #1
c0de0448:	d1f6      	bne.n	c0de0438 <stream_eddsa_sign_step1+0x94>
c0de044a:	4639      	mov	r1, r7
c0de044c:	2220      	movs	r2, #32
c0de044e:	f008 f830 	bl	c0de84b2 <__aeabi_memcpy>
c0de0452:	f107 0120 	add.w	r1, r7, #32
c0de0456:	4640      	mov	r0, r8
c0de0458:	2220      	movs	r2, #32
c0de045a:	f008 f82a 	bl	c0de84b2 <__aeabi_memcpy>
c0de045e:	7830      	ldrb	r0, [r6, #0]
c0de0460:	2104      	movs	r1, #4
c0de0462:	462c      	mov	r4, r5
c0de0464:	f804 1fa8 	strb.w	r1, [r4, #168]!
c0de0468:	f804 0c08 	strb.w	r0, [r4, #-8]
c0de046c:	2041      	movs	r0, #65	@ 0x41
c0de046e:	f844 0c04 	str.w	r0, [r4, #-4]
c0de0472:	f648 3120 	movw	r1, #35616	@ 0x8b20
c0de0476:	1c66      	adds	r6, r4, #1
c0de0478:	f2c0 0100 	movt	r1, #0
c0de047c:	4479      	add	r1, pc
c0de047e:	4630      	mov	r0, r6
c0de0480:	2220      	movs	r2, #32
c0de0482:	f008 f816 	bl	c0de84b2 <__aeabi_memcpy>
c0de0486:	f648 312a 	movw	r1, #35626	@ 0x8b2a
c0de048a:	f2c0 0100 	movt	r1, #0
c0de048e:	f104 0021 	add.w	r0, r4, #33	@ 0x21
c0de0492:	4479      	add	r1, pc
c0de0494:	2220      	movs	r2, #32
c0de0496:	f008 f80c 	bl	c0de84b2 <__aeabi_memcpy>
c0de049a:	2071      	movs	r0, #113	@ 0x71
c0de049c:	4621      	mov	r1, r4
c0de049e:	463a      	mov	r2, r7
c0de04a0:	2320      	movs	r3, #32
c0de04a2:	f007 fb8e 	bl	c0de7bc2 <cx_ecfp_scalar_mult_no_throw>
c0de04a6:	bb60      	cbnz	r0, c0de0502 <stream_eddsa_sign_step1+0x15e>
c0de04a8:	a945      	add	r1, sp, #276	@ 0x114
c0de04aa:	2071      	movs	r0, #113	@ 0x71
c0de04ac:	f007 fdcb 	bl	c0de8046 <cx_ecdomain_parameters_length>
c0de04b0:	bb38      	cbnz	r0, c0de0502 <stream_eddsa_sign_step1+0x15e>
c0de04b2:	f8d5 20a4 	ldr.w	r2, [r5, #164]	@ 0xa4
c0de04b6:	2071      	movs	r0, #113	@ 0x71
c0de04b8:	4621      	mov	r1, r4
c0de04ba:	f007 fb86 	bl	c0de7bca <cx_edwards_compress_point_no_throw>
c0de04be:	bb00      	cbnz	r0, c0de0502 <stream_eddsa_sign_step1+0x15e>
c0de04c0:	4628      	mov	r0, r5
c0de04c2:	4631      	mov	r1, r6
c0de04c4:	2220      	movs	r2, #32
c0de04c6:	f007 fff4 	bl	c0de84b2 <__aeabi_memcpy>
c0de04ca:	f105 04ec 	add.w	r4, r5, #236	@ 0xec
c0de04ce:	4620      	mov	r0, r4
c0de04d0:	f007 fb97 	bl	c0de7c02 <cx_sha512_init_no_throw>
c0de04d4:	f505 70dc 	add.w	r0, r5, #440	@ 0x1b8
c0de04d8:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de04dc:	f007 fb61 	bl	c0de7ba2 <cx_blake2b_init_no_throw>
c0de04e0:	b978      	cbnz	r0, c0de0502 <stream_eddsa_sign_step1+0x15e>
c0de04e2:	2700      	movs	r7, #0
c0de04e4:	4620      	mov	r0, r4
c0de04e6:	2100      	movs	r1, #0
c0de04e8:	4642      	mov	r2, r8
c0de04ea:	2320      	movs	r3, #32
c0de04ec:	9700      	str	r7, [sp, #0]
c0de04ee:	9701      	str	r7, [sp, #4]
c0de04f0:	f007 fb73 	bl	c0de7bda <cx_hash_no_throw>
c0de04f4:	b928      	cbnz	r0, c0de0502 <stream_eddsa_sign_step1+0x15e>
c0de04f6:	4620      	mov	r0, r4
c0de04f8:	f007 fb6b 	bl	c0de7bd2 <cx_hash_get_size>
c0de04fc:	b046      	add	sp, #280	@ 0x118
c0de04fe:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de0502:	f007 fb8e 	bl	c0de7c22 <os_longjmp>

c0de0506 <stream_eddsa_sign_step2>:
c0de0506:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de050a:	b082      	sub	sp, #8
c0de050c:	4614      	mov	r4, r2
c0de050e:	460d      	mov	r5, r1
c0de0510:	f500 77dc 	add.w	r7, r0, #440	@ 0x1b8
c0de0514:	4606      	mov	r6, r0
c0de0516:	f04f 0800 	mov.w	r8, #0
c0de051a:	4638      	mov	r0, r7
c0de051c:	2100      	movs	r1, #0
c0de051e:	462a      	mov	r2, r5
c0de0520:	4623      	mov	r3, r4
c0de0522:	f8cd 8000 	str.w	r8, [sp]
c0de0526:	f8cd 8004 	str.w	r8, [sp, #4]
c0de052a:	f007 fb56 	bl	c0de7bda <cx_hash_no_throw>
c0de052e:	b9a0      	cbnz	r0, c0de055a <stream_eddsa_sign_step2+0x54>
c0de0530:	4638      	mov	r0, r7
c0de0532:	f007 fb4e 	bl	c0de7bd2 <cx_hash_get_size>
c0de0536:	36ec      	adds	r6, #236	@ 0xec
c0de0538:	4630      	mov	r0, r6
c0de053a:	2100      	movs	r1, #0
c0de053c:	462a      	mov	r2, r5
c0de053e:	4623      	mov	r3, r4
c0de0540:	f8cd 8000 	str.w	r8, [sp]
c0de0544:	f8cd 8004 	str.w	r8, [sp, #4]
c0de0548:	f007 fb47 	bl	c0de7bda <cx_hash_no_throw>
c0de054c:	b928      	cbnz	r0, c0de055a <stream_eddsa_sign_step2+0x54>
c0de054e:	4630      	mov	r0, r6
c0de0550:	b002      	add	sp, #8
c0de0552:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de0556:	f007 bb3c 	b.w	c0de7bd2 <cx_hash_get_size>
c0de055a:	f007 fb62 	bl	c0de7c22 <os_longjmp>
c0de055e:	d4d4      	bmi.n	c0de050a <stream_eddsa_sign_step2+0x4>

c0de0560 <stream_eddsa_sign_step3>:
c0de0560:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de0564:	b093      	sub	sp, #76	@ 0x4c
c0de0566:	4606      	mov	r6, r0
c0de0568:	f500 78dc 	add.w	r8, r0, #440	@ 0x1b8
c0de056c:	f240 0008 	movw	r0, #8
c0de0570:	f2c0 0000 	movt	r0, #0
c0de0574:	4448      	add	r0, r9
c0de0576:	f200 306d 	addw	r0, r0, #877	@ 0x36d
c0de057a:	2720      	movs	r7, #32
c0de057c:	9000      	str	r0, [sp, #0]
c0de057e:	4640      	mov	r0, r8
c0de0580:	2101      	movs	r1, #1
c0de0582:	2200      	movs	r2, #0
c0de0584:	2300      	movs	r3, #0
c0de0586:	9701      	str	r7, [sp, #4]
c0de0588:	f007 fb27 	bl	c0de7bda <cx_hash_no_throw>
c0de058c:	2800      	cmp	r0, #0
c0de058e:	f040 809f 	bne.w	c0de06d0 <stream_eddsa_sign_step3+0x170>
c0de0592:	4640      	mov	r0, r8
c0de0594:	f007 fb1d 	bl	c0de7bd2 <cx_hash_get_size>
c0de0598:	f106 0aec 	add.w	sl, r6, #236	@ 0xec
c0de059c:	2040      	movs	r0, #64	@ 0x40
c0de059e:	ac02      	add	r4, sp, #8
c0de05a0:	9001      	str	r0, [sp, #4]
c0de05a2:	4650      	mov	r0, sl
c0de05a4:	2101      	movs	r1, #1
c0de05a6:	2200      	movs	r2, #0
c0de05a8:	2300      	movs	r3, #0
c0de05aa:	9400      	str	r4, [sp, #0]
c0de05ac:	f007 fb15 	bl	c0de7bda <cx_hash_no_throw>
c0de05b0:	2800      	cmp	r0, #0
c0de05b2:	f040 808d 	bne.w	c0de06d0 <stream_eddsa_sign_step3+0x170>
c0de05b6:	4650      	mov	r0, sl
c0de05b8:	f007 fb0b 	bl	c0de7bd2 <cx_hash_get_size>
c0de05bc:	2000      	movs	r0, #0
c0de05be:	213f      	movs	r1, #63	@ 0x3f
c0de05c0:	5c62      	ldrb	r2, [r4, r1]
c0de05c2:	5c23      	ldrb	r3, [r4, r0]
c0de05c4:	5422      	strb	r2, [r4, r0]
c0de05c6:	3001      	adds	r0, #1
c0de05c8:	5463      	strb	r3, [r4, r1]
c0de05ca:	2820      	cmp	r0, #32
c0de05cc:	f1a1 0101 	sub.w	r1, r1, #1
c0de05d0:	d1f6      	bne.n	c0de05c0 <stream_eddsa_sign_step3+0x60>
c0de05d2:	f648 2200 	movw	r2, #35328	@ 0x8a00
c0de05d6:	f2c0 0200 	movt	r2, #0
c0de05da:	ac02      	add	r4, sp, #8
c0de05dc:	447a      	add	r2, pc
c0de05de:	4620      	mov	r0, r4
c0de05e0:	2140      	movs	r1, #64	@ 0x40
c0de05e2:	2320      	movs	r3, #32
c0de05e4:	f007 fb05 	bl	c0de7bf2 <cx_math_modm_no_throw>
c0de05e8:	2800      	cmp	r0, #0
c0de05ea:	d171      	bne.n	c0de06d0 <stream_eddsa_sign_step3+0x170>
c0de05ec:	f104 0020 	add.w	r0, r4, #32
c0de05f0:	f106 0540 	add.w	r5, r6, #64	@ 0x40
c0de05f4:	c89c      	ldmia	r0!, {r2, r3, r4, r7}
c0de05f6:	4629      	mov	r1, r5
c0de05f8:	c19c      	stmia	r1!, {r2, r3, r4, r7}
c0de05fa:	e890 009c 	ldmia.w	r0, {r2, r3, r4, r7}
c0de05fe:	2004      	movs	r0, #4
c0de0600:	c19c      	stmia	r1!, {r2, r3, r4, r7}
c0de0602:	4634      	mov	r4, r6
c0de0604:	f804 0fa0 	strb.w	r0, [r4, #160]!
c0de0608:	f648 118a 	movw	r1, #35210	@ 0x898a
c0de060c:	f2c0 0100 	movt	r1, #0
c0de0610:	1c60      	adds	r0, r4, #1
c0de0612:	4479      	add	r1, pc
c0de0614:	2220      	movs	r2, #32
c0de0616:	f007 ff4c 	bl	c0de84b2 <__aeabi_memcpy>
c0de061a:	f648 1196 	movw	r1, #35222	@ 0x8996
c0de061e:	f104 0721 	add.w	r7, r4, #33	@ 0x21
c0de0622:	f2c0 0100 	movt	r1, #0
c0de0626:	4479      	add	r1, pc
c0de0628:	4638      	mov	r0, r7
c0de062a:	2220      	movs	r2, #32
c0de062c:	f007 ff41 	bl	c0de84b2 <__aeabi_memcpy>
c0de0630:	2071      	movs	r0, #113	@ 0x71
c0de0632:	4621      	mov	r1, r4
c0de0634:	462a      	mov	r2, r5
c0de0636:	2320      	movs	r3, #32
c0de0638:	f007 fac3 	bl	c0de7bc2 <cx_ecfp_scalar_mult_no_throw>
c0de063c:	2800      	cmp	r0, #0
c0de063e:	d147      	bne.n	c0de06d0 <stream_eddsa_sign_step3+0x170>
c0de0640:	a912      	add	r1, sp, #72	@ 0x48
c0de0642:	2071      	movs	r0, #113	@ 0x71
c0de0644:	f007 fcff 	bl	c0de8046 <cx_ecdomain_parameters_length>
c0de0648:	2800      	cmp	r0, #0
c0de064a:	d141      	bne.n	c0de06d0 <stream_eddsa_sign_step3+0x170>
c0de064c:	f894 0020 	ldrb.w	r0, [r4, #32]
c0de0650:	07c0      	lsls	r0, r0, #31
c0de0652:	d003      	beq.n	c0de065c <stream_eddsa_sign_step3+0xfc>
c0de0654:	7838      	ldrb	r0, [r7, #0]
c0de0656:	f040 0080 	orr.w	r0, r0, #128	@ 0x80
c0de065a:	7038      	strb	r0, [r7, #0]
c0de065c:	f106 00e0 	add.w	r0, r6, #224	@ 0xe0
c0de0660:	f106 01c1 	add.w	r1, r6, #193	@ 0xc1
c0de0664:	2200      	movs	r2, #0
c0de0666:	bf00      	nop
c0de0668:	7803      	ldrb	r3, [r0, #0]
c0de066a:	5c8d      	ldrb	r5, [r1, r2]
c0de066c:	548b      	strb	r3, [r1, r2]
c0de066e:	3201      	adds	r2, #1
c0de0670:	2a10      	cmp	r2, #16
c0de0672:	f800 5901 	strb.w	r5, [r0], #-1
c0de0676:	d1f7      	bne.n	c0de0668 <stream_eddsa_sign_step3+0x108>
c0de0678:	f106 0460 	add.w	r4, r6, #96	@ 0x60
c0de067c:	4620      	mov	r0, r4
c0de067e:	4639      	mov	r1, r7
c0de0680:	2220      	movs	r2, #32
c0de0682:	f007 ff16 	bl	c0de84b2 <__aeabi_memcpy>
c0de0686:	4650      	mov	r0, sl
c0de0688:	f007 fabb 	bl	c0de7c02 <cx_sha512_init_no_throw>
c0de068c:	4640      	mov	r0, r8
c0de068e:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de0692:	f007 fa86 	bl	c0de7ba2 <cx_blake2b_init_no_throw>
c0de0696:	b9d8      	cbnz	r0, c0de06d0 <stream_eddsa_sign_step3+0x170>
c0de0698:	2500      	movs	r5, #0
c0de069a:	4650      	mov	r0, sl
c0de069c:	2100      	movs	r1, #0
c0de069e:	4622      	mov	r2, r4
c0de06a0:	2320      	movs	r3, #32
c0de06a2:	9500      	str	r5, [sp, #0]
c0de06a4:	9501      	str	r5, [sp, #4]
c0de06a6:	f007 fa98 	bl	c0de7bda <cx_hash_no_throw>
c0de06aa:	b988      	cbnz	r0, c0de06d0 <stream_eddsa_sign_step3+0x170>
c0de06ac:	4650      	mov	r0, sl
c0de06ae:	f007 fa90 	bl	c0de7bd2 <cx_hash_get_size>
c0de06b2:	4650      	mov	r0, sl
c0de06b4:	2100      	movs	r1, #0
c0de06b6:	4632      	mov	r2, r6
c0de06b8:	2320      	movs	r3, #32
c0de06ba:	9500      	str	r5, [sp, #0]
c0de06bc:	9501      	str	r5, [sp, #4]
c0de06be:	f007 fa8c 	bl	c0de7bda <cx_hash_no_throw>
c0de06c2:	b928      	cbnz	r0, c0de06d0 <stream_eddsa_sign_step3+0x170>
c0de06c4:	4650      	mov	r0, sl
c0de06c6:	f007 fa84 	bl	c0de7bd2 <cx_hash_get_size>
c0de06ca:	b013      	add	sp, #76	@ 0x4c
c0de06cc:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de06d0:	f007 faa7 	bl	c0de7c22 <os_longjmp>

c0de06d4 <stream_eddsa_sign_step5>:
c0de06d4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de06d8:	b0a3      	sub	sp, #140	@ 0x8c
c0de06da:	4604      	mov	r4, r0
c0de06dc:	f500 75dc 	add.w	r5, r0, #440	@ 0x1b8
c0de06e0:	a803      	add	r0, sp, #12
c0de06e2:	4688      	mov	r8, r1
c0de06e4:	2720      	movs	r7, #32
c0de06e6:	9000      	str	r0, [sp, #0]
c0de06e8:	4628      	mov	r0, r5
c0de06ea:	2101      	movs	r1, #1
c0de06ec:	2200      	movs	r2, #0
c0de06ee:	2300      	movs	r3, #0
c0de06f0:	9701      	str	r7, [sp, #4]
c0de06f2:	f007 fa72 	bl	c0de7bda <cx_hash_no_throw>
c0de06f6:	2800      	cmp	r0, #0
c0de06f8:	f040 8081 	bne.w	c0de07fe <stream_eddsa_sign_step5+0x12a>
c0de06fc:	4628      	mov	r0, r5
c0de06fe:	f007 fa68 	bl	c0de7bd2 <cx_hash_get_size>
c0de0702:	f240 0008 	movw	r0, #8
c0de0706:	f2c0 0000 	movt	r0, #0
c0de070a:	4448      	add	r0, r9
c0de070c:	f200 306d 	addw	r0, r0, #877	@ 0x36d
c0de0710:	a903      	add	r1, sp, #12
c0de0712:	2220      	movs	r2, #32
c0de0714:	f007 fedc 	bl	c0de84d0 <memcmp>
c0de0718:	2800      	cmp	r0, #0
c0de071a:	d172      	bne.n	c0de0802 <stream_eddsa_sign_step5+0x12e>
c0de071c:	f104 05ec 	add.w	r5, r4, #236	@ 0xec
c0de0720:	2040      	movs	r0, #64	@ 0x40
c0de0722:	ae13      	add	r6, sp, #76	@ 0x4c
c0de0724:	9001      	str	r0, [sp, #4]
c0de0726:	4628      	mov	r0, r5
c0de0728:	2101      	movs	r1, #1
c0de072a:	2200      	movs	r2, #0
c0de072c:	2300      	movs	r3, #0
c0de072e:	9600      	str	r6, [sp, #0]
c0de0730:	f007 fa53 	bl	c0de7bda <cx_hash_no_throw>
c0de0734:	2800      	cmp	r0, #0
c0de0736:	d162      	bne.n	c0de07fe <stream_eddsa_sign_step5+0x12a>
c0de0738:	4628      	mov	r0, r5
c0de073a:	f007 fa4a 	bl	c0de7bd2 <cx_hash_get_size>
c0de073e:	2000      	movs	r0, #0
c0de0740:	213f      	movs	r1, #63	@ 0x3f
c0de0742:	bf00      	nop
c0de0744:	5c72      	ldrb	r2, [r6, r1]
c0de0746:	5c33      	ldrb	r3, [r6, r0]
c0de0748:	5432      	strb	r2, [r6, r0]
c0de074a:	3001      	adds	r0, #1
c0de074c:	5473      	strb	r3, [r6, r1]
c0de074e:	2820      	cmp	r0, #32
c0de0750:	f1a1 0101 	sub.w	r1, r1, #1
c0de0754:	d1f6      	bne.n	c0de0744 <stream_eddsa_sign_step5+0x70>
c0de0756:	f648 027c 	movw	r2, #34940	@ 0x887c
c0de075a:	f2c0 0200 	movt	r2, #0
c0de075e:	af13      	add	r7, sp, #76	@ 0x4c
c0de0760:	447a      	add	r2, pc
c0de0762:	4638      	mov	r0, r7
c0de0764:	2140      	movs	r1, #64	@ 0x40
c0de0766:	2320      	movs	r3, #32
c0de0768:	f007 fa43 	bl	c0de7bf2 <cx_math_modm_no_throw>
c0de076c:	2800      	cmp	r0, #0
c0de076e:	d146      	bne.n	c0de07fe <stream_eddsa_sign_step5+0x12a>
c0de0770:	f648 0260 	movw	r2, #34912	@ 0x8860
c0de0774:	f104 0520 	add.w	r5, r4, #32
c0de0778:	f2c0 0200 	movt	r2, #0
c0de077c:	447a      	add	r2, pc
c0de077e:	4628      	mov	r0, r5
c0de0780:	2120      	movs	r1, #32
c0de0782:	2320      	movs	r3, #32
c0de0784:	f04f 0a20 	mov.w	sl, #32
c0de0788:	f007 fa33 	bl	c0de7bf2 <cx_math_modm_no_throw>
c0de078c:	bbb8      	cbnz	r0, c0de07fe <stream_eddsa_sign_step5+0x12a>
c0de078e:	f648 033e 	movw	r3, #34878	@ 0x883e
c0de0792:	f104 0680 	add.w	r6, r4, #128	@ 0x80
c0de0796:	f2c0 0300 	movt	r3, #0
c0de079a:	f107 0120 	add.w	r1, r7, #32
c0de079e:	447b      	add	r3, pc
c0de07a0:	4630      	mov	r0, r6
c0de07a2:	462a      	mov	r2, r5
c0de07a4:	f8cd a000 	str.w	sl, [sp]
c0de07a8:	f007 fa27 	bl	c0de7bfa <cx_math_multm_no_throw>
c0de07ac:	bb38      	cbnz	r0, c0de07fe <stream_eddsa_sign_step5+0x12a>
c0de07ae:	f648 0320 	movw	r3, #34848	@ 0x8820
c0de07b2:	f2c0 0300 	movt	r3, #0
c0de07b6:	f104 0240 	add.w	r2, r4, #64	@ 0x40
c0de07ba:	2720      	movs	r7, #32
c0de07bc:	447b      	add	r3, pc
c0de07be:	4630      	mov	r0, r6
c0de07c0:	4631      	mov	r1, r6
c0de07c2:	9700      	str	r7, [sp, #0]
c0de07c4:	f007 fa11 	bl	c0de7bea <cx_math_addm_no_throw>
c0de07c8:	b9c8      	cbnz	r0, c0de07fe <stream_eddsa_sign_step5+0x12a>
c0de07ca:	f104 009f 	add.w	r0, r4, #159	@ 0x9f
c0de07ce:	2100      	movs	r1, #0
c0de07d0:	7802      	ldrb	r2, [r0, #0]
c0de07d2:	5c73      	ldrb	r3, [r6, r1]
c0de07d4:	5472      	strb	r2, [r6, r1]
c0de07d6:	3101      	adds	r1, #1
c0de07d8:	2910      	cmp	r1, #16
c0de07da:	f800 3901 	strb.w	r3, [r0], #-1
c0de07de:	d1f7      	bne.n	c0de07d0 <stream_eddsa_sign_step5+0xfc>
c0de07e0:	f104 0160 	add.w	r1, r4, #96	@ 0x60
c0de07e4:	4640      	mov	r0, r8
c0de07e6:	2240      	movs	r2, #64	@ 0x40
c0de07e8:	f007 fe65 	bl	c0de84b6 <__aeabi_memmove>
c0de07ec:	4620      	mov	r0, r4
c0de07ee:	f44f 712e 	mov.w	r1, #696	@ 0x2b8
c0de07f2:	f007 fe5b 	bl	c0de84ac <__aeabi_memclr>
c0de07f6:	2040      	movs	r0, #64	@ 0x40
c0de07f8:	b023      	add	sp, #140	@ 0x8c
c0de07fa:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de07fe:	f007 fa10 	bl	c0de7c22 <os_longjmp>
c0de0802:	f249 1001 	movw	r0, #37121	@ 0x9101
c0de0806:	f007 fa0c 	bl	c0de7c22 <os_longjmp>

c0de080a <waves_public_key_to_address>:
c0de080a:	b570      	push	{r4, r5, r6, lr}
c0de080c:	b098      	sub	sp, #96	@ 0x60
c0de080e:	ae10      	add	r6, sp, #64	@ 0x40
c0de0810:	4614      	mov	r4, r2
c0de0812:	460d      	mov	r5, r1
c0de0814:	2120      	movs	r1, #32
c0de0816:	4632      	mov	r2, r6
c0de0818:	f7ff fd88 	bl	c0de032c <blake2b_256>
c0de081c:	4630      	mov	r0, r6
c0de081e:	2120      	movs	r1, #32
c0de0820:	4632      	mov	r2, r6
c0de0822:	f7ff fda1 	bl	c0de0368 <keccak_256>
c0de0826:	2001      	movs	r0, #1
c0de0828:	f88d 5027 	strb.w	r5, [sp, #39]	@ 0x27
c0de082c:	f10d 0526 	add.w	r5, sp, #38	@ 0x26
c0de0830:	f88d 0026 	strb.w	r0, [sp, #38]	@ 0x26
c0de0834:	1ca8      	adds	r0, r5, #2
c0de0836:	4631      	mov	r1, r6
c0de0838:	2214      	movs	r2, #20
c0de083a:	f007 fe3a 	bl	c0de84b2 <__aeabi_memcpy>
c0de083e:	ae01      	add	r6, sp, #4
c0de0840:	4628      	mov	r0, r5
c0de0842:	2116      	movs	r1, #22
c0de0844:	4632      	mov	r2, r6
c0de0846:	f7ff fd71 	bl	c0de032c <blake2b_256>
c0de084a:	4630      	mov	r0, r6
c0de084c:	2120      	movs	r1, #32
c0de084e:	4632      	mov	r2, r6
c0de0850:	f7ff fd8a 	bl	c0de0368 <keccak_256>
c0de0854:	9801      	ldr	r0, [sp, #4]
c0de0856:	462a      	mov	r2, r5
c0de0858:	0e01      	lsrs	r1, r0, #24
c0de085a:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de085e:	f88d 103f 	strb.w	r1, [sp, #63]	@ 0x3f
c0de0862:	0c01      	lsrs	r1, r0, #16
c0de0864:	0a00      	lsrs	r0, r0, #8
c0de0866:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de086a:	2024      	movs	r0, #36	@ 0x24
c0de086c:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de0870:	9000      	str	r0, [sp, #0]
c0de0872:	4669      	mov	r1, sp
c0de0874:	4620      	mov	r0, r4
c0de0876:	231a      	movs	r3, #26
c0de0878:	f7ff fc4a 	bl	c0de0110 <b58enc>
c0de087c:	b018      	add	sp, #96	@ 0x60
c0de087e:	bd70      	pop	{r4, r5, r6, pc}

c0de0880 <waves_public_key_hash_to_address>:
c0de0880:	b570      	push	{r4, r5, r6, lr}
c0de0882:	b090      	sub	sp, #64	@ 0x40
c0de0884:	4614      	mov	r4, r2
c0de0886:	4602      	mov	r2, r0
c0de0888:	2001      	movs	r0, #1
c0de088a:	f10d 0526 	add.w	r5, sp, #38	@ 0x26
c0de088e:	f88d 0026 	strb.w	r0, [sp, #38]	@ 0x26
c0de0892:	f88d 1027 	strb.w	r1, [sp, #39]	@ 0x27
c0de0896:	1ca8      	adds	r0, r5, #2
c0de0898:	4611      	mov	r1, r2
c0de089a:	2214      	movs	r2, #20
c0de089c:	f007 fe09 	bl	c0de84b2 <__aeabi_memcpy>
c0de08a0:	ae01      	add	r6, sp, #4
c0de08a2:	4628      	mov	r0, r5
c0de08a4:	2116      	movs	r1, #22
c0de08a6:	4632      	mov	r2, r6
c0de08a8:	f7ff fd40 	bl	c0de032c <blake2b_256>
c0de08ac:	4630      	mov	r0, r6
c0de08ae:	2120      	movs	r1, #32
c0de08b0:	4632      	mov	r2, r6
c0de08b2:	f7ff fd59 	bl	c0de0368 <keccak_256>
c0de08b6:	9801      	ldr	r0, [sp, #4]
c0de08b8:	462a      	mov	r2, r5
c0de08ba:	0e01      	lsrs	r1, r0, #24
c0de08bc:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de08c0:	f88d 103f 	strb.w	r1, [sp, #63]	@ 0x3f
c0de08c4:	0c01      	lsrs	r1, r0, #16
c0de08c6:	0a00      	lsrs	r0, r0, #8
c0de08c8:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de08cc:	2024      	movs	r0, #36	@ 0x24
c0de08ce:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de08d2:	9000      	str	r0, [sp, #0]
c0de08d4:	4669      	mov	r1, sp
c0de08d6:	4620      	mov	r0, r4
c0de08d8:	231a      	movs	r3, #26
c0de08da:	f7ff fc19 	bl	c0de0110 <b58enc>
c0de08de:	b010      	add	sp, #64	@ 0x40
c0de08e0:	bd70      	pop	{r4, r5, r6, pc}
c0de08e2:	d4d4      	bmi.n	c0de088e <waves_public_key_hash_to_address+0xe>

c0de08e4 <copy_in_reverse_order>:
c0de08e4:	b580      	push	{r7, lr}
c0de08e6:	b17a      	cbz	r2, c0de0908 <copy_in_reverse_order+0x24>
c0de08e8:	f04f 0c00 	mov.w	ip, #0
c0de08ec:	f04f 0e00 	mov.w	lr, #0
c0de08f0:	ea6f 030c 	mvn.w	r3, ip
c0de08f4:	4413      	add	r3, r2
c0de08f6:	5ccb      	ldrb	r3, [r1, r3]
c0de08f8:	f10e 0e01 	add.w	lr, lr, #1
c0de08fc:	f800 300c 	strb.w	r3, [r0, ip]
c0de0900:	fa1f fc8e 	uxth.w	ip, lr
c0de0904:	4594      	cmp	ip, r2
c0de0906:	d3f3      	bcc.n	c0de08f0 <copy_in_reverse_order+0xc>
c0de0908:	bd80      	pop	{r7, pc}

c0de090a <deserialize_uint32_t>:
c0de090a:	7842      	ldrb	r2, [r0, #1]
c0de090c:	7801      	ldrb	r1, [r0, #0]
c0de090e:	7883      	ldrb	r3, [r0, #2]
c0de0910:	0412      	lsls	r2, r2, #16
c0de0912:	78c0      	ldrb	r0, [r0, #3]
c0de0914:	ea42 6101 	orr.w	r1, r2, r1, lsl #24
c0de0918:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de091c:	4408      	add	r0, r1
c0de091e:	4770      	bx	lr

c0de0920 <read_path_from_bytes>:
c0de0920:	b580      	push	{r7, lr}
c0de0922:	7843      	ldrb	r3, [r0, #1]
c0de0924:	f890 c000 	ldrb.w	ip, [r0]
c0de0928:	7882      	ldrb	r2, [r0, #2]
c0de092a:	041b      	lsls	r3, r3, #16
c0de092c:	f890 e003 	ldrb.w	lr, [r0, #3]
c0de0930:	ea43 630c 	orr.w	r3, r3, ip, lsl #24
c0de0934:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de0938:	4472      	add	r2, lr
c0de093a:	600a      	str	r2, [r1, #0]
c0de093c:	7943      	ldrb	r3, [r0, #5]
c0de093e:	f890 c004 	ldrb.w	ip, [r0, #4]
c0de0942:	7982      	ldrb	r2, [r0, #6]
c0de0944:	041b      	lsls	r3, r3, #16
c0de0946:	f890 e007 	ldrb.w	lr, [r0, #7]
c0de094a:	ea43 630c 	orr.w	r3, r3, ip, lsl #24
c0de094e:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de0952:	4472      	add	r2, lr
c0de0954:	604a      	str	r2, [r1, #4]
c0de0956:	7a43      	ldrb	r3, [r0, #9]
c0de0958:	f890 c008 	ldrb.w	ip, [r0, #8]
c0de095c:	7a82      	ldrb	r2, [r0, #10]
c0de095e:	041b      	lsls	r3, r3, #16
c0de0960:	f890 e00b 	ldrb.w	lr, [r0, #11]
c0de0964:	ea43 630c 	orr.w	r3, r3, ip, lsl #24
c0de0968:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de096c:	4472      	add	r2, lr
c0de096e:	608a      	str	r2, [r1, #8]
c0de0970:	7b43      	ldrb	r3, [r0, #13]
c0de0972:	f890 c00c 	ldrb.w	ip, [r0, #12]
c0de0976:	7b82      	ldrb	r2, [r0, #14]
c0de0978:	041b      	lsls	r3, r3, #16
c0de097a:	f890 e00f 	ldrb.w	lr, [r0, #15]
c0de097e:	ea43 630c 	orr.w	r3, r3, ip, lsl #24
c0de0982:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de0986:	4472      	add	r2, lr
c0de0988:	60ca      	str	r2, [r1, #12]
c0de098a:	7c43      	ldrb	r3, [r0, #17]
c0de098c:	f890 c010 	ldrb.w	ip, [r0, #16]
c0de0990:	7c82      	ldrb	r2, [r0, #18]
c0de0992:	041b      	lsls	r3, r3, #16
c0de0994:	7cc0      	ldrb	r0, [r0, #19]
c0de0996:	ea43 630c 	orr.w	r3, r3, ip, lsl #24
c0de099a:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de099e:	4410      	add	r0, r2
c0de09a0:	6108      	str	r0, [r1, #16]
c0de09a2:	bd80      	pop	{r7, pc}

c0de09a4 <hash_stream_data>:
c0de09a4:	b5b0      	push	{r4, r5, r7, lr}
c0de09a6:	f240 0c08 	movw	ip, #8
c0de09aa:	f2c0 0c00 	movt	ip, #0
c0de09ae:	eb09 050c 	add.w	r5, r9, ip
c0de09b2:	f8d5 33b8 	ldr.w	r3, [r5, #952]	@ 0x3b8
c0de09b6:	e9d5 45ec 	ldrd	r4, r5, [r5, #944]	@ 0x3b0
c0de09ba:	1ac0      	subs	r0, r0, r3
c0de09bc:	2c00      	cmp	r4, #0
c0de09be:	eba5 0404 	sub.w	r4, r5, r4
c0de09c2:	d108      	bne.n	c0de09d6 <hash_stream_data+0x32>
c0de09c4:	eb09 050c 	add.w	r5, r9, ip
c0de09c8:	f895 239b 	ldrb.w	r2, [r5, #923]	@ 0x39b
c0de09cc:	1a80      	subs	r0, r0, r2
c0de09ce:	1aa4      	subs	r4, r4, r2
c0de09d0:	4413      	add	r3, r2
c0de09d2:	f8c5 33b8 	str.w	r3, [r5, #952]	@ 0x3b8
c0de09d6:	42a0      	cmp	r0, r4
c0de09d8:	bf38      	it	cc
c0de09da:	4604      	movcc	r4, r0
c0de09dc:	1858      	adds	r0, r3, r1
c0de09de:	f240 6114 	movw	r1, #1556	@ 0x614
c0de09e2:	f2c0 0100 	movt	r1, #0
c0de09e6:	4449      	add	r1, r9
c0de09e8:	eb09 050c 	add.w	r5, r9, ip
c0de09ec:	4401      	add	r1, r0
c0de09ee:	4628      	mov	r0, r5
c0de09f0:	4622      	mov	r2, r4
c0de09f2:	f7ff fd88 	bl	c0de0506 <stream_eddsa_sign_step2>
c0de09f6:	f8d5 03b0 	ldr.w	r0, [r5, #944]	@ 0x3b0
c0de09fa:	f8d5 13b8 	ldr.w	r1, [r5, #952]	@ 0x3b8
c0de09fe:	4420      	add	r0, r4
c0de0a00:	f8c5 03b0 	str.w	r0, [r5, #944]	@ 0x3b0
c0de0a04:	1908      	adds	r0, r1, r4
c0de0a06:	f8c5 03b8 	str.w	r0, [r5, #952]	@ 0x3b8
c0de0a0a:	bdb0      	pop	{r4, r5, r7, pc}

c0de0a0c <make_sign_step>:
c0de0a0c:	b570      	push	{r4, r5, r6, lr}
c0de0a0e:	b09e      	sub	sp, #120	@ 0x78
c0de0a10:	f240 0408 	movw	r4, #8
c0de0a14:	f2c0 0400 	movt	r4, #0
c0de0a18:	eb09 0204 	add.w	r2, r9, r4
c0de0a1c:	f892 339a 	ldrb.w	r3, [r2, #922]	@ 0x39a
c0de0a20:	4602      	mov	r2, r0
c0de0a22:	2b04      	cmp	r3, #4
c0de0a24:	d02c      	beq.n	c0de0a80 <make_sign_step+0x74>
c0de0a26:	2b02      	cmp	r3, #2
c0de0a28:	d01b      	beq.n	c0de0a62 <make_sign_step+0x56>
c0de0a2a:	2b01      	cmp	r3, #1
c0de0a2c:	d14c      	bne.n	c0de0ac8 <make_sign_step+0xbc>
c0de0a2e:	444c      	add	r4, r9
c0de0a30:	ad0b      	add	r5, sp, #44	@ 0x2c
c0de0a32:	ae01      	add	r6, sp, #4
c0de0a34:	f504 7067 	add.w	r0, r4, #924	@ 0x39c
c0de0a38:	4629      	mov	r1, r5
c0de0a3a:	4632      	mov	r2, r6
c0de0a3c:	f7ff fc31 	bl	c0de02a2 <get_keypair_by_path>
c0de0a40:	4620      	mov	r0, r4
c0de0a42:	4631      	mov	r1, r6
c0de0a44:	f7ff fcae 	bl	c0de03a4 <stream_eddsa_sign_step1>
c0de0a48:	4628      	mov	r0, r5
c0de0a4a:	f7ff fc07 	bl	c0de025c <public_key_le_to_be>
c0de0a4e:	f89d 0053 	ldrb.w	r0, [sp, #83]	@ 0x53
c0de0a52:	f000 0080 	and.w	r0, r0, #128	@ 0x80
c0de0a56:	f884 0320 	strb.w	r0, [r4, #800]	@ 0x320
c0de0a5a:	2002      	movs	r0, #2
c0de0a5c:	f884 039a 	strb.w	r0, [r4, #922]	@ 0x39a
c0de0a60:	e032      	b.n	c0de0ac8 <make_sign_step+0xbc>
c0de0a62:	eb09 0004 	add.w	r0, r9, r4
c0de0a66:	f8d0 33b4 	ldr.w	r3, [r0, #948]	@ 0x3b4
c0de0a6a:	f8d0 03b0 	ldr.w	r0, [r0, #944]	@ 0x3b0
c0de0a6e:	4298      	cmp	r0, r3
c0de0a70:	d220      	bcs.n	c0de0ab4 <make_sign_step+0xa8>
c0de0a72:	4608      	mov	r0, r1
c0de0a74:	4611      	mov	r1, r2
c0de0a76:	b01e      	add	sp, #120	@ 0x78
c0de0a78:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de0a7c:	f7ff bf92 	b.w	c0de09a4 <hash_stream_data>
c0de0a80:	eb09 0004 	add.w	r0, r9, r4
c0de0a84:	f8d0 33b4 	ldr.w	r3, [r0, #948]	@ 0x3b4
c0de0a88:	f8d0 03b0 	ldr.w	r0, [r0, #944]	@ 0x3b0
c0de0a8c:	4298      	cmp	r0, r3
c0de0a8e:	d21b      	bcs.n	c0de0ac8 <make_sign_step+0xbc>
c0de0a90:	4608      	mov	r0, r1
c0de0a92:	4611      	mov	r1, r2
c0de0a94:	f7ff ff86 	bl	c0de09a4 <hash_stream_data>
c0de0a98:	eb09 0004 	add.w	r0, r9, r4
c0de0a9c:	f8d0 13b4 	ldr.w	r1, [r0, #948]	@ 0x3b4
c0de0aa0:	f8d0 03b0 	ldr.w	r0, [r0, #944]	@ 0x3b0
c0de0aa4:	4288      	cmp	r0, r1
c0de0aa6:	bf02      	ittt	eq
c0de0aa8:	eb09 0004 	addeq.w	r0, r9, r4
c0de0aac:	2105      	moveq	r1, #5
c0de0aae:	f880 139a 	strbeq.w	r1, [r0, #922]	@ 0x39a
c0de0ab2:	e009      	b.n	c0de0ac8 <make_sign_step+0xbc>
c0de0ab4:	444c      	add	r4, r9
c0de0ab6:	4620      	mov	r0, r4
c0de0ab8:	f7ff fd52 	bl	c0de0560 <stream_eddsa_sign_step3>
c0de0abc:	2004      	movs	r0, #4
c0de0abe:	f884 039a 	strb.w	r0, [r4, #922]	@ 0x39a
c0de0ac2:	2000      	movs	r0, #0
c0de0ac4:	f8c4 03b0 	str.w	r0, [r4, #944]	@ 0x3b0
c0de0ac8:	b01e      	add	sp, #120	@ 0x78
c0de0aca:	bd70      	pop	{r4, r5, r6, pc}

c0de0acc <make_allowed_sign_steps>:
c0de0acc:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0ace:	b081      	sub	sp, #4
c0de0ad0:	f240 0608 	movw	r6, #8
c0de0ad4:	f240 6014 	movw	r0, #1556	@ 0x614
c0de0ad8:	f2c0 0600 	movt	r6, #0
c0de0adc:	f2c0 0000 	movt	r0, #0
c0de0ae0:	eb09 0206 	add.w	r2, r9, r6
c0de0ae4:	eb09 0100 	add.w	r1, r9, r0
c0de0ae8:	f8d2 23bc 	ldr.w	r2, [r2, #956]	@ 0x3bc
c0de0aec:	790d      	ldrb	r5, [r1, #4]
c0de0aee:	b10a      	cbz	r2, c0de0af4 <make_allowed_sign_steps+0x28>
c0de0af0:	2405      	movs	r4, #5
c0de0af2:	e035      	b.n	c0de0b60 <make_allowed_sign_steps+0x94>
c0de0af4:	eb09 0700 	add.w	r7, r9, r0
c0de0af8:	eb09 0406 	add.w	r4, r9, r6
c0de0afc:	1d78      	adds	r0, r7, #5
c0de0afe:	f504 7167 	add.w	r1, r4, #924	@ 0x39c
c0de0b02:	f7ff ff0d 	bl	c0de0920 <read_path_from_bytes>
c0de0b06:	7e78      	ldrb	r0, [r7, #25]
c0de0b08:	7eb9      	ldrb	r1, [r7, #26]
c0de0b0a:	f884 0321 	strb.w	r0, [r4, #801]	@ 0x321
c0de0b0e:	7f78      	ldrb	r0, [r7, #29]
c0de0b10:	f884 1322 	strb.w	r1, [r4, #802]	@ 0x322
c0de0b14:	f884 0325 	strb.w	r0, [r4, #805]	@ 0x325
c0de0b18:	7ff8      	ldrb	r0, [r7, #31]
c0de0b1a:	7fb9      	ldrb	r1, [r7, #30]
c0de0b1c:	7efa      	ldrb	r2, [r7, #27]
c0de0b1e:	0400      	lsls	r0, r0, #16
c0de0b20:	ea40 6001 	orr.w	r0, r0, r1, lsl #24
c0de0b24:	f897 1020 	ldrb.w	r1, [r7, #32]
c0de0b28:	f884 2323 	strb.w	r2, [r4, #803]	@ 0x323
c0de0b2c:	f897 2021 	ldrb.w	r2, [r7, #33]	@ 0x21
c0de0b30:	7f3b      	ldrb	r3, [r7, #28]
c0de0b32:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de0b36:	4410      	add	r0, r2
c0de0b38:	f884 3324 	strb.w	r3, [r4, #804]	@ 0x324
c0de0b3c:	f8c4 03b4 	str.w	r0, [r4, #948]	@ 0x3b4
c0de0b40:	f004 fb82 	bl	c0de5248 <getMessageType>
c0de0b44:	f894 1321 	ldrb.w	r1, [r4, #801]	@ 0x321
c0de0b48:	f8c4 0328 	str.w	r0, [r4, #808]	@ 0x328
c0de0b4c:	2909      	cmp	r1, #9
c0de0b4e:	d223      	bcs.n	c0de0b98 <make_allowed_sign_steps+0xcc>
c0de0b50:	eb09 0006 	add.w	r0, r9, r6
c0de0b54:	f890 0322 	ldrb.w	r0, [r0, #802]	@ 0x322
c0de0b58:	2809      	cmp	r0, #9
c0de0b5a:	d21d      	bcs.n	c0de0b98 <make_allowed_sign_steps+0xcc>
c0de0b5c:	3d1d      	subs	r5, #29
c0de0b5e:	2422      	movs	r4, #34	@ 0x22
c0de0b60:	eb09 0006 	add.w	r0, r9, r6
c0de0b64:	f8d0 13b8 	ldr.w	r1, [r0, #952]	@ 0x3b8
c0de0b68:	b2ed      	uxtb	r5, r5
c0de0b6a:	42a9      	cmp	r1, r5
c0de0b6c:	d212      	bcs.n	c0de0b94 <make_allowed_sign_steps+0xc8>
c0de0b6e:	f890 039a 	ldrb.w	r0, [r0, #922]	@ 0x39a
c0de0b72:	2804      	cmp	r0, #4
c0de0b74:	d80e      	bhi.n	c0de0b94 <make_allowed_sign_steps+0xc8>
c0de0b76:	bf00      	nop
c0de0b78:	4620      	mov	r0, r4
c0de0b7a:	4629      	mov	r1, r5
c0de0b7c:	f7ff ff46 	bl	c0de0a0c <make_sign_step>
c0de0b80:	eb09 0006 	add.w	r0, r9, r6
c0de0b84:	f8d0 13b8 	ldr.w	r1, [r0, #952]	@ 0x3b8
c0de0b88:	42a9      	cmp	r1, r5
c0de0b8a:	d203      	bcs.n	c0de0b94 <make_allowed_sign_steps+0xc8>
c0de0b8c:	f890 039a 	ldrb.w	r0, [r0, #922]	@ 0x39a
c0de0b90:	2805      	cmp	r0, #5
c0de0b92:	d3f1      	bcc.n	c0de0b78 <make_allowed_sign_steps+0xac>
c0de0b94:	b001      	add	sp, #4
c0de0b96:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de0b98:	f249 1003 	movw	r0, #37123	@ 0x9103
c0de0b9c:	f007 f841 	bl	c0de7c22 <os_longjmp>

c0de0ba0 <set_result_sign>:
c0de0ba0:	b510      	push	{r4, lr}
c0de0ba2:	f240 0008 	movw	r0, #8
c0de0ba6:	f2c0 0000 	movt	r0, #0
c0de0baa:	eb09 0400 	add.w	r4, r9, r0
c0de0bae:	f894 0320 	ldrb.w	r0, [r4, #800]	@ 0x320
c0de0bb2:	f894 236c 	ldrb.w	r2, [r4, #876]	@ 0x36c
c0de0bb6:	f204 312d 	addw	r1, r4, #813	@ 0x32d
c0de0bba:	4310      	orrs	r0, r2
c0de0bbc:	f884 036c 	strb.w	r0, [r4, #876]	@ 0x36c
c0de0bc0:	f240 6014 	movw	r0, #1556	@ 0x614
c0de0bc4:	f2c0 0000 	movt	r0, #0
c0de0bc8:	4448      	add	r0, r9
c0de0bca:	2240      	movs	r2, #64	@ 0x40
c0de0bcc:	f007 fc71 	bl	c0de84b2 <__aeabi_memcpy>
c0de0bd0:	4620      	mov	r0, r4
c0de0bd2:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0bd6:	f007 fc69 	bl	c0de84ac <__aeabi_memclr>
c0de0bda:	2040      	movs	r0, #64	@ 0x40
c0de0bdc:	bd10      	pop	{r4, pc}

c0de0bde <set_result_get_address>:
c0de0bde:	b5b0      	push	{r4, r5, r7, lr}
c0de0be0:	f240 6014 	movw	r0, #1556	@ 0x614
c0de0be4:	f2c0 0000 	movt	r0, #0
c0de0be8:	eb09 0400 	add.w	r4, r9, r0
c0de0bec:	f240 0008 	movw	r0, #8
c0de0bf0:	f2c0 0000 	movt	r0, #0
c0de0bf4:	eb09 0500 	add.w	r5, r9, r0
c0de0bf8:	f105 0124 	add.w	r1, r5, #36	@ 0x24
c0de0bfc:	4620      	mov	r0, r4
c0de0bfe:	2220      	movs	r2, #32
c0de0c00:	f007 fc57 	bl	c0de84b2 <__aeabi_memcpy>
c0de0c04:	f104 0020 	add.w	r0, r4, #32
c0de0c08:	4629      	mov	r1, r5
c0de0c0a:	2223      	movs	r2, #35	@ 0x23
c0de0c0c:	f007 fc51 	bl	c0de84b2 <__aeabi_memcpy>
c0de0c10:	4628      	mov	r0, r5
c0de0c12:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0c16:	f007 fc49 	bl	c0de84ac <__aeabi_memclr>
c0de0c1a:	2043      	movs	r0, #67	@ 0x43
c0de0c1c:	bdb0      	pop	{r4, r5, r7, pc}

c0de0c1e <handle_apdu>:
c0de0c1e:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0c22:	b0b0      	sub	sp, #192	@ 0xc0
c0de0c24:	ad23      	add	r5, sp, #140	@ 0x8c
c0de0c26:	4680      	mov	r8, r0
c0de0c28:	4628      	mov	r0, r5
c0de0c2a:	460e      	mov	r6, r1
c0de0c2c:	922f      	str	r2, [sp, #188]	@ 0xbc
c0de0c2e:	f007 fc8f 	bl	c0de8550 <setjmp>
c0de0c32:	b284      	uxth	r4, r0
c0de0c34:	f8ad 00b8 	strh.w	r0, [sp, #184]	@ 0xb8
c0de0c38:	b1bc      	cbz	r4, c0de0c6a <handle_apdu+0x4c>
c0de0c3a:	2c05      	cmp	r4, #5
c0de0c3c:	f000 80f0 	beq.w	c0de0e20 <handle_apdu+0x202>
c0de0c40:	4607      	mov	r7, r0
c0de0c42:	982d      	ldr	r0, [sp, #180]	@ 0xb4
c0de0c44:	2100      	movs	r1, #0
c0de0c46:	f8ad 10b8 	strh.w	r1, [sp, #184]	@ 0xb8
c0de0c4a:	f007 fac1 	bl	c0de81d0 <try_context_set>
c0de0c4e:	f404 4070 	and.w	r0, r4, #61440	@ 0xf000
c0de0c52:	f5b0 4fc0 	cmp.w	r0, #24576	@ 0x6000
c0de0c56:	d002      	beq.n	c0de0c5e <handle_apdu+0x40>
c0de0c58:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de0c5c:	d17c      	bne.n	c0de0d58 <handle_apdu+0x13a>
c0de0c5e:	f5b4 4f10 	cmp.w	r4, #36864	@ 0x9000
c0de0c62:	d17e      	bne.n	c0de0d62 <handle_apdu+0x144>
c0de0c64:	2190      	movs	r1, #144	@ 0x90
c0de0c66:	2000      	movs	r0, #0
c0de0c68:	e08a      	b.n	c0de0d80 <handle_apdu+0x162>
c0de0c6a:	a823      	add	r0, sp, #140	@ 0x8c
c0de0c6c:	f007 fab0 	bl	c0de81d0 <try_context_set>
c0de0c70:	902d      	str	r0, [sp, #180]	@ 0xb4
c0de0c72:	f007 fa2f 	bl	c0de80d4 <os_global_pin_is_validated>
c0de0c76:	28aa      	cmp	r0, #170	@ 0xaa
c0de0c78:	f040 80db 	bne.w	c0de0e32 <handle_apdu+0x214>
c0de0c7c:	f240 6514 	movw	r5, #1556	@ 0x614
c0de0c80:	4648      	mov	r0, r9
c0de0c82:	f2c0 0500 	movt	r5, #0
c0de0c86:	f819 0005 	ldrb.w	r0, [r9, r5]
c0de0c8a:	2880      	cmp	r0, #128	@ 0x80
c0de0c8c:	f040 80d5 	bne.w	c0de0e3a <handle_apdu+0x21c>
c0de0c90:	4648      	mov	r0, r9
c0de0c92:	eb09 0005 	add.w	r0, r9, r5
c0de0c96:	7840      	ldrb	r0, [r0, #1]
c0de0c98:	2804      	cmp	r0, #4
c0de0c9a:	f040 808e 	bne.w	c0de0dba <handle_apdu+0x19c>
c0de0c9e:	4648      	mov	r0, r9
c0de0ca0:	eb09 0005 	add.w	r0, r9, r5
c0de0ca4:	7900      	ldrb	r0, [r0, #4]
c0de0ca6:	992f      	ldr	r1, [sp, #188]	@ 0xbc
c0de0ca8:	2814      	cmp	r0, #20
c0de0caa:	f040 8171 	bne.w	c0de0f90 <handle_apdu+0x372>
c0de0cae:	3905      	subs	r1, #5
c0de0cb0:	4281      	cmp	r1, r0
c0de0cb2:	f040 816d 	bne.w	c0de0f90 <handle_apdu+0x372>
c0de0cb6:	e9cd 6800 	strd	r6, r8, [sp]
c0de0cba:	f240 0608 	movw	r6, #8
c0de0cbe:	f2c0 0600 	movt	r6, #0
c0de0cc2:	eb09 0006 	add.w	r0, r9, r6
c0de0cc6:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0cca:	464c      	mov	r4, r9
c0de0ccc:	f007 fbee 	bl	c0de84ac <__aeabi_memclr>
c0de0cd0:	eb09 0005 	add.w	r0, r9, r5
c0de0cd4:	ac0b      	add	r4, sp, #44	@ 0x2c
c0de0cd6:	3005      	adds	r0, #5
c0de0cd8:	4621      	mov	r1, r4
c0de0cda:	f7ff fe21 	bl	c0de0920 <read_path_from_bytes>
c0de0cde:	af10      	add	r7, sp, #64	@ 0x40
c0de0ce0:	4620      	mov	r0, r4
c0de0ce2:	4639      	mov	r1, r7
c0de0ce4:	f7ff fb0a 	bl	c0de02fc <get_curve25519_public_key_for_path>
c0de0ce8:	2800      	cmp	r0, #0
c0de0cea:	f000 80aa 	beq.w	c0de0e42 <handle_apdu+0x224>
c0de0cee:	eb09 0805 	add.w	r8, r9, r5
c0de0cf2:	f898 1003 	ldrb.w	r1, [r8, #3]
c0de0cf6:	3708      	adds	r7, #8
c0de0cf8:	f10d 0b08 	add.w	fp, sp, #8
c0de0cfc:	4638      	mov	r0, r7
c0de0cfe:	465a      	mov	r2, fp
c0de0d00:	46ca      	mov	sl, r9
c0de0d02:	f7ff fd82 	bl	c0de080a <waves_public_key_to_address>
c0de0d06:	463a      	mov	r2, r7
c0de0d08:	eb09 0006 	add.w	r0, r9, r6
c0de0d0c:	46ac      	mov	ip, r5
c0de0d0e:	ca78      	ldmia	r2!, {r3, r4, r5, r6}
c0de0d10:	f100 0124 	add.w	r1, r0, #36	@ 0x24
c0de0d14:	c178      	stmia	r1!, {r3, r4, r5, r6}
c0de0d16:	e892 0078 	ldmia.w	r2, {r3, r4, r5, r6}
c0de0d1a:	c178      	stmia	r1!, {r3, r4, r5, r6}
c0de0d1c:	e8bb 006c 	ldmia.w	fp!, {r2, r3, r5, r6}
c0de0d20:	4601      	mov	r1, r0
c0de0d22:	c16c      	stmia	r1!, {r2, r3, r5, r6}
c0de0d24:	e8bb 006c 	ldmia.w	fp!, {r2, r3, r5, r6}
c0de0d28:	c16c      	stmia	r1!, {r2, r3, r5, r6}
c0de0d2a:	f8bb 2000 	ldrh.w	r2, [fp]
c0de0d2e:	f89b 3002 	ldrb.w	r3, [fp, #2]
c0de0d32:	800a      	strh	r2, [r1, #0]
c0de0d34:	708b      	strb	r3, [r1, #2]
c0de0d36:	f898 1002 	ldrb.w	r1, [r8, #2]
c0de0d3a:	2200      	movs	r2, #0
c0de0d3c:	2900      	cmp	r1, #0
c0de0d3e:	f880 2023 	strb.w	r2, [r0, #35]	@ 0x23
c0de0d42:	f000 8081 	beq.w	c0de0e48 <handle_apdu+0x22a>
c0de0d46:	9901      	ldr	r1, [sp, #4]
c0de0d48:	6808      	ldr	r0, [r1, #0]
c0de0d4a:	f040 0010 	orr.w	r0, r0, #16
c0de0d4e:	6008      	str	r0, [r1, #0]
c0de0d50:	f004 f892 	bl	c0de4e78 <menu_address_init>
c0de0d54:	ad23      	add	r5, sp, #140	@ 0x8c
c0de0d56:	e022      	b.n	c0de0d9e <handle_apdu+0x180>
c0de0d58:	0a38      	lsrs	r0, r7, #8
c0de0d5a:	210d      	movs	r1, #13
c0de0d5c:	f361 00df 	bfi	r0, r1, #3, #29
c0de0d60:	e000      	b.n	c0de0d64 <handle_apdu+0x146>
c0de0d62:	0a38      	lsrs	r0, r7, #8
c0de0d64:	4604      	mov	r4, r0
c0de0d66:	f240 0008 	movw	r0, #8
c0de0d6a:	f2c0 0000 	movt	r0, #0
c0de0d6e:	4448      	add	r0, r9
c0de0d70:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0d74:	f007 fb9a 	bl	c0de84ac <__aeabi_memclr>
c0de0d78:	f004 f895 	bl	c0de4ea6 <ui_idle>
c0de0d7c:	4638      	mov	r0, r7
c0de0d7e:	4621      	mov	r1, r4
c0de0d80:	f240 6714 	movw	r7, #1556	@ 0x614
c0de0d84:	464a      	mov	r2, r9
c0de0d86:	6833      	ldr	r3, [r6, #0]
c0de0d88:	f2c0 0700 	movt	r7, #0
c0de0d8c:	eb09 0207 	add.w	r2, r9, r7
c0de0d90:	54d1      	strb	r1, [r2, r3]
c0de0d92:	6831      	ldr	r1, [r6, #0]
c0de0d94:	4411      	add	r1, r2
c0de0d96:	7048      	strb	r0, [r1, #1]
c0de0d98:	6830      	ldr	r0, [r6, #0]
c0de0d9a:	3002      	adds	r0, #2
c0de0d9c:	6030      	str	r0, [r6, #0]
c0de0d9e:	f007 fa0d 	bl	c0de81bc <try_context_get>
c0de0da2:	42a8      	cmp	r0, r5
c0de0da4:	d102      	bne.n	c0de0dac <handle_apdu+0x18e>
c0de0da6:	982d      	ldr	r0, [sp, #180]	@ 0xb4
c0de0da8:	f007 fa12 	bl	c0de81d0 <try_context_set>
c0de0dac:	f8bd 00b8 	ldrh.w	r0, [sp, #184]	@ 0xb8
c0de0db0:	2800      	cmp	r0, #0
c0de0db2:	d147      	bne.n	c0de0e44 <handle_apdu+0x226>
c0de0db4:	b030      	add	sp, #192	@ 0xc0
c0de0db6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de0dba:	462c      	mov	r4, r5
c0de0dbc:	2808      	cmp	r0, #8
c0de0dbe:	d05d      	beq.n	c0de0e7c <handle_apdu+0x25e>
c0de0dc0:	2806      	cmp	r0, #6
c0de0dc2:	d071      	beq.n	c0de0ea8 <handle_apdu+0x28a>
c0de0dc4:	2802      	cmp	r0, #2
c0de0dc6:	d17d      	bne.n	c0de0ec4 <handle_apdu+0x2a6>
c0de0dc8:	4648      	mov	r0, r9
c0de0dca:	eb09 0004 	add.w	r0, r9, r4
c0de0dce:	7900      	ldrb	r0, [r0, #4]
c0de0dd0:	992f      	ldr	r1, [sp, #188]	@ 0xbc
c0de0dd2:	3905      	subs	r1, #5
c0de0dd4:	4281      	cmp	r1, r0
c0de0dd6:	f040 80db 	bne.w	c0de0f90 <handle_apdu+0x372>
c0de0dda:	4648      	mov	r0, r9
c0de0ddc:	eb09 0004 	add.w	r0, r9, r4
c0de0de0:	7880      	ldrb	r0, [r0, #2]
c0de0de2:	0641      	lsls	r1, r0, #25
c0de0de4:	d172      	bne.n	c0de0ecc <handle_apdu+0x2ae>
c0de0de6:	4647      	mov	r7, r8
c0de0de8:	f240 0808 	movw	r8, #8
c0de0dec:	4649      	mov	r1, r9
c0de0dee:	f2c0 0800 	movt	r8, #0
c0de0df2:	eb09 0108 	add.w	r1, r9, r8
c0de0df6:	f891 139a 	ldrb.w	r1, [r1, #922]	@ 0x39a
c0de0dfa:	2905      	cmp	r1, #5
c0de0dfc:	f200 8092 	bhi.w	c0de0f24 <handle_apdu+0x306>
c0de0e00:	2900      	cmp	r1, #0
c0de0e02:	d167      	bne.n	c0de0ed4 <handle_apdu+0x2b6>
c0de0e04:	f004 fd42 	bl	c0de588c <show_processing>
c0de0e08:	4648      	mov	r0, r9
c0de0e0a:	eb09 0004 	add.w	r0, r9, r4
c0de0e0e:	78c0      	ldrb	r0, [r0, #3]
c0de0e10:	eb09 0108 	add.w	r1, r9, r8
c0de0e14:	2201      	movs	r2, #1
c0de0e16:	f881 239a 	strb.w	r2, [r1, #922]	@ 0x39a
c0de0e1a:	f881 032c 	strb.w	r0, [r1, #812]	@ 0x32c
c0de0e1e:	e061      	b.n	c0de0ee4 <handle_apdu+0x2c6>
c0de0e20:	982d      	ldr	r0, [sp, #180]	@ 0xb4
c0de0e22:	2100      	movs	r1, #0
c0de0e24:	f8ad 10b8 	strh.w	r1, [sp, #184]	@ 0xb8
c0de0e28:	f007 f9d2 	bl	c0de81d0 <try_context_set>
c0de0e2c:	2005      	movs	r0, #5
c0de0e2e:	f006 fef8 	bl	c0de7c22 <os_longjmp>
c0de0e32:	f646 1086 	movw	r0, #27014	@ 0x6986
c0de0e36:	f006 fef4 	bl	c0de7c22 <os_longjmp>
c0de0e3a:	f44f 40dc 	mov.w	r0, #28160	@ 0x6e00
c0de0e3e:	f006 fef0 	bl	c0de7c22 <os_longjmp>
c0de0e42:	2002      	movs	r0, #2
c0de0e44:	f006 feed 	bl	c0de7c22 <os_longjmp>
c0de0e48:	eb09 040c 	add.w	r4, r9, ip
c0de0e4c:	2220      	movs	r2, #32
c0de0e4e:	4620      	mov	r0, r4
c0de0e50:	4639      	mov	r1, r7
c0de0e52:	f007 fb2e 	bl	c0de84b2 <__aeabi_memcpy>
c0de0e56:	f104 0020 	add.w	r0, r4, #32
c0de0e5a:	a902      	add	r1, sp, #8
c0de0e5c:	2223      	movs	r2, #35	@ 0x23
c0de0e5e:	f007 fb28 	bl	c0de84b2 <__aeabi_memcpy>
c0de0e62:	f240 0008 	movw	r0, #8
c0de0e66:	f2c0 0000 	movt	r0, #0
c0de0e6a:	4448      	add	r0, r9
c0de0e6c:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0e70:	f007 fb1c 	bl	c0de84ac <__aeabi_memclr>
c0de0e74:	9900      	ldr	r1, [sp, #0]
c0de0e76:	2043      	movs	r0, #67	@ 0x43
c0de0e78:	6008      	str	r0, [r1, #0]
c0de0e7a:	e01f      	b.n	c0de0ebc <handle_apdu+0x29e>
c0de0e7c:	f248 0194 	movw	r1, #32916	@ 0x8094
c0de0e80:	eb09 0004 	add.w	r0, r9, r4
c0de0e84:	f2c0 0100 	movt	r1, #0
c0de0e88:	2405      	movs	r4, #5
c0de0e8a:	4479      	add	r1, pc
c0de0e8c:	4622      	mov	r2, r4
c0de0e8e:	f007 fb10 	bl	c0de84b2 <__aeabi_memcpy>
c0de0e92:	f240 0008 	movw	r0, #8
c0de0e96:	f2c0 0000 	movt	r0, #0
c0de0e9a:	4448      	add	r0, r9
c0de0e9c:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0ea0:	f007 fb04 	bl	c0de84ac <__aeabi_memclr>
c0de0ea4:	6034      	str	r4, [r6, #0]
c0de0ea6:	e009      	b.n	c0de0ebc <handle_apdu+0x29e>
c0de0ea8:	2101      	movs	r1, #1
c0de0eaa:	f809 1004 	strb.w	r1, [r9, r4]
c0de0eae:	eb09 0004 	add.w	r0, r9, r4
c0de0eb2:	2102      	movs	r1, #2
c0de0eb4:	7041      	strb	r1, [r0, #1]
c0de0eb6:	7081      	strb	r1, [r0, #2]
c0de0eb8:	2003      	movs	r0, #3
c0de0eba:	6030      	str	r0, [r6, #0]
c0de0ebc:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de0ec0:	f006 feaf 	bl	c0de7c22 <os_longjmp>
c0de0ec4:	f44f 40da 	mov.w	r0, #27904	@ 0x6d00
c0de0ec8:	f006 feab 	bl	c0de7c22 <os_longjmp>
c0de0ecc:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de0ed0:	f006 fea7 	bl	c0de7c22 <os_longjmp>
c0de0ed4:	4648      	mov	r0, r9
c0de0ed6:	eb09 0008 	add.w	r0, r9, r8
c0de0eda:	f8d0 13bc 	ldr.w	r1, [r0, #956]	@ 0x3bc
c0de0ede:	3101      	adds	r1, #1
c0de0ee0:	f8c0 13bc 	str.w	r1, [r0, #956]	@ 0x3bc
c0de0ee4:	eb09 0508 	add.w	r5, r9, r8
c0de0ee8:	2000      	movs	r0, #0
c0de0eea:	f8c5 03b8 	str.w	r0, [r5, #952]	@ 0x3b8
c0de0eee:	f7ff fded 	bl	c0de0acc <make_allowed_sign_steps>
c0de0ef2:	f895 039a 	ldrb.w	r0, [r5, #922]	@ 0x39a
c0de0ef6:	2805      	cmp	r0, #5
c0de0ef8:	d1e0      	bne.n	c0de0ebc <handle_apdu+0x29e>
c0de0efa:	eb09 0508 	add.w	r5, r9, r8
c0de0efe:	f205 312d 	addw	r1, r5, #813	@ 0x32d
c0de0f02:	4628      	mov	r0, r5
c0de0f04:	464e      	mov	r6, r9
c0de0f06:	f7ff fbe5 	bl	c0de06d4 <stream_eddsa_sign_step5>
c0de0f0a:	2006      	movs	r0, #6
c0de0f0c:	f885 039a 	strb.w	r0, [r5, #922]	@ 0x39a
c0de0f10:	f44f 7148 	mov.w	r1, #800	@ 0x320
c0de0f14:	4628      	mov	r0, r5
c0de0f16:	f007 fac9 	bl	c0de84ac <__aeabi_memclr>
c0de0f1a:	f000 f844 	bl	c0de0fa6 <cx_blake2b_init>
c0de0f1e:	eb09 0004 	add.w	r0, r9, r4
c0de0f22:	7880      	ldrb	r0, [r0, #2]
c0de0f24:	2880      	cmp	r0, #128	@ 0x80
c0de0f26:	d10d      	bne.n	c0de0f44 <handle_apdu+0x326>
c0de0f28:	2001      	movs	r0, #1
c0de0f2a:	f004 f9db 	bl	c0de52e4 <make_allowed_ui_steps>
c0de0f2e:	4648      	mov	r0, r9
c0de0f30:	eb09 0008 	add.w	r0, r9, r8
c0de0f34:	f890 039a 	ldrb.w	r0, [r0, #922]	@ 0x39a
c0de0f38:	2808      	cmp	r0, #8
c0de0f3a:	d00d      	beq.n	c0de0f58 <handle_apdu+0x33a>
c0de0f3c:	f249 1002 	movw	r0, #37122	@ 0x9102
c0de0f40:	f006 fe6f 	bl	c0de7c22 <os_longjmp>
c0de0f44:	2000      	movs	r0, #0
c0de0f46:	f004 f9cd 	bl	c0de52e4 <make_allowed_ui_steps>
c0de0f4a:	4648      	mov	r0, r9
c0de0f4c:	eb09 0008 	add.w	r0, r9, r8
c0de0f50:	f890 039a 	ldrb.w	r0, [r0, #922]	@ 0x39a
c0de0f54:	2808      	cmp	r0, #8
c0de0f56:	d1b1      	bne.n	c0de0ebc <handle_apdu+0x29e>
c0de0f58:	eb09 0008 	add.w	r0, r9, r8
c0de0f5c:	212d      	movs	r1, #45	@ 0x2d
c0de0f5e:	f200 306d 	addw	r0, r0, #877	@ 0x36d
c0de0f62:	9110      	str	r1, [sp, #64]	@ 0x40
c0de0f64:	a910      	add	r1, sp, #64	@ 0x40
c0de0f66:	2320      	movs	r3, #32
c0de0f68:	4602      	mov	r2, r0
c0de0f6a:	f7ff f8d1 	bl	c0de0110 <b58enc>
c0de0f6e:	b178      	cbz	r0, c0de0f90 <handle_apdu+0x372>
c0de0f70:	eb09 0408 	add.w	r4, r9, r8
c0de0f74:	f894 132c 	ldrb.w	r1, [r4, #812]	@ 0x32c
c0de0f78:	f104 00ac 	add.w	r0, r4, #172	@ 0xac
c0de0f7c:	4602      	mov	r2, r0
c0de0f7e:	f7ff fc44 	bl	c0de080a <waves_public_key_to_address>
c0de0f82:	f8d4 0328 	ldr.w	r0, [r4, #808]	@ 0x328
c0de0f86:	2802      	cmp	r0, #2
c0de0f88:	d106      	bne.n	c0de0f98 <handle_apdu+0x37a>
c0de0f8a:	f004 fbcb 	bl	c0de5724 <show_sign_protobuf_ui>
c0de0f8e:	e005      	b.n	c0de0f9c <handle_apdu+0x37e>
c0de0f90:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de0f94:	f006 fe45 	bl	c0de7c22 <os_longjmp>
c0de0f98:	f004 fb95 	bl	c0de56c6 <show_sign_ui>
c0de0f9c:	6838      	ldr	r0, [r7, #0]
c0de0f9e:	f040 0010 	orr.w	r0, r0, #16
c0de0fa2:	6038      	str	r0, [r7, #0]
c0de0fa4:	e78a      	b.n	c0de0ebc <handle_apdu+0x29e>

c0de0fa6 <cx_blake2b_init>:
c0de0fa6:	b580      	push	{r7, lr}
c0de0fa8:	f240 0008 	movw	r0, #8
c0de0fac:	f2c0 0000 	movt	r0, #0
c0de0fb0:	4448      	add	r0, r9
c0de0fb2:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de0fb6:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de0fba:	f006 fdf2 	bl	c0de7ba2 <cx_blake2b_init_no_throw>
c0de0fbe:	b900      	cbnz	r0, c0de0fc2 <cx_blake2b_init+0x1c>
c0de0fc0:	bd80      	pop	{r7, pc}
c0de0fc2:	f006 fe2e 	bl	c0de7c22 <os_longjmp>

c0de0fc6 <init_context>:
c0de0fc6:	b580      	push	{r7, lr}
c0de0fc8:	f240 0008 	movw	r0, #8
c0de0fcc:	f2c0 0000 	movt	r0, #0
c0de0fd0:	4448      	add	r0, r9
c0de0fd2:	f44f 7170 	mov.w	r1, #960	@ 0x3c0
c0de0fd6:	f007 fa69 	bl	c0de84ac <__aeabi_memclr>
c0de0fda:	bd80      	pop	{r7, pc}

c0de0fdc <io_event>:
c0de0fdc:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0fde:	b081      	sub	sp, #4
c0de0fe0:	f240 35c8 	movw	r5, #968	@ 0x3c8
c0de0fe4:	f2c0 0500 	movt	r5, #0
c0de0fe8:	f819 0005 	ldrb.w	r0, [r9, r5]
c0de0fec:	280c      	cmp	r0, #12
c0de0fee:	dc05      	bgt.n	c0de0ffc <io_event+0x20>
c0de0ff0:	2805      	cmp	r0, #5
c0de0ff2:	d079      	beq.n	c0de10e8 <io_event+0x10c>
c0de0ff4:	280c      	cmp	r0, #12
c0de0ff6:	f000 83a5 	beq.w	c0de1744 <io_event+0x768>
c0de0ffa:	e163      	b.n	c0de12c4 <io_event+0x2e8>
c0de0ffc:	280d      	cmp	r0, #13
c0de0ffe:	f000 80ea 	beq.w	c0de11d6 <io_event+0x1fa>
c0de1002:	280e      	cmp	r0, #14
c0de1004:	f040 815e 	bne.w	c0de12c4 <io_event+0x2e8>
c0de1008:	f240 56f4 	movw	r6, #1524	@ 0x5f4
c0de100c:	f2c0 0600 	movt	r6, #0
c0de1010:	2001      	movs	r0, #1
c0de1012:	eb09 0506 	add.w	r5, r9, r6
c0de1016:	f809 0006 	strb.w	r0, [r9, r6]
c0de101a:	2700      	movs	r7, #0
c0de101c:	4628      	mov	r0, r5
c0de101e:	606f      	str	r7, [r5, #4]
c0de1020:	f007 f863 	bl	c0de80ea <os_ux>
c0de1024:	2007      	movs	r0, #7
c0de1026:	f007 f8e1 	bl	c0de81ec <os_sched_last_status>
c0de102a:	6068      	str	r0, [r5, #4]
c0de102c:	f240 45d8 	movw	r5, #1240	@ 0x4d8
c0de1030:	2869      	cmp	r0, #105	@ 0x69
c0de1032:	f2c0 0500 	movt	r5, #0
c0de1036:	f040 81b5 	bne.w	c0de13a4 <io_event+0x3c8>
c0de103a:	f004 fd2a 	bl	c0de5a92 <io_seph_ux_init_button>
c0de103e:	eb09 0405 	add.w	r4, r9, r5
c0de1042:	2007      	movs	r0, #7
c0de1044:	f8a4 70ca 	strh.w	r7, [r4, #202]	@ 0xca
c0de1048:	f007 f8d0 	bl	c0de81ec <os_sched_last_status>
c0de104c:	f8d4 10cc 	ldr.w	r1, [r4, #204]	@ 0xcc
c0de1050:	eb09 0206 	add.w	r2, r9, r6
c0de1054:	2900      	cmp	r1, #0
c0de1056:	6050      	str	r0, [r2, #4]
c0de1058:	f000 8374 	beq.w	c0de1744 <io_event+0x768>
c0de105c:	2800      	cmp	r0, #0
c0de105e:	f000 8371 	beq.w	c0de1744 <io_event+0x768>
c0de1062:	2897      	cmp	r0, #151	@ 0x97
c0de1064:	f000 836e 	beq.w	c0de1744 <io_event+0x768>
c0de1068:	eb09 0005 	add.w	r0, r9, r5
c0de106c:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de1070:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de1074:	4281      	cmp	r1, r0
c0de1076:	f080 8365 	bcs.w	c0de1744 <io_event+0x768>
c0de107a:	f006 fff1 	bl	c0de8060 <os_perso_isonboarded>
c0de107e:	28aa      	cmp	r0, #170	@ 0xaa
c0de1080:	d104      	bne.n	c0de108c <io_event+0xb0>
c0de1082:	f007 f827 	bl	c0de80d4 <os_global_pin_is_validated>
c0de1086:	28aa      	cmp	r0, #170	@ 0xaa
c0de1088:	f040 835c 	bne.w	c0de1744 <io_event+0x768>
c0de108c:	eb09 0105 	add.w	r1, r9, r5
c0de1090:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1094:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de1098:	4288      	cmp	r0, r1
c0de109a:	f080 834e 	bcs.w	c0de173a <io_event+0x75e>
c0de109e:	b281      	uxth	r1, r0
c0de10a0:	eb09 0005 	add.w	r0, r9, r5
c0de10a4:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de10a8:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de10ac:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de10b0:	b13b      	cbz	r3, c0de10c2 <io_event+0xe6>
c0de10b2:	4798      	blx	r3
c0de10b4:	b158      	cbz	r0, c0de10ce <io_event+0xf2>
c0de10b6:	eb09 0105 	add.w	r1, r9, r5
c0de10ba:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de10be:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de10c2:	2801      	cmp	r0, #1
c0de10c4:	bf08      	it	eq
c0de10c6:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de10ca:	f004 fd3c 	bl	c0de5b46 <io_seph_ux_display_bagl_element>
c0de10ce:	eb09 0205 	add.w	r2, r9, r5
c0de10d2:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de10d6:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de10da:	3001      	adds	r0, #1
c0de10dc:	b283      	uxth	r3, r0
c0de10de:	428b      	cmp	r3, r1
c0de10e0:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de10e4:	d3db      	bcc.n	c0de109e <io_event+0xc2>
c0de10e6:	e328      	b.n	c0de173a <io_event+0x75e>
c0de10e8:	f240 56f4 	movw	r6, #1524	@ 0x5f4
c0de10ec:	f2c0 0600 	movt	r6, #0
c0de10f0:	2001      	movs	r0, #1
c0de10f2:	f809 0006 	strb.w	r0, [r9, r6]
c0de10f6:	eb09 0406 	add.w	r4, r9, r6
c0de10fa:	2000      	movs	r0, #0
c0de10fc:	6060      	str	r0, [r4, #4]
c0de10fe:	4620      	mov	r0, r4
c0de1100:	f006 fff3 	bl	c0de80ea <os_ux>
c0de1104:	2007      	movs	r0, #7
c0de1106:	f007 f871 	bl	c0de81ec <os_sched_last_status>
c0de110a:	2800      	cmp	r0, #0
c0de110c:	6060      	str	r0, [r4, #4]
c0de110e:	f000 8319 	beq.w	c0de1744 <io_event+0x768>
c0de1112:	2897      	cmp	r0, #151	@ 0x97
c0de1114:	f000 8316 	beq.w	c0de1744 <io_event+0x768>
c0de1118:	2869      	cmp	r0, #105	@ 0x69
c0de111a:	f040 81b6 	bne.w	c0de148a <io_event+0x4ae>
c0de111e:	f004 fcb8 	bl	c0de5a92 <io_seph_ux_init_button>
c0de1122:	f240 44d8 	movw	r4, #1240	@ 0x4d8
c0de1126:	f2c0 0400 	movt	r4, #0
c0de112a:	eb09 0504 	add.w	r5, r9, r4
c0de112e:	2000      	movs	r0, #0
c0de1130:	f8a5 00ca 	strh.w	r0, [r5, #202]	@ 0xca
c0de1134:	2007      	movs	r0, #7
c0de1136:	f007 f859 	bl	c0de81ec <os_sched_last_status>
c0de113a:	f8d5 10cc 	ldr.w	r1, [r5, #204]	@ 0xcc
c0de113e:	eb09 0206 	add.w	r2, r9, r6
c0de1142:	2900      	cmp	r1, #0
c0de1144:	6050      	str	r0, [r2, #4]
c0de1146:	f000 82fd 	beq.w	c0de1744 <io_event+0x768>
c0de114a:	2800      	cmp	r0, #0
c0de114c:	f000 82fa 	beq.w	c0de1744 <io_event+0x768>
c0de1150:	2897      	cmp	r0, #151	@ 0x97
c0de1152:	f000 82f7 	beq.w	c0de1744 <io_event+0x768>
c0de1156:	eb09 0004 	add.w	r0, r9, r4
c0de115a:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de115e:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de1162:	4281      	cmp	r1, r0
c0de1164:	f080 82ee 	bcs.w	c0de1744 <io_event+0x768>
c0de1168:	f006 ff7a 	bl	c0de8060 <os_perso_isonboarded>
c0de116c:	28aa      	cmp	r0, #170	@ 0xaa
c0de116e:	d104      	bne.n	c0de117a <io_event+0x19e>
c0de1170:	f006 ffb0 	bl	c0de80d4 <os_global_pin_is_validated>
c0de1174:	28aa      	cmp	r0, #170	@ 0xaa
c0de1176:	f040 82e5 	bne.w	c0de1744 <io_event+0x768>
c0de117a:	eb09 0104 	add.w	r1, r9, r4
c0de117e:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1182:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de1186:	4288      	cmp	r0, r1
c0de1188:	f080 82d7 	bcs.w	c0de173a <io_event+0x75e>
c0de118c:	b281      	uxth	r1, r0
c0de118e:	eb09 0004 	add.w	r0, r9, r4
c0de1192:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de1196:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de119a:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de119e:	b13b      	cbz	r3, c0de11b0 <io_event+0x1d4>
c0de11a0:	4798      	blx	r3
c0de11a2:	b158      	cbz	r0, c0de11bc <io_event+0x1e0>
c0de11a4:	eb09 0104 	add.w	r1, r9, r4
c0de11a8:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de11ac:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de11b0:	2801      	cmp	r0, #1
c0de11b2:	bf08      	it	eq
c0de11b4:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de11b8:	f004 fcc5 	bl	c0de5b46 <io_seph_ux_display_bagl_element>
c0de11bc:	eb09 0204 	add.w	r2, r9, r4
c0de11c0:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de11c4:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de11c8:	3001      	adds	r0, #1
c0de11ca:	b283      	uxth	r3, r0
c0de11cc:	428b      	cmp	r3, r1
c0de11ce:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de11d2:	d3db      	bcc.n	c0de118c <io_event+0x1b0>
c0de11d4:	e2b1      	b.n	c0de173a <io_event+0x75e>
c0de11d6:	f240 55f4 	movw	r5, #1524	@ 0x5f4
c0de11da:	f2c0 0500 	movt	r5, #0
c0de11de:	2001      	movs	r0, #1
c0de11e0:	f809 0005 	strb.w	r0, [r9, r5]
c0de11e4:	eb09 0405 	add.w	r4, r9, r5
c0de11e8:	2000      	movs	r0, #0
c0de11ea:	6060      	str	r0, [r4, #4]
c0de11ec:	4620      	mov	r0, r4
c0de11ee:	f006 ff7c 	bl	c0de80ea <os_ux>
c0de11f2:	2007      	movs	r0, #7
c0de11f4:	f006 fffa 	bl	c0de81ec <os_sched_last_status>
c0de11f8:	2800      	cmp	r0, #0
c0de11fa:	6060      	str	r0, [r4, #4]
c0de11fc:	f000 82a2 	beq.w	c0de1744 <io_event+0x768>
c0de1200:	2897      	cmp	r0, #151	@ 0x97
c0de1202:	f000 829f 	beq.w	c0de1744 <io_event+0x768>
c0de1206:	2869      	cmp	r0, #105	@ 0x69
c0de1208:	f040 8195 	bne.w	c0de1536 <io_event+0x55a>
c0de120c:	f004 fc41 	bl	c0de5a92 <io_seph_ux_init_button>
c0de1210:	f240 44d8 	movw	r4, #1240	@ 0x4d8
c0de1214:	f2c0 0400 	movt	r4, #0
c0de1218:	eb09 0604 	add.w	r6, r9, r4
c0de121c:	2000      	movs	r0, #0
c0de121e:	f8a6 00ca 	strh.w	r0, [r6, #202]	@ 0xca
c0de1222:	2007      	movs	r0, #7
c0de1224:	f006 ffe2 	bl	c0de81ec <os_sched_last_status>
c0de1228:	f8d6 10cc 	ldr.w	r1, [r6, #204]	@ 0xcc
c0de122c:	eb09 0205 	add.w	r2, r9, r5
c0de1230:	2900      	cmp	r1, #0
c0de1232:	6050      	str	r0, [r2, #4]
c0de1234:	f000 8286 	beq.w	c0de1744 <io_event+0x768>
c0de1238:	2800      	cmp	r0, #0
c0de123a:	f000 8283 	beq.w	c0de1744 <io_event+0x768>
c0de123e:	2897      	cmp	r0, #151	@ 0x97
c0de1240:	f000 8280 	beq.w	c0de1744 <io_event+0x768>
c0de1244:	eb09 0004 	add.w	r0, r9, r4
c0de1248:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de124c:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de1250:	4281      	cmp	r1, r0
c0de1252:	f080 8277 	bcs.w	c0de1744 <io_event+0x768>
c0de1256:	f006 ff03 	bl	c0de8060 <os_perso_isonboarded>
c0de125a:	28aa      	cmp	r0, #170	@ 0xaa
c0de125c:	d104      	bne.n	c0de1268 <io_event+0x28c>
c0de125e:	f006 ff39 	bl	c0de80d4 <os_global_pin_is_validated>
c0de1262:	28aa      	cmp	r0, #170	@ 0xaa
c0de1264:	f040 826e 	bne.w	c0de1744 <io_event+0x768>
c0de1268:	eb09 0104 	add.w	r1, r9, r4
c0de126c:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1270:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de1274:	4288      	cmp	r0, r1
c0de1276:	f080 8260 	bcs.w	c0de173a <io_event+0x75e>
c0de127a:	b281      	uxth	r1, r0
c0de127c:	eb09 0004 	add.w	r0, r9, r4
c0de1280:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de1284:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de1288:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de128c:	b13b      	cbz	r3, c0de129e <io_event+0x2c2>
c0de128e:	4798      	blx	r3
c0de1290:	b158      	cbz	r0, c0de12aa <io_event+0x2ce>
c0de1292:	eb09 0104 	add.w	r1, r9, r4
c0de1296:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de129a:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de129e:	2801      	cmp	r0, #1
c0de12a0:	bf08      	it	eq
c0de12a2:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de12a6:	f004 fc4e 	bl	c0de5b46 <io_seph_ux_display_bagl_element>
c0de12aa:	eb09 0204 	add.w	r2, r9, r4
c0de12ae:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de12b2:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de12b6:	3001      	adds	r0, #1
c0de12b8:	b283      	uxth	r3, r0
c0de12ba:	428b      	cmp	r3, r1
c0de12bc:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de12c0:	d3db      	bcc.n	c0de127a <io_event+0x29e>
c0de12c2:	e23a      	b.n	c0de173a <io_event+0x75e>
c0de12c4:	f240 55f4 	movw	r5, #1524	@ 0x5f4
c0de12c8:	f2c0 0500 	movt	r5, #0
c0de12cc:	2001      	movs	r0, #1
c0de12ce:	eb09 0405 	add.w	r4, r9, r5
c0de12d2:	f809 0005 	strb.w	r0, [r9, r5]
c0de12d6:	2600      	movs	r6, #0
c0de12d8:	4620      	mov	r0, r4
c0de12da:	6066      	str	r6, [r4, #4]
c0de12dc:	f006 ff05 	bl	c0de80ea <os_ux>
c0de12e0:	2007      	movs	r0, #7
c0de12e2:	f006 ff83 	bl	c0de81ec <os_sched_last_status>
c0de12e6:	2869      	cmp	r0, #105	@ 0x69
c0de12e8:	6060      	str	r0, [r4, #4]
c0de12ea:	f040 8083 	bne.w	c0de13f4 <io_event+0x418>
c0de12ee:	f004 fbd0 	bl	c0de5a92 <io_seph_ux_init_button>
c0de12f2:	f240 44d8 	movw	r4, #1240	@ 0x4d8
c0de12f6:	f2c0 0400 	movt	r4, #0
c0de12fa:	eb09 0704 	add.w	r7, r9, r4
c0de12fe:	2007      	movs	r0, #7
c0de1300:	f8a7 60ca 	strh.w	r6, [r7, #202]	@ 0xca
c0de1304:	f006 ff72 	bl	c0de81ec <os_sched_last_status>
c0de1308:	f8d7 10cc 	ldr.w	r1, [r7, #204]	@ 0xcc
c0de130c:	eb09 0205 	add.w	r2, r9, r5
c0de1310:	2900      	cmp	r1, #0
c0de1312:	6050      	str	r0, [r2, #4]
c0de1314:	f000 8216 	beq.w	c0de1744 <io_event+0x768>
c0de1318:	2800      	cmp	r0, #0
c0de131a:	f000 8213 	beq.w	c0de1744 <io_event+0x768>
c0de131e:	2897      	cmp	r0, #151	@ 0x97
c0de1320:	f000 8210 	beq.w	c0de1744 <io_event+0x768>
c0de1324:	eb09 0004 	add.w	r0, r9, r4
c0de1328:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de132c:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de1330:	4281      	cmp	r1, r0
c0de1332:	f080 8207 	bcs.w	c0de1744 <io_event+0x768>
c0de1336:	f006 fe93 	bl	c0de8060 <os_perso_isonboarded>
c0de133a:	28aa      	cmp	r0, #170	@ 0xaa
c0de133c:	d104      	bne.n	c0de1348 <io_event+0x36c>
c0de133e:	f006 fec9 	bl	c0de80d4 <os_global_pin_is_validated>
c0de1342:	28aa      	cmp	r0, #170	@ 0xaa
c0de1344:	f040 81fe 	bne.w	c0de1744 <io_event+0x768>
c0de1348:	eb09 0104 	add.w	r1, r9, r4
c0de134c:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1350:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de1354:	4288      	cmp	r0, r1
c0de1356:	f080 81f0 	bcs.w	c0de173a <io_event+0x75e>
c0de135a:	b281      	uxth	r1, r0
c0de135c:	eb09 0004 	add.w	r0, r9, r4
c0de1360:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de1364:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de1368:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de136c:	b13b      	cbz	r3, c0de137e <io_event+0x3a2>
c0de136e:	4798      	blx	r3
c0de1370:	b158      	cbz	r0, c0de138a <io_event+0x3ae>
c0de1372:	eb09 0104 	add.w	r1, r9, r4
c0de1376:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de137a:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de137e:	2801      	cmp	r0, #1
c0de1380:	bf08      	it	eq
c0de1382:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1386:	f004 fbde 	bl	c0de5b46 <io_seph_ux_display_bagl_element>
c0de138a:	eb09 0204 	add.w	r2, r9, r4
c0de138e:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de1392:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de1396:	3001      	adds	r0, #1
c0de1398:	b283      	uxth	r3, r0
c0de139a:	428b      	cmp	r3, r1
c0de139c:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de13a0:	d3db      	bcc.n	c0de135a <io_event+0x37e>
c0de13a2:	e1ca      	b.n	c0de173a <io_event+0x75e>
c0de13a4:	4604      	mov	r4, r0
c0de13a6:	3897      	subs	r0, #151	@ 0x97
c0de13a8:	eb09 0205 	add.w	r2, r9, r5
c0de13ac:	bf18      	it	ne
c0de13ae:	2001      	movne	r0, #1
c0de13b0:	f8d2 20e4 	ldr.w	r2, [r2, #228]	@ 0xe4
c0de13b4:	2c00      	cmp	r4, #0
c0de13b6:	4621      	mov	r1, r4
c0de13b8:	bf18      	it	ne
c0de13ba:	2101      	movne	r1, #1
c0de13bc:	2a00      	cmp	r2, #0
c0de13be:	f000 8176 	beq.w	c0de16ae <io_event+0x6d2>
c0de13c2:	3a64      	subs	r2, #100	@ 0x64
c0de13c4:	eb09 0305 	add.w	r3, r9, r5
c0de13c8:	bf38      	it	cc
c0de13ca:	2200      	movcc	r2, #0
c0de13cc:	f8c3 20e4 	str.w	r2, [r3, #228]	@ 0xe4
c0de13d0:	f200 816d 	bhi.w	c0de16ae <io_event+0x6d2>
c0de13d4:	eb09 0205 	add.w	r2, r9, r5
c0de13d8:	f8d2 20e0 	ldr.w	r2, [r2, #224]	@ 0xe0
c0de13dc:	2a00      	cmp	r2, #0
c0de13de:	f000 80f5 	beq.w	c0de15cc <io_event+0x5f0>
c0de13e2:	eb09 0005 	add.w	r0, r9, r5
c0de13e6:	f8d0 10e8 	ldr.w	r1, [r0, #232]	@ 0xe8
c0de13ea:	f8c0 10e4 	str.w	r1, [r0, #228]	@ 0xe4
c0de13ee:	2000      	movs	r0, #0
c0de13f0:	4790      	blx	r2
c0de13f2:	e15c      	b.n	c0de16ae <io_event+0x6d2>
c0de13f4:	f240 44d8 	movw	r4, #1240	@ 0x4d8
c0de13f8:	f2c0 0400 	movt	r4, #0
c0de13fc:	eb09 0004 	add.w	r0, r9, r4
c0de1400:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de1404:	2800      	cmp	r0, #0
c0de1406:	f000 819d 	beq.w	c0de1744 <io_event+0x768>
c0de140a:	eb09 0004 	add.w	r0, r9, r4
c0de140e:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de1412:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de1416:	4281      	cmp	r1, r0
c0de1418:	f080 8194 	bcs.w	c0de1744 <io_event+0x768>
c0de141c:	f006 fe20 	bl	c0de8060 <os_perso_isonboarded>
c0de1420:	28aa      	cmp	r0, #170	@ 0xaa
c0de1422:	d104      	bne.n	c0de142e <io_event+0x452>
c0de1424:	f006 fe56 	bl	c0de80d4 <os_global_pin_is_validated>
c0de1428:	28aa      	cmp	r0, #170	@ 0xaa
c0de142a:	f040 818b 	bne.w	c0de1744 <io_event+0x768>
c0de142e:	eb09 0104 	add.w	r1, r9, r4
c0de1432:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1436:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de143a:	4288      	cmp	r0, r1
c0de143c:	f080 817d 	bcs.w	c0de173a <io_event+0x75e>
c0de1440:	b281      	uxth	r1, r0
c0de1442:	eb09 0004 	add.w	r0, r9, r4
c0de1446:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de144a:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de144e:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1452:	b13b      	cbz	r3, c0de1464 <io_event+0x488>
c0de1454:	4798      	blx	r3
c0de1456:	b158      	cbz	r0, c0de1470 <io_event+0x494>
c0de1458:	eb09 0104 	add.w	r1, r9, r4
c0de145c:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de1460:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de1464:	2801      	cmp	r0, #1
c0de1466:	bf08      	it	eq
c0de1468:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de146c:	f004 fb6b 	bl	c0de5b46 <io_seph_ux_display_bagl_element>
c0de1470:	eb09 0204 	add.w	r2, r9, r4
c0de1474:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de1478:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de147c:	3001      	adds	r0, #1
c0de147e:	b283      	uxth	r3, r0
c0de1480:	428b      	cmp	r3, r1
c0de1482:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de1486:	d3db      	bcc.n	c0de1440 <io_event+0x464>
c0de1488:	e157      	b.n	c0de173a <io_event+0x75e>
c0de148a:	f240 44d8 	movw	r4, #1240	@ 0x4d8
c0de148e:	f2c0 0400 	movt	r4, #0
c0de1492:	eb09 0004 	add.w	r0, r9, r4
c0de1496:	f8d0 00dc 	ldr.w	r0, [r0, #220]	@ 0xdc
c0de149a:	b128      	cbz	r0, c0de14a8 <io_event+0x4cc>
c0de149c:	eb09 0105 	add.w	r1, r9, r5
c0de14a0:	78c9      	ldrb	r1, [r1, #3]
c0de14a2:	0849      	lsrs	r1, r1, #1
c0de14a4:	f004 fb8d 	bl	c0de5bc2 <io_seproxyhal_button_push>
c0de14a8:	eb09 0004 	add.w	r0, r9, r4
c0de14ac:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de14b0:	2800      	cmp	r0, #0
c0de14b2:	f000 8147 	beq.w	c0de1744 <io_event+0x768>
c0de14b6:	eb09 0004 	add.w	r0, r9, r4
c0de14ba:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de14be:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de14c2:	4281      	cmp	r1, r0
c0de14c4:	f080 813e 	bcs.w	c0de1744 <io_event+0x768>
c0de14c8:	f006 fdca 	bl	c0de8060 <os_perso_isonboarded>
c0de14cc:	28aa      	cmp	r0, #170	@ 0xaa
c0de14ce:	d104      	bne.n	c0de14da <io_event+0x4fe>
c0de14d0:	f006 fe00 	bl	c0de80d4 <os_global_pin_is_validated>
c0de14d4:	28aa      	cmp	r0, #170	@ 0xaa
c0de14d6:	f040 8135 	bne.w	c0de1744 <io_event+0x768>
c0de14da:	eb09 0104 	add.w	r1, r9, r4
c0de14de:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de14e2:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de14e6:	4288      	cmp	r0, r1
c0de14e8:	f080 8127 	bcs.w	c0de173a <io_event+0x75e>
c0de14ec:	b281      	uxth	r1, r0
c0de14ee:	eb09 0004 	add.w	r0, r9, r4
c0de14f2:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de14f6:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de14fa:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de14fe:	b13b      	cbz	r3, c0de1510 <io_event+0x534>
c0de1500:	4798      	blx	r3
c0de1502:	b158      	cbz	r0, c0de151c <io_event+0x540>
c0de1504:	eb09 0104 	add.w	r1, r9, r4
c0de1508:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de150c:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de1510:	2801      	cmp	r0, #1
c0de1512:	bf08      	it	eq
c0de1514:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1518:	f004 fb15 	bl	c0de5b46 <io_seph_ux_display_bagl_element>
c0de151c:	eb09 0204 	add.w	r2, r9, r4
c0de1520:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de1524:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de1528:	3001      	adds	r0, #1
c0de152a:	b283      	uxth	r3, r0
c0de152c:	428b      	cmp	r3, r1
c0de152e:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de1532:	d3db      	bcc.n	c0de14ec <io_event+0x510>
c0de1534:	e101      	b.n	c0de173a <io_event+0x75e>
c0de1536:	f240 44d8 	movw	r4, #1240	@ 0x4d8
c0de153a:	f2c0 0400 	movt	r4, #0
c0de153e:	eb09 0004 	add.w	r0, r9, r4
c0de1542:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de1546:	2800      	cmp	r0, #0
c0de1548:	f000 80fc 	beq.w	c0de1744 <io_event+0x768>
c0de154c:	eb09 0004 	add.w	r0, r9, r4
c0de1550:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de1554:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de1558:	4281      	cmp	r1, r0
c0de155a:	f080 80f3 	bcs.w	c0de1744 <io_event+0x768>
c0de155e:	f006 fd7f 	bl	c0de8060 <os_perso_isonboarded>
c0de1562:	28aa      	cmp	r0, #170	@ 0xaa
c0de1564:	d104      	bne.n	c0de1570 <io_event+0x594>
c0de1566:	f006 fdb5 	bl	c0de80d4 <os_global_pin_is_validated>
c0de156a:	28aa      	cmp	r0, #170	@ 0xaa
c0de156c:	f040 80ea 	bne.w	c0de1744 <io_event+0x768>
c0de1570:	eb09 0104 	add.w	r1, r9, r4
c0de1574:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1578:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de157c:	4288      	cmp	r0, r1
c0de157e:	f080 80dc 	bcs.w	c0de173a <io_event+0x75e>
c0de1582:	b281      	uxth	r1, r0
c0de1584:	eb09 0004 	add.w	r0, r9, r4
c0de1588:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de158c:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de1590:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1594:	b13b      	cbz	r3, c0de15a6 <io_event+0x5ca>
c0de1596:	4798      	blx	r3
c0de1598:	b158      	cbz	r0, c0de15b2 <io_event+0x5d6>
c0de159a:	eb09 0104 	add.w	r1, r9, r4
c0de159e:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de15a2:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de15a6:	2801      	cmp	r0, #1
c0de15a8:	bf08      	it	eq
c0de15aa:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de15ae:	f004 faca 	bl	c0de5b46 <io_seph_ux_display_bagl_element>
c0de15b2:	eb09 0204 	add.w	r2, r9, r4
c0de15b6:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de15ba:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de15be:	3001      	adds	r0, #1
c0de15c0:	b283      	uxth	r3, r0
c0de15c2:	428b      	cmp	r3, r1
c0de15c4:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de15c8:	d3db      	bcc.n	c0de1582 <io_event+0x5a6>
c0de15ca:	e0b6      	b.n	c0de173a <io_event+0x75e>
c0de15cc:	f240 52ec 	movw	r2, #1516	@ 0x5ec
c0de15d0:	f2c0 0200 	movt	r2, #0
c0de15d4:	f859 2002 	ldr.w	r2, [r9, r2]
c0de15d8:	4008      	ands	r0, r1
c0de15da:	4611      	mov	r1, r2
c0de15dc:	2a00      	cmp	r2, #0
c0de15de:	bf18      	it	ne
c0de15e0:	2101      	movne	r1, #1
c0de15e2:	4008      	ands	r0, r1
c0de15e4:	2801      	cmp	r0, #1
c0de15e6:	d162      	bne.n	c0de16ae <io_event+0x6d2>
c0de15e8:	f240 50e8 	movw	r0, #1512	@ 0x5e8
c0de15ec:	f2c0 0000 	movt	r0, #0
c0de15f0:	f859 1000 	ldr.w	r1, [r9, r0]
c0de15f4:	3101      	adds	r1, #1
c0de15f6:	fb91 f3f2 	sdiv	r3, r1, r2
c0de15fa:	fb03 1112 	mls	r1, r3, r2, r1
c0de15fe:	f849 1000 	str.w	r1, [r9, r0]
c0de1602:	f004 fa46 	bl	c0de5a92 <io_seph_ux_init_button>
c0de1606:	eb09 0705 	add.w	r7, r9, r5
c0de160a:	2000      	movs	r0, #0
c0de160c:	f8a7 00ca 	strh.w	r0, [r7, #202]	@ 0xca
c0de1610:	2007      	movs	r0, #7
c0de1612:	f006 fdeb 	bl	c0de81ec <os_sched_last_status>
c0de1616:	f8d7 10cc 	ldr.w	r1, [r7, #204]	@ 0xcc
c0de161a:	eb09 0206 	add.w	r2, r9, r6
c0de161e:	2900      	cmp	r1, #0
c0de1620:	6050      	str	r0, [r2, #4]
c0de1622:	d044      	beq.n	c0de16ae <io_event+0x6d2>
c0de1624:	2800      	cmp	r0, #0
c0de1626:	d042      	beq.n	c0de16ae <io_event+0x6d2>
c0de1628:	2897      	cmp	r0, #151	@ 0x97
c0de162a:	d040      	beq.n	c0de16ae <io_event+0x6d2>
c0de162c:	eb09 0005 	add.w	r0, r9, r5
c0de1630:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de1634:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de1638:	4281      	cmp	r1, r0
c0de163a:	d238      	bcs.n	c0de16ae <io_event+0x6d2>
c0de163c:	f006 fd10 	bl	c0de8060 <os_perso_isonboarded>
c0de1640:	28aa      	cmp	r0, #170	@ 0xaa
c0de1642:	d103      	bne.n	c0de164c <io_event+0x670>
c0de1644:	f006 fd46 	bl	c0de80d4 <os_global_pin_is_validated>
c0de1648:	28aa      	cmp	r0, #170	@ 0xaa
c0de164a:	d130      	bne.n	c0de16ae <io_event+0x6d2>
c0de164c:	eb09 0105 	add.w	r1, r9, r5
c0de1650:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1654:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de1658:	4288      	cmp	r0, r1
c0de165a:	d223      	bcs.n	c0de16a4 <io_event+0x6c8>
c0de165c:	b281      	uxth	r1, r0
c0de165e:	eb09 0005 	add.w	r0, r9, r5
c0de1662:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de1666:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de166a:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de166e:	b13b      	cbz	r3, c0de1680 <io_event+0x6a4>
c0de1670:	4798      	blx	r3
c0de1672:	b158      	cbz	r0, c0de168c <io_event+0x6b0>
c0de1674:	eb09 0105 	add.w	r1, r9, r5
c0de1678:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de167c:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de1680:	2801      	cmp	r0, #1
c0de1682:	bf08      	it	eq
c0de1684:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1688:	f004 fa5d 	bl	c0de5b46 <io_seph_ux_display_bagl_element>
c0de168c:	eb09 0205 	add.w	r2, r9, r5
c0de1690:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de1694:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de1698:	3001      	adds	r0, #1
c0de169a:	b283      	uxth	r3, r0
c0de169c:	428b      	cmp	r3, r1
c0de169e:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de16a2:	d3db      	bcc.n	c0de165c <io_event+0x680>
c0de16a4:	b280      	uxth	r0, r0
c0de16a6:	4288      	cmp	r0, r1
c0de16a8:	d101      	bne.n	c0de16ae <io_event+0x6d2>
c0de16aa:	f006 fdad 	bl	c0de8208 <screen_update>
c0de16ae:	2c00      	cmp	r4, #0
c0de16b0:	d048      	beq.n	c0de1744 <io_event+0x768>
c0de16b2:	2c97      	cmp	r4, #151	@ 0x97
c0de16b4:	d046      	beq.n	c0de1744 <io_event+0x768>
c0de16b6:	eb09 0005 	add.w	r0, r9, r5
c0de16ba:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de16be:	2800      	cmp	r0, #0
c0de16c0:	d040      	beq.n	c0de1744 <io_event+0x768>
c0de16c2:	eb09 0005 	add.w	r0, r9, r5
c0de16c6:	f8b0 10ca 	ldrh.w	r1, [r0, #202]	@ 0xca
c0de16ca:	f890 00d0 	ldrb.w	r0, [r0, #208]	@ 0xd0
c0de16ce:	4281      	cmp	r1, r0
c0de16d0:	d238      	bcs.n	c0de1744 <io_event+0x768>
c0de16d2:	f006 fcc5 	bl	c0de8060 <os_perso_isonboarded>
c0de16d6:	28aa      	cmp	r0, #170	@ 0xaa
c0de16d8:	d103      	bne.n	c0de16e2 <io_event+0x706>
c0de16da:	f006 fcfb 	bl	c0de80d4 <os_global_pin_is_validated>
c0de16de:	28aa      	cmp	r0, #170	@ 0xaa
c0de16e0:	d130      	bne.n	c0de1744 <io_event+0x768>
c0de16e2:	eb09 0105 	add.w	r1, r9, r5
c0de16e6:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de16ea:	f891 10d0 	ldrb.w	r1, [r1, #208]	@ 0xd0
c0de16ee:	4288      	cmp	r0, r1
c0de16f0:	d223      	bcs.n	c0de173a <io_event+0x75e>
c0de16f2:	b281      	uxth	r1, r0
c0de16f4:	eb09 0005 	add.w	r0, r9, r5
c0de16f8:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de16fc:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de1700:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1704:	b13b      	cbz	r3, c0de1716 <io_event+0x73a>
c0de1706:	4798      	blx	r3
c0de1708:	b158      	cbz	r0, c0de1722 <io_event+0x746>
c0de170a:	eb09 0105 	add.w	r1, r9, r5
c0de170e:	f8d1 20cc 	ldr.w	r2, [r1, #204]	@ 0xcc
c0de1712:	f8b1 10ca 	ldrh.w	r1, [r1, #202]	@ 0xca
c0de1716:	2801      	cmp	r0, #1
c0de1718:	bf08      	it	eq
c0de171a:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de171e:	f004 fa12 	bl	c0de5b46 <io_seph_ux_display_bagl_element>
c0de1722:	eb09 0205 	add.w	r2, r9, r5
c0de1726:	f8b2 00ca 	ldrh.w	r0, [r2, #202]	@ 0xca
c0de172a:	f892 10d0 	ldrb.w	r1, [r2, #208]	@ 0xd0
c0de172e:	3001      	adds	r0, #1
c0de1730:	b283      	uxth	r3, r0
c0de1732:	428b      	cmp	r3, r1
c0de1734:	f8a2 00ca 	strh.w	r0, [r2, #202]	@ 0xca
c0de1738:	d3db      	bcc.n	c0de16f2 <io_event+0x716>
c0de173a:	b280      	uxth	r0, r0
c0de173c:	4288      	cmp	r0, r1
c0de173e:	bf08      	it	eq
c0de1740:	f006 fd62 	bleq	c0de8208 <screen_update>
c0de1744:	f004 fa79 	bl	c0de5c3a <io_seph_is_status_sent>
c0de1748:	b908      	cbnz	r0, c0de174e <io_event+0x772>
c0de174a:	f004 fa74 	bl	c0de5c36 <io_seproxyhal_general_status>
c0de174e:	2001      	movs	r0, #1
c0de1750:	b001      	add	sp, #4
c0de1752:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de1754 <app_exit>:
c0de1754:	b510      	push	{r4, lr}
c0de1756:	b08c      	sub	sp, #48	@ 0x30
c0de1758:	466c      	mov	r4, sp
c0de175a:	4620      	mov	r0, r4
c0de175c:	f006 fef8 	bl	c0de8550 <setjmp>
c0de1760:	0401      	lsls	r1, r0, #16
c0de1762:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0de1766:	d00b      	beq.n	c0de1780 <app_exit+0x2c>
c0de1768:	f006 fd28 	bl	c0de81bc <try_context_get>
c0de176c:	42a0      	cmp	r0, r4
c0de176e:	d102      	bne.n	c0de1776 <app_exit+0x22>
c0de1770:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de1772:	f006 fd2d 	bl	c0de81d0 <try_context_set>
c0de1776:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0de177a:	b940      	cbnz	r0, c0de178e <app_exit+0x3a>
c0de177c:	b00c      	add	sp, #48	@ 0x30
c0de177e:	bd10      	pop	{r4, pc}
c0de1780:	4668      	mov	r0, sp
c0de1782:	f006 fd25 	bl	c0de81d0 <try_context_set>
c0de1786:	900a      	str	r0, [sp, #40]	@ 0x28
c0de1788:	20ff      	movs	r0, #255	@ 0xff
c0de178a:	f006 fcdd 	bl	c0de8148 <os_sched_exit>
c0de178e:	f006 fa48 	bl	c0de7c22 <os_longjmp>
c0de1792:	d4d4      	bmi.n	c0de173e <io_event+0x762>

c0de1794 <waves_main>:
c0de1794:	b090      	sub	sp, #64	@ 0x40
c0de1796:	f240 41d8 	movw	r1, #1240	@ 0x4d8
c0de179a:	4648      	mov	r0, r9
c0de179c:	f2c0 0100 	movt	r1, #0
c0de17a0:	f240 6a14 	movw	sl, #1556	@ 0x614
c0de17a4:	2500      	movs	r5, #0
c0de17a6:	eb09 0001 	add.w	r0, r9, r1
c0de17aa:	f44f 71fa 	mov.w	r1, #500	@ 0x1f4
c0de17ae:	466c      	mov	r4, sp
c0de17b0:	f10d 0834 	add.w	r8, sp, #52	@ 0x34
c0de17b4:	ae0e      	add	r6, sp, #56	@ 0x38
c0de17b6:	f2c0 0a00 	movt	sl, #0
c0de17ba:	f04f 0b0d 	mov.w	fp, #13
c0de17be:	950f      	str	r5, [sp, #60]	@ 0x3c
c0de17c0:	950e      	str	r5, [sp, #56]	@ 0x38
c0de17c2:	950d      	str	r5, [sp, #52]	@ 0x34
c0de17c4:	f8c0 10e4 	str.w	r1, [r0, #228]	@ 0xe4
c0de17c8:	4620      	mov	r0, r4
c0de17ca:	f8ad 5032 	strh.w	r5, [sp, #50]	@ 0x32
c0de17ce:	f006 febf 	bl	c0de8550 <setjmp>
c0de17d2:	4607      	mov	r7, r0
c0de17d4:	b280      	uxth	r0, r0
c0de17d6:	f8ad 702c 	strh.w	r7, [sp, #44]	@ 0x2c
c0de17da:	b318      	cbz	r0, c0de1824 <waves_main+0x90>
c0de17dc:	2805      	cmp	r0, #5
c0de17de:	d044      	beq.n	c0de186a <waves_main+0xd6>
c0de17e0:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de17e2:	f8ad 502c 	strh.w	r5, [sp, #44]	@ 0x2c
c0de17e6:	f006 fcf3 	bl	c0de81d0 <try_context_set>
c0de17ea:	f407 4070 	and.w	r0, r7, #61440	@ 0xf000
c0de17ee:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de17f2:	d004      	beq.n	c0de17fe <waves_main+0x6a>
c0de17f4:	f5b0 4fc0 	cmp.w	r0, #24576	@ 0x6000
c0de17f8:	bf18      	it	ne
c0de17fa:	f36b 27df 	bfine	r7, fp, #11, #21
c0de17fe:	f8ad 7032 	strh.w	r7, [sp, #50]	@ 0x32
c0de1802:	f8bd 0032 	ldrh.w	r0, [sp, #50]	@ 0x32
c0de1806:	4649      	mov	r1, r9
c0de1808:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
c0de180a:	0a00      	lsrs	r0, r0, #8
c0de180c:	eb09 010a 	add.w	r1, r9, sl
c0de1810:	5488      	strb	r0, [r1, r2]
c0de1812:	f8bd 0032 	ldrh.w	r0, [sp, #50]	@ 0x32
c0de1816:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
c0de1818:	4411      	add	r1, r2
c0de181a:	7048      	strb	r0, [r1, #1]
c0de181c:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de181e:	3002      	adds	r0, #2
c0de1820:	900e      	str	r0, [sp, #56]	@ 0x38
c0de1822:	e015      	b.n	c0de1850 <waves_main+0xbc>
c0de1824:	4620      	mov	r0, r4
c0de1826:	f006 fcd3 	bl	c0de81d0 <try_context_set>
c0de182a:	900a      	str	r0, [sp, #40]	@ 0x28
c0de182c:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de182e:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de1830:	950e      	str	r5, [sp, #56]	@ 0x38
c0de1832:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de1834:	990f      	ldr	r1, [sp, #60]	@ 0x3c
c0de1836:	b2c0      	uxtb	r0, r0
c0de1838:	b289      	uxth	r1, r1
c0de183a:	f004 fa01 	bl	c0de5c40 <io_exchange>
c0de183e:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de1840:	950d      	str	r5, [sp, #52]	@ 0x34
c0de1842:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de1844:	b1d0      	cbz	r0, c0de187c <waves_main+0xe8>
c0de1846:	9a0f      	ldr	r2, [sp, #60]	@ 0x3c
c0de1848:	4640      	mov	r0, r8
c0de184a:	4631      	mov	r1, r6
c0de184c:	f7ff f9e7 	bl	c0de0c1e <handle_apdu>
c0de1850:	f006 fcb4 	bl	c0de81bc <try_context_get>
c0de1854:	42a0      	cmp	r0, r4
c0de1856:	d102      	bne.n	c0de185e <waves_main+0xca>
c0de1858:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de185a:	f006 fcb9 	bl	c0de81d0 <try_context_set>
c0de185e:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0de1862:	2800      	cmp	r0, #0
c0de1864:	d0b0      	beq.n	c0de17c8 <waves_main+0x34>
c0de1866:	f006 f9dc 	bl	c0de7c22 <os_longjmp>
c0de186a:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de186c:	2100      	movs	r1, #0
c0de186e:	f8ad 102c 	strh.w	r1, [sp, #44]	@ 0x2c
c0de1872:	f006 fcad 	bl	c0de81d0 <try_context_set>
c0de1876:	2005      	movs	r0, #5
c0de1878:	f006 f9d3 	bl	c0de7c22 <os_longjmp>
c0de187c:	f646 1082 	movw	r0, #27010	@ 0x6982
c0de1880:	f006 f9cf 	bl	c0de7c22 <os_longjmp>

c0de1884 <pb_field_iter_begin>:
c0de1884:	b570      	push	{r4, r5, r6, lr}
c0de1886:	460d      	mov	r5, r1
c0de1888:	2128      	movs	r1, #40	@ 0x28
c0de188a:	4614      	mov	r4, r2
c0de188c:	4606      	mov	r6, r0
c0de188e:	f006 fe0d 	bl	c0de84ac <__aeabi_memclr>
c0de1892:	4628      	mov	r0, r5
c0de1894:	f006 fb9c 	bl	c0de7fd0 <pic>
c0de1898:	6030      	str	r0, [r6, #0]
c0de189a:	4630      	mov	r0, r6
c0de189c:	6074      	str	r4, [r6, #4]
c0de189e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de18a2:	f000 b800 	b.w	c0de18a6 <load_descriptor_values>

c0de18a6 <load_descriptor_values>:
c0de18a6:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de18aa:	4604      	mov	r4, r0
c0de18ac:	6800      	ldr	r0, [r0, #0]
c0de18ae:	f8b4 8008 	ldrh.w	r8, [r4, #8]
c0de18b2:	7801      	ldrb	r1, [r0, #0]
c0de18b4:	7842      	ldrb	r2, [r0, #1]
c0de18b6:	ea41 2602 	orr.w	r6, r1, r2, lsl #8
c0de18ba:	45b0      	cmp	r8, r6
c0de18bc:	f080 80b7 	bcs.w	c0de1a2e <load_descriptor_values+0x188>
c0de18c0:	f006 fb86 	bl	c0de7fd0 <pic>
c0de18c4:	f810 1f02 	ldrb.w	r1, [r0, #2]!
c0de18c8:	7842      	ldrb	r2, [r0, #1]
c0de18ca:	7883      	ldrb	r3, [r0, #2]
c0de18cc:	78c0      	ldrb	r0, [r0, #3]
c0de18ce:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de18d2:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de18d6:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de18da:	f006 fb79 	bl	c0de7fd0 <pic>
c0de18de:	8961      	ldrh	r1, [r4, #10]
c0de18e0:	f850 7021 	ldr.w	r7, [r0, r1, lsl #2]
c0de18e4:	f007 0203 	and.w	r2, r7, #3
c0de18e8:	f3c7 0085 	ubfx	r0, r7, #2, #6
c0de18ec:	0a3b      	lsrs	r3, r7, #8
c0de18ee:	2a02      	cmp	r2, #2
c0de18f0:	8220      	strh	r0, [r4, #16]
c0de18f2:	75a3      	strb	r3, [r4, #22]
c0de18f4:	d00b      	beq.n	c0de190e <load_descriptor_values+0x68>
c0de18f6:	2a01      	cmp	r2, #1
c0de18f8:	d024      	beq.n	c0de1944 <load_descriptor_values+0x9e>
c0de18fa:	2a00      	cmp	r2, #0
c0de18fc:	d145      	bne.n	c0de198a <load_descriptor_values+0xe4>
c0de18fe:	2001      	movs	r0, #1
c0de1900:	82a0      	strh	r0, [r4, #20]
c0de1902:	f3c7 6103 	ubfx	r1, r7, #24, #4
c0de1906:	f3c7 4207 	ubfx	r2, r7, #16, #8
c0de190a:	0f3d      	lsrs	r5, r7, #28
c0de190c:	e054      	b.n	c0de19b8 <load_descriptor_values+0x112>
c0de190e:	6822      	ldr	r2, [r4, #0]
c0de1910:	f812 cf02 	ldrb.w	ip, [r2, #2]!
c0de1914:	7855      	ldrb	r5, [r2, #1]
c0de1916:	7893      	ldrb	r3, [r2, #2]
c0de1918:	78d2      	ldrb	r2, [r2, #3]
c0de191a:	ea4c 2505 	orr.w	r5, ip, r5, lsl #8
c0de191e:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de1922:	ea45 4202 	orr.w	r2, r5, r2, lsl #16
c0de1926:	eb02 0181 	add.w	r1, r2, r1, lsl #2
c0de192a:	e9d1 3201 	ldrd	r3, r2, [r1, #4]
c0de192e:	68cd      	ldr	r5, [r1, #12]
c0de1930:	0c39      	lsrs	r1, r7, #16
c0de1932:	82a1      	strh	r1, [r4, #20]
c0de1934:	f06f 013f 	mvn.w	r1, #63	@ 0x3f
c0de1938:	ea01 0193 	and.w	r1, r1, r3, lsr #2
c0de193c:	4408      	add	r0, r1
c0de193e:	8220      	strh	r0, [r4, #16]
c0de1940:	b2d9      	uxtb	r1, r3
c0de1942:	e039      	b.n	c0de19b8 <load_descriptor_values+0x112>
c0de1944:	6820      	ldr	r0, [r4, #0]
c0de1946:	f006 fb43 	bl	c0de7fd0 <pic>
c0de194a:	f810 1f02 	ldrb.w	r1, [r0, #2]!
c0de194e:	7842      	ldrb	r2, [r0, #1]
c0de1950:	7883      	ldrb	r3, [r0, #2]
c0de1952:	78c0      	ldrb	r0, [r0, #3]
c0de1954:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de1958:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de195c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de1960:	f006 fb36 	bl	c0de7fd0 <pic>
c0de1964:	8961      	ldrh	r1, [r4, #10]
c0de1966:	f06f 023f 	mvn.w	r2, #63	@ 0x3f
c0de196a:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de196e:	6840      	ldr	r0, [r0, #4]
c0de1970:	f3c7 410b 	ubfx	r1, r7, #16, #12
c0de1974:	82a1      	strh	r1, [r4, #20]
c0de1976:	8a21      	ldrh	r1, [r4, #16]
c0de1978:	ea02 5290 	and.w	r2, r2, r0, lsr #22
c0de197c:	4311      	orrs	r1, r2
c0de197e:	8221      	strh	r1, [r4, #16]
c0de1980:	0f39      	lsrs	r1, r7, #28
c0de1982:	b282      	uxth	r2, r0
c0de1984:	f3c0 450b 	ubfx	r5, r0, #16, #12
c0de1988:	e016      	b.n	c0de19b8 <load_descriptor_values+0x112>
c0de198a:	6822      	ldr	r2, [r4, #0]
c0de198c:	f812 3f02 	ldrb.w	r3, [r2, #2]!
c0de1990:	7857      	ldrb	r7, [r2, #1]
c0de1992:	7895      	ldrb	r5, [r2, #2]
c0de1994:	78d2      	ldrb	r2, [r2, #3]
c0de1996:	ea43 2307 	orr.w	r3, r3, r7, lsl #8
c0de199a:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de199e:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de19a2:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de19a6:	1d1f      	adds	r7, r3, #4
c0de19a8:	cfa6      	ldmia	r7, {r1, r2, r5, r7}
c0de19aa:	f06f 033f 	mvn.w	r3, #63	@ 0x3f
c0de19ae:	ea03 0391 	and.w	r3, r3, r1, lsr #2
c0de19b2:	4418      	add	r0, r3
c0de19b4:	82a7      	strh	r7, [r4, #20]
c0de19b6:	8220      	strh	r0, [r4, #16]
c0de19b8:	6863      	ldr	r3, [r4, #4]
c0de19ba:	8265      	strh	r5, [r4, #18]
c0de19bc:	1898      	adds	r0, r3, r2
c0de19be:	060a      	lsls	r2, r1, #24
c0de19c0:	61a0      	str	r0, [r4, #24]
c0de19c2:	d003      	beq.n	c0de19cc <load_descriptor_values+0x126>
c0de19c4:	b249      	sxtb	r1, r1
c0de19c6:	1a42      	subs	r2, r0, r1
c0de19c8:	7da1      	ldrb	r1, [r4, #22]
c0de19ca:	e00e      	b.n	c0de19ea <load_descriptor_values+0x144>
c0de19cc:	7da1      	ldrb	r1, [r4, #22]
c0de19ce:	f001 0230 	and.w	r2, r1, #48	@ 0x30
c0de19d2:	2a20      	cmp	r2, #32
c0de19d4:	d108      	bne.n	c0de19e8 <load_descriptor_values+0x142>
c0de19d6:	f041 0280 	orr.w	r2, r1, #128	@ 0x80
c0de19da:	f002 02c0 	and.w	r2, r2, #192	@ 0xc0
c0de19de:	2a80      	cmp	r2, #128	@ 0x80
c0de19e0:	d102      	bne.n	c0de19e8 <load_descriptor_values+0x142>
c0de19e2:	f104 0214 	add.w	r2, r4, #20
c0de19e6:	e000      	b.n	c0de19ea <load_descriptor_values+0x144>
c0de19e8:	2200      	movs	r2, #0
c0de19ea:	6222      	str	r2, [r4, #32]
c0de19ec:	f001 02c0 	and.w	r2, r1, #192	@ 0xc0
c0de19f0:	2a80      	cmp	r2, #128	@ 0x80
c0de19f2:	d101      	bne.n	c0de19f8 <load_descriptor_values+0x152>
c0de19f4:	b103      	cbz	r3, c0de19f8 <load_descriptor_values+0x152>
c0de19f6:	6800      	ldr	r0, [r0, #0]
c0de19f8:	f001 010e 	and.w	r1, r1, #14
c0de19fc:	2908      	cmp	r1, #8
c0de19fe:	61e0      	str	r0, [r4, #28]
c0de1a00:	d113      	bne.n	c0de1a2a <load_descriptor_values+0x184>
c0de1a02:	6820      	ldr	r0, [r4, #0]
c0de1a04:	f006 fae4 	bl	c0de7fd0 <pic>
c0de1a08:	f810 1f06 	ldrb.w	r1, [r0, #6]!
c0de1a0c:	7842      	ldrb	r2, [r0, #1]
c0de1a0e:	7883      	ldrb	r3, [r0, #2]
c0de1a10:	78c0      	ldrb	r0, [r0, #3]
c0de1a12:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de1a16:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de1a1a:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de1a1e:	f006 fad7 	bl	c0de7fd0 <pic>
c0de1a22:	89e1      	ldrh	r1, [r4, #14]
c0de1a24:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de1a28:	e000      	b.n	c0de1a2c <load_descriptor_values+0x186>
c0de1a2a:	2000      	movs	r0, #0
c0de1a2c:	6260      	str	r0, [r4, #36]	@ 0x24
c0de1a2e:	2000      	movs	r0, #0
c0de1a30:	45b0      	cmp	r8, r6
c0de1a32:	bf38      	it	cc
c0de1a34:	2001      	movcc	r0, #1
c0de1a36:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de1a3a <pb_field_iter_begin_extension>:
c0de1a3a:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1a3c:	b081      	sub	sp, #4
c0de1a3e:	460f      	mov	r7, r1
c0de1a40:	460c      	mov	r4, r1
c0de1a42:	f857 1b04 	ldr.w	r1, [r7], #4
c0de1a46:	688e      	ldr	r6, [r1, #8]
c0de1a48:	4631      	mov	r1, r6
c0de1a4a:	f811 2f02 	ldrb.w	r2, [r1, #2]!
c0de1a4e:	78f3      	ldrb	r3, [r6, #3]
c0de1a50:	788d      	ldrb	r5, [r1, #2]
c0de1a52:	78c9      	ldrb	r1, [r1, #3]
c0de1a54:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de1a58:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de1a5c:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de1a60:	6809      	ldr	r1, [r1, #0]
c0de1a62:	4605      	mov	r5, r0
c0de1a64:	f401 4140 	and.w	r1, r1, #49152	@ 0xc000
c0de1a68:	f5b1 4f00 	cmp.w	r1, #32768	@ 0x8000
c0de1a6c:	4628      	mov	r0, r5
c0de1a6e:	f04f 0128 	mov.w	r1, #40	@ 0x28
c0de1a72:	bf18      	it	ne
c0de1a74:	683f      	ldrne	r7, [r7, #0]
c0de1a76:	f006 fd19 	bl	c0de84ac <__aeabi_memclr>
c0de1a7a:	4630      	mov	r0, r6
c0de1a7c:	f006 faa8 	bl	c0de7fd0 <pic>
c0de1a80:	6028      	str	r0, [r5, #0]
c0de1a82:	4628      	mov	r0, r5
c0de1a84:	606f      	str	r7, [r5, #4]
c0de1a86:	f7ff ff0e 	bl	c0de18a6 <load_descriptor_values>
c0de1a8a:	f104 010c 	add.w	r1, r4, #12
c0de1a8e:	6229      	str	r1, [r5, #32]
c0de1a90:	b001      	add	sp, #4
c0de1a92:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de1a94 <pb_field_iter_next>:
c0de1a94:	b510      	push	{r4, lr}
c0de1a96:	4604      	mov	r4, r0
c0de1a98:	f000 f808 	bl	c0de1aac <advance_iterator>
c0de1a9c:	4620      	mov	r0, r4
c0de1a9e:	f7ff ff02 	bl	c0de18a6 <load_descriptor_values>
c0de1aa2:	8920      	ldrh	r0, [r4, #8]
c0de1aa4:	2800      	cmp	r0, #0
c0de1aa6:	bf18      	it	ne
c0de1aa8:	2001      	movne	r0, #1
c0de1aaa:	bd10      	pop	{r4, pc}

c0de1aac <advance_iterator>:
c0de1aac:	b510      	push	{r4, lr}
c0de1aae:	4604      	mov	r4, r0
c0de1ab0:	6800      	ldr	r0, [r0, #0]
c0de1ab2:	8921      	ldrh	r1, [r4, #8]
c0de1ab4:	7802      	ldrb	r2, [r0, #0]
c0de1ab6:	7843      	ldrb	r3, [r0, #1]
c0de1ab8:	3101      	adds	r1, #1
c0de1aba:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de1abe:	b28b      	uxth	r3, r1
c0de1ac0:	4293      	cmp	r3, r2
c0de1ac2:	8121      	strh	r1, [r4, #8]
c0de1ac4:	d228      	bcs.n	c0de1b18 <advance_iterator+0x6c>
c0de1ac6:	f006 fa83 	bl	c0de7fd0 <pic>
c0de1aca:	f810 1f02 	ldrb.w	r1, [r0, #2]!
c0de1ace:	7842      	ldrb	r2, [r0, #1]
c0de1ad0:	7883      	ldrb	r3, [r0, #2]
c0de1ad2:	78c0      	ldrb	r0, [r0, #3]
c0de1ad4:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de1ad8:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de1adc:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de1ae0:	f006 fa76 	bl	c0de7fd0 <pic>
c0de1ae4:	8961      	ldrh	r1, [r4, #10]
c0de1ae6:	2301      	movs	r3, #1
c0de1ae8:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de1aec:	f000 0203 	and.w	r2, r0, #3
c0de1af0:	fa03 f202 	lsl.w	r2, r3, r2
c0de1af4:	4411      	add	r1, r2
c0de1af6:	f410 5f40 	tst.w	r0, #12288	@ 0x3000
c0de1afa:	8161      	strh	r1, [r4, #10]
c0de1afc:	d102      	bne.n	c0de1b04 <advance_iterator+0x58>
c0de1afe:	89a1      	ldrh	r1, [r4, #12]
c0de1b00:	3101      	adds	r1, #1
c0de1b02:	81a1      	strh	r1, [r4, #12]
c0de1b04:	f400 6060 	and.w	r0, r0, #3584	@ 0xe00
c0de1b08:	f5b0 6f00 	cmp.w	r0, #2048	@ 0x800
c0de1b0c:	bf18      	it	ne
c0de1b0e:	bd10      	popne	{r4, pc}
c0de1b10:	89e0      	ldrh	r0, [r4, #14]
c0de1b12:	3001      	adds	r0, #1
c0de1b14:	81e0      	strh	r0, [r4, #14]
c0de1b16:	bd10      	pop	{r4, pc}
c0de1b18:	2000      	movs	r0, #0
c0de1b1a:	e9c4 0002 	strd	r0, r0, [r4, #8]
c0de1b1e:	bd10      	pop	{r4, pc}

c0de1b20 <pb_field_iter_find>:
c0de1b20:	b570      	push	{r4, r5, r6, lr}
c0de1b22:	4604      	mov	r4, r0
c0de1b24:	8a00      	ldrh	r0, [r0, #16]
c0de1b26:	4288      	cmp	r0, r1
c0de1b28:	d101      	bne.n	c0de1b2e <pb_field_iter_find+0xe>
c0de1b2a:	2001      	movs	r0, #1
c0de1b2c:	bd70      	pop	{r4, r5, r6, pc}
c0de1b2e:	8926      	ldrh	r6, [r4, #8]
c0de1b30:	460d      	mov	r5, r1
c0de1b32:	bf00      	nop
c0de1b34:	4620      	mov	r0, r4
c0de1b36:	f7ff ffb9 	bl	c0de1aac <advance_iterator>
c0de1b3a:	6820      	ldr	r0, [r4, #0]
c0de1b3c:	f006 fa48 	bl	c0de7fd0 <pic>
c0de1b40:	f810 1f02 	ldrb.w	r1, [r0, #2]!
c0de1b44:	7842      	ldrb	r2, [r0, #1]
c0de1b46:	7883      	ldrb	r3, [r0, #2]
c0de1b48:	78c0      	ldrb	r0, [r0, #3]
c0de1b4a:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de1b4e:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de1b52:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de1b56:	f006 fa3b 	bl	c0de7fd0 <pic>
c0de1b5a:	8961      	ldrh	r1, [r4, #10]
c0de1b5c:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de1b60:	ea85 0090 	eor.w	r0, r5, r0, lsr #2
c0de1b64:	0680      	lsls	r0, r0, #26
c0de1b66:	d10b      	bne.n	c0de1b80 <pb_field_iter_find+0x60>
c0de1b68:	4620      	mov	r0, r4
c0de1b6a:	f7ff fe9c 	bl	c0de18a6 <load_descriptor_values>
c0de1b6e:	8a20      	ldrh	r0, [r4, #16]
c0de1b70:	42a8      	cmp	r0, r5
c0de1b72:	d105      	bne.n	c0de1b80 <pb_field_iter_find+0x60>
c0de1b74:	7da0      	ldrb	r0, [r4, #22]
c0de1b76:	f000 000f 	and.w	r0, r0, #15
c0de1b7a:	280a      	cmp	r0, #10
c0de1b7c:	d1d5      	bne.n	c0de1b2a <pb_field_iter_find+0xa>
c0de1b7e:	bf00      	nop
c0de1b80:	8920      	ldrh	r0, [r4, #8]
c0de1b82:	42b0      	cmp	r0, r6
c0de1b84:	d1d6      	bne.n	c0de1b34 <pb_field_iter_find+0x14>
c0de1b86:	4620      	mov	r0, r4
c0de1b88:	f7ff fe8d 	bl	c0de18a6 <load_descriptor_values>
c0de1b8c:	2000      	movs	r0, #0
c0de1b8e:	bd70      	pop	{r4, r5, r6, pc}

c0de1b90 <pb_default_field_callback>:
c0de1b90:	8a53      	ldrh	r3, [r2, #18]
c0de1b92:	2b08      	cmp	r3, #8
c0de1b94:	d114      	bne.n	c0de1bc0 <pb_default_field_callback+0x30>
c0de1b96:	69d3      	ldr	r3, [r2, #28]
c0de1b98:	b193      	cbz	r3, c0de1bc0 <pb_default_field_callback+0x30>
c0de1b9a:	b130      	cbz	r0, c0de1baa <pb_default_field_callback+0x1a>
c0de1b9c:	f8d3 c000 	ldr.w	ip, [r3]
c0de1ba0:	f1bc 0f00 	cmp.w	ip, #0
c0de1ba4:	d001      	beq.n	c0de1baa <pb_default_field_callback+0x1a>
c0de1ba6:	3304      	adds	r3, #4
c0de1ba8:	e007      	b.n	c0de1bba <pb_default_field_callback+0x2a>
c0de1baa:	b149      	cbz	r1, c0de1bc0 <pb_default_field_callback+0x30>
c0de1bac:	f8d3 c000 	ldr.w	ip, [r3]
c0de1bb0:	f1bc 0f00 	cmp.w	ip, #0
c0de1bb4:	d004      	beq.n	c0de1bc0 <pb_default_field_callback+0x30>
c0de1bb6:	3304      	adds	r3, #4
c0de1bb8:	4608      	mov	r0, r1
c0de1bba:	4611      	mov	r1, r2
c0de1bbc:	461a      	mov	r2, r3
c0de1bbe:	4760      	bx	ip
c0de1bc0:	2001      	movs	r0, #1
c0de1bc2:	4770      	bx	lr

c0de1bc4 <apdu_read>:
c0de1bc4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1bc8:	b084      	sub	sp, #16
c0de1bca:	2a65      	cmp	r2, #101	@ 0x65
c0de1bcc:	9102      	str	r1, [sp, #8]
c0de1bce:	f080 80af 	bcs.w	c0de1d30 <apdu_read+0x16c>
c0de1bd2:	6846      	ldr	r6, [r0, #4]
c0de1bd4:	9003      	str	r0, [sp, #12]
c0de1bd6:	8870      	ldrh	r0, [r6, #2]
c0de1bd8:	8831      	ldrh	r1, [r6, #0]
c0de1bda:	4614      	mov	r4, r2
c0de1bdc:	1a47      	subs	r7, r0, r1
c0de1bde:	b2b8      	uxth	r0, r7
c0de1be0:	4290      	cmp	r0, r2
c0de1be2:	d275      	bcs.n	c0de1cd0 <apdu_read+0x10c>
c0de1be4:	f106 000a 	add.w	r0, r6, #10
c0de1be8:	4401      	add	r1, r0
c0de1bea:	463a      	mov	r2, r7
c0de1bec:	f006 fc63 	bl	c0de84b6 <__aeabi_memmove>
c0de1bf0:	8077      	strh	r7, [r6, #2]
c0de1bf2:	f240 6714 	movw	r7, #1556	@ 0x614
c0de1bf6:	f240 0508 	movw	r5, #8
c0de1bfa:	2000      	movs	r0, #0
c0de1bfc:	f04f 0800 	mov.w	r8, #0
c0de1c00:	f2c0 0700 	movt	r7, #0
c0de1c04:	f2c0 0500 	movt	r5, #0
c0de1c08:	f04f 0b00 	mov.w	fp, #0
c0de1c0c:	8030      	strh	r0, [r6, #0]
c0de1c0e:	bf00      	nop
c0de1c10:	f1bb 0f0a 	cmp.w	fp, #10
c0de1c14:	f080 8080 	bcs.w	c0de1d18 <apdu_read+0x154>
c0de1c18:	88f0      	ldrh	r0, [r6, #6]
c0de1c1a:	88b1      	ldrh	r1, [r6, #4]
c0de1c1c:	4288      	cmp	r0, r1
c0de1c1e:	d071      	beq.n	c0de1d04 <apdu_read+0x140>
c0de1c20:	2090      	movs	r0, #144	@ 0x90
c0de1c22:	f809 0007 	strb.w	r0, [r9, r7]
c0de1c26:	eb09 0a07 	add.w	sl, r9, r7
c0de1c2a:	2000      	movs	r0, #0
c0de1c2c:	2102      	movs	r1, #2
c0de1c2e:	f88a 8001 	strb.w	r8, [sl, #1]
c0de1c32:	f004 f805 	bl	c0de5c40 <io_exchange>
c0de1c36:	f89a 3004 	ldrb.w	r3, [sl, #4]
c0de1c3a:	3805      	subs	r0, #5
c0de1c3c:	4298      	cmp	r0, r3
c0de1c3e:	d16f      	bne.n	c0de1d20 <apdu_read+0x15c>
c0de1c40:	eb09 0007 	add.w	r0, r9, r7
c0de1c44:	7880      	ldrb	r0, [r0, #2]
c0de1c46:	0640      	lsls	r0, r0, #25
c0de1c48:	d162      	bne.n	c0de1d10 <apdu_read+0x14c>
c0de1c4a:	8870      	ldrh	r0, [r6, #2]
c0de1c4c:	18c1      	adds	r1, r0, r3
c0de1c4e:	29a1      	cmp	r1, #161	@ 0xa1
c0de1c50:	d26a      	bcs.n	c0de1d28 <apdu_read+0x164>
c0de1c52:	eb09 0205 	add.w	r2, r9, r5
c0de1c56:	f892 239a 	ldrb.w	r2, [r2, #922]	@ 0x39a
c0de1c5a:	2a08      	cmp	r2, #8
c0de1c5c:	d058      	beq.n	c0de1d10 <apdu_read+0x14c>
c0de1c5e:	88f2      	ldrh	r2, [r6, #6]
c0de1c60:	46a2      	mov	sl, r4
c0de1c62:	441a      	add	r2, r3
c0de1c64:	8934      	ldrh	r4, [r6, #8]
c0de1c66:	80f2      	strh	r2, [r6, #6]
c0de1c68:	88b2      	ldrh	r2, [r6, #4]
c0de1c6a:	4421      	add	r1, r4
c0de1c6c:	4420      	add	r0, r4
c0de1c6e:	4291      	cmp	r1, r2
c0de1c70:	bf88      	it	hi
c0de1c72:	1a13      	subhi	r3, r2, r0
c0de1c74:	eb09 0005 	add.w	r0, r9, r5
c0de1c78:	eb09 0107 	add.w	r1, r9, r7
c0de1c7c:	f880 339b 	strb.w	r3, [r0, #923]	@ 0x39b
c0de1c80:	2400      	movs	r4, #0
c0de1c82:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de1c86:	1d4a      	adds	r2, r1, #5
c0de1c88:	2100      	movs	r1, #0
c0de1c8a:	9400      	str	r4, [sp, #0]
c0de1c8c:	f04f 0800 	mov.w	r8, #0
c0de1c90:	9401      	str	r4, [sp, #4]
c0de1c92:	f005 ffa2 	bl	c0de7bda <cx_hash_no_throw>
c0de1c96:	2800      	cmp	r0, #0
c0de1c98:	d148      	bne.n	c0de1d2c <apdu_read+0x168>
c0de1c9a:	eb09 0005 	add.w	r0, r9, r5
c0de1c9e:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de1ca2:	f10b 0b01 	add.w	fp, fp, #1
c0de1ca6:	f005 ff94 	bl	c0de7bd2 <cx_hash_get_size>
c0de1caa:	8870      	ldrh	r0, [r6, #2]
c0de1cac:	eb09 0407 	add.w	r4, r9, r7
c0de1cb0:	4430      	add	r0, r6
c0de1cb2:	7922      	ldrb	r2, [r4, #4]
c0de1cb4:	300a      	adds	r0, #10
c0de1cb6:	1d61      	adds	r1, r4, #5
c0de1cb8:	f006 fbfd 	bl	c0de84b6 <__aeabi_memmove>
c0de1cbc:	7920      	ldrb	r0, [r4, #4]
c0de1cbe:	8872      	ldrh	r2, [r6, #2]
c0de1cc0:	8831      	ldrh	r1, [r6, #0]
c0de1cc2:	4410      	add	r0, r2
c0de1cc4:	1a42      	subs	r2, r0, r1
c0de1cc6:	b292      	uxth	r2, r2
c0de1cc8:	4654      	mov	r4, sl
c0de1cca:	4552      	cmp	r2, sl
c0de1ccc:	8070      	strh	r0, [r6, #2]
c0de1cce:	d39f      	bcc.n	c0de1c10 <apdu_read+0x4c>
c0de1cd0:	88b2      	ldrh	r2, [r6, #4]
c0de1cd2:	8930      	ldrh	r0, [r6, #8]
c0de1cd4:	4282      	cmp	r2, r0
c0de1cd6:	d915      	bls.n	c0de1d04 <apdu_read+0x140>
c0de1cd8:	9f02      	ldr	r7, [sp, #8]
c0de1cda:	4420      	add	r0, r4
c0de1cdc:	190a      	adds	r2, r1, r4
c0de1cde:	8130      	strh	r0, [r6, #8]
c0de1ce0:	f04f 0001 	mov.w	r0, #1
c0de1ce4:	8032      	strh	r2, [r6, #0]
c0de1ce6:	b187      	cbz	r7, c0de1d0a <apdu_read+0x146>
c0de1ce8:	b17c      	cbz	r4, c0de1d0a <apdu_read+0x146>
c0de1cea:	1870      	adds	r0, r6, r1
c0de1cec:	300a      	adds	r0, #10
c0de1cee:	2100      	movs	r1, #0
c0de1cf0:	2200      	movs	r2, #0
c0de1cf2:	bf00      	nop
c0de1cf4:	5c43      	ldrb	r3, [r0, r1]
c0de1cf6:	3201      	adds	r2, #1
c0de1cf8:	547b      	strb	r3, [r7, r1]
c0de1cfa:	b291      	uxth	r1, r2
c0de1cfc:	42a1      	cmp	r1, r4
c0de1cfe:	d3f9      	bcc.n	c0de1cf4 <apdu_read+0x130>
c0de1d00:	2001      	movs	r0, #1
c0de1d02:	e002      	b.n	c0de1d0a <apdu_read+0x146>
c0de1d04:	9903      	ldr	r1, [sp, #12]
c0de1d06:	2000      	movs	r0, #0
c0de1d08:	6088      	str	r0, [r1, #8]
c0de1d0a:	b004      	add	sp, #16
c0de1d0c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de1d10:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de1d14:	f005 ff85 	bl	c0de7c22 <os_longjmp>
c0de1d18:	f246 0003 	movw	r0, #24579	@ 0x6003
c0de1d1c:	f005 ff81 	bl	c0de7c22 <os_longjmp>
c0de1d20:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de1d24:	f005 ff7d 	bl	c0de7c22 <os_longjmp>
c0de1d28:	f246 0005 	movw	r0, #24581	@ 0x6005
c0de1d2c:	f005 ff79 	bl	c0de7c22 <os_longjmp>
c0de1d30:	f246 0002 	movw	r0, #24578	@ 0x6002
c0de1d34:	f005 ff75 	bl	c0de7c22 <os_longjmp>

c0de1d38 <pb_istream_from_apdu>:
c0de1d38:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de1d3c:	b083      	sub	sp, #12
c0de1d3e:	460c      	mov	r4, r1
c0de1d40:	f64f 6177 	movw	r1, #65143	@ 0xfe77
c0de1d44:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de1d48:	4616      	mov	r6, r2
c0de1d4a:	4479      	add	r1, pc
c0de1d4c:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de1d50:	f04f 0800 	mov.w	r8, #0
c0de1d54:	9f0a      	ldr	r7, [sp, #40]	@ 0x28
c0de1d56:	e9c0 1400 	strd	r1, r4, [r0]
c0de1d5a:	e9c0 2802 	strd	r2, r8, [r0, #8]
c0de1d5e:	4620      	mov	r0, r4
c0de1d60:	21aa      	movs	r1, #170	@ 0xaa
c0de1d62:	461d      	mov	r5, r3
c0de1d64:	f006 fba2 	bl	c0de84ac <__aeabi_memclr>
c0de1d68:	f104 000a 	add.w	r0, r4, #10
c0de1d6c:	4631      	mov	r1, r6
c0de1d6e:	462a      	mov	r2, r5
c0de1d70:	80e5      	strh	r5, [r4, #6]
c0de1d72:	80a7      	strh	r7, [r4, #4]
c0de1d74:	f006 fb9f 	bl	c0de84b6 <__aeabi_memmove>
c0de1d78:	f240 0a08 	movw	sl, #8
c0de1d7c:	42bd      	cmp	r5, r7
c0de1d7e:	f2c0 0a00 	movt	sl, #0
c0de1d82:	462b      	mov	r3, r5
c0de1d84:	d907      	bls.n	c0de1d96 <pb_istream_from_apdu+0x5e>
c0de1d86:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de1d88:	eb09 010a 	add.w	r1, r9, sl
c0de1d8c:	4438      	add	r0, r7
c0de1d8e:	3805      	subs	r0, #5
c0de1d90:	b2fb      	uxtb	r3, r7
c0de1d92:	f881 039b 	strb.w	r0, [r1, #923]	@ 0x39b
c0de1d96:	eb09 000a 	add.w	r0, r9, sl
c0de1d9a:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de1d9e:	2100      	movs	r1, #0
c0de1da0:	4632      	mov	r2, r6
c0de1da2:	f8cd 8000 	str.w	r8, [sp]
c0de1da6:	f8cd 8004 	str.w	r8, [sp, #4]
c0de1daa:	f005 ff16 	bl	c0de7bda <cx_hash_no_throw>
c0de1dae:	b960      	cbnz	r0, c0de1dca <pb_istream_from_apdu+0x92>
c0de1db0:	eb09 000a 	add.w	r0, r9, sl
c0de1db4:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de1db8:	f005 ff0b 	bl	c0de7bd2 <cx_hash_get_size>
c0de1dbc:	2000      	movs	r0, #0
c0de1dbe:	8065      	strh	r5, [r4, #2]
c0de1dc0:	8020      	strh	r0, [r4, #0]
c0de1dc2:	8120      	strh	r0, [r4, #8]
c0de1dc4:	b003      	add	sp, #12
c0de1dc6:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de1dca:	f005 ff2a 	bl	c0de7c22 <os_longjmp>
c0de1dce:	d4d4      	bmi.n	c0de1d7a <pb_istream_from_apdu+0x42>

c0de1dd0 <pb_read>:
c0de1dd0:	b570      	push	{r4, r5, r6, lr}
c0de1dd2:	b084      	sub	sp, #16
c0de1dd4:	b1a2      	cbz	r2, c0de1e00 <pb_read+0x30>
c0de1dd6:	4615      	mov	r5, r2
c0de1dd8:	4604      	mov	r4, r0
c0de1dda:	b199      	cbz	r1, c0de1e04 <pb_read+0x34>
c0de1ddc:	68a0      	ldr	r0, [r4, #8]
c0de1dde:	42a8      	cmp	r0, r5
c0de1de0:	d206      	bcs.n	c0de1df0 <pb_read+0x20>
c0de1de2:	68e0      	ldr	r0, [r4, #12]
c0de1de4:	f646 71b3 	movw	r1, #28595	@ 0x6fb3
c0de1de8:	f2c0 0100 	movt	r1, #0
c0de1dec:	4479      	add	r1, pc
c0de1dee:	e02a      	b.n	c0de1e46 <pb_read+0x76>
c0de1df0:	6823      	ldr	r3, [r4, #0]
c0de1df2:	4620      	mov	r0, r4
c0de1df4:	462a      	mov	r2, r5
c0de1df6:	4798      	blx	r3
c0de1df8:	b1f8      	cbz	r0, c0de1e3a <pb_read+0x6a>
c0de1dfa:	68a0      	ldr	r0, [r4, #8]
c0de1dfc:	1b40      	subs	r0, r0, r5
c0de1dfe:	60a0      	str	r0, [r4, #8]
c0de1e00:	2001      	movs	r0, #1
c0de1e02:	e025      	b.n	c0de1e50 <pb_read+0x80>
c0de1e04:	6820      	ldr	r0, [r4, #0]
c0de1e06:	f240 0243 	movw	r2, #67	@ 0x43
c0de1e0a:	f2c0 0200 	movt	r2, #0
c0de1e0e:	447a      	add	r2, pc
c0de1e10:	4290      	cmp	r0, r2
c0de1e12:	d0e3      	beq.n	c0de1ddc <pb_read+0xc>
c0de1e14:	2d11      	cmp	r5, #17
c0de1e16:	d30a      	bcc.n	c0de1e2e <pb_read+0x5e>
c0de1e18:	466e      	mov	r6, sp
c0de1e1a:	bf00      	nop
c0de1e1c:	4620      	mov	r0, r4
c0de1e1e:	4631      	mov	r1, r6
c0de1e20:	2210      	movs	r2, #16
c0de1e22:	f7ff ffd5 	bl	c0de1dd0 <pb_read>
c0de1e26:	b190      	cbz	r0, c0de1e4e <pb_read+0x7e>
c0de1e28:	3d10      	subs	r5, #16
c0de1e2a:	2d10      	cmp	r5, #16
c0de1e2c:	d8f6      	bhi.n	c0de1e1c <pb_read+0x4c>
c0de1e2e:	4669      	mov	r1, sp
c0de1e30:	4620      	mov	r0, r4
c0de1e32:	462a      	mov	r2, r5
c0de1e34:	f7ff ffcc 	bl	c0de1dd0 <pb_read>
c0de1e38:	e00a      	b.n	c0de1e50 <pb_read+0x80>
c0de1e3a:	68e0      	ldr	r0, [r4, #12]
c0de1e3c:	f646 618c 	movw	r1, #28300	@ 0x6e8c
c0de1e40:	f2c0 0100 	movt	r1, #0
c0de1e44:	4479      	add	r1, pc
c0de1e46:	2800      	cmp	r0, #0
c0de1e48:	bf18      	it	ne
c0de1e4a:	4601      	movne	r1, r0
c0de1e4c:	60e1      	str	r1, [r4, #12]
c0de1e4e:	2000      	movs	r0, #0
c0de1e50:	b004      	add	sp, #16
c0de1e52:	bd70      	pop	{r4, r5, r6, pc}

c0de1e54 <buf_read>:
c0de1e54:	6843      	ldr	r3, [r0, #4]
c0de1e56:	eb03 0c02 	add.w	ip, r3, r2
c0de1e5a:	f8c0 c004 	str.w	ip, [r0, #4]
c0de1e5e:	b139      	cbz	r1, c0de1e70 <buf_read+0x1c>
c0de1e60:	b132      	cbz	r2, c0de1e70 <buf_read+0x1c>
c0de1e62:	bf00      	nop
c0de1e64:	f813 0b01 	ldrb.w	r0, [r3], #1
c0de1e68:	3a01      	subs	r2, #1
c0de1e6a:	f801 0b01 	strb.w	r0, [r1], #1
c0de1e6e:	d1f9      	bne.n	c0de1e64 <buf_read+0x10>
c0de1e70:	2001      	movs	r0, #1
c0de1e72:	4770      	bx	lr

c0de1e74 <pb_decode_varint32_eof>:
c0de1e74:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1e78:	b082      	sub	sp, #8
c0de1e7a:	4688      	mov	r8, r1
c0de1e7c:	f10d 0107 	add.w	r1, sp, #7
c0de1e80:	4616      	mov	r6, r2
c0de1e82:	4604      	mov	r4, r0
c0de1e84:	f000 f889 	bl	c0de1f9a <pb_readbyte>
c0de1e88:	b138      	cbz	r0, c0de1e9a <pb_decode_varint32_eof+0x26>
c0de1e8a:	f89d 7007 	ldrb.w	r7, [sp, #7]
c0de1e8e:	0638      	lsls	r0, r7, #24
c0de1e90:	d40b      	bmi.n	c0de1eaa <pb_decode_varint32_eof+0x36>
c0de1e92:	2001      	movs	r0, #1
c0de1e94:	f8c8 7000 	str.w	r7, [r8]
c0de1e98:	e03e      	b.n	c0de1f18 <pb_decode_varint32_eof+0xa4>
c0de1e9a:	f04f 0000 	mov.w	r0, #0
c0de1e9e:	b3de      	cbz	r6, c0de1f18 <pb_decode_varint32_eof+0xa4>
c0de1ea0:	68a1      	ldr	r1, [r4, #8]
c0de1ea2:	bbc9      	cbnz	r1, c0de1f18 <pb_decode_varint32_eof+0xa4>
c0de1ea4:	2001      	movs	r0, #1
c0de1ea6:	7030      	strb	r0, [r6, #0]
c0de1ea8:	e035      	b.n	c0de1f16 <pb_decode_varint32_eof+0xa2>
c0de1eaa:	f007 077f 	and.w	r7, r7, #127	@ 0x7f
c0de1eae:	2507      	movs	r5, #7
c0de1eb0:	f10d 0607 	add.w	r6, sp, #7
c0de1eb4:	4620      	mov	r0, r4
c0de1eb6:	4631      	mov	r1, r6
c0de1eb8:	f000 f86f 	bl	c0de1f9a <pb_readbyte>
c0de1ebc:	b358      	cbz	r0, c0de1f16 <pb_decode_varint32_eof+0xa2>
c0de1ebe:	b2e9      	uxtb	r1, r5
c0de1ec0:	f89d 0007 	ldrb.w	r0, [sp, #7]
c0de1ec4:	2920      	cmp	r1, #32
c0de1ec6:	d30d      	bcc.n	c0de1ee4 <pb_decode_varint32_eof+0x70>
c0de1ec8:	0642      	lsls	r2, r0, #25
c0de1eca:	d00f      	beq.n	c0de1eec <pb_decode_varint32_eof+0x78>
c0de1ecc:	293f      	cmp	r1, #63	@ 0x3f
c0de1ece:	f04f 0201 	mov.w	r2, #1
c0de1ed2:	bf38      	it	cc
c0de1ed4:	22ff      	movcc	r2, #255	@ 0xff
c0de1ed6:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de1eda:	dc12      	bgt.n	c0de1f02 <pb_decode_varint32_eof+0x8e>
c0de1edc:	4282      	cmp	r2, r0
c0de1ede:	d005      	beq.n	c0de1eec <pb_decode_varint32_eof+0x78>
c0de1ee0:	e00f      	b.n	c0de1f02 <pb_decode_varint32_eof+0x8e>
c0de1ee2:	bf00      	nop
c0de1ee4:	f000 027f 	and.w	r2, r0, #127	@ 0x7f
c0de1ee8:	408a      	lsls	r2, r1
c0de1eea:	4317      	orrs	r7, r2
c0de1eec:	b242      	sxtb	r2, r0
c0de1eee:	2a00      	cmp	r2, #0
c0de1ef0:	f101 0507 	add.w	r5, r1, #7
c0de1ef4:	d4de      	bmi.n	c0de1eb4 <pb_decode_varint32_eof+0x40>
c0de1ef6:	b2e9      	uxtb	r1, r5
c0de1ef8:	2923      	cmp	r1, #35	@ 0x23
c0de1efa:	d1ca      	bne.n	c0de1e92 <pb_decode_varint32_eof+0x1e>
c0de1efc:	f010 0070 	ands.w	r0, r0, #112	@ 0x70
c0de1f00:	d0c7      	beq.n	c0de1e92 <pb_decode_varint32_eof+0x1e>
c0de1f02:	68e0      	ldr	r0, [r4, #12]
c0de1f04:	f247 0118 	movw	r1, #28696	@ 0x7018
c0de1f08:	f2c0 0100 	movt	r1, #0
c0de1f0c:	4479      	add	r1, pc
c0de1f0e:	2800      	cmp	r0, #0
c0de1f10:	bf18      	it	ne
c0de1f12:	4601      	movne	r1, r0
c0de1f14:	60e1      	str	r1, [r4, #12]
c0de1f16:	2000      	movs	r0, #0
c0de1f18:	b002      	add	sp, #8
c0de1f1a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1f1e:	d4d4      	bmi.n	c0de1eca <pb_decode_varint32_eof+0x56>

c0de1f20 <pb_decode_varint>:
c0de1f20:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de1f24:	b081      	sub	sp, #4
c0de1f26:	4688      	mov	r8, r1
c0de1f28:	4604      	mov	r4, r0
c0de1f2a:	2000      	movs	r0, #0
c0de1f2c:	f10d 0a03 	add.w	sl, sp, #3
c0de1f30:	2700      	movs	r7, #0
c0de1f32:	2500      	movs	r5, #0
c0de1f34:	b2c6      	uxtb	r6, r0
c0de1f36:	2e40      	cmp	r6, #64	@ 0x40
c0de1f38:	d221      	bcs.n	c0de1f7e <pb_decode_varint+0x5e>
c0de1f3a:	4620      	mov	r0, r4
c0de1f3c:	4651      	mov	r1, sl
c0de1f3e:	f000 f82c 	bl	c0de1f9a <pb_readbyte>
c0de1f42:	b330      	cbz	r0, c0de1f92 <pb_decode_varint+0x72>
c0de1f44:	f89d 0003 	ldrb.w	r0, [sp, #3]
c0de1f48:	f1c6 0320 	rsb	r3, r6, #32
c0de1f4c:	f000 017f 	and.w	r1, r0, #127	@ 0x7f
c0de1f50:	fa21 f303 	lsr.w	r3, r1, r3
c0de1f54:	f1b6 0220 	subs.w	r2, r6, #32
c0de1f58:	bf58      	it	pl
c0de1f5a:	fa01 f302 	lslpl.w	r3, r1, r2
c0de1f5e:	fa01 f106 	lsl.w	r1, r1, r6
c0de1f62:	bf58      	it	pl
c0de1f64:	2100      	movpl	r1, #0
c0de1f66:	0600      	lsls	r0, r0, #24
c0de1f68:	ea45 0503 	orr.w	r5, r5, r3
c0de1f6c:	ea47 0701 	orr.w	r7, r7, r1
c0de1f70:	f106 0007 	add.w	r0, r6, #7
c0de1f74:	d4de      	bmi.n	c0de1f34 <pb_decode_varint+0x14>
c0de1f76:	2001      	movs	r0, #1
c0de1f78:	e9c8 7500 	strd	r7, r5, [r8]
c0de1f7c:	e00a      	b.n	c0de1f94 <pb_decode_varint+0x74>
c0de1f7e:	68e0      	ldr	r0, [r4, #12]
c0de1f80:	f646 719c 	movw	r1, #28572	@ 0x6f9c
c0de1f84:	f2c0 0100 	movt	r1, #0
c0de1f88:	4479      	add	r1, pc
c0de1f8a:	2800      	cmp	r0, #0
c0de1f8c:	bf18      	it	ne
c0de1f8e:	4601      	movne	r1, r0
c0de1f90:	60e1      	str	r1, [r4, #12]
c0de1f92:	2000      	movs	r0, #0
c0de1f94:	b001      	add	sp, #4
c0de1f96:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de1f9a <pb_readbyte>:
c0de1f9a:	b510      	push	{r4, lr}
c0de1f9c:	4604      	mov	r4, r0
c0de1f9e:	6880      	ldr	r0, [r0, #8]
c0de1fa0:	b148      	cbz	r0, c0de1fb6 <pb_readbyte+0x1c>
c0de1fa2:	6823      	ldr	r3, [r4, #0]
c0de1fa4:	4620      	mov	r0, r4
c0de1fa6:	2201      	movs	r2, #1
c0de1fa8:	4798      	blx	r3
c0de1faa:	b158      	cbz	r0, c0de1fc4 <pb_readbyte+0x2a>
c0de1fac:	68a0      	ldr	r0, [r4, #8]
c0de1fae:	3801      	subs	r0, #1
c0de1fb0:	60a0      	str	r0, [r4, #8]
c0de1fb2:	2001      	movs	r0, #1
c0de1fb4:	bd10      	pop	{r4, pc}
c0de1fb6:	68e0      	ldr	r0, [r4, #12]
c0de1fb8:	f646 51df 	movw	r1, #28127	@ 0x6ddf
c0de1fbc:	f2c0 0100 	movt	r1, #0
c0de1fc0:	4479      	add	r1, pc
c0de1fc2:	e005      	b.n	c0de1fd0 <pb_readbyte+0x36>
c0de1fc4:	68e0      	ldr	r0, [r4, #12]
c0de1fc6:	f646 5102 	movw	r1, #27906	@ 0x6d02
c0de1fca:	f2c0 0100 	movt	r1, #0
c0de1fce:	4479      	add	r1, pc
c0de1fd0:	2800      	cmp	r0, #0
c0de1fd2:	bf18      	it	ne
c0de1fd4:	4601      	movne	r1, r0
c0de1fd6:	2000      	movs	r0, #0
c0de1fd8:	60e1      	str	r1, [r4, #12]
c0de1fda:	bd10      	pop	{r4, pc}

c0de1fdc <pb_decode_tag>:
c0de1fdc:	b5b0      	push	{r4, r5, r7, lr}
c0de1fde:	b082      	sub	sp, #8
c0de1fe0:	460c      	mov	r4, r1
c0de1fe2:	2100      	movs	r1, #0
c0de1fe4:	4615      	mov	r5, r2
c0de1fe6:	7019      	strb	r1, [r3, #0]
c0de1fe8:	7021      	strb	r1, [r4, #0]
c0de1fea:	6011      	str	r1, [r2, #0]
c0de1fec:	a901      	add	r1, sp, #4
c0de1fee:	461a      	mov	r2, r3
c0de1ff0:	f7ff ff40 	bl	c0de1e74 <pb_decode_varint32_eof>
c0de1ff4:	b128      	cbz	r0, c0de2002 <pb_decode_tag+0x26>
c0de1ff6:	9901      	ldr	r1, [sp, #4]
c0de1ff8:	08ca      	lsrs	r2, r1, #3
c0de1ffa:	f001 0107 	and.w	r1, r1, #7
c0de1ffe:	602a      	str	r2, [r5, #0]
c0de2000:	7021      	strb	r1, [r4, #0]
c0de2002:	b002      	add	sp, #8
c0de2004:	bdb0      	pop	{r4, r5, r7, pc}
c0de2006:	d4d4      	bmi.n	c0de1fb2 <pb_readbyte+0x18>

c0de2008 <pb_skip_field>:
c0de2008:	b570      	push	{r4, r5, r6, lr}
c0de200a:	b082      	sub	sp, #8
c0de200c:	2901      	cmp	r1, #1
c0de200e:	4604      	mov	r4, r0
c0de2010:	dc06      	bgt.n	c0de2020 <pb_skip_field+0x18>
c0de2012:	b1e9      	cbz	r1, c0de2050 <pb_skip_field+0x48>
c0de2014:	2901      	cmp	r1, #1
c0de2016:	d10f      	bne.n	c0de2038 <pb_skip_field+0x30>
c0de2018:	4620      	mov	r0, r4
c0de201a:	2100      	movs	r1, #0
c0de201c:	2208      	movs	r2, #8
c0de201e:	e006      	b.n	c0de202e <pb_skip_field+0x26>
c0de2020:	2902      	cmp	r1, #2
c0de2022:	d023      	beq.n	c0de206c <pb_skip_field+0x64>
c0de2024:	2905      	cmp	r1, #5
c0de2026:	d107      	bne.n	c0de2038 <pb_skip_field+0x30>
c0de2028:	4620      	mov	r0, r4
c0de202a:	2100      	movs	r1, #0
c0de202c:	2204      	movs	r2, #4
c0de202e:	b002      	add	sp, #8
c0de2030:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de2034:	f7ff becc 	b.w	c0de1dd0 <pb_read>
c0de2038:	68e0      	ldr	r0, [r4, #12]
c0de203a:	f646 61f2 	movw	r1, #28402	@ 0x6ef2
c0de203e:	f2c0 0100 	movt	r1, #0
c0de2042:	4479      	add	r1, pc
c0de2044:	2500      	movs	r5, #0
c0de2046:	2800      	cmp	r0, #0
c0de2048:	bf18      	it	ne
c0de204a:	4601      	movne	r1, r0
c0de204c:	60e1      	str	r1, [r4, #12]
c0de204e:	e01a      	b.n	c0de2086 <pb_skip_field+0x7e>
c0de2050:	f10d 0603 	add.w	r6, sp, #3
c0de2054:	4620      	mov	r0, r4
c0de2056:	4631      	mov	r1, r6
c0de2058:	2201      	movs	r2, #1
c0de205a:	f7ff feb9 	bl	c0de1dd0 <pb_read>
c0de205e:	4605      	mov	r5, r0
c0de2060:	b188      	cbz	r0, c0de2086 <pb_skip_field+0x7e>
c0de2062:	f99d 0003 	ldrsb.w	r0, [sp, #3]
c0de2066:	2800      	cmp	r0, #0
c0de2068:	d4f4      	bmi.n	c0de2054 <pb_skip_field+0x4c>
c0de206a:	e00c      	b.n	c0de2086 <pb_skip_field+0x7e>
c0de206c:	a901      	add	r1, sp, #4
c0de206e:	4620      	mov	r0, r4
c0de2070:	2200      	movs	r2, #0
c0de2072:	2500      	movs	r5, #0
c0de2074:	f7ff fefe 	bl	c0de1e74 <pb_decode_varint32_eof>
c0de2078:	b128      	cbz	r0, c0de2086 <pb_skip_field+0x7e>
c0de207a:	9a01      	ldr	r2, [sp, #4]
c0de207c:	4620      	mov	r0, r4
c0de207e:	2100      	movs	r1, #0
c0de2080:	f7ff fea6 	bl	c0de1dd0 <pb_read>
c0de2084:	4605      	mov	r5, r0
c0de2086:	4628      	mov	r0, r5
c0de2088:	b002      	add	sp, #8
c0de208a:	bd70      	pop	{r4, r5, r6, pc}

c0de208c <pb_make_string_substream>:
c0de208c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de208e:	b081      	sub	sp, #4
c0de2090:	460f      	mov	r7, r1
c0de2092:	4669      	mov	r1, sp
c0de2094:	2200      	movs	r2, #0
c0de2096:	4604      	mov	r4, r0
c0de2098:	2600      	movs	r6, #0
c0de209a:	f7ff feeb 	bl	c0de1e74 <pb_decode_varint32_eof>
c0de209e:	b1c8      	cbz	r0, c0de20d4 <pb_make_string_substream+0x48>
c0de20a0:	4620      	mov	r0, r4
c0de20a2:	e890 006c 	ldmia.w	r0, {r2, r3, r5, r6}
c0de20a6:	4639      	mov	r1, r7
c0de20a8:	c16c      	stmia	r1!, {r2, r3, r5, r6}
c0de20aa:	68b9      	ldr	r1, [r7, #8]
c0de20ac:	9800      	ldr	r0, [sp, #0]
c0de20ae:	4281      	cmp	r1, r0
c0de20b0:	d20b      	bcs.n	c0de20ca <pb_make_string_substream+0x3e>
c0de20b2:	68e0      	ldr	r0, [r4, #12]
c0de20b4:	f646 51b1 	movw	r1, #28081	@ 0x6db1
c0de20b8:	f2c0 0100 	movt	r1, #0
c0de20bc:	4479      	add	r1, pc
c0de20be:	2800      	cmp	r0, #0
c0de20c0:	bf18      	it	ne
c0de20c2:	4601      	movne	r1, r0
c0de20c4:	60e1      	str	r1, [r4, #12]
c0de20c6:	2600      	movs	r6, #0
c0de20c8:	e004      	b.n	c0de20d4 <pb_make_string_substream+0x48>
c0de20ca:	60b8      	str	r0, [r7, #8]
c0de20cc:	68a1      	ldr	r1, [r4, #8]
c0de20ce:	2601      	movs	r6, #1
c0de20d0:	1a08      	subs	r0, r1, r0
c0de20d2:	60a0      	str	r0, [r4, #8]
c0de20d4:	4630      	mov	r0, r6
c0de20d6:	b001      	add	sp, #4
c0de20d8:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de20da <pb_close_string_substream>:
c0de20da:	b570      	push	{r4, r5, r6, lr}
c0de20dc:	688a      	ldr	r2, [r1, #8]
c0de20de:	460c      	mov	r4, r1
c0de20e0:	4605      	mov	r5, r0
c0de20e2:	b12a      	cbz	r2, c0de20f0 <pb_close_string_substream+0x16>
c0de20e4:	4620      	mov	r0, r4
c0de20e6:	2100      	movs	r1, #0
c0de20e8:	2600      	movs	r6, #0
c0de20ea:	f7ff fe71 	bl	c0de1dd0 <pb_read>
c0de20ee:	b120      	cbz	r0, c0de20fa <pb_close_string_substream+0x20>
c0de20f0:	6860      	ldr	r0, [r4, #4]
c0de20f2:	68e1      	ldr	r1, [r4, #12]
c0de20f4:	2601      	movs	r6, #1
c0de20f6:	6068      	str	r0, [r5, #4]
c0de20f8:	60e9      	str	r1, [r5, #12]
c0de20fa:	4630      	mov	r0, r6
c0de20fc:	bd70      	pop	{r4, r5, r6, pc}

c0de20fe <pb_decode_ex>:
c0de20fe:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2100:	b08b      	sub	sp, #44	@ 0x2c
c0de2102:	461d      	mov	r5, r3
c0de2104:	4616      	mov	r6, r2
c0de2106:	460f      	mov	r7, r1
c0de2108:	07d9      	lsls	r1, r3, #31
c0de210a:	4604      	mov	r4, r0
c0de210c:	d109      	bne.n	c0de2122 <pb_decode_ex+0x24>
c0de210e:	a801      	add	r0, sp, #4
c0de2110:	4639      	mov	r1, r7
c0de2112:	4632      	mov	r2, r6
c0de2114:	f7ff fbb6 	bl	c0de1884 <pb_field_iter_begin>
c0de2118:	b118      	cbz	r0, c0de2122 <pb_decode_ex+0x24>
c0de211a:	a801      	add	r0, sp, #4
c0de211c:	f000 f832 	bl	c0de2184 <pb_message_set_to_defaults>
c0de2120:	b308      	cbz	r0, c0de2166 <pb_decode_ex+0x68>
c0de2122:	07a8      	lsls	r0, r5, #30
c0de2124:	d407      	bmi.n	c0de2136 <pb_decode_ex+0x38>
c0de2126:	4620      	mov	r0, r4
c0de2128:	4639      	mov	r1, r7
c0de212a:	4632      	mov	r2, r6
c0de212c:	462b      	mov	r3, r5
c0de212e:	f000 f8d3 	bl	c0de22d8 <pb_decode_inner>
c0de2132:	4605      	mov	r5, r0
c0de2134:	e022      	b.n	c0de217c <pb_decode_ex+0x7e>
c0de2136:	a901      	add	r1, sp, #4
c0de2138:	4620      	mov	r0, r4
c0de213a:	f7ff ffa7 	bl	c0de208c <pb_make_string_substream>
c0de213e:	b1e0      	cbz	r0, c0de217a <pb_decode_ex+0x7c>
c0de2140:	a801      	add	r0, sp, #4
c0de2142:	4639      	mov	r1, r7
c0de2144:	4632      	mov	r2, r6
c0de2146:	462b      	mov	r3, r5
c0de2148:	f000 f8c6 	bl	c0de22d8 <pb_decode_inner>
c0de214c:	9a03      	ldr	r2, [sp, #12]
c0de214e:	4605      	mov	r5, r0
c0de2150:	b122      	cbz	r2, c0de215c <pb_decode_ex+0x5e>
c0de2152:	a801      	add	r0, sp, #4
c0de2154:	2100      	movs	r1, #0
c0de2156:	f7ff fe3b 	bl	c0de1dd0 <pb_read>
c0de215a:	b170      	cbz	r0, c0de217a <pb_decode_ex+0x7c>
c0de215c:	9802      	ldr	r0, [sp, #8]
c0de215e:	9904      	ldr	r1, [sp, #16]
c0de2160:	6060      	str	r0, [r4, #4]
c0de2162:	60e1      	str	r1, [r4, #12]
c0de2164:	e00a      	b.n	c0de217c <pb_decode_ex+0x7e>
c0de2166:	68e0      	ldr	r0, [r4, #12]
c0de2168:	f646 311c 	movw	r1, #27420	@ 0x6b1c
c0de216c:	f2c0 0100 	movt	r1, #0
c0de2170:	4479      	add	r1, pc
c0de2172:	2800      	cmp	r0, #0
c0de2174:	bf18      	it	ne
c0de2176:	4601      	movne	r1, r0
c0de2178:	60e1      	str	r1, [r4, #12]
c0de217a:	2500      	movs	r5, #0
c0de217c:	4628      	mov	r0, r5
c0de217e:	b00b      	add	sp, #44	@ 0x2c
c0de2180:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2182:	d4d4      	bmi.n	c0de212e <pb_decode_ex+0x30>

c0de2184 <pb_message_set_to_defaults>:
c0de2184:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2188:	b090      	sub	sp, #64	@ 0x40
c0de218a:	4604      	mov	r4, r0
c0de218c:	2600      	movs	r6, #0
c0de218e:	6800      	ldr	r0, [r0, #0]
c0de2190:	9605      	str	r6, [sp, #20]
c0de2192:	9604      	str	r6, [sp, #16]
c0de2194:	f810 1f0a 	ldrb.w	r1, [r0, #10]!
c0de2198:	9603      	str	r6, [sp, #12]
c0de219a:	7842      	ldrb	r2, [r0, #1]
c0de219c:	7883      	ldrb	r3, [r0, #2]
c0de219e:	78c0      	ldrb	r0, [r0, #3]
c0de21a0:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de21a4:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de21a8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de21ac:	9602      	str	r6, [sp, #8]
c0de21ae:	b1d0      	cbz	r0, c0de21e6 <pb_message_set_to_defaults+0x62>
c0de21b0:	f64f 4199 	movw	r1, #64665	@ 0xfc99
c0de21b4:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de21b8:	4479      	add	r1, pc
c0de21ba:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0de21be:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de21c2:	e9cd 0604 	strd	r0, r6, [sp, #16]
c0de21c6:	a802      	add	r0, sp, #8
c0de21c8:	a906      	add	r1, sp, #24
c0de21ca:	f10d 0207 	add.w	r2, sp, #7
c0de21ce:	f88d 6007 	strb.w	r6, [sp, #7]
c0de21d2:	f7ff fe4f 	bl	c0de1e74 <pb_decode_varint32_eof>
c0de21d6:	2800      	cmp	r0, #0
c0de21d8:	d078      	beq.n	c0de22cc <pb_message_set_to_defaults+0x148>
c0de21da:	9806      	ldr	r0, [sp, #24]
c0de21dc:	ea4f 08d0 	mov.w	r8, r0, lsr #3
c0de21e0:	f000 0b07 	and.w	fp, r0, #7
c0de21e4:	e003      	b.n	c0de21ee <pb_message_set_to_defaults+0x6a>
c0de21e6:	f04f 0b00 	mov.w	fp, #0
c0de21ea:	f04f 0800 	mov.w	r8, #0
c0de21ee:	ad06      	add	r5, sp, #24
c0de21f0:	f10d 0a08 	add.w	sl, sp, #8
c0de21f4:	7da0      	ldrb	r0, [r4, #22]
c0de21f6:	f000 010f 	and.w	r1, r0, #15
c0de21fa:	290a      	cmp	r1, #10
c0de21fc:	d110      	bne.n	c0de2220 <pb_message_set_to_defaults+0x9c>
c0de21fe:	69e0      	ldr	r0, [r4, #28]
c0de2200:	6807      	ldr	r7, [r0, #0]
c0de2202:	bf00      	nop
c0de2204:	b3af      	cbz	r7, c0de2272 <pb_message_set_to_defaults+0xee>
c0de2206:	4628      	mov	r0, r5
c0de2208:	4639      	mov	r1, r7
c0de220a:	f7ff fc16 	bl	c0de1a3a <pb_field_iter_begin_extension>
c0de220e:	b128      	cbz	r0, c0de221c <pb_message_set_to_defaults+0x98>
c0de2210:	4628      	mov	r0, r5
c0de2212:	733e      	strb	r6, [r7, #12]
c0de2214:	f7ff ffb6 	bl	c0de2184 <pb_message_set_to_defaults>
c0de2218:	2800      	cmp	r0, #0
c0de221a:	d057      	beq.n	c0de22cc <pb_message_set_to_defaults+0x148>
c0de221c:	68bf      	ldr	r7, [r7, #8]
c0de221e:	e7f1      	b.n	c0de2204 <pb_message_set_to_defaults+0x80>
c0de2220:	f000 01c0 	and.w	r1, r0, #192	@ 0xc0
c0de2224:	2980      	cmp	r1, #128	@ 0x80
c0de2226:	d01a      	beq.n	c0de225e <pb_message_set_to_defaults+0xda>
c0de2228:	bb19      	cbnz	r1, c0de2272 <pb_message_set_to_defaults+0xee>
c0de222a:	f000 0130 	and.w	r1, r0, #48	@ 0x30
c0de222e:	2930      	cmp	r1, #48	@ 0x30
c0de2230:	bf18      	it	ne
c0de2232:	2920      	cmpne	r1, #32
c0de2234:	d01b      	beq.n	c0de226e <pb_message_set_to_defaults+0xea>
c0de2236:	2910      	cmp	r1, #16
c0de2238:	d102      	bne.n	c0de2240 <pb_message_set_to_defaults+0xbc>
c0de223a:	6a21      	ldr	r1, [r4, #32]
c0de223c:	b101      	cbz	r1, c0de2240 <pb_message_set_to_defaults+0xbc>
c0de223e:	700e      	strb	r6, [r1, #0]
c0de2240:	f000 000e 	and.w	r0, r0, #14
c0de2244:	2808      	cmp	r0, #8
c0de2246:	d13c      	bne.n	c0de22c2 <pb_message_set_to_defaults+0x13e>
c0de2248:	69e2      	ldr	r2, [r4, #28]
c0de224a:	6a61      	ldr	r1, [r4, #36]	@ 0x24
c0de224c:	4628      	mov	r0, r5
c0de224e:	f7ff fb19 	bl	c0de1884 <pb_field_iter_begin>
c0de2252:	b170      	cbz	r0, c0de2272 <pb_message_set_to_defaults+0xee>
c0de2254:	4628      	mov	r0, r5
c0de2256:	f7ff ff95 	bl	c0de2184 <pb_message_set_to_defaults>
c0de225a:	b950      	cbnz	r0, c0de2272 <pb_message_set_to_defaults+0xee>
c0de225c:	e036      	b.n	c0de22cc <pb_message_set_to_defaults+0x148>
c0de225e:	f040 0010 	orr.w	r0, r0, #16
c0de2262:	69a1      	ldr	r1, [r4, #24]
c0de2264:	f000 0030 	and.w	r0, r0, #48	@ 0x30
c0de2268:	2830      	cmp	r0, #48	@ 0x30
c0de226a:	600e      	str	r6, [r1, #0]
c0de226c:	d101      	bne.n	c0de2272 <pb_message_set_to_defaults+0xee>
c0de226e:	6a20      	ldr	r0, [r4, #32]
c0de2270:	8006      	strh	r6, [r0, #0]
c0de2272:	f1b8 0f00 	cmp.w	r8, #0
c0de2276:	d01b      	beq.n	c0de22b0 <pb_message_set_to_defaults+0x12c>
c0de2278:	8a20      	ldrh	r0, [r4, #16]
c0de227a:	4580      	cmp	r8, r0
c0de227c:	d11a      	bne.n	c0de22b4 <pb_message_set_to_defaults+0x130>
c0de227e:	fa5f f18b 	uxtb.w	r1, fp
c0de2282:	4650      	mov	r0, sl
c0de2284:	4622      	mov	r2, r4
c0de2286:	f000 f98f 	bl	c0de25a8 <decode_field>
c0de228a:	b1f8      	cbz	r0, c0de22cc <pb_message_set_to_defaults+0x148>
c0de228c:	4650      	mov	r0, sl
c0de228e:	4629      	mov	r1, r5
c0de2290:	f10d 0207 	add.w	r2, sp, #7
c0de2294:	f88d 6007 	strb.w	r6, [sp, #7]
c0de2298:	f7ff fdec 	bl	c0de1e74 <pb_decode_varint32_eof>
c0de229c:	b1b0      	cbz	r0, c0de22cc <pb_message_set_to_defaults+0x148>
c0de229e:	9906      	ldr	r1, [sp, #24]
c0de22a0:	6a20      	ldr	r0, [r4, #32]
c0de22a2:	ea4f 08d1 	mov.w	r8, r1, lsr #3
c0de22a6:	f001 0b07 	and.w	fp, r1, #7
c0de22aa:	b118      	cbz	r0, c0de22b4 <pb_message_set_to_defaults+0x130>
c0de22ac:	7006      	strb	r6, [r0, #0]
c0de22ae:	e001      	b.n	c0de22b4 <pb_message_set_to_defaults+0x130>
c0de22b0:	f04f 0800 	mov.w	r8, #0
c0de22b4:	4620      	mov	r0, r4
c0de22b6:	f7ff fbed 	bl	c0de1a94 <pb_field_iter_next>
c0de22ba:	2800      	cmp	r0, #0
c0de22bc:	f47f af9a 	bne.w	c0de21f4 <pb_message_set_to_defaults+0x70>
c0de22c0:	e008      	b.n	c0de22d4 <pb_message_set_to_defaults+0x150>
c0de22c2:	69e0      	ldr	r0, [r4, #28]
c0de22c4:	8a61      	ldrh	r1, [r4, #18]
c0de22c6:	f006 f8f1 	bl	c0de84ac <__aeabi_memclr>
c0de22ca:	e7d2      	b.n	c0de2272 <pb_message_set_to_defaults+0xee>
c0de22cc:	2000      	movs	r0, #0
c0de22ce:	b010      	add	sp, #64	@ 0x40
c0de22d0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de22d4:	2001      	movs	r0, #1
c0de22d6:	e7fa      	b.n	c0de22ce <pb_message_set_to_defaults+0x14a>

c0de22d8 <pb_decode_inner>:
c0de22d8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de22dc:	b09e      	sub	sp, #120	@ 0x78
c0de22de:	4683      	mov	fp, r0
c0de22e0:	2000      	movs	r0, #0
c0de22e2:	ac06      	add	r4, sp, #24
c0de22e4:	f8ad 004e 	strh.w	r0, [sp, #78]	@ 0x4e
c0de22e8:	e9cd 0010 	strd	r0, r0, [sp, #64]	@ 0x40
c0de22ec:	4620      	mov	r0, r4
c0de22ee:	461d      	mov	r5, r3
c0de22f0:	f7ff fac8 	bl	c0de1884 <pb_field_iter_begin>
c0de22f4:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de22f8:	2800      	cmp	r0, #0
c0de22fa:	f000 80e5 	beq.w	c0de24c8 <pb_decode_inner+0x1f0>
c0de22fe:	f104 0014 	add.w	r0, r4, #20
c0de2302:	9003      	str	r0, [sp, #12]
c0de2304:	f64f 70ff 	movw	r0, #65535	@ 0xffff
c0de2308:	2600      	movs	r6, #0
c0de230a:	9004      	str	r0, [sp, #16]
c0de230c:	2000      	movs	r0, #0
c0de230e:	9501      	str	r5, [sp, #4]
c0de2310:	9002      	str	r0, [sp, #8]
c0de2312:	bf00      	nop
c0de2314:	2000      	movs	r0, #0
c0de2316:	f88d 0017 	strb.w	r0, [sp, #23]
c0de231a:	4658      	mov	r0, fp
c0de231c:	a914      	add	r1, sp, #80	@ 0x50
c0de231e:	f10d 0217 	add.w	r2, sp, #23
c0de2322:	f7ff fda7 	bl	c0de1e74 <pb_decode_varint32_eof>
c0de2326:	2800      	cmp	r0, #0
c0de2328:	f000 80ac 	beq.w	c0de2484 <pb_decode_inner+0x1ac>
c0de232c:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de232e:	08c7      	lsrs	r7, r0, #3
c0de2330:	f000 80ac 	beq.w	c0de248c <pb_decode_inner+0x1b4>
c0de2334:	f000 0a07 	and.w	sl, r0, #7
c0de2338:	4620      	mov	r0, r4
c0de233a:	4639      	mov	r1, r7
c0de233c:	f7ff fbf0 	bl	c0de1b20 <pb_field_iter_find>
c0de2340:	b128      	cbz	r0, c0de234e <pb_decode_inner+0x76>
c0de2342:	f89d 002e 	ldrb.w	r0, [sp, #46]	@ 0x2e
c0de2346:	f000 010f 	and.w	r1, r0, #15
c0de234a:	290a      	cmp	r1, #10
c0de234c:	d156      	bne.n	c0de23fc <pb_decode_inner+0x124>
c0de234e:	42b7      	cmp	r7, r6
c0de2350:	d34e      	bcc.n	c0de23f0 <pb_decode_inner+0x118>
c0de2352:	f8bd 6020 	ldrh.w	r6, [sp, #32]
c0de2356:	bf00      	nop
c0de2358:	f89d 002e 	ldrb.w	r0, [sp, #46]	@ 0x2e
c0de235c:	f000 050f 	and.w	r5, r0, #15
c0de2360:	2d0a      	cmp	r5, #10
c0de2362:	d006      	beq.n	c0de2372 <pb_decode_inner+0x9a>
c0de2364:	4620      	mov	r0, r4
c0de2366:	f7ff fb95 	bl	c0de1a94 <pb_field_iter_next>
c0de236a:	f8bd 0020 	ldrh.w	r0, [sp, #32]
c0de236e:	42b0      	cmp	r0, r6
c0de2370:	d1f2      	bne.n	c0de2358 <pb_decode_inner+0x80>
c0de2372:	f8bd 6028 	ldrh.w	r6, [sp, #40]	@ 0x28
c0de2376:	2d0a      	cmp	r5, #10
c0de2378:	bf18      	it	ne
c0de237a:	f04f 36ff 	movne.w	r6, #4294967295	@ 0xffffffff
c0de237e:	42b7      	cmp	r7, r6
c0de2380:	d336      	bcc.n	c0de23f0 <pb_decode_inner+0x118>
c0de2382:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de2384:	f8d0 8000 	ldr.w	r8, [r0]
c0de2388:	f1b8 0f00 	cmp.w	r8, #0
c0de238c:	d030      	beq.n	c0de23f0 <pb_decode_inner+0x118>
c0de238e:	4654      	mov	r4, sl
c0de2390:	f8db a008 	ldr.w	sl, [fp, #8]
c0de2394:	4650      	mov	r0, sl
c0de2396:	bf00      	nop
c0de2398:	4582      	cmp	sl, r0
c0de239a:	d126      	bne.n	c0de23ea <pb_decode_inner+0x112>
c0de239c:	f8d8 0000 	ldr.w	r0, [r8]
c0de23a0:	6805      	ldr	r5, [r0, #0]
c0de23a2:	b12d      	cbz	r5, c0de23b0 <pb_decode_inner+0xd8>
c0de23a4:	4658      	mov	r0, fp
c0de23a6:	4641      	mov	r1, r8
c0de23a8:	463a      	mov	r2, r7
c0de23aa:	4623      	mov	r3, r4
c0de23ac:	47a8      	blx	r5
c0de23ae:	e012      	b.n	c0de23d6 <pb_decode_inner+0xfe>
c0de23b0:	a814      	add	r0, sp, #80	@ 0x50
c0de23b2:	4641      	mov	r1, r8
c0de23b4:	f7ff fb41 	bl	c0de1a3a <pb_field_iter_begin_extension>
c0de23b8:	2800      	cmp	r0, #0
c0de23ba:	f000 80c8 	beq.w	c0de254e <pb_decode_inner+0x276>
c0de23be:	f8bd 0060 	ldrh.w	r0, [sp, #96]	@ 0x60
c0de23c2:	4287      	cmp	r7, r0
c0de23c4:	d10a      	bne.n	c0de23dc <pb_decode_inner+0x104>
c0de23c6:	2001      	movs	r0, #1
c0de23c8:	f888 000c 	strb.w	r0, [r8, #12]
c0de23cc:	4658      	mov	r0, fp
c0de23ce:	4621      	mov	r1, r4
c0de23d0:	aa14      	add	r2, sp, #80	@ 0x50
c0de23d2:	f000 f8e9 	bl	c0de25a8 <decode_field>
c0de23d6:	2800      	cmp	r0, #0
c0de23d8:	f000 80c5 	beq.w	c0de2566 <pb_decode_inner+0x28e>
c0de23dc:	f8d8 8008 	ldr.w	r8, [r8, #8]
c0de23e0:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de23e4:	f1b8 0f00 	cmp.w	r8, #0
c0de23e8:	d1d6      	bne.n	c0de2398 <pb_decode_inner+0xc0>
c0de23ea:	4582      	cmp	sl, r0
c0de23ec:	46a2      	mov	sl, r4
c0de23ee:	d142      	bne.n	c0de2476 <pb_decode_inner+0x19e>
c0de23f0:	4658      	mov	r0, fp
c0de23f2:	4651      	mov	r1, sl
c0de23f4:	f7ff fe08 	bl	c0de2008 <pb_skip_field>
c0de23f8:	e03b      	b.n	c0de2472 <pb_decode_inner+0x19a>
c0de23fa:	bf00      	nop
c0de23fc:	f000 0130 	and.w	r1, r0, #48	@ 0x30
c0de2400:	2920      	cmp	r1, #32
c0de2402:	d11c      	bne.n	c0de243e <pb_decode_inner+0x166>
c0de2404:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de2406:	9a03      	ldr	r2, [sp, #12]
c0de2408:	9b04      	ldr	r3, [sp, #16]
c0de240a:	4291      	cmp	r1, r2
c0de240c:	d118      	bne.n	c0de2440 <pb_decode_inner+0x168>
c0de240e:	f8bd 1020 	ldrh.w	r1, [sp, #32]
c0de2412:	428b      	cmp	r3, r1
c0de2414:	d00f      	beq.n	c0de2436 <pb_decode_inner+0x15e>
c0de2416:	f64f 72ff 	movw	r2, #65535	@ 0xffff
c0de241a:	4293      	cmp	r3, r2
c0de241c:	d004      	beq.n	c0de2428 <pb_decode_inner+0x150>
c0de241e:	f8bd 204e 	ldrh.w	r2, [sp, #78]	@ 0x4e
c0de2422:	9b02      	ldr	r3, [sp, #8]
c0de2424:	429a      	cmp	r2, r3
c0de2426:	d146      	bne.n	c0de24b6 <pb_decode_inner+0x1de>
c0de2428:	2200      	movs	r2, #0
c0de242a:	f8ad 204e 	strh.w	r2, [sp, #78]	@ 0x4e
c0de242e:	f8bd 202c 	ldrh.w	r2, [sp, #44]	@ 0x2c
c0de2432:	460b      	mov	r3, r1
c0de2434:	9202      	str	r2, [sp, #8]
c0de2436:	f10d 014e 	add.w	r1, sp, #78	@ 0x4e
c0de243a:	910e      	str	r1, [sp, #56]	@ 0x38
c0de243c:	e000      	b.n	c0de2440 <pb_decode_inner+0x168>
c0de243e:	9b04      	ldr	r3, [sp, #16]
c0de2440:	f010 0f30 	tst.w	r0, #48	@ 0x30
c0de2444:	9304      	str	r3, [sp, #16]
c0de2446:	d10f      	bne.n	c0de2468 <pb_decode_inner+0x190>
c0de2448:	f8bd 0024 	ldrh.w	r0, [sp, #36]	@ 0x24
c0de244c:	283f      	cmp	r0, #63	@ 0x3f
c0de244e:	d80b      	bhi.n	c0de2468 <pb_decode_inner+0x190>
c0de2450:	f000 011f 	and.w	r1, r0, #31
c0de2454:	0940      	lsrs	r0, r0, #5
c0de2456:	af10      	add	r7, sp, #64	@ 0x40
c0de2458:	f857 2020 	ldr.w	r2, [r7, r0, lsl #2]
c0de245c:	2301      	movs	r3, #1
c0de245e:	fa03 f101 	lsl.w	r1, r3, r1
c0de2462:	4311      	orrs	r1, r2
c0de2464:	f847 1020 	str.w	r1, [r7, r0, lsl #2]
c0de2468:	4658      	mov	r0, fp
c0de246a:	4651      	mov	r1, sl
c0de246c:	4622      	mov	r2, r4
c0de246e:	f000 f89b 	bl	c0de25a8 <decode_field>
c0de2472:	2800      	cmp	r0, #0
c0de2474:	d077      	beq.n	c0de2566 <pb_decode_inner+0x28e>
c0de2476:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de247a:	ac06      	add	r4, sp, #24
c0de247c:	2800      	cmp	r0, #0
c0de247e:	f47f af49 	bne.w	c0de2314 <pb_decode_inner+0x3c>
c0de2482:	e00e      	b.n	c0de24a2 <pb_decode_inner+0x1ca>
c0de2484:	f89d 0017 	ldrb.w	r0, [sp, #23]
c0de2488:	b958      	cbnz	r0, c0de24a2 <pb_decode_inner+0x1ca>
c0de248a:	e06c      	b.n	c0de2566 <pb_decode_inner+0x28e>
c0de248c:	9801      	ldr	r0, [sp, #4]
c0de248e:	0740      	lsls	r0, r0, #29
c0de2490:	d407      	bmi.n	c0de24a2 <pb_decode_inner+0x1ca>
c0de2492:	f8db 000c 	ldr.w	r0, [fp, #12]
c0de2496:	f646 01d5 	movw	r1, #26837	@ 0x68d5
c0de249a:	f2c0 0100 	movt	r1, #0
c0de249e:	4479      	add	r1, pc
c0de24a0:	e05c      	b.n	c0de255c <pb_decode_inner+0x284>
c0de24a2:	9904      	ldr	r1, [sp, #16]
c0de24a4:	f64f 70ff 	movw	r0, #65535	@ 0xffff
c0de24a8:	4281      	cmp	r1, r0
c0de24aa:	d00d      	beq.n	c0de24c8 <pb_decode_inner+0x1f0>
c0de24ac:	f8bd 004e 	ldrh.w	r0, [sp, #78]	@ 0x4e
c0de24b0:	9902      	ldr	r1, [sp, #8]
c0de24b2:	4288      	cmp	r0, r1
c0de24b4:	d008      	beq.n	c0de24c8 <pb_decode_inner+0x1f0>
c0de24b6:	f8db 000c 	ldr.w	r0, [fp, #12]
c0de24ba:	f246 714d 	movw	r1, #26445	@ 0x674d
c0de24be:	f2c0 0100 	movt	r1, #0
c0de24c2:	4479      	add	r1, pc
c0de24c4:	e04a      	b.n	c0de255c <pb_decode_inner+0x284>
c0de24c6:	bf00      	nop
c0de24c8:	f8bd 5024 	ldrh.w	r5, [sp, #36]	@ 0x24
c0de24cc:	f89d 602e 	ldrb.w	r6, [sp, #46]	@ 0x2e
c0de24d0:	a806      	add	r0, sp, #24
c0de24d2:	f7ff fadf 	bl	c0de1a94 <pb_field_iter_next>
c0de24d6:	2800      	cmp	r0, #0
c0de24d8:	d1f6      	bne.n	c0de24c8 <pb_decode_inner+0x1f0>
c0de24da:	f006 0030 	and.w	r0, r6, #48	@ 0x30
c0de24de:	fab0 f080 	clz	r0, r0
c0de24e2:	f8bd 1028 	ldrh.w	r1, [sp, #40]	@ 0x28
c0de24e6:	0940      	lsrs	r0, r0, #5
c0de24e8:	2900      	cmp	r1, #0
c0de24ea:	bf18      	it	ne
c0de24ec:	2101      	movne	r1, #1
c0de24ee:	4008      	ands	r0, r1
c0de24f0:	4428      	add	r0, r5
c0de24f2:	b281      	uxth	r1, r0
c0de24f4:	2940      	cmp	r1, #64	@ 0x40
c0de24f6:	bf28      	it	cs
c0de24f8:	2040      	movcs	r0, #64	@ 0x40
c0de24fa:	b280      	uxth	r0, r0
c0de24fc:	b1e8      	cbz	r0, c0de253a <pb_decode_inner+0x262>
c0de24fe:	2820      	cmp	r0, #32
c0de2500:	ea4f 1150 	mov.w	r1, r0, lsr #5
c0de2504:	d30b      	bcc.n	c0de251e <pb_decode_inner+0x246>
c0de2506:	460a      	mov	r2, r1
c0de2508:	2901      	cmp	r1, #1
c0de250a:	bf98      	it	ls
c0de250c:	2201      	movls	r2, #1
c0de250e:	ab10      	add	r3, sp, #64	@ 0x40
c0de2510:	681f      	ldr	r7, [r3, #0]
c0de2512:	3701      	adds	r7, #1
c0de2514:	d113      	bne.n	c0de253e <pb_decode_inner+0x266>
c0de2516:	3a01      	subs	r2, #1
c0de2518:	f103 0304 	add.w	r3, r3, #4
c0de251c:	d1f8      	bne.n	c0de2510 <pb_decode_inner+0x238>
c0de251e:	f010 001f 	ands.w	r0, r0, #31
c0de2522:	d00a      	beq.n	c0de253a <pb_decode_inner+0x262>
c0de2524:	aa10      	add	r2, sp, #64	@ 0x40
c0de2526:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de252a:	f1c0 0020 	rsb	r0, r0, #32
c0de252e:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de2532:	fa22 f000 	lsr.w	r0, r2, r0
c0de2536:	4281      	cmp	r1, r0
c0de2538:	d101      	bne.n	c0de253e <pb_decode_inner+0x266>
c0de253a:	2001      	movs	r0, #1
c0de253c:	e014      	b.n	c0de2568 <pb_decode_inner+0x290>
c0de253e:	f8db 000c 	ldr.w	r0, [fp, #12]
c0de2542:	f646 11fc 	movw	r1, #27132	@ 0x69fc
c0de2546:	f2c0 0100 	movt	r1, #0
c0de254a:	4479      	add	r1, pc
c0de254c:	e006      	b.n	c0de255c <pb_decode_inner+0x284>
c0de254e:	f8db 000c 	ldr.w	r0, [fp, #12]
c0de2552:	f646 0198 	movw	r1, #26776	@ 0x6898
c0de2556:	f2c0 0100 	movt	r1, #0
c0de255a:	4479      	add	r1, pc
c0de255c:	2800      	cmp	r0, #0
c0de255e:	bf18      	it	ne
c0de2560:	4601      	movne	r1, r0
c0de2562:	f8cb 100c 	str.w	r1, [fp, #12]
c0de2566:	2000      	movs	r0, #0
c0de2568:	b01e      	add	sp, #120	@ 0x78
c0de256a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de256e <pb_decode>:
c0de256e:	2300      	movs	r3, #0
c0de2570:	f7ff bdc5 	b.w	c0de20fe <pb_decode_ex>

c0de2574 <pb_decode_fixed32>:
c0de2574:	b510      	push	{r4, lr}
c0de2576:	b082      	sub	sp, #8
c0de2578:	460c      	mov	r4, r1
c0de257a:	a901      	add	r1, sp, #4
c0de257c:	2204      	movs	r2, #4
c0de257e:	f7ff fc27 	bl	c0de1dd0 <pb_read>
c0de2582:	b108      	cbz	r0, c0de2588 <pb_decode_fixed32+0x14>
c0de2584:	9901      	ldr	r1, [sp, #4]
c0de2586:	6021      	str	r1, [r4, #0]
c0de2588:	b002      	add	sp, #8
c0de258a:	bd10      	pop	{r4, pc}

c0de258c <pb_decode_fixed64>:
c0de258c:	b510      	push	{r4, lr}
c0de258e:	b082      	sub	sp, #8
c0de2590:	460c      	mov	r4, r1
c0de2592:	4669      	mov	r1, sp
c0de2594:	2208      	movs	r2, #8
c0de2596:	f7ff fc1b 	bl	c0de1dd0 <pb_read>
c0de259a:	b118      	cbz	r0, c0de25a4 <pb_decode_fixed64+0x18>
c0de259c:	e9dd 1200 	ldrd	r1, r2, [sp]
c0de25a0:	e9c4 1200 	strd	r1, r2, [r4]
c0de25a4:	b002      	add	sp, #8
c0de25a6:	bd10      	pop	{r4, pc}

c0de25a8 <decode_field>:
c0de25a8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de25ac:	b088      	sub	sp, #32
c0de25ae:	4615      	mov	r5, r2
c0de25b0:	7d92      	ldrb	r2, [r2, #22]
c0de25b2:	4604      	mov	r4, r0
c0de25b4:	f002 03c0 	and.w	r3, r2, #192	@ 0xc0
c0de25b8:	2b80      	cmp	r3, #128	@ 0x80
c0de25ba:	d011      	beq.n	c0de25e0 <decode_field+0x38>
c0de25bc:	2b40      	cmp	r3, #64	@ 0x40
c0de25be:	d016      	beq.n	c0de25ee <decode_field+0x46>
c0de25c0:	2b00      	cmp	r3, #0
c0de25c2:	d153      	bne.n	c0de266c <decode_field+0xc4>
c0de25c4:	f3c2 1001 	ubfx	r0, r2, #4, #2
c0de25c8:	2801      	cmp	r0, #1
c0de25ca:	dc5e      	bgt.n	c0de268a <decode_field+0xe2>
c0de25cc:	2800      	cmp	r0, #0
c0de25ce:	f000 80d1 	beq.w	c0de2774 <decode_field+0x1cc>
c0de25d2:	6a28      	ldr	r0, [r5, #32]
c0de25d4:	2800      	cmp	r0, #0
c0de25d6:	f000 80cd 	beq.w	c0de2774 <decode_field+0x1cc>
c0de25da:	2101      	movs	r1, #1
c0de25dc:	7001      	strb	r1, [r0, #0]
c0de25de:	e0c9      	b.n	c0de2774 <decode_field+0x1cc>
c0de25e0:	68e0      	ldr	r0, [r4, #12]
c0de25e2:	f246 6113 	movw	r1, #26131	@ 0x6613
c0de25e6:	f2c0 0100 	movt	r1, #0
c0de25ea:	4479      	add	r1, pc
c0de25ec:	e044      	b.n	c0de2678 <decode_field+0xd0>
c0de25ee:	6828      	ldr	r0, [r5, #0]
c0de25f0:	f810 2f0e 	ldrb.w	r2, [r0, #14]!
c0de25f4:	7843      	ldrb	r3, [r0, #1]
c0de25f6:	7887      	ldrb	r7, [r0, #2]
c0de25f8:	78c0      	ldrb	r0, [r0, #3]
c0de25fa:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de25fe:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de2602:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de2606:	2800      	cmp	r0, #0
c0de2608:	d075      	beq.n	c0de26f6 <decode_field+0x14e>
c0de260a:	2902      	cmp	r1, #2
c0de260c:	d179      	bne.n	c0de2702 <decode_field+0x15a>
c0de260e:	a904      	add	r1, sp, #16
c0de2610:	4620      	mov	r0, r4
c0de2612:	f7ff fd3b 	bl	c0de208c <pb_make_string_substream>
c0de2616:	b398      	cbz	r0, c0de2680 <decode_field+0xd8>
c0de2618:	9f06      	ldr	r7, [sp, #24]
c0de261a:	ae04      	add	r6, sp, #16
c0de261c:	6828      	ldr	r0, [r5, #0]
c0de261e:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de2622:	7842      	ldrb	r2, [r0, #1]
c0de2624:	7883      	ldrb	r3, [r0, #2]
c0de2626:	78c0      	ldrb	r0, [r0, #3]
c0de2628:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de262c:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de2630:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de2634:	f005 fccc 	bl	c0de7fd0 <pic>
c0de2638:	4603      	mov	r3, r0
c0de263a:	4630      	mov	r0, r6
c0de263c:	2100      	movs	r1, #0
c0de263e:	462a      	mov	r2, r5
c0de2640:	4798      	blx	r3
c0de2642:	2800      	cmp	r0, #0
c0de2644:	f000 809d 	beq.w	c0de2782 <decode_field+0x1da>
c0de2648:	9a06      	ldr	r2, [sp, #24]
c0de264a:	b112      	cbz	r2, c0de2652 <decode_field+0xaa>
c0de264c:	42ba      	cmp	r2, r7
c0de264e:	4617      	mov	r7, r2
c0de2650:	d3e4      	bcc.n	c0de261c <decode_field+0x74>
c0de2652:	b12a      	cbz	r2, c0de2660 <decode_field+0xb8>
c0de2654:	a804      	add	r0, sp, #16
c0de2656:	2100      	movs	r1, #0
c0de2658:	2500      	movs	r5, #0
c0de265a:	f7ff fbb9 	bl	c0de1dd0 <pb_read>
c0de265e:	b180      	cbz	r0, c0de2682 <decode_field+0xda>
c0de2660:	9805      	ldr	r0, [sp, #20]
c0de2662:	9907      	ldr	r1, [sp, #28]
c0de2664:	6060      	str	r0, [r4, #4]
c0de2666:	60e1      	str	r1, [r4, #12]
c0de2668:	2501      	movs	r5, #1
c0de266a:	e00a      	b.n	c0de2682 <decode_field+0xda>
c0de266c:	68e0      	ldr	r0, [r4, #12]
c0de266e:	f246 6163 	movw	r1, #26211	@ 0x6663
c0de2672:	f2c0 0100 	movt	r1, #0
c0de2676:	4479      	add	r1, pc
c0de2678:	2800      	cmp	r0, #0
c0de267a:	bf18      	it	ne
c0de267c:	4601      	movne	r1, r0
c0de267e:	60e1      	str	r1, [r4, #12]
c0de2680:	2500      	movs	r5, #0
c0de2682:	4628      	mov	r0, r5
c0de2684:	b008      	add	sp, #32
c0de2686:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de268a:	2802      	cmp	r0, #2
c0de268c:	d15a      	bne.n	c0de2744 <decode_field+0x19c>
c0de268e:	2902      	cmp	r1, #2
c0de2690:	d164      	bne.n	c0de275c <decode_field+0x1b4>
c0de2692:	f002 000e 	and.w	r0, r2, #14
c0de2696:	2805      	cmp	r0, #5
c0de2698:	d860      	bhi.n	c0de275c <decode_field+0x1b4>
c0de269a:	6a2f      	ldr	r7, [r5, #32]
c0de269c:	69a8      	ldr	r0, [r5, #24]
c0de269e:	8a69      	ldrh	r1, [r5, #18]
c0de26a0:	883a      	ldrh	r2, [r7, #0]
c0de26a2:	fb02 0001 	mla	r0, r2, r1, r0
c0de26a6:	a904      	add	r1, sp, #16
c0de26a8:	61e8      	str	r0, [r5, #28]
c0de26aa:	4620      	mov	r0, r4
c0de26ac:	f7ff fcee 	bl	c0de208c <pb_make_string_substream>
c0de26b0:	2800      	cmp	r0, #0
c0de26b2:	d0e5      	beq.n	c0de2680 <decode_field+0xd8>
c0de26b4:	9806      	ldr	r0, [sp, #24]
c0de26b6:	b1b8      	cbz	r0, c0de26e8 <decode_field+0x140>
c0de26b8:	8838      	ldrh	r0, [r7, #0]
c0de26ba:	ae04      	add	r6, sp, #16
c0de26bc:	8aa9      	ldrh	r1, [r5, #20]
c0de26be:	b280      	uxth	r0, r0
c0de26c0:	4288      	cmp	r0, r1
c0de26c2:	f080 809e 	bcs.w	c0de2802 <decode_field+0x25a>
c0de26c6:	4630      	mov	r0, r6
c0de26c8:	4629      	mov	r1, r5
c0de26ca:	f000 f8a3 	bl	c0de2814 <decode_basic_field>
c0de26ce:	2800      	cmp	r0, #0
c0de26d0:	f000 8095 	beq.w	c0de27fe <decode_field+0x256>
c0de26d4:	8838      	ldrh	r0, [r7, #0]
c0de26d6:	3001      	adds	r0, #1
c0de26d8:	8038      	strh	r0, [r7, #0]
c0de26da:	69e9      	ldr	r1, [r5, #28]
c0de26dc:	8a6a      	ldrh	r2, [r5, #18]
c0de26de:	9b06      	ldr	r3, [sp, #24]
c0de26e0:	4411      	add	r1, r2
c0de26e2:	2b00      	cmp	r3, #0
c0de26e4:	61e9      	str	r1, [r5, #28]
c0de26e6:	d1e9      	bne.n	c0de26bc <decode_field+0x114>
c0de26e8:	2501      	movs	r5, #1
c0de26ea:	a904      	add	r1, sp, #16
c0de26ec:	4620      	mov	r0, r4
c0de26ee:	f7ff fcf4 	bl	c0de20da <pb_close_string_substream>
c0de26f2:	4005      	ands	r5, r0
c0de26f4:	e7c5      	b.n	c0de2682 <decode_field+0xda>
c0de26f6:	4620      	mov	r0, r4
c0de26f8:	b008      	add	sp, #32
c0de26fa:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de26fe:	f7ff bc83 	b.w	c0de2008 <pb_skip_field>
c0de2702:	2905      	cmp	r1, #5
c0de2704:	d044      	beq.n	c0de2790 <decode_field+0x1e8>
c0de2706:	2901      	cmp	r1, #1
c0de2708:	d048      	beq.n	c0de279c <decode_field+0x1f4>
c0de270a:	2900      	cmp	r1, #0
c0de270c:	d151      	bne.n	c0de27b2 <decode_field+0x20a>
c0de270e:	2700      	movs	r7, #0
c0de2710:	f10d 0806 	add.w	r8, sp, #6
c0de2714:	eb08 0607 	add.w	r6, r8, r7
c0de2718:	4620      	mov	r0, r4
c0de271a:	4631      	mov	r1, r6
c0de271c:	2201      	movs	r2, #1
c0de271e:	f7ff fb57 	bl	c0de1dd0 <pb_read>
c0de2722:	2800      	cmp	r0, #0
c0de2724:	d0ac      	beq.n	c0de2680 <decode_field+0xd8>
c0de2726:	f996 0000 	ldrsb.w	r0, [r6]
c0de272a:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de272e:	dc47      	bgt.n	c0de27c0 <decode_field+0x218>
c0de2730:	3701      	adds	r7, #1
c0de2732:	2f0a      	cmp	r7, #10
c0de2734:	d1ee      	bne.n	c0de2714 <decode_field+0x16c>
c0de2736:	68e0      	ldr	r0, [r4, #12]
c0de2738:	f246 71e4 	movw	r1, #26596	@ 0x67e4
c0de273c:	f2c0 0100 	movt	r1, #0
c0de2740:	4479      	add	r1, pc
c0de2742:	e799      	b.n	c0de2678 <decode_field+0xd0>
c0de2744:	8a28      	ldrh	r0, [r5, #16]
c0de2746:	6a29      	ldr	r1, [r5, #32]
c0de2748:	f002 020e 	and.w	r2, r2, #14
c0de274c:	2a08      	cmp	r2, #8
c0de274e:	8008      	strh	r0, [r1, #0]
c0de2750:	d110      	bne.n	c0de2774 <decode_field+0x1cc>
c0de2752:	69e8      	ldr	r0, [r5, #28]
c0de2754:	8a69      	ldrh	r1, [r5, #18]
c0de2756:	f005 fea9 	bl	c0de84ac <__aeabi_memclr>
c0de275a:	e00b      	b.n	c0de2774 <decode_field+0x1cc>
c0de275c:	6a29      	ldr	r1, [r5, #32]
c0de275e:	69a8      	ldr	r0, [r5, #24]
c0de2760:	8a6a      	ldrh	r2, [r5, #18]
c0de2762:	880b      	ldrh	r3, [r1, #0]
c0de2764:	fb03 0002 	mla	r0, r3, r2, r0
c0de2768:	61e8      	str	r0, [r5, #28]
c0de276a:	1c58      	adds	r0, r3, #1
c0de276c:	8008      	strh	r0, [r1, #0]
c0de276e:	8aa8      	ldrh	r0, [r5, #20]
c0de2770:	4283      	cmp	r3, r0
c0de2772:	d246      	bcs.n	c0de2802 <decode_field+0x25a>
c0de2774:	4620      	mov	r0, r4
c0de2776:	4629      	mov	r1, r5
c0de2778:	b008      	add	sp, #32
c0de277a:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de277e:	f000 b849 	b.w	c0de2814 <decode_basic_field>
c0de2782:	68e0      	ldr	r0, [r4, #12]
c0de2784:	f246 6178 	movw	r1, #26232	@ 0x6678
c0de2788:	f2c0 0100 	movt	r1, #0
c0de278c:	4479      	add	r1, pc
c0de278e:	e773      	b.n	c0de2678 <decode_field+0xd0>
c0de2790:	f10d 0106 	add.w	r1, sp, #6
c0de2794:	4620      	mov	r0, r4
c0de2796:	2204      	movs	r2, #4
c0de2798:	2404      	movs	r4, #4
c0de279a:	e004      	b.n	c0de27a6 <decode_field+0x1fe>
c0de279c:	f10d 0106 	add.w	r1, sp, #6
c0de27a0:	4620      	mov	r0, r4
c0de27a2:	2208      	movs	r2, #8
c0de27a4:	2408      	movs	r4, #8
c0de27a6:	f7ff fb13 	bl	c0de1dd0 <pb_read>
c0de27aa:	2800      	cmp	r0, #0
c0de27ac:	f43f af68 	beq.w	c0de2680 <decode_field+0xd8>
c0de27b0:	e007      	b.n	c0de27c2 <decode_field+0x21a>
c0de27b2:	68e0      	ldr	r0, [r4, #12]
c0de27b4:	f246 7178 	movw	r1, #26488	@ 0x6778
c0de27b8:	f2c0 0100 	movt	r1, #0
c0de27bc:	4479      	add	r1, pc
c0de27be:	e75b      	b.n	c0de2678 <decode_field+0xd0>
c0de27c0:	1c7c      	adds	r4, r7, #1
c0de27c2:	f24f 6087 	movw	r0, #63111	@ 0xf687
c0de27c6:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de27ca:	4478      	add	r0, pc
c0de27cc:	9004      	str	r0, [sp, #16]
c0de27ce:	f10d 0006 	add.w	r0, sp, #6
c0de27d2:	9005      	str	r0, [sp, #20]
c0de27d4:	2000      	movs	r0, #0
c0de27d6:	6829      	ldr	r1, [r5, #0]
c0de27d8:	9007      	str	r0, [sp, #28]
c0de27da:	f811 0f0e 	ldrb.w	r0, [r1, #14]!
c0de27de:	9406      	str	r4, [sp, #24]
c0de27e0:	784a      	ldrb	r2, [r1, #1]
c0de27e2:	788b      	ldrb	r3, [r1, #2]
c0de27e4:	78c9      	ldrb	r1, [r1, #3]
c0de27e6:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de27ea:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de27ee:	ea40 4301 	orr.w	r3, r0, r1, lsl #16
c0de27f2:	a804      	add	r0, sp, #16
c0de27f4:	2100      	movs	r1, #0
c0de27f6:	462a      	mov	r2, r5
c0de27f8:	4798      	blx	r3
c0de27fa:	4605      	mov	r5, r0
c0de27fc:	e741      	b.n	c0de2682 <decode_field+0xda>
c0de27fe:	9806      	ldr	r0, [sp, #24]
c0de2800:	b130      	cbz	r0, c0de2810 <decode_field+0x268>
c0de2802:	68e0      	ldr	r0, [r4, #12]
c0de2804:	f246 5125 	movw	r1, #25893	@ 0x6525
c0de2808:	f2c0 0100 	movt	r1, #0
c0de280c:	4479      	add	r1, pc
c0de280e:	e733      	b.n	c0de2678 <decode_field+0xd0>
c0de2810:	2500      	movs	r5, #0
c0de2812:	e76a      	b.n	c0de26ea <decode_field+0x142>

c0de2814 <decode_basic_field>:
c0de2814:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2816:	b08f      	sub	sp, #60	@ 0x3c
c0de2818:	460d      	mov	r5, r1
c0de281a:	7d89      	ldrb	r1, [r1, #22]
c0de281c:	4604      	mov	r4, r0
c0de281e:	f001 010f 	and.w	r1, r1, #15
c0de2822:	2905      	cmp	r1, #5
c0de2824:	dc14      	bgt.n	c0de2850 <decode_basic_field+0x3c>
c0de2826:	1e48      	subs	r0, r1, #1
c0de2828:	2803      	cmp	r0, #3
c0de282a:	d35c      	bcc.n	c0de28e6 <decode_basic_field+0xd2>
c0de282c:	1f08      	subs	r0, r1, #4
c0de282e:	2802      	cmp	r0, #2
c0de2830:	f080 808b 	bcs.w	c0de294a <decode_basic_field+0x136>
c0de2834:	8a68      	ldrh	r0, [r5, #18]
c0de2836:	2808      	cmp	r0, #8
c0de2838:	f000 8106 	beq.w	c0de2a48 <decode_basic_field+0x234>
c0de283c:	2804      	cmp	r0, #4
c0de283e:	f040 8120 	bne.w	c0de2a82 <decode_basic_field+0x26e>
c0de2842:	69e9      	ldr	r1, [r5, #28]
c0de2844:	4620      	mov	r0, r4
c0de2846:	b00f      	add	sp, #60	@ 0x3c
c0de2848:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de284c:	f7ff be92 	b.w	c0de2574 <pb_decode_fixed32>
c0de2850:	2907      	cmp	r1, #7
c0de2852:	dd61      	ble.n	c0de2918 <decode_basic_field+0x104>
c0de2854:	f1a1 0008 	sub.w	r0, r1, #8
c0de2858:	2802      	cmp	r0, #2
c0de285a:	f080 80a2 	bcs.w	c0de29a2 <decode_basic_field+0x18e>
c0de285e:	a90b      	add	r1, sp, #44	@ 0x2c
c0de2860:	4620      	mov	r0, r4
c0de2862:	f7ff fc13 	bl	c0de208c <pb_make_string_substream>
c0de2866:	2800      	cmp	r0, #0
c0de2868:	f000 8161 	beq.w	c0de2b2e <decode_basic_field+0x31a>
c0de286c:	6a69      	ldr	r1, [r5, #36]	@ 0x24
c0de286e:	2900      	cmp	r1, #0
c0de2870:	f000 80f1 	beq.w	c0de2a56 <decode_basic_field+0x242>
c0de2874:	7da8      	ldrb	r0, [r5, #22]
c0de2876:	f000 0220 	and.w	r2, r0, #32
c0de287a:	3210      	adds	r2, #16
c0de287c:	2a30      	cmp	r2, #48	@ 0x30
c0de287e:	d10b      	bne.n	c0de2898 <decode_basic_field+0x84>
c0de2880:	69ea      	ldr	r2, [r5, #28]
c0de2882:	4668      	mov	r0, sp
c0de2884:	f7fe fffe 	bl	c0de1884 <pb_field_iter_begin>
c0de2888:	b128      	cbz	r0, c0de2896 <decode_basic_field+0x82>
c0de288a:	4668      	mov	r0, sp
c0de288c:	f7ff fc7a 	bl	c0de2184 <pb_message_set_to_defaults>
c0de2890:	2800      	cmp	r0, #0
c0de2892:	f000 8136 	beq.w	c0de2b02 <decode_basic_field+0x2ee>
c0de2896:	7da8      	ldrb	r0, [r5, #22]
c0de2898:	f000 000f 	and.w	r0, r0, #15
c0de289c:	2809      	cmp	r0, #9
c0de289e:	d10b      	bne.n	c0de28b8 <decode_basic_field+0xa4>
c0de28a0:	6a28      	ldr	r0, [r5, #32]
c0de28a2:	b148      	cbz	r0, c0de28b8 <decode_basic_field+0xa4>
c0de28a4:	f850 3c08 	ldr.w	r3, [r0, #-8]
c0de28a8:	b133      	cbz	r3, c0de28b8 <decode_basic_field+0xa4>
c0de28aa:	1f02      	subs	r2, r0, #4
c0de28ac:	a80b      	add	r0, sp, #44	@ 0x2c
c0de28ae:	4629      	mov	r1, r5
c0de28b0:	4798      	blx	r3
c0de28b2:	2800      	cmp	r0, #0
c0de28b4:	f000 814c 	beq.w	c0de2b50 <decode_basic_field+0x33c>
c0de28b8:	69ea      	ldr	r2, [r5, #28]
c0de28ba:	6a69      	ldr	r1, [r5, #36]	@ 0x24
c0de28bc:	a80b      	add	r0, sp, #44	@ 0x2c
c0de28be:	2301      	movs	r3, #1
c0de28c0:	f7ff fd0a 	bl	c0de22d8 <pb_decode_inner>
c0de28c4:	4605      	mov	r5, r0
c0de28c6:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
c0de28c8:	b13a      	cbz	r2, c0de28da <decode_basic_field+0xc6>
c0de28ca:	a80b      	add	r0, sp, #44	@ 0x2c
c0de28cc:	2100      	movs	r1, #0
c0de28ce:	2600      	movs	r6, #0
c0de28d0:	f7ff fa7e 	bl	c0de1dd0 <pb_read>
c0de28d4:	2800      	cmp	r0, #0
c0de28d6:	f000 812b 	beq.w	c0de2b30 <decode_basic_field+0x31c>
c0de28da:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de28dc:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de28de:	6060      	str	r0, [r4, #4]
c0de28e0:	60e1      	str	r1, [r4, #12]
c0de28e2:	462e      	mov	r6, r5
c0de28e4:	e124      	b.n	c0de2b30 <decode_basic_field+0x31c>
c0de28e6:	2902      	cmp	r1, #2
c0de28e8:	d141      	bne.n	c0de296e <decode_basic_field+0x15a>
c0de28ea:	4669      	mov	r1, sp
c0de28ec:	4620      	mov	r0, r4
c0de28ee:	f7ff fb17 	bl	c0de1f20 <pb_decode_varint>
c0de28f2:	2800      	cmp	r0, #0
c0de28f4:	f000 811b 	beq.w	c0de2b2e <decode_basic_field+0x31a>
c0de28f8:	8a68      	ldrh	r0, [r5, #18]
c0de28fa:	2803      	cmp	r0, #3
c0de28fc:	f300 80b2 	bgt.w	c0de2a64 <decode_basic_field+0x250>
c0de2900:	2801      	cmp	r0, #1
c0de2902:	f000 80d1 	beq.w	c0de2aa8 <decode_basic_field+0x294>
c0de2906:	2802      	cmp	r0, #2
c0de2908:	f040 80bb 	bne.w	c0de2a82 <decode_basic_field+0x26e>
c0de290c:	9800      	ldr	r0, [sp, #0]
c0de290e:	69ea      	ldr	r2, [r5, #28]
c0de2910:	9901      	ldr	r1, [sp, #4]
c0de2912:	8010      	strh	r0, [r2, #0]
c0de2914:	b283      	uxth	r3, r0
c0de2916:	e0cc      	b.n	c0de2ab2 <decode_basic_field+0x29e>
c0de2918:	2906      	cmp	r1, #6
c0de291a:	d05a      	beq.n	c0de29d2 <decode_basic_field+0x1be>
c0de291c:	2907      	cmp	r1, #7
c0de291e:	d176      	bne.n	c0de2a0e <decode_basic_field+0x1fa>
c0de2920:	69ef      	ldr	r7, [r5, #28]
c0de2922:	4669      	mov	r1, sp
c0de2924:	4620      	mov	r0, r4
c0de2926:	2200      	movs	r2, #0
c0de2928:	2600      	movs	r6, #0
c0de292a:	f7ff faa3 	bl	c0de1e74 <pb_decode_varint32_eof>
c0de292e:	2800      	cmp	r0, #0
c0de2930:	f000 80fe 	beq.w	c0de2b30 <decode_basic_field+0x31c>
c0de2934:	9a00      	ldr	r2, [sp, #0]
c0de2936:	1c50      	adds	r0, r2, #1
c0de2938:	f0c0 80aa 	bcc.w	c0de2a90 <decode_basic_field+0x27c>
c0de293c:	68e0      	ldr	r0, [r4, #12]
c0de293e:	f246 51ad 	movw	r1, #26029	@ 0x65ad
c0de2942:	f2c0 0100 	movt	r1, #0
c0de2946:	4479      	add	r1, pc
c0de2948:	e0ed      	b.n	c0de2b26 <decode_basic_field+0x312>
c0de294a:	2900      	cmp	r1, #0
c0de294c:	d15f      	bne.n	c0de2a0e <decode_basic_field+0x1fa>
c0de294e:	69ed      	ldr	r5, [r5, #28]
c0de2950:	4669      	mov	r1, sp
c0de2952:	4620      	mov	r0, r4
c0de2954:	2200      	movs	r2, #0
c0de2956:	f7ff fa8d 	bl	c0de1e74 <pb_decode_varint32_eof>
c0de295a:	4606      	mov	r6, r0
c0de295c:	2800      	cmp	r0, #0
c0de295e:	f000 80e7 	beq.w	c0de2b30 <decode_basic_field+0x31c>
c0de2962:	9800      	ldr	r0, [sp, #0]
c0de2964:	2800      	cmp	r0, #0
c0de2966:	bf18      	it	ne
c0de2968:	2001      	movne	r0, #1
c0de296a:	7028      	strb	r0, [r5, #0]
c0de296c:	e0e0      	b.n	c0de2b30 <decode_basic_field+0x31c>
c0de296e:	2903      	cmp	r1, #3
c0de2970:	d154      	bne.n	c0de2a1c <decode_basic_field+0x208>
c0de2972:	4669      	mov	r1, sp
c0de2974:	4620      	mov	r0, r4
c0de2976:	f7ff fad3 	bl	c0de1f20 <pb_decode_varint>
c0de297a:	2800      	cmp	r0, #0
c0de297c:	f000 80d7 	beq.w	c0de2b2e <decode_basic_field+0x31a>
c0de2980:	e9dd 1000 	ldrd	r1, r0, [sp]
c0de2984:	2200      	movs	r2, #0
c0de2986:	ea5f 0350 	movs.w	r3, r0, lsr #1
c0de298a:	ea4f 0031 	mov.w	r0, r1, rrx
c0de298e:	f001 0101 	and.w	r1, r1, #1
c0de2992:	4249      	negs	r1, r1
c0de2994:	f162 0700 	sbc.w	r7, r2, #0
c0de2998:	8a6a      	ldrh	r2, [r5, #18]
c0de299a:	4048      	eors	r0, r1
c0de299c:	ea83 0107 	eor.w	r1, r3, r7
c0de29a0:	e048      	b.n	c0de2a34 <decode_basic_field+0x220>
c0de29a2:	290b      	cmp	r1, #11
c0de29a4:	d133      	bne.n	c0de2a0e <decode_basic_field+0x1fa>
c0de29a6:	4669      	mov	r1, sp
c0de29a8:	4620      	mov	r0, r4
c0de29aa:	2200      	movs	r2, #0
c0de29ac:	2600      	movs	r6, #0
c0de29ae:	f7ff fa61 	bl	c0de1e74 <pb_decode_varint32_eof>
c0de29b2:	2800      	cmp	r0, #0
c0de29b4:	f000 80bc 	beq.w	c0de2b30 <decode_basic_field+0x31c>
c0de29b8:	9a00      	ldr	r2, [sp, #0]
c0de29ba:	f5b2 3f80 	cmp.w	r2, #65536	@ 0x10000
c0de29be:	d21f      	bcs.n	c0de2a00 <decode_basic_field+0x1ec>
c0de29c0:	2a00      	cmp	r2, #0
c0de29c2:	f000 80a5 	beq.w	c0de2b10 <decode_basic_field+0x2fc>
c0de29c6:	8a68      	ldrh	r0, [r5, #18]
c0de29c8:	4282      	cmp	r2, r0
c0de29ca:	f040 80a6 	bne.w	c0de2b1a <decode_basic_field+0x306>
c0de29ce:	69e9      	ldr	r1, [r5, #28]
c0de29d0:	e0b4      	b.n	c0de2b3c <decode_basic_field+0x328>
c0de29d2:	4669      	mov	r1, sp
c0de29d4:	4620      	mov	r0, r4
c0de29d6:	2200      	movs	r2, #0
c0de29d8:	2600      	movs	r6, #0
c0de29da:	f7ff fa4b 	bl	c0de1e74 <pb_decode_varint32_eof>
c0de29de:	2800      	cmp	r0, #0
c0de29e0:	f000 80a6 	beq.w	c0de2b30 <decode_basic_field+0x31c>
c0de29e4:	9a00      	ldr	r2, [sp, #0]
c0de29e6:	f5b2 3f80 	cmp.w	r2, #65536	@ 0x10000
c0de29ea:	d209      	bcs.n	c0de2a00 <decode_basic_field+0x1ec>
c0de29ec:	7da8      	ldrb	r0, [r5, #22]
c0de29ee:	f000 00c0 	and.w	r0, r0, #192	@ 0xc0
c0de29f2:	2880      	cmp	r0, #128	@ 0x80
c0de29f4:	d051      	beq.n	c0de2a9a <decode_basic_field+0x286>
c0de29f6:	8a68      	ldrh	r0, [r5, #18]
c0de29f8:	1c91      	adds	r1, r2, #2
c0de29fa:	4281      	cmp	r1, r0
c0de29fc:	f240 809b 	bls.w	c0de2b36 <decode_basic_field+0x322>
c0de2a00:	68e0      	ldr	r0, [r4, #12]
c0de2a02:	f246 314f 	movw	r1, #25423	@ 0x634f
c0de2a06:	f2c0 0100 	movt	r1, #0
c0de2a0a:	4479      	add	r1, pc
c0de2a0c:	e08b      	b.n	c0de2b26 <decode_basic_field+0x312>
c0de2a0e:	68e0      	ldr	r0, [r4, #12]
c0de2a10:	f246 21c1 	movw	r1, #25281	@ 0x62c1
c0de2a14:	f2c0 0100 	movt	r1, #0
c0de2a18:	4479      	add	r1, pc
c0de2a1a:	e084      	b.n	c0de2b26 <decode_basic_field+0x312>
c0de2a1c:	4669      	mov	r1, sp
c0de2a1e:	4620      	mov	r0, r4
c0de2a20:	f7ff fa7e 	bl	c0de1f20 <pb_decode_varint>
c0de2a24:	2800      	cmp	r0, #0
c0de2a26:	f000 8082 	beq.w	c0de2b2e <decode_basic_field+0x31a>
c0de2a2a:	8a6a      	ldrh	r2, [r5, #18]
c0de2a2c:	9800      	ldr	r0, [sp, #0]
c0de2a2e:	2a08      	cmp	r2, #8
c0de2a30:	d01d      	beq.n	c0de2a6e <decode_basic_field+0x25a>
c0de2a32:	17c1      	asrs	r1, r0, #31
c0de2a34:	2a03      	cmp	r2, #3
c0de2a36:	dc1c      	bgt.n	c0de2a72 <decode_basic_field+0x25e>
c0de2a38:	2a01      	cmp	r2, #1
c0de2a3a:	d04c      	beq.n	c0de2ad6 <decode_basic_field+0x2c2>
c0de2a3c:	2a02      	cmp	r2, #2
c0de2a3e:	d120      	bne.n	c0de2a82 <decode_basic_field+0x26e>
c0de2a40:	69ea      	ldr	r2, [r5, #28]
c0de2a42:	b203      	sxth	r3, r0
c0de2a44:	8010      	strh	r0, [r2, #0]
c0de2a46:	e049      	b.n	c0de2adc <decode_basic_field+0x2c8>
c0de2a48:	69e9      	ldr	r1, [r5, #28]
c0de2a4a:	4620      	mov	r0, r4
c0de2a4c:	b00f      	add	sp, #60	@ 0x3c
c0de2a4e:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de2a52:	f7ff bd9b 	b.w	c0de258c <pb_decode_fixed64>
c0de2a56:	68e0      	ldr	r0, [r4, #12]
c0de2a58:	f246 21e0 	movw	r1, #25312	@ 0x62e0
c0de2a5c:	f2c0 0100 	movt	r1, #0
c0de2a60:	4479      	add	r1, pc
c0de2a62:	e060      	b.n	c0de2b26 <decode_basic_field+0x312>
c0de2a64:	2804      	cmp	r0, #4
c0de2a66:	d026      	beq.n	c0de2ab6 <decode_basic_field+0x2a2>
c0de2a68:	2808      	cmp	r0, #8
c0de2a6a:	d10a      	bne.n	c0de2a82 <decode_basic_field+0x26e>
c0de2a6c:	9800      	ldr	r0, [sp, #0]
c0de2a6e:	9901      	ldr	r1, [sp, #4]
c0de2a70:	e003      	b.n	c0de2a7a <decode_basic_field+0x266>
c0de2a72:	2a04      	cmp	r2, #4
c0de2a74:	d034      	beq.n	c0de2ae0 <decode_basic_field+0x2cc>
c0de2a76:	2a08      	cmp	r2, #8
c0de2a78:	d103      	bne.n	c0de2a82 <decode_basic_field+0x26e>
c0de2a7a:	69ea      	ldr	r2, [r5, #28]
c0de2a7c:	e9c2 0100 	strd	r0, r1, [r2]
c0de2a80:	e036      	b.n	c0de2af0 <decode_basic_field+0x2dc>
c0de2a82:	68e0      	ldr	r0, [r4, #12]
c0de2a84:	f246 11ae 	movw	r1, #25006	@ 0x61ae
c0de2a88:	f2c0 0100 	movt	r1, #0
c0de2a8c:	4479      	add	r1, pc
c0de2a8e:	e04a      	b.n	c0de2b26 <decode_basic_field+0x312>
c0de2a90:	7da9      	ldrb	r1, [r5, #22]
c0de2a92:	f001 01c0 	and.w	r1, r1, #192	@ 0xc0
c0de2a96:	2980      	cmp	r1, #128	@ 0x80
c0de2a98:	d113      	bne.n	c0de2ac2 <decode_basic_field+0x2ae>
c0de2a9a:	68e0      	ldr	r0, [r4, #12]
c0de2a9c:	f246 1159 	movw	r1, #24921	@ 0x6159
c0de2aa0:	f2c0 0100 	movt	r1, #0
c0de2aa4:	4479      	add	r1, pc
c0de2aa6:	e03e      	b.n	c0de2b26 <decode_basic_field+0x312>
c0de2aa8:	9800      	ldr	r0, [sp, #0]
c0de2aaa:	69ea      	ldr	r2, [r5, #28]
c0de2aac:	9901      	ldr	r1, [sp, #4]
c0de2aae:	7010      	strb	r0, [r2, #0]
c0de2ab0:	b2c3      	uxtb	r3, r0
c0de2ab2:	2200      	movs	r2, #0
c0de2ab4:	e018      	b.n	c0de2ae8 <decode_basic_field+0x2d4>
c0de2ab6:	9800      	ldr	r0, [sp, #0]
c0de2ab8:	69ea      	ldr	r2, [r5, #28]
c0de2aba:	9901      	ldr	r1, [sp, #4]
c0de2abc:	6010      	str	r0, [r2, #0]
c0de2abe:	2200      	movs	r2, #0
c0de2ac0:	e011      	b.n	c0de2ae6 <decode_basic_field+0x2d2>
c0de2ac2:	8a69      	ldrh	r1, [r5, #18]
c0de2ac4:	4288      	cmp	r0, r1
c0de2ac6:	d93b      	bls.n	c0de2b40 <decode_basic_field+0x32c>
c0de2ac8:	68e0      	ldr	r0, [r4, #12]
c0de2aca:	f246 11a3 	movw	r1, #24995	@ 0x61a3
c0de2ace:	f2c0 0100 	movt	r1, #0
c0de2ad2:	4479      	add	r1, pc
c0de2ad4:	e027      	b.n	c0de2b26 <decode_basic_field+0x312>
c0de2ad6:	69ea      	ldr	r2, [r5, #28]
c0de2ad8:	b243      	sxtb	r3, r0
c0de2ada:	7010      	strb	r0, [r2, #0]
c0de2adc:	17da      	asrs	r2, r3, #31
c0de2ade:	e003      	b.n	c0de2ae8 <decode_basic_field+0x2d4>
c0de2ae0:	69ea      	ldr	r2, [r5, #28]
c0de2ae2:	6010      	str	r0, [r2, #0]
c0de2ae4:	17c2      	asrs	r2, r0, #31
c0de2ae6:	4603      	mov	r3, r0
c0de2ae8:	4058      	eors	r0, r3
c0de2aea:	4051      	eors	r1, r2
c0de2aec:	4308      	orrs	r0, r1
c0de2aee:	d101      	bne.n	c0de2af4 <decode_basic_field+0x2e0>
c0de2af0:	2601      	movs	r6, #1
c0de2af2:	e01d      	b.n	c0de2b30 <decode_basic_field+0x31c>
c0de2af4:	68e0      	ldr	r0, [r4, #12]
c0de2af6:	f246 11b7 	movw	r1, #25015	@ 0x61b7
c0de2afa:	f2c0 0100 	movt	r1, #0
c0de2afe:	4479      	add	r1, pc
c0de2b00:	e011      	b.n	c0de2b26 <decode_basic_field+0x312>
c0de2b02:	68e0      	ldr	r0, [r4, #12]
c0de2b04:	f246 1180 	movw	r1, #24960	@ 0x6180
c0de2b08:	f2c0 0100 	movt	r1, #0
c0de2b0c:	4479      	add	r1, pc
c0de2b0e:	e00a      	b.n	c0de2b26 <decode_basic_field+0x312>
c0de2b10:	69e8      	ldr	r0, [r5, #28]
c0de2b12:	8a69      	ldrh	r1, [r5, #18]
c0de2b14:	f005 fcca 	bl	c0de84ac <__aeabi_memclr>
c0de2b18:	e7ea      	b.n	c0de2af0 <decode_basic_field+0x2dc>
c0de2b1a:	68e0      	ldr	r0, [r4, #12]
c0de2b1c:	f246 3161 	movw	r1, #25441	@ 0x6361
c0de2b20:	f2c0 0100 	movt	r1, #0
c0de2b24:	4479      	add	r1, pc
c0de2b26:	2800      	cmp	r0, #0
c0de2b28:	bf18      	it	ne
c0de2b2a:	4601      	movne	r1, r0
c0de2b2c:	60e1      	str	r1, [r4, #12]
c0de2b2e:	2600      	movs	r6, #0
c0de2b30:	4630      	mov	r0, r6
c0de2b32:	b00f      	add	sp, #60	@ 0x3c
c0de2b34:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2b36:	69e9      	ldr	r1, [r5, #28]
c0de2b38:	f821 2b02 	strh.w	r2, [r1], #2
c0de2b3c:	4620      	mov	r0, r4
c0de2b3e:	e003      	b.n	c0de2b48 <decode_basic_field+0x334>
c0de2b40:	2000      	movs	r0, #0
c0de2b42:	54b8      	strb	r0, [r7, r2]
c0de2b44:	4620      	mov	r0, r4
c0de2b46:	4639      	mov	r1, r7
c0de2b48:	f7ff f942 	bl	c0de1dd0 <pb_read>
c0de2b4c:	4606      	mov	r6, r0
c0de2b4e:	e7ef      	b.n	c0de2b30 <decode_basic_field+0x31c>
c0de2b50:	2500      	movs	r5, #0
c0de2b52:	e6b8      	b.n	c0de28c6 <decode_basic_field+0xb2>

c0de2b54 <ed25519_pk_to_curve25519>:
c0de2b54:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2b56:	b09f      	sub	sp, #124	@ 0x7c
c0de2b58:	4604      	mov	r4, r0
c0de2b5a:	4608      	mov	r0, r1
c0de2b5c:	460e      	mov	r6, r1
c0de2b5e:	f000 f8e1 	bl	c0de2d24 <ge25519_has_small_order>
c0de2b62:	b110      	cbz	r0, c0de2b6a <ed25519_pk_to_curve25519+0x16>
c0de2b64:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2b68:	e024      	b.n	c0de2bb4 <ed25519_pk_to_curve25519+0x60>
c0de2b6a:	ad15      	add	r5, sp, #84	@ 0x54
c0de2b6c:	4628      	mov	r0, r5
c0de2b6e:	4631      	mov	r1, r6
c0de2b70:	f000 fed1 	bl	c0de3916 <fe25519_frombytes>
c0de2b74:	ae01      	add	r6, sp, #4
c0de2b76:	4630      	mov	r0, r6
c0de2b78:	f000 f913 	bl	c0de2da2 <fe25519_1>
c0de2b7c:	4630      	mov	r0, r6
c0de2b7e:	4631      	mov	r1, r6
c0de2b80:	462a      	mov	r2, r5
c0de2b82:	f000 f942 	bl	c0de2e0a <fe25519_sub>
c0de2b86:	4630      	mov	r0, r6
c0de2b88:	4631      	mov	r1, r6
c0de2b8a:	f000 f815 	bl	c0de2bb8 <fe25519_invert>
c0de2b8e:	af0b      	add	r7, sp, #44	@ 0x2c
c0de2b90:	4638      	mov	r0, r7
c0de2b92:	f000 f906 	bl	c0de2da2 <fe25519_1>
c0de2b96:	4638      	mov	r0, r7
c0de2b98:	4639      	mov	r1, r7
c0de2b9a:	462a      	mov	r2, r5
c0de2b9c:	f000 f909 	bl	c0de2db2 <fe25519_add>
c0de2ba0:	4638      	mov	r0, r7
c0de2ba2:	4639      	mov	r1, r7
c0de2ba4:	4632      	mov	r2, r6
c0de2ba6:	f000 f961 	bl	c0de2e6c <fe25519_mul>
c0de2baa:	4620      	mov	r0, r4
c0de2bac:	4639      	mov	r1, r7
c0de2bae:	f000 fff1 	bl	c0de3b94 <fe25519_tobytes>
c0de2bb2:	2000      	movs	r0, #0
c0de2bb4:	b01f      	add	sp, #124	@ 0x7c
c0de2bb6:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de2bb8 <fe25519_invert>:
c0de2bb8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2bba:	b0a9      	sub	sp, #164	@ 0xa4
c0de2bbc:	ae1f      	add	r6, sp, #124	@ 0x7c
c0de2bbe:	4604      	mov	r4, r0
c0de2bc0:	4630      	mov	r0, r6
c0de2bc2:	460f      	mov	r7, r1
c0de2bc4:	f000 fc75 	bl	c0de34b2 <fe25519_sq>
c0de2bc8:	ad15      	add	r5, sp, #84	@ 0x54
c0de2bca:	4628      	mov	r0, r5
c0de2bcc:	4631      	mov	r1, r6
c0de2bce:	f000 fc70 	bl	c0de34b2 <fe25519_sq>
c0de2bd2:	4628      	mov	r0, r5
c0de2bd4:	4629      	mov	r1, r5
c0de2bd6:	f000 fc6c 	bl	c0de34b2 <fe25519_sq>
c0de2bda:	4628      	mov	r0, r5
c0de2bdc:	4639      	mov	r1, r7
c0de2bde:	462a      	mov	r2, r5
c0de2be0:	f000 f944 	bl	c0de2e6c <fe25519_mul>
c0de2be4:	4630      	mov	r0, r6
c0de2be6:	4631      	mov	r1, r6
c0de2be8:	462a      	mov	r2, r5
c0de2bea:	f000 f93f 	bl	c0de2e6c <fe25519_mul>
c0de2bee:	af0b      	add	r7, sp, #44	@ 0x2c
c0de2bf0:	4638      	mov	r0, r7
c0de2bf2:	4631      	mov	r1, r6
c0de2bf4:	f000 fc5d 	bl	c0de34b2 <fe25519_sq>
c0de2bf8:	4628      	mov	r0, r5
c0de2bfa:	4629      	mov	r1, r5
c0de2bfc:	463a      	mov	r2, r7
c0de2bfe:	f000 f935 	bl	c0de2e6c <fe25519_mul>
c0de2c02:	4638      	mov	r0, r7
c0de2c04:	4629      	mov	r1, r5
c0de2c06:	f000 fc54 	bl	c0de34b2 <fe25519_sq>
c0de2c0a:	2504      	movs	r5, #4
c0de2c0c:	4638      	mov	r0, r7
c0de2c0e:	4639      	mov	r1, r7
c0de2c10:	f000 fc4f 	bl	c0de34b2 <fe25519_sq>
c0de2c14:	3d01      	subs	r5, #1
c0de2c16:	d1f9      	bne.n	c0de2c0c <fe25519_invert+0x54>
c0de2c18:	ad0b      	add	r5, sp, #44	@ 0x2c
c0de2c1a:	ae15      	add	r6, sp, #84	@ 0x54
c0de2c1c:	4630      	mov	r0, r6
c0de2c1e:	4629      	mov	r1, r5
c0de2c20:	4632      	mov	r2, r6
c0de2c22:	f000 f923 	bl	c0de2e6c <fe25519_mul>
c0de2c26:	4628      	mov	r0, r5
c0de2c28:	4631      	mov	r1, r6
c0de2c2a:	f000 fc42 	bl	c0de34b2 <fe25519_sq>
c0de2c2e:	2609      	movs	r6, #9
c0de2c30:	4628      	mov	r0, r5
c0de2c32:	4629      	mov	r1, r5
c0de2c34:	f000 fc3d 	bl	c0de34b2 <fe25519_sq>
c0de2c38:	3e01      	subs	r6, #1
c0de2c3a:	d1f9      	bne.n	c0de2c30 <fe25519_invert+0x78>
c0de2c3c:	ae0b      	add	r6, sp, #44	@ 0x2c
c0de2c3e:	aa15      	add	r2, sp, #84	@ 0x54
c0de2c40:	4630      	mov	r0, r6
c0de2c42:	4631      	mov	r1, r6
c0de2c44:	f000 f912 	bl	c0de2e6c <fe25519_mul>
c0de2c48:	ad01      	add	r5, sp, #4
c0de2c4a:	4628      	mov	r0, r5
c0de2c4c:	4631      	mov	r1, r6
c0de2c4e:	f000 fc30 	bl	c0de34b2 <fe25519_sq>
c0de2c52:	2613      	movs	r6, #19
c0de2c54:	4628      	mov	r0, r5
c0de2c56:	4629      	mov	r1, r5
c0de2c58:	f000 fc2b 	bl	c0de34b2 <fe25519_sq>
c0de2c5c:	3e01      	subs	r6, #1
c0de2c5e:	d1f9      	bne.n	c0de2c54 <fe25519_invert+0x9c>
c0de2c60:	ad0b      	add	r5, sp, #44	@ 0x2c
c0de2c62:	a901      	add	r1, sp, #4
c0de2c64:	4628      	mov	r0, r5
c0de2c66:	462a      	mov	r2, r5
c0de2c68:	f000 f900 	bl	c0de2e6c <fe25519_mul>
c0de2c6c:	4628      	mov	r0, r5
c0de2c6e:	4629      	mov	r1, r5
c0de2c70:	f000 fc1f 	bl	c0de34b2 <fe25519_sq>
c0de2c74:	2609      	movs	r6, #9
c0de2c76:	bf00      	nop
c0de2c78:	4628      	mov	r0, r5
c0de2c7a:	4629      	mov	r1, r5
c0de2c7c:	f000 fc19 	bl	c0de34b2 <fe25519_sq>
c0de2c80:	3e01      	subs	r6, #1
c0de2c82:	d1f9      	bne.n	c0de2c78 <fe25519_invert+0xc0>
c0de2c84:	ad0b      	add	r5, sp, #44	@ 0x2c
c0de2c86:	ae15      	add	r6, sp, #84	@ 0x54
c0de2c88:	4630      	mov	r0, r6
c0de2c8a:	4629      	mov	r1, r5
c0de2c8c:	4632      	mov	r2, r6
c0de2c8e:	f000 f8ed 	bl	c0de2e6c <fe25519_mul>
c0de2c92:	4628      	mov	r0, r5
c0de2c94:	4631      	mov	r1, r6
c0de2c96:	f000 fc0c 	bl	c0de34b2 <fe25519_sq>
c0de2c9a:	2631      	movs	r6, #49	@ 0x31
c0de2c9c:	4628      	mov	r0, r5
c0de2c9e:	4629      	mov	r1, r5
c0de2ca0:	f000 fc07 	bl	c0de34b2 <fe25519_sq>
c0de2ca4:	3e01      	subs	r6, #1
c0de2ca6:	d1f9      	bne.n	c0de2c9c <fe25519_invert+0xe4>
c0de2ca8:	ae0b      	add	r6, sp, #44	@ 0x2c
c0de2caa:	aa15      	add	r2, sp, #84	@ 0x54
c0de2cac:	4630      	mov	r0, r6
c0de2cae:	4631      	mov	r1, r6
c0de2cb0:	f000 f8dc 	bl	c0de2e6c <fe25519_mul>
c0de2cb4:	ad01      	add	r5, sp, #4
c0de2cb6:	4628      	mov	r0, r5
c0de2cb8:	4631      	mov	r1, r6
c0de2cba:	f000 fbfa 	bl	c0de34b2 <fe25519_sq>
c0de2cbe:	2663      	movs	r6, #99	@ 0x63
c0de2cc0:	4628      	mov	r0, r5
c0de2cc2:	4629      	mov	r1, r5
c0de2cc4:	f000 fbf5 	bl	c0de34b2 <fe25519_sq>
c0de2cc8:	3e01      	subs	r6, #1
c0de2cca:	d1f9      	bne.n	c0de2cc0 <fe25519_invert+0x108>
c0de2ccc:	ad0b      	add	r5, sp, #44	@ 0x2c
c0de2cce:	a901      	add	r1, sp, #4
c0de2cd0:	4628      	mov	r0, r5
c0de2cd2:	462a      	mov	r2, r5
c0de2cd4:	f000 f8ca 	bl	c0de2e6c <fe25519_mul>
c0de2cd8:	4628      	mov	r0, r5
c0de2cda:	4629      	mov	r1, r5
c0de2cdc:	f000 fbe9 	bl	c0de34b2 <fe25519_sq>
c0de2ce0:	2631      	movs	r6, #49	@ 0x31
c0de2ce2:	bf00      	nop
c0de2ce4:	4628      	mov	r0, r5
c0de2ce6:	4629      	mov	r1, r5
c0de2ce8:	f000 fbe3 	bl	c0de34b2 <fe25519_sq>
c0de2cec:	3e01      	subs	r6, #1
c0de2cee:	d1f9      	bne.n	c0de2ce4 <fe25519_invert+0x12c>
c0de2cf0:	ad15      	add	r5, sp, #84	@ 0x54
c0de2cf2:	a90b      	add	r1, sp, #44	@ 0x2c
c0de2cf4:	4628      	mov	r0, r5
c0de2cf6:	462a      	mov	r2, r5
c0de2cf8:	f000 f8b8 	bl	c0de2e6c <fe25519_mul>
c0de2cfc:	4628      	mov	r0, r5
c0de2cfe:	4629      	mov	r1, r5
c0de2d00:	f000 fbd7 	bl	c0de34b2 <fe25519_sq>
c0de2d04:	2604      	movs	r6, #4
c0de2d06:	bf00      	nop
c0de2d08:	4628      	mov	r0, r5
c0de2d0a:	4629      	mov	r1, r5
c0de2d0c:	f000 fbd1 	bl	c0de34b2 <fe25519_sq>
c0de2d10:	3e01      	subs	r6, #1
c0de2d12:	d1f9      	bne.n	c0de2d08 <fe25519_invert+0x150>
c0de2d14:	a915      	add	r1, sp, #84	@ 0x54
c0de2d16:	aa1f      	add	r2, sp, #124	@ 0x7c
c0de2d18:	4620      	mov	r0, r4
c0de2d1a:	f000 f8a7 	bl	c0de2e6c <fe25519_mul>
c0de2d1e:	b029      	add	sp, #164	@ 0xa4
c0de2d20:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2d22:	d4d4      	bmi.n	c0de2cce <fe25519_invert+0x116>

c0de2d24 <ge25519_has_small_order>:
c0de2d24:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2d26:	b082      	sub	sp, #8
c0de2d28:	2200      	movs	r2, #0
c0de2d2a:	f88d 2006 	strb.w	r2, [sp, #6]
c0de2d2e:	f8ad 2004 	strh.w	r2, [sp, #4]
c0de2d32:	9200      	str	r2, [sp, #0]
c0de2d34:	f246 2cc0 	movw	ip, #25280	@ 0x62c0
c0de2d38:	f2c0 0c00 	movt	ip, #0
c0de2d3c:	44fc      	add	ip, pc
c0de2d3e:	4669      	mov	r1, sp
c0de2d40:	46e6      	mov	lr, ip
c0de2d42:	bf00      	nop
c0de2d44:	5c83      	ldrb	r3, [r0, r2]
c0de2d46:	2400      	movs	r4, #0
c0de2d48:	4675      	mov	r5, lr
c0de2d4a:	bf00      	nop
c0de2d4c:	f815 6b20 	ldrb.w	r6, [r5], #32
c0de2d50:	5d0f      	ldrb	r7, [r1, r4]
c0de2d52:	405e      	eors	r6, r3
c0de2d54:	433e      	orrs	r6, r7
c0de2d56:	550e      	strb	r6, [r1, r4]
c0de2d58:	3401      	adds	r4, #1
c0de2d5a:	2c07      	cmp	r4, #7
c0de2d5c:	d1f6      	bne.n	c0de2d4c <ge25519_has_small_order+0x28>
c0de2d5e:	3201      	adds	r2, #1
c0de2d60:	2a1f      	cmp	r2, #31
c0de2d62:	f10e 0e01 	add.w	lr, lr, #1
c0de2d66:	d1ed      	bne.n	c0de2d44 <ge25519_has_small_order+0x20>
c0de2d68:	7fc2      	ldrb	r2, [r0, #31]
c0de2d6a:	f10c 001f 	add.w	r0, ip, #31
c0de2d6e:	f002 027f 	and.w	r2, r2, #127	@ 0x7f
c0de2d72:	2300      	movs	r3, #0
c0de2d74:	f810 7b20 	ldrb.w	r7, [r0], #32
c0de2d78:	5cce      	ldrb	r6, [r1, r3]
c0de2d7a:	4057      	eors	r7, r2
c0de2d7c:	4337      	orrs	r7, r6
c0de2d7e:	54cf      	strb	r7, [r1, r3]
c0de2d80:	3301      	adds	r3, #1
c0de2d82:	2b07      	cmp	r3, #7
c0de2d84:	d1f6      	bne.n	c0de2d74 <ge25519_has_small_order+0x50>
c0de2d86:	2000      	movs	r0, #0
c0de2d88:	2200      	movs	r2, #0
c0de2d8a:	bf00      	nop
c0de2d8c:	5c0b      	ldrb	r3, [r1, r0]
c0de2d8e:	3001      	adds	r0, #1
c0de2d90:	3b01      	subs	r3, #1
c0de2d92:	2807      	cmp	r0, #7
c0de2d94:	ea42 0203 	orr.w	r2, r2, r3
c0de2d98:	d1f8      	bne.n	c0de2d8c <ge25519_has_small_order+0x68>
c0de2d9a:	f3c2 2000 	ubfx	r0, r2, #8, #1
c0de2d9e:	b002      	add	sp, #8
c0de2da0:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de2da2 <fe25519_1>:
c0de2da2:	b580      	push	{r7, lr}
c0de2da4:	2101      	movs	r1, #1
c0de2da6:	f840 1b04 	str.w	r1, [r0], #4
c0de2daa:	2124      	movs	r1, #36	@ 0x24
c0de2dac:	f005 fb7e 	bl	c0de84ac <__aeabi_memclr>
c0de2db0:	bd80      	pop	{r7, pc}

c0de2db2 <fe25519_add>:
c0de2db2:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2db6:	e891 5400 	ldmia.w	r1, {sl, ip, lr}
c0de2dba:	e9d2 3400 	ldrd	r3, r4, [r2]
c0de2dbe:	e9d1 b503 	ldrd	fp, r5, [r1, #12]
c0de2dc2:	449a      	add	sl, r3
c0de2dc4:	6893      	ldr	r3, [r2, #8]
c0de2dc6:	44a4      	add	ip, r4
c0de2dc8:	68d4      	ldr	r4, [r2, #12]
c0de2dca:	f101 0814 	add.w	r8, r1, #20
c0de2dce:	e898 01c0 	ldmia.w	r8, {r6, r7, r8}
c0de2dd2:	449e      	add	lr, r3
c0de2dd4:	6913      	ldr	r3, [r2, #16]
c0de2dd6:	44a3      	add	fp, r4
c0de2dd8:	6954      	ldr	r4, [r2, #20]
c0de2dda:	442b      	add	r3, r5
c0de2ddc:	6995      	ldr	r5, [r2, #24]
c0de2dde:	4434      	add	r4, r6
c0de2de0:	69d6      	ldr	r6, [r2, #28]
c0de2de2:	443d      	add	r5, r7
c0de2de4:	44b0      	add	r8, r6
c0de2de6:	e9d1 7108 	ldrd	r7, r1, [r1, #32]
c0de2dea:	e9d2 6208 	ldrd	r6, r2, [r2, #32]
c0de2dee:	e880 5400 	stmia.w	r0, {sl, ip, lr}
c0de2df2:	443e      	add	r6, r7
c0de2df4:	4411      	add	r1, r2
c0de2df6:	f100 0214 	add.w	r2, r0, #20
c0de2dfa:	e9c0 b303 	strd	fp, r3, [r0, #12]
c0de2dfe:	e882 0130 	stmia.w	r2, {r4, r5, r8}
c0de2e02:	e9c0 6108 	strd	r6, r1, [r0, #32]
c0de2e06:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de2e0a <fe25519_sub>:
c0de2e0a:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2e0e:	e891 5400 	ldmia.w	r1, {sl, ip, lr}
c0de2e12:	e9d2 3400 	ldrd	r3, r4, [r2]
c0de2e16:	e9d1 b503 	ldrd	fp, r5, [r1, #12]
c0de2e1a:	ebaa 0a03 	sub.w	sl, sl, r3
c0de2e1e:	6893      	ldr	r3, [r2, #8]
c0de2e20:	ebac 0c04 	sub.w	ip, ip, r4
c0de2e24:	68d4      	ldr	r4, [r2, #12]
c0de2e26:	f101 0814 	add.w	r8, r1, #20
c0de2e2a:	e898 01c0 	ldmia.w	r8, {r6, r7, r8}
c0de2e2e:	ebae 0e03 	sub.w	lr, lr, r3
c0de2e32:	6913      	ldr	r3, [r2, #16]
c0de2e34:	ebab 0b04 	sub.w	fp, fp, r4
c0de2e38:	6954      	ldr	r4, [r2, #20]
c0de2e3a:	1aeb      	subs	r3, r5, r3
c0de2e3c:	6995      	ldr	r5, [r2, #24]
c0de2e3e:	1b34      	subs	r4, r6, r4
c0de2e40:	69d6      	ldr	r6, [r2, #28]
c0de2e42:	1b7d      	subs	r5, r7, r5
c0de2e44:	eba8 0806 	sub.w	r8, r8, r6
c0de2e48:	e9d1 7108 	ldrd	r7, r1, [r1, #32]
c0de2e4c:	e9d2 6208 	ldrd	r6, r2, [r2, #32]
c0de2e50:	e880 5400 	stmia.w	r0, {sl, ip, lr}
c0de2e54:	1bbe      	subs	r6, r7, r6
c0de2e56:	1a89      	subs	r1, r1, r2
c0de2e58:	f100 0214 	add.w	r2, r0, #20
c0de2e5c:	e9c0 b303 	strd	fp, r3, [r0, #12]
c0de2e60:	e882 0130 	stmia.w	r2, {r4, r5, r8}
c0de2e64:	e9c0 6108 	strd	r6, r1, [r0, #32]
c0de2e68:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de2e6c <fe25519_mul>:
c0de2e6c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2e70:	b0ae      	sub	sp, #184	@ 0xb8
c0de2e72:	e9d1 7300 	ldrd	r7, r3, [r1]
c0de2e76:	f8d1 b008 	ldr.w	fp, [r1, #8]
c0de2e7a:	9320      	str	r3, [sp, #128]	@ 0x80
c0de2e7c:	f8d1 800c 	ldr.w	r8, [r1, #12]
c0de2e80:	690d      	ldr	r5, [r1, #16]
c0de2e82:	f8d1 e014 	ldr.w	lr, [r1, #20]
c0de2e86:	698e      	ldr	r6, [r1, #24]
c0de2e88:	f8d1 c01c 	ldr.w	ip, [r1, #28]
c0de2e8c:	6a0b      	ldr	r3, [r1, #32]
c0de2e8e:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de2e90:	931c      	str	r3, [sp, #112]	@ 0x70
c0de2e92:	9117      	str	r1, [sp, #92]	@ 0x5c
c0de2e94:	6813      	ldr	r3, [r2, #0]
c0de2e96:	9920      	ldr	r1, [sp, #128]	@ 0x80
c0de2e98:	9206      	str	r2, [sp, #24]
c0de2e9a:	fb83 2101 	smull	r2, r1, r3, r1
c0de2e9e:	922a      	str	r2, [sp, #168]	@ 0xa8
c0de2ea0:	912d      	str	r1, [sp, #180]	@ 0xb4
c0de2ea2:	fb83 120b 	smull	r1, r2, r3, fp
c0de2ea6:	e9cd 2128 	strd	r2, r1, [sp, #160]	@ 0xa0
c0de2eaa:	fb83 1208 	smull	r1, r2, r3, r8
c0de2eae:	e9cd 2124 	strd	r2, r1, [sp, #144]	@ 0x90
c0de2eb2:	fb83 2105 	smull	r2, r1, r3, r5
c0de2eb6:	e9cd 212b 	strd	r2, r1, [sp, #172]	@ 0xac
c0de2eba:	fb83 120e 	smull	r1, r2, r3, lr
c0de2ebe:	e9cd 2126 	strd	r2, r1, [sp, #152]	@ 0x98
c0de2ec2:	fb83 2106 	smull	r2, r1, r3, r6
c0de2ec6:	961a      	str	r6, [sp, #104]	@ 0x68
c0de2ec8:	f8cd c02c 	str.w	ip, [sp, #44]	@ 0x2c
c0de2ecc:	e9cd 120e 	strd	r1, r2, [sp, #56]	@ 0x38
c0de2ed0:	fb83 620c 	smull	r6, r2, r3, ip
c0de2ed4:	f8dd c070 	ldr.w	ip, [sp, #112]	@ 0x70
c0de2ed8:	f8cd e064 	str.w	lr, [sp, #100]	@ 0x64
c0de2edc:	f8dd e018 	ldr.w	lr, [sp, #24]
c0de2ee0:	9505      	str	r5, [sp, #20]
c0de2ee2:	e9cd 621e 	strd	r6, r2, [sp, #120]	@ 0x78
c0de2ee6:	fb83 620c 	smull	r6, r2, r3, ip
c0de2eea:	9d17      	ldr	r5, [sp, #92]	@ 0x5c
c0de2eec:	961d      	str	r6, [sp, #116]	@ 0x74
c0de2eee:	e9de 1601 	ldrd	r1, r6, [lr, #4]
c0de2ef2:	f8cd 8034 	str.w	r8, [sp, #52]	@ 0x34
c0de2ef6:	fb83 4a07 	smull	r4, sl, r3, r7
c0de2efa:	9210      	str	r2, [sp, #64]	@ 0x40
c0de2efc:	fb83 2305 	smull	r2, r3, r3, r5
c0de2f00:	f04f 0813 	mov.w	r8, #19
c0de2f04:	e9cd 3211 	strd	r3, r2, [sp, #68]	@ 0x44
c0de2f08:	fb01 f308 	mul.w	r3, r1, r8
c0de2f0c:	006a      	lsls	r2, r5, #1
c0de2f0e:	9616      	str	r6, [sp, #88]	@ 0x58
c0de2f10:	fbc3 4a02 	smlal	r4, sl, r3, r2
c0de2f14:	fb06 f808 	mul.w	r8, r6, r8
c0de2f18:	9e2a      	ldr	r6, [sp, #168]	@ 0xa8
c0de2f1a:	9b2d      	ldr	r3, [sp, #180]	@ 0xb4
c0de2f1c:	f8cd b088 	str.w	fp, [sp, #136]	@ 0x88
c0de2f20:	9218      	str	r2, [sp, #96]	@ 0x60
c0de2f22:	f8de 200c 	ldr.w	r2, [lr, #12]
c0de2f26:	f8dd b02c 	ldr.w	fp, [sp, #44]	@ 0x2c
c0de2f2a:	9115      	str	r1, [sp, #84]	@ 0x54
c0de2f2c:	fbc1 6307 	smlal	r6, r3, r1, r7
c0de2f30:	2113      	movs	r1, #19
c0de2f32:	fbc8 4a0c 	smlal	r4, sl, r8, ip
c0de2f36:	fbc8 6305 	smlal	r6, r3, r8, r5
c0de2f3a:	fb02 f801 	mul.w	r8, r2, r1
c0de2f3e:	ea4f 014b 	mov.w	r1, fp, lsl #1
c0de2f42:	9104      	str	r1, [sp, #16]
c0de2f44:	fbc8 4a01 	smlal	r4, sl, r8, r1
c0de2f48:	9920      	ldr	r1, [sp, #128]	@ 0x80
c0de2f4a:	fbc8 630c 	smlal	r6, r3, r8, ip
c0de2f4e:	932d      	str	r3, [sp, #180]	@ 0xb4
c0de2f50:	962a      	str	r6, [sp, #168]	@ 0xa8
c0de2f52:	004b      	lsls	r3, r1, #1
c0de2f54:	e9dd 5128 	ldrd	r5, r1, [sp, #160]	@ 0xa0
c0de2f58:	9e15      	ldr	r6, [sp, #84]	@ 0x54
c0de2f5a:	9721      	str	r7, [sp, #132]	@ 0x84
c0de2f5c:	920a      	str	r2, [sp, #40]	@ 0x28
c0de2f5e:	4622      	mov	r2, r4
c0de2f60:	930c      	str	r3, [sp, #48]	@ 0x30
c0de2f62:	fbc6 1503 	smlal	r1, r5, r6, r3
c0de2f66:	9c16      	ldr	r4, [sp, #88]	@ 0x58
c0de2f68:	9b21      	ldr	r3, [sp, #132]	@ 0x84
c0de2f6a:	f8de 6010 	ldr.w	r6, [lr, #16]
c0de2f6e:	fbc4 1503 	smlal	r1, r5, r4, r3
c0de2f72:	9b18      	ldr	r3, [sp, #96]	@ 0x60
c0de2f74:	4694      	mov	ip, r2
c0de2f76:	fbc8 1503 	smlal	r1, r5, r8, r3
c0de2f7a:	2313      	movs	r3, #19
c0de2f7c:	9a1a      	ldr	r2, [sp, #104]	@ 0x68
c0de2f7e:	4373      	muls	r3, r6
c0de2f80:	fbc3 ca02 	smlal	ip, sl, r3, r2
c0de2f84:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de2f86:	9f2d      	ldr	r7, [sp, #180]	@ 0xb4
c0de2f88:	9614      	str	r6, [sp, #80]	@ 0x50
c0de2f8a:	fbc3 270b 	smlal	r2, r7, r3, fp
c0de2f8e:	922a      	str	r2, [sp, #168]	@ 0xa8
c0de2f90:	9a1c      	ldr	r2, [sp, #112]	@ 0x70
c0de2f92:	972d      	str	r7, [sp, #180]	@ 0xb4
c0de2f94:	fbc3 1502 	smlal	r1, r5, r3, r2
c0de2f98:	e9cd 5128 	strd	r5, r1, [sp, #160]	@ 0xa0
c0de2f9c:	e9dd 8124 	ldrd	r8, r1, [sp, #144]	@ 0x90
c0de2fa0:	9a15      	ldr	r2, [sp, #84]	@ 0x54
c0de2fa2:	9d22      	ldr	r5, [sp, #136]	@ 0x88
c0de2fa4:	9f20      	ldr	r7, [sp, #128]	@ 0x80
c0de2fa6:	fbc2 1805 	smlal	r1, r8, r2, r5
c0de2faa:	fbc4 1807 	smlal	r1, r8, r4, r7
c0de2fae:	f8dd b084 	ldr.w	fp, [sp, #132]	@ 0x84
c0de2fb2:	9f0a      	ldr	r7, [sp, #40]	@ 0x28
c0de2fb4:	9d17      	ldr	r5, [sp, #92]	@ 0x5c
c0de2fb6:	fbc7 180b 	smlal	r1, r8, r7, fp
c0de2fba:	4626      	mov	r6, r4
c0de2fbc:	f8de 4014 	ldr.w	r4, [lr, #20]
c0de2fc0:	fbc3 1805 	smlal	r1, r8, r3, r5
c0de2fc4:	9125      	str	r1, [sp, #148]	@ 0x94
c0de2fc6:	2113      	movs	r1, #19
c0de2fc8:	fb04 f301 	mul.w	r3, r4, r1
c0de2fcc:	9919      	ldr	r1, [sp, #100]	@ 0x64
c0de2fce:	9413      	str	r4, [sp, #76]	@ 0x4c
c0de2fd0:	0049      	lsls	r1, r1, #1
c0de2fd2:	fbc3 ca01 	smlal	ip, sl, r3, r1
c0de2fd6:	f8cd c08c 	str.w	ip, [sp, #140]	@ 0x8c
c0de2fda:	f8dd c034 	ldr.w	ip, [sp, #52]	@ 0x34
c0de2fde:	e9dd 542b 	ldrd	r5, r4, [sp, #172]	@ 0xac
c0de2fe2:	9107      	str	r1, [sp, #28]
c0de2fe4:	ea4f 014c 	mov.w	r1, ip, lsl #1
c0de2fe8:	9108      	str	r1, [sp, #32]
c0de2fea:	fbc2 5401 	smlal	r5, r4, r2, r1
c0de2fee:	9922      	ldr	r1, [sp, #136]	@ 0x88
c0de2ff0:	9a1a      	ldr	r2, [sp, #104]	@ 0x68
c0de2ff2:	fbc6 5401 	smlal	r5, r4, r6, r1
c0de2ff6:	990c      	ldr	r1, [sp, #48]	@ 0x30
c0de2ff8:	f8de 6018 	ldr.w	r6, [lr, #24]
c0de2ffc:	fbc7 5401 	smlal	r5, r4, r7, r1
c0de3000:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de3002:	f8dd e094 	ldr.w	lr, [sp, #148]	@ 0x94
c0de3006:	fbc1 540b 	smlal	r5, r4, r1, fp
c0de300a:	9918      	ldr	r1, [sp, #96]	@ 0x60
c0de300c:	9609      	str	r6, [sp, #36]	@ 0x24
c0de300e:	fbc3 5401 	smlal	r5, r4, r3, r1
c0de3012:	e9cd 542b 	strd	r5, r4, [sp, #172]	@ 0xac
c0de3016:	9c2d      	ldr	r4, [sp, #180]	@ 0xb4
c0de3018:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0de301a:	e9dd 5728 	ldrd	r5, r7, [sp, #160]	@ 0xa0
c0de301e:	fbc3 1402 	smlal	r1, r4, r3, r2
c0de3022:	9a04      	ldr	r2, [sp, #16]
c0de3024:	fbc3 7502 	smlal	r7, r5, r3, r2
c0de3028:	9a1c      	ldr	r2, [sp, #112]	@ 0x70
c0de302a:	e9cd 5728 	strd	r5, r7, [sp, #160]	@ 0xa0
c0de302e:	fbc3 e802 	smlal	lr, r8, r3, r2
c0de3032:	2313      	movs	r3, #19
c0de3034:	e9dd 752b 	ldrd	r7, r5, [sp, #172]	@ 0xac
c0de3038:	4373      	muls	r3, r6
c0de303a:	fbc3 7502 	smlal	r7, r5, r3, r2
c0de303e:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de3040:	9e05      	ldr	r6, [sp, #20]
c0de3042:	fbc3 1402 	smlal	r1, r4, r3, r2
c0de3046:	912a      	str	r1, [sp, #168]	@ 0xa8
c0de3048:	942d      	str	r4, [sp, #180]	@ 0xb4
c0de304a:	e9dd 4126 	ldrd	r4, r1, [sp, #152]	@ 0x98
c0de304e:	9a15      	ldr	r2, [sp, #84]	@ 0x54
c0de3050:	f8cd 8090 	str.w	r8, [sp, #144]	@ 0x90
c0de3054:	f8dd 808c 	ldr.w	r8, [sp, #140]	@ 0x8c
c0de3058:	fbc2 1406 	smlal	r1, r4, r2, r6
c0de305c:	9a16      	ldr	r2, [sp, #88]	@ 0x58
c0de305e:	fbc3 8a06 	smlal	r8, sl, r3, r6
c0de3062:	f8cd a06c 	str.w	sl, [sp, #108]	@ 0x6c
c0de3066:	fbc2 140c 	smlal	r1, r4, r2, ip
c0de306a:	f8dd a028 	ldr.w	sl, [sp, #40]	@ 0x28
c0de306e:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de3070:	e9cd 752b 	strd	r7, r5, [sp, #172]	@ 0xac
c0de3074:	fbca 1402 	smlal	r1, r4, sl, r2
c0de3078:	9a20      	ldr	r2, [sp, #128]	@ 0x80
c0de307a:	9f14      	ldr	r7, [sp, #80]	@ 0x50
c0de307c:	f8cd 808c 	str.w	r8, [sp, #140]	@ 0x8c
c0de3080:	fbc7 1402 	smlal	r1, r4, r7, r2
c0de3084:	9a13      	ldr	r2, [sp, #76]	@ 0x4c
c0de3086:	9f1a      	ldr	r7, [sp, #104]	@ 0x68
c0de3088:	fbc2 140b 	smlal	r1, r4, r2, fp
c0de308c:	9a17      	ldr	r2, [sp, #92]	@ 0x5c
c0de308e:	9d0b      	ldr	r5, [sp, #44]	@ 0x2c
c0de3090:	fbc3 1402 	smlal	r1, r4, r3, r2
c0de3094:	9426      	str	r4, [sp, #152]	@ 0x98
c0de3096:	460a      	mov	r2, r1
c0de3098:	e9dd 1428 	ldrd	r1, r4, [sp, #160]	@ 0xa0
c0de309c:	f8dd 8090 	ldr.w	r8, [sp, #144]	@ 0x90
c0de30a0:	fbc3 4107 	smlal	r4, r1, r3, r7
c0de30a4:	9f06      	ldr	r7, [sp, #24]
c0de30a6:	fbc3 e805 	smlal	lr, r8, r3, r5
c0de30aa:	f8d7 b01c 	ldr.w	fp, [r7, #28]
c0de30ae:	46f4      	mov	ip, lr
c0de30b0:	2313      	movs	r3, #19
c0de30b2:	9d1b      	ldr	r5, [sp, #108]	@ 0x6c
c0de30b4:	f8dd e020 	ldr.w	lr, [sp, #32]
c0de30b8:	9f23      	ldr	r7, [sp, #140]	@ 0x8c
c0de30ba:	fb0b f303 	mul.w	r3, fp, r3
c0de30be:	fbc3 750e 	smlal	r7, r5, r3, lr
c0de30c2:	f8cd b00c 	str.w	fp, [sp, #12]
c0de30c6:	9723      	str	r7, [sp, #140]	@ 0x8c
c0de30c8:	951b      	str	r5, [sp, #108]	@ 0x6c
c0de30ca:	f8dd b010 	ldr.w	fp, [sp, #16]
c0de30ce:	e9dd 752b 	ldrd	r7, r5, [sp, #172]	@ 0xac
c0de30d2:	fbc3 750b 	smlal	r7, r5, r3, fp
c0de30d6:	e9cd 752b 	strd	r7, r5, [sp, #172]	@ 0xac
c0de30da:	9d2d      	ldr	r5, [sp, #180]	@ 0xb4
c0de30dc:	9f2a      	ldr	r7, [sp, #168]	@ 0xa8
c0de30de:	fbc3 7506 	smlal	r7, r5, r3, r6
c0de30e2:	972a      	str	r7, [sp, #168]	@ 0xa8
c0de30e4:	952d      	str	r5, [sp, #180]	@ 0xb4
c0de30e6:	9f1c      	ldr	r7, [sp, #112]	@ 0x70
c0de30e8:	9d26      	ldr	r5, [sp, #152]	@ 0x98
c0de30ea:	fbc3 2507 	smlal	r2, r5, r3, r7
c0de30ee:	e9cd 5226 	strd	r5, r2, [sp, #152]	@ 0x98
c0de30f2:	9a07      	ldr	r2, [sp, #28]
c0de30f4:	fbc3 4102 	smlal	r4, r1, r3, r2
c0de30f8:	e9cd 1428 	strd	r1, r4, [sp, #160]	@ 0xa0
c0de30fc:	e9dd 150e 	ldrd	r1, r5, [sp, #56]	@ 0x38
c0de3100:	9c15      	ldr	r4, [sp, #84]	@ 0x54
c0de3102:	fbc4 5102 	smlal	r5, r1, r4, r2
c0de3106:	9a16      	ldr	r2, [sp, #88]	@ 0x58
c0de3108:	fbc2 5106 	smlal	r5, r1, r2, r6
c0de310c:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de310e:	9e14      	ldr	r6, [sp, #80]	@ 0x50
c0de3110:	fbca 510e 	smlal	r5, r1, sl, lr
c0de3114:	fbc6 5102 	smlal	r5, r1, r6, r2
c0de3118:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
c0de311a:	9e13      	ldr	r6, [sp, #76]	@ 0x4c
c0de311c:	f8dd a068 	ldr.w	sl, [sp, #104]	@ 0x68
c0de3120:	fbc6 5102 	smlal	r5, r1, r6, r2
c0de3124:	9a09      	ldr	r2, [sp, #36]	@ 0x24
c0de3126:	9e21      	ldr	r6, [sp, #132]	@ 0x84
c0de3128:	fbc3 c80a 	smlal	ip, r8, r3, sl
c0de312c:	fbc2 5106 	smlal	r5, r1, r2, r6
c0de3130:	9a18      	ldr	r2, [sp, #96]	@ 0x60
c0de3132:	2613      	movs	r6, #19
c0de3134:	fbc3 5102 	smlal	r5, r1, r3, r2
c0de3138:	9a06      	ldr	r2, [sp, #24]
c0de313a:	e9cd 8c24 	strd	r8, ip, [sp, #144]	@ 0x90
c0de313e:	6a13      	ldr	r3, [r2, #32]
c0de3140:	6a52      	ldr	r2, [r2, #36]	@ 0x24
c0de3142:	9300      	str	r3, [sp, #0]
c0de3144:	4373      	muls	r3, r6
c0de3146:	9201      	str	r2, [sp, #4]
c0de3148:	fbc3 5107 	smlal	r5, r1, r3, r7
c0de314c:	4372      	muls	r2, r6
c0de314e:	fbc2 510b 	smlal	r5, r1, r2, fp
c0de3152:	9302      	str	r3, [sp, #8]
c0de3154:	46bc      	mov	ip, r7
c0de3156:	e9cd 150e 	strd	r1, r5, [sp, #56]	@ 0x38
c0de315a:	f8dd e074 	ldr.w	lr, [sp, #116]	@ 0x74
c0de315e:	9b10      	ldr	r3, [sp, #64]	@ 0x40
c0de3160:	e9dd 671e 	ldrd	r6, r7, [sp, #120]	@ 0x78
c0de3164:	e9dd 5811 	ldrd	r5, r8, [sp, #68]	@ 0x44
c0de3168:	9206      	str	r2, [sp, #24]
c0de316a:	fbc4 e30b 	smlal	lr, r3, r4, fp
c0de316e:	fbc4 670a 	smlal	r6, r7, r4, sl
c0de3172:	fbc4 850c 	smlal	r8, r5, r4, ip
c0de3176:	990b      	ldr	r1, [sp, #44]	@ 0x2c
c0de3178:	e9dd b226 	ldrd	fp, r2, [sp, #152]	@ 0x98
c0de317c:	9c02      	ldr	r4, [sp, #8]
c0de317e:	f8dd c058 	ldr.w	ip, [sp, #88]	@ 0x58
c0de3182:	fbc4 2b01 	smlal	r2, fp, r4, r1
c0de3186:	9227      	str	r2, [sp, #156]	@ 0x9c
c0de3188:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de318a:	fbcc 8501 	smlal	r8, r5, ip, r1
c0de318e:	4639      	mov	r1, r7
c0de3190:	fbcc 6102 	smlal	r6, r1, ip, r2
c0de3194:	e9dd 272b 	ldrd	r2, r7, [sp, #172]	@ 0xac
c0de3198:	fbcc e30a 	smlal	lr, r3, ip, sl
c0de319c:	fbc4 270a 	smlal	r2, r7, r4, sl
c0de31a0:	e9dd c406 	ldrd	ip, r4, [sp, #24]
c0de31a4:	fbcc 2704 	smlal	r2, r7, ip, r4
c0de31a8:	e9cd 272b 	strd	r2, r7, [sp, #172]	@ 0xac
c0de31ac:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0de31ae:	9a07      	ldr	r2, [sp, #28]
c0de31b0:	fbc4 850a 	smlal	r8, r5, r4, sl
c0de31b4:	fbc4 e302 	smlal	lr, r3, r4, r2
c0de31b8:	9a27      	ldr	r2, [sp, #156]	@ 0x9c
c0de31ba:	9f13      	ldr	r7, [sp, #76]	@ 0x4c
c0de31bc:	fbcc 2b0a 	smlal	r2, fp, ip, sl
c0de31c0:	e9cd b226 	strd	fp, r2, [sp, #152]	@ 0x98
c0de31c4:	f8dd b014 	ldr.w	fp, [sp, #20]
c0de31c8:	f8dd a050 	ldr.w	sl, [sp, #80]	@ 0x50
c0de31cc:	f8dd c034 	ldr.w	ip, [sp, #52]	@ 0x34
c0de31d0:	fbc4 610b 	smlal	r6, r1, r4, fp
c0de31d4:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de31d6:	fbca 610c 	smlal	r6, r1, sl, ip
c0de31da:	fbc7 6102 	smlal	r6, r1, r7, r2
c0de31de:	9c20      	ldr	r4, [sp, #128]	@ 0x80
c0de31e0:	9f09      	ldr	r7, [sp, #36]	@ 0x24
c0de31e2:	f8cd e074 	str.w	lr, [sp, #116]	@ 0x74
c0de31e6:	fbc7 6104 	smlal	r6, r1, r7, r4
c0de31ea:	9f03      	ldr	r7, [sp, #12]
c0de31ec:	9c21      	ldr	r4, [sp, #132]	@ 0x84
c0de31ee:	f8dd e0a8 	ldr.w	lr, [sp, #168]	@ 0xa8
c0de31f2:	fbc7 6104 	smlal	r6, r1, r7, r4
c0de31f6:	9f17      	ldr	r7, [sp, #92]	@ 0x5c
c0de31f8:	9c02      	ldr	r4, [sp, #8]
c0de31fa:	fbc4 6107 	smlal	r6, r1, r4, r7
c0de31fe:	e9cd 611e 	strd	r6, r1, [sp, #120]	@ 0x78
c0de3202:	991b      	ldr	r1, [sp, #108]	@ 0x6c
c0de3204:	9f23      	ldr	r7, [sp, #140]	@ 0x8c
c0de3206:	9e19      	ldr	r6, [sp, #100]	@ 0x64
c0de3208:	fbc4 7102 	smlal	r7, r1, r4, r2
c0de320c:	911b      	str	r1, [sp, #108]	@ 0x6c
c0de320e:	992d      	ldr	r1, [sp, #180]	@ 0xb4
c0de3210:	9723      	str	r7, [sp, #140]	@ 0x8c
c0de3212:	e9dd 2728 	ldrd	r2, r7, [sp, #160]	@ 0xa0
c0de3216:	fbc4 e10c 	smlal	lr, r1, r4, ip
c0de321a:	912d      	str	r1, [sp, #180]	@ 0xb4
c0de321c:	fbc4 720b 	smlal	r7, r2, r4, fp
c0de3220:	4621      	mov	r1, r4
c0de3222:	e9dd c424 	ldrd	ip, r4, [sp, #144]	@ 0x90
c0de3226:	fbca 8506 	smlal	r8, r5, sl, r6
c0de322a:	fbc1 4c06 	smlal	r4, ip, r1, r6
c0de322e:	9e1d      	ldr	r6, [sp, #116]	@ 0x74
c0de3230:	9908      	ldr	r1, [sp, #32]
c0de3232:	fbca 630b 	smlal	r6, r3, sl, fp
c0de3236:	f8dd a018 	ldr.w	sl, [sp, #24]
c0de323a:	fbca 7201 	smlal	r7, r2, sl, r1
c0de323e:	e9cd 2728 	strd	r2, r7, [sp, #160]	@ 0xa0
c0de3242:	9f13      	ldr	r7, [sp, #76]	@ 0x4c
c0de3244:	9908      	ldr	r1, [sp, #32]
c0de3246:	fbc7 850b 	smlal	r8, r5, r7, fp
c0de324a:	fbc7 6301 	smlal	r6, r3, r7, r1
c0de324e:	9f06      	ldr	r7, [sp, #24]
c0de3250:	991c      	ldr	r1, [sp, #112]	@ 0x70
c0de3252:	fbc7 4c0b 	smlal	r4, ip, r7, fp
c0de3256:	e9cd c424 	strd	ip, r4, [sp, #144]	@ 0x90
c0de325a:	e9dd 241e 	ldrd	r2, r4, [sp, #120]	@ 0x78
c0de325e:	f8dd a088 	ldr.w	sl, [sp, #136]	@ 0x88
c0de3262:	fbc7 2401 	smlal	r2, r4, r7, r1
c0de3266:	e9cd 241e 	strd	r2, r4, [sp, #120]	@ 0x78
c0de326a:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de326c:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de326e:	4632      	mov	r2, r6
c0de3270:	fbc4 8501 	smlal	r8, r5, r4, r1
c0de3274:	fbc4 230a 	smlal	r2, r3, r4, sl
c0de3278:	9e23      	ldr	r6, [sp, #140]	@ 0x8c
c0de327a:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0de327c:	991b      	ldr	r1, [sp, #108]	@ 0x6c
c0de327e:	f8dd c00c 	ldr.w	ip, [sp, #12]
c0de3282:	fbc7 6104 	smlal	r6, r1, r7, r4
c0de3286:	fbcc 2304 	smlal	r2, r3, ip, r4
c0de328a:	f8dd b000 	ldr.w	fp, [sp]
c0de328e:	9c21      	ldr	r4, [sp, #132]	@ 0x84
c0de3290:	fbcc 850a 	smlal	r8, r5, ip, sl
c0de3294:	fbcb 2304 	smlal	r2, r3, fp, r4
c0de3298:	9c18      	ldr	r4, [sp, #96]	@ 0x60
c0de329a:	fbc7 2304 	smlal	r2, r3, r7, r4
c0de329e:	921d      	str	r2, [sp, #116]	@ 0x74
c0de32a0:	9310      	str	r3, [sp, #64]	@ 0x40
c0de32a2:	9a2d      	ldr	r2, [sp, #180]	@ 0xb4
c0de32a4:	9b20      	ldr	r3, [sp, #128]	@ 0x80
c0de32a6:	fbc7 e20a 	smlal	lr, r2, r7, sl
c0de32aa:	fbcb 8503 	smlal	r8, r5, fp, r3
c0de32ae:	9b01      	ldr	r3, [sp, #4]
c0de32b0:	9f21      	ldr	r7, [sp, #132]	@ 0x84
c0de32b2:	4674      	mov	r4, lr
c0de32b4:	fbc3 8507 	smlal	r8, r5, r3, r7
c0de32b8:	f116 7300 	adds.w	r3, r6, #33554432	@ 0x2000000
c0de32bc:	e9cd 5811 	strd	r5, r8, [sp, #68]	@ 0x44
c0de32c0:	f141 0700 	adc.w	r7, r1, #0
c0de32c4:	0e9d      	lsrs	r5, r3, #26
c0de32c6:	ea45 1587 	orr.w	r5, r5, r7, lsl #6
c0de32ca:	eb14 0805 	adds.w	r8, r4, r5
c0de32ce:	f003 437c 	and.w	r3, r3, #4227858432	@ 0xfc000000
c0de32d2:	9d2b      	ldr	r5, [sp, #172]	@ 0xac
c0de32d4:	468e      	mov	lr, r1
c0de32d6:	eb42 6ca7 	adc.w	ip, r2, r7, asr #26
c0de32da:	1af1      	subs	r1, r6, r3
c0de32dc:	9a2c      	ldr	r2, [sp, #176]	@ 0xb0
c0de32de:	912d      	str	r1, [sp, #180]	@ 0xb4
c0de32e0:	eb6e 0107 	sbc.w	r1, lr, r7
c0de32e4:	f115 7300 	adds.w	r3, r5, #33554432	@ 0x2000000
c0de32e8:	912a      	str	r1, [sp, #168]	@ 0xa8
c0de32ea:	f142 0700 	adc.w	r7, r2, #0
c0de32ee:	0e9c      	lsrs	r4, r3, #26
c0de32f0:	9927      	ldr	r1, [sp, #156]	@ 0x9c
c0de32f2:	ea44 1487 	orr.w	r4, r4, r7, lsl #6
c0de32f6:	1864      	adds	r4, r4, r1
c0de32f8:	9926      	ldr	r1, [sp, #152]	@ 0x98
c0de32fa:	f003 437c 	and.w	r3, r3, #4227858432	@ 0xfc000000
c0de32fe:	eb41 66a7 	adc.w	r6, r1, r7, asr #26
c0de3302:	1ae9      	subs	r1, r5, r3
c0de3304:	9120      	str	r1, [sp, #128]	@ 0x80
c0de3306:	eb62 0107 	sbc.w	r1, r2, r7
c0de330a:	9121      	str	r1, [sp, #132]	@ 0x84
c0de330c:	f118 7180 	adds.w	r1, r8, #16777216	@ 0x1000000
c0de3310:	912b      	str	r1, [sp, #172]	@ 0xac
c0de3312:	f14c 0500 	adc.w	r5, ip, #0
c0de3316:	0e49      	lsrs	r1, r1, #25
c0de3318:	9a29      	ldr	r2, [sp, #164]	@ 0xa4
c0de331a:	ea41 11c5 	orr.w	r1, r1, r5, lsl #7
c0de331e:	1852      	adds	r2, r2, r1
c0de3320:	9928      	ldr	r1, [sp, #160]	@ 0xa0
c0de3322:	9427      	str	r4, [sp, #156]	@ 0x9c
c0de3324:	eb41 6565 	adc.w	r5, r1, r5, asr #25
c0de3328:	f114 7180 	adds.w	r1, r4, #16777216	@ 0x1000000
c0de332c:	9128      	str	r1, [sp, #160]	@ 0xa0
c0de332e:	f146 0600 	adc.w	r6, r6, #0
c0de3332:	0e4b      	lsrs	r3, r1, #25
c0de3334:	990f      	ldr	r1, [sp, #60]	@ 0x3c
c0de3336:	ea43 13c6 	orr.w	r3, r3, r6, lsl #7
c0de333a:	185b      	adds	r3, r3, r1
c0de333c:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de333e:	922c      	str	r2, [sp, #176]	@ 0xb0
c0de3340:	eb41 6666 	adc.w	r6, r1, r6, asr #25
c0de3344:	f112 7100 	adds.w	r1, r2, #33554432	@ 0x2000000
c0de3348:	9122      	str	r1, [sp, #136]	@ 0x88
c0de334a:	f145 0500 	adc.w	r5, r5, #0
c0de334e:	ea4f 6a91 	mov.w	sl, r1, lsr #26
c0de3352:	9925      	ldr	r1, [sp, #148]	@ 0x94
c0de3354:	ea4a 1485 	orr.w	r4, sl, r5, lsl #6
c0de3358:	190f      	adds	r7, r1, r4
c0de335a:	9924      	ldr	r1, [sp, #144]	@ 0x90
c0de335c:	9a1e      	ldr	r2, [sp, #120]	@ 0x78
c0de335e:	eb41 65a5 	adc.w	r5, r1, r5, asr #26
c0de3362:	f113 7100 	adds.w	r1, r3, #33554432	@ 0x2000000
c0de3366:	f146 0600 	adc.w	r6, r6, #0
c0de336a:	ea4f 6b91 	mov.w	fp, r1, lsr #26
c0de336e:	9125      	str	r1, [sp, #148]	@ 0x94
c0de3370:	ea4b 1186 	orr.w	r1, fp, r6, lsl #6
c0de3374:	9329      	str	r3, [sp, #164]	@ 0xa4
c0de3376:	1853      	adds	r3, r2, r1
c0de3378:	991f      	ldr	r1, [sp, #124]	@ 0x7c
c0de337a:	f8cd 808c 	str.w	r8, [sp, #140]	@ 0x8c
c0de337e:	eb41 66a6 	adc.w	r6, r1, r6, asr #26
c0de3382:	f117 7b80 	adds.w	fp, r7, #16777216	@ 0x1000000
c0de3386:	f145 0500 	adc.w	r5, r5, #0
c0de338a:	ea4f 6e5b 	mov.w	lr, fp, lsr #25
c0de338e:	9920      	ldr	r1, [sp, #128]	@ 0x80
c0de3390:	ea4e 12c5 	orr.w	r2, lr, r5, lsl #7
c0de3394:	eb12 0e01 	adds.w	lr, r2, r1
c0de3398:	9921      	ldr	r1, [sp, #132]	@ 0x84
c0de339a:	ea4f 6565 	mov.w	r5, r5, asr #25
c0de339e:	414d      	adcs	r5, r1
c0de33a0:	f113 7c80 	adds.w	ip, r3, #16777216	@ 0x1000000
c0de33a4:	f146 0600 	adc.w	r6, r6, #0
c0de33a8:	ea4f 685c 	mov.w	r8, ip, lsr #25
c0de33ac:	991d      	ldr	r1, [sp, #116]	@ 0x74
c0de33ae:	931e      	str	r3, [sp, #120]	@ 0x78
c0de33b0:	ea48 13c6 	orr.w	r3, r8, r6, lsl #7
c0de33b4:	eb11 0803 	adds.w	r8, r1, r3
c0de33b8:	9910      	ldr	r1, [sp, #64]	@ 0x40
c0de33ba:	9726      	str	r7, [sp, #152]	@ 0x98
c0de33bc:	eb41 6666 	adc.w	r6, r1, r6, asr #25
c0de33c0:	f11e 7300 	adds.w	r3, lr, #33554432	@ 0x2000000
c0de33c4:	f145 0100 	adc.w	r1, r5, #0
c0de33c8:	f118 7200 	adds.w	r2, r8, #33554432	@ 0x2000000
c0de33cc:	9124      	str	r1, [sp, #144]	@ 0x90
c0de33ce:	f146 0600 	adc.w	r6, r6, #0
c0de33d2:	0e95      	lsrs	r5, r2, #26
c0de33d4:	9912      	ldr	r1, [sp, #72]	@ 0x48
c0de33d6:	ea45 1586 	orr.w	r5, r5, r6, lsl #6
c0de33da:	186d      	adds	r5, r5, r1
c0de33dc:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de33de:	f04f 0413 	mov.w	r4, #19
c0de33e2:	eb41 66a6 	adc.w	r6, r1, r6, asr #26
c0de33e6:	f115 7180 	adds.w	r1, r5, #16777216	@ 0x1000000
c0de33ea:	f146 0600 	adc.w	r6, r6, #0
c0de33ee:	ea4f 6a51 	mov.w	sl, r1, lsr #25
c0de33f2:	ea4a 17c6 	orr.w	r7, sl, r6, lsl #7
c0de33f6:	fba7 a704 	umull	sl, r7, r7, r4
c0de33fa:	1676      	asrs	r6, r6, #25
c0de33fc:	2413      	movs	r4, #19
c0de33fe:	fb06 7404 	mla	r4, r6, r4, r7
c0de3402:	9e2b      	ldr	r6, [sp, #172]	@ 0xac
c0de3404:	f8cd a084 	str.w	sl, [sp, #132]	@ 0x84
c0de3408:	f006 477e 	and.w	r7, r6, #4261412864	@ 0xfe000000
c0de340c:	9e23      	ldr	r6, [sp, #140]	@ 0x8c
c0de340e:	9420      	str	r4, [sp, #128]	@ 0x80
c0de3410:	1bf6      	subs	r6, r6, r7
c0de3412:	9623      	str	r6, [sp, #140]	@ 0x8c
c0de3414:	9e28      	ldr	r6, [sp, #160]	@ 0xa0
c0de3416:	f00b 447e 	and.w	r4, fp, #4261412864	@ 0xfe000000
c0de341a:	f006 477e 	and.w	r7, r6, #4261412864	@ 0xfe000000
c0de341e:	9e27      	ldr	r6, [sp, #156]	@ 0x9c
c0de3420:	f001 417e 	and.w	r1, r1, #4261412864	@ 0xfe000000
c0de3424:	1bf7      	subs	r7, r6, r7
c0de3426:	9e22      	ldr	r6, [sp, #136]	@ 0x88
c0de3428:	1a69      	subs	r1, r5, r1
c0de342a:	f006 4a7c 	and.w	sl, r6, #4227858432	@ 0xfc000000
c0de342e:	9e2c      	ldr	r6, [sp, #176]	@ 0xb0
c0de3430:	f002 427c 	and.w	r2, r2, #4227858432	@ 0xfc000000
c0de3434:	eba6 060a 	sub.w	r6, r6, sl
c0de3438:	962b      	str	r6, [sp, #172]	@ 0xac
c0de343a:	9e25      	ldr	r6, [sp, #148]	@ 0x94
c0de343c:	eba8 0202 	sub.w	r2, r8, r2
c0de3440:	f006 4a7c 	and.w	sl, r6, #4227858432	@ 0xfc000000
c0de3444:	9e29      	ldr	r6, [sp, #164]	@ 0xa4
c0de3446:	e9c0 2108 	strd	r2, r1, [r0, #32]
c0de344a:	eba6 060a 	sub.w	r6, r6, sl
c0de344e:	962c      	str	r6, [sp, #176]	@ 0xb0
c0de3450:	9e26      	ldr	r6, [sp, #152]	@ 0x98
c0de3452:	eba6 0a04 	sub.w	sl, r6, r4
c0de3456:	9e1e      	ldr	r6, [sp, #120]	@ 0x78
c0de3458:	f00c 447e 	and.w	r4, ip, #4261412864	@ 0xfe000000
c0de345c:	eba6 0c04 	sub.w	ip, r6, r4
c0de3460:	9e24      	ldr	r6, [sp, #144]	@ 0x90
c0de3462:	0e9c      	lsrs	r4, r3, #26
c0de3464:	ea44 1486 	orr.w	r4, r4, r6, lsl #6
c0de3468:	eb07 0b04 	add.w	fp, r7, r4
c0de346c:	9f2d      	ldr	r7, [sp, #180]	@ 0xb4
c0de346e:	9e21      	ldr	r6, [sp, #132]	@ 0x84
c0de3470:	9c2a      	ldr	r4, [sp, #168]	@ 0xa8
c0de3472:	19bf      	adds	r7, r7, r6
c0de3474:	9e20      	ldr	r6, [sp, #128]	@ 0x80
c0de3476:	f003 437c 	and.w	r3, r3, #4227858432	@ 0xfc000000
c0de347a:	4166      	adcs	r6, r4
c0de347c:	f117 7500 	adds.w	r5, r7, #33554432	@ 0x2000000
c0de3480:	f146 0600 	adc.w	r6, r6, #0
c0de3484:	0eac      	lsrs	r4, r5, #26
c0de3486:	ea44 1686 	orr.w	r6, r4, r6, lsl #6
c0de348a:	9c23      	ldr	r4, [sp, #140]	@ 0x8c
c0de348c:	f005 457c 	and.w	r5, r5, #4227858432	@ 0xfc000000
c0de3490:	ebae 0303 	sub.w	r3, lr, r3
c0de3494:	4426      	add	r6, r4
c0de3496:	1b7f      	subs	r7, r7, r5
c0de3498:	e9c0 7600 	strd	r7, r6, [r0]
c0de349c:	9f2b      	ldr	r7, [sp, #172]	@ 0xac
c0de349e:	e9c0 3b04 	strd	r3, fp, [r0, #16]
c0de34a2:	9b2c      	ldr	r3, [sp, #176]	@ 0xb0
c0de34a4:	e9c0 7a02 	strd	r7, sl, [r0, #8]
c0de34a8:	e9c0 3c06 	strd	r3, ip, [r0, #24]
c0de34ac:	b02e      	add	sp, #184	@ 0xb8
c0de34ae:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de34b2 <fe25519_sq>:
c0de34b2:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de34b6:	b0a4      	sub	sp, #144	@ 0x90
c0de34b8:	694a      	ldr	r2, [r1, #20]
c0de34ba:	e9d1 7c00 	ldrd	r7, ip, [r1]
c0de34be:	f101 0e08 	add.w	lr, r1, #8
c0de34c2:	e89e 4120 	ldmia.w	lr, {r5, r8, lr}
c0de34c6:	921c      	str	r2, [sp, #112]	@ 0x70
c0de34c8:	ea4f 024e 	mov.w	r2, lr, lsl #1
c0de34cc:	ea4f 0b47 	mov.w	fp, r7, lsl #1
c0de34d0:	9209      	str	r2, [sp, #36]	@ 0x24
c0de34d2:	fb87 2407 	smull	r2, r4, r7, r7
c0de34d6:	ea4f 034c 	mov.w	r3, ip, lsl #1
c0de34da:	920f      	str	r2, [sp, #60]	@ 0x3c
c0de34dc:	fb8b 270c 	smull	r2, r7, fp, ip
c0de34e0:	006e      	lsls	r6, r5, #1
c0de34e2:	e9cd 2716 	strd	r2, r7, [sp, #88]	@ 0x58
c0de34e6:	fb83 270c 	smull	r2, r7, r3, ip
c0de34ea:	f8cd b038 	str.w	fp, [sp, #56]	@ 0x38
c0de34ee:	9220      	str	r2, [sp, #128]	@ 0x80
c0de34f0:	9723      	str	r7, [sp, #140]	@ 0x8c
c0de34f2:	462a      	mov	r2, r5
c0de34f4:	9501      	str	r5, [sp, #4]
c0de34f6:	fb83 5705 	smull	r5, r7, r3, r5
c0de34fa:	469b      	mov	fp, r3
c0de34fc:	930a      	str	r3, [sp, #40]	@ 0x28
c0de34fe:	fb86 3c08 	smull	r3, ip, r6, r8
c0de3502:	ea4f 0a48 	mov.w	sl, r8, lsl #1
c0de3506:	e9cd 5711 	strd	r5, r7, [sp, #68]	@ 0x44
c0de350a:	fb82 2702 	smull	r2, r7, r2, r2
c0de350e:	960b      	str	r6, [sp, #44]	@ 0x2c
c0de3510:	e9cd c31e 	strd	ip, r3, [sp, #120]	@ 0x78
c0de3514:	fb8e 3606 	smull	r3, r6, lr, r6
c0de3518:	921d      	str	r2, [sp, #116]	@ 0x74
c0de351a:	9322      	str	r3, [sp, #136]	@ 0x88
c0de351c:	fb8a 320e 	smull	r3, r2, sl, lr
c0de3520:	e9cd 3214 	strd	r3, r2, [sp, #80]	@ 0x50
c0de3524:	fb8e 230e 	smull	r2, r3, lr, lr
c0de3528:	4655      	mov	r5, sl
c0de352a:	9221      	str	r2, [sp, #132]	@ 0x84
c0de352c:	f8dd a070 	ldr.w	sl, [sp, #112]	@ 0x70
c0de3530:	9a09      	ldr	r2, [sp, #36]	@ 0x24
c0de3532:	9318      	str	r3, [sp, #96]	@ 0x60
c0de3534:	fb82 230a 	smull	r2, r3, r2, sl
c0de3538:	f8cd 8014 	str.w	r8, [sp, #20]
c0de353c:	9613      	str	r6, [sp, #76]	@ 0x4c
c0de353e:	4676      	mov	r6, lr
c0de3540:	e9cd 321a 	strd	r3, r2, [sp, #104]	@ 0x68
c0de3544:	2226      	movs	r2, #38	@ 0x26
c0de3546:	f8dd 803c 	ldr.w	r8, [sp, #60]	@ 0x3c
c0de354a:	f8dd e074 	ldr.w	lr, [sp, #116]	@ 0x74
c0de354e:	fb0a f302 	mul.w	r3, sl, r2
c0de3552:	fbc3 840a 	smlal	r8, r4, r3, sl
c0de3556:	46aa      	mov	sl, r5
c0de3558:	9508      	str	r5, [sp, #32]
c0de355a:	fbc5 e70b 	smlal	lr, r7, r5, fp
c0de355e:	69ca      	ldr	r2, [r1, #28]
c0de3560:	9d0e      	ldr	r5, [sp, #56]	@ 0x38
c0de3562:	f04f 0c26 	mov.w	ip, #38	@ 0x26
c0de3566:	fbc6 e705 	smlal	lr, r7, r6, r5
c0de356a:	46b3      	mov	fp, r6
c0de356c:	9603      	str	r6, [sp, #12]
c0de356e:	fb02 fc0c 	mul.w	ip, r2, ip
c0de3572:	698e      	ldr	r6, [r1, #24]
c0de3574:	6a0b      	ldr	r3, [r1, #32]
c0de3576:	920c      	str	r2, [sp, #48]	@ 0x30
c0de3578:	fbcc e702 	smlal	lr, r7, ip, r2
c0de357c:	6a4a      	ldr	r2, [r1, #36]	@ 0x24
c0de357e:	2113      	movs	r1, #19
c0de3580:	9410      	str	r4, [sp, #64]	@ 0x40
c0de3582:	4674      	mov	r4, lr
c0de3584:	930d      	str	r3, [sp, #52]	@ 0x34
c0de3586:	ea4f 0e46 	mov.w	lr, r6, lsl #1
c0de358a:	434b      	muls	r3, r1
c0de358c:	fbc3 470e 	smlal	r4, r7, r3, lr
c0de3590:	2126      	movs	r1, #38	@ 0x26
c0de3592:	9300      	str	r3, [sp, #0]
c0de3594:	9719      	str	r7, [sp, #100]	@ 0x64
c0de3596:	fb02 f301 	mul.w	r3, r2, r1
c0de359a:	9f20      	ldr	r7, [sp, #128]	@ 0x80
c0de359c:	9923      	ldr	r1, [sp, #140]	@ 0x8c
c0de359e:	f8dd e004 	ldr.w	lr, [sp, #4]
c0de35a2:	941d      	str	r4, [sp, #116]	@ 0x74
c0de35a4:	fbce 7105 	smlal	r7, r1, lr, r5
c0de35a8:	9123      	str	r1, [sp, #140]	@ 0x8c
c0de35aa:	991c      	ldr	r1, [sp, #112]	@ 0x70
c0de35ac:	9206      	str	r2, [sp, #24]
c0de35ae:	004c      	lsls	r4, r1, #1
c0de35b0:	2113      	movs	r1, #19
c0de35b2:	fb06 f501 	mul.w	r5, r6, r1
c0de35b6:	e9dd 1216 	ldrd	r1, r2, [sp, #88]	@ 0x58
c0de35ba:	9304      	str	r3, [sp, #16]
c0de35bc:	fbc5 1204 	smlal	r1, r2, r5, r4
c0de35c0:	fbcc 120b 	smlal	r1, r2, ip, fp
c0de35c4:	46e3      	mov	fp, ip
c0de35c6:	f8dd c000 	ldr.w	ip, [sp]
c0de35ca:	9607      	str	r6, [sp, #28]
c0de35cc:	fbcc 120a 	smlal	r1, r2, ip, sl
c0de35d0:	fbc3 120e 	smlal	r1, r2, r3, lr
c0de35d4:	e9cd 1216 	strd	r1, r2, [sp, #88]	@ 0x58
c0de35d8:	9a09      	ldr	r2, [sp, #36]	@ 0x24
c0de35da:	f8dd a040 	ldr.w	sl, [sp, #64]	@ 0x40
c0de35de:	4629      	mov	r1, r5
c0de35e0:	fbc5 8a02 	smlal	r8, sl, r5, r2
c0de35e4:	9d23      	ldr	r5, [sp, #140]	@ 0x8c
c0de35e6:	4643      	mov	r3, r8
c0de35e8:	46b8      	mov	r8, r7
c0de35ea:	fbc1 8506 	smlal	r8, r5, r1, r6
c0de35ee:	fbcb 8504 	smlal	r8, r5, fp, r4
c0de35f2:	fbcc 8502 	smlal	r8, r5, ip, r2
c0de35f6:	9402      	str	r4, [sp, #8]
c0de35f8:	4664      	mov	r4, ip
c0de35fa:	f8cd 8080 	str.w	r8, [sp, #128]	@ 0x80
c0de35fe:	9523      	str	r5, [sp, #140]	@ 0x8c
c0de3600:	f8dd e038 	ldr.w	lr, [sp, #56]	@ 0x38
c0de3604:	e9dd c511 	ldrd	ip, r5, [sp, #68]	@ 0x44
c0de3608:	9e05      	ldr	r6, [sp, #20]
c0de360a:	f8dd 804c 	ldr.w	r8, [sp, #76]	@ 0x4c
c0de360e:	9a08      	ldr	r2, [sp, #32]
c0de3610:	9f22      	ldr	r7, [sp, #136]	@ 0x88
c0de3612:	990b      	ldr	r1, [sp, #44]	@ 0x2c
c0de3614:	fbc6 c50e 	smlal	ip, r5, r6, lr
c0de3618:	fbc2 7806 	smlal	r7, r8, r2, r6
c0de361c:	fbcb 3a02 	smlal	r3, sl, fp, r2
c0de3620:	9e07      	ldr	r6, [sp, #28]
c0de3622:	fbc4 3a01 	smlal	r3, sl, r4, r1
c0de3626:	fbcb c506 	smlal	ip, r5, fp, r6
c0de362a:	e9cd 3a0f 	strd	r3, sl, [sp, #60]	@ 0x3c
c0de362e:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de3630:	e9dd 231e 	ldrd	r2, r3, [sp, #120]	@ 0x78
c0de3634:	f8dd b00c 	ldr.w	fp, [sp, #12]
c0de3638:	9722      	str	r7, [sp, #136]	@ 0x88
c0de363a:	9f1c      	ldr	r7, [sp, #112]	@ 0x70
c0de363c:	f8dd a030 	ldr.w	sl, [sp, #48]	@ 0x30
c0de3640:	fbcb 3201 	smlal	r3, r2, fp, r1
c0de3644:	fbc7 320e 	smlal	r3, r2, r7, lr
c0de3648:	ea4f 074a 	mov.w	r7, sl, lsl #1
c0de364c:	fbc4 3207 	smlal	r3, r2, r4, r7
c0de3650:	9709      	str	r7, [sp, #36]	@ 0x24
c0de3652:	e9cd 231e 	strd	r2, r3, [sp, #120]	@ 0x78
c0de3656:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de3658:	9f02      	ldr	r7, [sp, #8]
c0de365a:	fbc7 2801 	smlal	r2, r8, r7, r1
c0de365e:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de3660:	fbc6 280e 	smlal	r2, r8, r6, lr
c0de3664:	fbc4 2801 	smlal	r2, r8, r4, r1
c0de3668:	9222      	str	r2, [sp, #136]	@ 0x88
c0de366a:	9e0b      	ldr	r6, [sp, #44]	@ 0x2c
c0de366c:	e9dd 1314 	ldrd	r1, r3, [sp, #80]	@ 0x50
c0de3670:	9a1c      	ldr	r2, [sp, #112]	@ 0x70
c0de3672:	fbc4 c507 	smlal	ip, r5, r4, r7
c0de3676:	f8dd e010 	ldr.w	lr, [sp, #16]
c0de367a:	fbc2 1306 	smlal	r1, r3, r2, r6
c0de367e:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de3680:	9c1d      	ldr	r4, [sp, #116]	@ 0x74
c0de3682:	fbce c50b 	smlal	ip, r5, lr, fp
c0de3686:	fbce 4207 	smlal	r4, r2, lr, r7
c0de368a:	46ba      	mov	sl, r7
c0de368c:	e9cd c511 	strd	ip, r5, [sp, #68]	@ 0x44
c0de3690:	9219      	str	r2, [sp, #100]	@ 0x64
c0de3692:	f8dd c060 	ldr.w	ip, [sp, #96]	@ 0x60
c0de3696:	9a21      	ldr	r2, [sp, #132]	@ 0x84
c0de3698:	9f07      	ldr	r7, [sp, #28]
c0de369a:	941d      	str	r4, [sp, #116]	@ 0x74
c0de369c:	9c08      	ldr	r4, [sp, #32]
c0de369e:	fbc7 2c06 	smlal	r2, ip, r7, r6
c0de36a2:	fbca 2c04 	smlal	r2, ip, sl, r4
c0de36a6:	4693      	mov	fp, r2
c0de36a8:	9a23      	ldr	r2, [sp, #140]	@ 0x8c
c0de36aa:	9d20      	ldr	r5, [sp, #128]	@ 0x80
c0de36ac:	f8cd 804c 	str.w	r8, [sp, #76]	@ 0x4c
c0de36b0:	fbce 5204 	smlal	r5, r2, lr, r4
c0de36b4:	9223      	str	r2, [sp, #140]	@ 0x8c
c0de36b6:	e9dd 821a 	ldrd	r8, r2, [sp, #104]	@ 0x68
c0de36ba:	9520      	str	r5, [sp, #128]	@ 0x80
c0de36bc:	fbc7 2804 	smlal	r2, r8, r7, r4
c0de36c0:	e9dd 541e 	ldrd	r5, r4, [sp, #120]	@ 0x78
c0de36c4:	f8dd a04c 	ldr.w	sl, [sp, #76]	@ 0x4c
c0de36c8:	fbce 4507 	smlal	r4, r5, lr, r7
c0de36cc:	e9cd 541e 	strd	r5, r4, [sp, #120]	@ 0x78
c0de36d0:	9d0a      	ldr	r5, [sp, #40]	@ 0x28
c0de36d2:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de36d4:	fbc7 1305 	smlal	r1, r3, r7, r5
c0de36d8:	9f0c      	ldr	r7, [sp, #48]	@ 0x30
c0de36da:	fbc4 bc05 	smlal	fp, ip, r4, r5
c0de36de:	fbc7 2806 	smlal	r2, r8, r7, r6
c0de36e2:	9e0e      	ldr	r6, [sp, #56]	@ 0x38
c0de36e4:	f8cd b084 	str.w	fp, [sp, #132]	@ 0x84
c0de36e8:	fbc7 1306 	smlal	r1, r3, r7, r6
c0de36ec:	9f22      	ldr	r7, [sp, #136]	@ 0x88
c0de36ee:	fbce 7a04 	smlal	r7, sl, lr, r4
c0de36f2:	9722      	str	r7, [sp, #136]	@ 0x88
c0de36f4:	e9dd b40f 	ldrd	fp, r4, [sp, #60]	@ 0x3c
c0de36f8:	9f0d      	ldr	r7, [sp, #52]	@ 0x34
c0de36fa:	fbce b405 	smlal	fp, r4, lr, r5
c0de36fe:	fbc7 2805 	smlal	r2, r8, r7, r5
c0de3702:	fbce 1307 	smlal	r1, r3, lr, r7
c0de3706:	9d21      	ldr	r5, [sp, #132]	@ 0x84
c0de3708:	e9cd 1314 	strd	r1, r3, [sp, #80]	@ 0x50
c0de370c:	9906      	ldr	r1, [sp, #24]
c0de370e:	fbc7 5c06 	smlal	r5, ip, r7, r6
c0de3712:	fbce 5c01 	smlal	r5, ip, lr, r1
c0de3716:	fbc1 2806 	smlal	r2, r8, r1, r6
c0de371a:	f11b 7100 	adds.w	r1, fp, #33554432	@ 0x2000000
c0de371e:	e9cd 821a 	strd	r8, r2, [sp, #104]	@ 0x68
c0de3722:	f144 0200 	adc.w	r2, r4, #0
c0de3726:	0e8b      	lsrs	r3, r1, #26
c0de3728:	9f16      	ldr	r7, [sp, #88]	@ 0x58
c0de372a:	ea43 1382 	orr.w	r3, r3, r2, lsl #6
c0de372e:	f8cd c060 	str.w	ip, [sp, #96]	@ 0x60
c0de3732:	eb17 0c03 	adds.w	ip, r7, r3
c0de3736:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
c0de3738:	f001 417c 	and.w	r1, r1, #4227858432	@ 0xfc000000
c0de373c:	eb43 63a2 	adc.w	r3, r3, r2, asr #26
c0de3740:	ebbb 0101 	subs.w	r1, fp, r1
c0de3744:	9f1d      	ldr	r7, [sp, #116]	@ 0x74
c0de3746:	911c      	str	r1, [sp, #112]	@ 0x70
c0de3748:	eb64 0102 	sbc.w	r1, r4, r2
c0de374c:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de374e:	9521      	str	r5, [sp, #132]	@ 0x84
c0de3750:	f117 7500 	adds.w	r5, r7, #33554432	@ 0x2000000
c0de3754:	9117      	str	r1, [sp, #92]	@ 0x5c
c0de3756:	f142 0400 	adc.w	r4, r2, #0
c0de375a:	0eae      	lsrs	r6, r5, #26
c0de375c:	991f      	ldr	r1, [sp, #124]	@ 0x7c
c0de375e:	ea46 1684 	orr.w	r6, r6, r4, lsl #6
c0de3762:	1876      	adds	r6, r6, r1
c0de3764:	991e      	ldr	r1, [sp, #120]	@ 0x78
c0de3766:	f005 457c 	and.w	r5, r5, #4227858432	@ 0xfc000000
c0de376a:	eb41 61a4 	adc.w	r1, r1, r4, asr #26
c0de376e:	ebb7 0805 	subs.w	r8, r7, r5
c0de3772:	eb62 0404 	sbc.w	r4, r2, r4
c0de3776:	f11c 7280 	adds.w	r2, ip, #16777216	@ 0x1000000
c0de377a:	921e      	str	r2, [sp, #120]	@ 0x78
c0de377c:	f143 0300 	adc.w	r3, r3, #0
c0de3780:	0e57      	lsrs	r7, r2, #25
c0de3782:	9a20      	ldr	r2, [sp, #128]	@ 0x80
c0de3784:	ea47 17c3 	orr.w	r7, r7, r3, lsl #7
c0de3788:	19d5      	adds	r5, r2, r7
c0de378a:	9a23      	ldr	r2, [sp, #140]	@ 0x8c
c0de378c:	9f22      	ldr	r7, [sp, #136]	@ 0x88
c0de378e:	eb42 6363 	adc.w	r3, r2, r3, asr #25
c0de3792:	f116 7280 	adds.w	r2, r6, #16777216	@ 0x1000000
c0de3796:	f141 0100 	adc.w	r1, r1, #0
c0de379a:	ea4f 6e52 	mov.w	lr, r2, lsr #25
c0de379e:	9223      	str	r2, [sp, #140]	@ 0x8c
c0de37a0:	ea4e 12c1 	orr.w	r2, lr, r1, lsl #7
c0de37a4:	18bf      	adds	r7, r7, r2
c0de37a6:	eb4a 6161 	adc.w	r1, sl, r1, asr #25
c0de37aa:	f115 7200 	adds.w	r2, r5, #33554432	@ 0x2000000
c0de37ae:	9219      	str	r2, [sp, #100]	@ 0x64
c0de37b0:	f143 0300 	adc.w	r3, r3, #0
c0de37b4:	ea4f 6b92 	mov.w	fp, r2, lsr #26
c0de37b8:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de37ba:	961f      	str	r6, [sp, #124]	@ 0x7c
c0de37bc:	ea4b 1683 	orr.w	r6, fp, r3, lsl #6
c0de37c0:	18b6      	adds	r6, r6, r2
c0de37c2:	9a12      	ldr	r2, [sp, #72]	@ 0x48
c0de37c4:	9722      	str	r7, [sp, #136]	@ 0x88
c0de37c6:	eb42 63a3 	adc.w	r3, r2, r3, asr #26
c0de37ca:	f117 7200 	adds.w	r2, r7, #33554432	@ 0x2000000
c0de37ce:	9213      	str	r2, [sp, #76]	@ 0x4c
c0de37d0:	f141 0100 	adc.w	r1, r1, #0
c0de37d4:	ea4f 6a92 	mov.w	sl, r2, lsr #26
c0de37d8:	9a14      	ldr	r2, [sp, #80]	@ 0x50
c0de37da:	ea4a 1781 	orr.w	r7, sl, r1, lsl #6
c0de37de:	18bf      	adds	r7, r7, r2
c0de37e0:	9a15      	ldr	r2, [sp, #84]	@ 0x54
c0de37e2:	f8cd c058 	str.w	ip, [sp, #88]	@ 0x58
c0de37e6:	eb42 61a1 	adc.w	r1, r2, r1, asr #26
c0de37ea:	f116 7e80 	adds.w	lr, r6, #16777216	@ 0x1000000
c0de37ee:	f143 0300 	adc.w	r3, r3, #0
c0de37f2:	ea4f 6c5e 	mov.w	ip, lr, lsr #25
c0de37f6:	9520      	str	r5, [sp, #128]	@ 0x80
c0de37f8:	ea4c 15c3 	orr.w	r5, ip, r3, lsl #7
c0de37fc:	eb15 0a08 	adds.w	sl, r5, r8
c0de3800:	ea4f 6363 	mov.w	r3, r3, asr #25
c0de3804:	4163      	adcs	r3, r4
c0de3806:	f117 7580 	adds.w	r5, r7, #16777216	@ 0x1000000
c0de380a:	f141 0100 	adc.w	r1, r1, #0
c0de380e:	ea4f 6855 	mov.w	r8, r5, lsr #25
c0de3812:	9a21      	ldr	r2, [sp, #132]	@ 0x84
c0de3814:	ea48 14c1 	orr.w	r4, r8, r1, lsl #7
c0de3818:	eb12 0804 	adds.w	r8, r2, r4
c0de381c:	9a18      	ldr	r2, [sp, #96]	@ 0x60
c0de381e:	961d      	str	r6, [sp, #116]	@ 0x74
c0de3820:	eb42 6161 	adc.w	r1, r2, r1, asr #25
c0de3824:	f11a 7400 	adds.w	r4, sl, #33554432	@ 0x2000000
c0de3828:	f143 0200 	adc.w	r2, r3, #0
c0de382c:	f118 7c00 	adds.w	ip, r8, #33554432	@ 0x2000000
c0de3830:	9221      	str	r2, [sp, #132]	@ 0x84
c0de3832:	f141 0100 	adc.w	r1, r1, #0
c0de3836:	ea4f 639c 	mov.w	r3, ip, lsr #26
c0de383a:	9a1b      	ldr	r2, [sp, #108]	@ 0x6c
c0de383c:	ea43 1381 	orr.w	r3, r3, r1, lsl #6
c0de3840:	189b      	adds	r3, r3, r2
c0de3842:	9a1a      	ldr	r2, [sp, #104]	@ 0x68
c0de3844:	9714      	str	r7, [sp, #80]	@ 0x50
c0de3846:	eb42 62a1 	adc.w	r2, r2, r1, asr #26
c0de384a:	f113 7180 	adds.w	r1, r3, #16777216	@ 0x1000000
c0de384e:	f142 0200 	adc.w	r2, r2, #0
c0de3852:	ea4f 6b51 	mov.w	fp, r1, lsr #25
c0de3856:	ea4b 16c2 	orr.w	r6, fp, r2, lsl #7
c0de385a:	2713      	movs	r7, #19
c0de385c:	fba6 b607 	umull	fp, r6, r6, r7
c0de3860:	2713      	movs	r7, #19
c0de3862:	1652      	asrs	r2, r2, #25
c0de3864:	fb02 6207 	mla	r2, r2, r7, r6
c0de3868:	f8cd b06c 	str.w	fp, [sp, #108]	@ 0x6c
c0de386c:	921a      	str	r2, [sp, #104]	@ 0x68
c0de386e:	9a1e      	ldr	r2, [sp, #120]	@ 0x78
c0de3870:	f00e 477e 	and.w	r7, lr, #4261412864	@ 0xfe000000
c0de3874:	f002 467e 	and.w	r6, r2, #4261412864	@ 0xfe000000
c0de3878:	9a16      	ldr	r2, [sp, #88]	@ 0x58
c0de387a:	f005 457e 	and.w	r5, r5, #4261412864	@ 0xfe000000
c0de387e:	1b92      	subs	r2, r2, r6
c0de3880:	921e      	str	r2, [sp, #120]	@ 0x78
c0de3882:	9a23      	ldr	r2, [sp, #140]	@ 0x8c
c0de3884:	f001 417e 	and.w	r1, r1, #4261412864	@ 0xfe000000
c0de3888:	f002 467e 	and.w	r6, r2, #4261412864	@ 0xfe000000
c0de388c:	9a1f      	ldr	r2, [sp, #124]	@ 0x7c
c0de388e:	1a59      	subs	r1, r3, r1
c0de3890:	1b96      	subs	r6, r2, r6
c0de3892:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de3894:	f002 4b7c 	and.w	fp, r2, #4227858432	@ 0xfc000000
c0de3898:	9a20      	ldr	r2, [sp, #128]	@ 0x80
c0de389a:	eba2 020b 	sub.w	r2, r2, fp
c0de389e:	9220      	str	r2, [sp, #128]	@ 0x80
c0de38a0:	9a13      	ldr	r2, [sp, #76]	@ 0x4c
c0de38a2:	f002 4b7c 	and.w	fp, r2, #4227858432	@ 0xfc000000
c0de38a6:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de38a8:	eba2 020b 	sub.w	r2, r2, fp
c0de38ac:	9223      	str	r2, [sp, #140]	@ 0x8c
c0de38ae:	9a1d      	ldr	r2, [sp, #116]	@ 0x74
c0de38b0:	eba2 0b07 	sub.w	fp, r2, r7
c0de38b4:	9a14      	ldr	r2, [sp, #80]	@ 0x50
c0de38b6:	eba2 0e05 	sub.w	lr, r2, r5
c0de38ba:	9a21      	ldr	r2, [sp, #132]	@ 0x84
c0de38bc:	0ea5      	lsrs	r5, r4, #26
c0de38be:	ea45 1582 	orr.w	r5, r5, r2, lsl #6
c0de38c2:	f004 447c 	and.w	r4, r4, #4227858432	@ 0xfc000000
c0de38c6:	e9dd 271b 	ldrd	r2, r7, [sp, #108]	@ 0x6c
c0de38ca:	4435      	add	r5, r6
c0de38cc:	ebaa 0604 	sub.w	r6, sl, r4
c0de38d0:	f00c 447c 	and.w	r4, ip, #4227858432	@ 0xfc000000
c0de38d4:	eba8 0c04 	sub.w	ip, r8, r4
c0de38d8:	19d4      	adds	r4, r2, r7
c0de38da:	9f17      	ldr	r7, [sp, #92]	@ 0x5c
c0de38dc:	9a1a      	ldr	r2, [sp, #104]	@ 0x68
c0de38de:	e9c0 6504 	strd	r6, r5, [r0, #16]
c0de38e2:	417a      	adcs	r2, r7
c0de38e4:	f114 7300 	adds.w	r3, r4, #33554432	@ 0x2000000
c0de38e8:	f142 0200 	adc.w	r2, r2, #0
c0de38ec:	0e9f      	lsrs	r7, r3, #26
c0de38ee:	ea47 1282 	orr.w	r2, r7, r2, lsl #6
c0de38f2:	9f1e      	ldr	r7, [sp, #120]	@ 0x78
c0de38f4:	f003 437c 	and.w	r3, r3, #4227858432	@ 0xfc000000
c0de38f8:	443a      	add	r2, r7
c0de38fa:	1ae3      	subs	r3, r4, r3
c0de38fc:	e9c0 3200 	strd	r3, r2, [r0]
c0de3900:	9a20      	ldr	r2, [sp, #128]	@ 0x80
c0de3902:	e9c0 c108 	strd	ip, r1, [r0, #32]
c0de3906:	e9c0 2b02 	strd	r2, fp, [r0, #8]
c0de390a:	9a23      	ldr	r2, [sp, #140]	@ 0x8c
c0de390c:	e9c0 2e06 	strd	r2, lr, [r0, #24]
c0de3910:	b024      	add	sp, #144	@ 0x90
c0de3912:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de3916 <fe25519_frombytes>:
c0de3916:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de391a:	b087      	sub	sp, #28
c0de391c:	780a      	ldrb	r2, [r1, #0]
c0de391e:	784b      	ldrb	r3, [r1, #1]
c0de3920:	788f      	ldrb	r7, [r1, #2]
c0de3922:	78ce      	ldrb	r6, [r1, #3]
c0de3924:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3928:	ea42 4207 	orr.w	r2, r2, r7, lsl #16
c0de392c:	7f8f      	ldrb	r7, [r1, #30]
c0de392e:	ea42 6206 	orr.w	r2, r2, r6, lsl #24
c0de3932:	7f4b      	ldrb	r3, [r1, #29]
c0de3934:	7fce      	ldrb	r6, [r1, #31]
c0de3936:	02bf      	lsls	r7, r7, #10
c0de3938:	ea47 0383 	orr.w	r3, r7, r3, lsl #2
c0de393c:	f006 077f 	and.w	r7, r6, #127	@ 0x7f
c0de3940:	ea43 4387 	orr.w	r3, r3, r7, lsl #18
c0de3944:	9306      	str	r3, [sp, #24]
c0de3946:	f103 7380 	add.w	r3, r3, #16777216	@ 0x1000000
c0de394a:	9305      	str	r3, [sp, #20]
c0de394c:	0e5c      	lsrs	r4, r3, #25
c0de394e:	2513      	movs	r5, #19
c0de3950:	2300      	movs	r3, #0
c0de3952:	fbe4 2305 	umlal	r2, r3, r4, r5
c0de3956:	794d      	ldrb	r5, [r1, #5]
c0de3958:	790c      	ldrb	r4, [r1, #4]
c0de395a:	798e      	ldrb	r6, [r1, #6]
c0de395c:	03ad      	lsls	r5, r5, #14
c0de395e:	ea45 1484 	orr.w	r4, r5, r4, lsl #6
c0de3962:	7a0d      	ldrb	r5, [r1, #8]
c0de3964:	ea44 5786 	orr.w	r7, r4, r6, lsl #22
c0de3968:	79cc      	ldrb	r4, [r1, #7]
c0de396a:	7a4e      	ldrb	r6, [r1, #9]
c0de396c:	036d      	lsls	r5, r5, #13
c0de396e:	ea45 1444 	orr.w	r4, r5, r4, lsl #5
c0de3972:	7acd      	ldrb	r5, [r1, #11]
c0de3974:	ea44 5b46 	orr.w	fp, r4, r6, lsl #21
c0de3978:	7a8c      	ldrb	r4, [r1, #10]
c0de397a:	7b0e      	ldrb	r6, [r1, #12]
c0de397c:	02ed      	lsls	r5, r5, #11
c0de397e:	ea45 04c4 	orr.w	r4, r5, r4, lsl #3
c0de3982:	ea44 4ac6 	orr.w	sl, r4, r6, lsl #19
c0de3986:	7b8e      	ldrb	r6, [r1, #14]
c0de3988:	7b4d      	ldrb	r5, [r1, #13]
c0de398a:	02b6      	lsls	r6, r6, #10
c0de398c:	ea46 0585 	orr.w	r5, r6, r5, lsl #2
c0de3990:	7c0e      	ldrb	r6, [r1, #16]
c0de3992:	f891 8011 	ldrb.w	r8, [r1, #17]
c0de3996:	9204      	str	r2, [sp, #16]
c0de3998:	7bca      	ldrb	r2, [r1, #15]
c0de399a:	ea46 2808 	orr.w	r8, r6, r8, lsl #8
c0de399e:	7c8e      	ldrb	r6, [r1, #18]
c0de39a0:	ea45 4282 	orr.w	r2, r5, r2, lsl #18
c0de39a4:	7ccd      	ldrb	r5, [r1, #19]
c0de39a6:	ea48 4606 	orr.w	r6, r8, r6, lsl #16
c0de39aa:	ea46 6405 	orr.w	r4, r6, r5, lsl #24
c0de39ae:	7d4d      	ldrb	r5, [r1, #21]
c0de39b0:	7d0e      	ldrb	r6, [r1, #20]
c0de39b2:	9203      	str	r2, [sp, #12]
c0de39b4:	7d8a      	ldrb	r2, [r1, #22]
c0de39b6:	03ed      	lsls	r5, r5, #15
c0de39b8:	ea45 15c6 	orr.w	r5, r5, r6, lsl #7
c0de39bc:	ea45 5cc2 	orr.w	ip, r5, r2, lsl #23
c0de39c0:	7e0d      	ldrb	r5, [r1, #24]
c0de39c2:	7dce      	ldrb	r6, [r1, #23]
c0de39c4:	036d      	lsls	r5, r5, #13
c0de39c6:	7e4a      	ldrb	r2, [r1, #25]
c0de39c8:	ea45 1546 	orr.w	r5, r5, r6, lsl #5
c0de39cc:	ea45 5842 	orr.w	r8, r5, r2, lsl #21
c0de39d0:	7ecd      	ldrb	r5, [r1, #27]
c0de39d2:	7e8a      	ldrb	r2, [r1, #26]
c0de39d4:	7f09      	ldrb	r1, [r1, #28]
c0de39d6:	032d      	lsls	r5, r5, #12
c0de39d8:	ea45 1202 	orr.w	r2, r5, r2, lsl #4
c0de39dc:	ea42 5101 	orr.w	r1, r2, r1, lsl #20
c0de39e0:	f107 7280 	add.w	r2, r7, #16777216	@ 0x1000000
c0de39e4:	eb0b 6552 	add.w	r5, fp, r2, lsr #25
c0de39e8:	f002 42fc 	and.w	r2, r2, #2113929216	@ 0x7e000000
c0de39ec:	eba7 0b02 	sub.w	fp, r7, r2
c0de39f0:	2700      	movs	r7, #0
c0de39f2:	f114 7280 	adds.w	r2, r4, #16777216	@ 0x1000000
c0de39f6:	9102      	str	r1, [sp, #8]
c0de39f8:	f147 0100 	adc.w	r1, r7, #0
c0de39fc:	ea4f 6e52 	mov.w	lr, r2, lsr #25
c0de3a00:	ea4e 11c1 	orr.w	r1, lr, r1, lsl #7
c0de3a04:	f8dd e010 	ldr.w	lr, [sp, #16]
c0de3a08:	448c      	add	ip, r1
c0de3a0a:	f11e 7100 	adds.w	r1, lr, #33554432	@ 0x2000000
c0de3a0e:	9400      	str	r4, [sp, #0]
c0de3a10:	f143 0300 	adc.w	r3, r3, #0
c0de3a14:	0e8c      	lsrs	r4, r1, #26
c0de3a16:	ea44 1383 	orr.w	r3, r4, r3, lsl #6
c0de3a1a:	f001 417c 	and.w	r1, r1, #4227858432	@ 0xfc000000
c0de3a1e:	445b      	add	r3, fp
c0de3a20:	ebae 0101 	sub.w	r1, lr, r1
c0de3a24:	f115 7400 	adds.w	r4, r5, #33554432	@ 0x2000000
c0de3a28:	9301      	str	r3, [sp, #4]
c0de3a2a:	9104      	str	r1, [sp, #16]
c0de3a2c:	f147 0300 	adc.w	r3, r7, #0
c0de3a30:	0ea1      	lsrs	r1, r4, #26
c0de3a32:	9e03      	ldr	r6, [sp, #12]
c0de3a34:	ea41 1183 	orr.w	r1, r1, r3, lsl #6
c0de3a38:	f10a 7380 	add.w	r3, sl, #16777216	@ 0x1000000
c0de3a3c:	4451      	add	r1, sl
c0de3a3e:	eb06 6a53 	add.w	sl, r6, r3, lsr #25
c0de3a42:	f003 6360 	and.w	r3, r3, #234881024	@ 0xe000000
c0de3a46:	1ac9      	subs	r1, r1, r3
c0de3a48:	f004 437c 	and.w	r3, r4, #4227858432	@ 0xfc000000
c0de3a4c:	f11a 7400 	adds.w	r4, sl, #33554432	@ 0x2000000
c0de3a50:	9103      	str	r1, [sp, #12]
c0de3a52:	eba5 0b03 	sub.w	fp, r5, r3
c0de3a56:	f147 0500 	adc.w	r5, r7, #0
c0de3a5a:	ea4f 6e94 	mov.w	lr, r4, lsr #26
c0de3a5e:	9900      	ldr	r1, [sp, #0]
c0de3a60:	ea4e 1585 	orr.w	r5, lr, r5, lsl #6
c0de3a64:	440d      	add	r5, r1
c0de3a66:	f002 427e 	and.w	r2, r2, #4261412864	@ 0xfe000000
c0de3a6a:	eba5 0e02 	sub.w	lr, r5, r2
c0de3a6e:	f004 457c 	and.w	r5, r4, #4227858432	@ 0xfc000000
c0de3a72:	f11c 7400 	adds.w	r4, ip, #33554432	@ 0x2000000
c0de3a76:	f147 0200 	adc.w	r2, r7, #0
c0de3a7a:	0ea1      	lsrs	r1, r4, #26
c0de3a7c:	9b02      	ldr	r3, [sp, #8]
c0de3a7e:	ea41 1182 	orr.w	r1, r1, r2, lsl #6
c0de3a82:	f108 7280 	add.w	r2, r8, #16777216	@ 0x1000000
c0de3a86:	4441      	add	r1, r8
c0de3a88:	eb03 6652 	add.w	r6, r3, r2, lsr #25
c0de3a8c:	f002 5278 	and.w	r2, r2, #1040187392	@ 0x3e000000
c0de3a90:	1a89      	subs	r1, r1, r2
c0de3a92:	f004 427c 	and.w	r2, r4, #4227858432	@ 0xfc000000
c0de3a96:	f116 7400 	adds.w	r4, r6, #33554432	@ 0x2000000
c0de3a9a:	f147 0700 	adc.w	r7, r7, #0
c0de3a9e:	0ea3      	lsrs	r3, r4, #26
c0de3aa0:	ea43 1387 	orr.w	r3, r3, r7, lsl #6
c0de3aa4:	9f06      	ldr	r7, [sp, #24]
c0de3aa6:	ebaa 0505 	sub.w	r5, sl, r5
c0de3aaa:	443b      	add	r3, r7
c0de3aac:	9f05      	ldr	r7, [sp, #20]
c0de3aae:	ebac 0202 	sub.w	r2, ip, r2
c0de3ab2:	f007 7700 	and.w	r7, r7, #33554432	@ 0x2000000
c0de3ab6:	1bdb      	subs	r3, r3, r7
c0de3ab8:	f004 477c 	and.w	r7, r4, #4227858432	@ 0xfc000000
c0de3abc:	1bf7      	subs	r7, r6, r7
c0de3abe:	9e04      	ldr	r6, [sp, #16]
c0de3ac0:	e9c0 e205 	strd	lr, r2, [r0, #20]
c0de3ac4:	6006      	str	r6, [r0, #0]
c0de3ac6:	9e01      	ldr	r6, [sp, #4]
c0de3ac8:	e9c0 1707 	strd	r1, r7, [r0, #28]
c0de3acc:	e9c0 6b01 	strd	r6, fp, [r0, #4]
c0de3ad0:	9e03      	ldr	r6, [sp, #12]
c0de3ad2:	6243      	str	r3, [r0, #36]	@ 0x24
c0de3ad4:	e9c0 6503 	strd	r6, r5, [r0, #12]
c0de3ad8:	b007      	add	sp, #28
c0de3ada:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de3ade <fe25519_reduce>:
c0de3ade:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3ae2:	e891 00e0 	ldmia.w	r1, {r5, r6, r7}
c0de3ae6:	f101 0b0c 	add.w	fp, r1, #12
c0de3aea:	e9d1 8e06 	ldrd	r8, lr, [r1, #24]
c0de3aee:	e9d1 c108 	ldrd	ip, r1, [r1, #32]
c0de3af2:	f04f 0a13 	mov.w	sl, #19
c0de3af6:	fb01 f30a 	mul.w	r3, r1, sl
c0de3afa:	f103 7380 	add.w	r3, r3, #16777216	@ 0x1000000
c0de3afe:	eb05 6353 	add.w	r3, r5, r3, lsr #25
c0de3b02:	e89b 0814 	ldmia.w	fp, {r2, r4, fp}
c0de3b06:	eb06 63a3 	add.w	r3, r6, r3, asr #26
c0de3b0a:	eb07 6363 	add.w	r3, r7, r3, asr #25
c0de3b0e:	eb02 63a3 	add.w	r3, r2, r3, asr #26
c0de3b12:	eb04 6363 	add.w	r3, r4, r3, asr #25
c0de3b16:	eb0b 63a3 	add.w	r3, fp, r3, asr #26
c0de3b1a:	eb08 6363 	add.w	r3, r8, r3, asr #25
c0de3b1e:	eb0e 63a3 	add.w	r3, lr, r3, asr #26
c0de3b22:	eb0c 6363 	add.w	r3, ip, r3, asr #25
c0de3b26:	eb01 63a3 	add.w	r3, r1, r3, asr #26
c0de3b2a:	165b      	asrs	r3, r3, #25
c0de3b2c:	fb03 530a 	mla	r3, r3, sl, r5
c0de3b30:	eb06 65a3 	add.w	r5, r6, r3, asr #26
c0de3b34:	eb07 6665 	add.w	r6, r7, r5, asr #25
c0de3b38:	eb02 62a6 	add.w	r2, r2, r6, asr #26
c0de3b3c:	eb04 6462 	add.w	r4, r4, r2, asr #25
c0de3b40:	eb0b 67a4 	add.w	r7, fp, r4, asr #26
c0de3b44:	f023 4a7c 	bic.w	sl, r3, #4227858432	@ 0xfc000000
c0de3b48:	eb08 6367 	add.w	r3, r8, r7, asr #25
c0de3b4c:	f024 4b7c 	bic.w	fp, r4, #4227858432	@ 0xfc000000
c0de3b50:	eb0e 64a3 	add.w	r4, lr, r3, asr #26
c0de3b54:	f027 487e 	bic.w	r8, r7, #4261412864	@ 0xfe000000
c0de3b58:	eb0c 6764 	add.w	r7, ip, r4, asr #25
c0de3b5c:	f026 467c 	bic.w	r6, r6, #4227858432	@ 0xfc000000
c0de3b60:	f022 427e 	bic.w	r2, r2, #4261412864	@ 0xfe000000
c0de3b64:	eb01 61a7 	add.w	r1, r1, r7, asr #26
c0de3b68:	f025 457e 	bic.w	r5, r5, #4261412864	@ 0xfe000000
c0de3b6c:	f023 437c 	bic.w	r3, r3, #4227858432	@ 0xfc000000
c0de3b70:	f021 417e 	bic.w	r1, r1, #4261412864	@ 0xfe000000
c0de3b74:	e9c0 6202 	strd	r6, r2, [r0, #8]
c0de3b78:	f100 0218 	add.w	r2, r0, #24
c0de3b7c:	f024 447e 	bic.w	r4, r4, #4261412864	@ 0xfe000000
c0de3b80:	f027 477c 	bic.w	r7, r7, #4227858432	@ 0xfc000000
c0de3b84:	e9c0 a500 	strd	sl, r5, [r0]
c0de3b88:	e9c0 b804 	strd	fp, r8, [r0, #16]
c0de3b8c:	c298      	stmia	r2!, {r3, r4, r7}
c0de3b8e:	6241      	str	r1, [r0, #36]	@ 0x24
c0de3b90:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de3b94 <fe25519_tobytes>:
c0de3b94:	b510      	push	{r4, lr}
c0de3b96:	b08a      	sub	sp, #40	@ 0x28
c0de3b98:	4604      	mov	r4, r0
c0de3b9a:	4668      	mov	r0, sp
c0de3b9c:	f7ff ff9f 	bl	c0de3ade <fe25519_reduce>
c0de3ba0:	e89d 100e 	ldmia.w	sp, {r1, r2, r3, ip}
c0de3ba4:	0a08      	lsrs	r0, r1, #8
c0de3ba6:	7060      	strb	r0, [r4, #1]
c0de3ba8:	0c08      	lsrs	r0, r1, #16
c0de3baa:	70a0      	strb	r0, [r4, #2]
c0de3bac:	0090      	lsls	r0, r2, #2
c0de3bae:	ea40 6011 	orr.w	r0, r0, r1, lsr #24
c0de3bb2:	70e0      	strb	r0, [r4, #3]
c0de3bb4:	0990      	lsrs	r0, r2, #6
c0de3bb6:	7120      	strb	r0, [r4, #4]
c0de3bb8:	0b90      	lsrs	r0, r2, #14
c0de3bba:	7160      	strb	r0, [r4, #5]
c0de3bbc:	00d8      	lsls	r0, r3, #3
c0de3bbe:	ea40 5092 	orr.w	r0, r0, r2, lsr #22
c0de3bc2:	71a0      	strb	r0, [r4, #6]
c0de3bc4:	0958      	lsrs	r0, r3, #5
c0de3bc6:	71e0      	strb	r0, [r4, #7]
c0de3bc8:	0b58      	lsrs	r0, r3, #13
c0de3bca:	7220      	strb	r0, [r4, #8]
c0de3bcc:	ea4f 104c 	mov.w	r0, ip, lsl #5
c0de3bd0:	ea40 5053 	orr.w	r0, r0, r3, lsr #21
c0de3bd4:	7021      	strb	r1, [r4, #0]
c0de3bd6:	7260      	strb	r0, [r4, #9]
c0de3bd8:	ea4f 00dc 	mov.w	r0, ip, lsr #3
c0de3bdc:	9904      	ldr	r1, [sp, #16]
c0de3bde:	72a0      	strb	r0, [r4, #10]
c0de3be0:	ea4f 20dc 	mov.w	r0, ip, lsr #11
c0de3be4:	72e0      	strb	r0, [r4, #11]
c0de3be6:	0188      	lsls	r0, r1, #6
c0de3be8:	ea40 40dc 	orr.w	r0, r0, ip, lsr #19
c0de3bec:	7320      	strb	r0, [r4, #12]
c0de3bee:	0888      	lsrs	r0, r1, #2
c0de3bf0:	7360      	strb	r0, [r4, #13]
c0de3bf2:	0a88      	lsrs	r0, r1, #10
c0de3bf4:	f10d 0c14 	add.w	ip, sp, #20
c0de3bf8:	73a0      	strb	r0, [r4, #14]
c0de3bfa:	0c88      	lsrs	r0, r1, #18
c0de3bfc:	e89c 100e 	ldmia.w	ip, {r1, r2, r3, ip}
c0de3c00:	73e0      	strb	r0, [r4, #15]
c0de3c02:	0a08      	lsrs	r0, r1, #8
c0de3c04:	7460      	strb	r0, [r4, #17]
c0de3c06:	0c08      	lsrs	r0, r1, #16
c0de3c08:	74a0      	strb	r0, [r4, #18]
c0de3c0a:	0050      	lsls	r0, r2, #1
c0de3c0c:	ea40 6011 	orr.w	r0, r0, r1, lsr #24
c0de3c10:	74e0      	strb	r0, [r4, #19]
c0de3c12:	09d0      	lsrs	r0, r2, #7
c0de3c14:	7520      	strb	r0, [r4, #20]
c0de3c16:	0bd0      	lsrs	r0, r2, #15
c0de3c18:	7560      	strb	r0, [r4, #21]
c0de3c1a:	00d8      	lsls	r0, r3, #3
c0de3c1c:	ea40 50d2 	orr.w	r0, r0, r2, lsr #23
c0de3c20:	75a0      	strb	r0, [r4, #22]
c0de3c22:	0958      	lsrs	r0, r3, #5
c0de3c24:	75e0      	strb	r0, [r4, #23]
c0de3c26:	0b58      	lsrs	r0, r3, #13
c0de3c28:	7620      	strb	r0, [r4, #24]
c0de3c2a:	ea4f 100c 	mov.w	r0, ip, lsl #4
c0de3c2e:	ea40 5053 	orr.w	r0, r0, r3, lsr #21
c0de3c32:	7421      	strb	r1, [r4, #16]
c0de3c34:	7660      	strb	r0, [r4, #25]
c0de3c36:	ea4f 101c 	mov.w	r0, ip, lsr #4
c0de3c3a:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de3c3c:	76a0      	strb	r0, [r4, #26]
c0de3c3e:	ea4f 301c 	mov.w	r0, ip, lsr #12
c0de3c42:	76e0      	strb	r0, [r4, #27]
c0de3c44:	0188      	lsls	r0, r1, #6
c0de3c46:	ea40 501c 	orr.w	r0, r0, ip, lsr #20
c0de3c4a:	7720      	strb	r0, [r4, #28]
c0de3c4c:	0888      	lsrs	r0, r1, #2
c0de3c4e:	7760      	strb	r0, [r4, #29]
c0de3c50:	0a88      	lsrs	r0, r1, #10
c0de3c52:	77a0      	strb	r0, [r4, #30]
c0de3c54:	0c88      	lsrs	r0, r1, #18
c0de3c56:	77e0      	strb	r0, [r4, #31]
c0de3c58:	b00a      	add	sp, #40	@ 0x28
c0de3c5a:	bd10      	pop	{r4, pc}

c0de3c5c <print_amount>:
c0de3c5c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3c60:	b082      	sub	sp, #8
c0de3c62:	4607      	mov	r7, r0
c0de3c64:	f240 0008 	movw	r0, #8
c0de3c68:	f2c0 0000 	movt	r0, #0
c0de3c6c:	460c      	mov	r4, r1
c0de3c6e:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de3c70:	4448      	add	r0, r9
c0de3c72:	4615      	mov	r5, r2
c0de3c74:	f200 2001 	addw	r0, r0, #513	@ 0x201
c0de3c78:	461e      	mov	r6, r3
c0de3c7a:	2a00      	cmp	r2, #0
c0de3c7c:	bf08      	it	eq
c0de3c7e:	f04f 35ff 	moveq.w	r5, #4294967295	@ 0xffffffff
c0de3c82:	f004 fc13 	bl	c0de84ac <__aeabi_memclr>
c0de3c86:	ea57 0a04 	orrs.w	sl, r7, r4
c0de3c8a:	bf18      	it	ne
c0de3c8c:	f04f 0a01 	movne.w	sl, #1
c0de3c90:	d104      	bne.n	c0de3c9c <print_amount+0x40>
c0de3c92:	f1b5 3fff 	cmp.w	r5, #4294967295	@ 0xffffffff
c0de3c96:	da01      	bge.n	c0de3c9c <print_amount+0x40>
c0de3c98:	2000      	movs	r0, #0
c0de3c9a:	e06f      	b.n	c0de3d7c <print_amount+0x120>
c0de3c9c:	f240 0008 	movw	r0, #8
c0de3ca0:	f2c0 0000 	movt	r0, #0
c0de3ca4:	4448      	add	r0, r9
c0de3ca6:	4428      	add	r0, r5
c0de3ca8:	9601      	str	r6, [sp, #4]
c0de3caa:	1e6e      	subs	r6, r5, #1
c0de3cac:	f200 2801 	addw	r8, r0, #513	@ 0x201
c0de3cb0:	f04f 0b00 	mov.w	fp, #0
c0de3cb4:	4638      	mov	r0, r7
c0de3cb6:	4621      	mov	r1, r4
c0de3cb8:	220a      	movs	r2, #10
c0de3cba:	2300      	movs	r3, #0
c0de3cbc:	f004 fad8 	bl	c0de8270 <__aeabi_uldivmod>
c0de3cc0:	460c      	mov	r4, r1
c0de3cc2:	eb00 0180 	add.w	r1, r0, r0, lsl #2
c0de3cc6:	eba7 0141 	sub.w	r1, r7, r1, lsl #1
c0de3cca:	f01a 0701 	ands.w	r7, sl, #1
c0de3cce:	f04f 0230 	mov.w	r2, #48	@ 0x30
c0de3cd2:	bf16      	itet	ne
c0de3cd4:	f041 0230 	orrne.w	r2, r1, #48	@ 0x30
c0de3cd8:	463c      	moveq	r4, r7
c0de3cda:	4607      	movne	r7, r0
c0de3cdc:	f240 0008 	movw	r0, #8
c0de3ce0:	f2c0 0000 	movt	r0, #0
c0de3ce4:	4448      	add	r0, r9
c0de3ce6:	4458      	add	r0, fp
c0de3ce8:	4659      	mov	r1, fp
c0de3cea:	f880 2201 	strb.w	r2, [r0, #513]	@ 0x201
c0de3cee:	45b3      	cmp	fp, r6
c0de3cf0:	bf02      	ittt	eq
c0de3cf2:	202e      	moveq	r0, #46	@ 0x2e
c0de3cf4:	f888 0000 	strbeq.w	r0, [r8]
c0de3cf8:	4629      	moveq	r1, r5
c0de3cfa:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de3cfc:	4281      	cmp	r1, r0
c0de3cfe:	da36      	bge.n	c0de3d6e <print_amount+0x112>
c0de3d00:	f101 0b01 	add.w	fp, r1, #1
c0de3d04:	ea57 0a04 	orrs.w	sl, r7, r4
c0de3d08:	bf18      	it	ne
c0de3d0a:	f04f 0a01 	movne.w	sl, #1
c0de3d0e:	d1d1      	bne.n	c0de3cb4 <print_amount+0x58>
c0de3d10:	42a9      	cmp	r1, r5
c0de3d12:	ddcf      	ble.n	c0de3cb4 <print_amount+0x58>
c0de3d14:	9e01      	ldr	r6, [sp, #4]
c0de3d16:	2900      	cmp	r1, #0
c0de3d18:	f04f 0000 	mov.w	r0, #0
c0de3d1c:	d416      	bmi.n	c0de3d4c <print_amount+0xf0>
c0de3d1e:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
c0de3d20:	2a02      	cmp	r2, #2
c0de3d22:	d313      	bcc.n	c0de3d4c <print_amount+0xf0>
c0de3d24:	3a01      	subs	r2, #1
c0de3d26:	2000      	movs	r0, #0
c0de3d28:	f240 0308 	movw	r3, #8
c0de3d2c:	f2c0 0300 	movt	r3, #0
c0de3d30:	444b      	add	r3, r9
c0de3d32:	440b      	add	r3, r1
c0de3d34:	f893 3201 	ldrb.w	r3, [r3, #513]	@ 0x201
c0de3d38:	1c4f      	adds	r7, r1, #1
c0de3d3a:	5433      	strb	r3, [r6, r0]
c0de3d3c:	2f02      	cmp	r7, #2
c0de3d3e:	f100 0001 	add.w	r0, r0, #1
c0de3d42:	d303      	bcc.n	c0de3d4c <print_amount+0xf0>
c0de3d44:	4290      	cmp	r0, r2
c0de3d46:	f1a1 0101 	sub.w	r1, r1, #1
c0de3d4a:	dbed      	blt.n	c0de3d28 <print_amount+0xcc>
c0de3d4c:	2d01      	cmp	r5, #1
c0de3d4e:	db15      	blt.n	c0de3d7c <print_amount+0x120>
c0de3d50:	4601      	mov	r1, r0
c0de3d52:	2801      	cmp	r0, #1
c0de3d54:	bfa8      	it	ge
c0de3d56:	2101      	movge	r1, #1
c0de3d58:	1e4a      	subs	r2, r1, #1
c0de3d5a:	1e77      	subs	r7, r6, #1
c0de3d5c:	2801      	cmp	r0, #1
c0de3d5e:	dd08      	ble.n	c0de3d72 <print_amount+0x116>
c0de3d60:	5c3b      	ldrb	r3, [r7, r0]
c0de3d62:	3801      	subs	r0, #1
c0de3d64:	2b30      	cmp	r3, #48	@ 0x30
c0de3d66:	d0f9      	beq.n	c0de3d5c <print_amount+0x100>
c0de3d68:	1c41      	adds	r1, r0, #1
c0de3d6a:	4602      	mov	r2, r0
c0de3d6c:	e002      	b.n	c0de3d74 <print_amount+0x118>
c0de3d6e:	2000      	movs	r0, #0
c0de3d70:	e007      	b.n	c0de3d82 <print_amount+0x126>
c0de3d72:	5cb3      	ldrb	r3, [r6, r2]
c0de3d74:	2b2e      	cmp	r3, #46	@ 0x2e
c0de3d76:	bf08      	it	eq
c0de3d78:	4611      	moveq	r1, r2
c0de3d7a:	4608      	mov	r0, r1
c0de3d7c:	2100      	movs	r1, #0
c0de3d7e:	5431      	strb	r1, [r6, r0]
c0de3d80:	2001      	movs	r0, #1
c0de3d82:	b002      	add	sp, #8
c0de3d84:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de3d88 <asset_callback>:
c0de3d88:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de3d8c:	b082      	sub	sp, #8
c0de3d8e:	f240 6814 	movw	r8, #1556	@ 0x614
c0de3d92:	4606      	mov	r6, r0
c0de3d94:	202d      	movs	r0, #45	@ 0x2d
c0de3d96:	f2c0 0800 	movt	r8, #0
c0de3d9a:	9001      	str	r0, [sp, #4]
c0de3d9c:	68b5      	ldr	r5, [r6, #8]
c0de3d9e:	eb09 0008 	add.w	r0, r9, r8
c0de3da2:	f100 0796 	add.w	r7, r0, #150	@ 0x96
c0de3da6:	4638      	mov	r0, r7
c0de3da8:	4629      	mov	r1, r5
c0de3daa:	4614      	mov	r4, r2
c0de3dac:	f004 fb7e 	bl	c0de84ac <__aeabi_memclr>
c0de3db0:	68b2      	ldr	r2, [r6, #8]
c0de3db2:	4630      	mov	r0, r6
c0de3db4:	4639      	mov	r1, r7
c0de3db6:	f7fe f80b 	bl	c0de1dd0 <pb_read>
c0de3dba:	b158      	cbz	r0, c0de3dd4 <asset_callback+0x4c>
c0de3dbc:	6820      	ldr	r0, [r4, #0]
c0de3dbe:	2d20      	cmp	r5, #32
c0de3dc0:	d10a      	bne.n	c0de3dd8 <asset_callback+0x50>
c0de3dc2:	eb09 0108 	add.w	r1, r9, r8
c0de3dc6:	f101 0296 	add.w	r2, r1, #150	@ 0x96
c0de3dca:	a901      	add	r1, sp, #4
c0de3dcc:	2320      	movs	r3, #32
c0de3dce:	f7fc f99f 	bl	c0de0110 <b58enc>
c0de3dd2:	b948      	cbnz	r0, c0de3de8 <asset_callback+0x60>
c0de3dd4:	2000      	movs	r0, #0
c0de3dd6:	e008      	b.n	c0de3dea <asset_callback+0x62>
c0de3dd8:	f245 113e 	movw	r1, #20798	@ 0x513e
c0de3ddc:	f2c0 0100 	movt	r1, #0
c0de3de0:	4479      	add	r1, pc
c0de3de2:	2205      	movs	r2, #5
c0de3de4:	f004 fb65 	bl	c0de84b2 <__aeabi_memcpy>
c0de3de8:	2001      	movs	r0, #1
c0de3dea:	b002      	add	sp, #8
c0de3dec:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de3df0 <from_callback>:
c0de3df0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3df2:	b081      	sub	sp, #4
c0de3df4:	f240 6714 	movw	r7, #1556	@ 0x614
c0de3df8:	f2c0 0700 	movt	r7, #0
c0de3dfc:	4605      	mov	r5, r0
c0de3dfe:	eb09 0007 	add.w	r0, r9, r7
c0de3e02:	f100 0696 	add.w	r6, r0, #150	@ 0x96
c0de3e06:	4630      	mov	r0, r6
c0de3e08:	2120      	movs	r1, #32
c0de3e0a:	4614      	mov	r4, r2
c0de3e0c:	f004 fb4e 	bl	c0de84ac <__aeabi_memclr>
c0de3e10:	68aa      	ldr	r2, [r5, #8]
c0de3e12:	4628      	mov	r0, r5
c0de3e14:	4631      	mov	r1, r6
c0de3e16:	f7fd ffdb 	bl	c0de1dd0 <pb_read>
c0de3e1a:	4605      	mov	r5, r0
c0de3e1c:	b130      	cbz	r0, c0de3e2c <from_callback+0x3c>
c0de3e1e:	6820      	ldr	r0, [r4, #0]
c0de3e20:	eb09 0107 	add.w	r1, r9, r7
c0de3e24:	3196      	adds	r1, #150	@ 0x96
c0de3e26:	2220      	movs	r2, #32
c0de3e28:	f004 fb45 	bl	c0de84b6 <__aeabi_memmove>
c0de3e2c:	4628      	mov	r0, r5
c0de3e2e:	b001      	add	sp, #4
c0de3e30:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de3e32 <string_callback>:
c0de3e32:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de3e36:	f240 6814 	movw	r8, #1556	@ 0x614
c0de3e3a:	f2c0 0800 	movt	r8, #0
c0de3e3e:	4606      	mov	r6, r0
c0de3e40:	6884      	ldr	r4, [r0, #8]
c0de3e42:	eb09 0008 	add.w	r0, r9, r8
c0de3e46:	f100 0796 	add.w	r7, r0, #150	@ 0x96
c0de3e4a:	4638      	mov	r0, r7
c0de3e4c:	4621      	mov	r1, r4
c0de3e4e:	4615      	mov	r5, r2
c0de3e50:	f004 fb2c 	bl	c0de84ac <__aeabi_memclr>
c0de3e54:	68b2      	ldr	r2, [r6, #8]
c0de3e56:	4630      	mov	r0, r6
c0de3e58:	4639      	mov	r1, r7
c0de3e5a:	f7fd ffb9 	bl	c0de1dd0 <pb_read>
c0de3e5e:	4606      	mov	r6, r0
c0de3e60:	b130      	cbz	r0, c0de3e70 <string_callback+0x3e>
c0de3e62:	6828      	ldr	r0, [r5, #0]
c0de3e64:	eb09 0108 	add.w	r1, r9, r8
c0de3e68:	3196      	adds	r1, #150	@ 0x96
c0de3e6a:	4622      	mov	r2, r4
c0de3e6c:	f004 fb23 	bl	c0de84b6 <__aeabi_memmove>
c0de3e70:	4630      	mov	r0, r6
c0de3e72:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de3e76 <text_callback>:
c0de3e76:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de3e7a:	b081      	sub	sp, #4
c0de3e7c:	6886      	ldr	r6, [r0, #8]
c0de3e7e:	4604      	mov	r4, r0
c0de3e80:	2e2a      	cmp	r6, #42	@ 0x2a
c0de3e82:	4615      	mov	r5, r2
c0de3e84:	db2c      	blt.n	c0de3ee0 <text_callback+0x6a>
c0de3e86:	f240 6a14 	movw	sl, #1556	@ 0x614
c0de3e8a:	f2c0 0a00 	movt	sl, #0
c0de3e8e:	eb09 000a 	add.w	r0, r9, sl
c0de3e92:	f100 0696 	add.w	r6, r0, #150	@ 0x96
c0de3e96:	4630      	mov	r0, r6
c0de3e98:	212d      	movs	r1, #45	@ 0x2d
c0de3e9a:	f004 fb07 	bl	c0de84ac <__aeabi_memclr>
c0de3e9e:	68a7      	ldr	r7, [r4, #8]
c0de3ea0:	4620      	mov	r0, r4
c0de3ea2:	4631      	mov	r1, r6
c0de3ea4:	2229      	movs	r2, #41	@ 0x29
c0de3ea6:	f7fd ff93 	bl	c0de1dd0 <pb_read>
c0de3eaa:	f04f 0600 	mov.w	r6, #0
c0de3eae:	b398      	cbz	r0, c0de3f18 <text_callback+0xa2>
c0de3eb0:	eb09 010a 	add.w	r1, r9, sl
c0de3eb4:	202e      	movs	r0, #46	@ 0x2e
c0de3eb6:	f801 0fbf 	strb.w	r0, [r1, #191]!
c0de3eba:	70ce      	strb	r6, [r1, #3]
c0de3ebc:	7088      	strb	r0, [r1, #2]
c0de3ebe:	7048      	strb	r0, [r1, #1]
c0de3ec0:	6828      	ldr	r0, [r5, #0]
c0de3ec2:	3929      	subs	r1, #41	@ 0x29
c0de3ec4:	222d      	movs	r2, #45	@ 0x2d
c0de3ec6:	f1a7 0829 	sub.w	r8, r7, #41	@ 0x29
c0de3eca:	f004 faf4 	bl	c0de84b6 <__aeabi_memmove>
c0de3ece:	4620      	mov	r0, r4
c0de3ed0:	2100      	movs	r1, #0
c0de3ed2:	4642      	mov	r2, r8
c0de3ed4:	f7fd ff7c 	bl	c0de1dd0 <pb_read>
c0de3ed8:	2800      	cmp	r0, #0
c0de3eda:	bf18      	it	ne
c0de3edc:	2601      	movne	r6, #1
c0de3ede:	e01b      	b.n	c0de3f18 <text_callback+0xa2>
c0de3ee0:	f240 6814 	movw	r8, #1556	@ 0x614
c0de3ee4:	f2c0 0800 	movt	r8, #0
c0de3ee8:	eb09 0008 	add.w	r0, r9, r8
c0de3eec:	f100 0796 	add.w	r7, r0, #150	@ 0x96
c0de3ef0:	4638      	mov	r0, r7
c0de3ef2:	4631      	mov	r1, r6
c0de3ef4:	f004 fada 	bl	c0de84ac <__aeabi_memclr>
c0de3ef8:	68a2      	ldr	r2, [r4, #8]
c0de3efa:	4620      	mov	r0, r4
c0de3efc:	4639      	mov	r1, r7
c0de3efe:	f7fd ff67 	bl	c0de1dd0 <pb_read>
c0de3f02:	b140      	cbz	r0, c0de3f16 <text_callback+0xa0>
c0de3f04:	6828      	ldr	r0, [r5, #0]
c0de3f06:	eb09 0108 	add.w	r1, r9, r8
c0de3f0a:	3196      	adds	r1, #150	@ 0x96
c0de3f0c:	4632      	mov	r2, r6
c0de3f0e:	f004 fad2 	bl	c0de84b6 <__aeabi_memmove>
c0de3f12:	2601      	movs	r6, #1
c0de3f14:	e000      	b.n	c0de3f18 <text_callback+0xa2>
c0de3f16:	2600      	movs	r6, #0
c0de3f18:	4630      	mov	r0, r6
c0de3f1a:	b001      	add	sp, #4
c0de3f1c:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de3f20 <issue_script_callback>:
c0de3f20:	b510      	push	{r4, lr}
c0de3f22:	6883      	ldr	r3, [r0, #8]
c0de3f24:	4614      	mov	r4, r2
c0de3f26:	2100      	movs	r1, #0
c0de3f28:	461a      	mov	r2, r3
c0de3f2a:	f7fd ff51 	bl	c0de1dd0 <pb_read>
c0de3f2e:	b140      	cbz	r0, c0de3f42 <issue_script_callback+0x22>
c0de3f30:	6820      	ldr	r0, [r4, #0]
c0de3f32:	f245 11a2 	movw	r1, #20898	@ 0x51a2
c0de3f36:	f2c0 0100 	movt	r1, #0
c0de3f3a:	4479      	add	r1, pc
c0de3f3c:	2205      	movs	r2, #5
c0de3f3e:	f004 fab8 	bl	c0de84b2 <__aeabi_memcpy>
c0de3f42:	2000      	movs	r0, #0
c0de3f44:	bd10      	pop	{r4, pc}

c0de3f46 <function_call_callback>:
c0de3f46:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de3f4a:	b081      	sub	sp, #4
c0de3f4c:	f240 6714 	movw	r7, #1556	@ 0x614
c0de3f50:	f2c0 0700 	movt	r7, #0
c0de3f54:	4604      	mov	r4, r0
c0de3f56:	eb09 0007 	add.w	r0, r9, r7
c0de3f5a:	3096      	adds	r0, #150	@ 0x96
c0de3f5c:	212d      	movs	r1, #45	@ 0x2d
c0de3f5e:	4692      	mov	sl, r2
c0de3f60:	f004 faa4 	bl	c0de84ac <__aeabi_memclr>
c0de3f64:	68a5      	ldr	r5, [r4, #8]
c0de3f66:	2d07      	cmp	r5, #7
c0de3f68:	dc0b      	bgt.n	c0de3f82 <function_call_callback+0x3c>
c0de3f6a:	f8da 0000 	ldr.w	r0, [sl]
c0de3f6e:	f245 116e 	movw	r1, #20846	@ 0x516e
c0de3f72:	f2c0 0100 	movt	r1, #0
c0de3f76:	4479      	add	r1, pc
c0de3f78:	222d      	movs	r2, #45	@ 0x2d
c0de3f7a:	f004 fa9a 	bl	c0de84b2 <__aeabi_memcpy>
c0de3f7e:	2601      	movs	r6, #1
c0de3f80:	e04d      	b.n	c0de401e <function_call_callback+0xd8>
c0de3f82:	eb09 0007 	add.w	r0, r9, r7
c0de3f86:	f100 0196 	add.w	r1, r0, #150	@ 0x96
c0de3f8a:	4620      	mov	r0, r4
c0de3f8c:	2207      	movs	r2, #7
c0de3f8e:	f7fd ff1f 	bl	c0de1dd0 <pb_read>
c0de3f92:	2800      	cmp	r0, #0
c0de3f94:	d042      	beq.n	c0de401c <function_call_callback+0xd6>
c0de3f96:	eb09 0007 	add.w	r0, r9, r7
c0de3f9a:	3099      	adds	r0, #153	@ 0x99
c0de3f9c:	f7fc fcb5 	bl	c0de090a <deserialize_uint32_t>
c0de3fa0:	282a      	cmp	r0, #42	@ 0x2a
c0de3fa2:	d31e      	bcc.n	c0de3fe2 <function_call_callback+0x9c>
c0de3fa4:	eb09 0007 	add.w	r0, r9, r7
c0de3fa8:	f100 0196 	add.w	r1, r0, #150	@ 0x96
c0de3fac:	4620      	mov	r0, r4
c0de3fae:	2229      	movs	r2, #41	@ 0x29
c0de3fb0:	f7fd ff0e 	bl	c0de1dd0 <pb_read>
c0de3fb4:	f04f 0600 	mov.w	r6, #0
c0de3fb8:	b388      	cbz	r0, c0de401e <function_call_callback+0xd8>
c0de3fba:	eb09 0107 	add.w	r1, r9, r7
c0de3fbe:	202e      	movs	r0, #46	@ 0x2e
c0de3fc0:	f801 0fbf 	strb.w	r0, [r1, #191]!
c0de3fc4:	70ce      	strb	r6, [r1, #3]
c0de3fc6:	7088      	strb	r0, [r1, #2]
c0de3fc8:	7048      	strb	r0, [r1, #1]
c0de3fca:	f8da 0000 	ldr.w	r0, [sl]
c0de3fce:	3929      	subs	r1, #41	@ 0x29
c0de3fd0:	222d      	movs	r2, #45	@ 0x2d
c0de3fd2:	f1a5 0830 	sub.w	r8, r5, #48	@ 0x30
c0de3fd6:	f004 fa6e 	bl	c0de84b6 <__aeabi_memmove>
c0de3fda:	4620      	mov	r0, r4
c0de3fdc:	2100      	movs	r1, #0
c0de3fde:	4642      	mov	r2, r8
c0de3fe0:	e017      	b.n	c0de4012 <function_call_callback+0xcc>
c0de3fe2:	4606      	mov	r6, r0
c0de3fe4:	eb09 0007 	add.w	r0, r9, r7
c0de3fe8:	f100 0196 	add.w	r1, r0, #150	@ 0x96
c0de3fec:	4620      	mov	r0, r4
c0de3fee:	4632      	mov	r2, r6
c0de3ff0:	f7fd feee 	bl	c0de1dd0 <pb_read>
c0de3ff4:	b190      	cbz	r0, c0de401c <function_call_callback+0xd6>
c0de3ff6:	1fe8      	subs	r0, r5, #7
c0de3ff8:	1b86      	subs	r6, r0, r6
c0de3ffa:	f8da 0000 	ldr.w	r0, [sl]
c0de3ffe:	eb09 0107 	add.w	r1, r9, r7
c0de4002:	3196      	adds	r1, #150	@ 0x96
c0de4004:	222d      	movs	r2, #45	@ 0x2d
c0de4006:	f004 fa56 	bl	c0de84b6 <__aeabi_memmove>
c0de400a:	4620      	mov	r0, r4
c0de400c:	2100      	movs	r1, #0
c0de400e:	4632      	mov	r2, r6
c0de4010:	2600      	movs	r6, #0
c0de4012:	f7fd fedd 	bl	c0de1dd0 <pb_read>
c0de4016:	2800      	cmp	r0, #0
c0de4018:	d1b1      	bne.n	c0de3f7e <function_call_callback+0x38>
c0de401a:	e000      	b.n	c0de401e <function_call_callback+0xd8>
c0de401c:	2600      	movs	r6, #0
c0de401e:	4630      	mov	r0, r6
c0de4020:	b001      	add	sp, #4
c0de4022:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de4026 <transaction_data_callback>:
c0de4026:	6882      	ldr	r2, [r0, #8]
c0de4028:	2100      	movs	r1, #0
c0de402a:	f7fd bed1 	b.w	c0de1dd0 <pb_read>
c0de402e:	d4d4      	bmi.n	c0de3fda <function_call_callback+0x94>

c0de4030 <pb_find_child>:
c0de4030:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de4034:	b08d      	sub	sp, #52	@ 0x34
c0de4036:	f10d 0133 	add.w	r1, sp, #51	@ 0x33
c0de403a:	aa0b      	add	r2, sp, #44	@ 0x2c
c0de403c:	f10d 032b 	add.w	r3, sp, #43	@ 0x2b
c0de4040:	4604      	mov	r4, r0
c0de4042:	f7fd ffcb 	bl	c0de1fdc <pb_decode_tag>
c0de4046:	b360      	cbz	r0, c0de40a2 <pb_find_child+0x72>
c0de4048:	f244 7876 	movw	r8, #18294	@ 0x4776
c0de404c:	f2c0 0800 	movt	r8, #0
c0de4050:	44f8      	add	r8, pc
c0de4052:	46ea      	mov	sl, sp
c0de4054:	f10d 0733 	add.w	r7, sp, #51	@ 0x33
c0de4058:	ad0b      	add	r5, sp, #44	@ 0x2c
c0de405a:	f10d 062b 	add.w	r6, sp, #43	@ 0x2b
c0de405e:	bf00      	nop
c0de4060:	f89d 1033 	ldrb.w	r1, [sp, #51]	@ 0x33
c0de4064:	2902      	cmp	r1, #2
c0de4066:	d111      	bne.n	c0de408c <pb_find_child+0x5c>
c0de4068:	4650      	mov	r0, sl
c0de406a:	4641      	mov	r1, r8
c0de406c:	2200      	movs	r2, #0
c0de406e:	f7fd fc09 	bl	c0de1884 <pb_field_iter_begin>
c0de4072:	b148      	cbz	r0, c0de4088 <pb_find_child+0x58>
c0de4074:	990b      	ldr	r1, [sp, #44]	@ 0x2c
c0de4076:	4650      	mov	r0, sl
c0de4078:	f7fd fd52 	bl	c0de1b20 <pb_field_iter_find>
c0de407c:	b120      	cbz	r0, c0de4088 <pb_find_child+0x58>
c0de407e:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de4080:	f1a0 0167 	sub.w	r1, r0, #103	@ 0x67
c0de4084:	290f      	cmp	r1, #15
c0de4086:	d30d      	bcc.n	c0de40a4 <pb_find_child+0x74>
c0de4088:	f89d 1033 	ldrb.w	r1, [sp, #51]	@ 0x33
c0de408c:	4620      	mov	r0, r4
c0de408e:	f7fd ffbb 	bl	c0de2008 <pb_skip_field>
c0de4092:	4620      	mov	r0, r4
c0de4094:	4639      	mov	r1, r7
c0de4096:	462a      	mov	r2, r5
c0de4098:	4633      	mov	r3, r6
c0de409a:	f7fd ff9f 	bl	c0de1fdc <pb_decode_tag>
c0de409e:	2800      	cmp	r0, #0
c0de40a0:	d1de      	bne.n	c0de4060 <pb_find_child+0x30>
c0de40a2:	2000      	movs	r0, #0
c0de40a4:	b00d      	add	sp, #52	@ 0x34
c0de40a6:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de40aa <pb_decode_child>:
c0de40aa:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de40ac:	b085      	sub	sp, #20
c0de40ae:	460e      	mov	r6, r1
c0de40b0:	a901      	add	r1, sp, #4
c0de40b2:	4615      	mov	r5, r2
c0de40b4:	4604      	mov	r4, r0
c0de40b6:	f7fd ffe9 	bl	c0de208c <pb_make_string_substream>
c0de40ba:	b168      	cbz	r0, c0de40d8 <pb_decode_child+0x2e>
c0de40bc:	af01      	add	r7, sp, #4
c0de40be:	4638      	mov	r0, r7
c0de40c0:	4631      	mov	r1, r6
c0de40c2:	462a      	mov	r2, r5
c0de40c4:	f7fe fa53 	bl	c0de256e <pb_decode>
c0de40c8:	4605      	mov	r5, r0
c0de40ca:	4620      	mov	r0, r4
c0de40cc:	4639      	mov	r1, r7
c0de40ce:	f7fe f804 	bl	c0de20da <pb_close_string_substream>
c0de40d2:	b10d      	cbz	r5, c0de40d8 <pb_decode_child+0x2e>
c0de40d4:	b005      	add	sp, #20
c0de40d6:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de40d8:	f249 1005 	movw	r0, #37125	@ 0x9105
c0de40dc:	f003 fda1 	bl	c0de7c22 <os_longjmp>

c0de40e0 <build_issue_protobuf>:
c0de40e0:	b570      	push	{r4, r5, r6, lr}
c0de40e2:	b08c      	sub	sp, #48	@ 0x30
c0de40e4:	2100      	movs	r1, #0
c0de40e6:	f240 0608 	movw	r6, #8
c0de40ea:	e9cd 1108 	strd	r1, r1, [sp, #32]
c0de40ee:	e9cd 1106 	strd	r1, r1, [sp, #24]
c0de40f2:	f64f 5171 	movw	r1, #64881	@ 0xfd71
c0de40f6:	f2c0 0600 	movt	r6, #0
c0de40fa:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de40fe:	eb09 0506 	add.w	r5, r9, r6
c0de4102:	4479      	add	r1, pc
c0de4104:	f105 02fd 	add.w	r2, r5, #253	@ 0xfd
c0de4108:	9102      	str	r1, [sp, #8]
c0de410a:	e9cd 2103 	strd	r2, r1, [sp, #12]
c0de410e:	f505 7195 	add.w	r1, r5, #298	@ 0x12a
c0de4112:	9105      	str	r1, [sp, #20]
c0de4114:	f64f 6101 	movw	r1, #65025	@ 0xfe01
c0de4118:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de411c:	4479      	add	r1, pc
c0de411e:	910a      	str	r1, [sp, #40]	@ 0x28
c0de4120:	f205 11d5 	addw	r1, r5, #469	@ 0x1d5
c0de4124:	910b      	str	r1, [sp, #44]	@ 0x2c
c0de4126:	f244 716a 	movw	r1, #18282	@ 0x476a
c0de412a:	f2c0 0100 	movt	r1, #0
c0de412e:	4479      	add	r1, pc
c0de4130:	aa02      	add	r2, sp, #8
c0de4132:	f7ff ffba 	bl	c0de40aa <pb_decode_child>
c0de4136:	9b08      	ldr	r3, [sp, #32]
c0de4138:	f644 2214 	movw	r2, #18964	@ 0x4a14
c0de413c:	f2c0 0200 	movt	r2, #0
c0de4140:	f205 107b 	addw	r0, r5, #379	@ 0x17b
c0de4144:	447a      	add	r2, pc
c0de4146:	212d      	movs	r1, #45	@ 0x2d
c0de4148:	f003 fd72 	bl	c0de7c30 <snprintf>
c0de414c:	e9dd 0106 	ldrd	r0, r1, [sp, #24]
c0de4150:	f89d 2020 	ldrb.w	r2, [sp, #32]
c0de4154:	2416      	movs	r4, #22
c0de4156:	f205 1357 	addw	r3, r5, #343	@ 0x157
c0de415a:	9400      	str	r4, [sp, #0]
c0de415c:	f7ff fd7e 	bl	c0de3c5c <print_amount>
c0de4160:	f89d 0024 	ldrb.w	r0, [sp, #36]	@ 0x24
c0de4164:	b150      	cbz	r0, c0de417c <build_issue_protobuf+0x9c>
c0de4166:	f644 7166 	movw	r1, #20326	@ 0x4f66
c0de416a:	eb09 0006 	add.w	r0, r9, r6
c0de416e:	f2c0 0100 	movt	r1, #0
c0de4172:	f500 70d4 	add.w	r0, r0, #424	@ 0x1a8
c0de4176:	4479      	add	r1, pc
c0de4178:	2205      	movs	r2, #5
c0de417a:	e009      	b.n	c0de4190 <build_issue_protobuf+0xb0>
c0de417c:	f644 7161 	movw	r1, #20321	@ 0x4f61
c0de4180:	eb09 0006 	add.w	r0, r9, r6
c0de4184:	f2c0 0100 	movt	r1, #0
c0de4188:	f500 70d4 	add.w	r0, r0, #424	@ 0x1a8
c0de418c:	4479      	add	r1, pc
c0de418e:	2206      	movs	r2, #6
c0de4190:	f004 f98f 	bl	c0de84b2 <__aeabi_memcpy>
c0de4194:	eb09 0006 	add.w	r0, r9, r6
c0de4198:	f200 10d5 	addw	r0, r0, #469	@ 0x1d5
c0de419c:	f004 f9e6 	bl	c0de856c <strlen>
c0de41a0:	b958      	cbnz	r0, c0de41ba <build_issue_protobuf+0xda>
c0de41a2:	f644 713b 	movw	r1, #20283	@ 0x4f3b
c0de41a6:	eb09 0006 	add.w	r0, r9, r6
c0de41aa:	f2c0 0100 	movt	r1, #0
c0de41ae:	f200 10d5 	addw	r0, r0, #469	@ 0x1d5
c0de41b2:	4479      	add	r1, pc
c0de41b4:	2206      	movs	r2, #6
c0de41b6:	f004 f97c 	bl	c0de84b2 <__aeabi_memcpy>
c0de41ba:	b00c      	add	sp, #48	@ 0x30
c0de41bc:	bd70      	pop	{r4, r5, r6, pc}

c0de41be <build_transfer_protobuf>:
c0de41be:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de41c0:	b093      	sub	sp, #76	@ 0x4c
c0de41c2:	ac02      	add	r4, sp, #8
c0de41c4:	4605      	mov	r5, r0
c0de41c6:	4620      	mov	r0, r4
c0de41c8:	2138      	movs	r1, #56	@ 0x38
c0de41ca:	f004 f96f 	bl	c0de84ac <__aeabi_memclr>
c0de41ce:	f64f 30a7 	movw	r0, #64423	@ 0xfba7
c0de41d2:	f240 0608 	movw	r6, #8
c0de41d6:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de41da:	f2c0 0600 	movt	r6, #0
c0de41de:	4478      	add	r0, pc
c0de41e0:	eb09 0706 	add.w	r7, r9, r6
c0de41e4:	900c      	str	r0, [sp, #48]	@ 0x30
c0de41e6:	f507 7095 	add.w	r0, r7, #298	@ 0x12a
c0de41ea:	900d      	str	r0, [sp, #52]	@ 0x34
c0de41ec:	f64f 407f 	movw	r0, #64639	@ 0xfc7f
c0de41f0:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de41f4:	4478      	add	r0, pc
c0de41f6:	9010      	str	r0, [sp, #64]	@ 0x40
c0de41f8:	f207 107b 	addw	r0, r7, #379	@ 0x17b
c0de41fc:	9011      	str	r0, [sp, #68]	@ 0x44
c0de41fe:	f244 61a4 	movw	r1, #18084	@ 0x46a4
c0de4202:	f2c0 0100 	movt	r1, #0
c0de4206:	4479      	add	r1, pc
c0de4208:	4628      	mov	r0, r5
c0de420a:	4622      	mov	r2, r4
c0de420c:	f7ff ff4d 	bl	c0de40aa <pb_decode_child>
c0de4210:	e9dd 010e 	ldrd	r0, r1, [sp, #56]	@ 0x38
c0de4214:	f897 2321 	ldrb.w	r2, [r7, #801]	@ 0x321
c0de4218:	2516      	movs	r5, #22
c0de421a:	f107 03fd 	add.w	r3, r7, #253	@ 0xfd
c0de421e:	9500      	str	r5, [sp, #0]
c0de4220:	f7ff fd1c 	bl	c0de3c5c <print_amount>
c0de4224:	f8bd 000a 	ldrh.w	r0, [sp, #10]
c0de4228:	1d23      	adds	r3, r4, #4
c0de422a:	2801      	cmp	r0, #1
c0de422c:	eb09 0006 	add.w	r0, r9, r6
c0de4230:	d107      	bne.n	c0de4242 <build_transfer_protobuf+0x84>
c0de4232:	f890 132c 	ldrb.w	r1, [r0, #812]	@ 0x32c
c0de4236:	f200 1257 	addw	r2, r0, #343	@ 0x157
c0de423a:	4618      	mov	r0, r3
c0de423c:	f7fc fb20 	bl	c0de0880 <waves_public_key_hash_to_address>
c0de4240:	e005      	b.n	c0de424e <build_transfer_protobuf+0x90>
c0de4242:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de4246:	4619      	mov	r1, r3
c0de4248:	221f      	movs	r2, #31
c0de424a:	f004 f932 	bl	c0de84b2 <__aeabi_memcpy>
c0de424e:	eb09 0006 	add.w	r0, r9, r6
c0de4252:	f500 7095 	add.w	r0, r0, #298	@ 0x12a
c0de4256:	f004 f989 	bl	c0de856c <strlen>
c0de425a:	b958      	cbnz	r0, c0de4274 <build_transfer_protobuf+0xb6>
c0de425c:	f644 41b2 	movw	r1, #19634	@ 0x4cb2
c0de4260:	eb09 0006 	add.w	r0, r9, r6
c0de4264:	f2c0 0100 	movt	r1, #0
c0de4268:	f500 7095 	add.w	r0, r0, #298	@ 0x12a
c0de426c:	4479      	add	r1, pc
c0de426e:	2205      	movs	r2, #5
c0de4270:	f004 f91f 	bl	c0de84b2 <__aeabi_memcpy>
c0de4274:	b013      	add	sp, #76	@ 0x4c
c0de4276:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de4278 <build_reissue_protobuf>:
c0de4278:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de427a:	b08b      	sub	sp, #44	@ 0x2c
c0de427c:	ad02      	add	r5, sp, #8
c0de427e:	4604      	mov	r4, r0
c0de4280:	4628      	mov	r0, r5
c0de4282:	2120      	movs	r1, #32
c0de4284:	f004 f912 	bl	c0de84ac <__aeabi_memclr>
c0de4288:	f64f 20ed 	movw	r0, #64237	@ 0xfaed
c0de428c:	f240 0608 	movw	r6, #8
c0de4290:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de4294:	f2c0 0600 	movt	r6, #0
c0de4298:	4478      	add	r0, pc
c0de429a:	eb09 0706 	add.w	r7, r9, r6
c0de429e:	9004      	str	r0, [sp, #16]
c0de42a0:	f507 7095 	add.w	r0, r7, #298	@ 0x12a
c0de42a4:	9005      	str	r0, [sp, #20]
c0de42a6:	f244 610e 	movw	r1, #17934	@ 0x460e
c0de42aa:	f2c0 0100 	movt	r1, #0
c0de42ae:	4479      	add	r1, pc
c0de42b0:	4620      	mov	r0, r4
c0de42b2:	462a      	mov	r2, r5
c0de42b4:	f7ff fef9 	bl	c0de40aa <pb_decode_child>
c0de42b8:	e9dd 0106 	ldrd	r0, r1, [sp, #24]
c0de42bc:	f897 2321 	ldrb.w	r2, [r7, #801]	@ 0x321
c0de42c0:	2516      	movs	r5, #22
c0de42c2:	f107 03fd 	add.w	r3, r7, #253	@ 0xfd
c0de42c6:	9500      	str	r5, [sp, #0]
c0de42c8:	f7ff fcc8 	bl	c0de3c5c <print_amount>
c0de42cc:	f89d 0020 	ldrb.w	r0, [sp, #32]
c0de42d0:	b150      	cbz	r0, c0de42e8 <build_reissue_protobuf+0x70>
c0de42d2:	f644 51fa 	movw	r1, #19962	@ 0x4dfa
c0de42d6:	eb09 0006 	add.w	r0, r9, r6
c0de42da:	f2c0 0100 	movt	r1, #0
c0de42de:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de42e2:	4479      	add	r1, pc
c0de42e4:	2205      	movs	r2, #5
c0de42e6:	e009      	b.n	c0de42fc <build_reissue_protobuf+0x84>
c0de42e8:	f644 51f5 	movw	r1, #19957	@ 0x4df5
c0de42ec:	eb09 0006 	add.w	r0, r9, r6
c0de42f0:	f2c0 0100 	movt	r1, #0
c0de42f4:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de42f8:	4479      	add	r1, pc
c0de42fa:	2206      	movs	r2, #6
c0de42fc:	f004 f8d9 	bl	c0de84b2 <__aeabi_memcpy>
c0de4300:	b00b      	add	sp, #44	@ 0x2c
c0de4302:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de4304 <build_burn_protobuf>:
c0de4304:	b570      	push	{r4, r5, r6, lr}
c0de4306:	b088      	sub	sp, #32
c0de4308:	ad02      	add	r5, sp, #8
c0de430a:	4604      	mov	r4, r0
c0de430c:	4628      	mov	r0, r5
c0de430e:	2118      	movs	r1, #24
c0de4310:	f004 f8cc 	bl	c0de84ac <__aeabi_memclr>
c0de4314:	f64f 2069 	movw	r0, #64105	@ 0xfa69
c0de4318:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de431c:	4478      	add	r0, pc
c0de431e:	9004      	str	r0, [sp, #16]
c0de4320:	f240 0008 	movw	r0, #8
c0de4324:	f2c0 0000 	movt	r0, #0
c0de4328:	eb09 0600 	add.w	r6, r9, r0
c0de432c:	f506 7095 	add.w	r0, r6, #298	@ 0x12a
c0de4330:	9005      	str	r0, [sp, #20]
c0de4332:	f244 5194 	movw	r1, #17812	@ 0x4594
c0de4336:	f2c0 0100 	movt	r1, #0
c0de433a:	4479      	add	r1, pc
c0de433c:	4620      	mov	r0, r4
c0de433e:	462a      	mov	r2, r5
c0de4340:	f7ff feb3 	bl	c0de40aa <pb_decode_child>
c0de4344:	e9dd 0106 	ldrd	r0, r1, [sp, #24]
c0de4348:	f896 2321 	ldrb.w	r2, [r6, #801]	@ 0x321
c0de434c:	2516      	movs	r5, #22
c0de434e:	f106 03fd 	add.w	r3, r6, #253	@ 0xfd
c0de4352:	9500      	str	r5, [sp, #0]
c0de4354:	f7ff fc82 	bl	c0de3c5c <print_amount>
c0de4358:	b008      	add	sp, #32
c0de435a:	bd70      	pop	{r4, r5, r6, pc}

c0de435c <build_lease_protobuf>:
c0de435c:	b570      	push	{r4, r5, r6, lr}
c0de435e:	b08e      	sub	sp, #56	@ 0x38
c0de4360:	ac02      	add	r4, sp, #8
c0de4362:	4605      	mov	r5, r0
c0de4364:	4620      	mov	r0, r4
c0de4366:	2130      	movs	r1, #48	@ 0x30
c0de4368:	f004 f8a0 	bl	c0de84ac <__aeabi_memclr>
c0de436c:	f244 517e 	movw	r1, #17790	@ 0x457e
c0de4370:	f2c0 0100 	movt	r1, #0
c0de4374:	4479      	add	r1, pc
c0de4376:	4628      	mov	r0, r5
c0de4378:	4622      	mov	r2, r4
c0de437a:	f7ff fe96 	bl	c0de40aa <pb_decode_child>
c0de437e:	f240 0608 	movw	r6, #8
c0de4382:	f2c0 0600 	movt	r6, #0
c0de4386:	eb09 0306 	add.w	r3, r9, r6
c0de438a:	e9dd 010c 	ldrd	r0, r1, [sp, #48]	@ 0x30
c0de438e:	f893 2321 	ldrb.w	r2, [r3, #801]	@ 0x321
c0de4392:	2516      	movs	r5, #22
c0de4394:	33fd      	adds	r3, #253	@ 0xfd
c0de4396:	9500      	str	r5, [sp, #0]
c0de4398:	f7ff fc60 	bl	c0de3c5c <print_amount>
c0de439c:	f8bd 000a 	ldrh.w	r0, [sp, #10]
c0de43a0:	1d23      	adds	r3, r4, #4
c0de43a2:	2801      	cmp	r0, #1
c0de43a4:	eb09 0006 	add.w	r0, r9, r6
c0de43a8:	d107      	bne.n	c0de43ba <build_lease_protobuf+0x5e>
c0de43aa:	f890 132c 	ldrb.w	r1, [r0, #812]	@ 0x32c
c0de43ae:	f200 1257 	addw	r2, r0, #343	@ 0x157
c0de43b2:	4618      	mov	r0, r3
c0de43b4:	f7fc fa64 	bl	c0de0880 <waves_public_key_hash_to_address>
c0de43b8:	e005      	b.n	c0de43c6 <build_lease_protobuf+0x6a>
c0de43ba:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de43be:	4619      	mov	r1, r3
c0de43c0:	221f      	movs	r2, #31
c0de43c2:	f004 f876 	bl	c0de84b2 <__aeabi_memcpy>
c0de43c6:	b00e      	add	sp, #56	@ 0x38
c0de43c8:	bd70      	pop	{r4, r5, r6, pc}

c0de43ca <build_mass_transfer_protobuf>:
c0de43ca:	b5b0      	push	{r4, r5, r7, lr}
c0de43cc:	b084      	sub	sp, #16
c0de43ce:	f64f 11ab 	movw	r1, #63915	@ 0xf9ab
c0de43d2:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de43d6:	f240 0508 	movw	r5, #8
c0de43da:	4479      	add	r1, pc
c0de43dc:	f2c0 0500 	movt	r5, #0
c0de43e0:	9100      	str	r1, [sp, #0]
c0de43e2:	eb09 0105 	add.w	r1, r9, r5
c0de43e6:	f101 04fd 	add.w	r4, r1, #253	@ 0xfd
c0de43ea:	9401      	str	r4, [sp, #4]
c0de43ec:	f64f 227f 	movw	r2, #64127	@ 0xfa7f
c0de43f0:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de43f4:	447a      	add	r2, pc
c0de43f6:	f501 7195 	add.w	r1, r1, #298	@ 0x12a
c0de43fa:	9202      	str	r2, [sp, #8]
c0de43fc:	9103      	str	r1, [sp, #12]
c0de43fe:	f244 5122 	movw	r1, #17698	@ 0x4522
c0de4402:	f2c0 0100 	movt	r1, #0
c0de4406:	4479      	add	r1, pc
c0de4408:	466a      	mov	r2, sp
c0de440a:	f7ff fe4e 	bl	c0de40aa <pb_decode_child>
c0de440e:	4620      	mov	r0, r4
c0de4410:	f004 f8ac 	bl	c0de856c <strlen>
c0de4414:	b950      	cbnz	r0, c0de442c <build_mass_transfer_protobuf+0x62>
c0de4416:	f644 21fa 	movw	r1, #19194	@ 0x4afa
c0de441a:	eb09 0005 	add.w	r0, r9, r5
c0de441e:	f2c0 0100 	movt	r1, #0
c0de4422:	30fd      	adds	r0, #253	@ 0xfd
c0de4424:	4479      	add	r1, pc
c0de4426:	2205      	movs	r2, #5
c0de4428:	f004 f843 	bl	c0de84b2 <__aeabi_memcpy>
c0de442c:	b004      	add	sp, #16
c0de442e:	bdb0      	pop	{r4, r5, r7, pc}

c0de4430 <build_sponsor_fee_protobuf>:
c0de4430:	b570      	push	{r4, r5, r6, lr}
c0de4432:	b088      	sub	sp, #32
c0de4434:	ad02      	add	r5, sp, #8
c0de4436:	4604      	mov	r4, r0
c0de4438:	4628      	mov	r0, r5
c0de443a:	2118      	movs	r1, #24
c0de443c:	f004 f836 	bl	c0de84ac <__aeabi_memclr>
c0de4440:	f64f 103d 	movw	r0, #63805	@ 0xf93d
c0de4444:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de4448:	4478      	add	r0, pc
c0de444a:	9004      	str	r0, [sp, #16]
c0de444c:	f240 0008 	movw	r0, #8
c0de4450:	f2c0 0000 	movt	r0, #0
c0de4454:	eb09 0600 	add.w	r6, r9, r0
c0de4458:	f506 7095 	add.w	r0, r6, #298	@ 0x12a
c0de445c:	9005      	str	r0, [sp, #20]
c0de445e:	f244 41f8 	movw	r1, #17656	@ 0x44f8
c0de4462:	f2c0 0100 	movt	r1, #0
c0de4466:	4479      	add	r1, pc
c0de4468:	4620      	mov	r0, r4
c0de446a:	462a      	mov	r2, r5
c0de446c:	f7ff fe1d 	bl	c0de40aa <pb_decode_child>
c0de4470:	e9dd 0106 	ldrd	r0, r1, [sp, #24]
c0de4474:	f896 2321 	ldrb.w	r2, [r6, #801]	@ 0x321
c0de4478:	2516      	movs	r5, #22
c0de447a:	f106 03fd 	add.w	r3, r6, #253	@ 0xfd
c0de447e:	9500      	str	r5, [sp, #0]
c0de4480:	f7ff fbec 	bl	c0de3c5c <print_amount>
c0de4484:	b008      	add	sp, #32
c0de4486:	bd70      	pop	{r4, r5, r6, pc}

c0de4488 <build_invoke_script_protobuf>:
c0de4488:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de448a:	b097      	sub	sp, #92	@ 0x5c
c0de448c:	af02      	add	r7, sp, #8
c0de448e:	4605      	mov	r5, r0
c0de4490:	4638      	mov	r0, r7
c0de4492:	2150      	movs	r1, #80	@ 0x50
c0de4494:	f004 f80a 	bl	c0de84ac <__aeabi_memclr>
c0de4498:	f64f 209f 	movw	r0, #64159	@ 0xfa9f
c0de449c:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de44a0:	f240 0608 	movw	r6, #8
c0de44a4:	4478      	add	r0, pc
c0de44a6:	f2c0 0600 	movt	r6, #0
c0de44aa:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de44ac:	eb09 0006 	add.w	r0, r9, r6
c0de44b0:	f500 7195 	add.w	r1, r0, #298	@ 0x12a
c0de44b4:	910c      	str	r1, [sp, #48]	@ 0x30
c0de44b6:	f64f 01c7 	movw	r1, #63687	@ 0xf8c7
c0de44ba:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de44be:	4479      	add	r1, pc
c0de44c0:	f100 02fd 	add.w	r2, r0, #253	@ 0xfd
c0de44c4:	f500 70d4 	add.w	r0, r0, #424	@ 0x1a8
c0de44c8:	910e      	str	r1, [sp, #56]	@ 0x38
c0de44ca:	920f      	str	r2, [sp, #60]	@ 0x3c
c0de44cc:	9112      	str	r1, [sp, #72]	@ 0x48
c0de44ce:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de44d0:	f244 41aa 	movw	r1, #17578	@ 0x44aa
c0de44d4:	f2c0 0100 	movt	r1, #0
c0de44d8:	4479      	add	r1, pc
c0de44da:	4628      	mov	r0, r5
c0de44dc:	463a      	mov	r2, r7
c0de44de:	f7ff fde4 	bl	c0de40aa <pb_decode_child>
c0de44e2:	f8bd 0034 	ldrh.w	r0, [sp, #52]	@ 0x34
c0de44e6:	b3d8      	cbz	r0, c0de4560 <build_invoke_script_protobuf+0xd8>
c0de44e8:	eb09 0506 	add.w	r5, r9, r6
c0de44ec:	e9dd 0110 	ldrd	r0, r1, [sp, #64]	@ 0x40
c0de44f0:	f895 2321 	ldrb.w	r2, [r5, #801]	@ 0x321
c0de44f4:	2416      	movs	r4, #22
c0de44f6:	f205 137b 	addw	r3, r5, #379	@ 0x17b
c0de44fa:	9400      	str	r4, [sp, #0]
c0de44fc:	f7ff fbae 	bl	c0de3c5c <print_amount>
c0de4500:	f105 00fd 	add.w	r0, r5, #253	@ 0xfd
c0de4504:	f004 f832 	bl	c0de856c <strlen>
c0de4508:	b950      	cbnz	r0, c0de4520 <build_invoke_script_protobuf+0x98>
c0de450a:	f644 2106 	movw	r1, #18950	@ 0x4a06
c0de450e:	eb09 0006 	add.w	r0, r9, r6
c0de4512:	f2c0 0100 	movt	r1, #0
c0de4516:	30fd      	adds	r0, #253	@ 0xfd
c0de4518:	4479      	add	r1, pc
c0de451a:	2205      	movs	r2, #5
c0de451c:	f003 ffc9 	bl	c0de84b2 <__aeabi_memcpy>
c0de4520:	f8bd 0034 	ldrh.w	r0, [sp, #52]	@ 0x34
c0de4524:	2802      	cmp	r0, #2
c0de4526:	d11b      	bne.n	c0de4560 <build_invoke_script_protobuf+0xd8>
c0de4528:	eb09 0406 	add.w	r4, r9, r6
c0de452c:	e9dd 0114 	ldrd	r0, r1, [sp, #80]	@ 0x50
c0de4530:	f894 2322 	ldrb.w	r2, [r4, #802]	@ 0x322
c0de4534:	2516      	movs	r5, #22
c0de4536:	f204 13d5 	addw	r3, r4, #469	@ 0x1d5
c0de453a:	9500      	str	r5, [sp, #0]
c0de453c:	f7ff fb8e 	bl	c0de3c5c <print_amount>
c0de4540:	f504 70d4 	add.w	r0, r4, #424	@ 0x1a8
c0de4544:	f004 f812 	bl	c0de856c <strlen>
c0de4548:	b950      	cbnz	r0, c0de4560 <build_invoke_script_protobuf+0xd8>
c0de454a:	f644 11c6 	movw	r1, #18886	@ 0x49c6
c0de454e:	eb09 0006 	add.w	r0, r9, r6
c0de4552:	f2c0 0100 	movt	r1, #0
c0de4556:	30fd      	adds	r0, #253	@ 0xfd
c0de4558:	4479      	add	r1, pc
c0de455a:	2205      	movs	r2, #5
c0de455c:	f003 ffa9 	bl	c0de84b2 <__aeabi_memcpy>
c0de4560:	f8bd 000a 	ldrh.w	r0, [sp, #10]
c0de4564:	1d3b      	adds	r3, r7, #4
c0de4566:	2801      	cmp	r0, #1
c0de4568:	eb09 0006 	add.w	r0, r9, r6
c0de456c:	d107      	bne.n	c0de457e <build_invoke_script_protobuf+0xf6>
c0de456e:	f890 132c 	ldrb.w	r1, [r0, #812]	@ 0x32c
c0de4572:	f200 1257 	addw	r2, r0, #343	@ 0x157
c0de4576:	4618      	mov	r0, r3
c0de4578:	f7fc f982 	bl	c0de0880 <waves_public_key_hash_to_address>
c0de457c:	e005      	b.n	c0de458a <build_invoke_script_protobuf+0x102>
c0de457e:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de4582:	4619      	mov	r1, r3
c0de4584:	221f      	movs	r2, #31
c0de4586:	f003 ff94 	bl	c0de84b2 <__aeabi_memcpy>
c0de458a:	b017      	add	sp, #92	@ 0x5c
c0de458c:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de458e <build_protobuf_child_tx>:
c0de458e:	b510      	push	{r4, lr}
c0de4590:	b08c      	sub	sp, #48	@ 0x30
c0de4592:	4694      	mov	ip, r2
c0de4594:	ac02      	add	r4, sp, #8
c0de4596:	460a      	mov	r2, r1
c0de4598:	4601      	mov	r1, r0
c0de459a:	f04f 0e00 	mov.w	lr, #0
c0de459e:	9300      	str	r3, [sp, #0]
c0de45a0:	4620      	mov	r0, r4
c0de45a2:	4663      	mov	r3, ip
c0de45a4:	f8cd e004 	str.w	lr, [sp, #4]
c0de45a8:	f7fd fbc6 	bl	c0de1d38 <pb_istream_from_apdu>
c0de45ac:	4620      	mov	r0, r4
c0de45ae:	f7ff fd3f 	bl	c0de4030 <pb_find_child>
c0de45b2:	f240 0408 	movw	r4, #8
c0de45b6:	286e      	cmp	r0, #110	@ 0x6e
c0de45b8:	f2c0 0400 	movt	r4, #0
c0de45bc:	dc0c      	bgt.n	c0de45d8 <build_protobuf_child_tx+0x4a>
c0de45be:	2869      	cmp	r0, #105	@ 0x69
c0de45c0:	dd23      	ble.n	c0de460a <build_protobuf_child_tx+0x7c>
c0de45c2:	286c      	cmp	r0, #108	@ 0x6c
c0de45c4:	dc3c      	bgt.n	c0de4640 <build_protobuf_child_tx+0xb2>
c0de45c6:	286a      	cmp	r0, #106	@ 0x6a
c0de45c8:	d075      	beq.n	c0de46b6 <build_protobuf_child_tx+0x128>
c0de45ca:	286c      	cmp	r0, #108	@ 0x6c
c0de45cc:	f040 80b1 	bne.w	c0de4732 <build_protobuf_child_tx+0x1a4>
c0de45d0:	a802      	add	r0, sp, #8
c0de45d2:	f7ff fec3 	bl	c0de435c <build_lease_protobuf>
c0de45d6:	e09e      	b.n	c0de4716 <build_protobuf_child_tx+0x188>
c0de45d8:	2871      	cmp	r0, #113	@ 0x71
c0de45da:	dd21      	ble.n	c0de4620 <build_protobuf_child_tx+0x92>
c0de45dc:	2873      	cmp	r0, #115	@ 0x73
c0de45de:	dc43      	bgt.n	c0de4668 <build_protobuf_child_tx+0xda>
c0de45e0:	2872      	cmp	r0, #114	@ 0x72
c0de45e2:	d06c      	beq.n	c0de46be <build_protobuf_child_tx+0x130>
c0de45e4:	2873      	cmp	r0, #115	@ 0x73
c0de45e6:	f040 80a4 	bne.w	c0de4732 <build_protobuf_child_tx+0x1a4>
c0de45ea:	f24f 7093 	movw	r0, #63379	@ 0xf793
c0de45ee:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de45f2:	4478      	add	r0, pc
c0de45f4:	9006      	str	r0, [sp, #24]
c0de45f6:	eb09 0004 	add.w	r0, r9, r4
c0de45fa:	30fd      	adds	r0, #253	@ 0xfd
c0de45fc:	9007      	str	r0, [sp, #28]
c0de45fe:	f244 316a 	movw	r1, #17258	@ 0x436a
c0de4602:	f2c0 0100 	movt	r1, #0
c0de4606:	4479      	add	r1, pc
c0de4608:	e081      	b.n	c0de470e <build_protobuf_child_tx+0x180>
c0de460a:	2867      	cmp	r0, #103	@ 0x67
c0de460c:	d05b      	beq.n	c0de46c6 <build_protobuf_child_tx+0x138>
c0de460e:	2868      	cmp	r0, #104	@ 0x68
c0de4610:	d05d      	beq.n	c0de46ce <build_protobuf_child_tx+0x140>
c0de4612:	2869      	cmp	r0, #105	@ 0x69
c0de4614:	f040 808d 	bne.w	c0de4732 <build_protobuf_child_tx+0x1a4>
c0de4618:	a802      	add	r0, sp, #8
c0de461a:	f7ff fe2d 	bl	c0de4278 <build_reissue_protobuf>
c0de461e:	e07a      	b.n	c0de4716 <build_protobuf_child_tx+0x188>
c0de4620:	286f      	cmp	r0, #111	@ 0x6f
c0de4622:	d058      	beq.n	c0de46d6 <build_protobuf_child_tx+0x148>
c0de4624:	2870      	cmp	r0, #112	@ 0x70
c0de4626:	d05a      	beq.n	c0de46de <build_protobuf_child_tx+0x150>
c0de4628:	2871      	cmp	r0, #113	@ 0x71
c0de462a:	f040 8082 	bne.w	c0de4732 <build_protobuf_child_tx+0x1a4>
c0de462e:	2000      	movs	r0, #0
c0de4630:	f88d 0018 	strb.w	r0, [sp, #24]
c0de4634:	f244 3110 	movw	r1, #17168	@ 0x4310
c0de4638:	f2c0 0100 	movt	r1, #0
c0de463c:	4479      	add	r1, pc
c0de463e:	e066      	b.n	c0de470e <build_protobuf_child_tx+0x180>
c0de4640:	286d      	cmp	r0, #109	@ 0x6d
c0de4642:	d055      	beq.n	c0de46f0 <build_protobuf_child_tx+0x162>
c0de4644:	286e      	cmp	r0, #110	@ 0x6e
c0de4646:	d174      	bne.n	c0de4732 <build_protobuf_child_tx+0x1a4>
c0de4648:	f24f 70df 	movw	r0, #63455	@ 0xf7df
c0de464c:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de4650:	4478      	add	r0, pc
c0de4652:	9006      	str	r0, [sp, #24]
c0de4654:	eb09 0004 	add.w	r0, r9, r4
c0de4658:	30fd      	adds	r0, #253	@ 0xfd
c0de465a:	9007      	str	r0, [sp, #28]
c0de465c:	f244 21b2 	movw	r1, #17074	@ 0x42b2
c0de4660:	f2c0 0100 	movt	r1, #0
c0de4664:	4479      	add	r1, pc
c0de4666:	e052      	b.n	c0de470e <build_protobuf_child_tx+0x180>
c0de4668:	2874      	cmp	r0, #116	@ 0x74
c0de466a:	d05e      	beq.n	c0de472a <build_protobuf_child_tx+0x19c>
c0de466c:	2875      	cmp	r0, #117	@ 0x75
c0de466e:	d160      	bne.n	c0de4732 <build_protobuf_child_tx+0x1a4>
c0de4670:	f24f 700d 	movw	r0, #63245	@ 0xf70d
c0de4674:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de4678:	4478      	add	r0, pc
c0de467a:	9006      	str	r0, [sp, #24]
c0de467c:	eb09 0004 	add.w	r0, r9, r4
c0de4680:	f100 01fd 	add.w	r1, r0, #253	@ 0xfd
c0de4684:	9107      	str	r1, [sp, #28]
c0de4686:	f24f 71a1 	movw	r1, #63393	@ 0xf7a1
c0de468a:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de468e:	4479      	add	r1, pc
c0de4690:	9108      	str	r1, [sp, #32]
c0de4692:	f500 7195 	add.w	r1, r0, #298	@ 0x12a
c0de4696:	9109      	str	r1, [sp, #36]	@ 0x24
c0de4698:	f24f 71d3 	movw	r1, #63443	@ 0xf7d3
c0de469c:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de46a0:	4479      	add	r1, pc
c0de46a2:	f200 107b 	addw	r0, r0, #379	@ 0x17b
c0de46a6:	910a      	str	r1, [sp, #40]	@ 0x28
c0de46a8:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de46aa:	f244 21e2 	movw	r1, #17122	@ 0x42e2
c0de46ae:	f2c0 0100 	movt	r1, #0
c0de46b2:	4479      	add	r1, pc
c0de46b4:	e02b      	b.n	c0de470e <build_protobuf_child_tx+0x180>
c0de46b6:	a802      	add	r0, sp, #8
c0de46b8:	f7ff fe24 	bl	c0de4304 <build_burn_protobuf>
c0de46bc:	e02b      	b.n	c0de4716 <build_protobuf_child_tx+0x188>
c0de46be:	a802      	add	r0, sp, #8
c0de46c0:	f7ff feb6 	bl	c0de4430 <build_sponsor_fee_protobuf>
c0de46c4:	e027      	b.n	c0de4716 <build_protobuf_child_tx+0x188>
c0de46c6:	a802      	add	r0, sp, #8
c0de46c8:	f7ff fd0a 	bl	c0de40e0 <build_issue_protobuf>
c0de46cc:	e023      	b.n	c0de4716 <build_protobuf_child_tx+0x188>
c0de46ce:	a802      	add	r0, sp, #8
c0de46d0:	f7ff fd75 	bl	c0de41be <build_transfer_protobuf>
c0de46d4:	e01f      	b.n	c0de4716 <build_protobuf_child_tx+0x188>
c0de46d6:	a802      	add	r0, sp, #8
c0de46d8:	f7ff fe77 	bl	c0de43ca <build_mass_transfer_protobuf>
c0de46dc:	e01b      	b.n	c0de4716 <build_protobuf_child_tx+0x188>
c0de46de:	2000      	movs	r0, #0
c0de46e0:	f88d 0018 	strb.w	r0, [sp, #24]
c0de46e4:	f244 214e 	movw	r1, #16974	@ 0x424e
c0de46e8:	f2c0 0100 	movt	r1, #0
c0de46ec:	4479      	add	r1, pc
c0de46ee:	e00e      	b.n	c0de470e <build_protobuf_child_tx+0x180>
c0de46f0:	f24f 608d 	movw	r0, #63117	@ 0xf68d
c0de46f4:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de46f8:	4478      	add	r0, pc
c0de46fa:	9006      	str	r0, [sp, #24]
c0de46fc:	eb09 0004 	add.w	r0, r9, r4
c0de4700:	30fd      	adds	r0, #253	@ 0xfd
c0de4702:	9007      	str	r0, [sp, #28]
c0de4704:	f244 11f8 	movw	r1, #16888	@ 0x41f8
c0de4708:	f2c0 0100 	movt	r1, #0
c0de470c:	4479      	add	r1, pc
c0de470e:	a802      	add	r0, sp, #8
c0de4710:	aa06      	add	r2, sp, #24
c0de4712:	f7ff fcca 	bl	c0de40aa <pb_decode_child>
c0de4716:	eb09 0004 	add.w	r0, r9, r4
c0de471a:	2101      	movs	r1, #1
c0de471c:	f880 1218 	strb.w	r1, [r0, #536]	@ 0x218
c0de4720:	2108      	movs	r1, #8
c0de4722:	f880 139a 	strb.w	r1, [r0, #922]	@ 0x39a
c0de4726:	b00c      	add	sp, #48	@ 0x30
c0de4728:	bd10      	pop	{r4, pc}
c0de472a:	a802      	add	r0, sp, #8
c0de472c:	f7ff feac 	bl	c0de4488 <build_invoke_script_protobuf>
c0de4730:	e7f1      	b.n	c0de4716 <build_protobuf_child_tx+0x188>
c0de4732:	f249 1005 	movw	r0, #37125	@ 0x9105
c0de4736:	f003 fa74 	bl	c0de7c22 <os_longjmp>

c0de473a <build_protobuf_root_tx>:
c0de473a:	b570      	push	{r4, r5, r6, lr}
c0de473c:	b0a8      	sub	sp, #160	@ 0xa0
c0de473e:	4614      	mov	r4, r2
c0de4740:	9e2c      	ldr	r6, [sp, #176]	@ 0xb0
c0de4742:	ad24      	add	r5, sp, #144	@ 0x90
c0de4744:	460a      	mov	r2, r1
c0de4746:	4601      	mov	r1, r0
c0de4748:	9300      	str	r3, [sp, #0]
c0de474a:	4628      	mov	r0, r5
c0de474c:	4623      	mov	r3, r4
c0de474e:	9601      	str	r6, [sp, #4]
c0de4750:	f7fd faf2 	bl	c0de1d38 <pb_istream_from_apdu>
c0de4754:	ac02      	add	r4, sp, #8
c0de4756:	f104 0008 	add.w	r0, r4, #8
c0de475a:	2180      	movs	r1, #128	@ 0x80
c0de475c:	f003 fea6 	bl	c0de84ac <__aeabi_memclr>
c0de4760:	f64f 00bb 	movw	r0, #63675	@ 0xf8bb
c0de4764:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de4768:	4478      	add	r0, pc
c0de476a:	900c      	str	r0, [sp, #48]	@ 0x30
c0de476c:	f24f 6075 	movw	r0, #63093	@ 0xf675
c0de4770:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de4774:	f240 0608 	movw	r6, #8
c0de4778:	4478      	add	r0, pc
c0de477a:	f2c0 0600 	movt	r6, #0
c0de477e:	9002      	str	r0, [sp, #8]
c0de4780:	eb09 0006 	add.w	r0, r9, r6
c0de4784:	f100 01ac 	add.w	r1, r0, #172	@ 0xac
c0de4788:	9103      	str	r1, [sp, #12]
c0de478a:	f24f 51f3 	movw	r1, #62963	@ 0xf5f3
c0de478e:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de4792:	4479      	add	r1, pc
c0de4794:	30d0      	adds	r0, #208	@ 0xd0
c0de4796:	9108      	str	r1, [sp, #32]
c0de4798:	9009      	str	r0, [sp, #36]	@ 0x24
c0de479a:	f244 0124 	movw	r1, #16420	@ 0x4024
c0de479e:	f2c0 0100 	movt	r1, #0
c0de47a2:	4479      	add	r1, pc
c0de47a4:	4628      	mov	r0, r5
c0de47a6:	4622      	mov	r2, r4
c0de47a8:	2300      	movs	r3, #0
c0de47aa:	f7fd fca8 	bl	c0de20fe <pb_decode_ex>
c0de47ae:	b310      	cbz	r0, c0de47f6 <build_protobuf_root_tx+0xbc>
c0de47b0:	eb09 0406 	add.w	r4, r9, r6
c0de47b4:	e9dd 010a 	ldrd	r0, r1, [sp, #40]	@ 0x28
c0de47b8:	f894 2323 	ldrb.w	r2, [r4, #803]	@ 0x323
c0de47bc:	2516      	movs	r5, #22
c0de47be:	f204 13eb 	addw	r3, r4, #491	@ 0x1eb
c0de47c2:	9500      	str	r5, [sp, #0]
c0de47c4:	f7ff fa4a 	bl	c0de3c5c <print_amount>
c0de47c8:	f104 00d0 	add.w	r0, r4, #208	@ 0xd0
c0de47cc:	f003 fece 	bl	c0de856c <strlen>
c0de47d0:	b950      	cbnz	r0, c0de47e8 <build_protobuf_root_tx+0xae>
c0de47d2:	f244 713e 	movw	r1, #18238	@ 0x473e
c0de47d6:	eb09 0006 	add.w	r0, r9, r6
c0de47da:	f2c0 0100 	movt	r1, #0
c0de47de:	30d0      	adds	r0, #208	@ 0xd0
c0de47e0:	4479      	add	r1, pc
c0de47e2:	2205      	movs	r2, #5
c0de47e4:	f003 fe65 	bl	c0de84b2 <__aeabi_memcpy>
c0de47e8:	eb09 0006 	add.w	r0, r9, r6
c0de47ec:	2107      	movs	r1, #7
c0de47ee:	f880 139a 	strb.w	r1, [r0, #922]	@ 0x39a
c0de47f2:	b028      	add	sp, #160	@ 0xa0
c0de47f4:	bd70      	pop	{r4, r5, r6, pc}
c0de47f6:	f249 1005 	movw	r0, #37125	@ 0x9105
c0de47fa:	f003 fa12 	bl	c0de7c22 <os_longjmp>

c0de47fe <build_protobuf_order>:
c0de47fe:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de4802:	b0a2      	sub	sp, #136	@ 0x88
c0de4804:	f10d 0818 	add.w	r8, sp, #24
c0de4808:	460e      	mov	r6, r1
c0de480a:	f8dd b0a8 	ldr.w	fp, [sp, #168]	@ 0xa8
c0de480e:	4604      	mov	r4, r0
c0de4810:	4640      	mov	r0, r8
c0de4812:	2170      	movs	r1, #112	@ 0x70
c0de4814:	461f      	mov	r7, r3
c0de4816:	4615      	mov	r5, r2
c0de4818:	f003 fe48 	bl	c0de84ac <__aeabi_memclr>
c0de481c:	f240 0a08 	movw	sl, #8
c0de4820:	f24f 50bd 	movw	r0, #62909	@ 0xf5bd
c0de4824:	f2c0 0a00 	movt	sl, #0
c0de4828:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de482c:	eb09 010a 	add.w	r1, r9, sl
c0de4830:	4478      	add	r0, pc
c0de4832:	f101 02ac 	add.w	r2, r1, #172	@ 0xac
c0de4836:	9007      	str	r0, [sp, #28]
c0de4838:	e9cd 2008 	strd	r2, r0, [sp, #32]
c0de483c:	f501 7095 	add.w	r0, r1, #298	@ 0x12a
c0de4840:	900a      	str	r0, [sp, #40]	@ 0x28
c0de4842:	f24f 503b 	movw	r0, #62779	@ 0xf53b
c0de4846:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de484a:	4478      	add	r0, pc
c0de484c:	901c      	str	r0, [sp, #112]	@ 0x70
c0de484e:	f101 02d0 	add.w	r2, r1, #208	@ 0xd0
c0de4852:	900c      	str	r0, [sp, #48]	@ 0x30
c0de4854:	f101 00fd 	add.w	r0, r1, #253	@ 0xfd
c0de4858:	9700      	str	r7, [sp, #0]
c0de485a:	af02      	add	r7, sp, #8
c0de485c:	921d      	str	r2, [sp, #116]	@ 0x74
c0de485e:	900d      	str	r0, [sp, #52]	@ 0x34
c0de4860:	4638      	mov	r0, r7
c0de4862:	4621      	mov	r1, r4
c0de4864:	4632      	mov	r2, r6
c0de4866:	462b      	mov	r3, r5
c0de4868:	f8cd b004 	str.w	fp, [sp, #4]
c0de486c:	f7fd fa64 	bl	c0de1d38 <pb_istream_from_apdu>
c0de4870:	f643 7110 	movw	r1, #16144	@ 0x3f10
c0de4874:	f2c0 0100 	movt	r1, #0
c0de4878:	4479      	add	r1, pc
c0de487a:	4638      	mov	r0, r7
c0de487c:	4642      	mov	r2, r8
c0de487e:	f7fd fe76 	bl	c0de256e <pb_decode>
c0de4882:	2800      	cmp	r0, #0
c0de4884:	d04e      	beq.n	c0de4924 <build_protobuf_order+0x126>
c0de4886:	eb09 040a 	add.w	r4, r9, sl
c0de488a:	e9dd 0112 	ldrd	r0, r1, [sp, #72]	@ 0x48
c0de488e:	f894 2321 	ldrb.w	r2, [r4, #801]	@ 0x321
c0de4892:	2516      	movs	r5, #22
c0de4894:	f204 137b 	addw	r3, r4, #379	@ 0x17b
c0de4898:	9500      	str	r5, [sp, #0]
c0de489a:	f7ff f9df 	bl	c0de3c5c <print_amount>
c0de489e:	e9dd 011e 	ldrd	r0, r1, [sp, #120]	@ 0x78
c0de48a2:	f894 2323 	ldrb.w	r2, [r4, #803]	@ 0x323
c0de48a6:	f204 13eb 	addw	r3, r4, #491	@ 0x1eb
c0de48aa:	9500      	str	r5, [sp, #0]
c0de48ac:	f7ff f9d6 	bl	c0de3c5c <print_amount>
c0de48b0:	f89d 0040 	ldrb.w	r0, [sp, #64]	@ 0x40
c0de48b4:	b150      	cbz	r0, c0de48cc <build_protobuf_order+0xce>
c0de48b6:	f644 013a 	movw	r1, #18490	@ 0x483a
c0de48ba:	eb09 000a 	add.w	r0, r9, sl
c0de48be:	f2c0 0100 	movt	r1, #0
c0de48c2:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de48c6:	4479      	add	r1, pc
c0de48c8:	220b      	movs	r2, #11
c0de48ca:	e009      	b.n	c0de48e0 <build_protobuf_order+0xe2>
c0de48cc:	f644 0118 	movw	r1, #18456	@ 0x4818
c0de48d0:	eb09 000a 	add.w	r0, r9, sl
c0de48d4:	f2c0 0100 	movt	r1, #0
c0de48d8:	f200 1057 	addw	r0, r0, #343	@ 0x157
c0de48dc:	4479      	add	r1, pc
c0de48de:	220a      	movs	r2, #10
c0de48e0:	f003 fde7 	bl	c0de84b2 <__aeabi_memcpy>
c0de48e4:	eb09 000a 	add.w	r0, r9, sl
c0de48e8:	30d0      	adds	r0, #208	@ 0xd0
c0de48ea:	f003 fe3f 	bl	c0de856c <strlen>
c0de48ee:	b950      	cbnz	r0, c0de4906 <build_protobuf_order+0x108>
c0de48f0:	f244 6120 	movw	r1, #17952	@ 0x4620
c0de48f4:	eb09 000a 	add.w	r0, r9, sl
c0de48f8:	f2c0 0100 	movt	r1, #0
c0de48fc:	30d0      	adds	r0, #208	@ 0xd0
c0de48fe:	4479      	add	r1, pc
c0de4900:	2205      	movs	r2, #5
c0de4902:	f003 fdd6 	bl	c0de84b2 <__aeabi_memcpy>
c0de4906:	eb09 040a 	add.w	r4, r9, sl
c0de490a:	f894 132c 	ldrb.w	r1, [r4, #812]	@ 0x32c
c0de490e:	f504 7095 	add.w	r0, r4, #298	@ 0x12a
c0de4912:	4602      	mov	r2, r0
c0de4914:	f7fb ff79 	bl	c0de080a <waves_public_key_to_address>
c0de4918:	2007      	movs	r0, #7
c0de491a:	f884 039a 	strb.w	r0, [r4, #922]	@ 0x39a
c0de491e:	b022      	add	sp, #136	@ 0x88
c0de4920:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de4924:	f44f 40da 	mov.w	r0, #27904	@ 0x6d00
c0de4928:	f003 f97b 	bl	c0de7c22 <os_longjmp>

c0de492c <update_transfer_wait_in_buffer>:
c0de492c:	f240 0008 	movw	r0, #8
c0de4930:	f2c0 0000 	movt	r0, #0
c0de4934:	eb09 0100 	add.w	r1, r9, r0
c0de4938:	f891 2096 	ldrb.w	r2, [r1, #150]	@ 0x96
c0de493c:	2300      	movs	r3, #0
c0de493e:	f881 3098 	strb.w	r3, [r1, #152]	@ 0x98
c0de4942:	2a08      	cmp	r2, #8
c0de4944:	f04f 0101 	mov.w	r1, #1
c0de4948:	dc08      	bgt.n	c0de495c <update_transfer_wait_in_buffer+0x30>
c0de494a:	2a03      	cmp	r2, #3
c0de494c:	dc10      	bgt.n	c0de4970 <update_transfer_wait_in_buffer+0x44>
c0de494e:	2a01      	cmp	r2, #1
c0de4950:	d026      	beq.n	c0de49a0 <update_transfer_wait_in_buffer+0x74>
c0de4952:	2a02      	cmp	r2, #2
c0de4954:	d038      	beq.n	c0de49c8 <update_transfer_wait_in_buffer+0x9c>
c0de4956:	2a03      	cmp	r2, #3
c0de4958:	d022      	beq.n	c0de49a0 <update_transfer_wait_in_buffer+0x74>
c0de495a:	e038      	b.n	c0de49ce <update_transfer_wait_in_buffer+0xa2>
c0de495c:	2a0b      	cmp	r2, #11
c0de495e:	dd0c      	ble.n	c0de497a <update_transfer_wait_in_buffer+0x4e>
c0de4960:	2a0d      	cmp	r2, #13
c0de4962:	dc12      	bgt.n	c0de498a <update_transfer_wait_in_buffer+0x5e>
c0de4964:	2a0c      	cmp	r2, #12
c0de4966:	d01d      	beq.n	c0de49a4 <update_transfer_wait_in_buffer+0x78>
c0de4968:	2a0d      	cmp	r2, #13
c0de496a:	d130      	bne.n	c0de49ce <update_transfer_wait_in_buffer+0xa2>
c0de496c:	2102      	movs	r1, #2
c0de496e:	e02b      	b.n	c0de49c8 <update_transfer_wait_in_buffer+0x9c>
c0de4970:	1f93      	subs	r3, r2, #6
c0de4972:	2b03      	cmp	r3, #3
c0de4974:	d210      	bcs.n	c0de4998 <update_transfer_wait_in_buffer+0x6c>
c0de4976:	2108      	movs	r1, #8
c0de4978:	e026      	b.n	c0de49c8 <update_transfer_wait_in_buffer+0x9c>
c0de497a:	2a09      	cmp	r2, #9
c0de497c:	d024      	beq.n	c0de49c8 <update_transfer_wait_in_buffer+0x9c>
c0de497e:	2a0a      	cmp	r2, #10
c0de4980:	d015      	beq.n	c0de49ae <update_transfer_wait_in_buffer+0x82>
c0de4982:	2a0b      	cmp	r2, #11
c0de4984:	d123      	bne.n	c0de49ce <update_transfer_wait_in_buffer+0xa2>
c0de4986:	2103      	movs	r1, #3
c0de4988:	e01e      	b.n	c0de49c8 <update_transfer_wait_in_buffer+0x9c>
c0de498a:	2a0e      	cmp	r2, #14
c0de498c:	d018      	beq.n	c0de49c0 <update_transfer_wait_in_buffer+0x94>
c0de498e:	2a0f      	cmp	r2, #15
c0de4990:	bf18      	it	ne
c0de4992:	4770      	bxne	lr
c0de4994:	2100      	movs	r1, #0
c0de4996:	e017      	b.n	c0de49c8 <update_transfer_wait_in_buffer+0x9c>
c0de4998:	2a04      	cmp	r2, #4
c0de499a:	d015      	beq.n	c0de49c8 <update_transfer_wait_in_buffer+0x9c>
c0de499c:	2a05      	cmp	r2, #5
c0de499e:	d116      	bne.n	c0de49ce <update_transfer_wait_in_buffer+0xa2>
c0de49a0:	2120      	movs	r1, #32
c0de49a2:	e011      	b.n	c0de49c8 <update_transfer_wait_in_buffer+0x9c>
c0de49a4:	eb09 0100 	add.w	r1, r9, r0
c0de49a8:	f891 10a4 	ldrb.w	r1, [r1, #164]	@ 0xa4
c0de49ac:	e00c      	b.n	c0de49c8 <update_transfer_wait_in_buffer+0x9c>
c0de49ae:	eb09 0100 	add.w	r1, r9, r0
c0de49b2:	f8d1 209c 	ldr.w	r2, [r1, #156]	@ 0x9c
c0de49b6:	3a01      	subs	r2, #1
c0de49b8:	f8c1 209c 	str.w	r2, [r1, #156]	@ 0x9c
c0de49bc:	211a      	movs	r1, #26
c0de49be:	e003      	b.n	c0de49c8 <update_transfer_wait_in_buffer+0x9c>
c0de49c0:	eb09 0100 	add.w	r1, r9, r0
c0de49c4:	f891 10a6 	ldrb.w	r1, [r1, #166]	@ 0xa6
c0de49c8:	4448      	add	r0, r9
c0de49ca:	f880 1097 	strb.w	r1, [r0, #151]	@ 0x97
c0de49ce:	4770      	bx	lr

c0de49d0 <build_transfer_ui_step>:
c0de49d0:	b570      	push	{r4, r5, r6, lr}
c0de49d2:	b088      	sub	sp, #32
c0de49d4:	f240 0408 	movw	r4, #8
c0de49d8:	f2c0 0400 	movt	r4, #0
c0de49dc:	eb09 0004 	add.w	r0, r9, r4
c0de49e0:	f890 0097 	ldrb.w	r0, [r0, #151]	@ 0x97
c0de49e4:	b168      	cbz	r0, c0de4a02 <build_transfer_ui_step+0x32>
c0de49e6:	f240 6014 	movw	r0, #1556	@ 0x614
c0de49ea:	f2c0 0000 	movt	r0, #0
c0de49ee:	4448      	add	r0, r9
c0de49f0:	7901      	ldrb	r1, [r0, #4]
c0de49f2:	2005      	movs	r0, #5
c0de49f4:	f000 fa7f 	bl	c0de4ef6 <try_to_fill_buffer>
c0de49f8:	eb09 0004 	add.w	r0, r9, r4
c0de49fc:	f890 0097 	ldrb.w	r0, [r0, #151]	@ 0x97
c0de4a00:	e000      	b.n	c0de4a04 <build_transfer_ui_step+0x34>
c0de4a02:	2000      	movs	r0, #0
c0de4a04:	2800      	cmp	r0, #0
c0de4a06:	f040 8145 	bne.w	c0de4c94 <build_transfer_ui_step+0x2c4>
c0de4a0a:	eb09 0004 	add.w	r0, r9, r4
c0de4a0e:	f890 0218 	ldrb.w	r0, [r0, #536]	@ 0x218
c0de4a12:	2800      	cmp	r0, #0
c0de4a14:	f040 813e 	bne.w	c0de4c94 <build_transfer_ui_step+0x2c4>
c0de4a18:	202d      	movs	r0, #45	@ 0x2d
c0de4a1a:	9007      	str	r0, [sp, #28]
c0de4a1c:	eb09 0004 	add.w	r0, r9, r4
c0de4a20:	f890 0096 	ldrb.w	r0, [r0, #150]	@ 0x96
c0de4a24:	f819 1004 	ldrb.w	r1, [r9, r4]
c0de4a28:	2200      	movs	r2, #0
c0de4a2a:	2807      	cmp	r0, #7
c0de4a2c:	e9cd 2204 	strd	r2, r2, [sp, #16]
c0de4a30:	9203      	str	r2, [sp, #12]
c0de4a32:	9202      	str	r2, [sp, #8]
c0de4a34:	dc19      	bgt.n	c0de4a6a <build_transfer_ui_step+0x9a>
c0de4a36:	2803      	cmp	r0, #3
c0de4a38:	dc29      	bgt.n	c0de4a8e <build_transfer_ui_step+0xbe>
c0de4a3a:	2801      	cmp	r0, #1
c0de4a3c:	dc4f      	bgt.n	c0de4ade <build_transfer_ui_step+0x10e>
c0de4a3e:	2800      	cmp	r0, #0
c0de4a40:	f000 8098 	beq.w	c0de4b74 <build_transfer_ui_step+0x1a4>
c0de4a44:	2801      	cmp	r0, #1
c0de4a46:	f040 812b 	bne.w	c0de4ca0 <build_transfer_ui_step+0x2d0>
c0de4a4a:	eb09 0c04 	add.w	ip, r9, r4
c0de4a4e:	4662      	mov	r2, ip
c0de4a50:	ca1b      	ldmia	r2!, {r0, r1, r3, r4}
c0de4a52:	f10c 0eac 	add.w	lr, ip, #172	@ 0xac
c0de4a56:	e8ae 001b 	stmia.w	lr!, {r0, r1, r3, r4}
c0de4a5a:	e892 001b 	ldmia.w	r2, {r0, r1, r3, r4}
c0de4a5e:	e88e 001b 	stmia.w	lr, {r0, r1, r3, r4}
c0de4a62:	2002      	movs	r0, #2
c0de4a64:	f88c 0096 	strb.w	r0, [ip, #150]	@ 0x96
c0de4a68:	e112      	b.n	c0de4c90 <build_transfer_ui_step+0x2c0>
c0de4a6a:	280b      	cmp	r0, #11
c0de4a6c:	dc26      	bgt.n	c0de4abc <build_transfer_ui_step+0xec>
c0de4a6e:	2809      	cmp	r0, #9
c0de4a70:	dc4a      	bgt.n	c0de4b08 <build_transfer_ui_step+0x138>
c0de4a72:	2808      	cmp	r0, #8
c0de4a74:	f000 8092 	beq.w	c0de4b9c <build_transfer_ui_step+0x1cc>
c0de4a78:	2809      	cmp	r0, #9
c0de4a7a:	f040 8111 	bne.w	c0de4ca0 <build_transfer_ui_step+0x2d0>
c0de4a7e:	2901      	cmp	r1, #1
c0de4a80:	f000 8101 	beq.w	c0de4c86 <build_transfer_ui_step+0x2b6>
c0de4a84:	2902      	cmp	r1, #2
c0de4a86:	f040 8107 	bne.w	c0de4c98 <build_transfer_ui_step+0x2c8>
c0de4a8a:	200b      	movs	r0, #11
c0de4a8c:	e0fc      	b.n	c0de4c88 <build_transfer_ui_step+0x2b8>
c0de4a8e:	2805      	cmp	r0, #5
c0de4a90:	dc49      	bgt.n	c0de4b26 <build_transfer_ui_step+0x156>
c0de4a92:	2804      	cmp	r0, #4
c0de4a94:	f000 8094 	beq.w	c0de4bc0 <build_transfer_ui_step+0x1f0>
c0de4a98:	2805      	cmp	r0, #5
c0de4a9a:	f040 8101 	bne.w	c0de4ca0 <build_transfer_ui_step+0x2d0>
c0de4a9e:	eb09 0204 	add.w	r2, r9, r4
c0de4aa2:	f102 00d0 	add.w	r0, r2, #208	@ 0xd0
c0de4aa6:	a907      	add	r1, sp, #28
c0de4aa8:	2320      	movs	r3, #32
c0de4aaa:	f7fb fb31 	bl	c0de0110 <b58enc>
c0de4aae:	2800      	cmp	r0, #0
c0de4ab0:	f000 80f2 	beq.w	c0de4c98 <build_transfer_ui_step+0x2c8>
c0de4ab4:	eb09 0004 	add.w	r0, r9, r4
c0de4ab8:	2106      	movs	r1, #6
c0de4aba:	e0ab      	b.n	c0de4c14 <build_transfer_ui_step+0x244>
c0de4abc:	280d      	cmp	r0, #13
c0de4abe:	dc4b      	bgt.n	c0de4b58 <build_transfer_ui_step+0x188>
c0de4ac0:	280c      	cmp	r0, #12
c0de4ac2:	f000 8081 	beq.w	c0de4bc8 <build_transfer_ui_step+0x1f8>
c0de4ac6:	280d      	cmp	r0, #13
c0de4ac8:	f040 80ea 	bne.w	c0de4ca0 <build_transfer_ui_step+0x2d0>
c0de4acc:	444c      	add	r4, r9
c0de4ace:	f104 00a6 	add.w	r0, r4, #166	@ 0xa6
c0de4ad2:	4621      	mov	r1, r4
c0de4ad4:	2202      	movs	r2, #2
c0de4ad6:	f7fb ff05 	bl	c0de08e4 <copy_in_reverse_order>
c0de4ada:	200e      	movs	r0, #14
c0de4adc:	e0b5      	b.n	c0de4c4a <build_transfer_ui_step+0x27a>
c0de4ade:	2802      	cmp	r0, #2
c0de4ae0:	f000 8083 	beq.w	c0de4bea <build_transfer_ui_step+0x21a>
c0de4ae4:	2803      	cmp	r0, #3
c0de4ae6:	f040 80db 	bne.w	c0de4ca0 <build_transfer_ui_step+0x2d0>
c0de4aea:	eb09 0204 	add.w	r2, r9, r4
c0de4aee:	f502 7095 	add.w	r0, r2, #298	@ 0x12a
c0de4af2:	a907      	add	r1, sp, #28
c0de4af4:	2320      	movs	r3, #32
c0de4af6:	f7fb fb0b 	bl	c0de0110 <b58enc>
c0de4afa:	2800      	cmp	r0, #0
c0de4afc:	f000 80cc 	beq.w	c0de4c98 <build_transfer_ui_step+0x2c8>
c0de4b00:	eb09 0004 	add.w	r0, r9, r4
c0de4b04:	2104      	movs	r1, #4
c0de4b06:	e085      	b.n	c0de4c14 <build_transfer_ui_step+0x244>
c0de4b08:	280a      	cmp	r0, #10
c0de4b0a:	d072      	beq.n	c0de4bf2 <build_transfer_ui_step+0x222>
c0de4b0c:	280b      	cmp	r0, #11
c0de4b0e:	f040 80c7 	bne.w	c0de4ca0 <build_transfer_ui_step+0x2d0>
c0de4b12:	eb09 0004 	add.w	r0, r9, r4
c0de4b16:	7841      	ldrb	r1, [r0, #1]
c0de4b18:	7882      	ldrb	r2, [r0, #2]
c0de4b1a:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de4b1e:	f8a0 10a4 	strh.w	r1, [r0, #164]	@ 0xa4
c0de4b22:	210c      	movs	r1, #12
c0de4b24:	e076      	b.n	c0de4c14 <build_transfer_ui_step+0x244>
c0de4b26:	2806      	cmp	r0, #6
c0de4b28:	d071      	beq.n	c0de4c0e <build_transfer_ui_step+0x23e>
c0de4b2a:	2807      	cmp	r0, #7
c0de4b2c:	f040 80b8 	bne.w	c0de4ca0 <build_transfer_ui_step+0x2d0>
c0de4b30:	444c      	add	r4, r9
c0de4b32:	a804      	add	r0, sp, #16
c0de4b34:	4621      	mov	r1, r4
c0de4b36:	2208      	movs	r2, #8
c0de4b38:	2608      	movs	r6, #8
c0de4b3a:	f7fb fed3 	bl	c0de08e4 <copy_in_reverse_order>
c0de4b3e:	e9dd 0104 	ldrd	r0, r1, [sp, #16]
c0de4b42:	f894 2321 	ldrb.w	r2, [r4, #801]	@ 0x321
c0de4b46:	2514      	movs	r5, #20
c0de4b48:	f104 03fd 	add.w	r3, r4, #253	@ 0xfd
c0de4b4c:	9500      	str	r5, [sp, #0]
c0de4b4e:	f7ff f885 	bl	c0de3c5c <print_amount>
c0de4b52:	f884 6096 	strb.w	r6, [r4, #150]	@ 0x96
c0de4b56:	e09b      	b.n	c0de4c90 <build_transfer_ui_step+0x2c0>
c0de4b58:	280e      	cmp	r0, #14
c0de4b5a:	d05e      	beq.n	c0de4c1a <build_transfer_ui_step+0x24a>
c0de4b5c:	280f      	cmp	r0, #15
c0de4b5e:	f040 809f 	bne.w	c0de4ca0 <build_transfer_ui_step+0x2d0>
c0de4b62:	eb09 0004 	add.w	r0, r9, r4
c0de4b66:	2101      	movs	r1, #1
c0de4b68:	f880 1218 	strb.w	r1, [r0, #536]	@ 0x218
c0de4b6c:	2107      	movs	r1, #7
c0de4b6e:	f880 139a 	strb.w	r1, [r0, #922]	@ 0x39a
c0de4b72:	e08f      	b.n	c0de4c94 <build_transfer_ui_step+0x2c4>
c0de4b74:	eb09 0104 	add.w	r1, r9, r4
c0de4b78:	f8d1 03b8 	ldr.w	r0, [r1, #952]	@ 0x3b8
c0de4b7c:	f891 2325 	ldrb.w	r2, [r1, #805]	@ 0x325
c0de4b80:	1c43      	adds	r3, r0, #1
c0de4b82:	2a02      	cmp	r2, #2
c0de4b84:	f8c1 309c 	str.w	r3, [r1, #156]	@ 0x9c
c0de4b88:	bf02      	ittt	eq
c0de4b8a:	3002      	addeq	r0, #2
c0de4b8c:	eb09 0104 	addeq.w	r1, r9, r4
c0de4b90:	f8c1 009c 	streq.w	r0, [r1, #156]	@ 0x9c
c0de4b94:	eb09 0004 	add.w	r0, r9, r4
c0de4b98:	2101      	movs	r1, #1
c0de4b9a:	e03b      	b.n	c0de4c14 <build_transfer_ui_step+0x244>
c0de4b9c:	444c      	add	r4, r9
c0de4b9e:	a802      	add	r0, sp, #8
c0de4ba0:	4621      	mov	r1, r4
c0de4ba2:	2208      	movs	r2, #8
c0de4ba4:	f7fb fe9e 	bl	c0de08e4 <copy_in_reverse_order>
c0de4ba8:	e9dd 0102 	ldrd	r0, r1, [sp, #8]
c0de4bac:	f894 2323 	ldrb.w	r2, [r4, #803]	@ 0x323
c0de4bb0:	2614      	movs	r6, #20
c0de4bb2:	f204 13eb 	addw	r3, r4, #491	@ 0x1eb
c0de4bb6:	9600      	str	r6, [sp, #0]
c0de4bb8:	f7ff f850 	bl	c0de3c5c <print_amount>
c0de4bbc:	2009      	movs	r0, #9
c0de4bbe:	e044      	b.n	c0de4c4a <build_transfer_ui_step+0x27a>
c0de4bc0:	2901      	cmp	r1, #1
c0de4bc2:	d145      	bne.n	c0de4c50 <build_transfer_ui_step+0x280>
c0de4bc4:	2005      	movs	r0, #5
c0de4bc6:	e05f      	b.n	c0de4c88 <build_transfer_ui_step+0x2b8>
c0de4bc8:	eb09 0004 	add.w	r0, r9, r4
c0de4bcc:	f8b0 20a4 	ldrh.w	r2, [r0, #164]	@ 0xa4
c0de4bd0:	f1a2 001f 	sub.w	r0, r2, #31
c0de4bd4:	f110 0f1c 	cmn.w	r0, #28
c0de4bd8:	d965      	bls.n	c0de4ca6 <build_transfer_ui_step+0x2d6>
c0de4bda:	444c      	add	r4, r9
c0de4bdc:	f204 1057 	addw	r0, r4, #343	@ 0x157
c0de4be0:	4621      	mov	r1, r4
c0de4be2:	f003 fc68 	bl	c0de84b6 <__aeabi_memmove>
c0de4be6:	200d      	movs	r0, #13
c0de4be8:	e02f      	b.n	c0de4c4a <build_transfer_ui_step+0x27a>
c0de4bea:	2901      	cmp	r1, #1
c0de4bec:	d13d      	bne.n	c0de4c6a <build_transfer_ui_step+0x29a>
c0de4bee:	2003      	movs	r0, #3
c0de4bf0:	e04a      	b.n	c0de4c88 <build_transfer_ui_step+0x2b8>
c0de4bf2:	eb09 0204 	add.w	r2, r9, r4
c0de4bf6:	f202 1057 	addw	r0, r2, #343	@ 0x157
c0de4bfa:	a907      	add	r1, sp, #28
c0de4bfc:	231a      	movs	r3, #26
c0de4bfe:	f7fb fa87 	bl	c0de0110 <b58enc>
c0de4c02:	2800      	cmp	r0, #0
c0de4c04:	d048      	beq.n	c0de4c98 <build_transfer_ui_step+0x2c8>
c0de4c06:	eb09 0004 	add.w	r0, r9, r4
c0de4c0a:	210d      	movs	r1, #13
c0de4c0c:	e002      	b.n	c0de4c14 <build_transfer_ui_step+0x244>
c0de4c0e:	eb09 0004 	add.w	r0, r9, r4
c0de4c12:	2107      	movs	r1, #7
c0de4c14:	f880 1096 	strb.w	r1, [r0, #150]	@ 0x96
c0de4c18:	e03a      	b.n	c0de4c90 <build_transfer_ui_step+0x2c0>
c0de4c1a:	eb09 0004 	add.w	r0, r9, r4
c0de4c1e:	f8b0 20a6 	ldrh.w	r2, [r0, #166]	@ 0xa6
c0de4c22:	2a2a      	cmp	r2, #42	@ 0x2a
c0de4c24:	d30a      	bcc.n	c0de4c3c <build_transfer_ui_step+0x26c>
c0de4c26:	f642 612e 	movw	r1, #11822	@ 0x2e2e
c0de4c2a:	eb09 0004 	add.w	r0, r9, r4
c0de4c2e:	f2c0 012e 	movt	r1, #46	@ 0x2e
c0de4c32:	2229      	movs	r2, #41	@ 0x29
c0de4c34:	f8c0 11a4 	str.w	r1, [r0, #420]	@ 0x1a4
c0de4c38:	f8a0 20a6 	strh.w	r2, [r0, #166]	@ 0xa6
c0de4c3c:	444c      	add	r4, r9
c0de4c3e:	f204 107b 	addw	r0, r4, #379	@ 0x17b
c0de4c42:	4621      	mov	r1, r4
c0de4c44:	f003 fc37 	bl	c0de84b6 <__aeabi_memmove>
c0de4c48:	200f      	movs	r0, #15
c0de4c4a:	f884 0096 	strb.w	r0, [r4, #150]	@ 0x96
c0de4c4e:	e01f      	b.n	c0de4c90 <build_transfer_ui_step+0x2c0>
c0de4c50:	f244 21c0 	movw	r1, #17088	@ 0x42c0
c0de4c54:	eb09 0004 	add.w	r0, r9, r4
c0de4c58:	f2c0 0100 	movt	r1, #0
c0de4c5c:	30d0      	adds	r0, #208	@ 0xd0
c0de4c5e:	4479      	add	r1, pc
c0de4c60:	2205      	movs	r2, #5
c0de4c62:	f003 fc26 	bl	c0de84b2 <__aeabi_memcpy>
c0de4c66:	2006      	movs	r0, #6
c0de4c68:	e00e      	b.n	c0de4c88 <build_transfer_ui_step+0x2b8>
c0de4c6a:	f244 21a4 	movw	r1, #17060	@ 0x42a4
c0de4c6e:	eb09 0004 	add.w	r0, r9, r4
c0de4c72:	f2c0 0100 	movt	r1, #0
c0de4c76:	f500 7095 	add.w	r0, r0, #298	@ 0x12a
c0de4c7a:	4479      	add	r1, pc
c0de4c7c:	2205      	movs	r2, #5
c0de4c7e:	f003 fc18 	bl	c0de84b2 <__aeabi_memcpy>
c0de4c82:	2004      	movs	r0, #4
c0de4c84:	e000      	b.n	c0de4c88 <build_transfer_ui_step+0x2b8>
c0de4c86:	200a      	movs	r0, #10
c0de4c88:	eb09 0104 	add.w	r1, r9, r4
c0de4c8c:	f881 0096 	strb.w	r0, [r1, #150]	@ 0x96
c0de4c90:	f7ff fe4c 	bl	c0de492c <update_transfer_wait_in_buffer>
c0de4c94:	b008      	add	sp, #32
c0de4c96:	bd70      	pop	{r4, r5, r6, pc}
c0de4c98:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de4c9c:	f002 ffc1 	bl	c0de7c22 <os_longjmp>
c0de4ca0:	200a      	movs	r0, #10
c0de4ca2:	f002 ffbe 	bl	c0de7c22 <os_longjmp>
c0de4ca6:	f249 1006 	movw	r0, #37126	@ 0x9106
c0de4caa:	f002 ffba 	bl	c0de7c22 <os_longjmp>

c0de4cae <ux_idle_flow_3_step_validateinit>:
c0de4cae:	20ff      	movs	r0, #255	@ 0xff
c0de4cb0:	f003 fa4a 	bl	c0de8148 <os_sched_exit>

c0de4cb4 <ux_display_address_flow_5_step_validateinit>:
c0de4cb4:	2000      	movs	r0, #0
c0de4cb6:	f000 bdf2 	b.w	c0de589e <io_seproxyhal_touch_address_ok>

c0de4cba <ux_display_address_flow_6_step_validateinit>:
c0de4cba:	2000      	movs	r0, #0
c0de4cbc:	f000 be07 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4cc0 <display_if_buffer_not_empty>:
c0de4cc0:	b580      	push	{r7, lr}
c0de4cc2:	f003 fc5b 	bl	c0de857c <strnlen>
c0de4cc6:	b100      	cbz	r0, c0de4cca <display_if_buffer_not_empty+0xa>
c0de4cc8:	bd80      	pop	{r7, pc}
c0de4cca:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de4cce:	f2c0 0000 	movt	r0, #0
c0de4cd2:	4448      	add	r0, r9
c0de4cd4:	8c01      	ldrh	r1, [r0, #32]
c0de4cd6:	8c40      	ldrh	r0, [r0, #34]	@ 0x22
c0de4cd8:	4281      	cmp	r1, r0
c0de4cda:	d203      	bcs.n	c0de4ce4 <display_if_buffer_not_empty+0x24>
c0de4cdc:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de4ce0:	f002 b8f2 	b.w	c0de6ec8 <ux_flow_prev>
c0de4ce4:	d9f0      	bls.n	c0de4cc8 <display_if_buffer_not_empty+0x8>
c0de4ce6:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de4cea:	f002 b8ea 	b.w	c0de6ec2 <ux_flow_next>

c0de4cee <ux_transfer_7_step_init>:
c0de4cee:	b510      	push	{r4, lr}
c0de4cf0:	4604      	mov	r4, r0
c0de4cf2:	f240 0008 	movw	r0, #8
c0de4cf6:	f2c0 0000 	movt	r0, #0
c0de4cfa:	4448      	add	r0, r9
c0de4cfc:	f200 107b 	addw	r0, r0, #379	@ 0x17b
c0de4d00:	212d      	movs	r1, #45	@ 0x2d
c0de4d02:	f7ff ffdd 	bl	c0de4cc0 <display_if_buffer_not_empty>
c0de4d06:	4620      	mov	r0, r4
c0de4d08:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de4d0c:	f002 bc6f 	b.w	c0de75ee <ux_layout_bn_paging_init>

c0de4d10 <ux_transfer_10_step_validateinit>:
c0de4d10:	2000      	movs	r0, #0
c0de4d12:	f000 bdf1 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4d16 <ux_transfer_11_step_validateinit>:
c0de4d16:	2000      	movs	r0, #0
c0de4d18:	f000 bdd9 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4d1c <ux_data_6_step_validateinit>:
c0de4d1c:	2000      	movs	r0, #0
c0de4d1e:	f000 bdeb 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4d22 <ux_data_7_step_validateinit>:
c0de4d22:	2000      	movs	r0, #0
c0de4d24:	f000 bdd3 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4d28 <ux_issue_12_step_validateinit>:
c0de4d28:	2000      	movs	r0, #0
c0de4d2a:	f000 bde5 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4d2e <ux_issue_13_step_validateinit>:
c0de4d2e:	2000      	movs	r0, #0
c0de4d30:	f000 bdcd 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4d34 <ux_reissue_9_step_validateinit>:
c0de4d34:	2000      	movs	r0, #0
c0de4d36:	f000 bddf 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4d3a <ux_reissue_10_step_validateinit>:
c0de4d3a:	2000      	movs	r0, #0
c0de4d3c:	f000 bdc7 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4d40 <ux_burn_8_step_validateinit>:
c0de4d40:	2000      	movs	r0, #0
c0de4d42:	f000 bdd9 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4d46 <ux_burn_9_step_validateinit>:
c0de4d46:	2000      	movs	r0, #0
c0de4d48:	f000 bdc1 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4d4c <ux_lease_8_step_validateinit>:
c0de4d4c:	2000      	movs	r0, #0
c0de4d4e:	f000 bdd3 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4d52 <ux_lease_9_step_validateinit>:
c0de4d52:	2000      	movs	r0, #0
c0de4d54:	f000 bdbb 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4d58 <ux_cancel_lease_7_step_validateinit>:
c0de4d58:	2000      	movs	r0, #0
c0de4d5a:	f000 bdcd 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4d5e <ux_cancel_lease_8_step_validateinit>:
c0de4d5e:	2000      	movs	r0, #0
c0de4d60:	f000 bdb5 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4d64 <ux_create_alias_7_step_validateinit>:
c0de4d64:	2000      	movs	r0, #0
c0de4d66:	f000 bdc7 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4d6a <ux_create_alias_8_step_validateinit>:
c0de4d6a:	2000      	movs	r0, #0
c0de4d6c:	f000 bdaf 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4d70 <ux_masstransfer_5_step_init>:
c0de4d70:	b510      	push	{r4, lr}
c0de4d72:	4604      	mov	r4, r0
c0de4d74:	f240 0008 	movw	r0, #8
c0de4d78:	f2c0 0000 	movt	r0, #0
c0de4d7c:	4448      	add	r0, r9
c0de4d7e:	f500 7095 	add.w	r0, r0, #298	@ 0x12a
c0de4d82:	212d      	movs	r1, #45	@ 0x2d
c0de4d84:	f7ff ff9c 	bl	c0de4cc0 <display_if_buffer_not_empty>
c0de4d88:	4620      	mov	r0, r4
c0de4d8a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de4d8e:	f002 bc2e 	b.w	c0de75ee <ux_layout_bn_paging_init>

c0de4d92 <ux_masstransfer_8_step_validateinit>:
c0de4d92:	2000      	movs	r0, #0
c0de4d94:	f000 bdb0 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4d98 <ux_masstransfer_9_step_validateinit>:
c0de4d98:	2000      	movs	r0, #0
c0de4d9a:	f000 bd98 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4d9e <ux_set_ac_script_6_step_validateinit>:
c0de4d9e:	2000      	movs	r0, #0
c0de4da0:	f000 bdaa 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4da4 <ux_set_ac_script_7_step_validateinit>:
c0de4da4:	2000      	movs	r0, #0
c0de4da6:	f000 bd92 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4daa <ux_set_as_script_7_step_validateinit>:
c0de4daa:	2000      	movs	r0, #0
c0de4dac:	f000 bda4 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4db0 <ux_set_as_script_8_step_validateinit>:
c0de4db0:	2000      	movs	r0, #0
c0de4db2:	f000 bd8c 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4db6 <ux_sponsorship_8_step_validateinit>:
c0de4db6:	2000      	movs	r0, #0
c0de4db8:	f000 bd9e 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4dbc <ux_sponsorship_9_step_validateinit>:
c0de4dbc:	2000      	movs	r0, #0
c0de4dbe:	f000 bd86 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4dc2 <ux_update_asset_9_step_validateinit>:
c0de4dc2:	2000      	movs	r0, #0
c0de4dc4:	f000 bd98 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4dc8 <ux_update_asset_10_step_validateinit>:
c0de4dc8:	2000      	movs	r0, #0
c0de4dca:	f000 bd80 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4dce <ux_invoke_4_step_init>:
c0de4dce:	b510      	push	{r4, lr}
c0de4dd0:	4604      	mov	r4, r0
c0de4dd2:	f240 0008 	movw	r0, #8
c0de4dd6:	f2c0 0000 	movt	r0, #0
c0de4dda:	4448      	add	r0, r9
c0de4ddc:	f200 107b 	addw	r0, r0, #379	@ 0x17b
c0de4de0:	212d      	movs	r1, #45	@ 0x2d
c0de4de2:	f7ff ff6d 	bl	c0de4cc0 <display_if_buffer_not_empty>
c0de4de6:	4620      	mov	r0, r4
c0de4de8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de4dec:	f002 bbff 	b.w	c0de75ee <ux_layout_bn_paging_init>

c0de4df0 <ux_invoke_5_step_init>:
c0de4df0:	b510      	push	{r4, lr}
c0de4df2:	4604      	mov	r4, r0
c0de4df4:	f240 0008 	movw	r0, #8
c0de4df8:	f2c0 0000 	movt	r0, #0
c0de4dfc:	4448      	add	r0, r9
c0de4dfe:	30fd      	adds	r0, #253	@ 0xfd
c0de4e00:	212d      	movs	r1, #45	@ 0x2d
c0de4e02:	f7ff ff5d 	bl	c0de4cc0 <display_if_buffer_not_empty>
c0de4e06:	4620      	mov	r0, r4
c0de4e08:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de4e0c:	f002 bbef 	b.w	c0de75ee <ux_layout_bn_paging_init>

c0de4e10 <ux_invoke_6_step_init>:
c0de4e10:	b510      	push	{r4, lr}
c0de4e12:	4604      	mov	r4, r0
c0de4e14:	f240 0008 	movw	r0, #8
c0de4e18:	f2c0 0000 	movt	r0, #0
c0de4e1c:	4448      	add	r0, r9
c0de4e1e:	f200 10d5 	addw	r0, r0, #469	@ 0x1d5
c0de4e22:	2116      	movs	r1, #22
c0de4e24:	f7ff ff4c 	bl	c0de4cc0 <display_if_buffer_not_empty>
c0de4e28:	4620      	mov	r0, r4
c0de4e2a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de4e2e:	f002 bbde 	b.w	c0de75ee <ux_layout_bn_paging_init>

c0de4e32 <ux_invoke_7_step_init>:
c0de4e32:	b510      	push	{r4, lr}
c0de4e34:	4604      	mov	r4, r0
c0de4e36:	f240 0008 	movw	r0, #8
c0de4e3a:	f2c0 0000 	movt	r0, #0
c0de4e3e:	4448      	add	r0, r9
c0de4e40:	f500 70d4 	add.w	r0, r0, #424	@ 0x1a8
c0de4e44:	212d      	movs	r1, #45	@ 0x2d
c0de4e46:	f7ff ff3b 	bl	c0de4cc0 <display_if_buffer_not_empty>
c0de4e4a:	4620      	mov	r0, r4
c0de4e4c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de4e50:	f002 bbcd 	b.w	c0de75ee <ux_layout_bn_paging_init>

c0de4e54 <ux_invoke_12_step_validateinit>:
c0de4e54:	2000      	movs	r0, #0
c0de4e56:	f000 bd4f 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4e5a <ux_invoke_13_step_validateinit>:
c0de4e5a:	2000      	movs	r0, #0
c0de4e5c:	f000 bd37 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4e60 <ux_order_9_step_validateinit>:
c0de4e60:	2000      	movs	r0, #0
c0de4e62:	f000 bd49 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4e66 <ux_order_10_step_validateinit>:
c0de4e66:	2000      	movs	r0, #0
c0de4e68:	f000 bd31 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4e6c <ux_verify_transaction_4_step_validateinit>:
c0de4e6c:	2000      	movs	r0, #0
c0de4e6e:	f000 bd43 	b.w	c0de58f8 <io_seproxyhal_touch_sign_approve>

c0de4e72 <ux_verify_transaction_5_step_validateinit>:
c0de4e72:	2000      	movs	r0, #0
c0de4e74:	f000 bd2b 	b.w	c0de58ce <io_seproxyhal_cancel>

c0de4e78 <menu_address_init>:
c0de4e78:	f240 50e8 	movw	r0, #1512	@ 0x5e8
c0de4e7c:	f2c0 0000 	movt	r0, #0
c0de4e80:	2100      	movs	r1, #0
c0de4e82:	f849 1000 	str.w	r1, [r9, r0]
c0de4e86:	f244 317c 	movw	r1, #17276	@ 0x437c
c0de4e8a:	f240 5cec 	movw	ip, #1516	@ 0x5ec
c0de4e8e:	f2c0 0100 	movt	r1, #0
c0de4e92:	f2c0 0c00 	movt	ip, #0
c0de4e96:	2302      	movs	r3, #2
c0de4e98:	4479      	add	r1, pc
c0de4e9a:	2000      	movs	r0, #0
c0de4e9c:	2200      	movs	r2, #0
c0de4e9e:	f849 300c 	str.w	r3, [r9, ip]
c0de4ea2:	f002 b90b 	b.w	c0de70bc <ux_flow_init>

c0de4ea6 <ui_idle>:
c0de4ea6:	b580      	push	{r7, lr}
c0de4ea8:	f240 50e8 	movw	r0, #1512	@ 0x5e8
c0de4eac:	f2c0 0000 	movt	r0, #0
c0de4eb0:	2100      	movs	r1, #0
c0de4eb2:	f240 42d8 	movw	r2, #1240	@ 0x4d8
c0de4eb6:	f849 1000 	str.w	r1, [r9, r0]
c0de4eba:	f240 50ec 	movw	r0, #1516	@ 0x5ec
c0de4ebe:	f2c0 0200 	movt	r2, #0
c0de4ec2:	f2c0 0000 	movt	r0, #0
c0de4ec6:	f819 2002 	ldrb.w	r2, [r9, r2]
c0de4eca:	f849 1000 	str.w	r1, [r9, r0]
c0de4ece:	f240 50f0 	movw	r0, #1520	@ 0x5f0
c0de4ed2:	f2c0 0000 	movt	r0, #0
c0de4ed6:	f809 1000 	strb.w	r1, [r9, r0]
c0de4eda:	b90a      	cbnz	r2, c0de4ee0 <ui_idle+0x3a>
c0de4edc:	f002 fd8c 	bl	c0de79f8 <ux_stack_push>
c0de4ee0:	f244 2188 	movw	r1, #17032	@ 0x4288
c0de4ee4:	f2c0 0100 	movt	r1, #0
c0de4ee8:	4479      	add	r1, pc
c0de4eea:	2000      	movs	r0, #0
c0de4eec:	2200      	movs	r2, #0
c0de4eee:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de4ef2:	f002 b8e3 	b.w	c0de70bc <ux_flow_init>

c0de4ef6 <try_to_fill_buffer>:
c0de4ef6:	b5b0      	push	{r4, r5, r7, lr}
c0de4ef8:	f240 0c08 	movw	ip, #8
c0de4efc:	f2c0 0c00 	movt	ip, #0
c0de4f00:	eb09 040c 	add.w	r4, r9, ip
c0de4f04:	f8d4 309c 	ldr.w	r3, [r4, #156]	@ 0x9c
c0de4f08:	f894 2097 	ldrb.w	r2, [r4, #151]	@ 0x97
c0de4f0c:	1acc      	subs	r4, r1, r3
c0de4f0e:	4294      	cmp	r4, r2
c0de4f10:	bf28      	it	cs
c0de4f12:	4614      	movcs	r4, r2
c0de4f14:	b302      	cbz	r2, c0de4f58 <try_to_fill_buffer+0x62>
c0de4f16:	1819      	adds	r1, r3, r0
c0de4f18:	2997      	cmp	r1, #151	@ 0x97
c0de4f1a:	d21d      	bcs.n	c0de4f58 <try_to_fill_buffer+0x62>
c0de4f1c:	eb09 050c 	add.w	r5, r9, ip
c0de4f20:	f240 6214 	movw	r2, #1556	@ 0x614
c0de4f24:	f895 0098 	ldrb.w	r0, [r5, #152]	@ 0x98
c0de4f28:	f2c0 0200 	movt	r2, #0
c0de4f2c:	444a      	add	r2, r9
c0de4f2e:	4428      	add	r0, r5
c0de4f30:	4411      	add	r1, r2
c0de4f32:	4622      	mov	r2, r4
c0de4f34:	f003 fabd 	bl	c0de84b2 <__aeabi_memcpy>
c0de4f38:	f8d5 009c 	ldr.w	r0, [r5, #156]	@ 0x9c
c0de4f3c:	f895 1097 	ldrb.w	r1, [r5, #151]	@ 0x97
c0de4f40:	4420      	add	r0, r4
c0de4f42:	f8c5 009c 	str.w	r0, [r5, #156]	@ 0x9c
c0de4f46:	f895 0098 	ldrb.w	r0, [r5, #152]	@ 0x98
c0de4f4a:	4420      	add	r0, r4
c0de4f4c:	f885 0098 	strb.w	r0, [r5, #152]	@ 0x98
c0de4f50:	1b08      	subs	r0, r1, r4
c0de4f52:	f885 0097 	strb.w	r0, [r5, #151]	@ 0x97
c0de4f56:	bdb0      	pop	{r4, r5, r7, pc}
c0de4f58:	2007      	movs	r0, #7
c0de4f5a:	f002 fe62 	bl	c0de7c22 <os_longjmp>

c0de4f5e <build_other_data_ui>:
c0de4f5e:	b5b0      	push	{r4, r5, r7, lr}
c0de4f60:	b094      	sub	sp, #80	@ 0x50
c0de4f62:	f240 0508 	movw	r5, #8
c0de4f66:	f2c0 0500 	movt	r5, #0
c0de4f6a:	eb09 0005 	add.w	r0, r9, r5
c0de4f6e:	f890 4324 	ldrb.w	r4, [r0, #804]	@ 0x324
c0de4f72:	f245 617e 	movw	r1, #22142	@ 0x567e
c0de4f76:	f2c0 0100 	movt	r1, #0
c0de4f7a:	f500 7095 	add.w	r0, r0, #298	@ 0x12a
c0de4f7e:	4479      	add	r1, pc
c0de4f80:	220f      	movs	r2, #15
c0de4f82:	f003 fa96 	bl	c0de84b2 <__aeabi_memcpy>
c0de4f86:	2c0a      	cmp	r4, #10
c0de4f88:	dc11      	bgt.n	c0de4fae <build_other_data_ui+0x50>
c0de4f8a:	2c05      	cmp	r4, #5
c0de4f8c:	dd22      	ble.n	c0de4fd4 <build_other_data_ui+0x76>
c0de4f8e:	2c08      	cmp	r4, #8
c0de4f90:	dc55      	bgt.n	c0de503e <build_other_data_ui+0xe0>
c0de4f92:	2c06      	cmp	r4, #6
c0de4f94:	d078      	beq.n	c0de5088 <build_other_data_ui+0x12a>
c0de4f96:	2c08      	cmp	r4, #8
c0de4f98:	f040 80bb 	bne.w	c0de5112 <build_other_data_ui+0x1b4>
c0de4f9c:	f245 61aa 	movw	r1, #22186	@ 0x56aa
c0de4fa0:	eb09 0005 	add.w	r0, r9, r5
c0de4fa4:	f2c0 0100 	movt	r1, #0
c0de4fa8:	30fd      	adds	r0, #253	@ 0xfd
c0de4faa:	4479      	add	r1, pc
c0de4fac:	e09b      	b.n	c0de50e6 <build_other_data_ui+0x188>
c0de4fae:	2c0d      	cmp	r4, #13
c0de4fb0:	dd34      	ble.n	c0de501c <build_other_data_ui+0xbe>
c0de4fb2:	2c0f      	cmp	r4, #15
c0de4fb4:	dc5b      	bgt.n	c0de506e <build_other_data_ui+0x110>
c0de4fb6:	2c0e      	cmp	r4, #14
c0de4fb8:	d06f      	beq.n	c0de509a <build_other_data_ui+0x13c>
c0de4fba:	2c0f      	cmp	r4, #15
c0de4fbc:	f040 80a9 	bne.w	c0de5112 <build_other_data_ui+0x1b4>
c0de4fc0:	f245 61f2 	movw	r1, #22258	@ 0x56f2
c0de4fc4:	eb09 0005 	add.w	r0, r9, r5
c0de4fc8:	f2c0 0100 	movt	r1, #0
c0de4fcc:	30fd      	adds	r0, #253	@ 0xfd
c0de4fce:	4479      	add	r1, pc
c0de4fd0:	220d      	movs	r2, #13
c0de4fd2:	e0bb      	b.n	c0de514c <build_other_data_ui+0x1ee>
c0de4fd4:	2c03      	cmp	r4, #3
c0de4fd6:	d06a      	beq.n	c0de50ae <build_other_data_ui+0x150>
c0de4fd8:	2c04      	cmp	r4, #4
c0de4fda:	d072      	beq.n	c0de50c2 <build_other_data_ui+0x164>
c0de4fdc:	2c05      	cmp	r4, #5
c0de4fde:	f040 8098 	bne.w	c0de5112 <build_other_data_ui+0x1b4>
c0de4fe2:	f246 5172 	movw	r1, #25970	@ 0x6572
c0de4fe6:	eb09 0005 	add.w	r0, r9, r5
c0de4fea:	f2c7 3169 	movt	r1, #29545	@ 0x7369
c0de4fee:	f800 1ffd 	strb.w	r1, [r0, #253]!
c0de4ff2:	f247 5173 	movw	r1, #30067	@ 0x7573
c0de4ff6:	f2c0 0165 	movt	r1, #101	@ 0x65
c0de4ffa:	f800 1f04 	strb.w	r1, [r0, #4]!
c0de4ffe:	2100      	movs	r1, #0
c0de5000:	2275      	movs	r2, #117	@ 0x75
c0de5002:	70c1      	strb	r1, [r0, #3]
c0de5004:	2165      	movs	r1, #101	@ 0x65
c0de5006:	7042      	strb	r2, [r0, #1]
c0de5008:	2273      	movs	r2, #115	@ 0x73
c0de500a:	7081      	strb	r1, [r0, #2]
c0de500c:	f800 2c01 	strb.w	r2, [r0, #-1]
c0de5010:	2269      	movs	r2, #105	@ 0x69
c0de5012:	f800 2c02 	strb.w	r2, [r0, #-2]
c0de5016:	f800 1c03 	strb.w	r1, [r0, #-3]
c0de501a:	e099      	b.n	c0de5150 <build_other_data_ui+0x1f2>
c0de501c:	2c0b      	cmp	r4, #11
c0de501e:	d05a      	beq.n	c0de50d6 <build_other_data_ui+0x178>
c0de5020:	2c0c      	cmp	r4, #12
c0de5022:	f000 808a 	beq.w	c0de513a <build_other_data_ui+0x1dc>
c0de5026:	2c0d      	cmp	r4, #13
c0de5028:	d173      	bne.n	c0de5112 <build_other_data_ui+0x1b4>
c0de502a:	f245 616c 	movw	r1, #22124	@ 0x566c
c0de502e:	eb09 0005 	add.w	r0, r9, r5
c0de5032:	f2c0 0100 	movt	r1, #0
c0de5036:	30fd      	adds	r0, #253	@ 0xfd
c0de5038:	4479      	add	r1, pc
c0de503a:	220b      	movs	r2, #11
c0de503c:	e086      	b.n	c0de514c <build_other_data_ui+0x1ee>
c0de503e:	2c09      	cmp	r4, #9
c0de5040:	d053      	beq.n	c0de50ea <build_other_data_ui+0x18c>
c0de5042:	2c0a      	cmp	r4, #10
c0de5044:	d165      	bne.n	c0de5112 <build_other_data_ui+0x1b4>
c0de5046:	f245 610e 	movw	r1, #22030	@ 0x560e
c0de504a:	eb09 0405 	add.w	r4, r9, r5
c0de504e:	f2c0 0100 	movt	r1, #0
c0de5052:	f504 7095 	add.w	r0, r4, #298	@ 0x12a
c0de5056:	4479      	add	r1, pc
c0de5058:	2211      	movs	r2, #17
c0de505a:	f003 fa2a 	bl	c0de84b2 <__aeabi_memcpy>
c0de505e:	f245 610e 	movw	r1, #22030	@ 0x560e
c0de5062:	f2c0 0100 	movt	r1, #0
c0de5066:	f104 00fd 	add.w	r0, r4, #253	@ 0xfd
c0de506a:	4479      	add	r1, pc
c0de506c:	e04f      	b.n	c0de510e <build_other_data_ui+0x1b0>
c0de506e:	2c10      	cmp	r4, #16
c0de5070:	d045      	beq.n	c0de50fe <build_other_data_ui+0x1a0>
c0de5072:	2c11      	cmp	r4, #17
c0de5074:	d14d      	bne.n	c0de5112 <build_other_data_ui+0x1b4>
c0de5076:	f245 6160 	movw	r1, #22112	@ 0x5660
c0de507a:	eb09 0005 	add.w	r0, r9, r5
c0de507e:	f2c0 0100 	movt	r1, #0
c0de5082:	30fd      	adds	r0, #253	@ 0xfd
c0de5084:	4479      	add	r1, pc
c0de5086:	e042      	b.n	c0de510e <build_other_data_ui+0x1b0>
c0de5088:	f245 51b8 	movw	r1, #21944	@ 0x55b8
c0de508c:	eb09 0005 	add.w	r0, r9, r5
c0de5090:	f2c0 0100 	movt	r1, #0
c0de5094:	30fd      	adds	r0, #253	@ 0xfd
c0de5096:	4479      	add	r1, pc
c0de5098:	e057      	b.n	c0de514a <build_other_data_ui+0x1ec>
c0de509a:	f245 6108 	movw	r1, #22024	@ 0x5608
c0de509e:	eb09 0005 	add.w	r0, r9, r5
c0de50a2:	f2c0 0100 	movt	r1, #0
c0de50a6:	30fd      	adds	r0, #253	@ 0xfd
c0de50a8:	4479      	add	r1, pc
c0de50aa:	220c      	movs	r2, #12
c0de50ac:	e04e      	b.n	c0de514c <build_other_data_ui+0x1ee>
c0de50ae:	f245 5180 	movw	r1, #21888	@ 0x5580
c0de50b2:	eb09 0005 	add.w	r0, r9, r5
c0de50b6:	f2c0 0100 	movt	r1, #0
c0de50ba:	30fd      	adds	r0, #253	@ 0xfd
c0de50bc:	4479      	add	r1, pc
c0de50be:	2206      	movs	r2, #6
c0de50c0:	e044      	b.n	c0de514c <build_other_data_ui+0x1ee>
c0de50c2:	f245 5174 	movw	r1, #21876	@ 0x5574
c0de50c6:	eb09 0005 	add.w	r0, r9, r5
c0de50ca:	f2c0 0100 	movt	r1, #0
c0de50ce:	30fd      	adds	r0, #253	@ 0xfd
c0de50d0:	4479      	add	r1, pc
c0de50d2:	2209      	movs	r2, #9
c0de50d4:	e03a      	b.n	c0de514c <build_other_data_ui+0x1ee>
c0de50d6:	f245 51a8 	movw	r1, #21928	@ 0x55a8
c0de50da:	eb09 0005 	add.w	r0, r9, r5
c0de50de:	f2c0 0100 	movt	r1, #0
c0de50e2:	30fd      	adds	r0, #253	@ 0xfd
c0de50e4:	4479      	add	r1, pc
c0de50e6:	220e      	movs	r2, #14
c0de50e8:	e030      	b.n	c0de514c <build_other_data_ui+0x1ee>
c0de50ea:	f245 5134 	movw	r1, #21812	@ 0x5534
c0de50ee:	eb09 0005 	add.w	r0, r9, r5
c0de50f2:	f2c0 0100 	movt	r1, #0
c0de50f6:	30fd      	adds	r0, #253	@ 0xfd
c0de50f8:	4479      	add	r1, pc
c0de50fa:	220f      	movs	r2, #15
c0de50fc:	e026      	b.n	c0de514c <build_other_data_ui+0x1ee>
c0de50fe:	f245 51c4 	movw	r1, #21956	@ 0x55c4
c0de5102:	eb09 0005 	add.w	r0, r9, r5
c0de5106:	f2c0 0100 	movt	r1, #0
c0de510a:	30fd      	adds	r0, #253	@ 0xfd
c0de510c:	4479      	add	r1, pc
c0de510e:	2212      	movs	r2, #18
c0de5110:	e01c      	b.n	c0de514c <build_other_data_ui+0x1ee>
c0de5112:	2cc9      	cmp	r4, #201	@ 0xc9
c0de5114:	d31c      	bcc.n	c0de5150 <build_other_data_ui+0x1f2>
c0de5116:	f245 51d1 	movw	r1, #21969	@ 0x55d1
c0de511a:	eb09 0005 	add.w	r0, r9, r5
c0de511e:	f2c0 0100 	movt	r1, #0
c0de5122:	f500 7095 	add.w	r0, r0, #298	@ 0x12a
c0de5126:	4479      	add	r1, pc
c0de5128:	2205      	movs	r2, #5
c0de512a:	f003 f9c2 	bl	c0de84b2 <__aeabi_memcpy>
c0de512e:	2cfd      	cmp	r4, #253	@ 0xfd
c0de5130:	dc39      	bgt.n	c0de51a6 <build_other_data_ui+0x248>
c0de5132:	2cfc      	cmp	r4, #252	@ 0xfc
c0de5134:	d04d      	beq.n	c0de51d2 <build_other_data_ui+0x274>
c0de5136:	2cfd      	cmp	r4, #253	@ 0xfd
c0de5138:	d179      	bne.n	c0de522e <build_other_data_ui+0x2d0>
c0de513a:	f245 5153 	movw	r1, #21843	@ 0x5553
c0de513e:	eb09 0005 	add.w	r0, r9, r5
c0de5142:	f2c0 0100 	movt	r1, #0
c0de5146:	30fd      	adds	r0, #253	@ 0xfd
c0de5148:	4479      	add	r1, pc
c0de514a:	2205      	movs	r2, #5
c0de514c:	f003 f9b1 	bl	c0de84b2 <__aeabi_memcpy>
c0de5150:	eb09 0005 	add.w	r0, r9, r5
c0de5154:	30fd      	adds	r0, #253	@ 0xfd
c0de5156:	f003 fa09 	bl	c0de856c <strlen>
c0de515a:	b950      	cbnz	r0, c0de5172 <build_other_data_ui+0x214>
c0de515c:	f245 51a6 	movw	r1, #21926	@ 0x55a6
c0de5160:	eb09 0005 	add.w	r0, r9, r5
c0de5164:	f2c0 0100 	movt	r1, #0
c0de5168:	30fd      	adds	r0, #253	@ 0xfd
c0de516a:	4479      	add	r1, pc
c0de516c:	220c      	movs	r2, #12
c0de516e:	f003 f9a0 	bl	c0de84b2 <__aeabi_memcpy>
c0de5172:	eb09 0005 	add.w	r0, r9, r5
c0de5176:	ac01      	add	r4, sp, #4
c0de5178:	f500 7067 	add.w	r0, r0, #924	@ 0x39c
c0de517c:	4621      	mov	r1, r4
c0de517e:	f7fb f8bd 	bl	c0de02fc <get_curve25519_public_key_for_path>
c0de5182:	2800      	cmp	r0, #0
c0de5184:	d05d      	beq.n	c0de5242 <build_other_data_ui+0x2e4>
c0de5186:	f104 0008 	add.w	r0, r4, #8
c0de518a:	eb09 0c05 	add.w	ip, r9, r5
c0de518e:	c83a      	ldmia	r0!, {r1, r3, r4, r5}
c0de5190:	f10c 02ac 	add.w	r2, ip, #172	@ 0xac
c0de5194:	c23a      	stmia	r2!, {r1, r3, r4, r5}
c0de5196:	e890 003a 	ldmia.w	r0, {r1, r3, r4, r5}
c0de519a:	2001      	movs	r0, #1
c0de519c:	c23a      	stmia	r2!, {r1, r3, r4, r5}
c0de519e:	f88c 0218 	strb.w	r0, [ip, #536]	@ 0x218
c0de51a2:	b014      	add	sp, #80	@ 0x50
c0de51a4:	bdb0      	pop	{r4, r5, r7, pc}
c0de51a6:	2cfe      	cmp	r4, #254	@ 0xfe
c0de51a8:	d01c      	beq.n	c0de51e4 <build_other_data_ui+0x286>
c0de51aa:	2cff      	cmp	r4, #255	@ 0xff
c0de51ac:	d13f      	bne.n	c0de522e <build_other_data_ui+0x2d0>
c0de51ae:	eb09 0005 	add.w	r0, r9, r5
c0de51b2:	216d      	movs	r1, #109	@ 0x6d
c0de51b4:	f800 1ffd 	strb.w	r1, [r0, #253]!
c0de51b8:	2161      	movs	r1, #97	@ 0x61
c0de51ba:	f800 1f04 	strb.w	r1, [r0, #4]!
c0de51be:	2100      	movs	r1, #0
c0de51c0:	2267      	movs	r2, #103	@ 0x67
c0de51c2:	70c1      	strb	r1, [r0, #3]
c0de51c4:	2165      	movs	r1, #101	@ 0x65
c0de51c6:	7042      	strb	r2, [r0, #1]
c0de51c8:	2273      	movs	r2, #115	@ 0x73
c0de51ca:	7081      	strb	r1, [r0, #2]
c0de51cc:	f800 2c01 	strb.w	r2, [r0, #-1]
c0de51d0:	e71f      	b.n	c0de5012 <build_other_data_ui+0xb4>
c0de51d2:	f245 511d 	movw	r1, #21789	@ 0x551d
c0de51d6:	eb09 0005 	add.w	r0, r9, r5
c0de51da:	f2c0 0100 	movt	r1, #0
c0de51de:	30fd      	adds	r0, #253	@ 0xfd
c0de51e0:	4479      	add	r1, pc
c0de51e2:	e76c      	b.n	c0de50be <build_other_data_ui+0x160>
c0de51e4:	f64f 50f2 	movw	r0, #65010	@ 0xfdf2
c0de51e8:	f247 5173 	movw	r1, #30067	@ 0x7573
c0de51ec:	f2c0 000e 	movt	r0, #14
c0de51f0:	f2c0 0165 	movt	r1, #101	@ 0x65
c0de51f4:	4408      	add	r0, r1
c0de51f6:	f246 5172 	movw	r1, #25970	@ 0x6572
c0de51fa:	f2c7 3169 	movt	r1, #29545	@ 0x7369
c0de51fe:	f101 7102 	add.w	r1, r1, #34078720	@ 0x2080000
c0de5202:	eb09 0205 	add.w	r2, r9, r5
c0de5206:	f802 1ffd 	strb.w	r1, [r2, #253]!
c0de520a:	f802 0f04 	strb.w	r0, [r2, #4]!
c0de520e:	2000      	movs	r0, #0
c0de5210:	70d0      	strb	r0, [r2, #3]
c0de5212:	2074      	movs	r0, #116	@ 0x74
c0de5214:	7090      	strb	r0, [r2, #2]
c0de5216:	2073      	movs	r0, #115	@ 0x73
c0de5218:	7050      	strb	r0, [r2, #1]
c0de521a:	2075      	movs	r0, #117	@ 0x75
c0de521c:	f802 0c01 	strb.w	r0, [r2, #-1]
c0de5220:	2071      	movs	r0, #113	@ 0x71
c0de5222:	f802 0c02 	strb.w	r0, [r2, #-2]
c0de5226:	2065      	movs	r0, #101	@ 0x65
c0de5228:	f802 0c03 	strb.w	r0, [r2, #-3]
c0de522c:	e790      	b.n	c0de5150 <build_other_data_ui+0x1f2>
c0de522e:	f245 41c8 	movw	r1, #21704	@ 0x54c8
c0de5232:	eb09 0005 	add.w	r0, r9, r5
c0de5236:	f2c0 0100 	movt	r1, #0
c0de523a:	30fd      	adds	r0, #253	@ 0xfd
c0de523c:	4479      	add	r1, pc
c0de523e:	220a      	movs	r2, #10
c0de5240:	e784      	b.n	c0de514c <build_other_data_ui+0x1ee>
c0de5242:	2002      	movs	r0, #2
c0de5244:	f002 fced 	bl	c0de7c22 <os_longjmp>

c0de5248 <getMessageType>:
c0de5248:	b580      	push	{r7, lr}
c0de524a:	f240 0008 	movw	r0, #8
c0de524e:	f2c0 0000 	movt	r0, #0
c0de5252:	4448      	add	r0, r9
c0de5254:	f890 2324 	ldrb.w	r2, [r0, #804]	@ 0x324
c0de5258:	f890 1325 	ldrb.w	r1, [r0, #805]	@ 0x325
c0de525c:	2a0a      	cmp	r2, #10
c0de525e:	dc08      	bgt.n	c0de5272 <getMessageType+0x2a>
c0de5260:	2a05      	cmp	r2, #5
c0de5262:	dd0f      	ble.n	c0de5284 <getMessageType+0x3c>
c0de5264:	2a08      	cmp	r2, #8
c0de5266:	dc1b      	bgt.n	c0de52a0 <getMessageType+0x58>
c0de5268:	2a06      	cmp	r2, #6
c0de526a:	d01d      	beq.n	c0de52a8 <getMessageType+0x60>
c0de526c:	2a08      	cmp	r2, #8
c0de526e:	d01b      	beq.n	c0de52a8 <getMessageType+0x60>
c0de5270:	e023      	b.n	c0de52ba <getMessageType+0x72>
c0de5272:	2a0d      	cmp	r2, #13
c0de5274:	dd0d      	ble.n	c0de5292 <getMessageType+0x4a>
c0de5276:	2a0f      	cmp	r2, #15
c0de5278:	dc1b      	bgt.n	c0de52b2 <getMessageType+0x6a>
c0de527a:	2a0e      	cmp	r2, #14
c0de527c:	d027      	beq.n	c0de52ce <getMessageType+0x86>
c0de527e:	2a0f      	cmp	r2, #15
c0de5280:	d025      	beq.n	c0de52ce <getMessageType+0x86>
c0de5282:	e01a      	b.n	c0de52ba <getMessageType+0x72>
c0de5284:	2a03      	cmp	r2, #3
c0de5286:	d00f      	beq.n	c0de52a8 <getMessageType+0x60>
c0de5288:	2a04      	cmp	r2, #4
c0de528a:	d00d      	beq.n	c0de52a8 <getMessageType+0x60>
c0de528c:	2a05      	cmp	r2, #5
c0de528e:	d00b      	beq.n	c0de52a8 <getMessageType+0x60>
c0de5290:	e013      	b.n	c0de52ba <getMessageType+0x72>
c0de5292:	2a0b      	cmp	r2, #11
c0de5294:	d01b      	beq.n	c0de52ce <getMessageType+0x86>
c0de5296:	2a0c      	cmp	r2, #12
c0de5298:	d019      	beq.n	c0de52ce <getMessageType+0x86>
c0de529a:	2a0d      	cmp	r2, #13
c0de529c:	d017      	beq.n	c0de52ce <getMessageType+0x86>
c0de529e:	e00c      	b.n	c0de52ba <getMessageType+0x72>
c0de52a0:	2a09      	cmp	r2, #9
c0de52a2:	d001      	beq.n	c0de52a8 <getMessageType+0x60>
c0de52a4:	2a0a      	cmp	r2, #10
c0de52a6:	d108      	bne.n	c0de52ba <getMessageType+0x72>
c0de52a8:	2002      	movs	r0, #2
c0de52aa:	2903      	cmp	r1, #3
c0de52ac:	bf38      	it	cc
c0de52ae:	2001      	movcc	r0, #1
c0de52b0:	bd80      	pop	{r7, pc}
c0de52b2:	2a10      	cmp	r2, #16
c0de52b4:	d00b      	beq.n	c0de52ce <getMessageType+0x86>
c0de52b6:	2a11      	cmp	r2, #17
c0de52b8:	d00e      	beq.n	c0de52d8 <getMessageType+0x90>
c0de52ba:	2ac9      	cmp	r2, #201	@ 0xc9
c0de52bc:	d30e      	bcc.n	c0de52dc <getMessageType+0x94>
c0de52be:	2002      	movs	r0, #2
c0de52c0:	2904      	cmp	r1, #4
c0de52c2:	bf38      	it	cc
c0de52c4:	2001      	movcc	r0, #1
c0de52c6:	2afc      	cmp	r2, #252	@ 0xfc
c0de52c8:	bf18      	it	ne
c0de52ca:	2001      	movne	r0, #1
c0de52cc:	bd80      	pop	{r7, pc}
c0de52ce:	2901      	cmp	r1, #1
c0de52d0:	bf04      	itt	eq
c0de52d2:	2001      	moveq	r0, #1
c0de52d4:	bd80      	popeq	{r7, pc}
c0de52d6:	b109      	cbz	r1, c0de52dc <getMessageType+0x94>
c0de52d8:	2002      	movs	r0, #2
c0de52da:	bd80      	pop	{r7, pc}
c0de52dc:	f249 1004 	movw	r0, #37124	@ 0x9104
c0de52e0:	f002 fc9f 	bl	c0de7c22 <os_longjmp>

c0de52e4 <make_allowed_ui_steps>:
c0de52e4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de52e8:	b083      	sub	sp, #12
c0de52ea:	f240 0708 	movw	r7, #8
c0de52ee:	f2c0 0700 	movt	r7, #0
c0de52f2:	eb09 0107 	add.w	r1, r9, r7
c0de52f6:	f8d1 1328 	ldr.w	r1, [r1, #808]	@ 0x328
c0de52fa:	4604      	mov	r4, r0
c0de52fc:	2902      	cmp	r1, #2
c0de52fe:	d176      	bne.n	c0de53ee <make_allowed_ui_steps+0x10a>
c0de5300:	b17c      	cbz	r4, c0de5322 <make_allowed_ui_steps+0x3e>
c0de5302:	f240 6014 	movw	r0, #1556	@ 0x614
c0de5306:	f2c0 0000 	movt	r0, #0
c0de530a:	4448      	add	r0, r9
c0de530c:	7901      	ldrb	r1, [r0, #4]
c0de530e:	eb09 0007 	add.w	r0, r9, r7
c0de5312:	f8d0 23b8 	ldr.w	r2, [r0, #952]	@ 0x3b8
c0de5316:	428a      	cmp	r2, r1
c0de5318:	d103      	bne.n	c0de5322 <make_allowed_ui_steps+0x3e>
c0de531a:	f890 039a 	ldrb.w	r0, [r0, #922]	@ 0x39a
c0de531e:	2806      	cmp	r0, #6
c0de5320:	d07e      	beq.n	c0de5420 <make_allowed_ui_steps+0x13c>
c0de5322:	eb09 0007 	add.w	r0, r9, r7
c0de5326:	f890 0218 	ldrb.w	r0, [r0, #536]	@ 0x218
c0de532a:	2801      	cmp	r0, #1
c0de532c:	f000 81c3 	beq.w	c0de56b6 <make_allowed_ui_steps+0x3d2>
c0de5330:	f240 6814 	movw	r8, #1556	@ 0x614
c0de5334:	f2c0 0800 	movt	r8, #0
c0de5338:	eb09 0007 	add.w	r0, r9, r7
c0de533c:	eb09 0308 	add.w	r3, r9, r8
c0de5340:	f890 23b8 	ldrb.w	r2, [r0, #952]	@ 0x3b8
c0de5344:	791b      	ldrb	r3, [r3, #4]
c0de5346:	f8d0 53bc 	ldr.w	r5, [r0, #956]	@ 0x3bc
c0de534a:	f890 1324 	ldrb.w	r1, [r0, #804]	@ 0x324
c0de534e:	1a98      	subs	r0, r3, r2
c0de5350:	2d00      	cmp	r5, #0
c0de5352:	f04f 0305 	mov.w	r3, #5
c0de5356:	bf08      	it	eq
c0de5358:	381d      	subeq	r0, #29
c0de535a:	bf08      	it	eq
c0de535c:	2322      	moveq	r3, #34	@ 0x22
c0de535e:	29fc      	cmp	r1, #252	@ 0xfc
c0de5360:	eb03 0102 	add.w	r1, r3, r2
c0de5364:	d165      	bne.n	c0de5432 <make_allowed_ui_steps+0x14e>
c0de5366:	eb09 0207 	add.w	r2, r9, r7
c0de536a:	f892 239a 	ldrb.w	r2, [r2, #922]	@ 0x39a
c0de536e:	2a06      	cmp	r2, #6
c0de5370:	d131      	bne.n	c0de53d6 <make_allowed_ui_steps+0xf2>
c0de5372:	eb09 0507 	add.w	r5, r9, r7
c0de5376:	b2ce      	uxtb	r6, r1
c0de5378:	eb09 0108 	add.w	r1, r9, r8
c0de537c:	f8b5 33b4 	ldrh.w	r3, [r5, #948]	@ 0x3b4
c0de5380:	4431      	add	r1, r6
c0de5382:	b2c2      	uxtb	r2, r0
c0de5384:	4628      	mov	r0, r5
c0de5386:	9600      	str	r6, [sp, #0]
c0de5388:	f7ff fa39 	bl	c0de47fe <build_protobuf_order>
c0de538c:	f105 060a 	add.w	r6, r5, #10
c0de5390:	4630      	mov	r0, r6
c0de5392:	2140      	movs	r1, #64	@ 0x40
c0de5394:	f003 f88a 	bl	c0de84ac <__aeabi_memclr>
c0de5398:	f04f 0c20 	mov.w	ip, #32
c0de539c:	f505 7008 	add.w	r0, r5, #544	@ 0x220
c0de53a0:	2101      	movs	r1, #1
c0de53a2:	2200      	movs	r2, #0
c0de53a4:	2300      	movs	r3, #0
c0de53a6:	9600      	str	r6, [sp, #0]
c0de53a8:	f8cd c004 	str.w	ip, [sp, #4]
c0de53ac:	f002 fc15 	bl	c0de7bda <cx_hash_no_throw>
c0de53b0:	2800      	cmp	r0, #0
c0de53b2:	f040 817a 	bne.w	c0de56aa <make_allowed_ui_steps+0x3c6>
c0de53b6:	eb09 0507 	add.w	r5, r9, r7
c0de53ba:	f505 7008 	add.w	r0, r5, #544	@ 0x220
c0de53be:	f002 fc08 	bl	c0de7bd2 <cx_hash_get_size>
c0de53c2:	f205 306d 	addw	r0, r5, #877	@ 0x36d
c0de53c6:	f105 010a 	add.w	r1, r5, #10
c0de53ca:	2220      	movs	r2, #32
c0de53cc:	f003 f880 	bl	c0de84d0 <memcmp>
c0de53d0:	2800      	cmp	r0, #0
c0de53d2:	f040 816c 	bne.w	c0de56ae <make_allowed_ui_steps+0x3ca>
c0de53d6:	2c00      	cmp	r4, #0
c0de53d8:	f000 8171 	beq.w	c0de56be <make_allowed_ui_steps+0x3da>
c0de53dc:	eb09 0007 	add.w	r0, r9, r7
c0de53e0:	2108      	movs	r1, #8
c0de53e2:	f880 139a 	strb.w	r1, [r0, #922]	@ 0x39a
c0de53e6:	2101      	movs	r1, #1
c0de53e8:	f880 1218 	strb.w	r1, [r0, #536]	@ 0x218
c0de53ec:	e15a      	b.n	c0de56a4 <make_allowed_ui_steps+0x3c0>
c0de53ee:	eb09 0107 	add.w	r1, r9, r7
c0de53f2:	f891 0096 	ldrb.w	r0, [r1, #150]	@ 0x96
c0de53f6:	f891 139a 	ldrb.w	r1, [r1, #922]	@ 0x39a
c0de53fa:	b9a8      	cbnz	r0, c0de5428 <make_allowed_ui_steps+0x144>
c0de53fc:	2906      	cmp	r1, #6
c0de53fe:	d113      	bne.n	c0de5428 <make_allowed_ui_steps+0x144>
c0de5400:	2c00      	cmp	r4, #0
c0de5402:	f000 808f 	beq.w	c0de5524 <make_allowed_ui_steps+0x240>
c0de5406:	f240 6214 	movw	r2, #1556	@ 0x614
c0de540a:	f2c0 0200 	movt	r2, #0
c0de540e:	444a      	add	r2, r9
c0de5410:	eb09 0307 	add.w	r3, r9, r7
c0de5414:	7912      	ldrb	r2, [r2, #4]
c0de5416:	f8d3 53b8 	ldr.w	r5, [r3, #952]	@ 0x3b8
c0de541a:	4295      	cmp	r5, r2
c0de541c:	f040 8086 	bne.w	c0de552c <make_allowed_ui_steps+0x248>
c0de5420:	f249 1002 	movw	r0, #37122	@ 0x9102
c0de5424:	f002 fbfd 	bl	c0de7c22 <os_longjmp>
c0de5428:	eb09 0207 	add.w	r2, r9, r7
c0de542c:	f892 509c 	ldrb.w	r5, [r2, #156]	@ 0x9c
c0de5430:	e084      	b.n	c0de553c <make_allowed_ui_steps+0x258>
c0de5432:	eb09 0407 	add.w	r4, r9, r7
c0de5436:	b2ce      	uxtb	r6, r1
c0de5438:	eb09 0108 	add.w	r1, r9, r8
c0de543c:	f8b4 33b4 	ldrh.w	r3, [r4, #948]	@ 0x3b4
c0de5440:	4431      	add	r1, r6
c0de5442:	b2c2      	uxtb	r2, r0
c0de5444:	4620      	mov	r0, r4
c0de5446:	9600      	str	r6, [sp, #0]
c0de5448:	f7ff f977 	bl	c0de473a <build_protobuf_root_tx>
c0de544c:	f104 050a 	add.w	r5, r4, #10
c0de5450:	4628      	mov	r0, r5
c0de5452:	2140      	movs	r1, #64	@ 0x40
c0de5454:	f003 f82a 	bl	c0de84ac <__aeabi_memclr>
c0de5458:	2620      	movs	r6, #32
c0de545a:	f504 7008 	add.w	r0, r4, #544	@ 0x220
c0de545e:	2101      	movs	r1, #1
c0de5460:	2200      	movs	r2, #0
c0de5462:	2300      	movs	r3, #0
c0de5464:	9500      	str	r5, [sp, #0]
c0de5466:	9601      	str	r6, [sp, #4]
c0de5468:	f002 fbb7 	bl	c0de7bda <cx_hash_no_throw>
c0de546c:	2800      	cmp	r0, #0
c0de546e:	f040 811c 	bne.w	c0de56aa <make_allowed_ui_steps+0x3c6>
c0de5472:	eb09 0407 	add.w	r4, r9, r7
c0de5476:	f504 7008 	add.w	r0, r4, #544	@ 0x220
c0de547a:	f002 fbaa 	bl	c0de7bd2 <cx_hash_get_size>
c0de547e:	f204 306d 	addw	r0, r4, #877	@ 0x36d
c0de5482:	f104 010a 	add.w	r1, r4, #10
c0de5486:	2220      	movs	r2, #32
c0de5488:	f003 f822 	bl	c0de84d0 <memcmp>
c0de548c:	2800      	cmp	r0, #0
c0de548e:	f040 810e 	bne.w	c0de56ae <make_allowed_ui_steps+0x3ca>
c0de5492:	eb09 0407 	add.w	r4, r9, r7
c0de5496:	4620      	mov	r0, r4
c0de5498:	21aa      	movs	r1, #170	@ 0xaa
c0de549a:	f003 f807 	bl	c0de84ac <__aeabi_memclr>
c0de549e:	f504 7408 	add.w	r4, r4, #544	@ 0x220
c0de54a2:	4620      	mov	r0, r4
c0de54a4:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de54a8:	f003 f800 	bl	c0de84ac <__aeabi_memclr>
c0de54ac:	4620      	mov	r0, r4
c0de54ae:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de54b2:	f002 fb76 	bl	c0de7ba2 <cx_blake2b_init_no_throw>
c0de54b6:	2800      	cmp	r0, #0
c0de54b8:	f040 80f7 	bne.w	c0de56aa <make_allowed_ui_steps+0x3c6>
c0de54bc:	eb09 0407 	add.w	r4, r9, r7
c0de54c0:	eb09 0108 	add.w	r1, r9, r8
c0de54c4:	f894 039b 	ldrb.w	r0, [r4, #923]	@ 0x39b
c0de54c8:	790b      	ldrb	r3, [r1, #4]
c0de54ca:	180a      	adds	r2, r1, r0
c0de54cc:	1a18      	subs	r0, r3, r0
c0de54ce:	f8b4 33b4 	ldrh.w	r3, [r4, #948]	@ 0x3b4
c0de54d2:	1d51      	adds	r1, r2, #5
c0de54d4:	b2c2      	uxtb	r2, r0
c0de54d6:	4620      	mov	r0, r4
c0de54d8:	f7ff f859 	bl	c0de458e <build_protobuf_child_tx>
c0de54dc:	f104 050a 	add.w	r5, r4, #10
c0de54e0:	4628      	mov	r0, r5
c0de54e2:	2140      	movs	r1, #64	@ 0x40
c0de54e4:	f002 ffe2 	bl	c0de84ac <__aeabi_memclr>
c0de54e8:	2620      	movs	r6, #32
c0de54ea:	f504 7008 	add.w	r0, r4, #544	@ 0x220
c0de54ee:	2101      	movs	r1, #1
c0de54f0:	2200      	movs	r2, #0
c0de54f2:	2300      	movs	r3, #0
c0de54f4:	9500      	str	r5, [sp, #0]
c0de54f6:	9601      	str	r6, [sp, #4]
c0de54f8:	f002 fb6f 	bl	c0de7bda <cx_hash_no_throw>
c0de54fc:	2800      	cmp	r0, #0
c0de54fe:	f040 80d4 	bne.w	c0de56aa <make_allowed_ui_steps+0x3c6>
c0de5502:	eb09 0407 	add.w	r4, r9, r7
c0de5506:	f504 7008 	add.w	r0, r4, #544	@ 0x220
c0de550a:	f002 fb62 	bl	c0de7bd2 <cx_hash_get_size>
c0de550e:	f204 306d 	addw	r0, r4, #877	@ 0x36d
c0de5512:	f104 010a 	add.w	r1, r4, #10
c0de5516:	2220      	movs	r2, #32
c0de5518:	f002 ffda 	bl	c0de84d0 <memcmp>
c0de551c:	2800      	cmp	r0, #0
c0de551e:	f000 80c1 	beq.w	c0de56a4 <make_allowed_ui_steps+0x3c0>
c0de5522:	e0c4      	b.n	c0de56ae <make_allowed_ui_steps+0x3ca>
c0de5524:	eb09 0207 	add.w	r2, r9, r7
c0de5528:	f892 53b8 	ldrb.w	r5, [r2, #952]	@ 0x3b8
c0de552c:	eb09 0207 	add.w	r2, r9, r7
c0de5530:	f8d2 23bc 	ldr.w	r2, [r2, #956]	@ 0x3bc
c0de5534:	b912      	cbnz	r2, c0de553c <make_allowed_ui_steps+0x258>
c0de5536:	b2ea      	uxtb	r2, r5
c0de5538:	f102 051d 	add.w	r5, r2, #29
c0de553c:	2906      	cmp	r1, #6
c0de553e:	f040 80a6 	bne.w	c0de568e <make_allowed_ui_steps+0x3aa>
c0de5542:	eb09 0107 	add.w	r1, r9, r7
c0de5546:	f891 1324 	ldrb.w	r1, [r1, #804]	@ 0x324
c0de554a:	f240 6814 	movw	r8, #1556	@ 0x614
c0de554e:	2904      	cmp	r1, #4
c0de5550:	f2c0 0800 	movt	r8, #0
c0de5554:	d11e      	bne.n	c0de5594 <make_allowed_ui_steps+0x2b0>
c0de5556:	eb09 0108 	add.w	r1, r9, r8
c0de555a:	790e      	ldrb	r6, [r1, #4]
c0de555c:	e006      	b.n	c0de556c <make_allowed_ui_steps+0x288>
c0de555e:	bf00      	nop
c0de5560:	f7ff fa36 	bl	c0de49d0 <build_transfer_ui_step>
c0de5564:	eb09 0007 	add.w	r0, r9, r7
c0de5568:	f890 0096 	ldrb.w	r0, [r0, #150]	@ 0x96
c0de556c:	eb09 0107 	add.w	r1, r9, r7
c0de5570:	f8d1 109c 	ldr.w	r1, [r1, #156]	@ 0x9c
c0de5574:	42b1      	cmp	r1, r6
c0de5576:	d002      	beq.n	c0de557e <make_allowed_ui_steps+0x29a>
c0de5578:	b2c1      	uxtb	r1, r0
c0de557a:	290f      	cmp	r1, #15
c0de557c:	d3f0      	bcc.n	c0de5560 <make_allowed_ui_steps+0x27c>
c0de557e:	b2c0      	uxtb	r0, r0
c0de5580:	280f      	cmp	r0, #15
c0de5582:	bf02      	ittt	eq
c0de5584:	eb09 0007 	addeq.w	r0, r9, r7
c0de5588:	f890 0218 	ldrbeq.w	r0, [r0, #536]	@ 0x218
c0de558c:	f010 0001 	andseq.w	r0, r0, #1
c0de5590:	d105      	bne.n	c0de559e <make_allowed_ui_steps+0x2ba>
c0de5592:	e7e5      	b.n	c0de5560 <make_allowed_ui_steps+0x27c>
c0de5594:	3001      	adds	r0, #1
c0de5596:	eb09 0107 	add.w	r1, r9, r7
c0de559a:	f881 0096 	strb.w	r0, [r1, #150]	@ 0x96
c0de559e:	eb09 0008 	add.w	r0, r9, r8
c0de55a2:	7900      	ldrb	r0, [r0, #4]
c0de55a4:	eb09 0207 	add.w	r2, r9, r7
c0de55a8:	1b40      	subs	r0, r0, r5
c0de55aa:	f8d2 10a0 	ldr.w	r1, [r2, #160]	@ 0xa0
c0de55ae:	b2c3      	uxtb	r3, r0
c0de55b0:	f8d2 23b4 	ldr.w	r2, [r2, #948]	@ 0x3b4
c0de55b4:	18c8      	adds	r0, r1, r3
c0de55b6:	4290      	cmp	r0, r2
c0de55b8:	b2ee      	uxtb	r6, r5
c0de55ba:	d218      	bcs.n	c0de55ee <make_allowed_ui_steps+0x30a>
c0de55bc:	eb09 0107 	add.w	r1, r9, r7
c0de55c0:	f8c1 00a0 	str.w	r0, [r1, #160]	@ 0xa0
c0de55c4:	eb09 0008 	add.w	r0, r9, r8
c0de55c8:	4430      	add	r0, r6
c0de55ca:	1d42      	adds	r2, r0, #5
c0de55cc:	2600      	movs	r6, #0
c0de55ce:	f501 7008 	add.w	r0, r1, #544	@ 0x220
c0de55d2:	2100      	movs	r1, #0
c0de55d4:	9600      	str	r6, [sp, #0]
c0de55d6:	9601      	str	r6, [sp, #4]
c0de55d8:	f002 faff 	bl	c0de7bda <cx_hash_no_throw>
c0de55dc:	2800      	cmp	r0, #0
c0de55de:	d164      	bne.n	c0de56aa <make_allowed_ui_steps+0x3c6>
c0de55e0:	eb09 0007 	add.w	r0, r9, r7
c0de55e4:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de55e8:	f002 faf3 	bl	c0de7bd2 <cx_hash_get_size>
c0de55ec:	e04f      	b.n	c0de568e <make_allowed_ui_steps+0x3aa>
c0de55ee:	eb09 0007 	add.w	r0, r9, r7
c0de55f2:	1a55      	subs	r5, r2, r1
c0de55f4:	f890 1324 	ldrb.w	r1, [r0, #804]	@ 0x324
c0de55f8:	f04f 0a00 	mov.w	sl, #0
c0de55fc:	2904      	cmp	r1, #4
c0de55fe:	f8c0 a0a0 	str.w	sl, [r0, #160]	@ 0xa0
c0de5602:	d105      	bne.n	c0de5610 <make_allowed_ui_steps+0x32c>
c0de5604:	b2eb      	uxtb	r3, r5
c0de5606:	eb09 0007 	add.w	r0, r9, r7
c0de560a:	f8c0 30a0 	str.w	r3, [r0, #160]	@ 0xa0
c0de560e:	e00c      	b.n	c0de562a <make_allowed_ui_steps+0x346>
c0de5610:	f7ff fca5 	bl	c0de4f5e <build_other_data_ui>
c0de5614:	eb09 0007 	add.w	r0, r9, r7
c0de5618:	2107      	movs	r1, #7
c0de561a:	f880 139a 	strb.w	r1, [r0, #922]	@ 0x39a
c0de561e:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de5622:	b2eb      	uxtb	r3, r5
c0de5624:	4419      	add	r1, r3
c0de5626:	f8c0 10a0 	str.w	r1, [r0, #160]	@ 0xa0
c0de562a:	eb09 0108 	add.w	r1, r9, r8
c0de562e:	4431      	add	r1, r6
c0de5630:	1d4a      	adds	r2, r1, #5
c0de5632:	f500 7008 	add.w	r0, r0, #544	@ 0x220
c0de5636:	2100      	movs	r1, #0
c0de5638:	f8cd a000 	str.w	sl, [sp]
c0de563c:	f8cd a004 	str.w	sl, [sp, #4]
c0de5640:	f002 facb 	bl	c0de7bda <cx_hash_no_throw>
c0de5644:	bb88      	cbnz	r0, c0de56aa <make_allowed_ui_steps+0x3c6>
c0de5646:	eb09 0507 	add.w	r5, r9, r7
c0de564a:	f505 7608 	add.w	r6, r5, #544	@ 0x220
c0de564e:	4630      	mov	r0, r6
c0de5650:	f002 fabf 	bl	c0de7bd2 <cx_hash_get_size>
c0de5654:	4628      	mov	r0, r5
c0de5656:	2140      	movs	r1, #64	@ 0x40
c0de5658:	f002 ff28 	bl	c0de84ac <__aeabi_memclr>
c0de565c:	f04f 0c20 	mov.w	ip, #32
c0de5660:	4630      	mov	r0, r6
c0de5662:	2101      	movs	r1, #1
c0de5664:	2200      	movs	r2, #0
c0de5666:	2300      	movs	r3, #0
c0de5668:	9500      	str	r5, [sp, #0]
c0de566a:	f8cd c004 	str.w	ip, [sp, #4]
c0de566e:	f002 fab4 	bl	c0de7bda <cx_hash_no_throw>
c0de5672:	b9d0      	cbnz	r0, c0de56aa <make_allowed_ui_steps+0x3c6>
c0de5674:	eb09 0507 	add.w	r5, r9, r7
c0de5678:	f505 7008 	add.w	r0, r5, #544	@ 0x220
c0de567c:	f002 faa9 	bl	c0de7bd2 <cx_hash_get_size>
c0de5680:	f205 306d 	addw	r0, r5, #877	@ 0x36d
c0de5684:	4629      	mov	r1, r5
c0de5686:	2220      	movs	r2, #32
c0de5688:	f002 ff22 	bl	c0de84d0 <memcmp>
c0de568c:	b978      	cbnz	r0, c0de56ae <make_allowed_ui_steps+0x3ca>
c0de568e:	b124      	cbz	r4, c0de569a <make_allowed_ui_steps+0x3b6>
c0de5690:	eb09 0007 	add.w	r0, r9, r7
c0de5694:	2108      	movs	r1, #8
c0de5696:	f880 139a 	strb.w	r1, [r0, #922]	@ 0x39a
c0de569a:	eb09 0007 	add.w	r0, r9, r7
c0de569e:	2100      	movs	r1, #0
c0de56a0:	f8c0 109c 	str.w	r1, [r0, #156]	@ 0x9c
c0de56a4:	b003      	add	sp, #12
c0de56a6:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de56aa:	f002 faba 	bl	c0de7c22 <os_longjmp>
c0de56ae:	f249 1001 	movw	r0, #37121	@ 0x9101
c0de56b2:	f002 fab6 	bl	c0de7c22 <os_longjmp>
c0de56b6:	f44f 40da 	mov.w	r0, #27904	@ 0x6d00
c0de56ba:	f002 fab2 	bl	c0de7c22 <os_longjmp>
c0de56be:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de56c2:	f002 faae 	bl	c0de7c22 <os_longjmp>

c0de56c6 <show_sign_ui>:
c0de56c6:	f240 0008 	movw	r0, #8
c0de56ca:	f2c0 0000 	movt	r0, #0
c0de56ce:	4448      	add	r0, r9
c0de56d0:	f240 51e8 	movw	r1, #1512	@ 0x5e8
c0de56d4:	f890 0324 	ldrb.w	r0, [r0, #804]	@ 0x324
c0de56d8:	f2c0 0100 	movt	r1, #0
c0de56dc:	2200      	movs	r2, #0
c0de56de:	f849 2001 	str.w	r2, [r9, r1]
c0de56e2:	2203      	movs	r2, #3
c0de56e4:	2804      	cmp	r0, #4
c0de56e6:	bf08      	it	eq
c0de56e8:	2209      	moveq	r2, #9
c0de56ea:	f643 406e 	movw	r0, #15470	@ 0x3c6e
c0de56ee:	f2c0 0000 	movt	r0, #0
c0de56f2:	f644 61c8 	movw	r1, #20168	@ 0x4ec8
c0de56f6:	f2c0 0100 	movt	r1, #0
c0de56fa:	4478      	add	r0, pc
c0de56fc:	4479      	add	r1, pc
c0de56fe:	bf08      	it	eq
c0de5700:	4601      	moveq	r1, r0
c0de5702:	f240 50ec 	movw	r0, #1516	@ 0x5ec
c0de5706:	f2c0 0000 	movt	r0, #0
c0de570a:	f240 5cf0 	movw	ip, #1520	@ 0x5f0
c0de570e:	f849 2000 	str.w	r2, [r9, r0]
c0de5712:	f2c0 0c00 	movt	ip, #0
c0de5716:	2301      	movs	r3, #1
c0de5718:	2000      	movs	r0, #0
c0de571a:	2200      	movs	r2, #0
c0de571c:	f809 300c 	strb.w	r3, [r9, ip]
c0de5720:	f001 bccc 	b.w	c0de70bc <ux_flow_init>

c0de5724 <show_sign_protobuf_ui>:
c0de5724:	f240 0008 	movw	r0, #8
c0de5728:	f2c0 0000 	movt	r0, #0
c0de572c:	4448      	add	r0, r9
c0de572e:	f240 51e8 	movw	r1, #1512	@ 0x5e8
c0de5732:	f890 0324 	ldrb.w	r0, [r0, #804]	@ 0x324
c0de5736:	f2c0 0100 	movt	r1, #0
c0de573a:	2200      	movs	r2, #0
c0de573c:	f849 2001 	str.w	r2, [r9, r1]
c0de5740:	f240 51f0 	movw	r1, #1520	@ 0x5f0
c0de5744:	f2c0 0100 	movt	r1, #0
c0de5748:	2201      	movs	r2, #1
c0de574a:	280a      	cmp	r0, #10
c0de574c:	f809 2001 	strb.w	r2, [r9, r1]
c0de5750:	dd0e      	ble.n	c0de5770 <show_sign_protobuf_ui+0x4c>
c0de5752:	280e      	cmp	r0, #14
c0de5754:	dc1b      	bgt.n	c0de578e <show_sign_protobuf_ui+0x6a>
c0de5756:	280c      	cmp	r0, #12
c0de5758:	dc33      	bgt.n	c0de57c2 <show_sign_protobuf_ui+0x9e>
c0de575a:	280b      	cmp	r0, #11
c0de575c:	d050      	beq.n	c0de5800 <show_sign_protobuf_ui+0xdc>
c0de575e:	280c      	cmp	r0, #12
c0de5760:	f040 8093 	bne.w	c0de588a <show_sign_protobuf_ui+0x166>
c0de5764:	f643 510c 	movw	r1, #15628	@ 0x3d0c
c0de5768:	f2c0 0100 	movt	r1, #0
c0de576c:	4479      	add	r1, pc
c0de576e:	e070      	b.n	c0de5852 <show_sign_protobuf_ui+0x12e>
c0de5770:	2805      	cmp	r0, #5
c0de5772:	dd1a      	ble.n	c0de57aa <show_sign_protobuf_ui+0x86>
c0de5774:	2808      	cmp	r0, #8
c0de5776:	dc2e      	bgt.n	c0de57d6 <show_sign_protobuf_ui+0xb2>
c0de5778:	2806      	cmp	r0, #6
c0de577a:	d047      	beq.n	c0de580c <show_sign_protobuf_ui+0xe8>
c0de577c:	2808      	cmp	r0, #8
c0de577e:	f040 8084 	bne.w	c0de588a <show_sign_protobuf_ui+0x166>
c0de5782:	f244 2152 	movw	r1, #16978	@ 0x4252
c0de5786:	f2c0 0100 	movt	r1, #0
c0de578a:	4479      	add	r1, pc
c0de578c:	e043      	b.n	c0de5816 <show_sign_protobuf_ui+0xf2>
c0de578e:	2810      	cmp	r0, #16
c0de5790:	dc2b      	bgt.n	c0de57ea <show_sign_protobuf_ui+0xc6>
c0de5792:	280f      	cmp	r0, #15
c0de5794:	d042      	beq.n	c0de581c <show_sign_protobuf_ui+0xf8>
c0de5796:	2810      	cmp	r0, #16
c0de5798:	d177      	bne.n	c0de588a <show_sign_protobuf_ui+0x166>
c0de579a:	f644 31ea 	movw	r1, #19434	@ 0x4bea
c0de579e:	f2c0 0100 	movt	r1, #0
c0de57a2:	4479      	add	r1, pc
c0de57a4:	f04f 0c0b 	mov.w	ip, #11
c0de57a8:	e065      	b.n	c0de5876 <show_sign_protobuf_ui+0x152>
c0de57aa:	2803      	cmp	r0, #3
c0de57ac:	d03c      	beq.n	c0de5828 <show_sign_protobuf_ui+0x104>
c0de57ae:	2804      	cmp	r0, #4
c0de57b0:	d042      	beq.n	c0de5838 <show_sign_protobuf_ui+0x114>
c0de57b2:	2805      	cmp	r0, #5
c0de57b4:	d169      	bne.n	c0de588a <show_sign_protobuf_ui+0x166>
c0de57b6:	f643 71aa 	movw	r1, #16298	@ 0x3faa
c0de57ba:	f2c0 0100 	movt	r1, #0
c0de57be:	4479      	add	r1, pc
c0de57c0:	e029      	b.n	c0de5816 <show_sign_protobuf_ui+0xf2>
c0de57c2:	280d      	cmp	r0, #13
c0de57c4:	d040      	beq.n	c0de5848 <show_sign_protobuf_ui+0x124>
c0de57c6:	280e      	cmp	r0, #14
c0de57c8:	d15f      	bne.n	c0de588a <show_sign_protobuf_ui+0x166>
c0de57ca:	f644 01ce 	movw	r1, #18638	@ 0x48ce
c0de57ce:	f2c0 0100 	movt	r1, #0
c0de57d2:	4479      	add	r1, pc
c0de57d4:	e01f      	b.n	c0de5816 <show_sign_protobuf_ui+0xf2>
c0de57d6:	2809      	cmp	r0, #9
c0de57d8:	d03e      	beq.n	c0de5858 <show_sign_protobuf_ui+0x134>
c0de57da:	280a      	cmp	r0, #10
c0de57dc:	d155      	bne.n	c0de588a <show_sign_protobuf_ui+0x166>
c0de57de:	f244 4132 	movw	r1, #17458	@ 0x4432
c0de57e2:	f2c0 0100 	movt	r1, #0
c0de57e6:	4479      	add	r1, pc
c0de57e8:	e03b      	b.n	c0de5862 <show_sign_protobuf_ui+0x13e>
c0de57ea:	2811      	cmp	r0, #17
c0de57ec:	d03c      	beq.n	c0de5868 <show_sign_protobuf_ui+0x144>
c0de57ee:	28fc      	cmp	r0, #252	@ 0xfc
c0de57f0:	bf18      	it	ne
c0de57f2:	4770      	bxne	lr
c0de57f4:	f644 41f0 	movw	r1, #19696	@ 0x4cf0
c0de57f8:	f2c0 0100 	movt	r1, #0
c0de57fc:	4479      	add	r1, pc
c0de57fe:	e038      	b.n	c0de5872 <show_sign_protobuf_ui+0x14e>
c0de5800:	f244 5144 	movw	r1, #17732	@ 0x4544
c0de5804:	f2c0 0100 	movt	r1, #0
c0de5808:	4479      	add	r1, pc
c0de580a:	e004      	b.n	c0de5816 <show_sign_protobuf_ui+0xf2>
c0de580c:	f244 0190 	movw	r1, #16528	@ 0x4090
c0de5810:	f2c0 0100 	movt	r1, #0
c0de5814:	4479      	add	r1, pc
c0de5816:	f04f 0c07 	mov.w	ip, #7
c0de581a:	e02c      	b.n	c0de5876 <show_sign_protobuf_ui+0x152>
c0de581c:	f244 7148 	movw	r1, #18248	@ 0x4748
c0de5820:	f2c0 0100 	movt	r1, #0
c0de5824:	4479      	add	r1, pc
c0de5826:	e01c      	b.n	c0de5862 <show_sign_protobuf_ui+0x13e>
c0de5828:	f643 51d8 	movw	r1, #15832	@ 0x3dd8
c0de582c:	f2c0 0100 	movt	r1, #0
c0de5830:	4479      	add	r1, pc
c0de5832:	f04f 0c0a 	mov.w	ip, #10
c0de5836:	e01e      	b.n	c0de5876 <show_sign_protobuf_ui+0x152>
c0de5838:	f643 3128 	movw	r1, #15144	@ 0x3b28
c0de583c:	f2c0 0100 	movt	r1, #0
c0de5840:	4479      	add	r1, pc
c0de5842:	f04f 0c09 	mov.w	ip, #9
c0de5846:	e016      	b.n	c0de5876 <show_sign_protobuf_ui+0x152>
c0de5848:	f244 6104 	movw	r1, #17924	@ 0x4604
c0de584c:	f2c0 0100 	movt	r1, #0
c0de5850:	4479      	add	r1, pc
c0de5852:	f04f 0c05 	mov.w	ip, #5
c0de5856:	e00e      	b.n	c0de5876 <show_sign_protobuf_ui+0x152>
c0de5858:	f244 219c 	movw	r1, #17052	@ 0x429c
c0de585c:	f2c0 0100 	movt	r1, #0
c0de5860:	4479      	add	r1, pc
c0de5862:	f04f 0c06 	mov.w	ip, #6
c0de5866:	e006      	b.n	c0de5876 <show_sign_protobuf_ui+0x152>
c0de5868:	f644 1180 	movw	r1, #18816	@ 0x4980
c0de586c:	f2c0 0100 	movt	r1, #0
c0de5870:	4479      	add	r1, pc
c0de5872:	f04f 0c08 	mov.w	ip, #8
c0de5876:	f240 53ec 	movw	r3, #1516	@ 0x5ec
c0de587a:	f2c0 0300 	movt	r3, #0
c0de587e:	2000      	movs	r0, #0
c0de5880:	2200      	movs	r2, #0
c0de5882:	f849 c003 	str.w	ip, [r9, r3]
c0de5886:	f001 bc19 	b.w	c0de70bc <ux_flow_init>
c0de588a:	4770      	bx	lr

c0de588c <show_processing>:
c0de588c:	f644 5160 	movw	r1, #19808	@ 0x4d60
c0de5890:	f2c0 0100 	movt	r1, #0
c0de5894:	4479      	add	r1, pc
c0de5896:	2000      	movs	r0, #0
c0de5898:	2200      	movs	r2, #0
c0de589a:	f001 bc0f 	b.w	c0de70bc <ux_flow_init>

c0de589e <io_seproxyhal_touch_address_ok>:
c0de589e:	b580      	push	{r7, lr}
c0de58a0:	f7fb f99d 	bl	c0de0bde <set_result_get_address>
c0de58a4:	f240 6114 	movw	r1, #1556	@ 0x614
c0de58a8:	f2c0 0100 	movt	r1, #0
c0de58ac:	4449      	add	r1, r9
c0de58ae:	2390      	movs	r3, #144	@ 0x90
c0de58b0:	180a      	adds	r2, r1, r0
c0de58b2:	540b      	strb	r3, [r1, r0]
c0de58b4:	2100      	movs	r1, #0
c0de58b6:	3002      	adds	r0, #2
c0de58b8:	7051      	strb	r1, [r2, #1]
c0de58ba:	b281      	uxth	r1, r0
c0de58bc:	2020      	movs	r0, #32
c0de58be:	f000 f9bf 	bl	c0de5c40 <io_exchange>
c0de58c2:	f7fb fb80 	bl	c0de0fc6 <init_context>
c0de58c6:	f7ff faee 	bl	c0de4ea6 <ui_idle>
c0de58ca:	2000      	movs	r0, #0
c0de58cc:	bd80      	pop	{r7, pc}

c0de58ce <io_seproxyhal_cancel>:
c0de58ce:	b580      	push	{r7, lr}
c0de58d0:	f240 6014 	movw	r0, #1556	@ 0x614
c0de58d4:	f2c0 0000 	movt	r0, #0
c0de58d8:	2191      	movs	r1, #145	@ 0x91
c0de58da:	f809 1000 	strb.w	r1, [r9, r0]
c0de58de:	4448      	add	r0, r9
c0de58e0:	2100      	movs	r1, #0
c0de58e2:	7041      	strb	r1, [r0, #1]
c0de58e4:	2020      	movs	r0, #32
c0de58e6:	2102      	movs	r1, #2
c0de58e8:	f000 f9aa 	bl	c0de5c40 <io_exchange>
c0de58ec:	f7fb fb6b 	bl	c0de0fc6 <init_context>
c0de58f0:	f7ff fad9 	bl	c0de4ea6 <ui_idle>
c0de58f4:	2000      	movs	r0, #0
c0de58f6:	bd80      	pop	{r7, pc}

c0de58f8 <io_seproxyhal_touch_sign_approve>:
c0de58f8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de58fa:	b08d      	sub	sp, #52	@ 0x34
c0de58fc:	ac01      	add	r4, sp, #4
c0de58fe:	4620      	mov	r0, r4
c0de5900:	f002 fe26 	bl	c0de8550 <setjmp>
c0de5904:	4605      	mov	r5, r0
c0de5906:	0400      	lsls	r0, r0, #16
c0de5908:	f8ad 5030 	strh.w	r5, [sp, #48]	@ 0x30
c0de590c:	d00a      	beq.n	c0de5924 <io_seproxyhal_touch_sign_approve+0x2c>
c0de590e:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de5910:	2700      	movs	r7, #0
c0de5912:	462e      	mov	r6, r5
c0de5914:	f8ad 7030 	strh.w	r7, [sp, #48]	@ 0x30
c0de5918:	f002 fc5a 	bl	c0de81d0 <try_context_set>
c0de591c:	0a28      	lsrs	r0, r5, #8
c0de591e:	463d      	mov	r5, r7
c0de5920:	4607      	mov	r7, r0
c0de5922:	e008      	b.n	c0de5936 <io_seproxyhal_touch_sign_approve+0x3e>
c0de5924:	a801      	add	r0, sp, #4
c0de5926:	f002 fc53 	bl	c0de81d0 <try_context_set>
c0de592a:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de592c:	2790      	movs	r7, #144	@ 0x90
c0de592e:	2600      	movs	r6, #0
c0de5930:	f7fb f936 	bl	c0de0ba0 <set_result_sign>
c0de5934:	4605      	mov	r5, r0
c0de5936:	f002 fc41 	bl	c0de81bc <try_context_get>
c0de593a:	42a0      	cmp	r0, r4
c0de593c:	d102      	bne.n	c0de5944 <io_seproxyhal_touch_sign_approve+0x4c>
c0de593e:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de5940:	f002 fc46 	bl	c0de81d0 <try_context_set>
c0de5944:	f8bd 0030 	ldrh.w	r0, [sp, #48]	@ 0x30
c0de5948:	b9a0      	cbnz	r0, c0de5974 <io_seproxyhal_touch_sign_approve+0x7c>
c0de594a:	f240 6114 	movw	r1, #1556	@ 0x614
c0de594e:	f2c0 0100 	movt	r1, #0
c0de5952:	eb09 0001 	add.w	r0, r9, r1
c0de5956:	1941      	adds	r1, r0, r5
c0de5958:	5547      	strb	r7, [r0, r5]
c0de595a:	1ca8      	adds	r0, r5, #2
c0de595c:	704e      	strb	r6, [r1, #1]
c0de595e:	b281      	uxth	r1, r0
c0de5960:	2020      	movs	r0, #32
c0de5962:	f000 f96d 	bl	c0de5c40 <io_exchange>
c0de5966:	f7fb fb2e 	bl	c0de0fc6 <init_context>
c0de596a:	f7ff fa9c 	bl	c0de4ea6 <ui_idle>
c0de596e:	2000      	movs	r0, #0
c0de5970:	b00d      	add	sp, #52	@ 0x34
c0de5972:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de5974:	f002 f955 	bl	c0de7c22 <os_longjmp>

c0de5978 <os_io_handle_default_apdu>:
c0de5978:	b5b0      	push	{r4, r5, r7, lr}
c0de597a:	b09e      	sub	sp, #120	@ 0x78
c0de597c:	9d22      	ldr	r5, [sp, #136]	@ 0x88
c0de597e:	b1d0      	cbz	r0, c0de59b6 <os_io_handle_default_apdu+0x3e>
c0de5980:	b1c9      	cbz	r1, c0de59b6 <os_io_handle_default_apdu+0x3e>
c0de5982:	b1c2      	cbz	r2, c0de59b6 <os_io_handle_default_apdu+0x3e>
c0de5984:	b1bb      	cbz	r3, c0de59b6 <os_io_handle_default_apdu+0x3e>
c0de5986:	b10d      	cbz	r5, c0de598c <os_io_handle_default_apdu+0x14>
c0de5988:	2100      	movs	r1, #0
c0de598a:	7029      	strb	r1, [r5, #0]
c0de598c:	7801      	ldrb	r1, [r0, #0]
c0de598e:	29b0      	cmp	r1, #176	@ 0xb0
c0de5990:	d113      	bne.n	c0de59ba <os_io_handle_default_apdu+0x42>
c0de5992:	7841      	ldrb	r1, [r0, #1]
c0de5994:	29a7      	cmp	r1, #167	@ 0xa7
c0de5996:	d013      	beq.n	c0de59c0 <os_io_handle_default_apdu+0x48>
c0de5998:	2906      	cmp	r1, #6
c0de599a:	d018      	beq.n	c0de59ce <os_io_handle_default_apdu+0x56>
c0de599c:	2901      	cmp	r1, #1
c0de599e:	d113      	bne.n	c0de59c8 <os_io_handle_default_apdu+0x50>
c0de59a0:	7881      	ldrb	r1, [r0, #2]
c0de59a2:	b989      	cbnz	r1, c0de59c8 <os_io_handle_default_apdu+0x50>
c0de59a4:	78c0      	ldrb	r0, [r0, #3]
c0de59a6:	b978      	cbnz	r0, c0de59c8 <os_io_handle_default_apdu+0x50>
c0de59a8:	4610      	mov	r0, r2
c0de59aa:	4619      	mov	r1, r3
c0de59ac:	b01e      	add	sp, #120	@ 0x78
c0de59ae:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0de59b2:	f000 b82d 	b.w	c0de5a10 <get_version>
c0de59b6:	782c      	ldrb	r4, [r5, #0]
c0de59b8:	e01f      	b.n	c0de59fa <os_io_handle_default_apdu+0x82>
c0de59ba:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de59be:	e01c      	b.n	c0de59fa <os_io_handle_default_apdu+0x82>
c0de59c0:	7881      	ldrb	r1, [r0, #2]
c0de59c2:	b909      	cbnz	r1, c0de59c8 <os_io_handle_default_apdu+0x50>
c0de59c4:	78c0      	ldrb	r0, [r0, #3]
c0de59c6:	b1d8      	cbz	r0, c0de5a00 <os_io_handle_default_apdu+0x88>
c0de59c8:	f44f 44dc 	mov.w	r4, #28160	@ 0x6e00
c0de59cc:	e015      	b.n	c0de59fa <os_io_handle_default_apdu+0x82>
c0de59ce:	2400      	movs	r4, #0
c0de59d0:	601c      	str	r4, [r3, #0]
c0de59d2:	7883      	ldrb	r3, [r0, #2]
c0de59d4:	7902      	ldrb	r2, [r0, #4]
c0de59d6:	1d41      	adds	r1, r0, #5
c0de59d8:	ad03      	add	r5, sp, #12
c0de59da:	4618      	mov	r0, r3
c0de59dc:	2300      	movs	r3, #0
c0de59de:	9400      	str	r4, [sp, #0]
c0de59e0:	9501      	str	r5, [sp, #4]
c0de59e2:	f002 fb5c 	bl	c0de809e <os_pki_load_certificate>
c0de59e6:	4604      	mov	r4, r0
c0de59e8:	2800      	cmp	r0, #0
c0de59ea:	4628      	mov	r0, r5
c0de59ec:	f04f 016c 	mov.w	r1, #108	@ 0x6c
c0de59f0:	bf08      	it	eq
c0de59f2:	f44f 4410 	moveq.w	r4, #36864	@ 0x9000
c0de59f6:	f002 fd65 	bl	c0de84c4 <explicit_bzero>
c0de59fa:	4620      	mov	r0, r4
c0de59fc:	b01e      	add	sp, #120	@ 0x78
c0de59fe:	bdb0      	pop	{r4, r5, r7, pc}
c0de5a00:	2000      	movs	r0, #0
c0de5a02:	6018      	str	r0, [r3, #0]
c0de5a04:	b10d      	cbz	r5, c0de5a0a <os_io_handle_default_apdu+0x92>
c0de5a06:	2001      	movs	r0, #1
c0de5a08:	7028      	strb	r0, [r5, #0]
c0de5a0a:	f44f 4410 	mov.w	r4, #36864	@ 0x9000
c0de5a0e:	e7f4      	b.n	c0de59fa <os_io_handle_default_apdu+0x82>

c0de5a10 <get_version>:
c0de5a10:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de5a12:	b081      	sub	sp, #4
c0de5a14:	4604      	mov	r4, r0
c0de5a16:	6808      	ldr	r0, [r1, #0]
c0de5a18:	460d      	mov	r5, r1
c0de5a1a:	2100      	movs	r1, #0
c0de5a1c:	2803      	cmp	r0, #3
c0de5a1e:	6029      	str	r1, [r5, #0]
c0de5a20:	d329      	bcc.n	c0de5a76 <get_version+0x66>
c0de5a22:	2601      	movs	r6, #1
c0de5a24:	602e      	str	r6, [r5, #0]
c0de5a26:	7026      	strb	r6, [r4, #0]
c0de5a28:	682a      	ldr	r2, [r5, #0]
c0de5a2a:	1ec7      	subs	r7, r0, #3
c0de5a2c:	1911      	adds	r1, r2, r4
c0de5a2e:	3101      	adds	r1, #1
c0de5a30:	1aba      	subs	r2, r7, r2
c0de5a32:	2001      	movs	r0, #1
c0de5a34:	f002 fb7c 	bl	c0de8130 <os_registry_get_current_app_tag>
c0de5a38:	6829      	ldr	r1, [r5, #0]
c0de5a3a:	1c4a      	adds	r2, r1, #1
c0de5a3c:	602a      	str	r2, [r5, #0]
c0de5a3e:	5460      	strb	r0, [r4, r1]
c0de5a40:	6829      	ldr	r1, [r5, #0]
c0de5a42:	4408      	add	r0, r1
c0de5a44:	1901      	adds	r1, r0, r4
c0de5a46:	6028      	str	r0, [r5, #0]
c0de5a48:	3101      	adds	r1, #1
c0de5a4a:	1a3a      	subs	r2, r7, r0
c0de5a4c:	2002      	movs	r0, #2
c0de5a4e:	f002 fb6f 	bl	c0de8130 <os_registry_get_current_app_tag>
c0de5a52:	6829      	ldr	r1, [r5, #0]
c0de5a54:	1c4a      	adds	r2, r1, #1
c0de5a56:	602a      	str	r2, [r5, #0]
c0de5a58:	5460      	strb	r0, [r4, r1]
c0de5a5a:	6829      	ldr	r1, [r5, #0]
c0de5a5c:	4408      	add	r0, r1
c0de5a5e:	1c41      	adds	r1, r0, #1
c0de5a60:	6029      	str	r1, [r5, #0]
c0de5a62:	5426      	strb	r6, [r4, r0]
c0de5a64:	f002 fb4e 	bl	c0de8104 <os_flags>
c0de5a68:	6829      	ldr	r1, [r5, #0]
c0de5a6a:	1c4a      	adds	r2, r1, #1
c0de5a6c:	602a      	str	r2, [r5, #0]
c0de5a6e:	5460      	strb	r0, [r4, r1]
c0de5a70:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de5a74:	e001      	b.n	c0de5a7a <get_version+0x6a>
c0de5a76:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de5a7a:	b001      	add	sp, #4
c0de5a7c:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de5a7e <os_io_seph_cmd_general_status>:
c0de5a7e:	f644 4197 	movw	r1, #19607	@ 0x4c97
c0de5a82:	f2c0 0100 	movt	r1, #0
c0de5a86:	4479      	add	r1, pc
c0de5a88:	2001      	movs	r0, #1
c0de5a8a:	2205      	movs	r2, #5
c0de5a8c:	2300      	movs	r3, #0
c0de5a8e:	f002 bb7d 	b.w	c0de818c <os_io_tx_cmd>

c0de5a92 <io_seph_ux_init_button>:
c0de5a92:	f640 0038 	movw	r0, #2104	@ 0x838
c0de5a96:	f2c0 0000 	movt	r0, #0
c0de5a9a:	2100      	movs	r1, #0
c0de5a9c:	f849 1000 	str.w	r1, [r9, r0]
c0de5aa0:	4448      	add	r0, r9
c0de5aa2:	6041      	str	r1, [r0, #4]
c0de5aa4:	4770      	bx	lr

c0de5aa6 <io_process_itc_ux_event>:
c0de5aa6:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de5aa8:	b081      	sub	sp, #4
c0de5aaa:	4604      	mov	r4, r0
c0de5aac:	78c0      	ldrb	r0, [r0, #3]
c0de5aae:	2820      	cmp	r0, #32
c0de5ab0:	d032      	beq.n	c0de5b18 <io_process_itc_ux_event+0x72>
c0de5ab2:	2823      	cmp	r0, #35	@ 0x23
c0de5ab4:	d033      	beq.n	c0de5b1e <io_process_itc_ux_event+0x78>
c0de5ab6:	460d      	mov	r5, r1
c0de5ab8:	2822      	cmp	r0, #34	@ 0x22
c0de5aba:	d141      	bne.n	c0de5b40 <io_process_itc_ux_event+0x9a>
c0de5abc:	f240 56f4 	movw	r6, #1524	@ 0x5f4
c0de5ac0:	f2c0 0600 	movt	r6, #0
c0de5ac4:	2006      	movs	r0, #6
c0de5ac6:	f809 0006 	strb.w	r0, [r9, r6]
c0de5aca:	eb09 0706 	add.w	r7, r9, r6
c0de5ace:	2018      	movs	r0, #24
c0de5ad0:	6078      	str	r0, [r7, #4]
c0de5ad2:	f107 0008 	add.w	r0, r7, #8
c0de5ad6:	2118      	movs	r1, #24
c0de5ad8:	f002 fce8 	bl	c0de84ac <__aeabi_memclr>
c0de5adc:	7920      	ldrb	r0, [r4, #4]
c0de5ade:	f64f 72f0 	movw	r2, #65520	@ 0xfff0
c0de5ae2:	7238      	strb	r0, [r7, #8]
c0de5ae4:	7860      	ldrb	r0, [r4, #1]
c0de5ae6:	78a1      	ldrb	r1, [r4, #2]
c0de5ae8:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de5aec:	f1a1 0013 	sub.w	r0, r1, #19
c0de5af0:	b280      	uxth	r0, r0
c0de5af2:	4290      	cmp	r0, r2
c0de5af4:	f06f 0015 	mvn.w	r0, #21
c0de5af8:	d323      	bcc.n	c0de5b42 <io_process_itc_ux_event+0x9c>
c0de5afa:	3902      	subs	r1, #2
c0de5afc:	b28a      	uxth	r2, r1
c0de5afe:	1f69      	subs	r1, r5, #5
c0de5b00:	4291      	cmp	r1, r2
c0de5b02:	d31e      	bcc.n	c0de5b42 <io_process_itc_ux_event+0x9c>
c0de5b04:	eb09 0506 	add.w	r5, r9, r6
c0de5b08:	1d61      	adds	r1, r4, #5
c0de5b0a:	f105 0010 	add.w	r0, r5, #16
c0de5b0e:	60ea      	str	r2, [r5, #12]
c0de5b10:	f002 fccf 	bl	c0de84b2 <__aeabi_memcpy>
c0de5b14:	4628      	mov	r0, r5
c0de5b16:	e00f      	b.n	c0de5b38 <io_process_itc_ux_event+0x92>
c0de5b18:	f001 ff86 	bl	c0de7a28 <ux_stack_redisplay>
c0de5b1c:	e00e      	b.n	c0de5b3c <io_process_itc_ux_event+0x96>
c0de5b1e:	f240 51f4 	movw	r1, #1524	@ 0x5f4
c0de5b22:	f2c0 0100 	movt	r1, #0
c0de5b26:	eb09 0001 	add.w	r0, r9, r1
c0de5b2a:	2201      	movs	r2, #1
c0de5b2c:	6042      	str	r2, [r0, #4]
c0de5b2e:	7923      	ldrb	r3, [r4, #4]
c0de5b30:	2207      	movs	r2, #7
c0de5b32:	f809 2001 	strb.w	r2, [r9, r1]
c0de5b36:	7203      	strb	r3, [r0, #8]
c0de5b38:	f002 fad7 	bl	c0de80ea <os_ux>
c0de5b3c:	2000      	movs	r0, #0
c0de5b3e:	e000      	b.n	c0de5b42 <io_process_itc_ux_event+0x9c>
c0de5b40:	4628      	mov	r0, r5
c0de5b42:	b001      	add	sp, #4
c0de5b44:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de5b46 <io_seph_ux_display_bagl_element>:
c0de5b46:	b570      	push	{r4, r5, r6, lr}
c0de5b48:	b088      	sub	sp, #32
c0de5b4a:	f002 fa41 	bl	c0de7fd0 <pic>
c0de5b4e:	4604      	mov	r4, r0
c0de5b50:	7801      	ldrb	r1, [r0, #0]
c0de5b52:	69c0      	ldr	r0, [r0, #28]
c0de5b54:	f001 067f 	and.w	r6, r1, #127	@ 0x7f
c0de5b58:	f002 fa3a 	bl	c0de7fd0 <pic>
c0de5b5c:	b37e      	cbz	r6, c0de5bbe <io_seph_ux_display_bagl_element+0x78>
c0de5b5e:	4605      	mov	r5, r0
c0de5b60:	b150      	cbz	r0, c0de5b78 <io_seph_ux_display_bagl_element+0x32>
c0de5b62:	2e05      	cmp	r6, #5
c0de5b64:	d101      	bne.n	c0de5b6a <io_seph_ux_display_bagl_element+0x24>
c0de5b66:	7ea0      	ldrb	r0, [r4, #26]
c0de5b68:	b178      	cbz	r0, c0de5b8a <io_seph_ux_display_bagl_element+0x44>
c0de5b6a:	4628      	mov	r0, r5
c0de5b6c:	f002 fcfe 	bl	c0de856c <strlen>
c0de5b70:	b282      	uxth	r2, r0
c0de5b72:	4620      	mov	r0, r4
c0de5b74:	4629      	mov	r1, r5
c0de5b76:	e002      	b.n	c0de5b7e <io_seph_ux_display_bagl_element+0x38>
c0de5b78:	4620      	mov	r0, r4
c0de5b7a:	2100      	movs	r1, #0
c0de5b7c:	2200      	movs	r2, #0
c0de5b7e:	2300      	movs	r3, #0
c0de5b80:	b008      	add	sp, #32
c0de5b82:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de5b86:	f000 ba49 	b.w	c0de601c <bagl_draw_with_context>
c0de5b8a:	4628      	mov	r0, r5
c0de5b8c:	f002 fa20 	bl	c0de7fd0 <pic>
c0de5b90:	b1a8      	cbz	r0, c0de5bbe <io_seph_ux_display_bagl_element+0x78>
c0de5b92:	4605      	mov	r5, r0
c0de5b94:	6900      	ldr	r0, [r0, #16]
c0de5b96:	b190      	cbz	r0, c0de5bbe <io_seph_ux_display_bagl_element+0x78>
c0de5b98:	4620      	mov	r0, r4
c0de5b9a:	f002 fa19 	bl	c0de7fd0 <pic>
c0de5b9e:	ac01      	add	r4, sp, #4
c0de5ba0:	4601      	mov	r1, r0
c0de5ba2:	4620      	mov	r0, r4
c0de5ba4:	221c      	movs	r2, #28
c0de5ba6:	f002 fc84 	bl	c0de84b2 <__aeabi_memcpy>
c0de5baa:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de5bae:	f8ad 000a 	strh.w	r0, [sp, #10]
c0de5bb2:	f8ad 100c 	strh.w	r1, [sp, #12]
c0de5bb6:	4620      	mov	r0, r4
c0de5bb8:	4629      	mov	r1, r5
c0de5bba:	f001 f875 	bl	c0de6ca8 <bagl_draw_glyph>
c0de5bbe:	b008      	add	sp, #32
c0de5bc0:	bd70      	pop	{r4, r5, r6, pc}

c0de5bc2 <io_seproxyhal_button_push>:
c0de5bc2:	b1c0      	cbz	r0, c0de5bf6 <io_seproxyhal_button_push+0x34>
c0de5bc4:	b510      	push	{r4, lr}
c0de5bc6:	f640 0e38 	movw	lr, #2104	@ 0x838
c0de5bca:	f2c0 0e00 	movt	lr, #0
c0de5bce:	4684      	mov	ip, r0
c0de5bd0:	f859 000e 	ldr.w	r0, [r9, lr]
c0de5bd4:	460b      	mov	r3, r1
c0de5bd6:	eb09 010e 	add.w	r1, r9, lr
c0de5bda:	6849      	ldr	r1, [r1, #4]
c0de5bdc:	4298      	cmp	r0, r3
c0de5bde:	bf02      	ittt	eq
c0de5be0:	3101      	addeq	r1, #1
c0de5be2:	eb09 020e 	addeq.w	r2, r9, lr
c0de5be6:	6051      	streq	r1, [r2, #4]
c0de5be8:	ea40 0003 	orr.w	r0, r0, r3
c0de5bec:	b123      	cbz	r3, c0de5bf8 <io_seproxyhal_button_push+0x36>
c0de5bee:	4602      	mov	r2, r0
c0de5bf0:	f849 000e 	str.w	r0, [r9, lr]
c0de5bf4:	e008      	b.n	c0de5c08 <io_seproxyhal_button_push+0x46>
c0de5bf6:	4770      	bx	lr
c0de5bf8:	2200      	movs	r2, #0
c0de5bfa:	eb09 040e 	add.w	r4, r9, lr
c0de5bfe:	f849 200e 	str.w	r2, [r9, lr]
c0de5c02:	6062      	str	r2, [r4, #4]
c0de5c04:	f040 4000 	orr.w	r0, r0, #2147483648	@ 0x80000000
c0de5c08:	429a      	cmp	r2, r3
c0de5c0a:	bf1e      	ittt	ne
c0de5c0c:	eb09 020e 	addne.w	r2, r9, lr
c0de5c10:	2300      	movne	r3, #0
c0de5c12:	6053      	strne	r3, [r2, #4]
c0de5c14:	2908      	cmp	r1, #8
c0de5c16:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de5c1a:	d30b      	bcc.n	c0de5c34 <io_seproxyhal_button_push+0x72>
c0de5c1c:	f64a 22ab 	movw	r2, #43691	@ 0xaaab
c0de5c20:	f6ca 22aa 	movt	r2, #43690	@ 0xaaaa
c0de5c24:	434a      	muls	r2, r1
c0de5c26:	f112 3faa 	cmn.w	r2, #2863311530	@ 0xaaaaaaaa
c0de5c2a:	bf38      	it	cc
c0de5c2c:	f040 4080 	orrcc.w	r0, r0, #1073741824	@ 0x40000000
c0de5c30:	f020 4000 	bic.w	r0, r0, #2147483648	@ 0x80000000
c0de5c34:	4760      	bx	ip

c0de5c36 <io_seproxyhal_general_status>:
c0de5c36:	f7ff bf22 	b.w	c0de5a7e <os_io_seph_cmd_general_status>

c0de5c3a <io_seph_is_status_sent>:
c0de5c3a:	2001      	movs	r0, #1
c0de5c3c:	4770      	bx	lr
c0de5c3e:	d4d4      	bmi.n	c0de5bea <io_seproxyhal_button_push+0x28>

c0de5c40 <io_exchange>:
c0de5c40:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de5c44:	f640 0640 	movw	r6, #2112	@ 0x840
c0de5c48:	f2c0 0600 	movt	r6, #0
c0de5c4c:	f819 2006 	ldrb.w	r2, [r9, r6]
c0de5c50:	460d      	mov	r5, r1
c0de5c52:	2a01      	cmp	r2, #1
c0de5c54:	4604      	mov	r4, r0
c0de5c56:	d104      	bne.n	c0de5c62 <io_exchange+0x22>
c0de5c58:	f002 fa8c 	bl	c0de8174 <os_io_start>
c0de5c5c:	2000      	movs	r0, #0
c0de5c5e:	f809 0006 	strb.w	r0, [r9, r6]
c0de5c62:	0760      	lsls	r0, r4, #29
c0de5c64:	d001      	beq.n	c0de5c6a <io_exchange+0x2a>
c0de5c66:	2500      	movs	r5, #0
c0de5c68:	e03d      	b.n	c0de5ce6 <io_exchange+0xa6>
c0de5c6a:	f640 0644 	movw	r6, #2116	@ 0x844
c0de5c6e:	f004 0710 	and.w	r7, r4, #16
c0de5c72:	f2c0 0600 	movt	r6, #0
c0de5c76:	b1ed      	cbz	r5, c0de5cb4 <io_exchange+0x74>
c0de5c78:	b9e7      	cbnz	r7, c0de5cb4 <io_exchange+0x74>
c0de5c7a:	f640 0850 	movw	r8, #2128	@ 0x850
c0de5c7e:	f2c0 0800 	movt	r8, #0
c0de5c82:	f240 6114 	movw	r1, #1556	@ 0x614
c0de5c86:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de5c8a:	f2c0 0100 	movt	r1, #0
c0de5c8e:	4449      	add	r1, r9
c0de5c90:	462a      	mov	r2, r5
c0de5c92:	2300      	movs	r3, #0
c0de5c94:	2500      	movs	r5, #0
c0de5c96:	f002 fa79 	bl	c0de818c <os_io_tx_cmd>
c0de5c9a:	f640 0051 	movw	r0, #2129	@ 0x851
c0de5c9e:	f2c0 0000 	movt	r0, #0
c0de5ca2:	f809 5000 	strb.w	r5, [r9, r0]
c0de5ca6:	eb09 0006 	add.w	r0, r9, r6
c0de5caa:	7185      	strb	r5, [r0, #6]
c0de5cac:	06a0      	lsls	r0, r4, #26
c0de5cae:	f809 5008 	strb.w	r5, [r9, r8]
c0de5cb2:	d418      	bmi.n	c0de5ce6 <io_exchange+0xa6>
c0de5cb4:	b94f      	cbnz	r7, c0de5cca <io_exchange+0x8a>
c0de5cb6:	eb09 0006 	add.w	r0, r9, r6
c0de5cba:	2100      	movs	r1, #0
c0de5cbc:	7181      	strb	r1, [r0, #6]
c0de5cbe:	f640 0050 	movw	r0, #2128	@ 0x850
c0de5cc2:	f2c0 0000 	movt	r0, #0
c0de5cc6:	f809 1000 	strb.w	r1, [r9, r0]
c0de5cca:	eb09 0006 	add.w	r0, r9, r6
c0de5cce:	2100      	movs	r1, #0
c0de5cd0:	8041      	strh	r1, [r0, #2]
c0de5cd2:	bf00      	nop
c0de5cd4:	2001      	movs	r0, #1
c0de5cd6:	f000 f809 	bl	c0de5cec <io_legacy_apdu_rx>
c0de5cda:	2801      	cmp	r0, #1
c0de5cdc:	dbfa      	blt.n	c0de5cd4 <io_exchange+0x94>
c0de5cde:	4605      	mov	r5, r0
c0de5ce0:	eb09 0006 	add.w	r0, r9, r6
c0de5ce4:	8045      	strh	r5, [r0, #2]
c0de5ce6:	b2a8      	uxth	r0, r5
c0de5ce8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de5cec <io_legacy_apdu_rx>:
c0de5cec:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de5cf0:	b084      	sub	sp, #16
c0de5cf2:	f240 7625 	movw	r6, #1829	@ 0x725
c0de5cf6:	4605      	mov	r5, r0
c0de5cf8:	2000      	movs	r0, #0
c0de5cfa:	f2c0 0600 	movt	r6, #0
c0de5cfe:	f88d 000f 	strb.w	r0, [sp, #15]
c0de5d02:	eb09 0006 	add.w	r0, r9, r6
c0de5d06:	f240 1111 	movw	r1, #273	@ 0x111
c0de5d0a:	2200      	movs	r2, #0
c0de5d0c:	2301      	movs	r3, #1
c0de5d0e:	f002 fa49 	bl	c0de81a4 <os_io_rx_evt>
c0de5d12:	4604      	mov	r4, r0
c0de5d14:	2801      	cmp	r0, #1
c0de5d16:	f2c0 8149 	blt.w	c0de5fac <io_legacy_apdu_rx+0x2c0>
c0de5d1a:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de5d1e:	282f      	cmp	r0, #47	@ 0x2f
c0de5d20:	dc75      	bgt.n	c0de5e0e <io_legacy_apdu_rx+0x122>
c0de5d22:	f1a0 0110 	sub.w	r1, r0, #16
c0de5d26:	2916      	cmp	r1, #22
c0de5d28:	d879      	bhi.n	c0de5e1e <io_legacy_apdu_rx+0x132>
c0de5d2a:	2201      	movs	r2, #1
c0de5d2c:	fa02 f101 	lsl.w	r1, r2, r1
c0de5d30:	2201      	movs	r2, #1
c0de5d32:	f2c0 027f 	movt	r2, #127	@ 0x7f
c0de5d36:	4211      	tst	r1, r2
c0de5d38:	d071      	beq.n	c0de5e1e <io_legacy_apdu_rx+0x132>
c0de5d3a:	f640 0550 	movw	r5, #2128	@ 0x850
c0de5d3e:	f2c0 0500 	movt	r5, #0
c0de5d42:	f809 0005 	strb.w	r0, [r9, r5]
c0de5d46:	f002 f9ba 	bl	c0de80be <os_perso_is_pin_set>
c0de5d4a:	28aa      	cmp	r0, #170	@ 0xaa
c0de5d4c:	d103      	bne.n	c0de5d56 <io_legacy_apdu_rx+0x6a>
c0de5d4e:	f002 f9c1 	bl	c0de80d4 <os_global_pin_is_validated>
c0de5d52:	28aa      	cmp	r0, #170	@ 0xaa
c0de5d54:	d17e      	bne.n	c0de5e54 <io_legacy_apdu_rx+0x168>
c0de5d56:	eb09 0006 	add.w	r0, r9, r6
c0de5d5a:	7840      	ldrb	r0, [r0, #1]
c0de5d5c:	28b0      	cmp	r0, #176	@ 0xb0
c0de5d5e:	d130      	bne.n	c0de5dc2 <io_legacy_apdu_rx+0xd6>
c0de5d60:	f240 1011 	movw	r0, #273	@ 0x111
c0de5d64:	9002      	str	r0, [sp, #8]
c0de5d66:	f240 6014 	movw	r0, #1556	@ 0x614
c0de5d6a:	f2c0 0000 	movt	r0, #0
c0de5d6e:	1e61      	subs	r1, r4, #1
c0de5d70:	eb09 0400 	add.w	r4, r9, r0
c0de5d74:	eb09 0006 	add.w	r0, r9, r6
c0de5d78:	f10d 070f 	add.w	r7, sp, #15
c0de5d7c:	3001      	adds	r0, #1
c0de5d7e:	ab02      	add	r3, sp, #8
c0de5d80:	4622      	mov	r2, r4
c0de5d82:	9700      	str	r7, [sp, #0]
c0de5d84:	f7ff fdf8 	bl	c0de5978 <os_io_handle_default_apdu>
c0de5d88:	9902      	ldr	r1, [sp, #8]
c0de5d8a:	2600      	movs	r6, #0
c0de5d8c:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de5d90:	bf18      	it	ne
c0de5d92:	4631      	movne	r1, r6
c0de5d94:	0a02      	lsrs	r2, r0, #8
c0de5d96:	1863      	adds	r3, r4, r1
c0de5d98:	5462      	strb	r2, [r4, r1]
c0de5d9a:	3102      	adds	r1, #2
c0de5d9c:	7058      	strb	r0, [r3, #1]
c0de5d9e:	f819 0005 	ldrb.w	r0, [r9, r5]
c0de5da2:	9102      	str	r1, [sp, #8]
c0de5da4:	b28a      	uxth	r2, r1
c0de5da6:	4621      	mov	r1, r4
c0de5da8:	2300      	movs	r3, #0
c0de5daa:	f002 f9ef 	bl	c0de818c <os_io_tx_cmd>
c0de5dae:	f89d 100f 	ldrb.w	r1, [sp, #15]
c0de5db2:	f809 6005 	strb.w	r6, [r9, r5]
c0de5db6:	2901      	cmp	r1, #1
c0de5db8:	f000 8107 	beq.w	c0de5fca <io_legacy_apdu_rx+0x2de>
c0de5dbc:	ea00 74e0 	and.w	r4, r0, r0, asr #31
c0de5dc0:	e0f4      	b.n	c0de5fac <io_legacy_apdu_rx+0x2c0>
c0de5dc2:	f819 7005 	ldrb.w	r7, [r9, r5]
c0de5dc6:	2f21      	cmp	r7, #33	@ 0x21
c0de5dc8:	dd58      	ble.n	c0de5e7c <io_legacy_apdu_rx+0x190>
c0de5dca:	2f2f      	cmp	r7, #47	@ 0x2f
c0de5dcc:	dc5e      	bgt.n	c0de5e8c <io_legacy_apdu_rx+0x1a0>
c0de5dce:	2f22      	cmp	r7, #34	@ 0x22
c0de5dd0:	f000 8084 	beq.w	c0de5edc <io_legacy_apdu_rx+0x1f0>
c0de5dd4:	2f23      	cmp	r7, #35	@ 0x23
c0de5dd6:	f040 8099 	bne.w	c0de5f0c <io_legacy_apdu_rx+0x220>
c0de5dda:	f640 0544 	movw	r5, #2116	@ 0x844
c0de5dde:	f2c0 0500 	movt	r5, #0
c0de5de2:	eb09 0005 	add.w	r0, r9, r5
c0de5de6:	2107      	movs	r1, #7
c0de5de8:	7181      	strb	r1, [r0, #6]
c0de5dea:	f240 6014 	movw	r0, #1556	@ 0x614
c0de5dee:	3c01      	subs	r4, #1
c0de5df0:	f2c0 0000 	movt	r0, #0
c0de5df4:	eb09 0106 	add.w	r1, r9, r6
c0de5df8:	4448      	add	r0, r9
c0de5dfa:	3101      	adds	r1, #1
c0de5dfc:	4622      	mov	r2, r4
c0de5dfe:	f002 fb58 	bl	c0de84b2 <__aeabi_memcpy>
c0de5e02:	f640 0051 	movw	r0, #2129	@ 0x851
c0de5e06:	f2c0 0000 	movt	r0, #0
c0de5e0a:	2101      	movs	r1, #1
c0de5e0c:	e05b      	b.n	c0de5ec6 <io_legacy_apdu_rx+0x1da>
c0de5e0e:	2830      	cmp	r0, #48	@ 0x30
c0de5e10:	d093      	beq.n	c0de5d3a <io_legacy_apdu_rx+0x4e>
c0de5e12:	2840      	cmp	r0, #64	@ 0x40
c0de5e14:	d091      	beq.n	c0de5d3a <io_legacy_apdu_rx+0x4e>
c0de5e16:	2842      	cmp	r0, #66	@ 0x42
c0de5e18:	bf18      	it	ne
c0de5e1a:	2400      	movne	r4, #0
c0de5e1c:	e0c6      	b.n	c0de5fac <io_legacy_apdu_rx+0x2c0>
c0de5e1e:	3801      	subs	r0, #1
c0de5e20:	2802      	cmp	r0, #2
c0de5e22:	f080 80c2 	bcs.w	c0de5faa <io_legacy_apdu_rx+0x2be>
c0de5e26:	f240 37c8 	movw	r7, #968	@ 0x3c8
c0de5e2a:	3c01      	subs	r4, #1
c0de5e2c:	f2c0 0700 	movt	r7, #0
c0de5e30:	444e      	add	r6, r9
c0de5e32:	eb09 0007 	add.w	r0, r9, r7
c0de5e36:	1c71      	adds	r1, r6, #1
c0de5e38:	4622      	mov	r2, r4
c0de5e3a:	f002 fb3a 	bl	c0de84b2 <__aeabi_memcpy>
c0de5e3e:	7870      	ldrb	r0, [r6, #1]
c0de5e40:	281a      	cmp	r0, #26
c0de5e42:	d144      	bne.n	c0de5ece <io_legacy_apdu_rx+0x1e2>
c0de5e44:	eb09 0007 	add.w	r0, r9, r7
c0de5e48:	4621      	mov	r1, r4
c0de5e4a:	b004      	add	sp, #16
c0de5e4c:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de5e50:	f7ff be29 	b.w	c0de5aa6 <io_process_itc_ux_event>
c0de5e54:	f240 6014 	movw	r0, #1556	@ 0x614
c0de5e58:	f2c0 0000 	movt	r0, #0
c0de5e5c:	2155      	movs	r1, #85	@ 0x55
c0de5e5e:	f809 1000 	strb.w	r1, [r9, r0]
c0de5e62:	eb09 0100 	add.w	r1, r9, r0
c0de5e66:	f819 0005 	ldrb.w	r0, [r9, r5]
c0de5e6a:	2715      	movs	r7, #21
c0de5e6c:	2202      	movs	r2, #2
c0de5e6e:	2300      	movs	r3, #0
c0de5e70:	704f      	strb	r7, [r1, #1]
c0de5e72:	b004      	add	sp, #16
c0de5e74:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de5e78:	f002 b988 	b.w	c0de818c <os_io_tx_cmd>
c0de5e7c:	2f10      	cmp	r7, #16
c0de5e7e:	d02f      	beq.n	c0de5ee0 <io_legacy_apdu_rx+0x1f4>
c0de5e80:	2f20      	cmp	r7, #32
c0de5e82:	d067      	beq.n	c0de5f54 <io_legacy_apdu_rx+0x268>
c0de5e84:	2f21      	cmp	r7, #33	@ 0x21
c0de5e86:	d141      	bne.n	c0de5f0c <io_legacy_apdu_rx+0x220>
c0de5e88:	2005      	movs	r0, #5
c0de5e8a:	e02c      	b.n	c0de5ee6 <io_legacy_apdu_rx+0x1fa>
c0de5e8c:	2f30      	cmp	r7, #48	@ 0x30
c0de5e8e:	d029      	beq.n	c0de5ee4 <io_legacy_apdu_rx+0x1f8>
c0de5e90:	2f40      	cmp	r7, #64	@ 0x40
c0de5e92:	d13b      	bne.n	c0de5f0c <io_legacy_apdu_rx+0x220>
c0de5e94:	f640 0544 	movw	r5, #2116	@ 0x844
c0de5e98:	f2c0 0500 	movt	r5, #0
c0de5e9c:	eb09 0005 	add.w	r0, r9, r5
c0de5ea0:	2103      	movs	r1, #3
c0de5ea2:	7181      	strb	r1, [r0, #6]
c0de5ea4:	f240 6014 	movw	r0, #1556	@ 0x614
c0de5ea8:	3c01      	subs	r4, #1
c0de5eaa:	f2c0 0000 	movt	r0, #0
c0de5eae:	eb09 0106 	add.w	r1, r9, r6
c0de5eb2:	4448      	add	r0, r9
c0de5eb4:	3101      	adds	r1, #1
c0de5eb6:	4622      	mov	r2, r4
c0de5eb8:	f002 fafb 	bl	c0de84b2 <__aeabi_memcpy>
c0de5ebc:	f640 0051 	movw	r0, #2129	@ 0x851
c0de5ec0:	f2c0 0000 	movt	r0, #0
c0de5ec4:	2102      	movs	r1, #2
c0de5ec6:	f809 1000 	strb.w	r1, [r9, r0]
c0de5eca:	200a      	movs	r0, #10
c0de5ecc:	e05d      	b.n	c0de5f8a <io_legacy_apdu_rx+0x29e>
c0de5ece:	2d00      	cmp	r5, #0
c0de5ed0:	d05e      	beq.n	c0de5f90 <io_legacy_apdu_rx+0x2a4>
c0de5ed2:	2000      	movs	r0, #0
c0de5ed4:	2400      	movs	r4, #0
c0de5ed6:	f7fb f881 	bl	c0de0fdc <io_event>
c0de5eda:	e067      	b.n	c0de5fac <io_legacy_apdu_rx+0x2c0>
c0de5edc:	2004      	movs	r0, #4
c0de5ede:	e002      	b.n	c0de5ee6 <io_legacy_apdu_rx+0x1fa>
c0de5ee0:	2006      	movs	r0, #6
c0de5ee2:	e000      	b.n	c0de5ee6 <io_legacy_apdu_rx+0x1fa>
c0de5ee4:	2002      	movs	r0, #2
c0de5ee6:	f640 0144 	movw	r1, #2116	@ 0x844
c0de5eea:	f2c0 0100 	movt	r1, #0
c0de5eee:	4449      	add	r1, r9
c0de5ef0:	7188      	strb	r0, [r1, #6]
c0de5ef2:	f240 6014 	movw	r0, #1556	@ 0x614
c0de5ef6:	3c01      	subs	r4, #1
c0de5ef8:	f2c0 0000 	movt	r0, #0
c0de5efc:	eb09 0106 	add.w	r1, r9, r6
c0de5f00:	4448      	add	r0, r9
c0de5f02:	3101      	adds	r1, #1
c0de5f04:	4622      	mov	r2, r4
c0de5f06:	f002 fad4 	bl	c0de84b2 <__aeabi_memcpy>
c0de5f0a:	e04f      	b.n	c0de5fac <io_legacy_apdu_rx+0x2c0>
c0de5f0c:	f640 0844 	movw	r8, #2116	@ 0x844
c0de5f10:	f2c0 0800 	movt	r8, #0
c0de5f14:	eb09 0008 	add.w	r0, r9, r8
c0de5f18:	2100      	movs	r1, #0
c0de5f1a:	7181      	strb	r1, [r0, #6]
c0de5f1c:	f240 6014 	movw	r0, #1556	@ 0x614
c0de5f20:	1e65      	subs	r5, r4, #1
c0de5f22:	f2c0 0000 	movt	r0, #0
c0de5f26:	eb09 0106 	add.w	r1, r9, r6
c0de5f2a:	4448      	add	r0, r9
c0de5f2c:	3101      	adds	r1, #1
c0de5f2e:	462a      	mov	r2, r5
c0de5f30:	f002 fabf 	bl	c0de84b2 <__aeabi_memcpy>
c0de5f34:	2f25      	cmp	r7, #37	@ 0x25
c0de5f36:	d03d      	beq.n	c0de5fb4 <io_legacy_apdu_rx+0x2c8>
c0de5f38:	2f24      	cmp	r7, #36	@ 0x24
c0de5f3a:	d109      	bne.n	c0de5f50 <io_legacy_apdu_rx+0x264>
c0de5f3c:	f640 0051 	movw	r0, #2129	@ 0x851
c0de5f40:	f2c0 0000 	movt	r0, #0
c0de5f44:	2101      	movs	r1, #1
c0de5f46:	f809 1000 	strb.w	r1, [r9, r0]
c0de5f4a:	200b      	movs	r0, #11
c0de5f4c:	f809 0008 	strb.w	r0, [r9, r8]
c0de5f50:	462c      	mov	r4, r5
c0de5f52:	e02b      	b.n	c0de5fac <io_legacy_apdu_rx+0x2c0>
c0de5f54:	f640 0544 	movw	r5, #2116	@ 0x844
c0de5f58:	f2c0 0500 	movt	r5, #0
c0de5f5c:	eb09 0005 	add.w	r0, r9, r5
c0de5f60:	2701      	movs	r7, #1
c0de5f62:	7187      	strb	r7, [r0, #6]
c0de5f64:	f240 6014 	movw	r0, #1556	@ 0x614
c0de5f68:	3c01      	subs	r4, #1
c0de5f6a:	f2c0 0000 	movt	r0, #0
c0de5f6e:	eb09 0106 	add.w	r1, r9, r6
c0de5f72:	4448      	add	r0, r9
c0de5f74:	3101      	adds	r1, #1
c0de5f76:	4622      	mov	r2, r4
c0de5f78:	f002 fa9b 	bl	c0de84b2 <__aeabi_memcpy>
c0de5f7c:	f640 0051 	movw	r0, #2129	@ 0x851
c0de5f80:	f2c0 0000 	movt	r0, #0
c0de5f84:	f809 7000 	strb.w	r7, [r9, r0]
c0de5f88:	2008      	movs	r0, #8
c0de5f8a:	f809 0005 	strb.w	r0, [r9, r5]
c0de5f8e:	e00d      	b.n	c0de5fac <io_legacy_apdu_rx+0x2c0>
c0de5f90:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de5f94:	2815      	cmp	r0, #21
c0de5f96:	d89c      	bhi.n	c0de5ed2 <io_legacy_apdu_rx+0x1e6>
c0de5f98:	2101      	movs	r1, #1
c0de5f9a:	fa01 f000 	lsl.w	r0, r1, r0
c0de5f9e:	f245 0120 	movw	r1, #20512	@ 0x5020
c0de5fa2:	f2c0 0120 	movt	r1, #32
c0de5fa6:	4208      	tst	r0, r1
c0de5fa8:	d093      	beq.n	c0de5ed2 <io_legacy_apdu_rx+0x1e6>
c0de5faa:	2400      	movs	r4, #0
c0de5fac:	4620      	mov	r0, r4
c0de5fae:	b004      	add	sp, #16
c0de5fb0:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de5fb4:	f640 0051 	movw	r0, #2129	@ 0x851
c0de5fb8:	f2c0 0000 	movt	r0, #0
c0de5fbc:	2101      	movs	r1, #1
c0de5fbe:	f809 1000 	strb.w	r1, [r9, r0]
c0de5fc2:	200c      	movs	r0, #12
c0de5fc4:	f809 0008 	strb.w	r0, [r9, r8]
c0de5fc8:	e7f0      	b.n	c0de5fac <io_legacy_apdu_rx+0x2c0>
c0de5fca:	20ff      	movs	r0, #255	@ 0xff
c0de5fcc:	f002 f8bc 	bl	c0de8148 <os_sched_exit>

c0de5fd0 <io_seproxyhal_init>:
c0de5fd0:	b570      	push	{r4, r5, r6, lr}
c0de5fd2:	b08a      	sub	sp, #40	@ 0x28
c0de5fd4:	f640 0050 	movw	r0, #2128	@ 0x850
c0de5fd8:	f2c0 0000 	movt	r0, #0
c0de5fdc:	2500      	movs	r5, #0
c0de5fde:	ac01      	add	r4, sp, #4
c0de5fe0:	f809 5000 	strb.w	r5, [r9, r0]
c0de5fe4:	4620      	mov	r0, r4
c0de5fe6:	2118      	movs	r1, #24
c0de5fe8:	f002 fa60 	bl	c0de84ac <__aeabi_memclr>
c0de5fec:	2015      	movs	r0, #21
c0de5fee:	f2c0 0002 	movt	r0, #2
c0de5ff2:	9007      	str	r0, [sp, #28]
c0de5ff4:	2601      	movs	r6, #1
c0de5ff6:	4620      	mov	r0, r4
c0de5ff8:	f8ad 6020 	strh.w	r6, [sp, #32]
c0de5ffc:	f88d 5022 	strb.w	r5, [sp, #34]	@ 0x22
c0de6000:	f8ad 6024 	strh.w	r6, [sp, #36]	@ 0x24
c0de6004:	f002 f8ab 	bl	c0de815e <os_io_init>
c0de6008:	f640 0040 	movw	r0, #2112	@ 0x840
c0de600c:	f2c0 0000 	movt	r0, #0
c0de6010:	f809 6000 	strb.w	r6, [r9, r0]
c0de6014:	b00a      	add	sp, #40	@ 0x28
c0de6016:	bd70      	pop	{r4, r5, r6, pc}

c0de6018 <USB_power>:
c0de6018:	4770      	bx	lr

c0de601a <BLE_power>:
c0de601a:	4770      	bx	lr

c0de601c <bagl_draw_with_context>:
c0de601c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6020:	b08e      	sub	sp, #56	@ 0x38
c0de6022:	f890 8000 	ldrb.w	r8, [r0]
c0de6026:	4604      	mov	r4, r0
c0de6028:	f008 0b7f 	and.w	fp, r8, #127	@ 0x7f
c0de602c:	f1bb 0f05 	cmp.w	fp, #5
c0de6030:	910d      	str	r1, [sp, #52]	@ 0x34
c0de6032:	920a      	str	r2, [sp, #40]	@ 0x28
c0de6034:	f000 80b7 	beq.w	c0de61a6 <bagl_draw_with_context+0x18a>
c0de6038:	8b20      	ldrh	r0, [r4, #24]
c0de603a:	4616      	mov	r6, r2
c0de603c:	f000 facc 	bl	c0de65d8 <bagl_get_font>
c0de6040:	2800      	cmp	r0, #0
c0de6042:	f000 80b0 	beq.w	c0de61a6 <bagl_draw_with_context+0x18a>
c0de6046:	f890 a005 	ldrb.w	sl, [r0, #5]
c0de604a:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de604c:	8921      	ldrh	r1, [r4, #8]
c0de604e:	2800      	cmp	r0, #0
c0de6050:	f04f 0c00 	mov.w	ip, #0
c0de6054:	f8cd a02c 	str.w	sl, [sp, #44]	@ 0x2c
c0de6058:	9109      	str	r1, [sp, #36]	@ 0x24
c0de605a:	f000 8179 	beq.w	c0de6350 <bagl_draw_with_context+0x334>
c0de605e:	2e00      	cmp	r6, #0
c0de6060:	f000 8176 	beq.w	c0de6350 <bagl_draw_with_context+0x334>
c0de6064:	88e1      	ldrh	r1, [r4, #6]
c0de6066:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de606a:	3164      	adds	r1, #100	@ 0x64
c0de606c:	b289      	uxth	r1, r1
c0de606e:	8b20      	ldrh	r0, [r4, #24]
c0de6070:	e9cd 3100 	strd	r3, r1, [sp]
c0de6074:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de6076:	b2f2      	uxtb	r2, r6
c0de6078:	2500      	movs	r5, #0
c0de607a:	e9cd 1203 	strd	r1, r2, [sp, #12]
c0de607e:	2100      	movs	r1, #0
c0de6080:	2200      	movs	r2, #0
c0de6082:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de6086:	2700      	movs	r7, #0
c0de6088:	9502      	str	r5, [sp, #8]
c0de608a:	970c      	str	r7, [sp, #48]	@ 0x30
c0de608c:	9505      	str	r5, [sp, #20]
c0de608e:	f000 fae1 	bl	c0de6654 <bagl_draw_string>
c0de6092:	88e1      	ldrh	r1, [r4, #6]
c0de6094:	2e05      	cmp	r6, #5
c0de6096:	b285      	uxth	r5, r0
c0de6098:	f0c0 81a7 	bcc.w	c0de63ea <bagl_draw_with_context+0x3ce>
c0de609c:	42a9      	cmp	r1, r5
c0de609e:	f080 81a4 	bcs.w	c0de63ea <bagl_draw_with_context+0x3ce>
c0de60a2:	8b20      	ldrh	r0, [r4, #24]
c0de60a4:	f642 5229 	movw	r2, #11561	@ 0x2d29
c0de60a8:	f2c0 0200 	movt	r2, #0
c0de60ac:	2700      	movs	r7, #0
c0de60ae:	2103      	movs	r1, #3
c0de60b0:	447a      	add	r2, pc
c0de60b2:	2364      	movs	r3, #100	@ 0x64
c0de60b4:	f243 0639 	movw	r6, #12345	@ 0x3039
c0de60b8:	9600      	str	r6, [sp, #0]
c0de60ba:	9e0a      	ldr	r6, [sp, #40]	@ 0x28
c0de60bc:	e9cd 3701 	strd	r3, r7, [sp, #4]
c0de60c0:	e9cd 2103 	strd	r2, r1, [sp, #12]
c0de60c4:	2100      	movs	r1, #0
c0de60c6:	2200      	movs	r2, #0
c0de60c8:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de60cc:	9705      	str	r7, [sp, #20]
c0de60ce:	f000 fac1 	bl	c0de6654 <bagl_draw_string>
c0de60d2:	88e1      	ldrh	r1, [r4, #6]
c0de60d4:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
c0de60d6:	ea4f 0c56 	mov.w	ip, r6, lsr #1
c0de60da:	428d      	cmp	r5, r1
c0de60dc:	eb02 0256 	add.w	r2, r2, r6, lsr #1
c0de60e0:	920c      	str	r2, [sp, #48]	@ 0x30
c0de60e2:	f240 8183 	bls.w	c0de63ec <bagl_draw_with_context+0x3d0>
c0de60e6:	ebb6 0a0c 	subs.w	sl, r6, ip
c0de60ea:	f000 817f 	beq.w	c0de63ec <bagl_draw_with_context+0x3d0>
c0de60ee:	b280      	uxth	r0, r0
c0de60f0:	9008      	str	r0, [sp, #32]
c0de60f2:	2600      	movs	r6, #0
c0de60f4:	f8cd 801c 	str.w	r8, [sp, #28]
c0de60f8:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de60fc:	8b20      	ldrh	r0, [r4, #24]
c0de60fe:	e9cd 3100 	strd	r3, r1, [sp]
c0de6102:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de6104:	fa5f f28c 	uxtb.w	r2, ip
c0de6108:	465f      	mov	r7, fp
c0de610a:	f04f 0b00 	mov.w	fp, #0
c0de610e:	e9cd 1203 	strd	r1, r2, [sp, #12]
c0de6112:	2100      	movs	r1, #0
c0de6114:	2200      	movs	r2, #0
c0de6116:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de611a:	46e0      	mov	r8, ip
c0de611c:	f8cd b008 	str.w	fp, [sp, #8]
c0de6120:	f8cd b014 	str.w	fp, [sp, #20]
c0de6124:	f000 fa96 	bl	c0de6654 <bagl_draw_string>
c0de6128:	88e1      	ldrh	r1, [r4, #6]
c0de612a:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de612e:	b285      	uxth	r5, r0
c0de6130:	8b20      	ldrh	r0, [r4, #24]
c0de6132:	e9cd 3100 	strd	r3, r1, [sp]
c0de6136:	990c      	ldr	r1, [sp, #48]	@ 0x30
c0de6138:	fa5f f28a 	uxtb.w	r2, sl
c0de613c:	e9cd 1203 	strd	r1, r2, [sp, #12]
c0de6140:	2100      	movs	r1, #0
c0de6142:	2200      	movs	r2, #0
c0de6144:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de6148:	f8cd b008 	str.w	fp, [sp, #8]
c0de614c:	f8cd b014 	str.w	fp, [sp, #20]
c0de6150:	f000 fa80 	bl	c0de6654 <bagl_draw_string>
c0de6154:	9908      	ldr	r1, [sp, #32]
c0de6156:	b280      	uxth	r0, r0
c0de6158:	186a      	adds	r2, r5, r1
c0de615a:	88e1      	ldrh	r1, [r4, #6]
c0de615c:	1815      	adds	r5, r2, r0
c0de615e:	428d      	cmp	r5, r1
c0de6160:	f240 8234 	bls.w	c0de65cc <bagl_draw_with_context+0x5b0>
c0de6164:	2e01      	cmp	r6, #1
c0de6166:	d007      	beq.n	c0de6178 <bagl_draw_with_context+0x15c>
c0de6168:	46c4      	mov	ip, r8
c0de616a:	46bb      	mov	fp, r7
c0de616c:	b90e      	cbnz	r6, c0de6172 <bagl_draw_with_context+0x156>
c0de616e:	f1ac 0c01 	sub.w	ip, ip, #1
c0de6172:	f8dd 801c 	ldr.w	r8, [sp, #28]
c0de6176:	e006      	b.n	c0de6186 <bagl_draw_with_context+0x16a>
c0de6178:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de617a:	46c4      	mov	ip, r8
c0de617c:	f8dd 801c 	ldr.w	r8, [sp, #28]
c0de6180:	3001      	adds	r0, #1
c0de6182:	46bb      	mov	fp, r7
c0de6184:	900c      	str	r0, [sp, #48]	@ 0x30
c0de6186:	f1bc 0f00 	cmp.w	ip, #0
c0de618a:	f000 812f 	beq.w	c0de63ec <bagl_draw_with_context+0x3d0>
c0de618e:	e9dd 200c 	ldrd	r2, r0, [sp, #48]	@ 0x30
c0de6192:	1a80      	subs	r0, r0, r2
c0de6194:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
c0de6196:	eb10 0a02 	adds.w	sl, r0, r2
c0de619a:	f04f 0001 	mov.w	r0, #1
c0de619e:	ea20 0606 	bic.w	r6, r0, r6
c0de61a2:	d1a9      	bne.n	c0de60f8 <bagl_draw_with_context+0xdc>
c0de61a4:	e122      	b.n	c0de63ec <bagl_draw_with_context+0x3d0>
c0de61a6:	2000      	movs	r0, #0
c0de61a8:	900c      	str	r0, [sp, #48]	@ 0x30
c0de61aa:	2000      	movs	r0, #0
c0de61ac:	9009      	str	r0, [sp, #36]	@ 0x24
c0de61ae:	2000      	movs	r0, #0
c0de61b0:	f04f 0c00 	mov.w	ip, #0
c0de61b4:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de61b6:	f04f 0e00 	mov.w	lr, #0
c0de61ba:	2500      	movs	r5, #0
c0de61bc:	88e3      	ldrh	r3, [r4, #6]
c0de61be:	8926      	ldrh	r6, [r4, #8]
c0de61c0:	7ae7      	ldrb	r7, [r4, #11]
c0de61c2:	0858      	lsrs	r0, r3, #1
c0de61c4:	0871      	lsrs	r1, r6, #1
c0de61c6:	ebb0 0f56 	cmp.w	r0, r6, lsr #1
c0de61ca:	460a      	mov	r2, r1
c0de61cc:	bf38      	it	cc
c0de61ce:	085a      	lsrcc	r2, r3, #1
c0de61d0:	42ba      	cmp	r2, r7
c0de61d2:	46ba      	mov	sl, r7
c0de61d4:	d803      	bhi.n	c0de61de <bagl_draw_with_context+0x1c2>
c0de61d6:	4288      	cmp	r0, r1
c0de61d8:	bf2c      	ite	cs
c0de61da:	468a      	movcs	sl, r1
c0de61dc:	4682      	movcc	sl, r0
c0de61de:	f1ab 0001 	sub.w	r0, fp, #1
c0de61e2:	2804      	cmp	r0, #4
c0de61e4:	d307      	bcc.n	c0de61f6 <bagl_draw_with_context+0x1da>
c0de61e6:	f1bb 0f06 	cmp.w	fp, #6
c0de61ea:	f000 80b4 	beq.w	c0de6356 <bagl_draw_with_context+0x33a>
c0de61ee:	f1bb 0f07 	cmp.w	fp, #7
c0de61f2:	f040 80c8 	bne.w	c0de6386 <bagl_draw_with_context+0x36a>
c0de61f6:	f1bb 0f04 	cmp.w	fp, #4
c0de61fa:	bf08      	it	eq
c0de61fc:	2f00      	cmpeq	r7, #0
c0de61fe:	d00a      	beq.n	c0de6216 <bagl_draw_with_context+0x1fa>
c0de6200:	f1b8 0f81 	cmp.w	r8, #129	@ 0x81
c0de6204:	9508      	str	r5, [sp, #32]
c0de6206:	dc0f      	bgt.n	c0de6228 <bagl_draw_with_context+0x20c>
c0de6208:	f1b8 0f02 	cmp.w	r8, #2
c0de620c:	d013      	beq.n	c0de6236 <bagl_draw_with_context+0x21a>
c0de620e:	f1b8 0f07 	cmp.w	r8, #7
c0de6212:	d010      	beq.n	c0de6236 <bagl_draw_with_context+0x21a>
c0de6214:	e0ba      	b.n	c0de638c <bagl_draw_with_context+0x370>
c0de6216:	6920      	ldr	r0, [r4, #16]
c0de6218:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de621c:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de6220:	9600      	str	r6, [sp, #0]
c0de6222:	f002 f814 	bl	c0de824e <bagl_hal_draw_rect>
c0de6226:	e0ae      	b.n	c0de6386 <bagl_draw_with_context+0x36a>
c0de6228:	f1b8 0f87 	cmp.w	r8, #135	@ 0x87
c0de622c:	d003      	beq.n	c0de6236 <bagl_draw_with_context+0x21a>
c0de622e:	f1b8 0f82 	cmp.w	r8, #130	@ 0x82
c0de6232:	f040 80ab 	bne.w	c0de638c <bagl_draw_with_context+0x370>
c0de6236:	6960      	ldr	r0, [r4, #20]
c0de6238:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de623c:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de6240:	9d0b      	ldr	r5, [sp, #44]	@ 0x2c
c0de6242:	f1bb 0f07 	cmp.w	fp, #7
c0de6246:	bf08      	it	eq
c0de6248:	1b52      	subeq	r2, r2, r5
c0de624a:	9d09      	ldr	r5, [sp, #36]	@ 0x24
c0de624c:	bf08      	it	eq
c0de624e:	462e      	moveq	r6, r5
c0de6250:	9600      	str	r6, [sp, #0]
c0de6252:	4665      	mov	r5, ip
c0de6254:	4676      	mov	r6, lr
c0de6256:	f001 fffa 	bl	c0de824e <bagl_hal_draw_rect>
c0de625a:	9f08      	ldr	r7, [sp, #32]
c0de625c:	46ac      	mov	ip, r5
c0de625e:	f1bb 0f04 	cmp.w	fp, #4
c0de6262:	f000 8090 	beq.w	c0de6386 <bagl_draw_with_context+0x36a>
c0de6266:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de6268:	2800      	cmp	r0, #0
c0de626a:	f000 808c 	beq.w	c0de6386 <bagl_draw_with_context+0x36a>
c0de626e:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de6270:	2800      	cmp	r0, #0
c0de6272:	f000 8088 	beq.w	c0de6386 <bagl_draw_with_context+0x36a>
c0de6276:	f8dd e02c 	ldr.w	lr, [sp, #44]	@ 0x2c
c0de627a:	e9d4 a204 	ldrd	sl, r2, [r4, #16]
c0de627e:	f008 007d 	and.w	r0, r8, #125	@ 0x7d
c0de6282:	2801      	cmp	r0, #1
c0de6284:	d106      	bne.n	c0de6294 <bagl_draw_with_context+0x278>
c0de6286:	7b20      	ldrb	r0, [r4, #12]
c0de6288:	2801      	cmp	r0, #1
c0de628a:	4650      	mov	r0, sl
c0de628c:	bf04      	itt	eq
c0de628e:	4610      	moveq	r0, r2
c0de6290:	4652      	moveq	r2, sl
c0de6292:	4682      	mov	sl, r0
c0de6294:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de6298:	46b0      	mov	r8, r6
c0de629a:	8b20      	ldrh	r0, [r4, #24]
c0de629c:	f9b4 5004 	ldrsh.w	r5, [r4, #4]
c0de62a0:	187b      	adds	r3, r7, r1
c0de62a2:	f1bb 0f07 	cmp.w	fp, #7
c0de62a6:	bf08      	it	eq
c0de62a8:	f1ce 0800 	rsbeq	r8, lr, #0
c0de62ac:	88e1      	ldrh	r1, [r4, #6]
c0de62ae:	eb08 0e05 	add.w	lr, r8, r5
c0de62b2:	1bc9      	subs	r1, r1, r7
c0de62b4:	f1bb 0707 	subs.w	r7, fp, #7
c0de62b8:	8925      	ldrh	r5, [r4, #8]
c0de62ba:	bf18      	it	ne
c0de62bc:	4637      	movne	r7, r6
c0de62be:	e9cd e100 	strd	lr, r1, [sp]
c0de62c2:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de62c4:	1bed      	subs	r5, r5, r7
c0de62c6:	2600      	movs	r6, #0
c0de62c8:	e9cd 1c03 	strd	r1, ip, [sp, #12]
c0de62cc:	4651      	mov	r1, sl
c0de62ce:	9502      	str	r5, [sp, #8]
c0de62d0:	9605      	str	r6, [sp, #20]
c0de62d2:	4693      	mov	fp, r2
c0de62d4:	f000 f9be 	bl	c0de6654 <bagl_draw_string>
c0de62d8:	990c      	ldr	r1, [sp, #48]	@ 0x30
c0de62da:	9e08      	ldr	r6, [sp, #32]
c0de62dc:	2900      	cmp	r1, #0
c0de62de:	d052      	beq.n	c0de6386 <bagl_draw_with_context+0x36a>
c0de62e0:	f9b4 5004 	ldrsh.w	r5, [r4, #4]
c0de62e4:	f8b4 e018 	ldrh.w	lr, [r4, #24]
c0de62e8:	b283      	uxth	r3, r0
c0de62ea:	eb08 0005 	add.w	r0, r8, r5
c0de62ee:	88e1      	ldrh	r1, [r4, #6]
c0de62f0:	8925      	ldrh	r5, [r4, #8]
c0de62f2:	f642 22d7 	movw	r2, #10967	@ 0x2ad7
c0de62f6:	f2c0 0200 	movt	r2, #0
c0de62fa:	1b89      	subs	r1, r1, r6
c0de62fc:	1bed      	subs	r5, r5, r7
c0de62fe:	f04f 0c03 	mov.w	ip, #3
c0de6302:	447a      	add	r2, pc
c0de6304:	e88d 0023 	stmia.w	sp, {r0, r1, r5}
c0de6308:	e9cd 2c03 	strd	r2, ip, [sp, #12]
c0de630c:	4670      	mov	r0, lr
c0de630e:	4651      	mov	r1, sl
c0de6310:	465a      	mov	r2, fp
c0de6312:	2500      	movs	r5, #0
c0de6314:	9505      	str	r5, [sp, #20]
c0de6316:	f000 f99d 	bl	c0de6654 <bagl_draw_string>
c0de631a:	88e3      	ldrh	r3, [r4, #6]
c0de631c:	8925      	ldrh	r5, [r4, #8]
c0de631e:	1b9e      	subs	r6, r3, r6
c0de6320:	b283      	uxth	r3, r0
c0de6322:	1be8      	subs	r0, r5, r7
c0de6324:	9f0a      	ldr	r7, [sp, #40]	@ 0x28
c0de6326:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
c0de6328:	f9b4 1004 	ldrsh.w	r1, [r4, #4]
c0de632c:	442f      	add	r7, r5
c0de632e:	9d0c      	ldr	r5, [sp, #48]	@ 0x30
c0de6330:	eb08 0201 	add.w	r2, r8, r1
c0de6334:	8b21      	ldrh	r1, [r4, #24]
c0de6336:	1b7f      	subs	r7, r7, r5
c0de6338:	e9cd 2600 	strd	r2, r6, [sp]
c0de633c:	aa02      	add	r2, sp, #8
c0de633e:	c2a1      	stmia	r2!, {r0, r5, r7}
c0de6340:	4608      	mov	r0, r1
c0de6342:	4651      	mov	r1, sl
c0de6344:	465a      	mov	r2, fp
c0de6346:	2700      	movs	r7, #0
c0de6348:	9705      	str	r7, [sp, #20]
c0de634a:	f000 f983 	bl	c0de6654 <bagl_draw_string>
c0de634e:	e01a      	b.n	c0de6386 <bagl_draw_with_context+0x36a>
c0de6350:	2000      	movs	r0, #0
c0de6352:	900c      	str	r0, [sp, #48]	@ 0x30
c0de6354:	e72f      	b.n	c0de61b6 <bagl_draw_with_context+0x19a>
c0de6356:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de635a:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de635e:	7b23      	ldrb	r3, [r4, #12]
c0de6360:	6920      	ldr	r0, [r4, #16]
c0de6362:	4439      	add	r1, r7
c0de6364:	2b01      	cmp	r3, #1
c0de6366:	443a      	add	r2, r7
c0de6368:	d004      	beq.n	c0de6374 <bagl_draw_with_context+0x358>
c0de636a:	7aa3      	ldrb	r3, [r4, #10]
c0de636c:	429f      	cmp	r7, r3
c0de636e:	d901      	bls.n	c0de6374 <bagl_draw_with_context+0x358>
c0de6370:	1afb      	subs	r3, r7, r3
c0de6372:	e000      	b.n	c0de6376 <bagl_draw_with_context+0x35a>
c0de6374:	2300      	movs	r3, #0
c0de6376:	6966      	ldr	r6, [r4, #20]
c0de6378:	25ff      	movs	r5, #255	@ 0xff
c0de637a:	e9cd 5300 	strd	r5, r3, [sp]
c0de637e:	463b      	mov	r3, r7
c0de6380:	9602      	str	r6, [sp, #8]
c0de6382:	f000 fab7 	bl	c0de68f4 <bagl_draw_circle_helper>
c0de6386:	b00e      	add	sp, #56	@ 0x38
c0de6388:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de638c:	7b20      	ldrb	r0, [r4, #12]
c0de638e:	f8cd e018 	str.w	lr, [sp, #24]
c0de6392:	2801      	cmp	r0, #1
c0de6394:	f8cd c024 	str.w	ip, [sp, #36]	@ 0x24
c0de6398:	d151      	bne.n	c0de643e <bagl_draw_with_context+0x422>
c0de639a:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de639e:	6920      	ldr	r0, [r4, #16]
c0de63a0:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de63a4:	4451      	add	r1, sl
c0de63a6:	eba3 034a 	sub.w	r3, r3, sl, lsl #1
c0de63aa:	9600      	str	r6, [sp, #0]
c0de63ac:	f001 ff4f 	bl	c0de824e <bagl_hal_draw_rect>
c0de63b0:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de63b4:	8923      	ldrh	r3, [r4, #8]
c0de63b6:	6920      	ldr	r0, [r4, #16]
c0de63b8:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de63bc:	4452      	add	r2, sl
c0de63be:	eba3 074a 	sub.w	r7, r3, sl, lsl #1
c0de63c2:	4653      	mov	r3, sl
c0de63c4:	9700      	str	r7, [sp, #0]
c0de63c6:	f001 ff42 	bl	c0de824e <bagl_hal_draw_rect>
c0de63ca:	f9b4 2002 	ldrsh.w	r2, [r4, #2]
c0de63ce:	88e1      	ldrh	r1, [r4, #6]
c0de63d0:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
c0de63d4:	8927      	ldrh	r7, [r4, #8]
c0de63d6:	6920      	ldr	r0, [r4, #16]
c0de63d8:	eba2 020a 	sub.w	r2, r2, sl
c0de63dc:	4411      	add	r1, r2
c0de63de:	eb0a 0203 	add.w	r2, sl, r3
c0de63e2:	eba7 074a 	sub.w	r7, r7, sl, lsl #1
c0de63e6:	4653      	mov	r3, sl
c0de63e8:	e08c      	b.n	c0de6504 <bagl_draw_with_context+0x4e8>
c0de63ea:	46b4      	mov	ip, r6
c0de63ec:	8b20      	ldrh	r0, [r4, #24]
c0de63ee:	f400 4240 	and.w	r2, r0, #49152	@ 0xc000
c0de63f2:	f5b2 4f00 	cmp.w	r2, #32768	@ 0x8000
c0de63f6:	d005      	beq.n	c0de6404 <bagl_draw_with_context+0x3e8>
c0de63f8:	f5b2 4f80 	cmp.w	r2, #16384	@ 0x4000
c0de63fc:	9a0b      	ldr	r2, [sp, #44]	@ 0x2c
c0de63fe:	d108      	bne.n	c0de6412 <bagl_draw_with_context+0x3f6>
c0de6400:	1b49      	subs	r1, r1, r5
c0de6402:	e003      	b.n	c0de640c <bagl_draw_with_context+0x3f0>
c0de6404:	0849      	lsrs	r1, r1, #1
c0de6406:	eba1 0155 	sub.w	r1, r1, r5, lsr #1
c0de640a:	9a0b      	ldr	r2, [sp, #44]	@ 0x2c
c0de640c:	ea21 75e1 	bic.w	r5, r1, r1, asr #31
c0de6410:	e000      	b.n	c0de6414 <bagl_draw_with_context+0x3f8>
c0de6412:	2500      	movs	r5, #0
c0de6414:	f400 5040 	and.w	r0, r0, #12288	@ 0x3000
c0de6418:	f5b0 5f00 	cmp.w	r0, #8192	@ 0x2000
c0de641c:	d006      	beq.n	c0de642c <bagl_draw_with_context+0x410>
c0de641e:	f5b0 5f80 	cmp.w	r0, #4096	@ 0x1000
c0de6422:	d109      	bne.n	c0de6438 <bagl_draw_with_context+0x41c>
c0de6424:	8920      	ldrh	r0, [r4, #8]
c0de6426:	eba0 0e02 	sub.w	lr, r0, r2
c0de642a:	e6c7      	b.n	c0de61bc <bagl_draw_with_context+0x1a0>
c0de642c:	8920      	ldrh	r0, [r4, #8]
c0de642e:	ea6f 0152 	mvn.w	r1, r2, lsr #1
c0de6432:	eb01 0e50 	add.w	lr, r1, r0, lsr #1
c0de6436:	e6c1      	b.n	c0de61bc <bagl_draw_with_context+0x1a0>
c0de6438:	f04f 0e00 	mov.w	lr, #0
c0de643c:	e6be      	b.n	c0de61bc <bagl_draw_with_context+0x1a0>
c0de643e:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de6442:	6960      	ldr	r0, [r4, #20]
c0de6444:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de6448:	4451      	add	r1, sl
c0de644a:	eba3 034a 	sub.w	r3, r3, sl, lsl #1
c0de644e:	9600      	str	r6, [sp, #0]
c0de6450:	f001 fefd 	bl	c0de824e <bagl_hal_draw_rect>
c0de6454:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de6458:	8923      	ldrh	r3, [r4, #8]
c0de645a:	6960      	ldr	r0, [r4, #20]
c0de645c:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de6460:	4452      	add	r2, sl
c0de6462:	eba3 074a 	sub.w	r7, r3, sl, lsl #1
c0de6466:	4653      	mov	r3, sl
c0de6468:	9700      	str	r7, [sp, #0]
c0de646a:	f001 fef0 	bl	c0de824e <bagl_hal_draw_rect>
c0de646e:	f9b4 3002 	ldrsh.w	r3, [r4, #2]
c0de6472:	ea6f 020a 	mvn.w	r2, sl
c0de6476:	88e1      	ldrh	r1, [r4, #6]
c0de6478:	f9b4 7004 	ldrsh.w	r7, [r4, #4]
c0de647c:	441a      	add	r2, r3
c0de647e:	8923      	ldrh	r3, [r4, #8]
c0de6480:	6960      	ldr	r0, [r4, #20]
c0de6482:	4411      	add	r1, r2
c0de6484:	eb0a 0207 	add.w	r2, sl, r7
c0de6488:	eba3 074a 	sub.w	r7, r3, sl, lsl #1
c0de648c:	4653      	mov	r3, sl
c0de648e:	9700      	str	r7, [sp, #0]
c0de6490:	f001 fedd 	bl	c0de824e <bagl_hal_draw_rect>
c0de6494:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de6498:	88e3      	ldrh	r3, [r4, #6]
c0de649a:	6920      	ldr	r0, [r4, #16]
c0de649c:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de64a0:	7aa7      	ldrb	r7, [r4, #10]
c0de64a2:	4451      	add	r1, sl
c0de64a4:	eba3 034a 	sub.w	r3, r3, sl, lsl #1
c0de64a8:	9700      	str	r7, [sp, #0]
c0de64aa:	f001 fed0 	bl	c0de824e <bagl_hal_draw_rect>
c0de64ae:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de64b2:	8923      	ldrh	r3, [r4, #8]
c0de64b4:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de64b8:	441a      	add	r2, r3
c0de64ba:	88e3      	ldrh	r3, [r4, #6]
c0de64bc:	6920      	ldr	r0, [r4, #16]
c0de64be:	7aa7      	ldrb	r7, [r4, #10]
c0de64c0:	4451      	add	r1, sl
c0de64c2:	3a01      	subs	r2, #1
c0de64c4:	eba3 034a 	sub.w	r3, r3, sl, lsl #1
c0de64c8:	9700      	str	r7, [sp, #0]
c0de64ca:	f001 fec0 	bl	c0de824e <bagl_hal_draw_rect>
c0de64ce:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de64d2:	8927      	ldrh	r7, [r4, #8]
c0de64d4:	6920      	ldr	r0, [r4, #16]
c0de64d6:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de64da:	7aa3      	ldrb	r3, [r4, #10]
c0de64dc:	4452      	add	r2, sl
c0de64de:	eba7 074a 	sub.w	r7, r7, sl, lsl #1
c0de64e2:	9700      	str	r7, [sp, #0]
c0de64e4:	f001 feb3 	bl	c0de824e <bagl_hal_draw_rect>
c0de64e8:	88e1      	ldrh	r1, [r4, #6]
c0de64ea:	f9b4 2002 	ldrsh.w	r2, [r4, #2]
c0de64ee:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
c0de64f2:	8927      	ldrh	r7, [r4, #8]
c0de64f4:	6920      	ldr	r0, [r4, #16]
c0de64f6:	4411      	add	r1, r2
c0de64f8:	eb0a 0203 	add.w	r2, sl, r3
c0de64fc:	7aa3      	ldrb	r3, [r4, #10]
c0de64fe:	3901      	subs	r1, #1
c0de6500:	eba7 074a 	sub.w	r7, r7, sl, lsl #1
c0de6504:	9700      	str	r7, [sp, #0]
c0de6506:	f001 fea2 	bl	c0de824e <bagl_hal_draw_rect>
c0de650a:	e9dd 7c08 	ldrd	r7, ip, [sp, #32]
c0de650e:	9e06      	ldr	r6, [sp, #24]
c0de6510:	f1ba 0f02 	cmp.w	sl, #2
c0de6514:	f4ff aea3 	bcc.w	c0de625e <bagl_draw_with_context+0x242>
c0de6518:	7b20      	ldrb	r0, [r4, #12]
c0de651a:	2500      	movs	r5, #0
c0de651c:	2801      	cmp	r0, #1
c0de651e:	d004      	beq.n	c0de652a <bagl_draw_with_context+0x50e>
c0de6520:	7aa0      	ldrb	r0, [r4, #10]
c0de6522:	ebba 0000 	subs.w	r0, sl, r0
c0de6526:	bf28      	it	cs
c0de6528:	4605      	movcs	r5, r0
c0de652a:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de652e:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de6532:	e9d4 0704 	ldrd	r0, r7, [r4, #16]
c0de6536:	23c0      	movs	r3, #192	@ 0xc0
c0de6538:	4451      	add	r1, sl
c0de653a:	4452      	add	r2, sl
c0de653c:	e9cd 3500 	strd	r3, r5, [sp]
c0de6540:	4653      	mov	r3, sl
c0de6542:	9702      	str	r7, [sp, #8]
c0de6544:	f000 f9d6 	bl	c0de68f4 <bagl_draw_circle_helper>
c0de6548:	88e1      	ldrh	r1, [r4, #6]
c0de654a:	7aa2      	ldrb	r2, [r4, #10]
c0de654c:	f9b4 3002 	ldrsh.w	r3, [r4, #2]
c0de6550:	f9b4 7004 	ldrsh.w	r7, [r4, #4]
c0de6554:	6920      	ldr	r0, [r4, #16]
c0de6556:	4419      	add	r1, r3
c0de6558:	4452      	add	r2, sl
c0de655a:	6966      	ldr	r6, [r4, #20]
c0de655c:	2330      	movs	r3, #48	@ 0x30
c0de655e:	1a89      	subs	r1, r1, r2
c0de6560:	eb0a 0207 	add.w	r2, sl, r7
c0de6564:	e9cd 3500 	strd	r3, r5, [sp]
c0de6568:	4653      	mov	r3, sl
c0de656a:	9602      	str	r6, [sp, #8]
c0de656c:	f000 f9c2 	bl	c0de68f4 <bagl_draw_circle_helper>
c0de6570:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de6574:	8923      	ldrh	r3, [r4, #8]
c0de6576:	7aa7      	ldrb	r7, [r4, #10]
c0de6578:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de657c:	441a      	add	r2, r3
c0de657e:	eb0a 0307 	add.w	r3, sl, r7
c0de6582:	6920      	ldr	r0, [r4, #16]
c0de6584:	6967      	ldr	r7, [r4, #20]
c0de6586:	1ad2      	subs	r2, r2, r3
c0de6588:	230c      	movs	r3, #12
c0de658a:	4451      	add	r1, sl
c0de658c:	e9cd 3500 	strd	r3, r5, [sp]
c0de6590:	4653      	mov	r3, sl
c0de6592:	9702      	str	r7, [sp, #8]
c0de6594:	f000 f9ae 	bl	c0de68f4 <bagl_draw_circle_helper>
c0de6598:	88e1      	ldrh	r1, [r4, #6]
c0de659a:	f9b4 2002 	ldrsh.w	r2, [r4, #2]
c0de659e:	7aa7      	ldrb	r7, [r4, #10]
c0de65a0:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
c0de65a4:	4411      	add	r1, r2
c0de65a6:	eb0a 0207 	add.w	r2, sl, r7
c0de65aa:	8927      	ldrh	r7, [r4, #8]
c0de65ac:	6920      	ldr	r0, [r4, #16]
c0de65ae:	1a89      	subs	r1, r1, r2
c0de65b0:	1a9a      	subs	r2, r3, r2
c0de65b2:	6966      	ldr	r6, [r4, #20]
c0de65b4:	2303      	movs	r3, #3
c0de65b6:	443a      	add	r2, r7
c0de65b8:	e9cd 3500 	strd	r3, r5, [sp]
c0de65bc:	4653      	mov	r3, sl
c0de65be:	9602      	str	r6, [sp, #8]
c0de65c0:	f000 f998 	bl	c0de68f4 <bagl_draw_circle_helper>
c0de65c4:	e9dd 7c08 	ldrd	r7, ip, [sp, #32]
c0de65c8:	9e06      	ldr	r6, [sp, #24]
c0de65ca:	e648      	b.n	c0de625e <bagl_draw_with_context+0x242>
c0de65cc:	46c4      	mov	ip, r8
c0de65ce:	f8dd 801c 	ldr.w	r8, [sp, #28]
c0de65d2:	46bb      	mov	fp, r7
c0de65d4:	e70a      	b.n	c0de63ec <bagl_draw_with_context+0x3d0>
c0de65d6:	d4d4      	bmi.n	c0de6582 <bagl_draw_with_context+0x566>

c0de65d8 <bagl_get_font>:
c0de65d8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de65da:	b081      	sub	sp, #4
c0de65dc:	4604      	mov	r4, r0
c0de65de:	f644 40be 	movw	r0, #19646	@ 0x4cbe
c0de65e2:	f2c0 0000 	movt	r0, #0
c0de65e6:	4478      	add	r0, pc
c0de65e8:	f644 47a2 	movw	r7, #19618	@ 0x4ca2
c0de65ec:	6806      	ldr	r6, [r0, #0]
c0de65ee:	f2c0 0700 	movt	r7, #0
c0de65f2:	f36f 341f 	bfc	r4, #12, #20
c0de65f6:	447f      	add	r7, pc
c0de65f8:	b186      	cbz	r6, c0de661c <bagl_get_font+0x44>
c0de65fa:	eb07 0086 	add.w	r0, r7, r6, lsl #2
c0de65fe:	f850 5c04 	ldr.w	r5, [r0, #-4]
c0de6602:	4628      	mov	r0, r5
c0de6604:	f001 fce4 	bl	c0de7fd0 <pic>
c0de6608:	7880      	ldrb	r0, [r0, #2]
c0de660a:	3e01      	subs	r6, #1
c0de660c:	4284      	cmp	r4, r0
c0de660e:	d1f3      	bne.n	c0de65f8 <bagl_get_font+0x20>
c0de6610:	4628      	mov	r0, r5
c0de6612:	b001      	add	sp, #4
c0de6614:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de6618:	f001 bcda 	b.w	c0de7fd0 <pic>
c0de661c:	2000      	movs	r0, #0
c0de661e:	b001      	add	sp, #4
c0de6620:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de6622 <bagl_compute_line_width>:
c0de6622:	b580      	push	{r7, lr}
c0de6624:	b086      	sub	sp, #24
c0de6626:	469c      	mov	ip, r3
c0de6628:	f04f 0e00 	mov.w	lr, #0
c0de662c:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de6630:	e9cd 3100 	strd	r3, r1, [sp]
c0de6634:	e9cd e202 	strd	lr, r2, [sp, #8]
c0de6638:	2100      	movs	r1, #0
c0de663a:	2200      	movs	r2, #0
c0de663c:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de6640:	f8cd e014 	str.w	lr, [sp, #20]
c0de6644:	f8cd c010 	str.w	ip, [sp, #16]
c0de6648:	f000 f804 	bl	c0de6654 <bagl_draw_string>
c0de664c:	b280      	uxth	r0, r0
c0de664e:	b006      	add	sp, #24
c0de6650:	bd80      	pop	{r7, pc}
c0de6652:	d4d4      	bmi.n	c0de65fe <bagl_get_font+0x26>

c0de6654 <bagl_draw_string>:
c0de6654:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6658:	b0a4      	sub	sp, #144	@ 0x90
c0de665a:	9f2c      	ldr	r7, [sp, #176]	@ 0xb0
c0de665c:	f243 0539 	movw	r5, #12345	@ 0x3039
c0de6660:	ea83 0605 	eor.w	r6, r3, r5
c0de6664:	407d      	eors	r5, r7
c0de6666:	4335      	orrs	r5, r6
c0de6668:	462c      	mov	r4, r5
c0de666a:	bf08      	it	eq
c0de666c:	462f      	moveq	r7, r5
c0de666e:	9711      	str	r7, [sp, #68]	@ 0x44
c0de6670:	9308      	str	r3, [sp, #32]
c0de6672:	bf18      	it	ne
c0de6674:	461c      	movne	r4, r3
c0de6676:	9206      	str	r2, [sp, #24]
c0de6678:	e9cd 2114 	strd	r2, r1, [sp, #80]	@ 0x50
c0de667c:	f7ff ffac 	bl	c0de65d8 <bagl_get_font>
c0de6680:	2800      	cmp	r0, #0
c0de6682:	f000 8125 	beq.w	c0de68d0 <bagl_draw_string+0x27c>
c0de6686:	f8dd a0c0 	ldr.w	sl, [sp, #192]	@ 0xc0
c0de668a:	4606      	mov	r6, r0
c0de668c:	fab5 f085 	clz	r0, r5
c0de6690:	f1ba 0f00 	cmp.w	sl, #0
c0de6694:	ea4f 1050 	mov.w	r0, r0, lsr #5
c0de6698:	9010      	str	r0, [sp, #64]	@ 0x40
c0de669a:	f000 811c 	beq.w	c0de68d6 <bagl_draw_string+0x282>
c0de669e:	e9dd 102d 	ldrd	r1, r0, [sp, #180]	@ 0xb4
c0de66a2:	78f2      	ldrb	r2, [r6, #3]
c0de66a4:	1867      	adds	r7, r4, r1
c0de66a6:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de66a8:	9b2f      	ldr	r3, [sp, #188]	@ 0xbc
c0de66aa:	4408      	add	r0, r1
c0de66ac:	9005      	str	r0, [sp, #20]
c0de66ae:	2001      	movs	r0, #1
c0de66b0:	46a4      	mov	ip, r4
c0de66b2:	4090      	lsls	r0, r2
c0de66b4:	920f      	str	r2, [sp, #60]	@ 0x3c
c0de66b6:	9007      	str	r0, [sp, #28]
c0de66b8:	960c      	str	r6, [sp, #48]	@ 0x30
c0de66ba:	970e      	str	r7, [sp, #56]	@ 0x38
c0de66bc:	f813 5b01 	ldrb.w	r5, [r3], #1
c0de66c0:	79b1      	ldrb	r1, [r6, #6]
c0de66c2:	f896 e004 	ldrb.w	lr, [r6, #4]
c0de66c6:	428d      	cmp	r5, r1
c0de66c8:	d302      	bcc.n	c0de66d0 <bagl_draw_string+0x7c>
c0de66ca:	79f0      	ldrb	r0, [r6, #7]
c0de66cc:	4285      	cmp	r5, r0
c0de66ce:	d919      	bls.n	c0de6704 <bagl_draw_string+0xb0>
c0de66d0:	2dc0      	cmp	r5, #192	@ 0xc0
c0de66d2:	d303      	bcc.n	c0de66dc <bagl_draw_string+0x88>
c0de66d4:	f005 043f 	and.w	r4, r5, #63	@ 0x3f
c0de66d8:	e005      	b.n	c0de66e6 <bagl_draw_string+0x92>
c0de66da:	bf00      	nop
c0de66dc:	b268      	sxtb	r0, r5
c0de66de:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de66e2:	dd25      	ble.n	c0de6730 <bagl_draw_string+0xdc>
c0de66e4:	2400      	movs	r4, #0
c0de66e6:	2000      	movs	r0, #0
c0de66e8:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de66ea:	9012      	str	r0, [sp, #72]	@ 0x48
c0de66ec:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de66ee:	f04f 0800 	mov.w	r8, #0
c0de66f2:	fb0e f000 	mul.w	r0, lr, r0
c0de66f6:	fb00 f504 	mul.w	r5, r0, r4
c0de66fa:	2000      	movs	r0, #0
c0de66fc:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de66fe:	f04f 0b00 	mov.w	fp, #0
c0de6702:	e08d      	b.n	c0de6820 <bagl_draw_string+0x1cc>
c0de6704:	68f0      	ldr	r0, [r6, #12]
c0de6706:	f8cd c034 	str.w	ip, [sp, #52]	@ 0x34
c0de670a:	e9cd e30a 	strd	lr, r3, [sp, #40]	@ 0x28
c0de670e:	1a6f      	subs	r7, r5, r1
c0de6710:	f001 fc5e 	bl	c0de7fd0 <pic>
c0de6714:	68b1      	ldr	r1, [r6, #8]
c0de6716:	4680      	mov	r8, r0
c0de6718:	4608      	mov	r0, r1
c0de671a:	f001 fc59 	bl	c0de7fd0 <pic>
c0de671e:	79b1      	ldrb	r1, [r6, #6]
c0de6720:	79f2      	ldrb	r2, [r6, #7]
c0de6722:	f850 5027 	ldr.w	r5, [r0, r7, lsl #2]
c0de6726:	1a50      	subs	r0, r2, r1
c0de6728:	4287      	cmp	r7, r0
c0de672a:	d132      	bne.n	c0de6792 <bagl_draw_string+0x13e>
c0de672c:	8834      	ldrh	r4, [r6, #0]
c0de672e:	e038      	b.n	c0de67a2 <bagl_draw_string+0x14e>
c0de6730:	06a8      	lsls	r0, r5, #26
c0de6732:	f04f 000f 	mov.w	r0, #15
c0de6736:	46f3      	mov	fp, lr
c0de6738:	f8cd c034 	str.w	ip, [sp, #52]	@ 0x34
c0de673c:	4698      	mov	r8, r3
c0de673e:	bf58      	it	pl
c0de6740:	200e      	movpl	r0, #14
c0de6742:	f7ff ff49 	bl	c0de65d8 <bagl_get_font>
c0de6746:	2800      	cmp	r0, #0
c0de6748:	f000 80b9 	beq.w	c0de68be <bagl_draw_string+0x26a>
c0de674c:	4607      	mov	r7, r0
c0de674e:	68c0      	ldr	r0, [r0, #12]
c0de6750:	f001 fc3e 	bl	c0de7fd0 <pic>
c0de6754:	68b9      	ldr	r1, [r7, #8]
c0de6756:	4604      	mov	r4, r0
c0de6758:	4608      	mov	r0, r1
c0de675a:	f001 fc39 	bl	c0de7fd0 <pic>
c0de675e:	f005 051f 	and.w	r5, r5, #31
c0de6762:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de6766:	f3c0 018b 	ubfx	r1, r0, #2, #12
c0de676a:	68b8      	ldr	r0, [r7, #8]
c0de676c:	4421      	add	r1, r4
c0de676e:	9112      	str	r1, [sp, #72]	@ 0x48
c0de6770:	f001 fc2e 	bl	c0de7fd0 <pic>
c0de6774:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de6778:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de677a:	f3c0 3484 	ubfx	r4, r0, #14, #5
c0de677e:	7970      	ldrb	r0, [r6, #5]
c0de6780:	7979      	ldrb	r1, [r7, #5]
c0de6782:	f897 e004 	ldrb.w	lr, [r7, #4]
c0de6786:	4410      	add	r0, r2
c0de6788:	e9dd c70d 	ldrd	ip, r7, [sp, #52]	@ 0x34
c0de678c:	1a42      	subs	r2, r0, r1
c0de678e:	4643      	mov	r3, r8
c0de6790:	e7ac      	b.n	c0de66ec <bagl_draw_string+0x98>
c0de6792:	68b0      	ldr	r0, [r6, #8]
c0de6794:	f001 fc1c 	bl	c0de7fd0 <pic>
c0de6798:	eb00 0087 	add.w	r0, r0, r7, lsl #2
c0de679c:	6840      	ldr	r0, [r0, #4]
c0de679e:	f3c0 048b 	ubfx	r4, r0, #2, #12
c0de67a2:	f3c5 018b 	ubfx	r1, r5, #2, #12
c0de67a6:	68b0      	ldr	r0, [r6, #8]
c0de67a8:	4441      	add	r1, r8
c0de67aa:	9112      	str	r1, [sp, #72]	@ 0x48
c0de67ac:	f001 fc10 	bl	c0de7fd0 <pic>
c0de67b0:	f850 0027 	ldr.w	r0, [r0, r7, lsl #2]
c0de67b4:	f3c0 008b 	ubfx	r0, r0, #2, #12
c0de67b8:	1a21      	subs	r1, r4, r0
c0de67ba:	68b0      	ldr	r0, [r6, #8]
c0de67bc:	00cd      	lsls	r5, r1, #3
c0de67be:	f001 fc07 	bl	c0de7fd0 <pic>
c0de67c2:	f850 1027 	ldr.w	r1, [r0, r7, lsl #2]
c0de67c6:	68b0      	ldr	r0, [r6, #8]
c0de67c8:	f3c1 3184 	ubfx	r1, r1, #14, #5
c0de67cc:	9109      	str	r1, [sp, #36]	@ 0x24
c0de67ce:	f001 fbff 	bl	c0de7fd0 <pic>
c0de67d2:	f850 1027 	ldr.w	r1, [r0, r7, lsl #2]
c0de67d6:	68b0      	ldr	r0, [r6, #8]
c0de67d8:	f3c1 48c3 	ubfx	r8, r1, #19, #4
c0de67dc:	f001 fbf8 	bl	c0de7fd0 <pic>
c0de67e0:	f850 4027 	ldr.w	r4, [r0, r7, lsl #2]
c0de67e4:	68b0      	ldr	r0, [r6, #8]
c0de67e6:	0f21      	lsrs	r1, r4, #28
c0de67e8:	9113      	str	r1, [sp, #76]	@ 0x4c
c0de67ea:	f001 fbf1 	bl	c0de7fd0 <pic>
c0de67ee:	f850 0027 	ldr.w	r0, [r0, r7, lsl #2]
c0de67f2:	7971      	ldrb	r1, [r6, #5]
c0de67f4:	f3c0 50c4 	ubfx	r0, r0, #23, #5
c0de67f8:	1a41      	subs	r1, r0, r1
c0de67fa:	68b0      	ldr	r0, [r6, #8]
c0de67fc:	f101 0b09 	add.w	fp, r1, #9
c0de6800:	f001 fbe6 	bl	c0de7fd0 <pic>
c0de6804:	f850 0027 	ldr.w	r0, [r0, r7, lsl #2]
c0de6808:	9a09      	ldr	r2, [sp, #36]	@ 0x24
c0de680a:	f3c0 40c3 	ubfx	r0, r0, #19, #4
c0de680e:	eb00 7014 	add.w	r0, r0, r4, lsr #28
c0de6812:	1a10      	subs	r0, r2, r0
c0de6814:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de6816:	e9dd c70d 	ldrd	ip, r7, [sp, #52]	@ 0x34
c0de681a:	e9dd e30a 	ldrd	lr, r3, [sp, #40]	@ 0x28
c0de681e:	b2c4      	uxtb	r4, r0
c0de6820:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de6822:	b138      	cbz	r0, c0de6834 <bagl_draw_string+0x1e0>
c0de6824:	2f00      	cmp	r7, #0
c0de6826:	dd2f      	ble.n	c0de6888 <bagl_draw_string+0x234>
c0de6828:	eb08 000c 	add.w	r0, r8, ip
c0de682c:	1901      	adds	r1, r0, r4
c0de682e:	42b9      	cmp	r1, r7
c0de6830:	dd2c      	ble.n	c0de688c <bagl_draw_string+0x238>
c0de6832:	e05a      	b.n	c0de68ea <bagl_draw_string+0x296>
c0de6834:	eb08 000c 	add.w	r0, r8, ip
c0de6838:	4420      	add	r0, r4
c0de683a:	42b8      	cmp	r0, r7
c0de683c:	dd0a      	ble.n	c0de6854 <bagl_draw_string+0x200>
c0de683e:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de6840:	9905      	ldr	r1, [sp, #20]
c0de6842:	320c      	adds	r2, #12
c0de6844:	eb02 000e 	add.w	r0, r2, lr
c0de6848:	4458      	add	r0, fp
c0de684a:	9f08      	ldr	r7, [sp, #32]
c0de684c:	4288      	cmp	r0, r1
c0de684e:	9211      	str	r2, [sp, #68]	@ 0x44
c0de6850:	dd01      	ble.n	c0de6856 <bagl_draw_string+0x202>
c0de6852:	e043      	b.n	c0de68dc <bagl_draw_string+0x288>
c0de6854:	4667      	mov	r7, ip
c0de6856:	9812      	ldr	r0, [sp, #72]	@ 0x48
c0de6858:	461e      	mov	r6, r3
c0de685a:	b1e0      	cbz	r0, c0de6896 <bagl_draw_string+0x242>
c0de685c:	eb02 010b 	add.w	r1, r2, fp
c0de6860:	9a07      	ldr	r2, [sp, #28]
c0de6862:	eb07 0008 	add.w	r0, r7, r8
c0de6866:	9200      	str	r2, [sp, #0]
c0de6868:	aa14      	add	r2, sp, #80	@ 0x50
c0de686a:	9201      	str	r2, [sp, #4]
c0de686c:	9a0f      	ldr	r2, [sp, #60]	@ 0x3c
c0de686e:	b2ad      	uxth	r5, r5
c0de6870:	9202      	str	r2, [sp, #8]
c0de6872:	9a12      	ldr	r2, [sp, #72]	@ 0x48
c0de6874:	4673      	mov	r3, lr
c0de6876:	9203      	str	r2, [sp, #12]
c0de6878:	4622      	mov	r2, r4
c0de687a:	9504      	str	r5, [sp, #16]
c0de687c:	f001 fcce 	bl	c0de821c <bagl_hal_draw_bitmap_within_rect>
c0de6880:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de6884:	d00e      	beq.n	c0de68a4 <bagl_draw_string+0x250>
c0de6886:	e02f      	b.n	c0de68e8 <bagl_draw_string+0x294>
c0de6888:	eb08 000c 	add.w	r0, r8, ip
c0de688c:	9913      	ldr	r1, [sp, #76]	@ 0x4c
c0de688e:	4408      	add	r0, r1
c0de6890:	eb00 0c04 	add.w	ip, r0, r4
c0de6894:	e00e      	b.n	c0de68b4 <bagl_draw_string+0x260>
c0de6896:	9806      	ldr	r0, [sp, #24]
c0de6898:	4639      	mov	r1, r7
c0de689a:	4623      	mov	r3, r4
c0de689c:	f8cd e000 	str.w	lr, [sp]
c0de68a0:	f001 fcd5 	bl	c0de824e <bagl_hal_draw_rect>
c0de68a4:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de68a6:	4633      	mov	r3, r6
c0de68a8:	4440      	add	r0, r8
c0de68aa:	4420      	add	r0, r4
c0de68ac:	eb00 0c07 	add.w	ip, r0, r7
c0de68b0:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0de68b2:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
c0de68b4:	f1ba 0a01 	subs.w	sl, sl, #1
c0de68b8:	f47f af00 	bne.w	c0de66bc <bagl_draw_string+0x68>
c0de68bc:	e00c      	b.n	c0de68d8 <bagl_draw_string+0x284>
c0de68be:	2000      	movs	r0, #0
c0de68c0:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de68c2:	e9dd c70d 	ldrd	ip, r7, [sp, #52]	@ 0x34
c0de68c6:	2400      	movs	r4, #0
c0de68c8:	9012      	str	r0, [sp, #72]	@ 0x48
c0de68ca:	4643      	mov	r3, r8
c0de68cc:	46de      	mov	lr, fp
c0de68ce:	e70d      	b.n	c0de66ec <bagl_draw_string+0x98>
c0de68d0:	f04f 0c00 	mov.w	ip, #0
c0de68d4:	e009      	b.n	c0de68ea <bagl_draw_string+0x296>
c0de68d6:	46a4      	mov	ip, r4
c0de68d8:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de68da:	b930      	cbnz	r0, c0de68ea <bagl_draw_string+0x296>
c0de68dc:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de68de:	fa1f f08c 	uxth.w	r0, ip
c0de68e2:	ea40 4c01 	orr.w	ip, r0, r1, lsl #16
c0de68e6:	e000      	b.n	c0de68ea <bagl_draw_string+0x296>
c0de68e8:	46bc      	mov	ip, r7
c0de68ea:	4660      	mov	r0, ip
c0de68ec:	b024      	add	sp, #144	@ 0x90
c0de68ee:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de68f2:	d4d4      	bmi.n	c0de689e <bagl_draw_string+0x24a>

c0de68f4 <bagl_draw_circle_helper>:
c0de68f4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de68f8:	b098      	sub	sp, #96	@ 0x60
c0de68fa:	9217      	str	r2, [sp, #92]	@ 0x5c
c0de68fc:	9a21      	ldr	r2, [sp, #132]	@ 0x84
c0de68fe:	4607      	mov	r7, r0
c0de6900:	1a9e      	subs	r6, r3, r2
c0de6902:	2a00      	cmp	r2, #0
c0de6904:	4610      	mov	r0, r2
c0de6906:	bf18      	it	ne
c0de6908:	2001      	movne	r0, #1
c0de690a:	2500      	movs	r5, #0
c0de690c:	2e00      	cmp	r6, #0
c0de690e:	9612      	str	r6, [sp, #72]	@ 0x48
c0de6910:	bfc8      	it	gt
c0de6912:	2501      	movgt	r5, #1
c0de6914:	2b00      	cmp	r3, #0
c0de6916:	9313      	str	r3, [sp, #76]	@ 0x4c
c0de6918:	9116      	str	r1, [sp, #88]	@ 0x58
c0de691a:	f100 81c2 	bmi.w	c0de6ca2 <bagl_draw_circle_helper+0x3ae>
c0de691e:	9e13      	ldr	r6, [sp, #76]	@ 0x4c
c0de6920:	9920      	ldr	r1, [sp, #128]	@ 0x80
c0de6922:	4028      	ands	r0, r5
c0de6924:	9015      	str	r0, [sp, #84]	@ 0x54
c0de6926:	f1c6 0001 	rsb	r0, r6, #1
c0de692a:	9011      	str	r0, [sp, #68]	@ 0x44
c0de692c:	f001 0001 	and.w	r0, r1, #1
c0de6930:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6932:	9010      	str	r0, [sp, #64]	@ 0x40
c0de6934:	f001 0002 	and.w	r0, r1, #2
c0de6938:	900c      	str	r0, [sp, #48]	@ 0x30
c0de693a:	1e58      	subs	r0, r3, #1
c0de693c:	9007      	str	r0, [sp, #28]
c0de693e:	f001 0004 	and.w	r0, r1, #4
c0de6942:	900d      	str	r0, [sp, #52]	@ 0x34
c0de6944:	f001 0008 	and.w	r0, r1, #8
c0de6948:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de694a:	f001 0010 	and.w	r0, r1, #16
c0de694e:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de6950:	f001 0020 	and.w	r0, r1, #32
c0de6954:	900a      	str	r0, [sp, #40]	@ 0x28
c0de6956:	f001 0040 	and.w	r0, r1, #64	@ 0x40
c0de695a:	900e      	str	r0, [sp, #56]	@ 0x38
c0de695c:	f001 0080 	and.w	r0, r1, #128	@ 0x80
c0de6960:	9009      	str	r0, [sp, #36]	@ 0x24
c0de6962:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de6964:	1b91      	subs	r1, r2, r6
c0de6966:	4410      	add	r0, r2
c0de6968:	1b80      	subs	r0, r0, r6
c0de696a:	9103      	str	r1, [sp, #12]
c0de696c:	f1c3 0101 	rsb	r1, r3, #1
c0de6970:	e9cd 1005 	strd	r1, r0, [sp, #20]
c0de6974:	3001      	adds	r0, #1
c0de6976:	f04f 0b00 	mov.w	fp, #0
c0de697a:	f04f 31ff 	mov.w	r1, #4294967295	@ 0xffffffff
c0de697e:	f04f 0a01 	mov.w	sl, #1
c0de6982:	f04f 0800 	mov.w	r8, #0
c0de6986:	9004      	str	r0, [sp, #16]
c0de6988:	9708      	str	r7, [sp, #32]
c0de698a:	bf00      	nop
c0de698c:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de698e:	1c4c      	adds	r4, r1, #1
c0de6990:	9114      	str	r1, [sp, #80]	@ 0x50
c0de6992:	b928      	cbnz	r0, c0de69a0 <bagl_draw_circle_helper+0xac>
c0de6994:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de6996:	2800      	cmp	r0, #0
c0de6998:	d053      	beq.n	c0de6a42 <bagl_draw_circle_helper+0x14e>
c0de699a:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de699c:	bb18      	cbnz	r0, c0de69e6 <bagl_draw_circle_helper+0xf2>
c0de699e:	e046      	b.n	c0de6a2e <bagl_draw_circle_helper+0x13a>
c0de69a0:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de69a2:	b3c8      	cbz	r0, c0de6a18 <bagl_draw_circle_helper+0x124>
c0de69a4:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de69a6:	46a2      	mov	sl, r4
c0de69a8:	4408      	add	r0, r1
c0de69aa:	1c45      	adds	r5, r0, #1
c0de69ac:	9807      	ldr	r0, [sp, #28]
c0de69ae:	463c      	mov	r4, r7
c0de69b0:	9f16      	ldr	r7, [sp, #88]	@ 0x58
c0de69b2:	1a33      	subs	r3, r6, r0
c0de69b4:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de69b6:	f04f 0c01 	mov.w	ip, #1
c0de69ba:	4639      	mov	r1, r7
c0de69bc:	462a      	mov	r2, r5
c0de69be:	f8cd c000 	str.w	ip, [sp]
c0de69c2:	f001 fc44 	bl	c0de824e <bagl_hal_draw_rect>
c0de69c6:	9905      	ldr	r1, [sp, #20]
c0de69c8:	19f0      	adds	r0, r6, r7
c0de69ca:	4627      	mov	r7, r4
c0de69cc:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de69ce:	4654      	mov	r4, sl
c0de69d0:	f04f 0a01 	mov.w	sl, #1
c0de69d4:	4401      	add	r1, r0
c0de69d6:	4638      	mov	r0, r7
c0de69d8:	462a      	mov	r2, r5
c0de69da:	f8cd a000 	str.w	sl, [sp]
c0de69de:	f001 fc36 	bl	c0de824e <bagl_hal_draw_rect>
c0de69e2:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de69e4:	b368      	cbz	r0, c0de6a42 <bagl_draw_circle_helper+0x14e>
c0de69e6:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de69e8:	42b0      	cmp	r0, r6
c0de69ea:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de69ec:	eb06 0500 	add.w	r5, r6, r0
c0de69f0:	d00a      	beq.n	c0de6a08 <bagl_draw_circle_helper+0x114>
c0de69f2:	9803      	ldr	r0, [sp, #12]
c0de69f4:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de69f6:	462a      	mov	r2, r5
c0de69f8:	4408      	add	r0, r1
c0de69fa:	1c83      	adds	r3, r0, #2
c0de69fc:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de69fe:	9916      	ldr	r1, [sp, #88]	@ 0x58
c0de6a00:	f8cd a000 	str.w	sl, [sp]
c0de6a04:	f001 fc23 	bl	c0de824e <bagl_hal_draw_rect>
c0de6a08:	9806      	ldr	r0, [sp, #24]
c0de6a0a:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de6a0c:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6a0e:	4408      	add	r0, r1
c0de6a10:	1c81      	adds	r1, r0, #2
c0de6a12:	4638      	mov	r0, r7
c0de6a14:	462a      	mov	r2, r5
c0de6a16:	e010      	b.n	c0de6a3a <bagl_draw_circle_helper+0x146>
c0de6a18:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6a1a:	4633      	mov	r3, r6
c0de6a1c:	1842      	adds	r2, r0, r1
c0de6a1e:	9916      	ldr	r1, [sp, #88]	@ 0x58
c0de6a20:	4638      	mov	r0, r7
c0de6a22:	f8cd a000 	str.w	sl, [sp]
c0de6a26:	f001 fc12 	bl	c0de824e <bagl_hal_draw_rect>
c0de6a2a:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de6a2c:	b148      	cbz	r0, c0de6a42 <bagl_draw_circle_helper+0x14e>
c0de6a2e:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6a30:	9916      	ldr	r1, [sp, #88]	@ 0x58
c0de6a32:	4430      	add	r0, r6
c0de6a34:	1e42      	subs	r2, r0, #1
c0de6a36:	4638      	mov	r0, r7
c0de6a38:	4623      	mov	r3, r4
c0de6a3a:	f8cd a000 	str.w	sl, [sp]
c0de6a3e:	f001 fc06 	bl	c0de824e <bagl_hal_draw_rect>
c0de6a42:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de6a44:	b930      	cbnz	r0, c0de6a54 <bagl_draw_circle_helper+0x160>
c0de6a46:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de6a48:	2800      	cmp	r0, #0
c0de6a4a:	d05d      	beq.n	c0de6b08 <bagl_draw_circle_helper+0x214>
c0de6a4c:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de6a4e:	bb30      	cbnz	r0, c0de6a9e <bagl_draw_circle_helper+0x1aa>
c0de6a50:	e038      	b.n	c0de6ac4 <bagl_draw_circle_helper+0x1d0>
c0de6a52:	bf00      	nop
c0de6a54:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de6a56:	2800      	cmp	r0, #0
c0de6a58:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de6a5a:	eba0 0506 	sub.w	r5, r0, r6
c0de6a5e:	d025      	beq.n	c0de6aac <bagl_draw_circle_helper+0x1b8>
c0de6a60:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6a62:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de6a64:	f8dd a01c 	ldr.w	sl, [sp, #28]
c0de6a68:	4408      	add	r0, r1
c0de6a6a:	1c47      	adds	r7, r0, #1
c0de6a6c:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de6a6e:	f04f 0c01 	mov.w	ip, #1
c0de6a72:	eba6 030a 	sub.w	r3, r6, sl
c0de6a76:	4629      	mov	r1, r5
c0de6a78:	463a      	mov	r2, r7
c0de6a7a:	f8cd c000 	str.w	ip, [sp]
c0de6a7e:	f001 fbe6 	bl	c0de824e <bagl_hal_draw_rect>
c0de6a82:	9808      	ldr	r0, [sp, #32]
c0de6a84:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6a86:	eba5 010a 	sub.w	r1, r5, sl
c0de6a8a:	f04f 0a01 	mov.w	sl, #1
c0de6a8e:	463a      	mov	r2, r7
c0de6a90:	9f08      	ldr	r7, [sp, #32]
c0de6a92:	f8cd a000 	str.w	sl, [sp]
c0de6a96:	f001 fbda 	bl	c0de824e <bagl_hal_draw_rect>
c0de6a9a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de6a9c:	b3a0      	cbz	r0, c0de6b08 <bagl_draw_circle_helper+0x214>
c0de6a9e:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de6aa0:	42b0      	cmp	r0, r6
c0de6aa2:	d118      	bne.n	c0de6ad6 <bagl_draw_circle_helper+0x1e2>
c0de6aa4:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6aa6:	1835      	adds	r5, r6, r0
c0de6aa8:	e024      	b.n	c0de6af4 <bagl_draw_circle_helper+0x200>
c0de6aaa:	bf00      	nop
c0de6aac:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6aae:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de6ab0:	4633      	mov	r3, r6
c0de6ab2:	1842      	adds	r2, r0, r1
c0de6ab4:	4638      	mov	r0, r7
c0de6ab6:	4629      	mov	r1, r5
c0de6ab8:	f8cd a000 	str.w	sl, [sp]
c0de6abc:	f001 fbc7 	bl	c0de824e <bagl_hal_draw_rect>
c0de6ac0:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de6ac2:	b308      	cbz	r0, c0de6b08 <bagl_draw_circle_helper+0x214>
c0de6ac4:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de6ac6:	4623      	mov	r3, r4
c0de6ac8:	eb00 010b 	add.w	r1, r0, fp
c0de6acc:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6ace:	4430      	add	r0, r6
c0de6ad0:	1e42      	subs	r2, r0, #1
c0de6ad2:	4638      	mov	r0, r7
c0de6ad4:	e014      	b.n	c0de6b00 <bagl_draw_circle_helper+0x20c>
c0de6ad6:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de6ad8:	9a14      	ldr	r2, [sp, #80]	@ 0x50
c0de6ada:	eb00 010b 	add.w	r1, r0, fp
c0de6ade:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6ae0:	f8cd a000 	str.w	sl, [sp]
c0de6ae4:	1835      	adds	r5, r6, r0
c0de6ae6:	9803      	ldr	r0, [sp, #12]
c0de6ae8:	4410      	add	r0, r2
c0de6aea:	1c83      	adds	r3, r0, #2
c0de6aec:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de6aee:	462a      	mov	r2, r5
c0de6af0:	f001 fbad 	bl	c0de824e <bagl_hal_draw_rect>
c0de6af4:	9804      	ldr	r0, [sp, #16]
c0de6af6:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6af8:	eb00 010b 	add.w	r1, r0, fp
c0de6afc:	4638      	mov	r0, r7
c0de6afe:	462a      	mov	r2, r5
c0de6b00:	f8cd a000 	str.w	sl, [sp]
c0de6b04:	f001 fba3 	bl	c0de824e <bagl_hal_draw_rect>
c0de6b08:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de6b0a:	b928      	cbnz	r0, c0de6b18 <bagl_draw_circle_helper+0x224>
c0de6b0c:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de6b0e:	2800      	cmp	r0, #0
c0de6b10:	d055      	beq.n	c0de6bbe <bagl_draw_circle_helper+0x2ca>
c0de6b12:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de6b14:	bb28      	cbnz	r0, c0de6b62 <bagl_draw_circle_helper+0x26e>
c0de6b16:	e049      	b.n	c0de6bac <bagl_draw_circle_helper+0x2b8>
c0de6b18:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de6b1a:	f8dd a05c 	ldr.w	sl, [sp, #92]	@ 0x5c
c0de6b1e:	44da      	add	sl, fp
c0de6b20:	b3c0      	cbz	r0, c0de6b94 <bagl_draw_circle_helper+0x2a0>
c0de6b22:	9807      	ldr	r0, [sp, #28]
c0de6b24:	f8cd 8008 	str.w	r8, [sp, #8]
c0de6b28:	46a0      	mov	r8, r4
c0de6b2a:	463c      	mov	r4, r7
c0de6b2c:	9f16      	ldr	r7, [sp, #88]	@ 0x58
c0de6b2e:	1a33      	subs	r3, r6, r0
c0de6b30:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de6b32:	4639      	mov	r1, r7
c0de6b34:	4652      	mov	r2, sl
c0de6b36:	2501      	movs	r5, #1
c0de6b38:	9500      	str	r5, [sp, #0]
c0de6b3a:	f001 fb88 	bl	c0de824e <bagl_hal_draw_rect>
c0de6b3e:	9905      	ldr	r1, [sp, #20]
c0de6b40:	19f0      	adds	r0, r6, r7
c0de6b42:	4627      	mov	r7, r4
c0de6b44:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6b46:	4644      	mov	r4, r8
c0de6b48:	f8dd 8008 	ldr.w	r8, [sp, #8]
c0de6b4c:	4401      	add	r1, r0
c0de6b4e:	4638      	mov	r0, r7
c0de6b50:	4652      	mov	r2, sl
c0de6b52:	f04f 0a01 	mov.w	sl, #1
c0de6b56:	f8cd a000 	str.w	sl, [sp]
c0de6b5a:	f001 fb78 	bl	c0de824e <bagl_hal_draw_rect>
c0de6b5e:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de6b60:	b368      	cbz	r0, c0de6bbe <bagl_draw_circle_helper+0x2ca>
c0de6b62:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de6b64:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de6b66:	42b0      	cmp	r0, r6
c0de6b68:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6b6a:	eba0 0506 	sub.w	r5, r0, r6
c0de6b6e:	d00a      	beq.n	c0de6b86 <bagl_draw_circle_helper+0x292>
c0de6b70:	9803      	ldr	r0, [sp, #12]
c0de6b72:	462a      	mov	r2, r5
c0de6b74:	4408      	add	r0, r1
c0de6b76:	1c83      	adds	r3, r0, #2
c0de6b78:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de6b7a:	9916      	ldr	r1, [sp, #88]	@ 0x58
c0de6b7c:	f8cd a000 	str.w	sl, [sp]
c0de6b80:	f001 fb65 	bl	c0de824e <bagl_hal_draw_rect>
c0de6b84:	9914      	ldr	r1, [sp, #80]	@ 0x50
c0de6b86:	9806      	ldr	r0, [sp, #24]
c0de6b88:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6b8a:	4408      	add	r0, r1
c0de6b8c:	1c81      	adds	r1, r0, #2
c0de6b8e:	4638      	mov	r0, r7
c0de6b90:	462a      	mov	r2, r5
c0de6b92:	e010      	b.n	c0de6bb6 <bagl_draw_circle_helper+0x2c2>
c0de6b94:	9916      	ldr	r1, [sp, #88]	@ 0x58
c0de6b96:	4638      	mov	r0, r7
c0de6b98:	4652      	mov	r2, sl
c0de6b9a:	4633      	mov	r3, r6
c0de6b9c:	f04f 0a01 	mov.w	sl, #1
c0de6ba0:	f8cd a000 	str.w	sl, [sp]
c0de6ba4:	f001 fb53 	bl	c0de824e <bagl_hal_draw_rect>
c0de6ba8:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de6baa:	b140      	cbz	r0, c0de6bbe <bagl_draw_circle_helper+0x2ca>
c0de6bac:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6bae:	9916      	ldr	r1, [sp, #88]	@ 0x58
c0de6bb0:	1b82      	subs	r2, r0, r6
c0de6bb2:	4638      	mov	r0, r7
c0de6bb4:	4623      	mov	r3, r4
c0de6bb6:	f8cd a000 	str.w	sl, [sp]
c0de6bba:	f001 fb48 	bl	c0de824e <bagl_hal_draw_rect>
c0de6bbe:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de6bc0:	b930      	cbnz	r0, c0de6bd0 <bagl_draw_circle_helper+0x2dc>
c0de6bc2:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de6bc4:	2800      	cmp	r0, #0
c0de6bc6:	d057      	beq.n	c0de6c78 <bagl_draw_circle_helper+0x384>
c0de6bc8:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de6bca:	bb18      	cbnz	r0, c0de6c14 <bagl_draw_circle_helper+0x320>
c0de6bcc:	e033      	b.n	c0de6c36 <bagl_draw_circle_helper+0x342>
c0de6bce:	bf00      	nop
c0de6bd0:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de6bd2:	1b87      	subs	r7, r0, r6
c0de6bd4:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de6bd6:	2800      	cmp	r0, #0
c0de6bd8:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6bda:	eb00 050b 	add.w	r5, r0, fp
c0de6bde:	d01f      	beq.n	c0de6c20 <bagl_draw_circle_helper+0x32c>
c0de6be0:	46a2      	mov	sl, r4
c0de6be2:	9c07      	ldr	r4, [sp, #28]
c0de6be4:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de6be6:	f04f 0c01 	mov.w	ip, #1
c0de6bea:	1b33      	subs	r3, r6, r4
c0de6bec:	4639      	mov	r1, r7
c0de6bee:	462a      	mov	r2, r5
c0de6bf0:	f8cd c000 	str.w	ip, [sp]
c0de6bf4:	f001 fb2b 	bl	c0de824e <bagl_hal_draw_rect>
c0de6bf8:	1b39      	subs	r1, r7, r4
c0de6bfa:	9f08      	ldr	r7, [sp, #32]
c0de6bfc:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6bfe:	4654      	mov	r4, sl
c0de6c00:	f04f 0a01 	mov.w	sl, #1
c0de6c04:	4638      	mov	r0, r7
c0de6c06:	462a      	mov	r2, r5
c0de6c08:	f8cd a000 	str.w	sl, [sp]
c0de6c0c:	f001 fb1f 	bl	c0de824e <bagl_hal_draw_rect>
c0de6c10:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de6c12:	b388      	cbz	r0, c0de6c78 <bagl_draw_circle_helper+0x384>
c0de6c14:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de6c16:	42b0      	cmp	r0, r6
c0de6c18:	d115      	bne.n	c0de6c46 <bagl_draw_circle_helper+0x352>
c0de6c1a:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6c1c:	1b85      	subs	r5, r0, r6
c0de6c1e:	e021      	b.n	c0de6c64 <bagl_draw_circle_helper+0x370>
c0de6c20:	9808      	ldr	r0, [sp, #32]
c0de6c22:	4639      	mov	r1, r7
c0de6c24:	462a      	mov	r2, r5
c0de6c26:	4633      	mov	r3, r6
c0de6c28:	4607      	mov	r7, r0
c0de6c2a:	f8cd a000 	str.w	sl, [sp]
c0de6c2e:	f001 fb0e 	bl	c0de824e <bagl_hal_draw_rect>
c0de6c32:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de6c34:	b300      	cbz	r0, c0de6c78 <bagl_draw_circle_helper+0x384>
c0de6c36:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de6c38:	4623      	mov	r3, r4
c0de6c3a:	eb00 010b 	add.w	r1, r0, fp
c0de6c3e:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6c40:	1b82      	subs	r2, r0, r6
c0de6c42:	4638      	mov	r0, r7
c0de6c44:	e014      	b.n	c0de6c70 <bagl_draw_circle_helper+0x37c>
c0de6c46:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de6c48:	9a14      	ldr	r2, [sp, #80]	@ 0x50
c0de6c4a:	eb00 010b 	add.w	r1, r0, fp
c0de6c4e:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de6c50:	f8cd a000 	str.w	sl, [sp]
c0de6c54:	1b85      	subs	r5, r0, r6
c0de6c56:	9803      	ldr	r0, [sp, #12]
c0de6c58:	4410      	add	r0, r2
c0de6c5a:	1c83      	adds	r3, r0, #2
c0de6c5c:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de6c5e:	462a      	mov	r2, r5
c0de6c60:	f001 faf5 	bl	c0de824e <bagl_hal_draw_rect>
c0de6c64:	9804      	ldr	r0, [sp, #16]
c0de6c66:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de6c68:	eb00 010b 	add.w	r1, r0, fp
c0de6c6c:	4638      	mov	r0, r7
c0de6c6e:	462a      	mov	r2, r5
c0de6c70:	f8cd a000 	str.w	sl, [sp]
c0de6c74:	f001 faeb 	bl	c0de824e <bagl_hal_draw_rect>
c0de6c78:	f108 0801 	add.w	r8, r8, #1
c0de6c7c:	9a11      	ldr	r2, [sp, #68]	@ 0x44
c0de6c7e:	1e70      	subs	r0, r6, #1
c0de6c80:	4641      	mov	r1, r8
c0de6c82:	2a01      	cmp	r2, #1
c0de6c84:	bfac      	ite	ge
c0de6c86:	1a09      	subge	r1, r1, r0
c0de6c88:	4630      	movlt	r0, r6
c0de6c8a:	eb02 0141 	add.w	r1, r2, r1, lsl #1
c0de6c8e:	3101      	adds	r1, #1
c0de6c90:	9111      	str	r1, [sp, #68]	@ 0x44
c0de6c92:	f1ab 0b01 	sub.w	fp, fp, #1
c0de6c96:	4284      	cmp	r4, r0
c0de6c98:	4621      	mov	r1, r4
c0de6c9a:	9613      	str	r6, [sp, #76]	@ 0x4c
c0de6c9c:	4606      	mov	r6, r0
c0de6c9e:	f6ff ae75 	blt.w	c0de698c <bagl_draw_circle_helper+0x98>
c0de6ca2:	b018      	add	sp, #96	@ 0x60
c0de6ca4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de6ca8 <bagl_draw_glyph>:
c0de6ca8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6cac:	b088      	sub	sp, #32
c0de6cae:	460c      	mov	r4, r1
c0de6cb0:	6889      	ldr	r1, [r1, #8]
c0de6cb2:	2902      	cmp	r1, #2
c0de6cb4:	d826      	bhi.n	c0de6d04 <bagl_draw_glyph+0x5c>
c0de6cb6:	f9b0 2002 	ldrsh.w	r2, [r0, #2]
c0de6cba:	f9b0 0004 	ldrsh.w	r0, [r0, #4]
c0de6cbe:	9207      	str	r2, [sp, #28]
c0de6cc0:	9006      	str	r0, [sp, #24]
c0de6cc2:	68e0      	ldr	r0, [r4, #12]
c0de6cc4:	2201      	movs	r2, #1
c0de6cc6:	e9d4 b700 	ldrd	fp, r7, [r4]
c0de6cca:	fa02 f801 	lsl.w	r8, r2, r1
c0de6cce:	f001 f97f 	bl	c0de7fd0 <pic>
c0de6cd2:	6921      	ldr	r1, [r4, #16]
c0de6cd4:	f8d4 a008 	ldr.w	sl, [r4, #8]
c0de6cd8:	4605      	mov	r5, r0
c0de6cda:	4608      	mov	r0, r1
c0de6cdc:	f001 f978 	bl	c0de7fd0 <pic>
c0de6ce0:	4606      	mov	r6, r0
c0de6ce2:	68a1      	ldr	r1, [r4, #8]
c0de6ce4:	e9d4 0200 	ldrd	r0, r2, [r4]
c0de6ce8:	463b      	mov	r3, r7
c0de6cea:	4348      	muls	r0, r1
c0de6cec:	4350      	muls	r0, r2
c0de6cee:	9004      	str	r0, [sp, #16]
c0de6cf0:	e9dd 1006 	ldrd	r1, r0, [sp, #24]
c0de6cf4:	465a      	mov	r2, fp
c0de6cf6:	e9cd 8500 	strd	r8, r5, [sp]
c0de6cfa:	f8cd a008 	str.w	sl, [sp, #8]
c0de6cfe:	9603      	str	r6, [sp, #12]
c0de6d00:	f001 fa8c 	bl	c0de821c <bagl_hal_draw_bitmap_within_rect>
c0de6d04:	b008      	add	sp, #32
c0de6d06:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de6d0a <ux_flow_is_first>:
c0de6d0a:	f240 41d8 	movw	r1, #1240	@ 0x4d8
c0de6d0e:	f2c0 0100 	movt	r1, #0
c0de6d12:	f819 0001 	ldrb.w	r0, [r9, r1]
c0de6d16:	2801      	cmp	r0, #1
c0de6d18:	d823      	bhi.n	c0de6d62 <ux_flow_is_first+0x58>
c0de6d1a:	3801      	subs	r0, #1
c0de6d1c:	eb09 0201 	add.w	r2, r9, r1
c0de6d20:	eb00 0340 	add.w	r3, r0, r0, lsl #1
c0de6d24:	eb02 0083 	add.w	r0, r2, r3, lsl #2
c0de6d28:	8c80      	ldrh	r0, [r0, #36]	@ 0x24
c0de6d2a:	b1d0      	cbz	r0, c0de6d62 <ux_flow_is_first+0x58>
c0de6d2c:	eb09 0201 	add.w	r2, r9, r1
c0de6d30:	eb02 0283 	add.w	r2, r2, r3, lsl #2
c0de6d34:	69d2      	ldr	r2, [r2, #28]
c0de6d36:	b1a2      	cbz	r2, c0de6d62 <ux_flow_is_first+0x58>
c0de6d38:	4449      	add	r1, r9
c0de6d3a:	eb01 0183 	add.w	r1, r1, r3, lsl #2
c0de6d3e:	8c09      	ldrh	r1, [r1, #32]
c0de6d40:	b929      	cbnz	r1, c0de6d4e <ux_flow_is_first+0x44>
c0de6d42:	eb02 0380 	add.w	r3, r2, r0, lsl #2
c0de6d46:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de6d4a:	3303      	adds	r3, #3
c0de6d4c:	d109      	bne.n	c0de6d62 <ux_flow_is_first+0x58>
c0de6d4e:	4281      	cmp	r1, r0
c0de6d50:	d205      	bcs.n	c0de6d5e <ux_flow_is_first+0x54>
c0de6d52:	eb02 0081 	add.w	r0, r2, r1, lsl #2
c0de6d56:	f850 0c04 	ldr.w	r0, [r0, #-4]
c0de6d5a:	3002      	adds	r0, #2
c0de6d5c:	d001      	beq.n	c0de6d62 <ux_flow_is_first+0x58>
c0de6d5e:	2000      	movs	r0, #0
c0de6d60:	4770      	bx	lr
c0de6d62:	2001      	movs	r0, #1
c0de6d64:	4770      	bx	lr

c0de6d66 <ux_flow_is_last>:
c0de6d66:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de6d6a:	f2c0 0000 	movt	r0, #0
c0de6d6e:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de6d72:	2901      	cmp	r1, #1
c0de6d74:	d81f      	bhi.n	c0de6db6 <ux_flow_is_last+0x50>
c0de6d76:	3901      	subs	r1, #1
c0de6d78:	eb09 0200 	add.w	r2, r9, r0
c0de6d7c:	eb01 0341 	add.w	r3, r1, r1, lsl #1
c0de6d80:	eb02 0183 	add.w	r1, r2, r3, lsl #2
c0de6d84:	8c89      	ldrh	r1, [r1, #36]	@ 0x24
c0de6d86:	b1b1      	cbz	r1, c0de6db6 <ux_flow_is_last+0x50>
c0de6d88:	eb09 0200 	add.w	r2, r9, r0
c0de6d8c:	eb02 0283 	add.w	r2, r2, r3, lsl #2
c0de6d90:	69d2      	ldr	r2, [r2, #28]
c0de6d92:	b182      	cbz	r2, c0de6db6 <ux_flow_is_last+0x50>
c0de6d94:	4448      	add	r0, r9
c0de6d96:	eb00 0083 	add.w	r0, r0, r3, lsl #2
c0de6d9a:	8c00      	ldrh	r0, [r0, #32]
c0de6d9c:	1e4b      	subs	r3, r1, #1
c0de6d9e:	4283      	cmp	r3, r0
c0de6da0:	d909      	bls.n	c0de6db6 <ux_flow_is_last+0x50>
c0de6da2:	3902      	subs	r1, #2
c0de6da4:	4281      	cmp	r1, r0
c0de6da6:	d904      	bls.n	c0de6db2 <ux_flow_is_last+0x4c>
c0de6da8:	eb02 0080 	add.w	r0, r2, r0, lsl #2
c0de6dac:	6840      	ldr	r0, [r0, #4]
c0de6dae:	3002      	adds	r0, #2
c0de6db0:	d001      	beq.n	c0de6db6 <ux_flow_is_last+0x50>
c0de6db2:	2000      	movs	r0, #0
c0de6db4:	4770      	bx	lr
c0de6db6:	2001      	movs	r0, #1
c0de6db8:	4770      	bx	lr

c0de6dba <ux_flow_direction>:
c0de6dba:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de6dbe:	f2c0 0000 	movt	r0, #0
c0de6dc2:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de6dc6:	b169      	cbz	r1, c0de6de4 <ux_flow_direction+0x2a>
c0de6dc8:	eb01 0141 	add.w	r1, r1, r1, lsl #1
c0de6dcc:	4448      	add	r0, r9
c0de6dce:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de6dd2:	8a81      	ldrh	r1, [r0, #20]
c0de6dd4:	8ac0      	ldrh	r0, [r0, #22]
c0de6dd6:	4281      	cmp	r1, r0
c0de6dd8:	d901      	bls.n	c0de6dde <ux_flow_direction+0x24>
c0de6dda:	2001      	movs	r0, #1
c0de6ddc:	e003      	b.n	c0de6de6 <ux_flow_direction+0x2c>
c0de6dde:	d201      	bcs.n	c0de6de4 <ux_flow_direction+0x2a>
c0de6de0:	20ff      	movs	r0, #255	@ 0xff
c0de6de2:	e000      	b.n	c0de6de6 <ux_flow_direction+0x2c>
c0de6de4:	2000      	movs	r0, #0
c0de6de6:	b240      	sxtb	r0, r0
c0de6de8:	4770      	bx	lr

c0de6dea <ux_flow_get_current>:
c0de6dea:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de6dee:	f2c0 0000 	movt	r0, #0
c0de6df2:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de6df6:	2901      	cmp	r1, #1
c0de6df8:	d81b      	bhi.n	c0de6e32 <ux_flow_get_current+0x48>
c0de6dfa:	3901      	subs	r1, #1
c0de6dfc:	eb09 0200 	add.w	r2, r9, r0
c0de6e00:	eb01 0141 	add.w	r1, r1, r1, lsl #1
c0de6e04:	eb02 0281 	add.w	r2, r2, r1, lsl #2
c0de6e08:	8c92      	ldrh	r2, [r2, #36]	@ 0x24
c0de6e0a:	b192      	cbz	r2, c0de6e32 <ux_flow_get_current+0x48>
c0de6e0c:	eb09 0300 	add.w	r3, r9, r0
c0de6e10:	eb03 0381 	add.w	r3, r3, r1, lsl #2
c0de6e14:	69db      	ldr	r3, [r3, #28]
c0de6e16:	b163      	cbz	r3, c0de6e32 <ux_flow_get_current+0x48>
c0de6e18:	4448      	add	r0, r9
c0de6e1a:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de6e1e:	8c00      	ldrh	r0, [r0, #32]
c0de6e20:	4290      	cmp	r0, r2
c0de6e22:	d206      	bcs.n	c0de6e32 <ux_flow_get_current+0x48>
c0de6e24:	f853 0020 	ldr.w	r0, [r3, r0, lsl #2]
c0de6e28:	f110 0f04 	cmn.w	r0, #4
c0de6e2c:	bf98      	it	ls
c0de6e2e:	f001 b8cf 	bls.w	c0de7fd0 <pic>
c0de6e32:	2000      	movs	r0, #0
c0de6e34:	4770      	bx	lr

c0de6e36 <ux_flow_next_internal>:
c0de6e36:	b570      	push	{r4, r5, r6, lr}
c0de6e38:	f240 42d8 	movw	r2, #1240	@ 0x4d8
c0de6e3c:	f2c0 0200 	movt	r2, #0
c0de6e40:	f819 1002 	ldrb.w	r1, [r9, r2]
c0de6e44:	f1b1 0e01 	subs.w	lr, r1, #1
c0de6e48:	d83a      	bhi.n	c0de6ec0 <ux_flow_next_internal+0x8a>
c0de6e4a:	eb09 0102 	add.w	r1, r9, r2
c0de6e4e:	eb0e 034e 	add.w	r3, lr, lr, lsl #1
c0de6e52:	eb01 0183 	add.w	r1, r1, r3, lsl #2
c0de6e56:	8c89      	ldrh	r1, [r1, #36]	@ 0x24
c0de6e58:	b391      	cbz	r1, c0de6ec0 <ux_flow_next_internal+0x8a>
c0de6e5a:	eb09 0502 	add.w	r5, r9, r2
c0de6e5e:	eb05 0583 	add.w	r5, r5, r3, lsl #2
c0de6e62:	69ed      	ldr	r5, [r5, #28]
c0de6e64:	b365      	cbz	r5, c0de6ec0 <ux_flow_next_internal+0x8a>
c0de6e66:	2902      	cmp	r1, #2
c0de6e68:	d32a      	bcc.n	c0de6ec0 <ux_flow_next_internal+0x8a>
c0de6e6a:	eb09 0402 	add.w	r4, r9, r2
c0de6e6e:	eb04 0c83 	add.w	ip, r4, r3, lsl #2
c0de6e72:	f83c 4f20 	ldrh.w	r4, [ip, #32]!
c0de6e76:	1e4e      	subs	r6, r1, #1
c0de6e78:	42a6      	cmp	r6, r4
c0de6e7a:	d921      	bls.n	c0de6ec0 <ux_flow_next_internal+0x8a>
c0de6e7c:	3902      	subs	r1, #2
c0de6e7e:	42a1      	cmp	r1, r4
c0de6e80:	d310      	bcc.n	c0de6ea4 <ux_flow_next_internal+0x6e>
c0de6e82:	eb05 0184 	add.w	r1, r5, r4, lsl #2
c0de6e86:	6849      	ldr	r1, [r1, #4]
c0de6e88:	1c8d      	adds	r5, r1, #2
c0de6e8a:	bf08      	it	eq
c0de6e8c:	bd70      	popeq	{r4, r5, r6, pc}
c0de6e8e:	3103      	adds	r1, #3
c0de6e90:	d108      	bne.n	c0de6ea4 <ux_flow_next_internal+0x6e>
c0de6e92:	eb09 0102 	add.w	r1, r9, r2
c0de6e96:	2000      	movs	r0, #0
c0de6e98:	eb01 0183 	add.w	r1, r1, r3, lsl #2
c0de6e9c:	f8ac 0000 	strh.w	r0, [ip]
c0de6ea0:	8448      	strh	r0, [r1, #34]	@ 0x22
c0de6ea2:	e008      	b.n	c0de6eb6 <ux_flow_next_internal+0x80>
c0de6ea4:	eb09 0102 	add.w	r1, r9, r2
c0de6ea8:	eb01 0183 	add.w	r1, r1, r3, lsl #2
c0de6eac:	844c      	strh	r4, [r1, #34]	@ 0x22
c0de6eae:	1c61      	adds	r1, r4, #1
c0de6eb0:	f8ac 1000 	strh.w	r1, [ip]
c0de6eb4:	b120      	cbz	r0, c0de6ec0 <ux_flow_next_internal+0x8a>
c0de6eb6:	4670      	mov	r0, lr
c0de6eb8:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de6ebc:	f000 b849 	b.w	c0de6f52 <ux_flow_engine_init_step>
c0de6ec0:	bd70      	pop	{r4, r5, r6, pc}

c0de6ec2 <ux_flow_next>:
c0de6ec2:	2001      	movs	r0, #1
c0de6ec4:	f7ff bfb7 	b.w	c0de6e36 <ux_flow_next_internal>

c0de6ec8 <ux_flow_prev>:
c0de6ec8:	b510      	push	{r4, lr}
c0de6eca:	f240 41d8 	movw	r1, #1240	@ 0x4d8
c0de6ece:	f2c0 0100 	movt	r1, #0
c0de6ed2:	f819 0001 	ldrb.w	r0, [r9, r1]
c0de6ed6:	3801      	subs	r0, #1
c0de6ed8:	d812      	bhi.n	c0de6f00 <ux_flow_prev+0x38>
c0de6eda:	eb09 0301 	add.w	r3, r9, r1
c0de6ede:	eb00 0240 	add.w	r2, r0, r0, lsl #1
c0de6ee2:	eb03 0382 	add.w	r3, r3, r2, lsl #2
c0de6ee6:	8c9b      	ldrh	r3, [r3, #36]	@ 0x24
c0de6ee8:	b153      	cbz	r3, c0de6f00 <ux_flow_prev+0x38>
c0de6eea:	eb09 0401 	add.w	r4, r9, r1
c0de6eee:	eb04 0482 	add.w	r4, r4, r2, lsl #2
c0de6ef2:	f8d4 e01c 	ldr.w	lr, [r4, #28]
c0de6ef6:	f1be 0f00 	cmp.w	lr, #0
c0de6efa:	d001      	beq.n	c0de6f00 <ux_flow_prev+0x38>
c0de6efc:	2b02      	cmp	r3, #2
c0de6efe:	d200      	bcs.n	c0de6f02 <ux_flow_prev+0x3a>
c0de6f00:	bd10      	pop	{r4, pc}
c0de6f02:	eb09 0401 	add.w	r4, r9, r1
c0de6f06:	eb04 0c82 	add.w	ip, r4, r2, lsl #2
c0de6f0a:	f83c 4f20 	ldrh.w	r4, [ip, #32]!
c0de6f0e:	b18c      	cbz	r4, c0de6f34 <ux_flow_prev+0x6c>
c0de6f10:	eb0e 0384 	add.w	r3, lr, r4, lsl #2
c0de6f14:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de6f18:	3302      	adds	r3, #2
c0de6f1a:	bf08      	it	eq
c0de6f1c:	bd10      	popeq	{r4, pc}
c0de6f1e:	4449      	add	r1, r9
c0de6f20:	eb01 0182 	add.w	r1, r1, r2, lsl #2
c0de6f24:	844c      	strh	r4, [r1, #34]	@ 0x22
c0de6f26:	1e61      	subs	r1, r4, #1
c0de6f28:	f8ac 1000 	strh.w	r1, [ip]
c0de6f2c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de6f30:	f000 b80f 	b.w	c0de6f52 <ux_flow_engine_init_step>
c0de6f34:	eb0e 0483 	add.w	r4, lr, r3, lsl #2
c0de6f38:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de6f3c:	3403      	adds	r4, #3
c0de6f3e:	d1df      	bne.n	c0de6f00 <ux_flow_prev+0x38>
c0de6f40:	4449      	add	r1, r9
c0de6f42:	1e9c      	subs	r4, r3, #2
c0de6f44:	3b01      	subs	r3, #1
c0de6f46:	eb01 0182 	add.w	r1, r1, r2, lsl #2
c0de6f4a:	f8ac 4000 	strh.w	r4, [ip]
c0de6f4e:	844b      	strh	r3, [r1, #34]	@ 0x22
c0de6f50:	e7ec      	b.n	c0de6f2c <ux_flow_prev+0x64>

c0de6f52 <ux_flow_engine_init_step>:
c0de6f52:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de6f54:	b081      	sub	sp, #4
c0de6f56:	4604      	mov	r4, r0
c0de6f58:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de6f5c:	f2c0 0000 	movt	r0, #0
c0de6f60:	4448      	add	r0, r9
c0de6f62:	eb04 0144 	add.w	r1, r4, r4, lsl #1
c0de6f66:	eb00 0581 	add.w	r5, r0, r1, lsl #2
c0de6f6a:	f855 0f1c 	ldr.w	r0, [r5, #28]!
c0de6f6e:	462e      	mov	r6, r5
c0de6f70:	f836 1f04 	ldrh.w	r1, [r6, #4]!
c0de6f74:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de6f78:	f110 0f04 	cmn.w	r0, #4
c0de6f7c:	bf84      	itt	hi
c0de6f7e:	b001      	addhi	sp, #4
c0de6f80:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de6f82:	f001 f825 	bl	c0de7fd0 <pic>
c0de6f86:	6829      	ldr	r1, [r5, #0]
c0de6f88:	8832      	ldrh	r2, [r6, #0]
c0de6f8a:	6807      	ldr	r7, [r0, #0]
c0de6f8c:	f851 0022 	ldr.w	r0, [r1, r2, lsl #2]
c0de6f90:	f001 f81e 	bl	c0de7fd0 <pic>
c0de6f94:	b147      	cbz	r7, c0de6fa8 <ux_flow_engine_init_step+0x56>
c0de6f96:	6800      	ldr	r0, [r0, #0]
c0de6f98:	f001 f81a 	bl	c0de7fd0 <pic>
c0de6f9c:	4601      	mov	r1, r0
c0de6f9e:	4620      	mov	r0, r4
c0de6fa0:	b001      	add	sp, #4
c0de6fa2:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de6fa6:	4708      	bx	r1
c0de6fa8:	6880      	ldr	r0, [r0, #8]
c0de6faa:	f001 f811 	bl	c0de7fd0 <pic>
c0de6fae:	6829      	ldr	r1, [r5, #0]
c0de6fb0:	8832      	ldrh	r2, [r6, #0]
c0de6fb2:	4605      	mov	r5, r0
c0de6fb4:	f851 1022 	ldr.w	r1, [r1, r2, lsl #2]
c0de6fb8:	4608      	mov	r0, r1
c0de6fba:	f001 f809 	bl	c0de7fd0 <pic>
c0de6fbe:	6840      	ldr	r0, [r0, #4]
c0de6fc0:	f001 f806 	bl	c0de7fd0 <pic>
c0de6fc4:	4602      	mov	r2, r0
c0de6fc6:	4620      	mov	r0, r4
c0de6fc8:	4629      	mov	r1, r5
c0de6fca:	b001      	add	sp, #4
c0de6fcc:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de6fd0:	f000 b874 	b.w	c0de70bc <ux_flow_init>

c0de6fd4 <ux_flow_validate>:
c0de6fd4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de6fd8:	b081      	sub	sp, #4
c0de6fda:	f240 45d8 	movw	r5, #1240	@ 0x4d8
c0de6fde:	f2c0 0500 	movt	r5, #0
c0de6fe2:	f819 0005 	ldrb.w	r0, [r9, r5]
c0de6fe6:	f1b0 0a01 	subs.w	sl, r0, #1
c0de6fea:	d856      	bhi.n	c0de709a <ux_flow_validate+0xc6>
c0de6fec:	eb09 0005 	add.w	r0, r9, r5
c0de6ff0:	eb0a 064a 	add.w	r6, sl, sl, lsl #1
c0de6ff4:	eb00 0486 	add.w	r4, r0, r6, lsl #2
c0de6ff8:	f834 0f24 	ldrh.w	r0, [r4, #36]!
c0de6ffc:	2800      	cmp	r0, #0
c0de6ffe:	d04c      	beq.n	c0de709a <ux_flow_validate+0xc6>
c0de7000:	eb09 0105 	add.w	r1, r9, r5
c0de7004:	eb01 0786 	add.w	r7, r1, r6, lsl #2
c0de7008:	f857 1f1c 	ldr.w	r1, [r7, #28]!
c0de700c:	2900      	cmp	r1, #0
c0de700e:	d044      	beq.n	c0de709a <ux_flow_validate+0xc6>
c0de7010:	eb09 0205 	add.w	r2, r9, r5
c0de7014:	eb02 0886 	add.w	r8, r2, r6, lsl #2
c0de7018:	f838 2f20 	ldrh.w	r2, [r8, #32]!
c0de701c:	4282      	cmp	r2, r0
c0de701e:	d23c      	bcs.n	c0de709a <ux_flow_validate+0xc6>
c0de7020:	f851 0022 	ldr.w	r0, [r1, r2, lsl #2]
c0de7024:	f000 ffd4 	bl	c0de7fd0 <pic>
c0de7028:	6880      	ldr	r0, [r0, #8]
c0de702a:	b188      	cbz	r0, c0de7050 <ux_flow_validate+0x7c>
c0de702c:	6838      	ldr	r0, [r7, #0]
c0de702e:	f8b8 1000 	ldrh.w	r1, [r8]
c0de7032:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de7036:	f000 ffcb 	bl	c0de7fd0 <pic>
c0de703a:	6880      	ldr	r0, [r0, #8]
c0de703c:	f000 ffc8 	bl	c0de7fd0 <pic>
c0de7040:	4601      	mov	r1, r0
c0de7042:	4650      	mov	r0, sl
c0de7044:	2200      	movs	r2, #0
c0de7046:	b001      	add	sp, #4
c0de7048:	e8bd 45f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de704c:	f000 b836 	b.w	c0de70bc <ux_flow_init>
c0de7050:	8820      	ldrh	r0, [r4, #0]
c0de7052:	b310      	cbz	r0, c0de709a <ux_flow_validate+0xc6>
c0de7054:	f8b8 2000 	ldrh.w	r2, [r8]
c0de7058:	3802      	subs	r0, #2
c0de705a:	4290      	cmp	r0, r2
c0de705c:	db1d      	blt.n	c0de709a <ux_flow_validate+0xc6>
c0de705e:	6839      	ldr	r1, [r7, #0]
c0de7060:	eb01 0382 	add.w	r3, r1, r2, lsl #2
c0de7064:	685b      	ldr	r3, [r3, #4]
c0de7066:	1cdf      	adds	r7, r3, #3
c0de7068:	d01a      	beq.n	c0de70a0 <ux_flow_validate+0xcc>
c0de706a:	3302      	adds	r3, #2
c0de706c:	d115      	bne.n	c0de709a <ux_flow_validate+0xc6>
c0de706e:	4613      	mov	r3, r2
c0de7070:	eb01 0282 	add.w	r2, r1, r2, lsl #2
c0de7074:	6852      	ldr	r2, [r2, #4]
c0de7076:	3202      	adds	r2, #2
c0de7078:	d105      	bne.n	c0de7086 <ux_flow_validate+0xb2>
c0de707a:	3301      	adds	r3, #1
c0de707c:	b29a      	uxth	r2, r3
c0de707e:	4290      	cmp	r0, r2
c0de7080:	f8a8 3000 	strh.w	r3, [r8]
c0de7084:	daf4      	bge.n	c0de7070 <ux_flow_validate+0x9c>
c0de7086:	eb09 0005 	add.w	r0, r9, r5
c0de708a:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0de708e:	8443      	strh	r3, [r0, #34]	@ 0x22
c0de7090:	1c59      	adds	r1, r3, #1
c0de7092:	4650      	mov	r0, sl
c0de7094:	f8a8 1000 	strh.w	r1, [r8]
c0de7098:	e00b      	b.n	c0de70b2 <ux_flow_validate+0xde>
c0de709a:	b001      	add	sp, #4
c0de709c:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de70a0:	eb09 0005 	add.w	r0, r9, r5
c0de70a4:	2100      	movs	r1, #0
c0de70a6:	eb00 0286 	add.w	r2, r0, r6, lsl #2
c0de70aa:	f8a8 1000 	strh.w	r1, [r8]
c0de70ae:	4650      	mov	r0, sl
c0de70b0:	8451      	strh	r1, [r2, #34]	@ 0x22
c0de70b2:	b001      	add	sp, #4
c0de70b4:	e8bd 45f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de70b8:	f7ff bf4b 	b.w	c0de6f52 <ux_flow_engine_init_step>

c0de70bc <ux_flow_init>:
c0de70bc:	b570      	push	{r4, r5, r6, lr}
c0de70be:	b100      	cbz	r0, c0de70c2 <ux_flow_init+0x6>
c0de70c0:	bd70      	pop	{r4, r5, r6, pc}
c0de70c2:	f240 46d8 	movw	r6, #1240	@ 0x4d8
c0de70c6:	f2c0 0600 	movt	r6, #0
c0de70ca:	eb09 0006 	add.w	r0, r9, r6
c0de70ce:	460d      	mov	r5, r1
c0de70d0:	3004      	adds	r0, #4
c0de70d2:	2122      	movs	r1, #34	@ 0x22
c0de70d4:	4614      	mov	r4, r2
c0de70d6:	f001 f9e9 	bl	c0de84ac <__aeabi_memclr>
c0de70da:	2d00      	cmp	r5, #0
c0de70dc:	d0f0      	beq.n	c0de70c0 <ux_flow_init+0x4>
c0de70de:	4628      	mov	r0, r5
c0de70e0:	f000 ff76 	bl	c0de7fd0 <pic>
c0de70e4:	eb09 0206 	add.w	r2, r9, r6
c0de70e8:	8c91      	ldrh	r1, [r2, #36]	@ 0x24
c0de70ea:	61d0      	str	r0, [r2, #28]
c0de70ec:	f850 2021 	ldr.w	r2, [r0, r1, lsl #2]
c0de70f0:	3201      	adds	r2, #1
c0de70f2:	d008      	beq.n	c0de7106 <ux_flow_init+0x4a>
c0de70f4:	3101      	adds	r1, #1
c0de70f6:	b28a      	uxth	r2, r1
c0de70f8:	f850 2022 	ldr.w	r2, [r0, r2, lsl #2]
c0de70fc:	3201      	adds	r2, #1
c0de70fe:	d1f9      	bne.n	c0de70f4 <ux_flow_init+0x38>
c0de7100:	eb09 0006 	add.w	r0, r9, r6
c0de7104:	8481      	strh	r1, [r0, #36]	@ 0x24
c0de7106:	b1e4      	cbz	r4, c0de7142 <ux_flow_init+0x86>
c0de7108:	4620      	mov	r0, r4
c0de710a:	f000 ff61 	bl	c0de7fd0 <pic>
c0de710e:	eb09 0106 	add.w	r1, r9, r6
c0de7112:	69ca      	ldr	r2, [r1, #28]
c0de7114:	8c09      	ldrh	r1, [r1, #32]
c0de7116:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de711a:	1c4a      	adds	r2, r1, #1
c0de711c:	d011      	beq.n	c0de7142 <ux_flow_init+0x86>
c0de711e:	4604      	mov	r4, r0
c0de7120:	4608      	mov	r0, r1
c0de7122:	f000 ff55 	bl	c0de7fd0 <pic>
c0de7126:	42a0      	cmp	r0, r4
c0de7128:	d00b      	beq.n	c0de7142 <ux_flow_init+0x86>
c0de712a:	eb09 0006 	add.w	r0, r9, r6
c0de712e:	8c02      	ldrh	r2, [r0, #32]
c0de7130:	69c1      	ldr	r1, [r0, #28]
c0de7132:	1c53      	adds	r3, r2, #1
c0de7134:	b29d      	uxth	r5, r3
c0de7136:	f851 1025 	ldr.w	r1, [r1, r5, lsl #2]
c0de713a:	8442      	strh	r2, [r0, #34]	@ 0x22
c0de713c:	1c4a      	adds	r2, r1, #1
c0de713e:	8403      	strh	r3, [r0, #32]
c0de7140:	d1ee      	bne.n	c0de7120 <ux_flow_init+0x64>
c0de7142:	2000      	movs	r0, #0
c0de7144:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de7148:	f7ff bf03 	b.w	c0de6f52 <ux_flow_engine_init_step>

c0de714c <ux_flow_button_callback>:
c0de714c:	b580      	push	{r7, lr}
c0de714e:	2103      	movs	r1, #3
c0de7150:	f2c8 0100 	movt	r1, #32768	@ 0x8000
c0de7154:	4288      	cmp	r0, r1
c0de7156:	d00c      	beq.n	c0de7172 <ux_flow_button_callback+0x26>
c0de7158:	2102      	movs	r1, #2
c0de715a:	f2c8 0100 	movt	r1, #32768	@ 0x8000
c0de715e:	4288      	cmp	r0, r1
c0de7160:	d00a      	beq.n	c0de7178 <ux_flow_button_callback+0x2c>
c0de7162:	2101      	movs	r1, #1
c0de7164:	f2c8 0100 	movt	r1, #32768	@ 0x8000
c0de7168:	4288      	cmp	r0, r1
c0de716a:	d108      	bne.n	c0de717e <ux_flow_button_callback+0x32>
c0de716c:	f7ff feac 	bl	c0de6ec8 <ux_flow_prev>
c0de7170:	e005      	b.n	c0de717e <ux_flow_button_callback+0x32>
c0de7172:	f7ff ff2f 	bl	c0de6fd4 <ux_flow_validate>
c0de7176:	e002      	b.n	c0de717e <ux_flow_button_callback+0x32>
c0de7178:	2001      	movs	r0, #1
c0de717a:	f7ff fe5c 	bl	c0de6e36 <ux_flow_next_internal>
c0de717e:	2000      	movs	r0, #0
c0de7180:	bd80      	pop	{r7, pc}

c0de7182 <ux_stack_get_step_params>:
c0de7182:	b510      	push	{r4, lr}
c0de7184:	b108      	cbz	r0, c0de718a <ux_stack_get_step_params+0x8>
c0de7186:	2000      	movs	r0, #0
c0de7188:	bd10      	pop	{r4, pc}
c0de718a:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de718e:	f2c0 0000 	movt	r0, #0
c0de7192:	eb09 0100 	add.w	r1, r9, r0
c0de7196:	8c8a      	ldrh	r2, [r1, #36]	@ 0x24
c0de7198:	2a00      	cmp	r2, #0
c0de719a:	d0f4      	beq.n	c0de7186 <ux_stack_get_step_params+0x4>
c0de719c:	8c09      	ldrh	r1, [r1, #32]
c0de719e:	4291      	cmp	r1, r2
c0de71a0:	d2f1      	bcs.n	c0de7186 <ux_stack_get_step_params+0x4>
c0de71a2:	eb09 0400 	add.w	r4, r9, r0
c0de71a6:	69e0      	ldr	r0, [r4, #28]
c0de71a8:	f000 ff12 	bl	c0de7fd0 <pic>
c0de71ac:	8c21      	ldrh	r1, [r4, #32]
c0de71ae:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de71b2:	f000 ff0d 	bl	c0de7fd0 <pic>
c0de71b6:	6840      	ldr	r0, [r0, #4]
c0de71b8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de71bc:	f000 bf08 	b.w	c0de7fd0 <pic>

c0de71c0 <ux_stack_get_current_step_params>:
c0de71c0:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de71c4:	f2c0 0000 	movt	r0, #0
c0de71c8:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de71cc:	3801      	subs	r0, #1
c0de71ce:	f7ff bfd8 	b.w	c0de7182 <ux_stack_get_step_params>

c0de71d2 <ux_flow_relayout>:
c0de71d2:	b580      	push	{r7, lr}
c0de71d4:	f7ff fe09 	bl	c0de6dea <ux_flow_get_current>
c0de71d8:	b150      	cbz	r0, c0de71f0 <ux_flow_relayout+0x1e>
c0de71da:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de71de:	f2c0 0000 	movt	r0, #0
c0de71e2:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de71e6:	3801      	subs	r0, #1
c0de71e8:	f7ff feb3 	bl	c0de6f52 <ux_flow_engine_init_step>
c0de71ec:	2001      	movs	r0, #1
c0de71ee:	bd80      	pop	{r7, pc}
c0de71f0:	2000      	movs	r0, #0
c0de71f2:	bd80      	pop	{r7, pc}

c0de71f4 <ux_layout_bb_init_common>:
c0de71f4:	b510      	push	{r4, lr}
c0de71f6:	4604      	mov	r4, r0
c0de71f8:	f000 fc62 	bl	c0de7ac0 <ux_stack_init>
c0de71fc:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de7200:	f2c0 0000 	movt	r0, #0
c0de7204:	4448      	add	r0, r9
c0de7206:	eb04 01c4 	add.w	r1, r4, r4, lsl #3
c0de720a:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de720e:	f244 0192 	movw	r1, #16530	@ 0x4092
c0de7212:	f2c0 0100 	movt	r1, #0
c0de7216:	4479      	add	r1, pc
c0de7218:	f8c0 10cc 	str.w	r1, [r0, #204]	@ 0xcc
c0de721c:	2105      	movs	r1, #5
c0de721e:	f880 10d0 	strb.w	r1, [r0, #208]	@ 0xd0
c0de7222:	2101      	movs	r1, #1
c0de7224:	f880 10c9 	strb.w	r1, [r0, #201]	@ 0xc9
c0de7228:	f64f 7119 	movw	r1, #65305	@ 0xff19
c0de722c:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de7230:	4479      	add	r1, pc
c0de7232:	f8c0 10dc 	str.w	r1, [r0, #220]	@ 0xdc
c0de7236:	bd10      	pop	{r4, pc}

c0de7238 <ux_layout_bn_prepro>:
c0de7238:	b580      	push	{r7, lr}
c0de723a:	f000 fbad 	bl	c0de7998 <ux_layout_strings_prepro>
c0de723e:	b170      	cbz	r0, c0de725e <ux_layout_bn_prepro+0x26>
c0de7240:	f240 41d8 	movw	r1, #1240	@ 0x4d8
c0de7244:	f2c0 0100 	movt	r1, #0
c0de7248:	eb09 0201 	add.w	r2, r9, r1
c0de724c:	f892 20a9 	ldrb.w	r2, [r2, #169]	@ 0xa9
c0de7250:	2a11      	cmp	r2, #17
c0de7252:	bf02      	ittt	eq
c0de7254:	4449      	addeq	r1, r9
c0de7256:	f248 020a 	movweq	r2, #32778	@ 0x800a
c0de725a:	f8a1 20c0 	strheq.w	r2, [r1, #192]	@ 0xc0
c0de725e:	bd80      	pop	{r7, pc}

c0de7260 <ux_layout_bn_init>:
c0de7260:	b510      	push	{r4, lr}
c0de7262:	4604      	mov	r4, r0
c0de7264:	f7ff ffc6 	bl	c0de71f4 <ux_layout_bb_init_common>
c0de7268:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de726c:	f2c0 0000 	movt	r0, #0
c0de7270:	f64f 72b3 	movw	r2, #65459	@ 0xffb3
c0de7274:	4448      	add	r0, r9
c0de7276:	eb04 01c4 	add.w	r1, r4, r4, lsl #3
c0de727a:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de727e:	eb00 0181 	add.w	r1, r0, r1, lsl #2
c0de7282:	447a      	add	r2, pc
c0de7284:	4620      	mov	r0, r4
c0de7286:	f8c1 20d8 	str.w	r2, [r1, #216]	@ 0xd8
c0de728a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de728e:	f000 bbed 	b.w	c0de7a6c <ux_stack_display>

c0de7292 <ux_layout_paging_prepro_common>:
c0de7292:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de7296:	b082      	sub	sp, #8
c0de7298:	f240 48d8 	movw	r8, #1240	@ 0x4d8
c0de729c:	f2c0 0800 	movt	r8, #0
c0de72a0:	4606      	mov	r6, r0
c0de72a2:	eb09 0008 	add.w	r0, r9, r8
c0de72a6:	4614      	mov	r4, r2
c0de72a8:	460d      	mov	r5, r1
c0de72aa:	30a8      	adds	r0, #168	@ 0xa8
c0de72ac:	4631      	mov	r1, r6
c0de72ae:	2220      	movs	r2, #32
c0de72b0:	f001 f901 	bl	c0de84b6 <__aeabi_memmove>
c0de72b4:	7870      	ldrb	r0, [r6, #1]
c0de72b6:	2810      	cmp	r0, #16
c0de72b8:	dc26      	bgt.n	c0de7308 <ux_layout_paging_prepro_common+0x76>
c0de72ba:	2801      	cmp	r0, #1
c0de72bc:	d03c      	beq.n	c0de7338 <ux_layout_paging_prepro_common+0xa6>
c0de72be:	2802      	cmp	r0, #2
c0de72c0:	d043      	beq.n	c0de734a <ux_layout_paging_prepro_common+0xb8>
c0de72c2:	2810      	cmp	r0, #16
c0de72c4:	f040 809b 	bne.w	c0de73fe <ux_layout_paging_prepro_common+0x16c>
c0de72c8:	2d00      	cmp	r5, #0
c0de72ca:	d04b      	beq.n	c0de7364 <ux_layout_paging_prepro_common+0xd2>
c0de72cc:	eb09 0608 	add.w	r6, r9, r8
c0de72d0:	68b0      	ldr	r0, [r6, #8]
c0de72d2:	f641 0192 	movw	r1, #6290	@ 0x1892
c0de72d6:	f2c0 0100 	movt	r1, #0
c0de72da:	f641 1455 	movw	r4, #6485	@ 0x1955
c0de72de:	f2c0 0400 	movt	r4, #0
c0de72e2:	447c      	add	r4, pc
c0de72e4:	2801      	cmp	r0, #1
c0de72e6:	4628      	mov	r0, r5
c0de72e8:	4479      	add	r1, pc
c0de72ea:	bf88      	it	hi
c0de72ec:	460c      	movhi	r4, r1
c0de72ee:	f000 fe6f 	bl	c0de7fd0 <pic>
c0de72f2:	4603      	mov	r3, r0
c0de72f4:	e9d6 0501 	ldrd	r0, r5, [r6, #4]
c0de72f8:	2180      	movs	r1, #128	@ 0x80
c0de72fa:	3001      	adds	r0, #1
c0de72fc:	9000      	str	r0, [sp, #0]
c0de72fe:	f106 0028 	add.w	r0, r6, #40	@ 0x28
c0de7302:	4622      	mov	r2, r4
c0de7304:	9501      	str	r5, [sp, #4]
c0de7306:	e03a      	b.n	c0de737e <ux_layout_paging_prepro_common+0xec>
c0de7308:	f1a0 0111 	sub.w	r1, r0, #17
c0de730c:	2903      	cmp	r1, #3
c0de730e:	d276      	bcs.n	c0de73fe <ux_layout_paging_prepro_common+0x16c>
c0de7310:	f000 000f 	and.w	r0, r0, #15
c0de7314:	1e46      	subs	r6, r0, #1
c0de7316:	2e02      	cmp	r6, #2
c0de7318:	d871      	bhi.n	c0de73fe <ux_layout_paging_prepro_common+0x16c>
c0de731a:	eb09 0008 	add.w	r0, r9, r8
c0de731e:	eb00 0046 	add.w	r0, r0, r6, lsl #1
c0de7322:	8a85      	ldrh	r5, [r0, #20]
c0de7324:	2d00      	cmp	r5, #0
c0de7326:	d06a      	beq.n	c0de73fe <ux_layout_paging_prepro_common+0x16c>
c0de7328:	2d7f      	cmp	r5, #127	@ 0x7f
c0de732a:	bf28      	it	cs
c0de732c:	257f      	movcs	r5, #127	@ 0x7f
c0de732e:	b3ec      	cbz	r4, c0de73ac <ux_layout_paging_prepro_common+0x11a>
c0de7330:	4620      	mov	r0, r4
c0de7332:	f000 fe4d 	bl	c0de7fd0 <pic>
c0de7336:	e03d      	b.n	c0de73b4 <ux_layout_paging_prepro_common+0x122>
c0de7338:	f7ff fce7 	bl	c0de6d0a <ux_flow_is_first>
c0de733c:	2800      	cmp	r0, #0
c0de733e:	d05e      	beq.n	c0de73fe <ux_layout_paging_prepro_common+0x16c>
c0de7340:	eb09 0008 	add.w	r0, r9, r8
c0de7344:	6840      	ldr	r0, [r0, #4]
c0de7346:	b158      	cbz	r0, c0de7360 <ux_layout_paging_prepro_common+0xce>
c0de7348:	e059      	b.n	c0de73fe <ux_layout_paging_prepro_common+0x16c>
c0de734a:	f7ff fd0c 	bl	c0de6d66 <ux_flow_is_last>
c0de734e:	2800      	cmp	r0, #0
c0de7350:	d055      	beq.n	c0de73fe <ux_layout_paging_prepro_common+0x16c>
c0de7352:	eb09 0008 	add.w	r0, r9, r8
c0de7356:	6881      	ldr	r1, [r0, #8]
c0de7358:	6840      	ldr	r0, [r0, #4]
c0de735a:	3901      	subs	r1, #1
c0de735c:	4288      	cmp	r0, r1
c0de735e:	d14e      	bne.n	c0de73fe <ux_layout_paging_prepro_common+0x16c>
c0de7360:	2000      	movs	r0, #0
c0de7362:	e04f      	b.n	c0de7404 <ux_layout_paging_prepro_common+0x172>
c0de7364:	eb09 0008 	add.w	r0, r9, r8
c0de7368:	e9d0 1601 	ldrd	r1, r6, [r0, #4]
c0de736c:	f641 32fc 	movw	r2, #7164	@ 0x1bfc
c0de7370:	f2c0 0200 	movt	r2, #0
c0de7374:	1c4b      	adds	r3, r1, #1
c0de7376:	3028      	adds	r0, #40	@ 0x28
c0de7378:	447a      	add	r2, pc
c0de737a:	2180      	movs	r1, #128	@ 0x80
c0de737c:	9600      	str	r6, [sp, #0]
c0de737e:	f000 fc57 	bl	c0de7c30 <snprintf>
c0de7382:	eb09 0008 	add.w	r0, r9, r8
c0de7386:	7b01      	ldrb	r1, [r0, #12]
c0de7388:	f248 0208 	movw	r2, #32776	@ 0x8008
c0de738c:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de7390:	3202      	adds	r2, #2
c0de7392:	29ef      	cmp	r1, #239	@ 0xef
c0de7394:	f100 0128 	add.w	r1, r0, #40	@ 0x28
c0de7398:	bf84      	itt	hi
c0de739a:	f248 0208 	movwhi	r2, #32776	@ 0x8008
c0de739e:	f6cf 72ff 	movthi	r2, #65535	@ 0xffff
c0de73a2:	f8a0 20c0 	strh.w	r2, [r0, #192]	@ 0xc0
c0de73a6:	f8c0 10c4 	str.w	r1, [r0, #196]	@ 0xc4
c0de73aa:	e028      	b.n	c0de73fe <ux_layout_paging_prepro_common+0x16c>
c0de73ac:	eb09 0008 	add.w	r0, r9, r8
c0de73b0:	f8d0 010c 	ldr.w	r0, [r0, #268]	@ 0x10c
c0de73b4:	eb09 0708 	add.w	r7, r9, r8
c0de73b8:	eb07 0146 	add.w	r1, r7, r6, lsl #1
c0de73bc:	89c9      	ldrh	r1, [r1, #14]
c0de73be:	f641 0203 	movw	r2, #6147	@ 0x1803
c0de73c2:	f107 0428 	add.w	r4, r7, #40	@ 0x28
c0de73c6:	f2c0 0200 	movt	r2, #0
c0de73ca:	1846      	adds	r6, r0, r1
c0de73cc:	447a      	add	r2, pc
c0de73ce:	4620      	mov	r0, r4
c0de73d0:	2180      	movs	r1, #128	@ 0x80
c0de73d2:	462b      	mov	r3, r5
c0de73d4:	9600      	str	r6, [sp, #0]
c0de73d6:	f000 fc2b 	bl	c0de7c30 <snprintf>
c0de73da:	7b38      	ldrb	r0, [r7, #12]
c0de73dc:	f248 0108 	movw	r1, #32776	@ 0x8008
c0de73e0:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de73e4:	f000 000f 	and.w	r0, r0, #15
c0de73e8:	3102      	adds	r1, #2
c0de73ea:	f8c7 40c4 	str.w	r4, [r7, #196]	@ 0xc4
c0de73ee:	280f      	cmp	r0, #15
c0de73f0:	bf04      	itt	eq
c0de73f2:	f248 0108 	movweq	r1, #32776	@ 0x8008
c0de73f6:	f6cf 71ff 	movteq	r1, #65535	@ 0xffff
c0de73fa:	f8a7 10c0 	strh.w	r1, [r7, #192]	@ 0xc0
c0de73fe:	eb09 0008 	add.w	r0, r9, r8
c0de7402:	30a8      	adds	r0, #168	@ 0xa8
c0de7404:	b002      	add	sp, #8
c0de7406:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de740a <ux_layout_paging_redisplay_common>:
c0de740a:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de740e:	4606      	mov	r6, r0
c0de7410:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de7414:	f2c0 0000 	movt	r0, #0
c0de7418:	4690      	mov	r8, r2
c0de741a:	eb09 0200 	add.w	r2, r9, r0
c0de741e:	eb06 00c6 	add.w	r0, r6, r6, lsl #3
c0de7422:	eb02 0780 	add.w	r7, r2, r0, lsl #2
c0de7426:	f643 701a 	movw	r0, #16154	@ 0x3f1a
c0de742a:	f2c0 0000 	movt	r0, #0
c0de742e:	4478      	add	r0, pc
c0de7430:	f8c7 00cc 	str.w	r0, [r7, #204]	@ 0xcc
c0de7434:	2007      	movs	r0, #7
c0de7436:	f887 00d0 	strb.w	r0, [r7, #208]	@ 0xd0
c0de743a:	2001      	movs	r0, #1
c0de743c:	f887 00c9 	strb.w	r0, [r7, #201]	@ 0xc9
c0de7440:	7b10      	ldrb	r0, [r2, #12]
c0de7442:	460c      	mov	r4, r1
c0de7444:	f852 1f04 	ldr.w	r1, [r2, #4]!
c0de7448:	0700      	lsls	r0, r0, #28
c0de744a:	461d      	mov	r5, r3
c0de744c:	f04f 0308 	mov.w	r3, #8
c0de7450:	4620      	mov	r0, r4
c0de7452:	bf08      	it	eq
c0de7454:	230a      	moveq	r3, #10
c0de7456:	f000 f8e1 	bl	c0de761c <ux_layout_paging_compute>
c0de745a:	f8c7 50d8 	str.w	r5, [r7, #216]	@ 0xd8
c0de745e:	4630      	mov	r0, r6
c0de7460:	f8c7 80dc 	str.w	r8, [r7, #220]	@ 0xdc
c0de7464:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de7468:	f000 bb00 	b.w	c0de7a6c <ux_stack_display>

c0de746c <ux_layout_paging_redisplay_by_addr>:
c0de746c:	b510      	push	{r4, lr}
c0de746e:	4604      	mov	r4, r0
c0de7470:	f7ff fea6 	bl	c0de71c0 <ux_stack_get_current_step_params>
c0de7474:	b178      	cbz	r0, c0de7496 <ux_layout_paging_redisplay_by_addr+0x2a>
c0de7476:	6841      	ldr	r1, [r0, #4]
c0de7478:	f240 020d 	movw	r2, #13
c0de747c:	f2c0 0200 	movt	r2, #0
c0de7480:	f240 0397 	movw	r3, #151	@ 0x97
c0de7484:	f2c0 0300 	movt	r3, #0
c0de7488:	447a      	add	r2, pc
c0de748a:	447b      	add	r3, pc
c0de748c:	4620      	mov	r0, r4
c0de748e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de7492:	f7ff bfba 	b.w	c0de740a <ux_layout_paging_redisplay_common>
c0de7496:	bd10      	pop	{r4, pc}

c0de7498 <ux_layout_paging_button_callback_by_addr>:
c0de7498:	b580      	push	{r7, lr}
c0de749a:	2103      	movs	r1, #3
c0de749c:	f2c8 0100 	movt	r1, #32768	@ 0x8000
c0de74a0:	4288      	cmp	r0, r1
c0de74a2:	d013      	beq.n	c0de74cc <ux_layout_paging_button_callback_by_addr+0x34>
c0de74a4:	2102      	movs	r1, #2
c0de74a6:	f2c8 0100 	movt	r1, #32768	@ 0x8000
c0de74aa:	4288      	cmp	r0, r1
c0de74ac:	d01e      	beq.n	c0de74ec <ux_layout_paging_button_callback_by_addr+0x54>
c0de74ae:	2101      	movs	r1, #1
c0de74b0:	f2c8 0100 	movt	r1, #32768	@ 0x8000
c0de74b4:	4288      	cmp	r0, r1
c0de74b6:	d133      	bne.n	c0de7520 <ux_layout_paging_button_callback_by_addr+0x88>
c0de74b8:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de74bc:	f2c0 0000 	movt	r0, #0
c0de74c0:	eb09 0100 	add.w	r1, r9, r0
c0de74c4:	6849      	ldr	r1, [r1, #4]
c0de74c6:	b349      	cbz	r1, c0de751c <ux_layout_paging_button_callback_by_addr+0x84>
c0de74c8:	3901      	subs	r1, #1
c0de74ca:	e01e      	b.n	c0de750a <ux_layout_paging_button_callback_by_addr+0x72>
c0de74cc:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de74d0:	f2c0 0000 	movt	r0, #0
c0de74d4:	eb09 0100 	add.w	r1, r9, r0
c0de74d8:	6889      	ldr	r1, [r1, #8]
c0de74da:	b121      	cbz	r1, c0de74e6 <ux_layout_paging_button_callback_by_addr+0x4e>
c0de74dc:	4448      	add	r0, r9
c0de74de:	6840      	ldr	r0, [r0, #4]
c0de74e0:	3901      	subs	r1, #1
c0de74e2:	4281      	cmp	r1, r0
c0de74e4:	d11c      	bne.n	c0de7520 <ux_layout_paging_button_callback_by_addr+0x88>
c0de74e6:	f7ff fd75 	bl	c0de6fd4 <ux_flow_validate>
c0de74ea:	e019      	b.n	c0de7520 <ux_layout_paging_button_callback_by_addr+0x88>
c0de74ec:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de74f0:	f2c0 0000 	movt	r0, #0
c0de74f4:	eb09 0100 	add.w	r1, r9, r0
c0de74f8:	688a      	ldr	r2, [r1, #8]
c0de74fa:	6849      	ldr	r1, [r1, #4]
c0de74fc:	3a01      	subs	r2, #1
c0de74fe:	4291      	cmp	r1, r2
c0de7500:	d102      	bne.n	c0de7508 <ux_layout_paging_button_callback_by_addr+0x70>
c0de7502:	f7ff fcde 	bl	c0de6ec2 <ux_flow_next>
c0de7506:	e00b      	b.n	c0de7520 <ux_layout_paging_button_callback_by_addr+0x88>
c0de7508:	3101      	adds	r1, #1
c0de750a:	eb09 0200 	add.w	r2, r9, r0
c0de750e:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de7512:	6051      	str	r1, [r2, #4]
c0de7514:	3801      	subs	r0, #1
c0de7516:	f7ff ffa9 	bl	c0de746c <ux_layout_paging_redisplay_by_addr>
c0de751a:	e001      	b.n	c0de7520 <ux_layout_paging_button_callback_by_addr+0x88>
c0de751c:	f7ff fcd4 	bl	c0de6ec8 <ux_flow_prev>
c0de7520:	2000      	movs	r0, #0
c0de7522:	bd80      	pop	{r7, pc}

c0de7524 <ux_layout_paging_prepro_by_addr>:
c0de7524:	b510      	push	{r4, lr}
c0de7526:	4604      	mov	r4, r0
c0de7528:	f7ff fe4a 	bl	c0de71c0 <ux_stack_get_current_step_params>
c0de752c:	b130      	cbz	r0, c0de753c <ux_layout_paging_prepro_by_addr+0x18>
c0de752e:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de7532:	4620      	mov	r0, r4
c0de7534:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de7538:	f7ff beab 	b.w	c0de7292 <ux_layout_paging_prepro_common>
c0de753c:	2000      	movs	r0, #0
c0de753e:	bd10      	pop	{r4, pc}

c0de7540 <ux_layout_paging_init_common>:
c0de7540:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de7544:	b081      	sub	sp, #4
c0de7546:	f240 48d8 	movw	r8, #1240	@ 0x4d8
c0de754a:	f2c0 0800 	movt	r8, #0
c0de754e:	460d      	mov	r5, r1
c0de7550:	eb09 0108 	add.w	r1, r9, r8
c0de7554:	7b0e      	ldrb	r6, [r1, #12]
c0de7556:	4692      	mov	sl, r2
c0de7558:	4604      	mov	r4, r0
c0de755a:	f7ff fc2e 	bl	c0de6dba <ux_flow_direction>
c0de755e:	2801      	cmp	r0, #1
c0de7560:	d00c      	beq.n	c0de757c <ux_layout_paging_init_common+0x3c>
c0de7562:	3001      	adds	r0, #1
c0de7564:	d110      	bne.n	c0de7588 <ux_layout_paging_init_common+0x48>
c0de7566:	eb09 0708 	add.w	r7, r9, r8
c0de756a:	f107 0008 	add.w	r0, r7, #8
c0de756e:	2114      	movs	r1, #20
c0de7570:	f000 ff9c 	bl	c0de84ac <__aeabi_memclr>
c0de7574:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de7578:	6078      	str	r0, [r7, #4]
c0de757a:	e005      	b.n	c0de7588 <ux_layout_paging_init_common+0x48>
c0de757c:	eb09 0008 	add.w	r0, r9, r8
c0de7580:	3004      	adds	r0, #4
c0de7582:	2118      	movs	r1, #24
c0de7584:	f000 ff92 	bl	c0de84ac <__aeabi_memclr>
c0de7588:	eb09 0708 	add.w	r7, r9, r8
c0de758c:	4620      	mov	r0, r4
c0de758e:	733e      	strb	r6, [r7, #12]
c0de7590:	1d3e      	adds	r6, r7, #4
c0de7592:	f000 fa95 	bl	c0de7ac0 <ux_stack_init>
c0de7596:	f8d7 010c 	ldr.w	r0, [r7, #268]	@ 0x10c
c0de759a:	2308      	movs	r3, #8
c0de759c:	4328      	orrs	r0, r5
c0de759e:	f641 100f 	movw	r0, #6415	@ 0x190f
c0de75a2:	f2c0 0000 	movt	r0, #0
c0de75a6:	7b39      	ldrb	r1, [r7, #12]
c0de75a8:	4478      	add	r0, pc
c0de75aa:	bf18      	it	ne
c0de75ac:	4628      	movne	r0, r5
c0de75ae:	0709      	lsls	r1, r1, #28
c0de75b0:	f04f 31ff 	mov.w	r1, #4294967295	@ 0xffffffff
c0de75b4:	4632      	mov	r2, r6
c0de75b6:	bf08      	it	eq
c0de75b8:	230a      	moveq	r3, #10
c0de75ba:	f000 f82f 	bl	c0de761c <ux_layout_paging_compute>
c0de75be:	60b8      	str	r0, [r7, #8]
c0de75c0:	b148      	cbz	r0, c0de75d6 <ux_layout_paging_init_common+0x96>
c0de75c2:	eb09 0108 	add.w	r1, r9, r8
c0de75c6:	6849      	ldr	r1, [r1, #4]
c0de75c8:	3801      	subs	r0, #1
c0de75ca:	4281      	cmp	r1, r0
c0de75cc:	bf84      	itt	hi
c0de75ce:	eb09 0108 	addhi.w	r1, r9, r8
c0de75d2:	6048      	strhi	r0, [r1, #4]
c0de75d4:	e005      	b.n	c0de75e2 <ux_layout_paging_init_common+0xa2>
c0de75d6:	eb09 0008 	add.w	r0, r9, r8
c0de75da:	3004      	adds	r0, #4
c0de75dc:	2118      	movs	r1, #24
c0de75de:	f000 ff65 	bl	c0de84ac <__aeabi_memclr>
c0de75e2:	4620      	mov	r0, r4
c0de75e4:	4651      	mov	r1, sl
c0de75e6:	b001      	add	sp, #4
c0de75e8:	e8bd 45f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de75ec:	4708      	bx	r1

c0de75ee <ux_layout_bn_paging_init>:
c0de75ee:	b510      	push	{r4, lr}
c0de75f0:	4604      	mov	r4, r0
c0de75f2:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de75f6:	f2c0 0000 	movt	r0, #0
c0de75fa:	4448      	add	r0, r9
c0de75fc:	21f0      	movs	r1, #240	@ 0xf0
c0de75fe:	7301      	strb	r1, [r0, #12]
c0de7600:	4620      	mov	r0, r4
c0de7602:	f7ff fdbe 	bl	c0de7182 <ux_stack_get_step_params>
c0de7606:	6841      	ldr	r1, [r0, #4]
c0de7608:	f64f 6259 	movw	r2, #65113	@ 0xfe59
c0de760c:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de7610:	447a      	add	r2, pc
c0de7612:	4620      	mov	r0, r4
c0de7614:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de7618:	f7ff bf92 	b.w	c0de7540 <ux_layout_paging_init_common>

c0de761c <ux_layout_paging_compute>:
c0de761c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7620:	b088      	sub	sp, #32
c0de7622:	460e      	mov	r6, r1
c0de7624:	4607      	mov	r7, r0
c0de7626:	f102 000a 	add.w	r0, r2, #10
c0de762a:	210c      	movs	r1, #12
c0de762c:	9307      	str	r3, [sp, #28]
c0de762e:	4614      	mov	r4, r2
c0de7630:	f000 ff3c 	bl	c0de84ac <__aeabi_memclr>
c0de7634:	1c70      	adds	r0, r6, #1
c0de7636:	9004      	str	r0, [sp, #16]
c0de7638:	d004      	beq.n	c0de7644 <ux_layout_paging_compute+0x28>
c0de763a:	6860      	ldr	r0, [r4, #4]
c0de763c:	42b0      	cmp	r0, r6
c0de763e:	d801      	bhi.n	c0de7644 <ux_layout_paging_compute+0x28>
c0de7640:	2000      	movs	r0, #0
c0de7642:	e097      	b.n	c0de7774 <ux_layout_paging_compute+0x158>
c0de7644:	b127      	cbz	r7, c0de7650 <ux_layout_paging_compute+0x34>
c0de7646:	4638      	mov	r0, r7
c0de7648:	f000 fcc2 	bl	c0de7fd0 <pic>
c0de764c:	4607      	mov	r7, r0
c0de764e:	e006      	b.n	c0de765e <ux_layout_paging_compute+0x42>
c0de7650:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de7654:	f2c0 0000 	movt	r0, #0
c0de7658:	4448      	add	r0, r9
c0de765a:	f8d0 710c 	ldr.w	r7, [r0, #268]	@ 0x10c
c0de765e:	4638      	mov	r0, r7
c0de7660:	f000 ff84 	bl	c0de856c <strlen>
c0de7664:	2801      	cmp	r0, #1
c0de7666:	f2c0 8082 	blt.w	c0de776e <ux_layout_paging_compute+0x152>
c0de766a:	eb07 0b00 	add.w	fp, r7, r0
c0de766e:	2200      	movs	r2, #0
c0de7670:	2300      	movs	r3, #0
c0de7672:	2500      	movs	r5, #0
c0de7674:	9402      	str	r4, [sp, #8]
c0de7676:	4638      	mov	r0, r7
c0de7678:	9701      	str	r7, [sp, #4]
c0de767a:	9603      	str	r6, [sp, #12]
c0de767c:	2600      	movs	r6, #0
c0de767e:	46ba      	mov	sl, r7
c0de7680:	e9cd 3205 	strd	r3, r2, [sp, #20]
c0de7684:	eb07 0806 	add.w	r8, r7, r6
c0de7688:	45d8      	cmp	r8, fp
c0de768a:	d21d      	bcs.n	c0de76c8 <ux_layout_paging_compute+0xac>
c0de768c:	1c74      	adds	r4, r6, #1
c0de768e:	9807      	ldr	r0, [sp, #28]
c0de7690:	b2e3      	uxtb	r3, r4
c0de7692:	2100      	movs	r1, #0
c0de7694:	463a      	mov	r2, r7
c0de7696:	9500      	str	r5, [sp, #0]
c0de7698:	f7fe ffc3 	bl	c0de6622 <bagl_compute_line_width>
c0de769c:	2872      	cmp	r0, #114	@ 0x72
c0de769e:	d813      	bhi.n	c0de76c8 <ux_layout_paging_compute+0xac>
c0de76a0:	f898 0000 	ldrb.w	r0, [r8]
c0de76a4:	282c      	cmp	r0, #44	@ 0x2c
c0de76a6:	dc05      	bgt.n	c0de76b4 <ux_layout_paging_compute+0x98>
c0de76a8:	280a      	cmp	r0, #10
c0de76aa:	d007      	beq.n	c0de76bc <ux_layout_paging_compute+0xa0>
c0de76ac:	2820      	cmp	r0, #32
c0de76ae:	bf08      	it	eq
c0de76b0:	46c2      	moveq	sl, r8
c0de76b2:	e004      	b.n	c0de76be <ux_layout_paging_compute+0xa2>
c0de76b4:	285f      	cmp	r0, #95	@ 0x5f
c0de76b6:	d001      	beq.n	c0de76bc <ux_layout_paging_compute+0xa0>
c0de76b8:	282d      	cmp	r0, #45	@ 0x2d
c0de76ba:	d100      	bne.n	c0de76be <ux_layout_paging_compute+0xa2>
c0de76bc:	46c2      	mov	sl, r8
c0de76be:	280a      	cmp	r0, #10
c0de76c0:	4626      	mov	r6, r4
c0de76c2:	d1df      	bne.n	c0de7684 <ux_layout_paging_compute+0x68>
c0de76c4:	e001      	b.n	c0de76ca <ux_layout_paging_compute+0xae>
c0de76c6:	bf00      	nop
c0de76c8:	4634      	mov	r4, r6
c0de76ca:	1938      	adds	r0, r7, r4
c0de76cc:	4558      	cmp	r0, fp
c0de76ce:	d203      	bcs.n	c0de76d8 <ux_layout_paging_compute+0xbc>
c0de76d0:	45ba      	cmp	sl, r7
c0de76d2:	bf18      	it	ne
c0de76d4:	2c00      	cmpne	r4, #0
c0de76d6:	d126      	bne.n	c0de7726 <ux_layout_paging_compute+0x10a>
c0de76d8:	9e03      	ldr	r6, [sp, #12]
c0de76da:	e9dd 3205 	ldrd	r3, r2, [sp, #20]
c0de76de:	9804      	ldr	r0, [sp, #16]
c0de76e0:	b170      	cbz	r0, c0de7700 <ux_layout_paging_compute+0xe4>
c0de76e2:	42b2      	cmp	r2, r6
c0de76e4:	d10c      	bne.n	c0de7700 <ux_layout_paging_compute+0xe4>
c0de76e6:	9802      	ldr	r0, [sp, #8]
c0de76e8:	6840      	ldr	r0, [r0, #4]
c0de76ea:	42b0      	cmp	r0, r6
c0de76ec:	d908      	bls.n	c0de7700 <ux_layout_paging_compute+0xe4>
c0de76ee:	9801      	ldr	r0, [sp, #4]
c0de76f0:	9902      	ldr	r1, [sp, #8]
c0de76f2:	1a38      	subs	r0, r7, r0
c0de76f4:	eb01 0143 	add.w	r1, r1, r3, lsl #1
c0de76f8:	2b01      	cmp	r3, #1
c0de76fa:	8148      	strh	r0, [r1, #10]
c0de76fc:	820c      	strh	r4, [r1, #16]
c0de76fe:	d836      	bhi.n	c0de776e <ux_layout_paging_compute+0x152>
c0de7700:	3301      	adds	r3, #1
c0de7702:	4427      	add	r7, r4
c0de7704:	2b02      	cmp	r3, #2
c0de7706:	f04f 0000 	mov.w	r0, #0
c0de770a:	bf88      	it	hi
c0de770c:	2001      	movhi	r0, #1
c0de770e:	455f      	cmp	r7, fp
c0de7710:	f04f 0100 	mov.w	r1, #0
c0de7714:	bf38      	it	cc
c0de7716:	2101      	movcc	r1, #1
c0de7718:	4008      	ands	r0, r1
c0de771a:	bf18      	it	ne
c0de771c:	2300      	movne	r3, #0
c0de771e:	455f      	cmp	r7, fp
c0de7720:	4402      	add	r2, r0
c0de7722:	d3ab      	bcc.n	c0de767c <ux_layout_paging_compute+0x60>
c0de7724:	e025      	b.n	c0de7772 <ux_layout_paging_compute+0x156>
c0de7726:	f810 1c01 	ldrb.w	r1, [r0, #-1]
c0de772a:	292c      	cmp	r1, #44	@ 0x2c
c0de772c:	dc07      	bgt.n	c0de773e <ux_layout_paging_compute+0x122>
c0de772e:	9e03      	ldr	r6, [sp, #12]
c0de7730:	e9dd 3205 	ldrd	r3, r2, [sp, #20]
c0de7734:	290a      	cmp	r1, #10
c0de7736:	d0d2      	beq.n	c0de76de <ux_layout_paging_compute+0xc2>
c0de7738:	2920      	cmp	r1, #32
c0de773a:	d0d0      	beq.n	c0de76de <ux_layout_paging_compute+0xc2>
c0de773c:	e006      	b.n	c0de774c <ux_layout_paging_compute+0x130>
c0de773e:	9e03      	ldr	r6, [sp, #12]
c0de7740:	e9dd 3205 	ldrd	r3, r2, [sp, #20]
c0de7744:	292d      	cmp	r1, #45	@ 0x2d
c0de7746:	d0ca      	beq.n	c0de76de <ux_layout_paging_compute+0xc2>
c0de7748:	295f      	cmp	r1, #95	@ 0x5f
c0de774a:	d0c8      	beq.n	c0de76de <ux_layout_paging_compute+0xc2>
c0de774c:	7800      	ldrb	r0, [r0, #0]
c0de774e:	282c      	cmp	r0, #44	@ 0x2c
c0de7750:	dc06      	bgt.n	c0de7760 <ux_layout_paging_compute+0x144>
c0de7752:	280a      	cmp	r0, #10
c0de7754:	d0c3      	beq.n	c0de76de <ux_layout_paging_compute+0xc2>
c0de7756:	2820      	cmp	r0, #32
c0de7758:	bf18      	it	ne
c0de775a:	ebaa 0407 	subne.w	r4, sl, r7
c0de775e:	e7be      	b.n	c0de76de <ux_layout_paging_compute+0xc2>
c0de7760:	282d      	cmp	r0, #45	@ 0x2d
c0de7762:	d0bc      	beq.n	c0de76de <ux_layout_paging_compute+0xc2>
c0de7764:	285f      	cmp	r0, #95	@ 0x5f
c0de7766:	d0ba      	beq.n	c0de76de <ux_layout_paging_compute+0xc2>
c0de7768:	ebaa 0407 	sub.w	r4, sl, r7
c0de776c:	e7b7      	b.n	c0de76de <ux_layout_paging_compute+0xc2>
c0de776e:	2001      	movs	r0, #1
c0de7770:	e000      	b.n	c0de7774 <ux_layout_paging_compute+0x158>
c0de7772:	1c50      	adds	r0, r2, #1
c0de7774:	b008      	add	sp, #32
c0de7776:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de777a <ux_layout_pb_prepro>:
c0de777a:	b570      	push	{r4, r5, r6, lr}
c0de777c:	4605      	mov	r5, r0
c0de777e:	f7ff fd1f 	bl	c0de71c0 <ux_stack_get_current_step_params>
c0de7782:	f240 46d8 	movw	r6, #1240	@ 0x4d8
c0de7786:	f2c0 0600 	movt	r6, #0
c0de778a:	4604      	mov	r4, r0
c0de778c:	eb09 0006 	add.w	r0, r9, r6
c0de7790:	30a8      	adds	r0, #168	@ 0xa8
c0de7792:	4629      	mov	r1, r5
c0de7794:	2220      	movs	r2, #32
c0de7796:	f000 fe8e 	bl	c0de84b6 <__aeabi_memmove>
c0de779a:	7868      	ldrb	r0, [r5, #1]
c0de779c:	280f      	cmp	r0, #15
c0de779e:	dc06      	bgt.n	c0de77ae <ux_layout_pb_prepro+0x34>
c0de77a0:	2801      	cmp	r0, #1
c0de77a2:	d00f      	beq.n	c0de77c4 <ux_layout_pb_prepro+0x4a>
c0de77a4:	2802      	cmp	r0, #2
c0de77a6:	d112      	bne.n	c0de77ce <ux_layout_pb_prepro+0x54>
c0de77a8:	f7ff fadd 	bl	c0de6d66 <ux_flow_is_last>
c0de77ac:	e00c      	b.n	c0de77c8 <ux_layout_pb_prepro+0x4e>
c0de77ae:	2810      	cmp	r0, #16
c0de77b0:	d002      	beq.n	c0de77b8 <ux_layout_pb_prepro+0x3e>
c0de77b2:	2811      	cmp	r0, #17
c0de77b4:	d10b      	bne.n	c0de77ce <ux_layout_pb_prepro+0x54>
c0de77b6:	3404      	adds	r4, #4
c0de77b8:	6820      	ldr	r0, [r4, #0]
c0de77ba:	eb09 0106 	add.w	r1, r9, r6
c0de77be:	f8c1 00c4 	str.w	r0, [r1, #196]	@ 0xc4
c0de77c2:	e004      	b.n	c0de77ce <ux_layout_pb_prepro+0x54>
c0de77c4:	f7ff faa1 	bl	c0de6d0a <ux_flow_is_first>
c0de77c8:	b108      	cbz	r0, c0de77ce <ux_layout_pb_prepro+0x54>
c0de77ca:	2000      	movs	r0, #0
c0de77cc:	bd70      	pop	{r4, r5, r6, pc}
c0de77ce:	eb09 0006 	add.w	r0, r9, r6
c0de77d2:	30a8      	adds	r0, #168	@ 0xa8
c0de77d4:	bd70      	pop	{r4, r5, r6, pc}

c0de77d6 <ux_layout_pb_init>:
c0de77d6:	b510      	push	{r4, lr}
c0de77d8:	4604      	mov	r4, r0
c0de77da:	f000 f971 	bl	c0de7ac0 <ux_stack_init>
c0de77de:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de77e2:	f2c0 0000 	movt	r0, #0
c0de77e6:	4448      	add	r0, r9
c0de77e8:	eb04 01c4 	add.w	r1, r4, r4, lsl #3
c0de77ec:	eb00 0181 	add.w	r1, r0, r1, lsl #2
c0de77f0:	f643 4030 	movw	r0, #15408	@ 0x3c30
c0de77f4:	f2c0 0000 	movt	r0, #0
c0de77f8:	4478      	add	r0, pc
c0de77fa:	f8c1 00cc 	str.w	r0, [r1, #204]	@ 0xcc
c0de77fe:	2005      	movs	r0, #5
c0de7800:	f881 00d0 	strb.w	r0, [r1, #208]	@ 0xd0
c0de7804:	2001      	movs	r0, #1
c0de7806:	f881 00c9 	strb.w	r0, [r1, #201]	@ 0xc9
c0de780a:	f64f 705d 	movw	r0, #65373	@ 0xff5d
c0de780e:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de7812:	f64f 122d 	movw	r2, #63789	@ 0xf92d
c0de7816:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de781a:	4478      	add	r0, pc
c0de781c:	447a      	add	r2, pc
c0de781e:	f8c1 00d8 	str.w	r0, [r1, #216]	@ 0xd8
c0de7822:	4620      	mov	r0, r4
c0de7824:	f8c1 20dc 	str.w	r2, [r1, #220]	@ 0xdc
c0de7828:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de782c:	f000 b91e 	b.w	c0de7a6c <ux_stack_display>

c0de7830 <ux_layout_pbb_prepro>:
c0de7830:	b570      	push	{r4, r5, r6, lr}
c0de7832:	4605      	mov	r5, r0
c0de7834:	f7ff fcc4 	bl	c0de71c0 <ux_stack_get_current_step_params>
c0de7838:	f240 46d8 	movw	r6, #1240	@ 0x4d8
c0de783c:	f2c0 0600 	movt	r6, #0
c0de7840:	4604      	mov	r4, r0
c0de7842:	eb09 0006 	add.w	r0, r9, r6
c0de7846:	30a8      	adds	r0, #168	@ 0xa8
c0de7848:	4629      	mov	r1, r5
c0de784a:	2220      	movs	r2, #32
c0de784c:	f000 fe33 	bl	c0de84b6 <__aeabi_memmove>
c0de7850:	7868      	ldrb	r0, [r5, #1]
c0de7852:	280f      	cmp	r0, #15
c0de7854:	dc06      	bgt.n	c0de7864 <ux_layout_pbb_prepro+0x34>
c0de7856:	2801      	cmp	r0, #1
c0de7858:	d019      	beq.n	c0de788e <ux_layout_pbb_prepro+0x5e>
c0de785a:	2802      	cmp	r0, #2
c0de785c:	d01a      	beq.n	c0de7894 <ux_layout_pbb_prepro+0x64>
c0de785e:	280f      	cmp	r0, #15
c0de7860:	d00c      	beq.n	c0de787c <ux_layout_pbb_prepro+0x4c>
c0de7862:	e010      	b.n	c0de7886 <ux_layout_pbb_prepro+0x56>
c0de7864:	3810      	subs	r0, #16
c0de7866:	2802      	cmp	r0, #2
c0de7868:	d20d      	bcs.n	c0de7886 <ux_layout_pbb_prepro+0x56>
c0de786a:	eb09 0006 	add.w	r0, r9, r6
c0de786e:	f890 00a9 	ldrb.w	r0, [r0, #169]	@ 0xa9
c0de7872:	f000 000f 	and.w	r0, r0, #15
c0de7876:	eb04 0080 	add.w	r0, r4, r0, lsl #2
c0de787a:	1d04      	adds	r4, r0, #4
c0de787c:	6820      	ldr	r0, [r4, #0]
c0de787e:	eb09 0106 	add.w	r1, r9, r6
c0de7882:	f8c1 00c4 	str.w	r0, [r1, #196]	@ 0xc4
c0de7886:	eb09 0006 	add.w	r0, r9, r6
c0de788a:	30a8      	adds	r0, #168	@ 0xa8
c0de788c:	bd70      	pop	{r4, r5, r6, pc}
c0de788e:	f7ff fa3c 	bl	c0de6d0a <ux_flow_is_first>
c0de7892:	e001      	b.n	c0de7898 <ux_layout_pbb_prepro+0x68>
c0de7894:	f7ff fa67 	bl	c0de6d66 <ux_flow_is_last>
c0de7898:	2800      	cmp	r0, #0
c0de789a:	d0f4      	beq.n	c0de7886 <ux_layout_pbb_prepro+0x56>
c0de789c:	2000      	movs	r0, #0
c0de789e:	bd70      	pop	{r4, r5, r6, pc}

c0de78a0 <ux_layout_pbb_init_common>:
c0de78a0:	b510      	push	{r4, lr}
c0de78a2:	4604      	mov	r4, r0
c0de78a4:	f000 f90c 	bl	c0de7ac0 <ux_stack_init>
c0de78a8:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de78ac:	f2c0 0000 	movt	r0, #0
c0de78b0:	4448      	add	r0, r9
c0de78b2:	eb04 01c4 	add.w	r1, r4, r4, lsl #3
c0de78b6:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de78ba:	f643 4106 	movw	r1, #15366	@ 0x3c06
c0de78be:	f2c0 0100 	movt	r1, #0
c0de78c2:	4479      	add	r1, pc
c0de78c4:	f8c0 10cc 	str.w	r1, [r0, #204]	@ 0xcc
c0de78c8:	2106      	movs	r1, #6
c0de78ca:	f880 10d0 	strb.w	r1, [r0, #208]	@ 0xd0
c0de78ce:	2101      	movs	r1, #1
c0de78d0:	f880 10c9 	strb.w	r1, [r0, #201]	@ 0xc9
c0de78d4:	f64f 016d 	movw	r1, #63597	@ 0xf86d
c0de78d8:	f6cf 71ff 	movt	r1, #65535	@ 0xffff
c0de78dc:	4479      	add	r1, pc
c0de78de:	f8c0 10dc 	str.w	r1, [r0, #220]	@ 0xdc
c0de78e2:	bd10      	pop	{r4, pc}

c0de78e4 <ux_layout_pbb_init>:
c0de78e4:	b510      	push	{r4, lr}
c0de78e6:	4604      	mov	r4, r0
c0de78e8:	f000 f8ea 	bl	c0de7ac0 <ux_stack_init>
c0de78ec:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de78f0:	f2c0 0000 	movt	r0, #0
c0de78f4:	4448      	add	r0, r9
c0de78f6:	eb04 01c4 	add.w	r1, r4, r4, lsl #3
c0de78fa:	eb00 0181 	add.w	r1, r0, r1, lsl #2
c0de78fe:	f643 30c2 	movw	r0, #15298	@ 0x3bc2
c0de7902:	f2c0 0000 	movt	r0, #0
c0de7906:	4478      	add	r0, pc
c0de7908:	f8c1 00cc 	str.w	r0, [r1, #204]	@ 0xcc
c0de790c:	2006      	movs	r0, #6
c0de790e:	f881 00d0 	strb.w	r0, [r1, #208]	@ 0xd0
c0de7912:	2001      	movs	r0, #1
c0de7914:	f881 00c9 	strb.w	r0, [r1, #201]	@ 0xc9
c0de7918:	f64f 0221 	movw	r2, #63521	@ 0xf821
c0de791c:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de7920:	f64f 7003 	movw	r0, #65283	@ 0xff03
c0de7924:	f6cf 70ff 	movt	r0, #65535	@ 0xffff
c0de7928:	447a      	add	r2, pc
c0de792a:	4478      	add	r0, pc
c0de792c:	f8c1 00d8 	str.w	r0, [r1, #216]	@ 0xd8
c0de7930:	4620      	mov	r0, r4
c0de7932:	f8c1 20dc 	str.w	r2, [r1, #220]	@ 0xdc
c0de7936:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de793a:	f000 b897 	b.w	c0de7a6c <ux_stack_display>

c0de793e <ux_layout_pnn_prepro>:
c0de793e:	b580      	push	{r7, lr}
c0de7940:	f7ff ff76 	bl	c0de7830 <ux_layout_pbb_prepro>
c0de7944:	b170      	cbz	r0, c0de7964 <ux_layout_pnn_prepro+0x26>
c0de7946:	f240 41d8 	movw	r1, #1240	@ 0x4d8
c0de794a:	f2c0 0100 	movt	r1, #0
c0de794e:	eb09 0201 	add.w	r2, r9, r1
c0de7952:	f892 20a9 	ldrb.w	r2, [r2, #169]	@ 0xa9
c0de7956:	2a10      	cmp	r2, #16
c0de7958:	bf22      	ittt	cs
c0de795a:	4449      	addcs	r1, r9
c0de795c:	f248 020a 	movwcs	r2, #32778	@ 0x800a
c0de7960:	f8a1 20c0 	strhcs.w	r2, [r1, #192]	@ 0xc0
c0de7964:	bd80      	pop	{r7, pc}

c0de7966 <ux_layout_pnn_init>:
c0de7966:	b510      	push	{r4, lr}
c0de7968:	4604      	mov	r4, r0
c0de796a:	f7ff ff99 	bl	c0de78a0 <ux_layout_pbb_init_common>
c0de796e:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de7972:	f2c0 0000 	movt	r0, #0
c0de7976:	f64f 72b3 	movw	r2, #65459	@ 0xffb3
c0de797a:	4448      	add	r0, r9
c0de797c:	eb04 01c4 	add.w	r1, r4, r4, lsl #3
c0de7980:	f6cf 72ff 	movt	r2, #65535	@ 0xffff
c0de7984:	eb00 0181 	add.w	r1, r0, r1, lsl #2
c0de7988:	447a      	add	r2, pc
c0de798a:	4620      	mov	r0, r4
c0de798c:	f8c1 20d8 	str.w	r2, [r1, #216]	@ 0xd8
c0de7990:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de7994:	f000 b86a 	b.w	c0de7a6c <ux_stack_display>

c0de7998 <ux_layout_strings_prepro>:
c0de7998:	b570      	push	{r4, r5, r6, lr}
c0de799a:	4605      	mov	r5, r0
c0de799c:	f7ff fc10 	bl	c0de71c0 <ux_stack_get_current_step_params>
c0de79a0:	f240 46d8 	movw	r6, #1240	@ 0x4d8
c0de79a4:	f2c0 0600 	movt	r6, #0
c0de79a8:	4604      	mov	r4, r0
c0de79aa:	eb09 0006 	add.w	r0, r9, r6
c0de79ae:	30a8      	adds	r0, #168	@ 0xa8
c0de79b0:	4629      	mov	r1, r5
c0de79b2:	2220      	movs	r2, #32
c0de79b4:	f000 fd7f 	bl	c0de84b6 <__aeabi_memmove>
c0de79b8:	7868      	ldrb	r0, [r5, #1]
c0de79ba:	2802      	cmp	r0, #2
c0de79bc:	d004      	beq.n	c0de79c8 <ux_layout_strings_prepro+0x30>
c0de79be:	2801      	cmp	r0, #1
c0de79c0:	d107      	bne.n	c0de79d2 <ux_layout_strings_prepro+0x3a>
c0de79c2:	f7ff f9a2 	bl	c0de6d0a <ux_flow_is_first>
c0de79c6:	e001      	b.n	c0de79cc <ux_layout_strings_prepro+0x34>
c0de79c8:	f7ff f9cd 	bl	c0de6d66 <ux_flow_is_last>
c0de79cc:	b180      	cbz	r0, c0de79f0 <ux_layout_strings_prepro+0x58>
c0de79ce:	2000      	movs	r0, #0
c0de79d0:	bd70      	pop	{r4, r5, r6, pc}
c0de79d2:	eb09 0006 	add.w	r0, r9, r6
c0de79d6:	f890 00a9 	ldrb.w	r0, [r0, #169]	@ 0xa9
c0de79da:	f010 0ff0 	tst.w	r0, #240	@ 0xf0
c0de79de:	d007      	beq.n	c0de79f0 <ux_layout_strings_prepro+0x58>
c0de79e0:	f000 000f 	and.w	r0, r0, #15
c0de79e4:	f854 0020 	ldr.w	r0, [r4, r0, lsl #2]
c0de79e8:	eb09 0106 	add.w	r1, r9, r6
c0de79ec:	f8c1 00c4 	str.w	r0, [r1, #196]	@ 0xc4
c0de79f0:	eb09 0006 	add.w	r0, r9, r6
c0de79f4:	30a8      	adds	r0, #168	@ 0xa8
c0de79f6:	bd70      	pop	{r4, r5, r6, pc}

c0de79f8 <ux_stack_push>:
c0de79f8:	b5b0      	push	{r4, r5, r7, lr}
c0de79fa:	f240 44d8 	movw	r4, #1240	@ 0x4d8
c0de79fe:	f2c0 0400 	movt	r4, #0
c0de7a02:	f819 0004 	ldrb.w	r0, [r9, r4]
c0de7a06:	b968      	cbnz	r0, c0de7a24 <ux_stack_push+0x2c>
c0de7a08:	eb09 0504 	add.w	r5, r9, r4
c0de7a0c:	f105 00c8 	add.w	r0, r5, #200	@ 0xc8
c0de7a10:	2124      	movs	r1, #36	@ 0x24
c0de7a12:	f000 fd4b 	bl	c0de84ac <__aeabi_memclr>
c0de7a16:	2000      	movs	r0, #0
c0de7a18:	e9c5 0007 	strd	r0, r0, [r5, #28]
c0de7a1c:	6268      	str	r0, [r5, #36]	@ 0x24
c0de7a1e:	2001      	movs	r0, #1
c0de7a20:	f809 0004 	strb.w	r0, [r9, r4]
c0de7a24:	3801      	subs	r0, #1
c0de7a26:	bdb0      	pop	{r4, r5, r7, pc}

c0de7a28 <ux_stack_redisplay>:
c0de7a28:	b580      	push	{r7, lr}
c0de7a2a:	f7ff fbd2 	bl	c0de71d2 <ux_flow_relayout>
c0de7a2e:	b100      	cbz	r0, c0de7a32 <ux_stack_redisplay+0xa>
c0de7a30:	bd80      	pop	{r7, pc}
c0de7a32:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de7a36:	f2c0 0000 	movt	r0, #0
c0de7a3a:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de7a3e:	2901      	cmp	r1, #1
c0de7a40:	d109      	bne.n	c0de7a56 <ux_stack_redisplay+0x2e>
c0de7a42:	eb09 0100 	add.w	r1, r9, r0
c0de7a46:	2200      	movs	r2, #0
c0de7a48:	2000      	movs	r0, #0
c0de7a4a:	f8a1 20ca 	strh.w	r2, [r1, #202]	@ 0xca
c0de7a4e:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de7a52:	f000 b80b 	b.w	c0de7a6c <ux_stack_display>
c0de7a56:	2900      	cmp	r1, #0
c0de7a58:	d1ea      	bne.n	c0de7a30 <ux_stack_redisplay+0x8>
c0de7a5a:	eb09 0100 	add.w	r1, r9, r0
c0de7a5e:	7849      	ldrb	r1, [r1, #1]
c0de7a60:	29aa      	cmp	r1, #170	@ 0xaa
c0de7a62:	bf02      	ittt	eq
c0de7a64:	4448      	addeq	r0, r9
c0de7a66:	2169      	moveq	r1, #105	@ 0x69
c0de7a68:	7041      	strbeq	r1, [r0, #1]
c0de7a6a:	bd80      	pop	{r7, pc}

c0de7a6c <ux_stack_display>:
c0de7a6c:	f240 41d8 	movw	r1, #1240	@ 0x4d8
c0de7a70:	f2c0 0100 	movt	r1, #0
c0de7a74:	f819 2001 	ldrb.w	r2, [r9, r1]
c0de7a78:	1c43      	adds	r3, r0, #1
c0de7a7a:	b16a      	cbz	r2, c0de7a98 <ux_stack_display+0x2c>
c0de7a7c:	4293      	cmp	r3, r2
c0de7a7e:	d10b      	bne.n	c0de7a98 <ux_stack_display+0x2c>
c0de7a80:	4449      	add	r1, r9
c0de7a82:	eb00 00c0 	add.w	r0, r0, r0, lsl #3
c0de7a86:	eb01 0180 	add.w	r1, r1, r0, lsl #2
c0de7a8a:	f101 00c8 	add.w	r0, r1, #200	@ 0xc8
c0de7a8e:	2200      	movs	r2, #0
c0de7a90:	f8a1 20ca 	strh.w	r2, [r1, #202]	@ 0xca
c0de7a94:	f000 b824 	b.w	c0de7ae0 <ux_stack_display_elements>
c0de7a98:	fab3 f083 	clz	r0, r3
c0de7a9c:	fab2 f282 	clz	r2, r2
c0de7aa0:	0940      	lsrs	r0, r0, #5
c0de7aa2:	0952      	lsrs	r2, r2, #5
c0de7aa4:	4310      	orrs	r0, r2
c0de7aa6:	2801      	cmp	r0, #1
c0de7aa8:	bf18      	it	ne
c0de7aaa:	4770      	bxne	lr
c0de7aac:	eb09 0001 	add.w	r0, r9, r1
c0de7ab0:	7840      	ldrb	r0, [r0, #1]
c0de7ab2:	28aa      	cmp	r0, #170	@ 0xaa
c0de7ab4:	bf02      	ittt	eq
c0de7ab6:	eb09 0001 	addeq.w	r0, r9, r1
c0de7aba:	2169      	moveq	r1, #105	@ 0x69
c0de7abc:	7041      	strbeq	r1, [r0, #1]
c0de7abe:	4770      	bx	lr

c0de7ac0 <ux_stack_init>:
c0de7ac0:	b100      	cbz	r0, c0de7ac4 <ux_stack_init+0x4>
c0de7ac2:	4770      	bx	lr
c0de7ac4:	b580      	push	{r7, lr}
c0de7ac6:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de7aca:	f2c0 0000 	movt	r0, #0
c0de7ace:	4448      	add	r0, r9
c0de7ad0:	30c8      	adds	r0, #200	@ 0xc8
c0de7ad2:	2124      	movs	r1, #36	@ 0x24
c0de7ad4:	f000 fcea 	bl	c0de84ac <__aeabi_memclr>
c0de7ad8:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de7adc:	4770      	bx	lr
c0de7ade:	d4d4      	bmi.n	c0de7a8a <ux_stack_display+0x1e>

c0de7ae0 <ux_stack_display_elements>:
c0de7ae0:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de7ae4:	b081      	sub	sp, #4
c0de7ae6:	4604      	mov	r4, r0
c0de7ae8:	f000 faba 	bl	c0de8060 <os_perso_isonboarded>
c0de7aec:	28aa      	cmp	r0, #170	@ 0xaa
c0de7aee:	d103      	bne.n	c0de7af8 <ux_stack_display_elements+0x18>
c0de7af0:	f000 faf0 	bl	c0de80d4 <os_global_pin_is_validated>
c0de7af4:	28aa      	cmp	r0, #170	@ 0xaa
c0de7af6:	d151      	bne.n	c0de7b9c <ux_stack_display_elements+0xbc>
c0de7af8:	7860      	ldrb	r0, [r4, #1]
c0de7afa:	b3b0      	cbz	r0, c0de7b6a <ux_stack_display_elements+0x8a>
c0de7afc:	8860      	ldrh	r0, [r4, #2]
c0de7afe:	f894 8008 	ldrb.w	r8, [r4, #8]
c0de7b02:	4540      	cmp	r0, r8
c0de7b04:	d233      	bcs.n	c0de7b6e <ux_stack_display_elements+0x8e>
c0de7b06:	f240 4ad8 	movw	sl, #1240	@ 0x4d8
c0de7b0a:	1c47      	adds	r7, r0, #1
c0de7b0c:	0146      	lsls	r6, r0, #5
c0de7b0e:	f2c0 0a00 	movt	sl, #0
c0de7b12:	bf00      	nop
c0de7b14:	3001      	adds	r0, #1
c0de7b16:	8060      	strh	r0, [r4, #2]
c0de7b18:	f819 000a 	ldrb.w	r0, [r9, sl]
c0de7b1c:	6861      	ldr	r1, [r4, #4]
c0de7b1e:	eb01 0506 	add.w	r5, r1, r6
c0de7b22:	b168      	cbz	r0, c0de7b40 <ux_stack_display_elements+0x60>
c0de7b24:	eb00 00c0 	add.w	r0, r0, r0, lsl #3
c0de7b28:	eb09 010a 	add.w	r1, r9, sl
c0de7b2c:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de7b30:	f8d0 10b4 	ldr.w	r1, [r0, #180]	@ 0xb4
c0de7b34:	b121      	cbz	r1, c0de7b40 <ux_stack_display_elements+0x60>
c0de7b36:	4628      	mov	r0, r5
c0de7b38:	4788      	blx	r1
c0de7b3a:	b1a0      	cbz	r0, c0de7b66 <ux_stack_display_elements+0x86>
c0de7b3c:	2801      	cmp	r0, #1
c0de7b3e:	d100      	bne.n	c0de7b42 <ux_stack_display_elements+0x62>
c0de7b40:	4628      	mov	r0, r5
c0de7b42:	b128      	cbz	r0, c0de7b50 <ux_stack_display_elements+0x70>
c0de7b44:	2801      	cmp	r0, #1
c0de7b46:	bf08      	it	eq
c0de7b48:	4628      	moveq	r0, r5
c0de7b4a:	f7fd fffc 	bl	c0de5b46 <io_seph_ux_display_bagl_element>
c0de7b4e:	e003      	b.n	c0de7b58 <ux_stack_display_elements+0x78>
c0de7b50:	eb09 000a 	add.w	r0, r9, sl
c0de7b54:	7840      	ldrb	r0, [r0, #1]
c0de7b56:	bb08      	cbnz	r0, c0de7b9c <ux_stack_display_elements+0xbc>
c0de7b58:	7a20      	ldrb	r0, [r4, #8]
c0de7b5a:	4287      	cmp	r7, r0
c0de7b5c:	d207      	bcs.n	c0de7b6e <ux_stack_display_elements+0x8e>
c0de7b5e:	8860      	ldrh	r0, [r4, #2]
c0de7b60:	3701      	adds	r7, #1
c0de7b62:	3620      	adds	r6, #32
c0de7b64:	e7d6      	b.n	c0de7b14 <ux_stack_display_elements+0x34>
c0de7b66:	2000      	movs	r0, #0
c0de7b68:	e7eb      	b.n	c0de7b42 <ux_stack_display_elements+0x62>
c0de7b6a:	f04f 0800 	mov.w	r8, #0
c0de7b6e:	8860      	ldrh	r0, [r4, #2]
c0de7b70:	4540      	cmp	r0, r8
c0de7b72:	d113      	bne.n	c0de7b9c <ux_stack_display_elements+0xbc>
c0de7b74:	f000 fb48 	bl	c0de8208 <screen_update>
c0de7b78:	8860      	ldrh	r0, [r4, #2]
c0de7b7a:	68e1      	ldr	r1, [r4, #12]
c0de7b7c:	3001      	adds	r0, #1
c0de7b7e:	8060      	strh	r0, [r4, #2]
c0de7b80:	b119      	cbz	r1, c0de7b8a <ux_stack_display_elements+0xaa>
c0de7b82:	2000      	movs	r0, #0
c0de7b84:	2500      	movs	r5, #0
c0de7b86:	4788      	blx	r1
c0de7b88:	b108      	cbz	r0, c0de7b8e <ux_stack_display_elements+0xae>
c0de7b8a:	7825      	ldrb	r5, [r4, #0]
c0de7b8c:	e000      	b.n	c0de7b90 <ux_stack_display_elements+0xb0>
c0de7b8e:	8065      	strh	r5, [r4, #2]
c0de7b90:	f240 40d8 	movw	r0, #1240	@ 0x4d8
c0de7b94:	f2c0 0000 	movt	r0, #0
c0de7b98:	4448      	add	r0, r9
c0de7b9a:	7045      	strb	r5, [r0, #1]
c0de7b9c:	b001      	add	sp, #4
c0de7b9e:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de7ba2 <cx_blake2b_init_no_throw>:
c0de7ba2:	b403      	push	{r0, r1}
c0de7ba4:	f04f 001a 	mov.w	r0, #26
c0de7ba8:	e034      	b.n	c0de7c14 <cx_trampoline_helper>

c0de7baa <cx_ecfp_generate_pair_no_throw>:
c0de7baa:	b403      	push	{r0, r1}
c0de7bac:	f04f 0032 	mov.w	r0, #50	@ 0x32
c0de7bb0:	e030      	b.n	c0de7c14 <cx_trampoline_helper>

c0de7bb2 <cx_ecfp_init_private_key_no_throw>:
c0de7bb2:	b403      	push	{r0, r1}
c0de7bb4:	f04f 0033 	mov.w	r0, #51	@ 0x33
c0de7bb8:	e02c      	b.n	c0de7c14 <cx_trampoline_helper>

c0de7bba <cx_ecfp_init_public_key_no_throw>:
c0de7bba:	b403      	push	{r0, r1}
c0de7bbc:	f04f 0034 	mov.w	r0, #52	@ 0x34
c0de7bc0:	e028      	b.n	c0de7c14 <cx_trampoline_helper>

c0de7bc2 <cx_ecfp_scalar_mult_no_throw>:
c0de7bc2:	b403      	push	{r0, r1}
c0de7bc4:	f04f 0035 	mov.w	r0, #53	@ 0x35
c0de7bc8:	e024      	b.n	c0de7c14 <cx_trampoline_helper>

c0de7bca <cx_edwards_compress_point_no_throw>:
c0de7bca:	b403      	push	{r0, r1}
c0de7bcc:	f04f 003c 	mov.w	r0, #60	@ 0x3c
c0de7bd0:	e020      	b.n	c0de7c14 <cx_trampoline_helper>

c0de7bd2 <cx_hash_get_size>:
c0de7bd2:	b403      	push	{r0, r1}
c0de7bd4:	f04f 0041 	mov.w	r0, #65	@ 0x41
c0de7bd8:	e01c      	b.n	c0de7c14 <cx_trampoline_helper>

c0de7bda <cx_hash_no_throw>:
c0de7bda:	b403      	push	{r0, r1}
c0de7bdc:	f04f 0044 	mov.w	r0, #68	@ 0x44
c0de7be0:	e018      	b.n	c0de7c14 <cx_trampoline_helper>

c0de7be2 <cx_keccak_init_no_throw>:
c0de7be2:	b403      	push	{r0, r1}
c0de7be4:	f04f 0056 	mov.w	r0, #86	@ 0x56
c0de7be8:	e014      	b.n	c0de7c14 <cx_trampoline_helper>

c0de7bea <cx_math_addm_no_throw>:
c0de7bea:	b403      	push	{r0, r1}
c0de7bec:	f04f 0057 	mov.w	r0, #87	@ 0x57
c0de7bf0:	e010      	b.n	c0de7c14 <cx_trampoline_helper>

c0de7bf2 <cx_math_modm_no_throw>:
c0de7bf2:	b403      	push	{r0, r1}
c0de7bf4:	f04f 005d 	mov.w	r0, #93	@ 0x5d
c0de7bf8:	e00c      	b.n	c0de7c14 <cx_trampoline_helper>

c0de7bfa <cx_math_multm_no_throw>:
c0de7bfa:	b403      	push	{r0, r1}
c0de7bfc:	f04f 005e 	mov.w	r0, #94	@ 0x5e
c0de7c00:	e008      	b.n	c0de7c14 <cx_trampoline_helper>

c0de7c02 <cx_sha512_init_no_throw>:
c0de7c02:	b403      	push	{r0, r1}
c0de7c04:	f04f 007a 	mov.w	r0, #122	@ 0x7a
c0de7c08:	e004      	b.n	c0de7c14 <cx_trampoline_helper>
c0de7c0a:	d4d4      	bmi.n	c0de7bb6 <cx_ecfp_init_private_key_no_throw+0x4>

c0de7c0c <cx_aes_siv_reset>:
c0de7c0c:	b403      	push	{r0, r1}
c0de7c0e:	f04f 0090 	mov.w	r0, #144	@ 0x90
c0de7c12:	e7ff      	b.n	c0de7c14 <cx_trampoline_helper>

c0de7c14 <cx_trampoline_helper>:
c0de7c14:	4900      	ldr	r1, [pc, #0]	@ (c0de7c18 <cx_trampoline_helper+0x4>)
c0de7c16:	4708      	bx	r1
c0de7c18:	00210001 	.word	0x00210001

c0de7c1c <os_boot>:
c0de7c1c:	2000      	movs	r0, #0
c0de7c1e:	f000 bad7 	b.w	c0de81d0 <try_context_set>

c0de7c22 <os_longjmp>:
c0de7c22:	4604      	mov	r4, r0
c0de7c24:	f000 faca 	bl	c0de81bc <try_context_get>
c0de7c28:	4621      	mov	r1, r4
c0de7c2a:	f000 fc97 	bl	c0de855c <longjmp>
c0de7c2e:	d4d4      	bmi.n	c0de7bda <cx_hash_no_throw>

c0de7c30 <snprintf>:
c0de7c30:	b081      	sub	sp, #4
c0de7c32:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7c36:	b089      	sub	sp, #36	@ 0x24
c0de7c38:	2800      	cmp	r0, #0
c0de7c3a:	9311      	str	r3, [sp, #68]	@ 0x44
c0de7c3c:	f000 81c1 	beq.w	c0de7fc2 <snprintf+0x392>
c0de7c40:	460e      	mov	r6, r1
c0de7c42:	2900      	cmp	r1, #0
c0de7c44:	f000 81bd 	beq.w	c0de7fc2 <snprintf+0x392>
c0de7c48:	4631      	mov	r1, r6
c0de7c4a:	4615      	mov	r5, r2
c0de7c4c:	4604      	mov	r4, r0
c0de7c4e:	f000 fc2d 	bl	c0de84ac <__aeabi_memclr>
c0de7c52:	f1b6 0b01 	subs.w	fp, r6, #1
c0de7c56:	f000 81b4 	beq.w	c0de7fc2 <snprintf+0x392>
c0de7c5a:	7828      	ldrb	r0, [r5, #0]
c0de7c5c:	a911      	add	r1, sp, #68	@ 0x44
c0de7c5e:	2800      	cmp	r0, #0
c0de7c60:	9104      	str	r1, [sp, #16]
c0de7c62:	f000 81ae 	beq.w	c0de7fc2 <snprintf+0x392>
c0de7c66:	46a6      	mov	lr, r4
c0de7c68:	2400      	movs	r4, #0
c0de7c6a:	bf00      	nop
c0de7c6c:	b130      	cbz	r0, c0de7c7c <snprintf+0x4c>
c0de7c6e:	2825      	cmp	r0, #37	@ 0x25
c0de7c70:	d004      	beq.n	c0de7c7c <snprintf+0x4c>
c0de7c72:	1928      	adds	r0, r5, r4
c0de7c74:	7840      	ldrb	r0, [r0, #1]
c0de7c76:	3401      	adds	r4, #1
c0de7c78:	e7f8      	b.n	c0de7c6c <snprintf+0x3c>
c0de7c7a:	bf00      	nop
c0de7c7c:	465f      	mov	r7, fp
c0de7c7e:	455c      	cmp	r4, fp
c0de7c80:	bf38      	it	cc
c0de7c82:	4627      	movcc	r7, r4
c0de7c84:	4670      	mov	r0, lr
c0de7c86:	4629      	mov	r1, r5
c0de7c88:	463a      	mov	r2, r7
c0de7c8a:	4676      	mov	r6, lr
c0de7c8c:	f000 fc13 	bl	c0de84b6 <__aeabi_memmove>
c0de7c90:	ebbb 0807 	subs.w	r8, fp, r7
c0de7c94:	f000 8195 	beq.w	c0de7fc2 <snprintf+0x392>
c0de7c98:	5de8      	ldrb	r0, [r5, r7]
c0de7c9a:	46b6      	mov	lr, r6
c0de7c9c:	eb06 0e07 	add.w	lr, r6, r7
c0de7ca0:	2825      	cmp	r0, #37	@ 0x25
c0de7ca2:	443d      	add	r5, r7
c0de7ca4:	f040 8174 	bne.w	c0de7f90 <snprintf+0x360>
c0de7ca8:	3501      	adds	r5, #1
c0de7caa:	f04f 0a00 	mov.w	sl, #0
c0de7cae:	2220      	movs	r2, #32
c0de7cb0:	2600      	movs	r6, #0
c0de7cb2:	2000      	movs	r0, #0
c0de7cb4:	3501      	adds	r5, #1
c0de7cb6:	f815 1c01 	ldrb.w	r1, [r5, #-1]
c0de7cba:	3501      	adds	r5, #1
c0de7cbc:	292d      	cmp	r1, #45	@ 0x2d
c0de7cbe:	dc11      	bgt.n	c0de7ce4 <snprintf+0xb4>
c0de7cc0:	f04f 0000 	mov.w	r0, #0
c0de7cc4:	d0f7      	beq.n	c0de7cb6 <snprintf+0x86>
c0de7cc6:	2925      	cmp	r1, #37	@ 0x25
c0de7cc8:	d06e      	beq.n	c0de7da8 <snprintf+0x178>
c0de7cca:	292a      	cmp	r1, #42	@ 0x2a
c0de7ccc:	f040 815e 	bne.w	c0de7f8c <snprintf+0x35c>
c0de7cd0:	462b      	mov	r3, r5
c0de7cd2:	f813 0d01 	ldrb.w	r0, [r3, #-1]!
c0de7cd6:	2873      	cmp	r0, #115	@ 0x73
c0de7cd8:	f040 8171 	bne.w	c0de7fbe <snprintf+0x38e>
c0de7cdc:	9904      	ldr	r1, [sp, #16]
c0de7cde:	2002      	movs	r0, #2
c0de7ce0:	461d      	mov	r5, r3
c0de7ce2:	e025      	b.n	c0de7d30 <snprintf+0x100>
c0de7ce4:	2947      	cmp	r1, #71	@ 0x47
c0de7ce6:	dc27      	bgt.n	c0de7d38 <snprintf+0x108>
c0de7ce8:	f1a1 0330 	sub.w	r3, r1, #48	@ 0x30
c0de7cec:	2b0a      	cmp	r3, #10
c0de7cee:	d20d      	bcs.n	c0de7d0c <snprintf+0xdc>
c0de7cf0:	f081 0330 	eor.w	r3, r1, #48	@ 0x30
c0de7cf4:	ea53 030a 	orrs.w	r3, r3, sl
c0de7cf8:	eb0a 038a 	add.w	r3, sl, sl, lsl #2
c0de7cfc:	eb01 0143 	add.w	r1, r1, r3, lsl #1
c0de7d00:	bf08      	it	eq
c0de7d02:	2230      	moveq	r2, #48	@ 0x30
c0de7d04:	f1a1 0a30 	sub.w	sl, r1, #48	@ 0x30
c0de7d08:	3d01      	subs	r5, #1
c0de7d0a:	e7d3      	b.n	c0de7cb4 <snprintf+0x84>
c0de7d0c:	292e      	cmp	r1, #46	@ 0x2e
c0de7d0e:	f040 813d 	bne.w	c0de7f8c <snprintf+0x35c>
c0de7d12:	f815 0c01 	ldrb.w	r0, [r5, #-1]
c0de7d16:	282a      	cmp	r0, #42	@ 0x2a
c0de7d18:	f040 8151 	bne.w	c0de7fbe <snprintf+0x38e>
c0de7d1c:	7828      	ldrb	r0, [r5, #0]
c0de7d1e:	2848      	cmp	r0, #72	@ 0x48
c0de7d20:	d004      	beq.n	c0de7d2c <snprintf+0xfc>
c0de7d22:	2873      	cmp	r0, #115	@ 0x73
c0de7d24:	d002      	beq.n	c0de7d2c <snprintf+0xfc>
c0de7d26:	2868      	cmp	r0, #104	@ 0x68
c0de7d28:	f040 8148 	bne.w	c0de7fbc <snprintf+0x38c>
c0de7d2c:	9904      	ldr	r1, [sp, #16]
c0de7d2e:	2001      	movs	r0, #1
c0de7d30:	1d0b      	adds	r3, r1, #4
c0de7d32:	9304      	str	r3, [sp, #16]
c0de7d34:	680e      	ldr	r6, [r1, #0]
c0de7d36:	e7bd      	b.n	c0de7cb4 <snprintf+0x84>
c0de7d38:	2967      	cmp	r1, #103	@ 0x67
c0de7d3a:	dd08      	ble.n	c0de7d4e <snprintf+0x11e>
c0de7d3c:	2972      	cmp	r1, #114	@ 0x72
c0de7d3e:	dd11      	ble.n	c0de7d64 <snprintf+0x134>
c0de7d40:	2973      	cmp	r1, #115	@ 0x73
c0de7d42:	d036      	beq.n	c0de7db2 <snprintf+0x182>
c0de7d44:	2975      	cmp	r1, #117	@ 0x75
c0de7d46:	d037      	beq.n	c0de7db8 <snprintf+0x188>
c0de7d48:	2978      	cmp	r1, #120	@ 0x78
c0de7d4a:	d011      	beq.n	c0de7d70 <snprintf+0x140>
c0de7d4c:	e11e      	b.n	c0de7f8c <snprintf+0x35c>
c0de7d4e:	2962      	cmp	r1, #98	@ 0x62
c0de7d50:	dc17      	bgt.n	c0de7d82 <snprintf+0x152>
c0de7d52:	2948      	cmp	r1, #72	@ 0x48
c0de7d54:	f000 80ae 	beq.w	c0de7eb4 <snprintf+0x284>
c0de7d58:	2958      	cmp	r1, #88	@ 0x58
c0de7d5a:	f040 8117 	bne.w	c0de7f8c <snprintf+0x35c>
c0de7d5e:	f04f 0c01 	mov.w	ip, #1
c0de7d62:	e007      	b.n	c0de7d74 <snprintf+0x144>
c0de7d64:	2968      	cmp	r1, #104	@ 0x68
c0de7d66:	f000 80ad 	beq.w	c0de7ec4 <snprintf+0x294>
c0de7d6a:	2970      	cmp	r1, #112	@ 0x70
c0de7d6c:	f040 810e 	bne.w	c0de7f8c <snprintf+0x35c>
c0de7d70:	f04f 0c00 	mov.w	ip, #0
c0de7d74:	9804      	ldr	r0, [sp, #16]
c0de7d76:	2600      	movs	r6, #0
c0de7d78:	1d01      	adds	r1, r0, #4
c0de7d7a:	9104      	str	r1, [sp, #16]
c0de7d7c:	6804      	ldr	r4, [r0, #0]
c0de7d7e:	2710      	movs	r7, #16
c0de7d80:	e022      	b.n	c0de7dc8 <snprintf+0x198>
c0de7d82:	2963      	cmp	r1, #99	@ 0x63
c0de7d84:	f000 80f7 	beq.w	c0de7f76 <snprintf+0x346>
c0de7d88:	2964      	cmp	r1, #100	@ 0x64
c0de7d8a:	f040 80ff 	bne.w	c0de7f8c <snprintf+0x35c>
c0de7d8e:	9804      	ldr	r0, [sp, #16]
c0de7d90:	1d01      	adds	r1, r0, #4
c0de7d92:	9104      	str	r1, [sp, #16]
c0de7d94:	6800      	ldr	r0, [r0, #0]
c0de7d96:	2800      	cmp	r0, #0
c0de7d98:	4604      	mov	r4, r0
c0de7d9a:	d500      	bpl.n	c0de7d9e <snprintf+0x16e>
c0de7d9c:	4244      	negs	r4, r0
c0de7d9e:	0fc6      	lsrs	r6, r0, #31
c0de7da0:	f04f 0c00 	mov.w	ip, #0
c0de7da4:	270a      	movs	r7, #10
c0de7da6:	e00f      	b.n	c0de7dc8 <snprintf+0x198>
c0de7da8:	f1b8 0801 	subs.w	r8, r8, #1
c0de7dac:	f04f 0025 	mov.w	r0, #37	@ 0x25
c0de7db0:	e0e8      	b.n	c0de7f84 <snprintf+0x354>
c0de7db2:	f04f 0c00 	mov.w	ip, #0
c0de7db6:	e087      	b.n	c0de7ec8 <snprintf+0x298>
c0de7db8:	9804      	ldr	r0, [sp, #16]
c0de7dba:	2600      	movs	r6, #0
c0de7dbc:	1d01      	adds	r1, r0, #4
c0de7dbe:	9104      	str	r1, [sp, #16]
c0de7dc0:	6804      	ldr	r4, [r0, #0]
c0de7dc2:	270a      	movs	r7, #10
c0de7dc4:	f04f 0c00 	mov.w	ip, #0
c0de7dc8:	42a7      	cmp	r7, r4
c0de7dca:	d902      	bls.n	c0de7dd2 <snprintf+0x1a2>
c0de7dcc:	f04f 0b01 	mov.w	fp, #1
c0de7dd0:	e00f      	b.n	c0de7df2 <snprintf+0x1c2>
c0de7dd2:	f1aa 0101 	sub.w	r1, sl, #1
c0de7dd6:	4638      	mov	r0, r7
c0de7dd8:	4683      	mov	fp, r0
c0de7dda:	fba7 0300 	umull	r0, r3, r7, r0
c0de7dde:	2b00      	cmp	r3, #0
c0de7de0:	bf18      	it	ne
c0de7de2:	2301      	movne	r3, #1
c0de7de4:	42a0      	cmp	r0, r4
c0de7de6:	468a      	mov	sl, r1
c0de7de8:	d803      	bhi.n	c0de7df2 <snprintf+0x1c2>
c0de7dea:	2b00      	cmp	r3, #0
c0de7dec:	f1aa 0101 	sub.w	r1, sl, #1
c0de7df0:	d0f2      	beq.n	c0de7dd8 <snprintf+0x1a8>
c0de7df2:	2e00      	cmp	r6, #0
c0de7df4:	4633      	mov	r3, r6
c0de7df6:	4650      	mov	r0, sl
c0de7df8:	bf1c      	itt	ne
c0de7dfa:	f04f 33ff 	movne.w	r3, #4294967295	@ 0xffffffff
c0de7dfe:	3801      	subne	r0, #1
c0de7e00:	9603      	str	r6, [sp, #12]
c0de7e02:	2e00      	cmp	r6, #0
c0de7e04:	f04f 0600 	mov.w	r6, #0
c0de7e08:	d008      	beq.n	c0de7e1c <snprintf+0x1ec>
c0de7e0a:	b2d1      	uxtb	r1, r2
c0de7e0c:	2930      	cmp	r1, #48	@ 0x30
c0de7e0e:	d105      	bne.n	c0de7e1c <snprintf+0x1ec>
c0de7e10:	212d      	movs	r1, #45	@ 0x2d
c0de7e12:	f88d 1014 	strb.w	r1, [sp, #20]
c0de7e16:	2100      	movs	r1, #0
c0de7e18:	2601      	movs	r6, #1
c0de7e1a:	9103      	str	r1, [sp, #12]
c0de7e1c:	f1a0 0110 	sub.w	r1, r0, #16
c0de7e20:	f111 0f0e 	cmn.w	r1, #14
c0de7e24:	d30e      	bcc.n	c0de7e44 <snprintf+0x214>
c0de7e26:	1e41      	subs	r1, r0, #1
c0de7e28:	a805      	add	r0, sp, #20
c0de7e2a:	4430      	add	r0, r6
c0de7e2c:	b2d2      	uxtb	r2, r2
c0de7e2e:	e88d 5008 	stmia.w	sp, {r3, ip, lr}
c0de7e32:	f000 fb42 	bl	c0de84ba <__aeabi_memset>
c0de7e36:	9900      	ldr	r1, [sp, #0]
c0de7e38:	eb0a 0006 	add.w	r0, sl, r6
c0de7e3c:	e9dd ce01 	ldrd	ip, lr, [sp, #4]
c0de7e40:	4408      	add	r0, r1
c0de7e42:	1e46      	subs	r6, r0, #1
c0de7e44:	9803      	ldr	r0, [sp, #12]
c0de7e46:	b120      	cbz	r0, c0de7e52 <snprintf+0x222>
c0de7e48:	202d      	movs	r0, #45	@ 0x2d
c0de7e4a:	a905      	add	r1, sp, #20
c0de7e4c:	5588      	strb	r0, [r1, r6]
c0de7e4e:	3601      	adds	r6, #1
c0de7e50:	e000      	b.n	c0de7e54 <snprintf+0x224>
c0de7e52:	a905      	add	r1, sp, #20
c0de7e54:	f1bb 0f00 	cmp.w	fp, #0
c0de7e58:	d01c      	beq.n	c0de7e94 <snprintf+0x264>
c0de7e5a:	f242 70b6 	movw	r0, #10166	@ 0x27b6
c0de7e5e:	f2c0 0000 	movt	r0, #0
c0de7e62:	f242 729c 	movw	r2, #10140	@ 0x279c
c0de7e66:	4478      	add	r0, pc
c0de7e68:	f2c0 0200 	movt	r2, #0
c0de7e6c:	f1bc 0f00 	cmp.w	ip, #0
c0de7e70:	447a      	add	r2, pc
c0de7e72:	bf08      	it	eq
c0de7e74:	4610      	moveq	r0, r2
c0de7e76:	bf00      	nop
c0de7e78:	fbb4 f3fb 	udiv	r3, r4, fp
c0de7e7c:	455f      	cmp	r7, fp
c0de7e7e:	fbb3 f2f7 	udiv	r2, r3, r7
c0de7e82:	fbbb fbf7 	udiv	fp, fp, r7
c0de7e86:	fb02 3217 	mls	r2, r2, r7, r3
c0de7e8a:	5c82      	ldrb	r2, [r0, r2]
c0de7e8c:	558a      	strb	r2, [r1, r6]
c0de7e8e:	f106 0601 	add.w	r6, r6, #1
c0de7e92:	d9f1      	bls.n	c0de7e78 <snprintf+0x248>
c0de7e94:	4546      	cmp	r6, r8
c0de7e96:	bf28      	it	cs
c0de7e98:	4646      	movcs	r6, r8
c0de7e9a:	4670      	mov	r0, lr
c0de7e9c:	4632      	mov	r2, r6
c0de7e9e:	4674      	mov	r4, lr
c0de7ea0:	f000 fb09 	bl	c0de84b6 <__aeabi_memmove>
c0de7ea4:	ebb8 0806 	subs.w	r8, r8, r6
c0de7ea8:	f000 808b 	beq.w	c0de7fc2 <snprintf+0x392>
c0de7eac:	46a6      	mov	lr, r4
c0de7eae:	eb04 0e06 	add.w	lr, r4, r6
c0de7eb2:	e06b      	b.n	c0de7f8c <snprintf+0x35c>
c0de7eb4:	f242 725c 	movw	r2, #10076	@ 0x275c
c0de7eb8:	f2c0 0200 	movt	r2, #0
c0de7ebc:	f04f 0c01 	mov.w	ip, #1
c0de7ec0:	447a      	add	r2, pc
c0de7ec2:	e006      	b.n	c0de7ed2 <snprintf+0x2a2>
c0de7ec4:	f04f 0c01 	mov.w	ip, #1
c0de7ec8:	f242 723c 	movw	r2, #10044	@ 0x273c
c0de7ecc:	f2c0 0200 	movt	r2, #0
c0de7ed0:	447a      	add	r2, pc
c0de7ed2:	9904      	ldr	r1, [sp, #16]
c0de7ed4:	b2c0      	uxtb	r0, r0
c0de7ed6:	1d0b      	adds	r3, r1, #4
c0de7ed8:	9304      	str	r3, [sp, #16]
c0de7eda:	6809      	ldr	r1, [r1, #0]
c0de7edc:	2802      	cmp	r0, #2
c0de7ede:	d05c      	beq.n	c0de7f9a <snprintf+0x36a>
c0de7ee0:	2801      	cmp	r0, #1
c0de7ee2:	d008      	beq.n	c0de7ef6 <snprintf+0x2c6>
c0de7ee4:	463e      	mov	r6, r7
c0de7ee6:	b930      	cbnz	r0, c0de7ef6 <snprintf+0x2c6>
c0de7ee8:	2000      	movs	r0, #0
c0de7eea:	bf00      	nop
c0de7eec:	5c0b      	ldrb	r3, [r1, r0]
c0de7eee:	3001      	adds	r0, #1
c0de7ef0:	2b00      	cmp	r3, #0
c0de7ef2:	d1fb      	bne.n	c0de7eec <snprintf+0x2bc>
c0de7ef4:	1e46      	subs	r6, r0, #1
c0de7ef6:	f1bc 0f00 	cmp.w	ip, #0
c0de7efa:	d020      	beq.n	c0de7f3e <snprintf+0x30e>
c0de7efc:	2e00      	cmp	r6, #0
c0de7efe:	d045      	beq.n	c0de7f8c <snprintf+0x35c>
c0de7f00:	ebbb 0004 	subs.w	r0, fp, r4
c0de7f04:	bf38      	it	cc
c0de7f06:	2000      	movcc	r0, #0
c0de7f08:	eba0 0046 	sub.w	r0, r0, r6, lsl #1
c0de7f0c:	f1b8 0f02 	cmp.w	r8, #2
c0de7f10:	d357      	bcc.n	c0de7fc2 <snprintf+0x392>
c0de7f12:	780b      	ldrb	r3, [r1, #0]
c0de7f14:	f1b8 0802 	subs.w	r8, r8, #2
c0de7f18:	ea4f 1713 	mov.w	r7, r3, lsr #4
c0de7f1c:	5dd7      	ldrb	r7, [r2, r7]
c0de7f1e:	f003 030f 	and.w	r3, r3, #15
c0de7f22:	f88e 7000 	strb.w	r7, [lr]
c0de7f26:	5cd3      	ldrb	r3, [r2, r3]
c0de7f28:	f88e 3001 	strb.w	r3, [lr, #1]
c0de7f2c:	d049      	beq.n	c0de7fc2 <snprintf+0x392>
c0de7f2e:	f10e 0e02 	add.w	lr, lr, #2
c0de7f32:	3e01      	subs	r6, #1
c0de7f34:	f101 0101 	add.w	r1, r1, #1
c0de7f38:	d1e8      	bne.n	c0de7f0c <snprintf+0x2dc>
c0de7f3a:	4680      	mov	r8, r0
c0de7f3c:	e026      	b.n	c0de7f8c <snprintf+0x35c>
c0de7f3e:	4546      	cmp	r6, r8
c0de7f40:	bf28      	it	cs
c0de7f42:	4646      	movcs	r6, r8
c0de7f44:	4670      	mov	r0, lr
c0de7f46:	4632      	mov	r2, r6
c0de7f48:	4674      	mov	r4, lr
c0de7f4a:	f000 fab4 	bl	c0de84b6 <__aeabi_memmove>
c0de7f4e:	ebb8 0806 	subs.w	r8, r8, r6
c0de7f52:	d036      	beq.n	c0de7fc2 <snprintf+0x392>
c0de7f54:	46a6      	mov	lr, r4
c0de7f56:	4637      	mov	r7, r6
c0de7f58:	45ba      	cmp	sl, r7
c0de7f5a:	44b6      	add	lr, r6
c0de7f5c:	d916      	bls.n	c0de7f8c <snprintf+0x35c>
c0de7f5e:	ebaa 0607 	sub.w	r6, sl, r7
c0de7f62:	4546      	cmp	r6, r8
c0de7f64:	bf28      	it	cs
c0de7f66:	4646      	movcs	r6, r8
c0de7f68:	4670      	mov	r0, lr
c0de7f6a:	4631      	mov	r1, r6
c0de7f6c:	2220      	movs	r2, #32
c0de7f6e:	4674      	mov	r4, lr
c0de7f70:	f000 faa3 	bl	c0de84ba <__aeabi_memset>
c0de7f74:	e796      	b.n	c0de7ea4 <snprintf+0x274>
c0de7f76:	9804      	ldr	r0, [sp, #16]
c0de7f78:	f1b8 0801 	subs.w	r8, r8, #1
c0de7f7c:	f100 0104 	add.w	r1, r0, #4
c0de7f80:	9104      	str	r1, [sp, #16]
c0de7f82:	6800      	ldr	r0, [r0, #0]
c0de7f84:	f80e 0b01 	strb.w	r0, [lr], #1
c0de7f88:	d01b      	beq.n	c0de7fc2 <snprintf+0x392>
c0de7f8a:	bf00      	nop
c0de7f8c:	f815 0d01 	ldrb.w	r0, [r5, #-1]!
c0de7f90:	2800      	cmp	r0, #0
c0de7f92:	46c3      	mov	fp, r8
c0de7f94:	f47f ae68 	bne.w	c0de7c68 <snprintf+0x38>
c0de7f98:	e013      	b.n	c0de7fc2 <snprintf+0x392>
c0de7f9a:	7808      	ldrb	r0, [r1, #0]
c0de7f9c:	2800      	cmp	r0, #0
c0de7f9e:	d1f5      	bne.n	c0de7f8c <snprintf+0x35c>
c0de7fa0:	4546      	cmp	r6, r8
c0de7fa2:	bf28      	it	cs
c0de7fa4:	4646      	movcs	r6, r8
c0de7fa6:	4670      	mov	r0, lr
c0de7fa8:	4631      	mov	r1, r6
c0de7faa:	2220      	movs	r2, #32
c0de7fac:	4674      	mov	r4, lr
c0de7fae:	f000 fa84 	bl	c0de84ba <__aeabi_memset>
c0de7fb2:	ebb8 0806 	subs.w	r8, r8, r6
c0de7fb6:	d004      	beq.n	c0de7fc2 <snprintf+0x392>
c0de7fb8:	46a6      	mov	lr, r4
c0de7fba:	e7cd      	b.n	c0de7f58 <snprintf+0x328>
c0de7fbc:	202a      	movs	r0, #42	@ 0x2a
c0de7fbe:	3d01      	subs	r5, #1
c0de7fc0:	e7e6      	b.n	c0de7f90 <snprintf+0x360>
c0de7fc2:	2000      	movs	r0, #0
c0de7fc4:	b009      	add	sp, #36	@ 0x24
c0de7fc6:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7fca:	b001      	add	sp, #4
c0de7fcc:	4770      	bx	lr
c0de7fce:	d4d4      	bmi.n	c0de7f7a <snprintf+0x34a>

c0de7fd0 <pic>:
c0de7fd0:	490a      	ldr	r1, [pc, #40]	@ (c0de7ffc <pic+0x2c>)
c0de7fd2:	4281      	cmp	r1, r0
c0de7fd4:	490a      	ldr	r1, [pc, #40]	@ (c0de8000 <pic+0x30>)
c0de7fd6:	d806      	bhi.n	c0de7fe6 <pic+0x16>
c0de7fd8:	4281      	cmp	r1, r0
c0de7fda:	d304      	bcc.n	c0de7fe6 <pic+0x16>
c0de7fdc:	b580      	push	{r7, lr}
c0de7fde:	f000 f815 	bl	c0de800c <pic_internal>
c0de7fe2:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de7fe6:	4907      	ldr	r1, [pc, #28]	@ (c0de8004 <pic+0x34>)
c0de7fe8:	4288      	cmp	r0, r1
c0de7fea:	4a07      	ldr	r2, [pc, #28]	@ (c0de8008 <pic+0x38>)
c0de7fec:	d305      	bcc.n	c0de7ffa <pic+0x2a>
c0de7fee:	4290      	cmp	r0, r2
c0de7ff0:	bf88      	it	hi
c0de7ff2:	4770      	bxhi	lr
c0de7ff4:	1a40      	subs	r0, r0, r1
c0de7ff6:	464a      	mov	r2, r9
c0de7ff8:	4410      	add	r0, r2
c0de7ffa:	4770      	bx	lr
c0de7ffc:	c0de0000 	.word	0xc0de0000
c0de8000:	c0deb73d 	.word	0xc0deb73d
c0de8004:	da7a0000 	.word	0xda7a0000
c0de8008:	da7a7000 	.word	0xda7a7000

c0de800c <pic_internal>:
c0de800c:	467a      	mov	r2, pc
c0de800e:	4902      	ldr	r1, [pc, #8]	@ (c0de8018 <pic_internal+0xc>)
c0de8010:	1cc9      	adds	r1, r1, #3
c0de8012:	1a89      	subs	r1, r1, r2
c0de8014:	1a40      	subs	r0, r0, r1
c0de8016:	4770      	bx	lr
c0de8018:	c0de800d 	.word	0xc0de800d

c0de801c <SVC_Call>:
c0de801c:	df01      	svc	1
c0de801e:	2900      	cmp	r1, #0
c0de8020:	d100      	bne.n	c0de8024 <exception>
c0de8022:	4770      	bx	lr

c0de8024 <exception>:
c0de8024:	4608      	mov	r0, r1
c0de8026:	f7ff fdfc 	bl	c0de7c22 <os_longjmp>

c0de802a <SVC_cx_call>:
c0de802a:	df01      	svc	1
c0de802c:	4770      	bx	lr

c0de802e <nvm_write>:
c0de802e:	b580      	push	{r7, lr}
c0de8030:	b084      	sub	sp, #16
c0de8032:	ab01      	add	r3, sp, #4
c0de8034:	c307      	stmia	r3!, {r0, r1, r2}
c0de8036:	2003      	movs	r0, #3
c0de8038:	f2c0 3000 	movt	r0, #768	@ 0x300
c0de803c:	a901      	add	r1, sp, #4
c0de803e:	f7ff ffed 	bl	c0de801c <SVC_Call>
c0de8042:	b004      	add	sp, #16
c0de8044:	bd80      	pop	{r7, pc}

c0de8046 <cx_ecdomain_parameters_length>:
c0de8046:	b580      	push	{r7, lr}
c0de8048:	b082      	sub	sp, #8
c0de804a:	e9cd 0100 	strd	r0, r1, [sp]
c0de804e:	f240 102f 	movw	r0, #303	@ 0x12f
c0de8052:	f2c0 2000 	movt	r0, #512	@ 0x200
c0de8056:	4669      	mov	r1, sp
c0de8058:	f7ff ffe7 	bl	c0de802a <SVC_cx_call>
c0de805c:	b002      	add	sp, #8
c0de805e:	bd80      	pop	{r7, pc}

c0de8060 <os_perso_isonboarded>:
c0de8060:	b580      	push	{r7, lr}
c0de8062:	b082      	sub	sp, #8
c0de8064:	2000      	movs	r0, #0
c0de8066:	9001      	str	r0, [sp, #4]
c0de8068:	4669      	mov	r1, sp
c0de806a:	209f      	movs	r0, #159	@ 0x9f
c0de806c:	f7ff ffd6 	bl	c0de801c <SVC_Call>
c0de8070:	b2c0      	uxtb	r0, r0
c0de8072:	b002      	add	sp, #8
c0de8074:	bd80      	pop	{r7, pc}

c0de8076 <os_perso_derive_node_with_seed_key>:
c0de8076:	b5b0      	push	{r4, r5, r7, lr}
c0de8078:	b088      	sub	sp, #32
c0de807a:	e9dd ec0e 	ldrd	lr, ip, [sp, #56]	@ 0x38
c0de807e:	e9dd 540c 	ldrd	r5, r4, [sp, #48]	@ 0x30
c0de8082:	e88d 002f 	stmia.w	sp, {r0, r1, r2, r3, r5}
c0de8086:	20a6      	movs	r0, #166	@ 0xa6
c0de8088:	f6c0 0000 	movt	r0, #2048	@ 0x800
c0de808c:	4669      	mov	r1, sp
c0de808e:	e9cd 4e05 	strd	r4, lr, [sp, #20]
c0de8092:	f8cd c01c 	str.w	ip, [sp, #28]
c0de8096:	f7ff ffc1 	bl	c0de801c <SVC_Call>
c0de809a:	b008      	add	sp, #32
c0de809c:	bdb0      	pop	{r4, r5, r7, pc}

c0de809e <os_pki_load_certificate>:
c0de809e:	b580      	push	{r7, lr}
c0de80a0:	b086      	sub	sp, #24
c0de80a2:	e9dd ec08 	ldrd	lr, ip, [sp, #32]
c0de80a6:	e88d 400f 	stmia.w	sp, {r0, r1, r2, r3, lr}
c0de80aa:	20aa      	movs	r0, #170	@ 0xaa
c0de80ac:	f2c0 6000 	movt	r0, #1536	@ 0x600
c0de80b0:	4669      	mov	r1, sp
c0de80b2:	f8cd c014 	str.w	ip, [sp, #20]
c0de80b6:	f7ff ffb1 	bl	c0de801c <SVC_Call>
c0de80ba:	b006      	add	sp, #24
c0de80bc:	bd80      	pop	{r7, pc}

c0de80be <os_perso_is_pin_set>:
c0de80be:	b580      	push	{r7, lr}
c0de80c0:	b082      	sub	sp, #8
c0de80c2:	2000      	movs	r0, #0
c0de80c4:	9001      	str	r0, [sp, #4]
c0de80c6:	4669      	mov	r1, sp
c0de80c8:	209e      	movs	r0, #158	@ 0x9e
c0de80ca:	f7ff ffa7 	bl	c0de801c <SVC_Call>
c0de80ce:	b2c0      	uxtb	r0, r0
c0de80d0:	b002      	add	sp, #8
c0de80d2:	bd80      	pop	{r7, pc}

c0de80d4 <os_global_pin_is_validated>:
c0de80d4:	b580      	push	{r7, lr}
c0de80d6:	b082      	sub	sp, #8
c0de80d8:	2000      	movs	r0, #0
c0de80da:	9001      	str	r0, [sp, #4]
c0de80dc:	4669      	mov	r1, sp
c0de80de:	20a0      	movs	r0, #160	@ 0xa0
c0de80e0:	f7ff ff9c 	bl	c0de801c <SVC_Call>
c0de80e4:	b2c0      	uxtb	r0, r0
c0de80e6:	b002      	add	sp, #8
c0de80e8:	bd80      	pop	{r7, pc}

c0de80ea <os_ux>:
c0de80ea:	b580      	push	{r7, lr}
c0de80ec:	b082      	sub	sp, #8
c0de80ee:	9000      	str	r0, [sp, #0]
c0de80f0:	2000      	movs	r0, #0
c0de80f2:	9001      	str	r0, [sp, #4]
c0de80f4:	2064      	movs	r0, #100	@ 0x64
c0de80f6:	f2c0 1000 	movt	r0, #256	@ 0x100
c0de80fa:	4669      	mov	r1, sp
c0de80fc:	f7ff ff8e 	bl	c0de801c <SVC_Call>
c0de8100:	b002      	add	sp, #8
c0de8102:	bd80      	pop	{r7, pc}

c0de8104 <os_flags>:
c0de8104:	b580      	push	{r7, lr}
c0de8106:	b082      	sub	sp, #8
c0de8108:	2000      	movs	r0, #0
c0de810a:	9001      	str	r0, [sp, #4]
c0de810c:	4669      	mov	r1, sp
c0de810e:	206a      	movs	r0, #106	@ 0x6a
c0de8110:	f7ff ff84 	bl	c0de801c <SVC_Call>
c0de8114:	b002      	add	sp, #8
c0de8116:	bd80      	pop	{r7, pc}

c0de8118 <os_setting_get>:
c0de8118:	b580      	push	{r7, lr}
c0de811a:	b084      	sub	sp, #16
c0de811c:	ab01      	add	r3, sp, #4
c0de811e:	c307      	stmia	r3!, {r0, r1, r2}
c0de8120:	2070      	movs	r0, #112	@ 0x70
c0de8122:	f2c0 3000 	movt	r0, #768	@ 0x300
c0de8126:	a901      	add	r1, sp, #4
c0de8128:	f7ff ff78 	bl	c0de801c <SVC_Call>
c0de812c:	b004      	add	sp, #16
c0de812e:	bd80      	pop	{r7, pc}

c0de8130 <os_registry_get_current_app_tag>:
c0de8130:	b580      	push	{r7, lr}
c0de8132:	b084      	sub	sp, #16
c0de8134:	ab01      	add	r3, sp, #4
c0de8136:	c307      	stmia	r3!, {r0, r1, r2}
c0de8138:	2074      	movs	r0, #116	@ 0x74
c0de813a:	f2c0 3000 	movt	r0, #768	@ 0x300
c0de813e:	a901      	add	r1, sp, #4
c0de8140:	f7ff ff6c 	bl	c0de801c <SVC_Call>
c0de8144:	b004      	add	sp, #16
c0de8146:	bd80      	pop	{r7, pc}

c0de8148 <os_sched_exit>:
c0de8148:	b082      	sub	sp, #8
c0de814a:	9000      	str	r0, [sp, #0]
c0de814c:	2000      	movs	r0, #0
c0de814e:	9001      	str	r0, [sp, #4]
c0de8150:	209a      	movs	r0, #154	@ 0x9a
c0de8152:	f2c0 1000 	movt	r0, #256	@ 0x100
c0de8156:	4669      	mov	r1, sp
c0de8158:	f7ff ff60 	bl	c0de801c <SVC_Call>
c0de815c:	deff      	udf	#255	@ 0xff

c0de815e <os_io_init>:
c0de815e:	b580      	push	{r7, lr}
c0de8160:	b082      	sub	sp, #8
c0de8162:	9001      	str	r0, [sp, #4]
c0de8164:	2084      	movs	r0, #132	@ 0x84
c0de8166:	f2c0 1000 	movt	r0, #256	@ 0x100
c0de816a:	a901      	add	r1, sp, #4
c0de816c:	f7ff ff56 	bl	c0de801c <SVC_Call>
c0de8170:	b002      	add	sp, #8
c0de8172:	bd80      	pop	{r7, pc}

c0de8174 <os_io_start>:
c0de8174:	b580      	push	{r7, lr}
c0de8176:	b082      	sub	sp, #8
c0de8178:	2000      	movs	r0, #0
c0de817a:	9001      	str	r0, [sp, #4]
c0de817c:	2085      	movs	r0, #133	@ 0x85
c0de817e:	f2c0 1000 	movt	r0, #256	@ 0x100
c0de8182:	4669      	mov	r1, sp
c0de8184:	f7ff ff4a 	bl	c0de801c <SVC_Call>
c0de8188:	b002      	add	sp, #8
c0de818a:	bd80      	pop	{r7, pc}

c0de818c <os_io_tx_cmd>:
c0de818c:	b580      	push	{r7, lr}
c0de818e:	b084      	sub	sp, #16
c0de8190:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de8194:	2088      	movs	r0, #136	@ 0x88
c0de8196:	f2c0 4000 	movt	r0, #1024	@ 0x400
c0de819a:	4669      	mov	r1, sp
c0de819c:	f7ff ff3e 	bl	c0de801c <SVC_Call>
c0de81a0:	b004      	add	sp, #16
c0de81a2:	bd80      	pop	{r7, pc}

c0de81a4 <os_io_rx_evt>:
c0de81a4:	b580      	push	{r7, lr}
c0de81a6:	b084      	sub	sp, #16
c0de81a8:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de81ac:	2089      	movs	r0, #137	@ 0x89
c0de81ae:	f2c0 3000 	movt	r0, #768	@ 0x300
c0de81b2:	4669      	mov	r1, sp
c0de81b4:	f7ff ff32 	bl	c0de801c <SVC_Call>
c0de81b8:	b004      	add	sp, #16
c0de81ba:	bd80      	pop	{r7, pc}

c0de81bc <try_context_get>:
c0de81bc:	b580      	push	{r7, lr}
c0de81be:	b082      	sub	sp, #8
c0de81c0:	2000      	movs	r0, #0
c0de81c2:	9001      	str	r0, [sp, #4]
c0de81c4:	4669      	mov	r1, sp
c0de81c6:	2087      	movs	r0, #135	@ 0x87
c0de81c8:	f7ff ff28 	bl	c0de801c <SVC_Call>
c0de81cc:	b002      	add	sp, #8
c0de81ce:	bd80      	pop	{r7, pc}

c0de81d0 <try_context_set>:
c0de81d0:	b580      	push	{r7, lr}
c0de81d2:	b082      	sub	sp, #8
c0de81d4:	9000      	str	r0, [sp, #0]
c0de81d6:	2000      	movs	r0, #0
c0de81d8:	9001      	str	r0, [sp, #4]
c0de81da:	f240 100b 	movw	r0, #267	@ 0x10b
c0de81de:	f2c0 1000 	movt	r0, #256	@ 0x100
c0de81e2:	4669      	mov	r1, sp
c0de81e4:	f7ff ff1a 	bl	c0de801c <SVC_Call>
c0de81e8:	b002      	add	sp, #8
c0de81ea:	bd80      	pop	{r7, pc}

c0de81ec <os_sched_last_status>:
c0de81ec:	b580      	push	{r7, lr}
c0de81ee:	b082      	sub	sp, #8
c0de81f0:	9000      	str	r0, [sp, #0]
c0de81f2:	2000      	movs	r0, #0
c0de81f4:	9001      	str	r0, [sp, #4]
c0de81f6:	209c      	movs	r0, #156	@ 0x9c
c0de81f8:	f2c0 1000 	movt	r0, #256	@ 0x100
c0de81fc:	4669      	mov	r1, sp
c0de81fe:	f7ff ff0d 	bl	c0de801c <SVC_Call>
c0de8202:	b2c0      	uxtb	r0, r0
c0de8204:	b002      	add	sp, #8
c0de8206:	bd80      	pop	{r7, pc}

c0de8208 <screen_update>:
c0de8208:	b580      	push	{r7, lr}
c0de820a:	b082      	sub	sp, #8
c0de820c:	2000      	movs	r0, #0
c0de820e:	9001      	str	r0, [sp, #4]
c0de8210:	4669      	mov	r1, sp
c0de8212:	207a      	movs	r0, #122	@ 0x7a
c0de8214:	f7ff ff02 	bl	c0de801c <SVC_Call>
c0de8218:	b002      	add	sp, #8
c0de821a:	bd80      	pop	{r7, pc}

c0de821c <bagl_hal_draw_bitmap_within_rect>:
c0de821c:	b570      	push	{r4, r5, r6, lr}
c0de821e:	b08a      	sub	sp, #40	@ 0x28
c0de8220:	f8dd c048 	ldr.w	ip, [sp, #72]	@ 0x48
c0de8224:	e9dd 4e10 	ldrd	r4, lr, [sp, #64]	@ 0x40
c0de8228:	e9dd 650e 	ldrd	r6, r5, [sp, #56]	@ 0x38
c0de822c:	9001      	str	r0, [sp, #4]
c0de822e:	207c      	movs	r0, #124	@ 0x7c
c0de8230:	9102      	str	r1, [sp, #8]
c0de8232:	f6c0 1000 	movt	r0, #2304	@ 0x900
c0de8236:	a901      	add	r1, sp, #4
c0de8238:	9203      	str	r2, [sp, #12]
c0de823a:	9304      	str	r3, [sp, #16]
c0de823c:	9605      	str	r6, [sp, #20]
c0de823e:	e9cd 5406 	strd	r5, r4, [sp, #24]
c0de8242:	e9cd ec08 	strd	lr, ip, [sp, #32]
c0de8246:	f7ff fee9 	bl	c0de801c <SVC_Call>
c0de824a:	b00a      	add	sp, #40	@ 0x28
c0de824c:	bd70      	pop	{r4, r5, r6, pc}

c0de824e <bagl_hal_draw_rect>:
c0de824e:	b580      	push	{r7, lr}
c0de8250:	b086      	sub	sp, #24
c0de8252:	f10d 0e04 	add.w	lr, sp, #4
c0de8256:	f8dd c020 	ldr.w	ip, [sp, #32]
c0de825a:	e88e 100f 	stmia.w	lr, {r0, r1, r2, r3, ip}
c0de825e:	207d      	movs	r0, #125	@ 0x7d
c0de8260:	f2c0 5000 	movt	r0, #1280	@ 0x500
c0de8264:	a901      	add	r1, sp, #4
c0de8266:	f7ff fed9 	bl	c0de801c <SVC_Call>
c0de826a:	b006      	add	sp, #24
c0de826c:	bd80      	pop	{r7, pc}
c0de826e:	d4d4      	bmi.n	c0de821a <screen_update+0x12>

c0de8270 <__aeabi_uldivmod>:
c0de8270:	2b00      	cmp	r3, #0
c0de8272:	d111      	bne.n	c0de8298 <__aeabi_uldivmod+0x28>
c0de8274:	2a00      	cmp	r2, #0
c0de8276:	d10f      	bne.n	c0de8298 <__aeabi_uldivmod+0x28>
c0de8278:	2900      	cmp	r1, #0
c0de827a:	d100      	bne.n	c0de827e <__aeabi_uldivmod+0xe>
c0de827c:	2800      	cmp	r0, #0
c0de827e:	d002      	beq.n	c0de8286 <__aeabi_uldivmod+0x16>
c0de8280:	2100      	movs	r1, #0
c0de8282:	43c9      	mvns	r1, r1
c0de8284:	1c08      	adds	r0, r1, #0
c0de8286:	b407      	push	{r0, r1, r2}
c0de8288:	4802      	ldr	r0, [pc, #8]	@ (c0de8294 <__aeabi_uldivmod+0x24>)
c0de828a:	a102      	add	r1, pc, #8	@ (adr r1, c0de8294 <__aeabi_uldivmod+0x24>)
c0de828c:	1840      	adds	r0, r0, r1
c0de828e:	9002      	str	r0, [sp, #8]
c0de8290:	bd03      	pop	{r0, r1, pc}
c0de8292:	46c0      	nop			@ (mov r8, r8)
c0de8294:	0000001d 	.word	0x0000001d
c0de8298:	b403      	push	{r0, r1}
c0de829a:	4668      	mov	r0, sp
c0de829c:	b501      	push	{r0, lr}
c0de829e:	9802      	ldr	r0, [sp, #8]
c0de82a0:	f000 f808 	bl	c0de82b4 <__udivmoddi4>
c0de82a4:	9b01      	ldr	r3, [sp, #4]
c0de82a6:	469e      	mov	lr, r3
c0de82a8:	b002      	add	sp, #8
c0de82aa:	bc0c      	pop	{r2, r3}
c0de82ac:	4770      	bx	lr
c0de82ae:	46c0      	nop			@ (mov r8, r8)

c0de82b0 <__aeabi_idiv0>:
c0de82b0:	4770      	bx	lr
c0de82b2:	46c0      	nop			@ (mov r8, r8)

c0de82b4 <__udivmoddi4>:
c0de82b4:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de82b6:	4657      	mov	r7, sl
c0de82b8:	464e      	mov	r6, r9
c0de82ba:	4645      	mov	r5, r8
c0de82bc:	46de      	mov	lr, fp
c0de82be:	b5e0      	push	{r5, r6, r7, lr}
c0de82c0:	0004      	movs	r4, r0
c0de82c2:	b083      	sub	sp, #12
c0de82c4:	000d      	movs	r5, r1
c0de82c6:	4692      	mov	sl, r2
c0de82c8:	4699      	mov	r9, r3
c0de82ca:	428b      	cmp	r3, r1
c0de82cc:	d830      	bhi.n	c0de8330 <__udivmoddi4+0x7c>
c0de82ce:	d02d      	beq.n	c0de832c <__udivmoddi4+0x78>
c0de82d0:	4649      	mov	r1, r9
c0de82d2:	4650      	mov	r0, sl
c0de82d4:	f000 f8c0 	bl	c0de8458 <__clzdi2>
c0de82d8:	0029      	movs	r1, r5
c0de82da:	0006      	movs	r6, r0
c0de82dc:	0020      	movs	r0, r4
c0de82de:	f000 f8bb 	bl	c0de8458 <__clzdi2>
c0de82e2:	1a33      	subs	r3, r6, r0
c0de82e4:	4698      	mov	r8, r3
c0de82e6:	3b20      	subs	r3, #32
c0de82e8:	469b      	mov	fp, r3
c0de82ea:	d433      	bmi.n	c0de8354 <__udivmoddi4+0xa0>
c0de82ec:	465a      	mov	r2, fp
c0de82ee:	4653      	mov	r3, sl
c0de82f0:	4093      	lsls	r3, r2
c0de82f2:	4642      	mov	r2, r8
c0de82f4:	001f      	movs	r7, r3
c0de82f6:	4653      	mov	r3, sl
c0de82f8:	4093      	lsls	r3, r2
c0de82fa:	001e      	movs	r6, r3
c0de82fc:	42af      	cmp	r7, r5
c0de82fe:	d83a      	bhi.n	c0de8376 <__udivmoddi4+0xc2>
c0de8300:	42af      	cmp	r7, r5
c0de8302:	d100      	bne.n	c0de8306 <__udivmoddi4+0x52>
c0de8304:	e07b      	b.n	c0de83fe <__udivmoddi4+0x14a>
c0de8306:	465b      	mov	r3, fp
c0de8308:	1ba4      	subs	r4, r4, r6
c0de830a:	41bd      	sbcs	r5, r7
c0de830c:	2b00      	cmp	r3, #0
c0de830e:	da00      	bge.n	c0de8312 <__udivmoddi4+0x5e>
c0de8310:	e078      	b.n	c0de8404 <__udivmoddi4+0x150>
c0de8312:	2200      	movs	r2, #0
c0de8314:	2300      	movs	r3, #0
c0de8316:	9200      	str	r2, [sp, #0]
c0de8318:	9301      	str	r3, [sp, #4]
c0de831a:	2301      	movs	r3, #1
c0de831c:	465a      	mov	r2, fp
c0de831e:	4093      	lsls	r3, r2
c0de8320:	9301      	str	r3, [sp, #4]
c0de8322:	2301      	movs	r3, #1
c0de8324:	4642      	mov	r2, r8
c0de8326:	4093      	lsls	r3, r2
c0de8328:	9300      	str	r3, [sp, #0]
c0de832a:	e028      	b.n	c0de837e <__udivmoddi4+0xca>
c0de832c:	4282      	cmp	r2, r0
c0de832e:	d9cf      	bls.n	c0de82d0 <__udivmoddi4+0x1c>
c0de8330:	2200      	movs	r2, #0
c0de8332:	2300      	movs	r3, #0
c0de8334:	9200      	str	r2, [sp, #0]
c0de8336:	9301      	str	r3, [sp, #4]
c0de8338:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
c0de833a:	2b00      	cmp	r3, #0
c0de833c:	d001      	beq.n	c0de8342 <__udivmoddi4+0x8e>
c0de833e:	601c      	str	r4, [r3, #0]
c0de8340:	605d      	str	r5, [r3, #4]
c0de8342:	9800      	ldr	r0, [sp, #0]
c0de8344:	9901      	ldr	r1, [sp, #4]
c0de8346:	b003      	add	sp, #12
c0de8348:	bc3c      	pop	{r2, r3, r4, r5}
c0de834a:	4690      	mov	r8, r2
c0de834c:	4699      	mov	r9, r3
c0de834e:	46a2      	mov	sl, r4
c0de8350:	46ab      	mov	fp, r5
c0de8352:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de8354:	4642      	mov	r2, r8
c0de8356:	2320      	movs	r3, #32
c0de8358:	1a9b      	subs	r3, r3, r2
c0de835a:	4652      	mov	r2, sl
c0de835c:	40da      	lsrs	r2, r3
c0de835e:	4641      	mov	r1, r8
c0de8360:	0013      	movs	r3, r2
c0de8362:	464a      	mov	r2, r9
c0de8364:	408a      	lsls	r2, r1
c0de8366:	0017      	movs	r7, r2
c0de8368:	4642      	mov	r2, r8
c0de836a:	431f      	orrs	r7, r3
c0de836c:	4653      	mov	r3, sl
c0de836e:	4093      	lsls	r3, r2
c0de8370:	001e      	movs	r6, r3
c0de8372:	42af      	cmp	r7, r5
c0de8374:	d9c4      	bls.n	c0de8300 <__udivmoddi4+0x4c>
c0de8376:	2200      	movs	r2, #0
c0de8378:	2300      	movs	r3, #0
c0de837a:	9200      	str	r2, [sp, #0]
c0de837c:	9301      	str	r3, [sp, #4]
c0de837e:	4643      	mov	r3, r8
c0de8380:	2b00      	cmp	r3, #0
c0de8382:	d0d9      	beq.n	c0de8338 <__udivmoddi4+0x84>
c0de8384:	07fb      	lsls	r3, r7, #31
c0de8386:	469c      	mov	ip, r3
c0de8388:	4661      	mov	r1, ip
c0de838a:	0872      	lsrs	r2, r6, #1
c0de838c:	430a      	orrs	r2, r1
c0de838e:	087b      	lsrs	r3, r7, #1
c0de8390:	4646      	mov	r6, r8
c0de8392:	e00e      	b.n	c0de83b2 <__udivmoddi4+0xfe>
c0de8394:	42ab      	cmp	r3, r5
c0de8396:	d101      	bne.n	c0de839c <__udivmoddi4+0xe8>
c0de8398:	42a2      	cmp	r2, r4
c0de839a:	d80c      	bhi.n	c0de83b6 <__udivmoddi4+0x102>
c0de839c:	1aa4      	subs	r4, r4, r2
c0de839e:	419d      	sbcs	r5, r3
c0de83a0:	2001      	movs	r0, #1
c0de83a2:	1924      	adds	r4, r4, r4
c0de83a4:	416d      	adcs	r5, r5
c0de83a6:	2100      	movs	r1, #0
c0de83a8:	3e01      	subs	r6, #1
c0de83aa:	1824      	adds	r4, r4, r0
c0de83ac:	414d      	adcs	r5, r1
c0de83ae:	2e00      	cmp	r6, #0
c0de83b0:	d006      	beq.n	c0de83c0 <__udivmoddi4+0x10c>
c0de83b2:	42ab      	cmp	r3, r5
c0de83b4:	d9ee      	bls.n	c0de8394 <__udivmoddi4+0xe0>
c0de83b6:	3e01      	subs	r6, #1
c0de83b8:	1924      	adds	r4, r4, r4
c0de83ba:	416d      	adcs	r5, r5
c0de83bc:	2e00      	cmp	r6, #0
c0de83be:	d1f8      	bne.n	c0de83b2 <__udivmoddi4+0xfe>
c0de83c0:	9800      	ldr	r0, [sp, #0]
c0de83c2:	9901      	ldr	r1, [sp, #4]
c0de83c4:	465b      	mov	r3, fp
c0de83c6:	1900      	adds	r0, r0, r4
c0de83c8:	4169      	adcs	r1, r5
c0de83ca:	2b00      	cmp	r3, #0
c0de83cc:	db25      	blt.n	c0de841a <__udivmoddi4+0x166>
c0de83ce:	002b      	movs	r3, r5
c0de83d0:	465a      	mov	r2, fp
c0de83d2:	4644      	mov	r4, r8
c0de83d4:	40d3      	lsrs	r3, r2
c0de83d6:	002a      	movs	r2, r5
c0de83d8:	40e2      	lsrs	r2, r4
c0de83da:	001c      	movs	r4, r3
c0de83dc:	465b      	mov	r3, fp
c0de83de:	0015      	movs	r5, r2
c0de83e0:	2b00      	cmp	r3, #0
c0de83e2:	db2b      	blt.n	c0de843c <__udivmoddi4+0x188>
c0de83e4:	0026      	movs	r6, r4
c0de83e6:	465f      	mov	r7, fp
c0de83e8:	40be      	lsls	r6, r7
c0de83ea:	0033      	movs	r3, r6
c0de83ec:	0026      	movs	r6, r4
c0de83ee:	4647      	mov	r7, r8
c0de83f0:	40be      	lsls	r6, r7
c0de83f2:	0032      	movs	r2, r6
c0de83f4:	1a80      	subs	r0, r0, r2
c0de83f6:	4199      	sbcs	r1, r3
c0de83f8:	9000      	str	r0, [sp, #0]
c0de83fa:	9101      	str	r1, [sp, #4]
c0de83fc:	e79c      	b.n	c0de8338 <__udivmoddi4+0x84>
c0de83fe:	42a3      	cmp	r3, r4
c0de8400:	d8b9      	bhi.n	c0de8376 <__udivmoddi4+0xc2>
c0de8402:	e780      	b.n	c0de8306 <__udivmoddi4+0x52>
c0de8404:	4642      	mov	r2, r8
c0de8406:	2320      	movs	r3, #32
c0de8408:	2100      	movs	r1, #0
c0de840a:	1a9b      	subs	r3, r3, r2
c0de840c:	2200      	movs	r2, #0
c0de840e:	9100      	str	r1, [sp, #0]
c0de8410:	9201      	str	r2, [sp, #4]
c0de8412:	2201      	movs	r2, #1
c0de8414:	40da      	lsrs	r2, r3
c0de8416:	9201      	str	r2, [sp, #4]
c0de8418:	e783      	b.n	c0de8322 <__udivmoddi4+0x6e>
c0de841a:	4642      	mov	r2, r8
c0de841c:	2320      	movs	r3, #32
c0de841e:	1a9b      	subs	r3, r3, r2
c0de8420:	002a      	movs	r2, r5
c0de8422:	4646      	mov	r6, r8
c0de8424:	409a      	lsls	r2, r3
c0de8426:	0023      	movs	r3, r4
c0de8428:	40f3      	lsrs	r3, r6
c0de842a:	4644      	mov	r4, r8
c0de842c:	4313      	orrs	r3, r2
c0de842e:	002a      	movs	r2, r5
c0de8430:	40e2      	lsrs	r2, r4
c0de8432:	001c      	movs	r4, r3
c0de8434:	465b      	mov	r3, fp
c0de8436:	0015      	movs	r5, r2
c0de8438:	2b00      	cmp	r3, #0
c0de843a:	dad3      	bge.n	c0de83e4 <__udivmoddi4+0x130>
c0de843c:	2320      	movs	r3, #32
c0de843e:	4642      	mov	r2, r8
c0de8440:	0026      	movs	r6, r4
c0de8442:	1a9b      	subs	r3, r3, r2
c0de8444:	40de      	lsrs	r6, r3
c0de8446:	002f      	movs	r7, r5
c0de8448:	46b4      	mov	ip, r6
c0de844a:	4646      	mov	r6, r8
c0de844c:	40b7      	lsls	r7, r6
c0de844e:	4666      	mov	r6, ip
c0de8450:	003b      	movs	r3, r7
c0de8452:	4333      	orrs	r3, r6
c0de8454:	e7ca      	b.n	c0de83ec <__udivmoddi4+0x138>
c0de8456:	46c0      	nop			@ (mov r8, r8)

c0de8458 <__clzdi2>:
c0de8458:	b510      	push	{r4, lr}
c0de845a:	2900      	cmp	r1, #0
c0de845c:	d103      	bne.n	c0de8466 <__clzdi2+0xe>
c0de845e:	f000 f807 	bl	c0de8470 <__clzsi2>
c0de8462:	3020      	adds	r0, #32
c0de8464:	e002      	b.n	c0de846c <__clzdi2+0x14>
c0de8466:	1c08      	adds	r0, r1, #0
c0de8468:	f000 f802 	bl	c0de8470 <__clzsi2>
c0de846c:	bd10      	pop	{r4, pc}
c0de846e:	46c0      	nop			@ (mov r8, r8)

c0de8470 <__clzsi2>:
c0de8470:	211c      	movs	r1, #28
c0de8472:	2301      	movs	r3, #1
c0de8474:	041b      	lsls	r3, r3, #16
c0de8476:	4298      	cmp	r0, r3
c0de8478:	d301      	bcc.n	c0de847e <__clzsi2+0xe>
c0de847a:	0c00      	lsrs	r0, r0, #16
c0de847c:	3910      	subs	r1, #16
c0de847e:	0a1b      	lsrs	r3, r3, #8
c0de8480:	4298      	cmp	r0, r3
c0de8482:	d301      	bcc.n	c0de8488 <__clzsi2+0x18>
c0de8484:	0a00      	lsrs	r0, r0, #8
c0de8486:	3908      	subs	r1, #8
c0de8488:	091b      	lsrs	r3, r3, #4
c0de848a:	4298      	cmp	r0, r3
c0de848c:	d301      	bcc.n	c0de8492 <__clzsi2+0x22>
c0de848e:	0900      	lsrs	r0, r0, #4
c0de8490:	3904      	subs	r1, #4
c0de8492:	a202      	add	r2, pc, #8	@ (adr r2, c0de849c <__clzsi2+0x2c>)
c0de8494:	5c10      	ldrb	r0, [r2, r0]
c0de8496:	1840      	adds	r0, r0, r1
c0de8498:	4770      	bx	lr
c0de849a:	46c0      	nop			@ (mov r8, r8)
c0de849c:	02020304 	.word	0x02020304
c0de84a0:	01010101 	.word	0x01010101
	...

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
c0de85ac:	6601 7180 f838 7807 d400 d4d4               .f.q8..x....

c0de85b8 <C_badge_loading_v2>:
c0de85b8:	000e 0000 000e 0000 0001 0000 8594 c0de     ................
c0de85c8:	859c c0de                                   ....

c0de85cc <C_icon_crossmark_bitmap>:
c0de85cc:	8000 e601 71c0 3838 fc07 1e00 0780 03f0     .....q88........
c0de85dc:	c1ce 38e1 0670 0018 d400 d4d4               ...8p.......

c0de85e8 <C_icon_crossmark>:
c0de85e8:	000e 0000 000e 0000 0001 0000 8594 c0de     ................
c0de85f8:	85cc c0de                                   ....

c0de85fc <C_icon_dashboard_x_bitmap>:
c0de85fc:	0000 0000 800c f007 fe03 ffc1 3ff0 03f0     .............?..
c0de860c:	00cc c033 000c 0000 d400 d4d4               ..3.........

c0de8618 <C_icon_dashboard_x>:
c0de8618:	000e 0000 000e 0000 0001 0000 8594 c0de     ................
c0de8628:	85fc c0de                                   ....

c0de862c <C_icon_eye_bitmap>:
c0de862c:	0000 0000 e01e 1c1f 030e 8c63 6319 0c0c     ..........c..c..
c0de863c:	8387 807f 0007 0000 d400 d4d4               ............

c0de8648 <C_icon_eye>:
c0de8648:	000e 0000 000e 0000 0001 0000 8594 c0de     ................
c0de8658:	862c c0de                                   ,...

c0de865c <C_icon_validate_14_bitmap>:
c0de865c:	0000 0000 0000 00c0 0038 e067 1c38 039c     ........8.g.8...
c0de866c:	007e 800f 0001 0000 d400 d4d4               ~...........

c0de8678 <C_icon_validate_14>:
c0de8678:	000e 0000 000e 0000 0001 0000 8594 c0de     ................
c0de8688:	865c c0de                                   \...

c0de868c <C_icon_waves_bitmap>:
c0de868c:	87f8 e7cf 3de1 07f0 00f8 001c 8006 f003     .....=..........
c0de869c:	fe01 7bc0 3e78 fe1f d401 d4d4               ...{x>......

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
c0de8700:	0002 86ec c0de 86fc c0de 0000 0000 1b91     ................
c0de8710:	c0de d4d4                                   ....

c0de8714 <waves_AssetPair_field_info>:
c0de8714:	5605 0001 0000 0008 5609 0001 0008 0008     .V.......V......
c0de8724:	0000 0000                                   ....

c0de8728 <waves_AssetPair_submsg_info>:
c0de8728:	0000 0000                                   ....

c0de872c <waves_AssetPair_msg>:
c0de872c:	0002 8714 c0de 8728 c0de 0000 0000 1b91     ......(.........
c0de873c:	c0de d4d4                                   ....

c0de8740 <waves_Order_field_info>:
c0de8740:	1104 4000 5609 0001 0004 0008 560d 0001     ...@.V.......V..
c0de8750:	000c 0008 1811 4001 0018 0010 1214 1028     .......@......(.
c0de8760:	1118 8030 111c 8038 1120 8040 1124 8048     ..0...8. .@.$.H.
c0de8770:	1829 8001 0058 0010 112c 4068 0000 0000     )...X...,.h@....

c0de8780 <waves_Order_submsg_info>:
c0de8780:	872c c0de 8700 c0de 0000 0000               ,...........

c0de878c <waves_Order_msg>:
c0de878c:	000b 8740 c0de 8780 c0de 0000 0000 1b91     ..@.............
c0de879c:	c0de d4d4                                   ....

c0de87a0 <waves_Recipient_field_info>:
c0de87a0:	3b05 2001 0002 0014 3709 2001 0002 001f     .;. .....7. ....
c0de87b0:	0000 0000                                   ....

c0de87b4 <waves_Recipient_submsg_info>:
c0de87b4:	0000 0000                                   ....

c0de87b8 <waves_Recipient_msg>:
c0de87b8:	0002 87a0 c0de 87b4 c0de 0000 0000 0000     ................
	...

c0de87ca <waves_Transaction_msg>:
c0de87ca:	0013 87dc c0de 89ac c0de 0000 0000 1b91     ................
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
c0de889c:	0006 8a9c c0de 8ac4 c0de 0000 0000 1b91     ................
c0de88ac:	c0de                                        ..

c0de88ae <waves_TransferTransactionData_msg>:
c0de88ae:	0003 8a08 c0de 8a24 c0de 0000 0000 1b91     ......$.........
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
c0de8908:	0001 8a78 c0de 8a84 c0de 0000 0000 1b91     ..x.............
c0de8918:	c0de                                        ..

c0de891a <waves_CreateAliasTransactionData_msg>:
c0de891a:	0001 8a30 c0de 8a3c c0de 0000 0000 1b91     ..0...<.........
c0de892a:	c0de                                        ..

c0de892c <waves_MassTransferTransactionData_msg>:
c0de892c:	0002 8a48 c0de 8a5c c0de 0000 0000 1b91     ..H...\.........
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
c0de8974:	0001 8ae0 c0de 8aec c0de 0000 0000 1b91     ................
c0de8984:	c0de                                        ..

c0de8986 <waves_InvokeScriptTransactionData_msg>:
c0de8986:	0003 8b14 c0de 8b30 c0de 0000 0000 1b91     ......0.........
c0de8996:	c0de                                        ..

c0de8998 <waves_UpdateAssetInfoTransactionData_msg>:
c0de8998:	0003 8b3c c0de 8b58 c0de 0000 0000 1b91     ..<...X.........
c0de89a8:	c0de d4d4                                   ....

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
c0de8de8:	6e61 6673 7265 4e00 6e61 206f 0058 6e69     ansfer.Nano X.in
c0de8df8:	6176 696c 2064 7865 6574 736e 6f69 006e     valid extension.
c0de8e08:	6163 6c6c 6162 6b63 6620 6961 656c 0064     callback failed.
c0de8e18:	7551 7469 4100 6464 6572 7373 5400 6172     Quit.Address.Tra
c0de8e28:	736e 6566 0072 7041 6c70 6369 7461 6f69     nsfer.Applicatio
c0de8e38:	006e 6461 7264 7365 0073 6150 6d79 6e65     n.address.Paymen
c0de8e48:	2074 2031 6d61 756f 746e 6500 3264 3535     t 1 amount.ed255
c0de8e58:	3931 7320 6565 0064 6144 6174 7420 6172     19 seed.Data tra
c0de8e68:	736e 6361 6974 6e6f 7000 7261 6e65 2074     nsaction.parent 
c0de8e78:	7473 6572 6d61 7420 6f6f 7320 6f68 7472     stream too short
c0de8e88:	6900 636e 726f 6572 7463 6620 7869 6465     .incorrect fixed
c0de8e98:	6c20 6e65 7467 2068 7962 6574 2073 6973      length bytes si
c0de8ea8:	657a 5000 7961 656d 746e 3220 6120 7373     ze.Payment 2 ass
c0de8eb8:	7465 0000                                   et..

c0de8ebc <b58digits_ordered>:
c0de8ebc:	3231 3433 3635 3837 4139 4342 4544 4746     123456789ABCDEFG
c0de8ecc:	4a48 4c4b 4e4d 5150 5352 5554 5756 5958     HJKLMNPQRSTUVWXY
c0de8edc:	615a 6362 6564 6766 6968 6b6a 6e6d 706f     Zabcdefghijkmnop
c0de8eec:	7271 7473 7675 7877 7a79 7300 7a69 2065     qrstuvwxyz.size 
c0de8efc:	6f74 206f 616c 6772 0065 7369 7220 6165     too large.is rea
c0de8f0c:	7964 4100 7373 7465 6220 7275 006e 614d     dy.Asset burn.Ma
c0de8f1c:	6374 6568 0072                              tcher.

c0de8f22 <WAVES_CONST>:
c0de8f22:	6157 6576 0073 6176 6972 746e 6f20 6576     Waves.varint ove
c0de8f32:	6672 6f6c 0077 6e69 6176 696c 2064 6977     rflow.invalid wi
c0de8f42:	6572 745f 7079 0065 696d 7373 6e69 2067     re_type.missing 
c0de8f52:	6572 7571 7269 6465 6620 6569 646c 4300     required field.C
c0de8f62:	6e6f 6966 6d72 4400 6365 6d69 6c61 0073     onfirm.Decimals.
c0de8f72:	6c41 6169 0073 6425 252f 0064 7243 6165     Alias.%d/%d.Crea
c0de8f82:	6974 676e 6120 696c 7361 5500 6470 7461     ting alias.Updat
c0de8f92:	2065 7361 6573 2074 6e69 6f66 d400          e asset info..

c0de8fa0 <C_cx_Ed25519_Bx>:
c0de8fa0:	6921 d336 6ecd fe53 a4c0 31e2 d6fd 5cdc     !i6..nS....1...\
c0de8fb0:	2c69 60c7 2595 b2a7 56c9 602d 258f 1ad5     i,.`.%...V-`.%..

c0de8fc0 <C_cx_Ed25519_By>:
c0de8fc0:	6666 6666 6666 6666 6666 6666 6666 6666     ffffffffffffffff
c0de8fd0:	6666 6666 6666 6666 6666 6666 6666 5866     fffffffffffffffX

c0de8fe0 <C_cx_Ed25519_l>:
c0de8fe0:	0010 0000 0000 0000 0000 0000 0000 0000     ................
c0de8ff0:	de14 def9 f7a2 d69c 1258 1a63 f55c edd3     ........X.c.\...

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
c0de90e0:	7254 6575 0000 d4d4                         True....

c0de90e8 <.L.str.2>:
c0de90e8:	6564 6166 6c75 0074                          default..

c0de90f1 <.L.str.4>:
c0de90f1:	6146 736c 0065                               False..

c0de90f8 <.L.str.5>:
c0de90f8:	7542 2079 726f 6564 0072 d400               Buy order...

c0de9104 <.L.str.6>:
c0de9104:	6553 6c6c 6f20 6472 7265 0000               Sell order..

c0de9110 <ux_idle_flow_1_step_val>:
c0de9110:	86a8 c0de 8e2e c0de 8f06 c0de               ............

c0de911c <ux_idle_flow_1_step>:
c0de911c:	7967 c0de 9110 c0de 0000 0000 0000 0000     gy..............

c0de912c <ux_idle_flow_2_step_val>:
c0de912c:	8d04 c0de 8ca7 c0de                         ........

c0de9134 <ux_idle_flow_2_step>:
c0de9134:	7261 c0de 912c c0de 0000 0000 0000 0000     ar..,...........

c0de9144 <ux_idle_flow_3_step_validate_step>:
c0de9144:	4caf c0de 0000 0000 0000 0000 0000 0000     .L..............

c0de9154 <ux_idle_flow_3_step_validate>:
c0de9154:	9144 c0de ffff ffff                         D.......

c0de915c <ux_idle_flow_3_step_val>:
c0de915c:	8618 c0de 8e18 c0de                         ........

c0de9164 <ux_idle_flow_3_step>:
c0de9164:	77d7 c0de 915c c0de 9154 c0de 0000 0000     .w..\...T.......

c0de9174 <ux_idle_flow>:
c0de9174:	911c c0de 9134 c0de 9164 c0de ffff ffff     ....4...d.......

c0de9184 <ux_display_address_flow_1_step_val>:
c0de9184:	8648 c0de 8cad c0de 8e3a c0de               H.......:...

c0de9190 <ux_display_address_flow_1_step>:
c0de9190:	7967 c0de 9184 c0de 0000 0000 0000 0000     gy..............

c0de91a0 <ux_display_address_flow_4_step_val>:
c0de91a0:	8e1d c0de 0008 da7a                         ......z.

c0de91a8 <ux_display_address_flow_4_step>:
c0de91a8:	75ef c0de 91a0 c0de 0000 0000 0000 0000     .u..............

c0de91b8 <ux_display_address_flow_5_step_validate_step>:
c0de91b8:	4cb5 c0de 0000 0000 0000 0000 0000 0000     .L..............

c0de91c8 <ux_display_address_flow_5_step_validate>:
c0de91c8:	91b8 c0de ffff ffff                         ........

c0de91d0 <ux_display_address_flow_5_step_val>:
c0de91d0:	8678 c0de 8b5f c0de                         x..._...

c0de91d8 <ux_display_address_flow_5_step>:
c0de91d8:	77d7 c0de 91d0 c0de 91c8 c0de 0000 0000     .w..............

c0de91e8 <ux_display_address_flow_6_step_validate_step>:
c0de91e8:	4cbb c0de 0000 0000 0000 0000 0000 0000     .L..............

c0de91f8 <ux_display_address_flow_6_step_validate>:
c0de91f8:	91e8 c0de ffff ffff                         ........

c0de9200 <ux_display_address_flow_6_step_val>:
c0de9200:	85e8 c0de 8bd8 c0de                         ........

c0de9208 <ux_display_address_flow_6_step>:
c0de9208:	77d7 c0de 9200 c0de 91f8 c0de 0000 0000     .w..............

c0de9218 <ux_display_address_flow>:
c0de9218:	9190 c0de 91a8 c0de 91d8 c0de 9208 c0de     ................
c0de9228:	ffff ffff                                   ....

c0de922c <ux_transfer_1_step_val>:
c0de922c:	8648 c0de 8f61 c0de 8e25 c0de               H...a...%...

c0de9238 <ux_transfer_1_step>:
c0de9238:	7967 c0de 922c c0de 0000 0000 0000 0000     gy..,...........

c0de9248 <ux_transfer_2_step_val>:
c0de9248:	8c34 c0de 0105 da7a                         4.....z.

c0de9250 <ux_transfer_2_step>:
c0de9250:	75ef c0de 9248 c0de 0000 0000 0000 0000     .u..H...........

c0de9260 <ux_transfer_3_step_val>:
c0de9260:	8b9a c0de 0132 da7a                         ....2.z.

c0de9268 <ux_transfer_3_step>:
c0de9268:	75ef c0de 9260 c0de 0000 0000 0000 0000     .u..`...........

c0de9278 <ux_transfer_4_step_val>:
c0de9278:	8c50 c0de 015f da7a                         P..._.z.

c0de9280 <ux_transfer_4_step>:
c0de9280:	75ef c0de 9278 c0de 0000 0000 0000 0000     .u..x...........

c0de9290 <ux_transfer_5_step_val>:
c0de9290:	8cf0 c0de 01f3 da7a                         ......z.

c0de9298 <ux_transfer_5_step>:
c0de9298:	75ef c0de 9290 c0de 0000 0000 0000 0000     .u..............

c0de92a8 <ux_transfer_6_step_val>:
c0de92a8:	8bdf c0de 00d8 da7a                         ......z.

c0de92b0 <ux_transfer_6_step>:
c0de92b0:	75ef c0de 92a8 c0de 0000 0000 0000 0000     .u..............

c0de92c0 <ux_transfer_7_step_val>:
c0de92c0:	8c53 c0de 0183 da7a                         S.....z.

c0de92c8 <ux_transfer_7_step>:
c0de92c8:	4cef c0de 92c0 c0de 0000 0000 0000 0000     .L..............

c0de92d8 <ux_transfer_8_step_val>:
c0de92d8:	8c5e c0de 00b4 da7a                         ^.....z.

c0de92e0 <ux_transfer_8_step>:
c0de92e0:	75ef c0de 92d8 c0de 0000 0000 0000 0000     .u..............

c0de92f0 <ux_transfer_9_step_val>:
c0de92f0:	8ba0 c0de 0375 da7a                         ....u.z.

c0de92f8 <ux_transfer_9_step>:
c0de92f8:	75ef c0de 92f0 c0de 0000 0000 0000 0000     .u..............

c0de9308 <ux_transfer_10_step_validate_step>:
c0de9308:	4d11 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de9318 <ux_transfer_10_step_validate>:
c0de9318:	9308 c0de ffff ffff                         ........

c0de9320 <ux_transfer_10_step_val>:
c0de9320:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de932c <ux_transfer_10_step>:
c0de932c:	78e5 c0de 9320 c0de 9318 c0de 0000 0000     .x.. ...........

c0de933c <ux_transfer_11_step_validate_step>:
c0de933c:	4d17 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de934c <ux_transfer_11_step_validate>:
c0de934c:	933c c0de ffff ffff                         <.......

c0de9354 <ux_transfer_11_step_val>:
c0de9354:	85e8 c0de 8bd8 c0de                         ........

c0de935c <ux_transfer_11_step>:
c0de935c:	77d7 c0de 9354 c0de 934c c0de 0000 0000     .w..T...L.......

c0de936c <ux_transfer_flow>:
c0de936c:	9238 c0de 9250 c0de 9268 c0de 9280 c0de     8...P...h.......
c0de937c:	9298 c0de 92b0 c0de 92c8 c0de 92e0 c0de     ................
c0de938c:	92f8 c0de 932c c0de 935c c0de ffff ffff     ....,...\.......

c0de939c <ux_data_1_step_val>:
c0de939c:	8648 c0de 8f61 c0de 8e60 c0de               H...a...`...

c0de93a8 <ux_data_1_step>:
c0de93a8:	7967 c0de 939c c0de 0000 0000 0000 0000     gy..............

c0de93b8 <ux_data_2_step_val>:
c0de93b8:	8cf0 c0de 01f3 da7a                         ......z.

c0de93c0 <ux_data_2_step>:
c0de93c0:	75ef c0de 93b8 c0de 0000 0000 0000 0000     .u..............

c0de93d0 <ux_data_3_step_val>:
c0de93d0:	8bdf c0de 00d8 da7a                         ......z.

c0de93d8 <ux_data_3_step>:
c0de93d8:	75ef c0de 93d0 c0de 0000 0000 0000 0000     .u..............

c0de93e8 <ux_data_4_step_val>:
c0de93e8:	8c5e c0de 00b4 da7a                         ^.....z.

c0de93f0 <ux_data_4_step>:
c0de93f0:	75ef c0de 93e8 c0de 0000 0000 0000 0000     .u..............

c0de9400 <ux_data_5_step_val>:
c0de9400:	8ba0 c0de 0375 da7a                         ....u.z.

c0de9408 <ux_data_5_step>:
c0de9408:	75ef c0de 9400 c0de 0000 0000 0000 0000     .u..............

c0de9418 <ux_data_6_step_validate_step>:
c0de9418:	4d1d c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de9428 <ux_data_6_step_validate>:
c0de9428:	9418 c0de ffff ffff                         ........

c0de9430 <ux_data_6_step_val>:
c0de9430:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de943c <ux_data_6_step>:
c0de943c:	78e5 c0de 9430 c0de 9428 c0de 0000 0000     .x..0...(.......

c0de944c <ux_data_7_step_validate_step>:
c0de944c:	4d23 c0de 0000 0000 0000 0000 0000 0000     #M..............

c0de945c <ux_data_7_step_validate>:
c0de945c:	944c c0de ffff ffff                         L.......

c0de9464 <ux_data_7_step_val>:
c0de9464:	85e8 c0de 8bd8 c0de                         ........

c0de946c <ux_data_7_step>:
c0de946c:	77d7 c0de 9464 c0de 945c c0de 0000 0000     .w..d...\.......

c0de947c <ux_data_flow>:
c0de947c:	93a8 c0de 93c0 c0de 93d8 c0de 93f0 c0de     ................
c0de948c:	9408 c0de 943c c0de 946c c0de ffff ffff     ....<...l.......

c0de949c <ux_issue_1_step_val>:
c0de949c:	8648 c0de 8f61 c0de 8b67 c0de               H...a...g...

c0de94a8 <ux_issue_1_step>:
c0de94a8:	7967 c0de 949c c0de 0000 0000 0000 0000     gy..............

c0de94b8 <ux_issue_2_step_val>:
c0de94b8:	8d80 c0de 0105 da7a                         ......z.

c0de94c0 <ux_issue_2_step>:
c0de94c0:	75ef c0de 94b8 c0de 0000 0000 0000 0000     .u..............

c0de94d0 <ux_issue_3_step_val>:
c0de94d0:	8c63 c0de 0132 da7a                         c...2.z.

c0de94d8 <ux_issue_3_step>:
c0de94d8:	75ef c0de 94d0 c0de 0000 0000 0000 0000     .u..............

c0de94e8 <ux_issue_4_step_val>:
c0de94e8:	8c34 c0de 015f da7a                         4..._.z.

c0de94f0 <ux_issue_4_step>:
c0de94f0:	75ef c0de 94e8 c0de 0000 0000 0000 0000     .u..............

c0de9500 <ux_issue_5_step_val>:
c0de9500:	8f69 c0de 0183 da7a                         i.....z.

c0de9508 <ux_issue_5_step>:
c0de9508:	75ef c0de 9500 c0de 0000 0000 0000 0000     .u..............

c0de9518 <ux_issue_6_step_val>:
c0de9518:	8d6c c0de 01b0 da7a                         l.....z.

c0de9520 <ux_issue_6_step>:
c0de9520:	75ef c0de 9518 c0de 0000 0000 0000 0000     .u..............

c0de9530 <ux_issue_7_step_val>:
c0de9530:	8c6f c0de 01dd da7a                         o.....z.

c0de9538 <ux_issue_7_step>:
c0de9538:	75ef c0de 9530 c0de 0000 0000 0000 0000     .u..0...........

c0de9548 <ux_issue_8_step_val>:
c0de9548:	8cf0 c0de 01f3 da7a                         ......z.

c0de9550 <ux_issue_8_step>:
c0de9550:	75ef c0de 9548 c0de 0000 0000 0000 0000     .u..H...........

c0de9560 <ux_issue_9_step_val>:
c0de9560:	8bdf c0de 00d8 da7a                         ......z.

c0de9568 <ux_issue_9_step>:
c0de9568:	75ef c0de 9560 c0de 0000 0000 0000 0000     .u..`...........

c0de9578 <ux_issue_10_step_val>:
c0de9578:	8c5e c0de 00b4 da7a                         ^.....z.

c0de9580 <ux_issue_10_step>:
c0de9580:	75ef c0de 9578 c0de 0000 0000 0000 0000     .u..x...........

c0de9590 <ux_issue_11_step_val>:
c0de9590:	8ba0 c0de 0375 da7a                         ....u.z.

c0de9598 <ux_issue_11_step>:
c0de9598:	75ef c0de 9590 c0de 0000 0000 0000 0000     .u..............

c0de95a8 <ux_issue_12_step_validate_step>:
c0de95a8:	4d29 c0de 0000 0000 0000 0000 0000 0000     )M..............

c0de95b8 <ux_issue_12_step_validate>:
c0de95b8:	95a8 c0de ffff ffff                         ........

c0de95c0 <ux_issue_12_step_val>:
c0de95c0:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de95cc <ux_issue_12_step>:
c0de95cc:	78e5 c0de 95c0 c0de 95b8 c0de 0000 0000     .x..............

c0de95dc <ux_issue_13_step_validate_step>:
c0de95dc:	4d2f c0de 0000 0000 0000 0000 0000 0000     /M..............

c0de95ec <ux_issue_13_step_validate>:
c0de95ec:	95dc c0de ffff ffff                         ........

c0de95f4 <ux_issue_13_step_val>:
c0de95f4:	85e8 c0de 8bd8 c0de                         ........

c0de95fc <ux_issue_13_step>:
c0de95fc:	77d7 c0de 95f4 c0de 95ec c0de 0000 0000     .w..............

c0de960c <ux_issue_flow>:
c0de960c:	94a8 c0de 94c0 c0de 94d8 c0de 94f0 c0de     ................
c0de961c:	9508 c0de 9520 c0de 9538 c0de 9550 c0de     .... ...8...P...
c0de962c:	9568 c0de 9580 c0de 9598 c0de 95cc c0de     h...............
c0de963c:	95fc c0de ffff ffff                         ........

c0de9644 <ux_reissue_1_step_val>:
c0de9644:	8648 c0de 8f61 c0de 8d0c c0de               H...a.......

c0de9650 <ux_reissue_1_step>:
c0de9650:	7967 c0de 9644 c0de 0000 0000 0000 0000     gy..D...........

c0de9660 <ux_reissue_2_step_val>:
c0de9660:	8c34 c0de 0105 da7a                         4.....z.

c0de9668 <ux_reissue_2_step>:
c0de9668:	75ef c0de 9660 c0de 0000 0000 0000 0000     .u..`...........

c0de9678 <ux_reissue_3_step_val>:
c0de9678:	8b9a c0de 0132 da7a                         ....2.z.

c0de9680 <ux_reissue_3_step>:
c0de9680:	75ef c0de 9678 c0de 0000 0000 0000 0000     .u..x...........

c0de9690 <ux_reissue_4_step_val>:
c0de9690:	8d6c c0de 015f da7a                         l..._.z.

c0de9698 <ux_reissue_4_step>:
c0de9698:	75ef c0de 9690 c0de 0000 0000 0000 0000     .u..............

c0de96a8 <ux_reissue_5_step_val>:
c0de96a8:	8cf0 c0de 01f3 da7a                         ......z.

c0de96b0 <ux_reissue_5_step>:
c0de96b0:	75ef c0de 96a8 c0de 0000 0000 0000 0000     .u..............

c0de96c0 <ux_reissue_6_step_val>:
c0de96c0:	8bdf c0de 00d8 da7a                         ......z.

c0de96c8 <ux_reissue_6_step>:
c0de96c8:	75ef c0de 96c0 c0de 0000 0000 0000 0000     .u..............

c0de96d8 <ux_reissue_7_step_val>:
c0de96d8:	8c5e c0de 00b4 da7a                         ^.....z.

c0de96e0 <ux_reissue_7_step>:
c0de96e0:	75ef c0de 96d8 c0de 0000 0000 0000 0000     .u..............

c0de96f0 <ux_reissue_8_step_val>:
c0de96f0:	8ba0 c0de 0375 da7a                         ....u.z.

c0de96f8 <ux_reissue_8_step>:
c0de96f8:	75ef c0de 96f0 c0de 0000 0000 0000 0000     .u..............

c0de9708 <ux_reissue_9_step_validate_step>:
c0de9708:	4d35 c0de 0000 0000 0000 0000 0000 0000     5M..............

c0de9718 <ux_reissue_9_step_validate>:
c0de9718:	9708 c0de ffff ffff                         ........

c0de9720 <ux_reissue_9_step_val>:
c0de9720:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de972c <ux_reissue_9_step>:
c0de972c:	78e5 c0de 9720 c0de 9718 c0de 0000 0000     .x.. ...........

c0de973c <ux_reissue_10_step_validate_step>:
c0de973c:	4d3b c0de 0000 0000 0000 0000 0000 0000     ;M..............

c0de974c <ux_reissue_10_step_validate>:
c0de974c:	973c c0de ffff ffff                         <.......

c0de9754 <ux_reissue_10_step_val>:
c0de9754:	85e8 c0de 8bd8 c0de                         ........

c0de975c <ux_reissue_10_step>:
c0de975c:	77d7 c0de 9754 c0de 974c c0de 0000 0000     .w..T...L.......

c0de976c <ux_reissue_flow>:
c0de976c:	9650 c0de 9668 c0de 9680 c0de 9698 c0de     P...h...........
c0de977c:	96b0 c0de 96c8 c0de 96e0 c0de 96f8 c0de     ................
c0de978c:	972c c0de 975c c0de ffff ffff               ,...\.......

c0de9798 <ux_burn_1_step_val>:
c0de9798:	8648 c0de 8f61 c0de 8f0f c0de               H...a.......

c0de97a4 <ux_burn_1_step>:
c0de97a4:	7967 c0de 9798 c0de 0000 0000 0000 0000     gy..............

c0de97b4 <ux_burn_2_step_val>:
c0de97b4:	8c34 c0de 0105 da7a                         4.....z.

c0de97bc <ux_burn_2_step>:
c0de97bc:	75ef c0de 97b4 c0de 0000 0000 0000 0000     .u..............

c0de97cc <ux_burn_3_step_val>:
c0de97cc:	8b9a c0de 0132 da7a                         ....2.z.

c0de97d4 <ux_burn_3_step>:
c0de97d4:	75ef c0de 97cc c0de 0000 0000 0000 0000     .u..............

c0de97e4 <ux_burn_4_step_val>:
c0de97e4:	8cf0 c0de 01f3 da7a                         ......z.

c0de97ec <ux_burn_4_step>:
c0de97ec:	75ef c0de 97e4 c0de 0000 0000 0000 0000     .u..............

c0de97fc <ux_burn_5_step_val>:
c0de97fc:	8bdf c0de 00d8 da7a                         ......z.

c0de9804 <ux_burn_5_step>:
c0de9804:	75ef c0de 97fc c0de 0000 0000 0000 0000     .u..............

c0de9814 <ux_burn_6_step_val>:
c0de9814:	8c5e c0de 00b4 da7a                         ^.....z.

c0de981c <ux_burn_6_step>:
c0de981c:	75ef c0de 9814 c0de 0000 0000 0000 0000     .u..............

c0de982c <ux_burn_7_step_val>:
c0de982c:	8ba0 c0de 0375 da7a                         ....u.z.

c0de9834 <ux_burn_7_step>:
c0de9834:	75ef c0de 982c c0de 0000 0000 0000 0000     .u..,...........

c0de9844 <ux_burn_8_step_validate_step>:
c0de9844:	4d41 c0de 0000 0000 0000 0000 0000 0000     AM..............

c0de9854 <ux_burn_8_step_validate>:
c0de9854:	9844 c0de ffff ffff                         D.......

c0de985c <ux_burn_8_step_val>:
c0de985c:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de9868 <ux_burn_8_step>:
c0de9868:	78e5 c0de 985c c0de 9854 c0de 0000 0000     .x..\...T.......

c0de9878 <ux_burn_9_step_validate_step>:
c0de9878:	4d47 c0de 0000 0000 0000 0000 0000 0000     GM..............

c0de9888 <ux_burn_9_step_validate>:
c0de9888:	9878 c0de ffff ffff                         x.......

c0de9890 <ux_burn_9_step_val>:
c0de9890:	85e8 c0de 8bd8 c0de                         ........

c0de9898 <ux_burn_9_step>:
c0de9898:	77d7 c0de 9890 c0de 9888 c0de 0000 0000     .w..............

c0de98a8 <ux_burn_flow>:
c0de98a8:	97a4 c0de 97bc c0de 97d4 c0de 97ec c0de     ................
c0de98b8:	9804 c0de 981c c0de 9834 c0de 9868 c0de     ........4...h...
c0de98c8:	9898 c0de ffff ffff                         ........

c0de98d0 <ux_lease_1_step_val>:
c0de98d0:	8648 c0de 8f61 c0de 8dcf c0de               H...a.......

c0de98dc <ux_lease_1_step>:
c0de98dc:	7967 c0de 98d0 c0de 0000 0000 0000 0000     gy..............

c0de98ec <ux_lease_2_step_val>:
c0de98ec:	8c34 c0de 0105 da7a                         4.....z.

c0de98f4 <ux_lease_2_step>:
c0de98f4:	75ef c0de 98ec c0de 0000 0000 0000 0000     .u..............

c0de9904 <ux_lease_3_step_val>:
c0de9904:	8c50 c0de 015f da7a                         P..._.z.

c0de990c <ux_lease_3_step>:
c0de990c:	75ef c0de 9904 c0de 0000 0000 0000 0000     .u..............

c0de991c <ux_lease_4_step_val>:
c0de991c:	8cf0 c0de 01f3 da7a                         ......z.

c0de9924 <ux_lease_4_step>:
c0de9924:	75ef c0de 991c c0de 0000 0000 0000 0000     .u..............

c0de9934 <ux_lease_5_step_val>:
c0de9934:	8bdf c0de 00d8 da7a                         ......z.

c0de993c <ux_lease_5_step>:
c0de993c:	75ef c0de 9934 c0de 0000 0000 0000 0000     .u..4...........

c0de994c <ux_lease_6_step_val>:
c0de994c:	8c5e c0de 00b4 da7a                         ^.....z.

c0de9954 <ux_lease_6_step>:
c0de9954:	75ef c0de 994c c0de 0000 0000 0000 0000     .u..L...........

c0de9964 <ux_lease_7_step_val>:
c0de9964:	8ba0 c0de 0375 da7a                         ....u.z.

c0de996c <ux_lease_7_step>:
c0de996c:	75ef c0de 9964 c0de 0000 0000 0000 0000     .u..d...........

c0de997c <ux_lease_8_step_validate_step>:
c0de997c:	4d4d c0de 0000 0000 0000 0000 0000 0000     MM..............

c0de998c <ux_lease_8_step_validate>:
c0de998c:	997c c0de ffff ffff                         |.......

c0de9994 <ux_lease_8_step_val>:
c0de9994:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de99a0 <ux_lease_8_step>:
c0de99a0:	78e5 c0de 9994 c0de 998c c0de 0000 0000     .x..............

c0de99b0 <ux_lease_9_step_validate_step>:
c0de99b0:	4d53 c0de 0000 0000 0000 0000 0000 0000     SM..............

c0de99c0 <ux_lease_9_step_validate>:
c0de99c0:	99b0 c0de ffff ffff                         ........

c0de99c8 <ux_lease_9_step_val>:
c0de99c8:	85e8 c0de 8bd8 c0de                         ........

c0de99d0 <ux_lease_9_step>:
c0de99d0:	77d7 c0de 99c8 c0de 99c0 c0de 0000 0000     .w..............

c0de99e0 <ux_lease_flow>:
c0de99e0:	98dc c0de 98f4 c0de 990c c0de 9924 c0de     ............$...
c0de99f0:	993c c0de 9954 c0de 996c c0de 99a0 c0de     <...T...l.......
c0de9a00:	99d0 c0de ffff ffff                         ........

c0de9a08 <ux_cancel_lease_1_step_val>:
c0de9a08:	8648 c0de 8f61 c0de 8d85 c0de               H...a.......

c0de9a14 <ux_cancel_lease_1_step>:
c0de9a14:	7967 c0de 9a08 c0de 0000 0000 0000 0000     gy..............

c0de9a24 <ux_cancel_lease_2_step_val>:
c0de9a24:	8ccb c0de 0105 da7a                         ......z.

c0de9a2c <ux_cancel_lease_2_step>:
c0de9a2c:	75ef c0de 9a24 c0de 0000 0000 0000 0000     .u..$...........

c0de9a3c <ux_cancel_lease_3_step_val>:
c0de9a3c:	8cf0 c0de 01f3 da7a                         ......z.

c0de9a44 <ux_cancel_lease_3_step>:
c0de9a44:	75ef c0de 9a3c c0de 0000 0000 0000 0000     .u..<...........

c0de9a54 <ux_cancel_lease_4_step_val>:
c0de9a54:	8bdf c0de 00d8 da7a                         ......z.

c0de9a5c <ux_cancel_lease_4_step>:
c0de9a5c:	75ef c0de 9a54 c0de 0000 0000 0000 0000     .u..T...........

c0de9a6c <ux_cancel_lease_5_step_val>:
c0de9a6c:	8c5e c0de 00b4 da7a                         ^.....z.

c0de9a74 <ux_cancel_lease_5_step>:
c0de9a74:	75ef c0de 9a6c c0de 0000 0000 0000 0000     .u..l...........

c0de9a84 <ux_cancel_lease_6_step_val>:
c0de9a84:	8ba0 c0de 0375 da7a                         ....u.z.

c0de9a8c <ux_cancel_lease_6_step>:
c0de9a8c:	75ef c0de 9a84 c0de 0000 0000 0000 0000     .u..............

c0de9a9c <ux_cancel_lease_7_step_validate_step>:
c0de9a9c:	4d59 c0de 0000 0000 0000 0000 0000 0000     YM..............

c0de9aac <ux_cancel_lease_7_step_validate>:
c0de9aac:	9a9c c0de ffff ffff                         ........

c0de9ab4 <ux_cancel_lease_7_step_val>:
c0de9ab4:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de9ac0 <ux_cancel_lease_7_step>:
c0de9ac0:	78e5 c0de 9ab4 c0de 9aac c0de 0000 0000     .x..............

c0de9ad0 <ux_cancel_lease_8_step_validate_step>:
c0de9ad0:	4d5f c0de 0000 0000 0000 0000 0000 0000     _M..............

c0de9ae0 <ux_cancel_lease_8_step_validate>:
c0de9ae0:	9ad0 c0de ffff ffff                         ........

c0de9ae8 <ux_cancel_lease_8_step_val>:
c0de9ae8:	85e8 c0de 8bd8 c0de                         ........

c0de9af0 <ux_cancel_lease_8_step>:
c0de9af0:	77d7 c0de 9ae8 c0de 9ae0 c0de 0000 0000     .w..............

c0de9b00 <ux_cancel_lease_flow>:
c0de9b00:	9a14 c0de 9a2c c0de 9a44 c0de 9a5c c0de     ....,...D...\...
c0de9b10:	9a74 c0de 9a8c c0de 9ac0 c0de 9af0 c0de     t...............
c0de9b20:	ffff ffff                                   ....

c0de9b24 <ux_create_alias_1_step_val>:
c0de9b24:	8648 c0de 8f61 c0de 8f7e c0de               H...a...~...

c0de9b30 <ux_create_alias_1_step>:
c0de9b30:	7967 c0de 9b24 c0de 0000 0000 0000 0000     gy..$...........

c0de9b40 <ux_create_alias_2_step_val>:
c0de9b40:	8f72 c0de 0105 da7a                         r.....z.

c0de9b48 <ux_create_alias_2_step>:
c0de9b48:	75ef c0de 9b40 c0de 0000 0000 0000 0000     .u..@...........

c0de9b58 <ux_create_alias_3_step_val>:
c0de9b58:	8cf0 c0de 01f3 da7a                         ......z.

c0de9b60 <ux_create_alias_3_step>:
c0de9b60:	75ef c0de 9b58 c0de 0000 0000 0000 0000     .u..X...........

c0de9b70 <ux_create_alias_4_step_val>:
c0de9b70:	8bdf c0de 00d8 da7a                         ......z.

c0de9b78 <ux_create_alias_4_step>:
c0de9b78:	75ef c0de 9b70 c0de 0000 0000 0000 0000     .u..p...........

c0de9b88 <ux_create_alias_5_step_val>:
c0de9b88:	8c5e c0de 00b4 da7a                         ^.....z.

c0de9b90 <ux_create_alias_5_step>:
c0de9b90:	75ef c0de 9b88 c0de 0000 0000 0000 0000     .u..............

c0de9ba0 <ux_create_alias_6_step_val>:
c0de9ba0:	8ba0 c0de 0375 da7a                         ....u.z.

c0de9ba8 <ux_create_alias_6_step>:
c0de9ba8:	75ef c0de 9ba0 c0de 0000 0000 0000 0000     .u..............

c0de9bb8 <ux_create_alias_7_step_validate_step>:
c0de9bb8:	4d65 c0de 0000 0000 0000 0000 0000 0000     eM..............

c0de9bc8 <ux_create_alias_7_step_validate>:
c0de9bc8:	9bb8 c0de ffff ffff                         ........

c0de9bd0 <ux_create_alias_7_step_val>:
c0de9bd0:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de9bdc <ux_create_alias_7_step>:
c0de9bdc:	78e5 c0de 9bd0 c0de 9bc8 c0de 0000 0000     .x..............

c0de9bec <ux_create_alias_8_step_validate_step>:
c0de9bec:	4d6b c0de 0000 0000 0000 0000 0000 0000     kM..............

c0de9bfc <ux_create_alias_8_step_validate>:
c0de9bfc:	9bec c0de ffff ffff                         ........

c0de9c04 <ux_create_alias_8_step_val>:
c0de9c04:	85e8 c0de 8bd8 c0de                         ........

c0de9c0c <ux_create_alias_8_step>:
c0de9c0c:	77d7 c0de 9c04 c0de 9bfc c0de 0000 0000     .w..............

c0de9c1c <ux_create_alias_flow>:
c0de9c1c:	9b30 c0de 9b48 c0de 9b60 c0de 9b78 c0de     0...H...`...x...
c0de9c2c:	9b90 c0de 9ba8 c0de 9bdc c0de 9c0c c0de     ................
c0de9c3c:	ffff ffff                                   ....

c0de9c40 <ux_masstransfer_1_step_val>:
c0de9c40:	8648 c0de 8f61 c0de 8de1 c0de               H...a.......

c0de9c4c <ux_masstransfer_1_step>:
c0de9c4c:	7967 c0de 9c40 c0de 0000 0000 0000 0000     gy..@...........

c0de9c5c <ux_masstransfer_2_step_val>:
c0de9c5c:	8b9a c0de 0105 da7a                         ......z.

c0de9c64 <ux_masstransfer_2_step>:
c0de9c64:	75ef c0de 9c5c c0de 0000 0000 0000 0000     .u..\...........

c0de9c74 <ux_masstransfer_3_step_val>:
c0de9c74:	8cf0 c0de 01f3 da7a                         ......z.

c0de9c7c <ux_masstransfer_3_step>:
c0de9c7c:	75ef c0de 9c74 c0de 0000 0000 0000 0000     .u..t...........

c0de9c8c <ux_masstransfer_4_step_val>:
c0de9c8c:	8bdf c0de 00d8 da7a                         ......z.

c0de9c94 <ux_masstransfer_4_step>:
c0de9c94:	75ef c0de 9c8c c0de 0000 0000 0000 0000     .u..............

c0de9ca4 <ux_masstransfer_5_step_val>:
c0de9ca4:	8c53 c0de 0132 da7a                         S...2.z.

c0de9cac <ux_masstransfer_5_step>:
c0de9cac:	4d71 c0de 9ca4 c0de 0000 0000 0000 0000     qM..............

c0de9cbc <ux_masstransfer_6_step_val>:
c0de9cbc:	8c5e c0de 00b4 da7a                         ^.....z.

c0de9cc4 <ux_masstransfer_6_step>:
c0de9cc4:	75ef c0de 9cbc c0de 0000 0000 0000 0000     .u..............

c0de9cd4 <ux_masstransfer_7_step_val>:
c0de9cd4:	8ba0 c0de 0375 da7a                         ....u.z.

c0de9cdc <ux_masstransfer_7_step>:
c0de9cdc:	75ef c0de 9cd4 c0de 0000 0000 0000 0000     .u..............

c0de9cec <ux_masstransfer_8_step_validate_step>:
c0de9cec:	4d93 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de9cfc <ux_masstransfer_8_step_validate>:
c0de9cfc:	9cec c0de ffff ffff                         ........

c0de9d04 <ux_masstransfer_8_step_val>:
c0de9d04:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de9d10 <ux_masstransfer_8_step>:
c0de9d10:	78e5 c0de 9d04 c0de 9cfc c0de 0000 0000     .x..............

c0de9d20 <ux_masstransfer_9_step_validate_step>:
c0de9d20:	4d99 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de9d30 <ux_masstransfer_9_step_validate>:
c0de9d30:	9d20 c0de ffff ffff                          .......

c0de9d38 <ux_masstransfer_9_step_val>:
c0de9d38:	85e8 c0de 8bd8 c0de                         ........

c0de9d40 <ux_masstransfer_9_step>:
c0de9d40:	77d7 c0de 9d38 c0de 9d30 c0de 0000 0000     .w..8...0.......

c0de9d50 <ux_masstransfer_flow>:
c0de9d50:	9c4c c0de 9c64 c0de 9c7c c0de 9c94 c0de     L...d...|.......
c0de9d60:	9cac c0de 9cc4 c0de 9cdc c0de 9d10 c0de     ................
c0de9d70:	9d40 c0de ffff ffff                         @.......

c0de9d78 <ux_set_ac_script_1_step_val>:
c0de9d78:	8648 c0de 8f61 c0de 8be9 c0de               H...a.......

c0de9d84 <ux_set_ac_script_1_step>:
c0de9d84:	7967 c0de 9d78 c0de 0000 0000 0000 0000     gy..x...........

c0de9d94 <ux_set_ac_script_2_step_val>:
c0de9d94:	8cf0 c0de 01f3 da7a                         ......z.

c0de9d9c <ux_set_ac_script_2_step>:
c0de9d9c:	75ef c0de 9d94 c0de 0000 0000 0000 0000     .u..............

c0de9dac <ux_set_ac_script_3_step_val>:
c0de9dac:	8bdf c0de 00d8 da7a                         ......z.

c0de9db4 <ux_set_ac_script_3_step>:
c0de9db4:	75ef c0de 9dac c0de 0000 0000 0000 0000     .u..............

c0de9dc4 <ux_set_ac_script_4_step_val>:
c0de9dc4:	8c5e c0de 00b4 da7a                         ^.....z.

c0de9dcc <ux_set_ac_script_4_step>:
c0de9dcc:	75ef c0de 9dc4 c0de 0000 0000 0000 0000     .u..............

c0de9ddc <ux_set_ac_script_5_step_val>:
c0de9ddc:	8ba0 c0de 0375 da7a                         ....u.z.

c0de9de4 <ux_set_ac_script_5_step>:
c0de9de4:	75ef c0de 9ddc c0de 0000 0000 0000 0000     .u..............

c0de9df4 <ux_set_ac_script_6_step_validate_step>:
c0de9df4:	4d9f c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de9e04 <ux_set_ac_script_6_step_validate>:
c0de9e04:	9df4 c0de ffff ffff                         ........

c0de9e0c <ux_set_ac_script_6_step_val>:
c0de9e0c:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de9e18 <ux_set_ac_script_6_step>:
c0de9e18:	78e5 c0de 9e0c c0de 9e04 c0de 0000 0000     .x..............

c0de9e28 <ux_set_ac_script_7_step_validate_step>:
c0de9e28:	4da5 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de9e38 <ux_set_ac_script_7_step_validate>:
c0de9e38:	9e28 c0de ffff ffff                         (.......

c0de9e40 <ux_set_ac_script_7_step_val>:
c0de9e40:	85e8 c0de 8bd8 c0de                         ........

c0de9e48 <ux_set_ac_script_7_step>:
c0de9e48:	77d7 c0de 9e40 c0de 9e38 c0de 0000 0000     .w..@...8.......

c0de9e58 <ux_set_ac_script_flow>:
c0de9e58:	9d84 c0de 9d9c c0de 9db4 c0de 9dcc c0de     ................
c0de9e68:	9de4 c0de 9e18 c0de 9e48 c0de ffff ffff     ........H.......

c0de9e78 <ux_set_as_script_1_step_val>:
c0de9e78:	8648 c0de 8f61 c0de 8db1 c0de               H...a.......

c0de9e84 <ux_set_as_script_1_step>:
c0de9e84:	7967 c0de 9e78 c0de 0000 0000 0000 0000     gy..x...........

c0de9e94 <ux_set_as_script_2_step_val>:
c0de9e94:	8b9a c0de 0105 da7a                         ......z.

c0de9e9c <ux_set_as_script_2_step>:
c0de9e9c:	75ef c0de 9e94 c0de 0000 0000 0000 0000     .u..............

c0de9eac <ux_set_as_script_3_step_val>:
c0de9eac:	8cf0 c0de 01f3 da7a                         ......z.

c0de9eb4 <ux_set_as_script_3_step>:
c0de9eb4:	75ef c0de 9eac c0de 0000 0000 0000 0000     .u..............

c0de9ec4 <ux_set_as_script_4_step_val>:
c0de9ec4:	8bdf c0de 00d8 da7a                         ......z.

c0de9ecc <ux_set_as_script_4_step>:
c0de9ecc:	75ef c0de 9ec4 c0de 0000 0000 0000 0000     .u..............

c0de9edc <ux_set_as_script_5_step_val>:
c0de9edc:	8c5e c0de 00b4 da7a                         ^.....z.

c0de9ee4 <ux_set_as_script_5_step>:
c0de9ee4:	75ef c0de 9edc c0de 0000 0000 0000 0000     .u..............

c0de9ef4 <ux_set_as_script_6_step_val>:
c0de9ef4:	8ba0 c0de 0375 da7a                         ....u.z.

c0de9efc <ux_set_as_script_6_step>:
c0de9efc:	75ef c0de 9ef4 c0de 0000 0000 0000 0000     .u..............

c0de9f0c <ux_set_as_script_7_step_validate_step>:
c0de9f0c:	4dab c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de9f1c <ux_set_as_script_7_step_validate>:
c0de9f1c:	9f0c c0de ffff ffff                         ........

c0de9f24 <ux_set_as_script_7_step_val>:
c0de9f24:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0de9f30 <ux_set_as_script_7_step>:
c0de9f30:	78e5 c0de 9f24 c0de 9f1c c0de 0000 0000     .x..$...........

c0de9f40 <ux_set_as_script_8_step_validate_step>:
c0de9f40:	4db1 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0de9f50 <ux_set_as_script_8_step_validate>:
c0de9f50:	9f40 c0de ffff ffff                         @.......

c0de9f58 <ux_set_as_script_8_step_val>:
c0de9f58:	85e8 c0de 8bd8 c0de                         ........

c0de9f60 <ux_set_as_script_8_step>:
c0de9f60:	77d7 c0de 9f58 c0de 9f50 c0de 0000 0000     .w..X...P.......

c0de9f70 <ux_set_as_script_flow>:
c0de9f70:	9e84 c0de 9e9c c0de 9eb4 c0de 9ecc c0de     ................
c0de9f80:	9ee4 c0de 9efc c0de 9f30 c0de 9f60 c0de     ........0...`...
c0de9f90:	ffff ffff                                   ....

c0de9f94 <ux_sponsorship_1_step_val>:
c0de9f94:	8648 c0de 8f61 c0de 8d1a c0de               H...a.......

c0de9fa0 <ux_sponsorship_1_step>:
c0de9fa0:	7967 c0de 9f94 c0de 0000 0000 0000 0000     gy..............

c0de9fb0 <ux_sponsorship_2_step_val>:
c0de9fb0:	8c34 c0de 0105 da7a                         4.....z.

c0de9fb8 <ux_sponsorship_2_step>:
c0de9fb8:	75ef c0de 9fb0 c0de 0000 0000 0000 0000     .u..............

c0de9fc8 <ux_sponsorship_3_step_val>:
c0de9fc8:	8b9a c0de 0132 da7a                         ....2.z.

c0de9fd0 <ux_sponsorship_3_step>:
c0de9fd0:	75ef c0de 9fc8 c0de 0000 0000 0000 0000     .u..............

c0de9fe0 <ux_sponsorship_4_step_val>:
c0de9fe0:	8cf0 c0de 01f3 da7a                         ......z.

c0de9fe8 <ux_sponsorship_4_step>:
c0de9fe8:	75ef c0de 9fe0 c0de 0000 0000 0000 0000     .u..............

c0de9ff8 <ux_sponsorship_5_step_val>:
c0de9ff8:	8bdf c0de 00d8 da7a                         ......z.

c0dea000 <ux_sponsorship_5_step>:
c0dea000:	75ef c0de 9ff8 c0de 0000 0000 0000 0000     .u..............

c0dea010 <ux_sponsorship_6_step_val>:
c0dea010:	8c5e c0de 00b4 da7a                         ^.....z.

c0dea018 <ux_sponsorship_6_step>:
c0dea018:	75ef c0de a010 c0de 0000 0000 0000 0000     .u..............

c0dea028 <ux_sponsorship_7_step_val>:
c0dea028:	8ba0 c0de 0375 da7a                         ....u.z.

c0dea030 <ux_sponsorship_7_step>:
c0dea030:	75ef c0de a028 c0de 0000 0000 0000 0000     .u..(...........

c0dea040 <ux_sponsorship_8_step_validate_step>:
c0dea040:	4db7 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0dea050 <ux_sponsorship_8_step_validate>:
c0dea050:	a040 c0de ffff ffff                         @.......

c0dea058 <ux_sponsorship_8_step_val>:
c0dea058:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0dea064 <ux_sponsorship_8_step>:
c0dea064:	78e5 c0de a058 c0de a050 c0de 0000 0000     .x..X...P.......

c0dea074 <ux_sponsorship_9_step_validate_step>:
c0dea074:	4dbd c0de 0000 0000 0000 0000 0000 0000     .M..............

c0dea084 <ux_sponsorship_9_step_validate>:
c0dea084:	a074 c0de ffff ffff                         t.......

c0dea08c <ux_sponsorship_9_step_val>:
c0dea08c:	85e8 c0de 8bd8 c0de                         ........

c0dea094 <ux_sponsorship_9_step>:
c0dea094:	77d7 c0de a08c c0de a084 c0de 0000 0000     .w..............

c0dea0a4 <ux_sponsorship_flow>:
c0dea0a4:	9fa0 c0de 9fb8 c0de 9fd0 c0de 9fe8 c0de     ................
c0dea0b4:	a000 c0de a018 c0de a030 c0de a064 c0de     ........0...d...
c0dea0c4:	a094 c0de ffff ffff                         ........

c0dea0cc <ux_update_asset_1_step_val>:
c0dea0cc:	8648 c0de 8f61 c0de 8f8d c0de               H...a.......

c0dea0d8 <ux_update_asset_1_step>:
c0dea0d8:	7967 c0de a0cc c0de 0000 0000 0000 0000     gy..............

c0dea0e8 <ux_update_asset_2_step_val>:
c0dea0e8:	8b9a c0de 0105 da7a                         ......z.

c0dea0f0 <ux_update_asset_2_step>:
c0dea0f0:	75ef c0de a0e8 c0de 0000 0000 0000 0000     .u..............

c0dea100 <ux_update_asset_3_step_val>:
c0dea100:	8d80 c0de 0132 da7a                         ....2.z.

c0dea108 <ux_update_asset_3_step>:
c0dea108:	75ef c0de a100 c0de 0000 0000 0000 0000     .u..............

c0dea118 <ux_update_asset_4_step_val>:
c0dea118:	8c63 c0de 0183 da7a                         c.....z.

c0dea120 <ux_update_asset_4_step>:
c0dea120:	75ef c0de a118 c0de 0000 0000 0000 0000     .u..............

c0dea130 <ux_update_asset_5_step_val>:
c0dea130:	8cf0 c0de 01f3 da7a                         ......z.

c0dea138 <ux_update_asset_5_step>:
c0dea138:	75ef c0de a130 c0de 0000 0000 0000 0000     .u..0...........

c0dea148 <ux_update_asset_6_step_val>:
c0dea148:	8bdf c0de 00d8 da7a                         ......z.

c0dea150 <ux_update_asset_6_step>:
c0dea150:	75ef c0de a148 c0de 0000 0000 0000 0000     .u..H...........

c0dea160 <ux_update_asset_7_step_val>:
c0dea160:	8c5e c0de 00b4 da7a                         ^.....z.

c0dea168 <ux_update_asset_7_step>:
c0dea168:	75ef c0de a160 c0de 0000 0000 0000 0000     .u..`...........

c0dea178 <ux_update_asset_8_step_val>:
c0dea178:	8ba0 c0de 0375 da7a                         ....u.z.

c0dea180 <ux_update_asset_8_step>:
c0dea180:	75ef c0de a178 c0de 0000 0000 0000 0000     .u..x...........

c0dea190 <ux_update_asset_9_step_validate_step>:
c0dea190:	4dc3 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0dea1a0 <ux_update_asset_9_step_validate>:
c0dea1a0:	a190 c0de ffff ffff                         ........

c0dea1a8 <ux_update_asset_9_step_val>:
c0dea1a8:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0dea1b4 <ux_update_asset_9_step>:
c0dea1b4:	78e5 c0de a1a8 c0de a1a0 c0de 0000 0000     .x..............

c0dea1c4 <ux_update_asset_10_step_validate_step>:
c0dea1c4:	4dc9 c0de 0000 0000 0000 0000 0000 0000     .M..............

c0dea1d4 <ux_update_asset_10_step_validate>:
c0dea1d4:	a1c4 c0de ffff ffff                         ........

c0dea1dc <ux_update_asset_10_step_val>:
c0dea1dc:	85e8 c0de 8bd8 c0de                         ........

c0dea1e4 <ux_update_asset_10_step>:
c0dea1e4:	77d7 c0de a1dc c0de a1d4 c0de 0000 0000     .w..............

c0dea1f4 <ux_update_asset_flow>:
c0dea1f4:	a0d8 c0de a0f0 c0de a108 c0de a120 c0de     ............ ...
c0dea204:	a138 c0de a150 c0de a168 c0de a180 c0de     8...P...h.......
c0dea214:	a1b4 c0de a1e4 c0de ffff ffff               ............

c0dea220 <ux_invoke_1_step_val>:
c0dea220:	8648 c0de 8f61 c0de 8bb8 c0de               H...a.......

c0dea22c <ux_invoke_1_step>:
c0dea22c:	7967 c0de a220 c0de 0000 0000 0000 0000     gy.. ...........

c0dea23c <ux_invoke_2_step_val>:
c0dea23c:	8cb4 c0de 015f da7a                         ...._.z.

c0dea244 <ux_invoke_2_step>:
c0dea244:	75ef c0de a23c c0de 0000 0000 0000 0000     .u..<...........

c0dea254 <ux_invoke_3_step_val>:
c0dea254:	8bca c0de 0132 da7a                         ....2.z.

c0dea25c <ux_invoke_3_step>:
c0dea25c:	75ef c0de a254 c0de 0000 0000 0000 0000     .u..T...........

c0dea26c <ux_invoke_4_step_val>:
c0dea26c:	8e42 c0de 0183 da7a                         B.....z.

c0dea274 <ux_invoke_4_step>:
c0dea274:	4dcf c0de a26c c0de 0000 0000 0000 0000     .M..l...........

c0dea284 <ux_invoke_5_step_val>:
c0dea284:	8cf4 c0de 0105 da7a                         ......z.

c0dea28c <ux_invoke_5_step>:
c0dea28c:	4df1 c0de a284 c0de 0000 0000 0000 0000     .M..............

c0dea29c <ux_invoke_6_step_val>:
c0dea29c:	8b89 c0de 01dd da7a                         ......z.

c0dea2a4 <ux_invoke_6_step>:
c0dea2a4:	4e11 c0de a29c c0de 0000 0000 0000 0000     .N..............

c0dea2b4 <ux_invoke_7_step_val>:
c0dea2b4:	8eab c0de 01b0 da7a                         ......z.

c0dea2bc <ux_invoke_7_step>:
c0dea2bc:	4e33 c0de a2b4 c0de 0000 0000 0000 0000     3N..............

c0dea2cc <ux_invoke_8_step_val>:
c0dea2cc:	8cf0 c0de 01f3 da7a                         ......z.

c0dea2d4 <ux_invoke_8_step>:
c0dea2d4:	75ef c0de a2cc c0de 0000 0000 0000 0000     .u..............

c0dea2e4 <ux_invoke_9_step_val>:
c0dea2e4:	8bdf c0de 00d8 da7a                         ......z.

c0dea2ec <ux_invoke_9_step>:
c0dea2ec:	75ef c0de a2e4 c0de 0000 0000 0000 0000     .u..............

c0dea2fc <ux_invoke_10_step_val>:
c0dea2fc:	8c5e c0de 00b4 da7a                         ^.....z.

c0dea304 <ux_invoke_10_step>:
c0dea304:	75ef c0de a2fc c0de 0000 0000 0000 0000     .u..............

c0dea314 <ux_invoke_11_step_val>:
c0dea314:	8ba0 c0de 0375 da7a                         ....u.z.

c0dea31c <ux_invoke_11_step>:
c0dea31c:	75ef c0de a314 c0de 0000 0000 0000 0000     .u..............

c0dea32c <ux_invoke_12_step_validate_step>:
c0dea32c:	4e55 c0de 0000 0000 0000 0000 0000 0000     UN..............

c0dea33c <ux_invoke_12_step_validate>:
c0dea33c:	a32c c0de ffff ffff                         ,.......

c0dea344 <ux_invoke_12_step_val>:
c0dea344:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0dea350 <ux_invoke_12_step>:
c0dea350:	78e5 c0de a344 c0de a33c c0de 0000 0000     .x..D...<.......

c0dea360 <ux_invoke_13_step_validate_step>:
c0dea360:	4e5b c0de 0000 0000 0000 0000 0000 0000     [N..............

c0dea370 <ux_invoke_13_step_validate>:
c0dea370:	a360 c0de ffff ffff                         `.......

c0dea378 <ux_invoke_13_step_val>:
c0dea378:	85e8 c0de 8bd8 c0de                         ........

c0dea380 <ux_invoke_13_step>:
c0dea380:	77d7 c0de a378 c0de a370 c0de 0000 0000     .w..x...p.......

c0dea390 <ux_invoke_flow>:
c0dea390:	a22c c0de a244 c0de a25c c0de a274 c0de     ,...D...\...t...
c0dea3a0:	a28c c0de a2a4 c0de a2bc c0de a2d4 c0de     ................
c0dea3b0:	a2ec c0de a304 c0de a31c c0de a350 c0de     ............P...
c0dea3c0:	a380 c0de ffff ffff                         ........

c0dea3c8 <ux_order_1_step_val>:
c0dea3c8:	8648 c0de 8f61 c0de 015f da7a               H...a..._.z.

c0dea3d4 <ux_order_1_step>:
c0dea3d4:	7967 c0de a3c8 c0de 0000 0000 0000 0000     gy..............

c0dea3e4 <ux_order_2_step_val>:
c0dea3e4:	8c34 c0de 0183 da7a                         4.....z.

c0dea3ec <ux_order_2_step>:
c0dea3ec:	75ef c0de a3e4 c0de 0000 0000 0000 0000     .u..............

c0dea3fc <ux_order_3_step_val>:
c0dea3fc:	8dc2 c0de 0105 da7a                         ......z.

c0dea404 <ux_order_3_step>:
c0dea404:	75ef c0de a3fc c0de 0000 0000 0000 0000     .u..............

c0dea414 <ux_order_4_step_val>:
c0dea414:	8c5e c0de 00b4 da7a                         ^.....z.

c0dea41c <ux_order_4_step>:
c0dea41c:	75ef c0de a414 c0de 0000 0000 0000 0000     .u..............

c0dea42c <ux_order_5_step_val>:
c0dea42c:	8f1a c0de 0132 da7a                         ....2.z.

c0dea434 <ux_order_5_step>:
c0dea434:	75ef c0de a42c c0de 0000 0000 0000 0000     .u..,...........

c0dea444 <ux_order_6_step_val>:
c0dea444:	8d29 c0de 01f3 da7a                         ).....z.

c0dea44c <ux_order_6_step>:
c0dea44c:	75ef c0de a444 c0de 0000 0000 0000 0000     .u..D...........

c0dea45c <ux_order_7_step_val>:
c0dea45c:	8bdf c0de 00d8 da7a                         ......z.

c0dea464 <ux_order_7_step>:
c0dea464:	75ef c0de a45c c0de 0000 0000 0000 0000     .u..\...........

c0dea474 <ux_order_8_step_val>:
c0dea474:	8bfc c0de 0375 da7a                         ....u.z.

c0dea47c <ux_order_8_step>:
c0dea47c:	75ef c0de a474 c0de 0000 0000 0000 0000     .u..t...........

c0dea48c <ux_order_9_step_validate_step>:
c0dea48c:	4e61 c0de 0000 0000 0000 0000 0000 0000     aN..............

c0dea49c <ux_order_9_step_validate>:
c0dea49c:	a48c c0de ffff ffff                         ........

c0dea4a4 <ux_order_9_step_val>:
c0dea4a4:	8678 c0de 8c89 c0de 8baf c0de               x...........

c0dea4b0 <ux_order_9_step>:
c0dea4b0:	78e5 c0de a4a4 c0de a49c c0de 0000 0000     .x..............

c0dea4c0 <ux_order_10_step_validate_step>:
c0dea4c0:	4e67 c0de 0000 0000 0000 0000 0000 0000     gN..............

c0dea4d0 <ux_order_10_step_validate>:
c0dea4d0:	a4c0 c0de ffff ffff                         ........

c0dea4d8 <ux_order_10_step_val>:
c0dea4d8:	85e8 c0de 8bd8 c0de                         ........

c0dea4e0 <ux_order_10_step>:
c0dea4e0:	77d7 c0de a4d8 c0de a4d0 c0de 0000 0000     .w..............

c0dea4f0 <ux_order_flow>:
c0dea4f0:	a3d4 c0de a3ec c0de a404 c0de a41c c0de     ................
c0dea500:	a434 c0de a44c c0de a464 c0de a47c c0de     4...L...d...|...
c0dea510:	a4b0 c0de a4e0 c0de ffff ffff               ............

c0dea51c <ux_verify_transaction_1_step_val>:
c0dea51c:	8f61 c0de 0105 da7a                         a.....z.

c0dea524 <ux_verify_transaction_1_step>:
c0dea524:	75ef c0de a51c c0de 0000 0000 0000 0000     .u..............

c0dea534 <ux_verify_transaction_2_step_val>:
c0dea534:	0132 da7a 0375 da7a                         2.z.u.z.

c0dea53c <ux_verify_transaction_2_step>:
c0dea53c:	75ef c0de a534 c0de 0000 0000 0000 0000     .u..4...........

c0dea54c <ux_verify_transaction_3_step_val>:
c0dea54c:	8c5e c0de 00b4 da7a                         ^.....z.

c0dea554 <ux_verify_transaction_3_step>:
c0dea554:	75ef c0de a54c c0de 0000 0000 0000 0000     .u..L...........

c0dea564 <ux_verify_transaction_4_step_validate_step>:
c0dea564:	4e6d c0de 0000 0000 0000 0000 0000 0000     mN..............

c0dea574 <ux_verify_transaction_4_step_validate>:
c0dea574:	a564 c0de ffff ffff                         d.......

c0dea57c <ux_verify_transaction_4_step_val>:
c0dea57c:	8678 c0de 8c89 c0de 8d9a c0de               x...........

c0dea588 <ux_verify_transaction_4_step>:
c0dea588:	78e5 c0de a57c c0de a574 c0de 0000 0000     .x..|...t.......

c0dea598 <ux_verify_transaction_5_step_validate_step>:
c0dea598:	4e73 c0de 0000 0000 0000 0000 0000 0000     sN..............

c0dea5a8 <ux_verify_transaction_5_step_validate>:
c0dea5a8:	a598 c0de ffff ffff                         ........

c0dea5b0 <ux_verify_transaction_5_step_val>:
c0dea5b0:	85e8 c0de 8bd8 c0de                         ........

c0dea5b8 <ux_verify_transaction_5_step>:
c0dea5b8:	77d7 c0de a5b0 c0de a5a8 c0de 0000 0000     .w..............

c0dea5c8 <ux_verify_transaction_flow>:
c0dea5c8:	a524 c0de a53c c0de a554 c0de a588 c0de     $...<...T.......
c0dea5d8:	a5b8 c0de ffff ffff                         ........

c0dea5e0 <ux_processing_step_val>:
c0dea5e0:	85b8 c0de 8b73 c0de                         ....s...

c0dea5e8 <ux_processing_step>:
c0dea5e8:	77d7 c0de a5e0 c0de 0000 0000 0000 0000     .w..............

c0dea5f8 <ux_processing_flow>:
c0dea5f8:	a5e8 c0de ffff ffff 7254 6e61 6173 7463     ........Transact
c0dea608:	6f69 206e 6449 0000                         ion Id..

c0dea610 <g_pcHex>:
c0dea610:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef

c0dea620 <g_pcHex_cap>:
c0dea620:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF
c0dea630:	6163 636e 6c65 6c20 6165 6973 676e 0000     cancel leasing..

c0dea640 <.L.str.55>:
c0dea640:	7369 7573 0065 d400                         issue...

c0dea648 <.L.str.56>:
c0dea648:	7274 6e61 6673 7265 0000                    transfer..

c0dea652 <.L.str.58>:
c0dea652:	7562 6e72 0000                              burn..

c0dea658 <.L.str.59>:
c0dea658:	7473 7261 2074 656c 7361 6e69 0067 d400     start leasing...

c0dea668 <.L.str.61>:
c0dea668:	7254 6e61 6173 7463 6f69 206e 6148 6873     Transaction Hash
c0dea678:	0000 d4d4                                   ....

c0dea67c <.L.str.62>:
c0dea67c:	7263 6165 6974 676e 6120 206e 6c61 6169     creating an alia
c0dea68c:	0073 d400                                   s...

c0dea690 <.L.str.63>:
c0dea690:	616d 7373 7420 6172 736e 6566 0072           mass transfer..

c0dea69f <.L.str.64>:
c0dea69f:	6164 6174 0000 d4d4                          data.....

c0dea6a8 <.L.str.65>:
c0dea6a8:	6573 2074 6373 6972 7470 0000               set script..

c0dea6b4 <.L.str.66>:
c0dea6b4:	7073 6e6f 6f73 7372 6968 0070 d400 d4d4     sponsorship.....

c0dea6c4 <.L.str.67>:
c0dea6c4:	7361 6573 2074 6373 6972 7470 0000 d4d4     asset script....

c0dea6d4 <.L.str.68>:
c0dea6d4:	6373 6972 7470 6920 766e 636f 7461 6f69     script invocatio
c0dea6e4:	006e d400                                   n...

c0dea6e8 <.L.str.69>:
c0dea6e8:	7075 6164 6574 6120 7373 7465 6920 666e     update asset inf
c0dea6f8:	006f                                         o..

c0dea6fb <.L.str.70>:
c0dea6fb:	6148 6873 0000                              Hash..

c0dea701 <.L.str.71>:
c0dea701:	726f 6564 0072                               order..

c0dea708 <.L.str.74>:
c0dea708:	6f73 656d 6874 6e69 0067 d400               something...

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
c0dea906:	ff03 3fff 18c7 b9c3 e631 0f6f d4d4          ...?....1.o...

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
c0deadf0:	07c4 d43c                                   ..<.

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
c0deb100:	111f 3e22 9496 3248 07ff 4493 1a4a d4c3     ..">..H2...DJ...

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
c0deb58c:	d4d4      	bmi.n	c0deb538 <ux_layout_pbb_elements+0x6c>
c0deb58e:	d4d4      	bmi.n	c0deb53a <ux_layout_pbb_elements+0x6e>
c0deb590:	d4d4      	bmi.n	c0deb53c <ux_layout_pbb_elements+0x70>
c0deb592:	d4d4      	bmi.n	c0deb53e <ux_layout_pbb_elements+0x72>
c0deb594:	d4d4      	bmi.n	c0deb540 <ux_layout_pbb_elements+0x74>
c0deb596:	d4d4      	bmi.n	c0deb542 <ux_layout_pbb_elements+0x76>
c0deb598:	d4d4      	bmi.n	c0deb544 <ux_layout_pbb_elements+0x78>
c0deb59a:	d4d4      	bmi.n	c0deb546 <ux_layout_pbb_elements+0x7a>
c0deb59c:	d4d4      	bmi.n	c0deb548 <ux_layout_pbb_elements+0x7c>
c0deb59e:	d4d4      	bmi.n	c0deb54a <ux_layout_pbb_elements+0x7e>
c0deb5a0:	d4d4      	bmi.n	c0deb54c <ux_layout_pbb_elements+0x80>
c0deb5a2:	d4d4      	bmi.n	c0deb54e <ux_layout_pbb_elements+0x82>
c0deb5a4:	d4d4      	bmi.n	c0deb550 <ux_layout_pbb_elements+0x84>
c0deb5a6:	d4d4      	bmi.n	c0deb552 <ux_layout_pbb_elements+0x86>
c0deb5a8:	d4d4      	bmi.n	c0deb554 <ux_layout_pbb_elements+0x88>
c0deb5aa:	d4d4      	bmi.n	c0deb556 <ux_layout_pbb_elements+0x8a>
c0deb5ac:	d4d4      	bmi.n	c0deb558 <ux_layout_pbb_elements+0x8c>
c0deb5ae:	d4d4      	bmi.n	c0deb55a <ux_layout_pbb_elements+0x8e>
c0deb5b0:	d4d4      	bmi.n	c0deb55c <ux_layout_pbb_elements+0x90>
c0deb5b2:	d4d4      	bmi.n	c0deb55e <ux_layout_pbb_elements+0x92>
c0deb5b4:	d4d4      	bmi.n	c0deb560 <ux_layout_pbb_elements+0x94>
c0deb5b6:	d4d4      	bmi.n	c0deb562 <ux_layout_pbb_elements+0x96>
c0deb5b8:	d4d4      	bmi.n	c0deb564 <ux_layout_pbb_elements+0x98>
c0deb5ba:	d4d4      	bmi.n	c0deb566 <ux_layout_pbb_elements+0x9a>
c0deb5bc:	d4d4      	bmi.n	c0deb568 <ux_layout_pbb_elements+0x9c>
c0deb5be:	d4d4      	bmi.n	c0deb56a <ux_layout_pbb_elements+0x9e>
c0deb5c0:	d4d4      	bmi.n	c0deb56c <ux_layout_pbb_elements+0xa0>
c0deb5c2:	d4d4      	bmi.n	c0deb56e <ux_layout_pbb_elements+0xa2>
c0deb5c4:	d4d4      	bmi.n	c0deb570 <ux_layout_pbb_elements+0xa4>
c0deb5c6:	d4d4      	bmi.n	c0deb572 <ux_layout_pbb_elements+0xa6>
c0deb5c8:	d4d4      	bmi.n	c0deb574 <ux_layout_pbb_elements+0xa8>
c0deb5ca:	d4d4      	bmi.n	c0deb576 <ux_layout_pbb_elements+0xaa>
c0deb5cc:	d4d4      	bmi.n	c0deb578 <ux_layout_pbb_elements+0xac>
c0deb5ce:	d4d4      	bmi.n	c0deb57a <ux_layout_pbb_elements+0xae>
c0deb5d0:	d4d4      	bmi.n	c0deb57c <ux_layout_pbb_elements+0xb0>
c0deb5d2:	d4d4      	bmi.n	c0deb57e <ux_layout_pbb_elements+0xb2>
c0deb5d4:	d4d4      	bmi.n	c0deb580 <ux_layout_pbb_elements+0xb4>
c0deb5d6:	d4d4      	bmi.n	c0deb582 <ux_layout_pbb_elements+0xb6>
c0deb5d8:	d4d4      	bmi.n	c0deb584 <ux_layout_pbb_elements+0xb8>
c0deb5da:	d4d4      	bmi.n	c0deb586 <ux_layout_pbb_elements+0xba>
c0deb5dc:	d4d4      	bmi.n	c0deb588 <ux_layout_pbb_elements+0xbc>
c0deb5de:	d4d4      	bmi.n	c0deb58a <ux_layout_pbb_elements+0xbe>
c0deb5e0:	d4d4      	bmi.n	c0deb58c <_etext>
c0deb5e2:	d4d4      	bmi.n	c0deb58e <_etext+0x2>
c0deb5e4:	d4d4      	bmi.n	c0deb590 <_etext+0x4>
c0deb5e6:	d4d4      	bmi.n	c0deb592 <_etext+0x6>
c0deb5e8:	d4d4      	bmi.n	c0deb594 <_etext+0x8>
c0deb5ea:	d4d4      	bmi.n	c0deb596 <_etext+0xa>
c0deb5ec:	d4d4      	bmi.n	c0deb598 <_etext+0xc>
c0deb5ee:	d4d4      	bmi.n	c0deb59a <_etext+0xe>
c0deb5f0:	d4d4      	bmi.n	c0deb59c <_etext+0x10>
c0deb5f2:	d4d4      	bmi.n	c0deb59e <_etext+0x12>
c0deb5f4:	d4d4      	bmi.n	c0deb5a0 <_etext+0x14>
c0deb5f6:	d4d4      	bmi.n	c0deb5a2 <_etext+0x16>
c0deb5f8:	d4d4      	bmi.n	c0deb5a4 <_etext+0x18>
c0deb5fa:	d4d4      	bmi.n	c0deb5a6 <_etext+0x1a>
c0deb5fc:	d4d4      	bmi.n	c0deb5a8 <_etext+0x1c>
c0deb5fe:	d4d4      	bmi.n	c0deb5aa <_etext+0x1e>

c0deb600 <N_storage_real>:
c0deb600:	0000 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb610:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb620:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb630:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb640:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb650:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb660:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb670:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb680:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb690:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb6a0:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb6b0:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb6c0:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb6d0:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb6e0:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................
c0deb6f0:	d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4 d4d4     ................

c0deb700 <install_parameters>:
c0deb700:	0501 6157 6576 0273 3105 322e 322e 2103     ..Waves..1.2.2.!
c0deb710:	000e 000e 1900 0000 0000 000c 0378 1ff0     ............x...
c0deb720:	ffe0 ffc7 fe9f f03f 807f 01fc 03e0 0000     ......?.........
c0deb730:	0400 050a 8002 0000 802c 9b57                ........,.W..
