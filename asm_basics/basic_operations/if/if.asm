; write a message to stdout if a number is not less than
; an other number

; nasm -g -f elf64 if.asm
; gcc -g -m64 -fno-pie -no-pie if.o
; ./a.out
; gdb a.out, break main, run, nexti

global main

section .data
    message db "The number is greater than X", 10 ; 10 is LF (=0xa); if we want to print 10, use "10"
    msglen equ $ - message

section .rodata
    number dw 1024  ; dec 1024 dw is must because for dec 1024 one byte is not enough!

section .text
main:
   xor rbx, rbx
   mov bx, 1023 ; input dec 1025 -> change this to 1023
   mov cx, [number]
   cmp bx, cx ; if 1025 < 1024
   jnl L1   ; jump if rxb not less then [number]
   
   mov rax, 1
   mov rdi, 1
   mov rsi, message
   mov rdx, msglen
   syscall

L1:
    
    xor rax, rax
    ret