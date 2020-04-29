; printing out a local variable value to the standard output

; nasm -felf64 -g local.asm
; ld -g local.o
; gdb a.out, b _start, run, info frame, nexti, x/12xg $rsp


section .text
global _start
_start:
    push rbp
    mov rbp, rsp
    ; mov DWORD [rbp-4], 3 ; NOTE: 3 is decimal number, which is ENQ in ASCII, but it is non printable!!!! 
    mov DWORD [rbp-4], "3" ; "3" is printable. it is equal to 51 dec
    ; mov DWORD [rbp-4], 51 ; this will print out number 3



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