@going from 
.data
fibnoacci :  .byte   1, 1, 0, 0, 0, 0, 0, 0, 0, 0
string: .ascii  "tOdAyIsAsUnNyDaY"

.text
.global main
main:
	LDR r0, =string @might vhange the register im using
	LDRB r1, [r0]
	MOV r2, #0 @this will be used for incrementing through the memory (0-15)

capt:	SUB r1, #32
	ADD r2, #1
	STRB r1, [r0]
	ADD r0, #2
	LDRB r1, [r0]
	CMP r2, #15
	BLT capt

	LDR r0, =fibnoacci
	LDRB r1, [r0]
	ADD r0, r0, #1
	LDRB r2, [r0]
	ADD r0, r0, #1
	MOV r3, #0

fibl:	ADD r1, r1, r2
	STRB r1, [r0]
	ADD r0, r0, #1
	ADD r2, r1, r2
	STRB r2, [r0]
	ADD r0, r0, #1
	ADD r3, #1
	CMP r3, #4
	BLT fibl


        @ exit syscall
        mov r7, #1
        swi 0 
