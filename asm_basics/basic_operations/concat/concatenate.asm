global main

section .rodata
    message: db "Kerem a nevedet:"
    message_len: equ $ - message            ; equ = constant
    message2: db 10, "A nev amit megadtal:", 0 ; LF at the beginning
    message2_len: equ $ - message2

section .bss
    answer: resb 10
    answer_len: equ $ - answer
    result: resb 40
    result_len: equ $ - result

section .text
main:
    mov rbp, rsp; for correct debugging
    
    mov rax, 1  ; sys_write
    mov rdi, 1
    mov rsi, message
    mov rdx, message_len
    syscall
    
    mov rax, 0 ; sys_read
    mov rdi, 0
    mov rsi, answer
    mov rdx, answer_len 
    syscall
    
    ; copy message2 to "result"
    mov rsi, message2
    mov rdi, result
    xor rcx, rcx
    mov rcx, message2_len
    rep movsb
    
    ; concatenate "answer" to "result"
    mov rsi, answer
    mov rdi, result+25 ; lea rdi, [concat+25]
    xor rcx, rcx
    mov rcx, answer_len
    rep movsb
    
    mov rax, 1 ; sys_write
    mov rdi, 1
    mov rsi, result
    mov rdx, result_len
    syscall
    
    
    mov rax, 60 ; sys_exit 0
    mov rdi, 0
    syscall