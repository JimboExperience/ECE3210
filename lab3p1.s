.data
NUM1:   .word   0x0000FFFF
NUM2:   .word   0x12345678
RES1:   .word   0x00000000
RES2:   .word   0x00000000

.text
.global main
main:
    LDR r0, =NUM1
    LDR r1, =NUM2
    LDR r5, =RES1
    LDR r9, =RES2
    LDR r2, [r0]
    LDR r11, [r1]
    LSL r10, r2, #16
    AND r3, r10, r11
    STR r3, [r5]

    LDR r7, [r0]
    MVN r7, r2
    AND r4, r7, r11
    STR r4, [r9]

        @ exit syscall
        mov r7, #1
        swi 0
