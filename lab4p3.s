.macro INC_COUNT var
	LDR r2, =\var @load in what ever the address is in the variable you put in
	LDRB r3, [r2]
	ADD r3, r3, #1
	STRB r3, [r2]
.endm

.data
COUNT_OTHER:	.byte	0
COUNT_SPACE:	.byte	0
COUNT_CAP:	.byte	0
COUNT_SMALL:	.byte	0
COUNT_DIGIT:	.byte	0

INPUT:	.space	40
PROMPT:	.ascii	"Input String:"

.text
.global main

main:

	MOV r7, #4 @this block print out the prompt
	MOV r0, #1
	MOV r2, #13
	LDR r1, =PROMPT
	SWI 0

	MOV r7, #3 @give the input to store in memory
	MOV r0, #0
	MOV r2, #40
	LDR r1, =INPUT
	SWI 0

	MOV r7, #4 @print out the
	MOV r0, #1
	MOV r2, #40
	LDR r1, =INPUT
	SWI 0

	LDR r0, =INPUT
	LDRB r1, [r0]

mloop:	CMP r1, #0xa @use break when checking everything
	BEQ end @the input will always end with 0xa(new line)

	CMP r1, #0x41 @A
	BLT space
	CMP r1, #0x5A @ #90 is Z, but idk if i need to do one more
	BGT space
	INC_COUNT COUNT_CAP
	B inc @go to inc so the program doesnt accidentally loop back to mloop on its own

space:	CMP r1, #0x20 @space
	BNE lower
	INC_COUNT COUNT_SPACE
	B inc

lower:	CMP r1, #0x61 @a
	BLT digit
	CMP r1, #0x7A @z
	BGT digit
	INC_COUNT COUNT_SMALL
	B inc

digit:	CMP r1, #0x30 @change to hex please, dont know if there is a  difference between the actual number and its representation
	BLT other
	CMP r1, #0x39 @9
	BGT other
	INC_COUNT COUNT_DIGIT
	B inc

other:	INC_COUNT COUNT_OTHER
	B inc

inc:	ADD r0, r0, #1 @increment the address to get to the next thing in string
	LDRB r1, [r0] @get the value at that part
	B mloop


end:	@exit syscall
	MOV r7, #1
	SWI 0
@ask if i need to make a whole new section for the other thing
@or if i need to just rerun the program
