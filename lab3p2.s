.data
array:  .byte   0, 2, 4, 6, 8, -1, -3, -5, -7

.text
.global main
main:
    LDR r0, =array
    LDRB r1, [r0]

    ADD r0, r0, #1  @incriment using register immediate adressing mode for incimenting memory and for loading content of variable
    LDRB r2, [r0]

    ADD r0, r0, #1
    LDRB r3, [r0]

    ADD r0, r0, #1
    LDRB r4, [r0]

    ADD r0, r0, #1
    LDRB r5, [r0]

    ADD r0, r0, #1
    LDRB r6, [r0]

    ADD r0, r0, #1
    LDRB r7, [r0]

    ADD r0, r0, #1
    LDRB r8, [r0]

    ADD r0, r0, #1
    LDRB r9, [r0]

    ADD r10, r1, r2
    ADD r10, r10, r3
    ADD r10, r10, r4
    ADD r10, r10, r5
    ADD r10, r10, r6
    ADD r10, r10, r7
    ADD r10, r10, r8
    ADD r10, r10, r9

    LDR r0, =array
    LDRSB r1, [r0, #0]  @using the immediate offset addressing mode
    LDRSB r2, [r0, #1]
    LDRSB r3, [r0, #2]
    LDRSB r4, [r0, #3]
    LDRSB r5, [r0, #4]
    LDRSB r6, [r0, #5]
    LDRSB r7, [r0, #6]
    LDRSB r8, [r0, #7]
    LDRSB r9, [r0, #8]

    ADDS r11, r1, r2
    ADDS r11, r11, r3
    ADDS r11, r11, r4
    ADDS r11, r11, r5
    ADDS r11, r11, r6
    ADDS r11, r11, r7
    ADDS r11, r11, r8
    ADDS r11, r11, r9

        @ exit syscall
        mov r7, #1
        swi 0
