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
  PUSH rbx
  PUSH rdx ; counter
  XOR rdx, rdx

.loop:
  ; compare rdi[rdx] and rsi[rdx]
  MOV al, BYTE [rdi + rdx]
  MOV ah, BYTE [rsi + rdx]
  CMP al, ah
  JE .inc

  MOV bl, al
  MOV bh, ah
                  ; 'a' | 32 = 'A'
  OR bl, 0b100000 ; 'A' | 32 = 'A'
  CMP bl, 'a'     ; because ascii table trick
  JL .end         ; bitwise xor yes yes
  CMP bl, 'z'
  JG .end         ; also we need to check if
                  ; it's a letter.
  OR bh, 0b100000 ; much not gud stuff would
  CMP bh, 'a'     ; happen if it's not
  JL .end         ; 'cause we messing around
  CMP bh, 'z'     ; with the ascii table
  JG .end

  MOV al, bl
  MOV ah, bh

  CMP al, ah
  JNE .end

.inc:
  CMP al, 0
  JE .end
  INC rdx
  JMP .loop

.end:
  POP rdx
  POP rbx
  SUB al, ah
  MOVSX rax, al
  RET
