;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strrchr
;;

SECTION .text
EXTERN strlen
GLOBAL strrchr
strrchr:
  CALL strlen wrt ..plt
  ADD rax, [rdi - 1]
.start:
  ; if rdi[rax] == rsi, return rdi
  ; (sil is the register for the first byte of rsi)
  CMP BYTE [rax], sil
  JE .end

  ; else if *rdi == 0, return NULL
  CMP rax, rdi
  JE .notfound

  ; else, increment ptr rdi and repeat
  DEC rax
  JMP .start
.notfound:
  MOV rax, 0
.end:
  RET
