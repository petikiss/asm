        global main

        section .bss
                num resb 5
        section .data
                msg db "Hello world"
                msgLen equ $-msg

        section .text

main:

ask_number:
        MOV eax, 3              ; sys_read
        MOV ebx, 2              ; stdin
        MOV ecx, num
        MOV edx, 5

        int 0x80

print_welcome:
        MOV eax, 4              ; sys_write
        MOV ebx, 1              ; stdout
        MOV ecx, msg
        MOV edx, msgLen

        int 0x80

print_number:
        MOV eax, 4
        MOV ebx, 1
        MOV ecx, num
        MOV edx, 5

        int 0x80
