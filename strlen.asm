;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strlen
;;

section .text
global strlen
strlen:
  xor rax, rax
.start:
  ; while *rdi != \0
  cmp byte [rdi], 0
  je .end

  ; incr count & ptr
  inc rdi
  inc rax
  jmp .start
.end:
  ret
