;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; memset
;;

SECTION .text
GLOBAL memset
memset:
  XOR rax, rax
.loop:
  ; decrement rdx 'till its 0
  CMP rdx, rax
  JE .end

  ; set byte at rdi to rsi,
  ; increment ptr, decrement rdx
  MOV BYTE [rdi + rax], sil
  INC rax
  JMP .loop
.end:
  MOV rax, rdi
  RET
