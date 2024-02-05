;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; memcpy
;;

section .text
global memcpy
memcpy:
.loop:
  ; while *src == '\0'
  cmp rdx, 0
  je .end

  ; copy *rdi in byte sized register
  ; and copy it in *rsi
  mov al, [rsi]
  mov byte [rdi], al

  ; incr ptr rdi and rsi
  ; decr counter rdx
  inc rdi
  inc rsi
  dec rdx
  jmp .loop
.end:
  ret
