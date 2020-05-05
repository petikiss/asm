; Description:
; Ask a string from std input, and count the occurrence of the alphabetic letters
; std input contains only alpabethic letters from a-z
; x86_64 nasm (nasm -felf64 -g counter.asm, ld -g counter.o)



section .data
    name db "abbad"
    namelen equ $-name
    name_counter times 1000 db 0


section .text
global _start
_start:
    push rbp
    mov rbp, rsp
    mov BYTE [rbp-4], 0

    xor rdi, rdi
    mov rbx, 0      ; loop counter initialized with 0
loop:

    mov al, [name+rbx]  ; move 1 byte character to rax (al)

    add BYTE [name_counter+rax], 1

    add rbx, 1                  ; increasing loop counter
    cmp rbx, namelen     ; go throw until end on name
    jl loop


    ; print out the result
    mov rbx, 0          ; print out loop counter
next:
    mov rax, 1          ; sys_write
    mov rdi, 1          ; std out
    mov rdx, 1          ; 1 byte

    mov [rbp-4], rbx             ; print out the alphabet
    add BYTE [rbp-4], 97         ; printable ascii conversion
    lea rsi, [rbp-4]
    syscall

    lea rsi, [name_counter+rbx+97]  ; print out the counted number
    add BYTE [rsi], 48
    syscall 

    add rbx, 1
    cmp rbx, namelen
    jl next


    mov rax, 60
    syscall
