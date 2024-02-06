;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strlen
;;

SECTION .text
GLOBAL strlen
strlen:
  XOR rax, rax
.start:
  ; while *rdi != \0
  CMP BYTE [rdi + rax], 0
  JE .end

  ; incr count & ptr
  INC rax
  JMP .start
.end:
  RET
