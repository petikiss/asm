; Write an assembly program that defines your full name 
; as a string in the data segment and counts the number of letter "a" in it

; nasm -felf64 -g while.asm
; ld -g while.o

section .data
    name db "Andrew Tannenbaum"
    namelen equ $-name


section .text
global _start
_start:
    push rbp
    mov rbp, rsp

    mov DWORD [rbp-4], 0      ; local variable for counting the number of "a" characters
    mov rbx, 0                ; loop counter, initialized with 0

    loop:
    cmp BYTE [name+rbx], "a"      ; comparing name characters with "a"
    ; cmp DWORD [name+rbx], "a"      ; NOTE: we are comparing a byte with a byte! (char with char!)
    jne next            ; if it is not equal, jump, else increasing local variable
    add DWORD [rbp-4], 1
    next:

    add rbx, 1          ; increasing loop counter
    cmp rbx, namelen    ; check end of the string
    jl loop             ; go to beginning of the loop if we are not end of the string


    add DWORD [rbp-4], 48     ; dec to ascii

    mov rax, 1
    mov rdi, 1
    lea rsi, [rbp-4]
    mov rdx, 4
    syscall

    pop rbp
    mov rax, 60 ; exit
    mov rdi, 0
    syscall