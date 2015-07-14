; unistd_32.h


extern printf

section .text
global main

main:
    push ebp
    mov ebp, esp

    push dword [op1]
    push dword fmt
    call printf

    mov esp, ebp
    pop ebp

    mov eax, 0   ; exit
    int 0x80

section .data
    op1: dd 5
    op2: db 10

    var1: dw 10
    msg: db  'Hello world',0xa
    len: equ $-msg
    fmt: db "a=%d, eax=%d",10,0
