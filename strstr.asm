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
  ; call strlen to get nbr of executions
  ; we cannot do with just \0 because
  ; we need to use strncmp instead of strcmp
  PUSH rdx
  MOV rdx, rdi          ; also, it's the len
  MOV rdi, rsi          ; of the needle that
  CALL strlen wrt ..plt ; we need. so we need
  MOV rdi, rdx          ; to swap the arguments

  PUSH rdi ; save rdi because we will use it
  MOV rdx, rax ; n
  XOR rax, rax ; i

.loop:
  CMP rdx, 0
  JE .notfound

  CALL strncmp wrt ..plt
  CMP rax, 0
  JE .found

  INC rdi
  DEC rdx
  JMP .loop

.notfound:
  MOV rax, 0
  JMP .end
.found:
  MOV rax, rdi
.end:
  POP rdx
  POP rdi
  RET
