	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0"
	.file	"riscv_test.c"
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	sw	zero, 20(sp)
	sw	zero, 16(sp)
	addi	a0, zero, 1
	sw	a0, 12(sp)
	addi	a0, zero, 10
	lw	a1, 12(sp)
	blt	a0, a1, .LBB0_2
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a1, 12(sp)
	lw	a2, 16(sp)
	add	a1, a2, a1
	sw	a1, 16(sp)
	lw	a1, 12(sp)
	addi	a1, a1, 1
	sw	a1, 12(sp)
	lw	a1, 12(sp)
	bge	a0, a1, .LBB0_1
.LBB0_2:                                # %for.end
	lw	a1, 16(sp)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	printf
	lw	a0, 20(sp)
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"total = %d\n"
	.size	.L.str, 12

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
