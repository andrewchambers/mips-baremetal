#if defined(__ppc64__)
#define MODE_CHOICE(x, y) y
#else
#define MODE_CHOICE(x, y) x
#endif

#define machine_choice	MODE_CHOICE(ppc7400,ppc64)

; Define some pseudo-opcodes for size-independent load & store of GPRs ...
#define lgu		MODE_CHOICE(lwzu, ldu)
#define lg		MODE_CHOICE(lwz,ld)
#define sg		MODE_CHOICE(stw,std)
#define sgu		MODE_CHOICE(stwu,stdu)

; ... and the size of GPRs and their storage indicator.
#define GPR_BYTES	MODE_CHOICE(4,8)
#define LOG2_GPR_BYTES	MODE_CHOICE(2,3)	/* log2(GPR_BYTES) */
#define g_long		MODE_CHOICE(long, quad)	/* usage is ".g_long" */

; From the ABI doc: "Mac OS X ABI Function Call Guide" Version 2009-02-04.
#define LINKAGE_SIZE	MODE_CHOICE(24,48)
#define PARAM_AREA	MODE_CHOICE(32,64)
#define SAVED_LR_OFFSET	MODE_CHOICE(8,16)	/* save position for lr */

; The whole stack frame **MUST** be 16byte-aligned.
#define SAVE_SIZE (LINKAGE_SIZE+PARAM_AREA)

#if defined(__ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__) && __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ >= 1050
; We no longer need the pic symbol stub for Darwin >= 9.
#define BLGCP1	_GC_push_one
#undef WANT_STUB
#else
#define BLGCP1	L_GC_push_one$stub
#define WANT_STUB
#endif

	.machine machine_choice

; GC_push_regs function. Under some optimization levels GCC will clobber
; some of the non-volatile registers before we get a chance to save them
; therefore, this cannot be inline asm.

.text
	.align LOG2_GPR_BYTES
	.globl _GC_push_regs
_GC_push_regs:
    
    ; Prolog
	mflr r0
	sg r0,SAVED_LR_OFFSET(r1)
	sgu r1,-SAVE_SIZE(r1)

L_body:
    ; 'Push' r13-r31
	mr r3,r13
	bl BLGCP1
	mr r3,r14
	bl BLGCP1
	mr r3,r15
	bl BLGCP1
	mr r3,r16
	bl BLGCP1
	mr r3,r17
	bl BLGCP1
	mr r3,r18
	bl BLGCP1
	mr r3,r19
	bl BLGCP1
	mr r3,r20
	bl BLGCP1
	mr r3,r21
	bl BLGCP1
	mr r3,r22
	bl BLGCP1
	mr r3,r23
	bl BLGCP1
	mr r3,r24
	bl BLGCP1
	mr r3,r25
	bl BLGCP1
	mr r3,r26
	bl BLGCP1
	mr r3,r27
	bl BLGCP1
	mr r3,r28
	bl BLGCP1
	mr r3,r29
	bl BLGCP1
	mr r3,r30
	bl BLGCP1
	mr r3,r31
	bl BLGCP1

L_epilog:
    ; Epilog
	lg r0,SAVE_SIZE+SAVED_LR_OFFSET(r1)
	addi r1,r1,SAVE_SIZE
	mtlr r0
    	
    ; Return
	blr
LFE0:

; eh frames, for those that want 'em.

#define EH_DATA_ALIGN_FACT MODE_CHOICE(0x7c,0x78)
#define EH_FRAME_OFFSET MODE_CHOICE(0x40,0x70)

	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0	; Length of Common Information Entry
LSCIE1:
	.long	0	; CIE Identifier Tag
	.byte	0x1	; CIE Version
	.ascii "zR\0"	; CIE Augmentation
	.byte	0x1	; uleb128 0x1; CIE Code Alignment Factor
	.byte	EH_DATA_ALIGN_FACT	; sleb128 -4/-8; CIE Data Alignment Factor
	.byte	0x41	; CIE RA Column
	.byte	0x1	; uleb128 0x1; Augmentation size
	.byte	0x10	; FDE Encoding (pcrel)
	.byte	0xc	; DW_CFA_def_cfa
	.byte	0x1	; uleb128 0x1
	.byte	0	; uleb128 0
	.align	LOG2_GPR_BYTES
LECIE1:

	.globl _GC_push_regs.eh
_GC_push_regs.eh:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1	; FDE Length
LASFDE1:
	.long	LASFDE1-EH_frame1	; FDE CIE offset
	.g_long	_GC_push_regs-.	; FDE initial location
	.set L$set$2,LFE0-_GC_push_regs
	.g_long L$set$2	; FDE address range
	.byte	0	; uleb128 0; Augmentation size
	.byte	0x4	; DW_CFA_advance_loc4
	.set L$set$3,L_body-_GC_push_regs
	.long L$set$3
	.byte	0xe	; DW_CFA_def_cfa_offset
	.byte	EH_FRAME_OFFSET	; uleb128 0x40/0x70
	.byte	0x11	; DW_CFA_offset_extended_sf
	.byte	0x41	; uleb128 0x41
	.byte	0x7e	; sleb128 -2
	.byte	0x4	; DW_CFA_advance_loc4
	.set L$set$4,L_epilog-L_body
	.long L$set$4
	.byte	0xe	; DW_CFA_def_cfa_offset
	.byte	0	; uleb128 0
	.align	LOG2_GPR_BYTES
LEFDE1:

	.data
#ifdef WANT_STUB
; PIC stub stuff, generated by GCC

	.section __TEXT,__picsymbolstub1,symbol_stubs,pure_instructions,32
	.align LOG2_GPR_BYTES
L_GC_push_one$stub:
	.indirect_symbol _GC_push_one
	mflr r0
	bcl 20,31,L0$_GC_push_one
L0$_GC_push_one:
	mflr r11
	addis r11,r11,ha16(L_GC_push_one$lazy_ptr-L0$_GC_push_one)
	mtlr r0
	lgu r12,lo16(L_GC_push_one$lazy_ptr-L0$_GC_push_one)(r11)
	mtctr r12
	bctr

	.data
	.lazy_symbol_pointer
L_GC_push_one$lazy_ptr:
	.indirect_symbol _GC_push_one
	.g_long dyld_stub_binding_helper
#endif
