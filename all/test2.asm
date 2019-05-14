
        section .data
                msg db "Hello world"
                msgLen equ msg-$
        section .bss


        section .test
        global main

main:
        MOV eax, 4
        MOV ebx, 1
        MOV ecx, msg
        MOV edx, msgLen
        int 0x80

        MOV eax,1
        MOV ebx,0
        int 0x80

