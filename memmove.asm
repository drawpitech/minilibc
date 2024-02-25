;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; memmove
;;

SECTION .text
r_memcpy:
  PUSH rdx
.loop:
  ; while *src == '\0'
  CMP rdx, 0
  JE .end
  DEC rdx

  ; copy rdi[rdx] in byte sized register
  ; and copy it in rsi[rdx]
  MOV al, [rsi + rdx]
  MOV BYTE [rdi + rdx], al
  JMP .loop
.end:
  POP rdx
  MOV rax, rdi
  RET

l_memcpy:
  PUSH rcx
  XOR rcx, rcx
.loop:
  ; while *src == '\0'
  CMP rdx, rcx
  JE .end

  ; copy rdi[rdx] in byte sized register
  ; and copy it in rsi[rdx]
  MOV al, [rsi + rcx]
  MOV BYTE [rdi + rcx], al
  INC rcx
  JMP .loop
.end:
  POP rcx
  MOV rax, rdi
  RET

GLOBAL memmove
memmove:
  CMP rdi, rsi
  JL .left
  JMP .right

.left:
  CALL l_memcpy
  JMP .end
.right:
  CALL r_memcpy
.end:
  RET
