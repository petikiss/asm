; unistd_32.h


extern printf

section .text
global main

main:
    ;mov eax, 4    ; print message
    ;mov ebx, 1
    ;mov ecx, msg
    ;mov edx, len
    ;int 0x80

    push ebp
    mov ebp, esp

;    mov eax, op1
;    mov ebx, op2
;    add eax, ebx
;    mov eax, [sum]

;    mov ecx, [op1]

;    mov eax, op1
    push dword [op1]
    push dword fmt
    call printf

;    mov eax, 4   ; write
;    mov ebx, 1
;    mov edx, 4
;    int 0x80

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
