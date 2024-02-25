;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strpbrk
;;

SECTION .text
EXTERN strchr

strcspn:
  PUSH rdx
  PUSH rcx
  PUSH rsi

  MOV rdx, rdi ; save rdi
  MOV rdi, rsi ; move rsi to rdi to use strchr

  XOR rcx, rcx ; i

.loop:
  CMP BYTE [rdx + rcx], 0
  JE .end

  ; move arr[i] to rsi
  MOV sil, BYTE [rdx + rcx]
  CALL strchr wrt ..plt
  CMP rax, 0
  JNE .end

  INC rcx
  JMP .loop

.end:
  POP rsi
  MOV rax, rcx
  POP rcx

  MOV rdi, rdx
  POP rdx

  RET

GLOBAL strpbrk
strpbrk:
  CALL strcspn
  ADD rax, rdi
  CMP BYTE [rax], 0
  JNE .end
  MOV rax, 0
.end:
  RET
