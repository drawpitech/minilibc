;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strcspn
;;

SECTION .text
EXTERN strchr

GLOBAL strcspn
strcspn:
  ; save rdi
  PUSH rdx
  MOV rdx, rdi
  ; move rsi to rdi to use strchr
  MOV rdi, rsi

  PUSH rcx
  XOR rcx, rcx ; i

.loop:
  CMP BYTE [rdx + rcx], 0
  JE .end

  ; move arr[i] to rsi
  MOV sil, BYTE [rdx + rcx]
  CALL strchr wrt ..plt
  CMP rax, 0
  JNE .end

  INC rax
  JMP .loop

.end:
  MOV rax, rcx
  POP rcx

  MOV rdi, rdx
  POP rdx

  RET
