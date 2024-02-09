;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strcmp
;;

SECTION .text
GLOBAL strcmp
strcmp:
  XOR rax, rax

  PUSH rcx
  XOR rcx, rcx
.loop:
  ; load difference between rdi[rcx] and
  ; rsi[rcx] in rax.
  MOV al, BYTE [rdi + rcx]
  SUB al, BYTE [rsi + rcx]
  MOVSX rax, al ; sign extend al to rax

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
