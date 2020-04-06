; Writing 10 times "Hello" to the std output
; nasm -g -f elf64 while.asm
; gcc -g -m64 -fno-pie -no-pie while.o


global main

section .data
    numlens equ 10

    message db "Hello", 10
    msglen equ $-message

section .text
main:
    push rbp
    mov rbp, rsp

    mov dword [rbp-4], 0 ; this local variable used for loop counter initialized with 0
    xor rbx, rbx
    xor rdx, rdx

L1:
    cmp byte [rbp-4], numlens   ; checking stack variable with num
    jnl L2

    mov rax, 1  ; writing out the "Hello" message
    mov rdi, 1
    ;mov rsi, "OK" ; this is not good, because we should provide a memory address -> it will compile!
    mov rsi, message
    mov rdx, msglen
    syscall

    add dword [rbp-4], 1 ; increasing local variable with 1
    jmp L1

L2:
    mov rax, 60
    mov rdi, 0
    syscall
