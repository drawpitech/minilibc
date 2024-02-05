;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strcmp
;;

section .text
global strcmp
strcmp:
  xor rax, rax
.loop:
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
  jmp .loop
.end:
  ret
