.data
array:  .byte -1, 5, 3, 8, 10, 23, 6, 5, 2, -10
size:   .byte 10

.text
.global main

main:
	LDR r6, =array
        LDR r7, =array	   @this is the address of array just for storing into r2
	LDRSB r1, [r6] 	   @this will be max value (currently -1)
	MOV r3, #1 	   @counter
	LDR r4, =size
	LDRB r4, [r4] 	   @goes up to 10

mloop:	LDRSB r5, [r6, r3] @I should put the index style thing here, yell at Andrew about it
	CMP r3, r4 	   @checks if the counter is at 10
	BEQ end		   @stops all after it reaches 10
	CMP r1, r5
	BLT switch
	ADD r3, r3, #1	   @plus 1 to counter
        ADD r7, r7, #1	   @plus 1 to fake address
	B mloop

switch:	MOVS r1, r5	   @update max value
	ADD r7, r7, #1
	MOV r2, r7	   @update max address
	ADD r3, r3, #1
	B mloop

end:    @ exit syscall
        mov r7, #1
        swi 0

@r1 should the value of 23(max val)
@r2 should be the address 23(max addr)
