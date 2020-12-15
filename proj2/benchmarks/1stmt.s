gcc2_compiled.:
___gnu_compiled_c:
.text
	.align 4
	.proc	0110
_label_rtx:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ldub [%i0+12],%o0
	cmp %o0,40
	be,a L2
	ld [%i0+64],%o0
	call _abort,0
	nop
L2:
	cmp %o0,0
	bne,a L4
	ld [%i0+64],%i0
	call _gen_label_rtx,0
	nop
	st %o0,[%i0+64]
	mov %o0,%i0
L4:
	ret
	restore
	.align 4
	.global _emit_jump
	.proc	020
_emit_jump:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _do_pending_stack_adjust,0
	nop
	call _gen_jump,0
	mov %i0,%o0
	call _emit_jump_insn,0
	nop
	call _emit_barrier,0
	nop
	ret
	restore
	.align 4
	.global _expand_label
	.proc	020
_expand_label:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _do_pending_stack_adjust,0
	sethi %hi(_stack_block_stack),%l0
	call _label_rtx,0
	mov %i0,%o0
	call _emit_label,0
	nop
	ld [%l0+%lo(_stack_block_stack)],%o0
	cmp %o0,0
	be L7
	nop
	call _oballoc,0
	mov 8,%o0
	ld [%l0+%lo(_stack_block_stack)],%o2
	ld [%o2+36],%o1
	st %o1,[%o0]
	st %o0,[%o2+36]
	st %i0,[%o0+4]
L7:
	ret
	restore
	.align 4
	.global _expand_goto
	.proc	020
_expand_goto:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _label_rtx,0
	mov %i0,%o0
	mov %o0,%o1
	mov %i0,%o0
	call _expand_goto_internal,0
	mov 0,%o2
	ret
	restore
	.align 8
LC0:
	.ascii "jump to `%s' invalidly jumps into binding contour\0"
	.align 4
	.proc	020
_expand_goto_internal:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	mov %i2,%o2
	lduh [%i1],%o0
	cmp %o0,17
	be L10
	mov 0,%l0
	call _abort,0
	nop
L10:
	ld [%i1+8],%o0
	cmp %o0,0
	be L11
	sethi %hi(_block_stack),%o0
	ld [%o0+%lo(_block_stack)],%i2
	cmp %i2,0
	be L24
	cmp %l0,0
	ld [%i2+20],%o0
L26:
	ld [%o0+4],%o1
	ld [%i1+4],%o0
	cmp %o1,%o0
	bl L24
	cmp %l0,0
	ld [%i2+16],%o0
	cmp %o0,0
	bne,a L16
	mov %o0,%l0
L16:
	ld [%i2+28],%o0
	cmp %o0,0
	be,a L25
	ld [%i2+4],%i2
	call _expand_cleanups,0
	mov 0,%o1
	ld [%i2+4],%i2
L25:
	cmp %i2,0
	bne,a L26
	ld [%i2+20],%o0
	cmp %l0,0
L24:
	be L19
	sethi %hi(_stack_pointer_rtx),%o0
	ld [%o0+%lo(_stack_pointer_rtx)],%o0
	call _emit_move_insn,0
	mov %l0,%o1
L19:
	cmp %i0,0
	be L21
	sethi %hi(524288),%o0
	ld [%i0+12],%o1
	andcc %o1,%o0,%g0
	be L21
	sethi %hi(LC0),%o0
	ld [%i0+36],%o1
	or %o0,%lo(LC0),%o0
	call _error,0
	ld [%o1+20],%o1
	b,a L21
L11:
	mov %i0,%o0
	call _expand_fixup,0
	mov %i1,%o1
	cmp %o0,0
	bne L21
	cmp %i0,0
	be L21
	sethi %hi(16384),%o1
	ld [%i0+12],%o0
	or %o0,%o1,%o0
	st %o0,[%i0+12]
L21:
	call _emit_jump,0
	mov %i1,%o0
	ret
	restore
