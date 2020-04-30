; Function tutorial
; - function call
; - no return value
; - no parameters

; Descrioption: 
; Create a function which write out "Hello function" to std output


function:
    mov rax, 1      ; sys_write
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen
    syscall
    ret

section .data
    msg db "Hello function", 10 ; dec 10 is for end line
    msglen equ $ - msg


section .text
global _start
_start:
    push rbp        ; saving rbp
    mov rbp, rsp    ; moving the rpb to beginning of the stack (esp)
    
    call function   ; push RIP to stack and JMP to function label

    mov eax, 0
    pop rbp
    
    mov rax, 60     ; sys_exit
    mov rdi, 0
    syscall
