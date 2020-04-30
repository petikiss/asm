; Function example with parameter passing

; Add two integer value together
; nasm -felf64 -g function_with_parameters.asm
; ld function_with_parameters.o
; a.out
; echo $? -> 12

function: ; sum function
    push rbp
    mov rbp, rsp

    mov DWORD [rbp-4], edi    ; first parameter (4 byte)
    mov DWORD [rbp-8], esi    ; second parameter (4 byte)

    mov rax, [rbp-4]          ; rax is the "return valu"
    add rax, [rbp-8]

    pop rbp
    ret

section .text
global _start:
_start:

    mov rdi, 5
    mov rsi, 7
    call function

    mov rdi, rax
    mov rax, 60
    syscall