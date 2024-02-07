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
  ADD rax, rdi
.start:
  ; while (ptr-- != str)
  CMP rax, rdi
  JE .notfound
  DEC rax

  ; if (*ptr == c)
  ; (sil is the register for the first byte of rsi)
  CMP BYTE [rax], sil
  JE .end

  JMP .start
.notfound:
  MOV rax, 0
.end:
  RET
