; Function call example with return value (no parameter provided)

; This program return 1 to the operation system
; check the result with "echo $?" in shell


function:
    mov rax, 1
    ret


section .text
global _start
_start:    
    call function

    mov rdi, rax    ; copy function return value
    mov rax, 60
    syscall
