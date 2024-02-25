;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strrchr
;;

SECTION .text
EXTERN strlen
GLOBAL rindex
GLOBAL strrchr
index:
strrchr:
  CALL strlen wrt ..plt
  ADD rax, rdi
.start:
  ; if (*ptr == c)
  ; (sil is the register for the first byte of rsi)
  CMP BYTE [rax], sil
  JE .end

  ; while (ptr-- != str)
  CMP rax, rdi
  JE .notfound
  DEC rax

  JMP .start
.notfound:
  MOV rax, 0
.end:
  RET
