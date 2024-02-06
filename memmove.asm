;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; memmove
;;

SECTION .text
GLOBAL memmove
memmove:
  PUSH rcx
  MOV rcx, rdx
.start:
  ; store the values of rsi in the stack
  ; in reverse order
  CMP rcx, 0
  JE .loop
  DEC rcx
  MOV al, [rsi + rcx]
  PUSH rax
  JMP .start

.loop:
  ; while i != n
  CMP rcx, rdx
  JE .end

  ; get the value from the stack
  ; and copy it in rsi[rcx]
  POP rax
  MOV BYTE [rdi + rcx], al

  ; incr ptr rdi and rsi
  ; decr counter rdx
  INC rcx
  JMP .loop

.end:
  MOV rax, rdi
  POP rcx
  RET
