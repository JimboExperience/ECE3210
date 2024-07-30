.data
fibnoacci :  .byte   1, 1, 0, 0, 0, 0, 0, 0, 0, 0

.text
.global main
main:

	LDR r0, =fibnoacci
	MOV r2, #1

	LDRB r1, [r0], r2
	LDRB r2, [r0], r2 @using register post-indexed addressing mode for loading content of variable

	ADD r3, r1, r2
	STRB r3, [r0], #1 @using immidiate post-indexed addressing mode for storing

	ADD r4, r2, r3
	STRB r4, [r0], #1

	ADD r5, r3, r4
	STRB r5, [r0], #1

	ADD r6, r5, r4
	STRB r6, [r0], #1

	ADD r7, r6, r5
	STRB r7, [r0], #1

	ADD r8, r7, r6
	STRB r8, [r0], #1

	ADD r9, r8, r7
	STRB r9, [r0], #1

	ADD r10, r9, r8
	STRB r10, [r0], #1

        @ exit syscall
        mov r11, #1
        swi 0


	@loading: register post index is [Rn], +Rm
	@storing: immidieate post indexing is [Rn], #+<offset>
