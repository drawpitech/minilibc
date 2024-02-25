;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strchr
;;

SECTION .text
GLOBAL index
GLOBAL strchr
index:
strchr:
  MOV rax, rdi
.start:
  ; if rdi[rax] == rsi, return rdi
  ; (sil is the register for the first byte of rsi)
  CMP BYTE [rax], sil
  JE .end

  ; else if *rdi == 0, return NULL
  CMP BYTE [rax], 0
  JE .notfound

  ; else, increment ptr rdi and repeat
  INC rax
  JMP .start
.notfound:
  MOV rax, 0
.end:
  RET
