;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; memmove
;;

section .text
global memmove
memmove:
  mov rax, rsi
  mov rbx, rdx

.start:
  ; store the value of rsi in the stack
  ; in reverse order
  cmp rbx, 0
  je .loop
  dec rbx
  mov cl, [rsi + rbx]
  push rcx
  jmp .start

.loop:
  ; while *src == '\0'
  cmp rdx, 0
  je .end

  ; get the value from the stack
  ; and copy it in *rsi
  pop rbx
  mov byte [rdi], bl

  ; incr ptr rdi and rsi
  ; decr counter rdx
  inc rdi
  inc rsi
  dec rdx
  jmp .loop
.end:
  ret
