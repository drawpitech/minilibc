;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strncmp
;;

section .text
global strncmp
strncmp:
  xor rax, rax
.loop:
  cmp rdx, 0
  je .end
  ; load difference between *rdi and *rsi in rax
  mov al, byte [rdi]
  sub al, byte [rsi]
  movzx rax, al

  ; if the characters differs, return the difference
  cmp al, 0
  jne .end

  ; increment pointers and loop
  inc rdi
  inc rsi
  dec rdx
  jmp .loop
.end:
  ret
