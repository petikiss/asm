        global main

        section .data:
        msg db 'we are learning assembly$'
        msgLen equ $-msg        ; equ -> defines a constant
                                ; $->    here memory address

        section .text
main:
        MOV eax, 4              ; sys_write syscall
        MOV ebx, 1              ; stdout
        MOV ecx, msg
        MOV edx, msgLen             ; sizeof msg
        int 0x80



