; Write an assembly program that defines your full name 
; as a string in the data segment and counts
; the number of letter "a" in it


global _start

section .data
    name db "Andrew Tannenbaum"
    namelen equ $-name


section .text
_start:
    
    xor rsi, rsi
    mov rax, 1
    mov rdi, 1
    ;lea rsi, [name] ; -> lea rsi,ds:0x402000            -> rsi = 0x0000000000402000
    ;mov rsi, name   ; -> movabs rsi,0x402000            -> rsi = 0x0000000000402000
    ;mov rsi, [name] ; -> mov rsi,QWORD PTR ds:0x402000  -> rsi = 0x5420776572646e41 (filled with random after 0x402000)
    mov sil, [name] ; -> sil,BYTE PTR ds:0x402000       -> rsi = 0x0000000000000041
    mov rdx, 1
    syscall

    mov rax, 60 ; exit
    mov rdi, 0
    syscall
