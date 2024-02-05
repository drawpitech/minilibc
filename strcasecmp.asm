;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strcasecmp
;;

SECTION .text
GLOBAL strcasecmp
strcasecmp:
  XOR rax, rax

.loop:
  ; compare *rdi and *rsi
  MOV al, BYTE [rdi]
  MOV bl, BYTE [rsi]
  CMP al, bl
  JE .inc

  XOR rax, 0x20 ; 'a' ^ 0x20 = 'A'
  CMP rax, 'A'  ; because ascii table trick
  JL .end       ; bitwise xor yes yes
  CMP rax, 'Z'
  JG .end       ; also we need to check if
                ; it's a letter.
  XOR rbx, 0x20 ; much not gud stuff would
  CMP rbx, 'A'  ; happen if it's not
  JL .end       ; 'cause we messing around
  CMP rbx, 'Z'  ; with the ascii table
  JG .end

  CMP rax, rbx
  JNE .end

.inc:
  INC rdi
  INC rsi
  JMP .loop

.end:
  SUB rax, rbx
  RET
