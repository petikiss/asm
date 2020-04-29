; printing out a local variable value to the standard output



section .text
global _start
_start:
    push rbp        
    mov rbp, rsp
    mov DWORD [rbp-4], 5




    ; printing out the result
    mov rax, 1
    mov rdi, 1
    lea rsi, [rbp-4]
    mov rdx, 4
    syscall

    pop rbp

    mov rax, 60 ; exit
    mov rdi, 0
    syscall
