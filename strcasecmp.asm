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
  PUSH rdx ; counter
  XOR rdx, rdx

.loop:
  ; compare rdi[rdx] and rsi[rdx]
  MOV al, BYTE [rdi + rdx]
  MOV ah, BYTE [rsi + rdx]
  CMP al, ah
  JE .inc

  XOR al, 0x20 ; 'a' ^ 0x20 = 'A'
  CMP al, 'A'  ; because ascii table trick
  JL .end      ; bitwise xor yes yes
  CMP al, 'Z'
  JG .end      ; also we need to check if
               ; it's a letter.
  XOR ah, 0x20 ; much not gud stuff would
  CMP ah, 'A'  ; happen if it's not
  JL .end      ; 'cause we messing around
  CMP ah, 'Z'  ; with the ascii table
  JG .end

  CMP al, ah
  JNE .end

.inc:
  INC rdx
  JMP .loop

.end:
  POP rdx
  SUB al, ah
  RET
