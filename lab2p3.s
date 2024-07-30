.data
string: .ascii  "My name is **!\n"


.text
.global main

main:
    ldr r0, =string

    ldr r1, =65

    ldr r2, =68

    strb r1, [r0, #11]

    mov r3, #12

    strb r2, [r0, r3]

    @ exit syscall
    mov r7, #1
    swi 0
    
    @1. Declare a ascii variable string with “My name is **!\n”.
    @2. Load the address of string into r0.
    @3. Assign the ASCII value of your name initials to registers r1, r2. For example, r1=’A’,r2=’B’ for Antonio Brown.
    @4. Use Immediate offset addressing mode to replace the first ‘*’ with value stored in r1.
    @5. Count the offset of the second ‘*’ and assign it to r3.
    @6. Use Register offset addressing mode to replace the second ‘*” with value stored in r2. (A=65'DEC' and D=68'DEC')
