;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; strchr
;;

section .text
global strchr
strchr:
  xor rax, rax
.start:
  ; if *rdi == rsi, return rdi
  ; (sil is the register for the first byte of rsi)
  cmp byte [rdi], sil
  je .valid

  ; else if *rdi == 0, return NULL
  cmp byte [rdi], 0
  je .end

  ; else, increment ptr rdi and repeat
  inc rdi
  jmp .start

.valid:
  mov rax, rdi
.end:
  ret
