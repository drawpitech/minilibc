;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; memcpy
;;

SECTION .text
GLOBAL memcpy
memcpy:
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
