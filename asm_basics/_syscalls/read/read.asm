; Reading data from std input and write it to the std output
; Writing to std output: write = 0, std input = 0

    global _start

    section .bss  ; uninitialized data
    data resb 20
    len equ $ - data

    section .text
_start:
    mov rax, 0 ; sys_read
    mov rdi, 0 ; std input
    mov rsi, data
    mov rdx, len
    syscall

    mov rax, 1 ; sys_write
    mov rdi, 1 ; std out
    mov rsi, data
    mov rdx, len
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
