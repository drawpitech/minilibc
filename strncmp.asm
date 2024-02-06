;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strncmp
;;

SECTION .text
GLOBAL strncmp
strncmp:
  XOR rax, rax

  PUSH rcx
  XOR rcx, rcx
.loop:
  CMP rdx, rcx
  JE .end
  ; load difference between rdi[rcx] and
  ; rsi[rcx] in rax.
  MOV al, BYTE [rdi + rcx]
  SUB al, BYTE [rsi + rcx]

  ; if the characters differs,
  ; or if the char is \0 on both,
  ; return the difference
  CMP al, 0
  JNE .end
  CMP BYTE [rdi + rcx], 0
  JE .end

  ; increment pointers and loop
  INC rcx
  JMP .loop
.end:
  POP rcx
  RET
