
    global _start

    section .text
_start:
    mov rax, 60 ; exit
    mov rdi, 2
    ;syscall