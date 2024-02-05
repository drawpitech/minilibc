;;
;; EPITECH PROJECT, 2024
;; minilibc
;; File description:
;; memset
;;

section .text
global memset
memset:
.loop:
  ; decrement rdx 'till its 0
  cmp rdx, 0
  je .end

  ; set byte at rdi to rsi,
  ; increment ptr, decrement rdx
  mov [rdi], byte rsi
  inc rdi
  dec rdx
  jmp .loop
.end:
  ret
