
extern printf

section .data:
    msg db 'a' ; ez itt miert nem db ?
    msg2 db 'b' ; ez itt miert nem db ?
    msg3 db 'c' ; ez itt miert nem db ?
    msg4 db 'd' ; ez itt miert nem db ?
    fmt db "Dec:%d Hx:%x Oct:%o Char:%c",0xA,0

global main
section .text:
   main:

   push ebp
   mov ebp, esp ; esp-> a stack tetejere mutat

    push word [msg]
    push dword [msg] ; dword -> double word (4 byte)
    push dword [msg]
    push dword [msg]
    push dword [msg]
    push dword fmt
    call printf


   mov esp, ebp
   pop ebp

   mov eax, 0 ; exit
   ret

