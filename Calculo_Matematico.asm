SYS_WRITE equ  1 
SYS_READ  equ  0
SYS_EXIT  equ  60
STDIN     equ  0
STDOUT    equ  1

section .data

 primeiro_numero db "digite um número: ", 0
 len1 equ $-primeiro_numero

 segundo_numero db "digite outro valor: ", 0
 len2 equ $-segundo_numero

 resultado db "o resultado é: ", 0
 resul equ $-resultado
 
 numero_1 equ 2
 numero_2 equ 2
 valor_3 equ 1

section .bss

 valor_1 resb numero_1
 valor_2 resb numero_2
 resposta resb valor_3

section .text
 global _start

_start:
  
       mov rax, SYS_WRITE
       mov rdi, STDOUT
       mov rsi, primeiro_numero
       mov rdx, len1
       syscall

       mov rax, SYS_READ
       mov rdi, STDIN
       mov rsi, valor_1
       mov rdx, numero_1
       syscall

       mov rax, SYS_WRITE
       mov rdi, STDOUT
       mov rsi, segundo_numero
       mov rdx, len2
       syscall

       mov rax, SYS_READ
       mov rdi, STDIN
       mov rsi, valor_2
       mov rdx, numero_2
       syscall

       mov rax, [valor_1] 
       sub rax, '0'
       
       mov rdi, [valor_2]
       sub rdi, '0'
       
       add rax, rdi
       add rax, '0'
       mov [resposta], rax
       
       mov rax, SYS_WRITE
       mov rdi, STDOUT
       mov rsi, resultado
       mov rdx, resul
       syscall

       mov rax, SYS_WRITE
       mov rdi, STDOUT
       mov rsi, resposta
       mov rdx, valor_3
       syscall

       mov rax, SYS_EXIT
       mov rdi, 0
       syscall

 
