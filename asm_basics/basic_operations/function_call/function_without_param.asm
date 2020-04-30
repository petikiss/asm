; call = push(RIP) + JMP
; ret = pop(RIP) + JMP

global main

section .data
    msg db "Hello", 10
    msglen equ $ - msg

section .text
main:

    push 2  ; second parameter of the function1
    push 1  ; first parameter of the function2
    call function1  ; call -> push the RIP to stack and JMP (RIP: contains the next instruction)
    mov rbx, rax    ; rax contains the return value -> save it

    mov rax, 1 ; write "Hello" to stdout
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen
    syscall

    mov rax, 60 ; sys_exit
    mov rdi, 0
    syscall


; int function(int param1, int param2)
function1: 
        push    rbp      ; save the current base (frame) pointer register
        mov     rbp, rsp ; <- HERE it is, where our locals starts

        sub     rsp, 0x40        ; 64 bytes of local stack space 
        mov     rbx, [rbp+8]     ; first parameter to function 

        ; some more code 

        mov rsp, rbp    ; leave <-> mov rsp,rbp / pop rbp
        pop rbp         ; restore the "old" ebp
        
        ret             ; pop the value from the stack (RIP pushed by call) and JMP
