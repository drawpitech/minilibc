;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strpbrk
;;

SECTION .text
EXTERN strcspn

GLOBAL strpbrk
strpbrk:
  CALL strcspn wrt ..plt
  ADD rax, rdi
  CMP BYTE [rax], 0
  JNE .end
  MOV rax, 0
.end:
  RET
