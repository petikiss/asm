global main

section .rodata
    message db "Kerek egy szamot:"
    msg_len equ $ - message
    result db "A szam nagyomm mint egyenlo mint 10"
    reslen equ $ - result
    
section .bss
    number resb 2
    numlen equ $ - number

section .text
main:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, msg_len
    syscall
    
    mov rax, 0
    mov rdi, 0
    mov rsi, number
    mov rdx, numlen
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, number
    mov rdx, numlen
    syscall
    
    xor rbx, rbx
    mov bl, [number]
    cmp bl, 10
    jnl L1
    mov rax, 0
    mov rdi, 0
    mov rsi, result
    mov rdx, reslen
    syscall

L1:

    xor rax, rax
    ret
