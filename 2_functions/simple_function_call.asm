        global main

        section .data
        msg db "Hellp world"
        msgLen equ $-msg

        section .bss



        section .text

print_hello_world:
        MOV eax, 4
        MOV ebx, 2
        MOV ecx, msg
        MOV edx, msgLen
        int 0x80
        
        ret
main:
        call print_hello_world


        MOV eax, 1              ; sys_exit
        MOV ebx, 0              ; exit with 0
        int 0x80
