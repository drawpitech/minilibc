;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strstr
;;

SECTION .text
EXTERN strncmp
EXTERN strlen
GLOBAL strstr
strstr:
  PUSH rsi
  CALL strlen wrt ..plt
  POP rsi

  MOV rdx, rax
.loop:
  CMP rdx, 0
  JE .notfound

  PUSH rsi
  PUSH rdi
  CALL strncmp wrt ..plt
  CMP rax, 0
  JE .found
  POP rdi
  POP rsi

  INC rdi
  DEC rdx
  JMP .loop

.notfound:
  MOV rax, 0
  RET
.found:
  MOV rax, rdi
  RET
