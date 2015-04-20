
extern printf

section .data:
    msg dd 0x41
    fmt db "number=%xh Char:%c",10,0

global main
section .text:
   main:


   push ebp
   mov ebp, esp

    push dword [msg]
    push dword [msg]
    push dword fmt
    call printf


   mov esp, ebp
   pop ebp

   mov eax, 0 ; exit
   ret

