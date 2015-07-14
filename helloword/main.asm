; Hello world

; function call
; string write out
; number write



section .data
    msg db "Hello world!",0xa
    size equ $-msg
    number db 10

global main

section .text

main:
;    push ebp
;    mov ebp,esp

    call write_hello

;    mov esp, ebp
;    pop ebp

    call write_number

    mov eax, 1
    mov ebx, 0
    int 0x80


write_hello:
    mov eax, 4     ; write syscall
    mov ebx, 1
    mov ecx, msg
    mov edx, size
    int 0x80
    ret

write_number:
    mov eax, 4     ; write syscall
    mov ebx, 1


    mov ecx, [number]
    add ecx, 38

    mov edx, 1
    int 0x80
    ret

