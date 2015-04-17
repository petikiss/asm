section .text
global _start

_start:
    ;mov eax, 4    ; print message
    ;mov ebx, 1
    ;mov ecx, msg
    ;mov edx, len
    ;int 0x80

    mov eax, op1
    mov ebx, op2
    add eax, ebx

    mov ecx, 'bbbb'

    mov eax, 4
    mov ebx, 1
    mov edx, 10
    int 0x80

    mov eax, 1 ; exit
    int 0x80

section .data
    op1 db 5
    op2 db 10

    var1 dw 10
    msg db  'Hello world',0xa
    len equ $-msg
