.data
string: .ascii  "tOdAyIsAsUnNyDaY"

.text
.global main
main:
        @ Your Program
	LDR r0, =string

	MOV r1, #0x54
	STRB r1, [r0, #0]!

	MOV r2, #0x44
	STRB r2, [r0, #2]! @using the immediate pre-indexed addressing mode

	MOV r3,	#0x59
	STRB r3, [r0, #2]!

	MOV r4, #0x53
	STRB r4, [r0, #2]!

	MOV r5, #0x53
	STRB r5, [r0, #2]!

	MOV r6, #0x4E
	STRB r6, [r0, #2]!

	MOV r7, #0x59
	STRB r7, [r0, #2]!

	MOV r8, #0x41
	STRB r8, [r0, #2]!


        @ exit syscall
        mov r9, #1
        swi 0
