; nasm -felf64 little.asm
; ld little.o
; objdump -s -j .data a.out

section .data
pixels times 4  db 0FDh
x               dd 00010111001101100001010111010011b
blurb           db "ad", "b", "h", 0
buffer times 10 db 14o
min             dw -19


section .text
global _start
_start:
    mov rax, 60 ; sys_exit
    mov rdi, 0
    syscall
