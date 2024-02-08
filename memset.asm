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
  ; increment rax till it reaches rdx
  CMP rdx, rax
  JE .end

  ; set byte at rdi[rax] to rsi,
  ; increment index (rax)
  MOV BYTE [rdi + rax], sil
  INC rax
  JMP .loop
.end:
  MOV rax, rdi
  RET
