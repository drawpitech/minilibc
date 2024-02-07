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
  PUSH rdi
  PUSH rsi

  MOV rdx, rsi
  MOV rsi, rdi
  MOV rdi, rdx          ; also, it's the len
                        ; of the needle that
  CALL strlen wrt ..plt ; we need. so we need
                        ; to swap the arguments
  MOV rdx, rsi
  MOV rsi, rdi
  MOV rdi, rdx

  MOV rdx, rax ; n

.loop:
  CALL strncmp wrt ..plt
  CMP rax, 0
  JE .found

  CMP BYTE [rdi + rdx], 0
  JE .notfound

  INC rdi
  JMP .loop

.notfound:
  MOV rax, 0
  JMP .end
.found:
  MOV rax, rdi
.end:
  POP rsi
  POP rdi
  POP rdx
  RET
