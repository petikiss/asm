                                ; Printing Add two number from std input

        section .data
        msg1 db "Please add the first number:"
        msg1Len equ $-msg1
        msg2 db "Please add the secont number:"
        msg2Len equ $-msg2

        section .bss
        num1 resb 1
        num2 resb 1

        section .text

        global main

main:
        MOV eax, 4              ; sys_write
        MOV ebx, 1              ; std::out
        MOV ecx, msg1
        MOV edx, msg1Len
        int 0x80

        MOV eax, 3              ; sys_read
        MOV ebx, 0              ; std::in
        MOV ecx, num1
        MOV edx, 1
        int 0x80

        MOV eax, 4              ; sys_write
        MOV ebx, 1
        MOV ecx, msg2
        MOV edx, msg2Len
        int 0x80

        MOV eax, 3              ; sys_read
        MOV ebx, 0
        MOV ecx, num2
        MOV edx, 1
        int 0x80

        MOV eax, 1              ; sys_exit
        MOV ebx, 0
        int 0x80

