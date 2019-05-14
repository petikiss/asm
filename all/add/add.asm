        section .bss
        num1 resb 10
        num2 resb 10

        section .text
        global main

main:
        MOV eax, 3              ; sys_read
        MOV ebx, 0              ; std::in
        MOV ecx, num1
        MOV edx, 1
        int 0x80
    
        MOV eax, 3              ; sys_read
        MOV ebx, 0
        MOV ecx, num2
        MOV edx, 1
        int 0x80
   
  
        MOV eax, 1              ; sys_exit
        MOV ebx, 0
        int 0x80


        
