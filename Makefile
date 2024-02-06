##
## EPITECH PROJECT, 2024
## minilibc
## File description:
## Makefile
##

CC := gcc
CFLAGS := -Wall -Wextra -fPIC -z noexecstack

AS := nasm
ASFLAGS := -f elf64

NAME := libasm.so

BUILD_DIR := .build
SRC := $(shell find . -name '*.asm')
OBJ := $(SRC:%.asm=${BUILD_DIR}/%.o)


all: $(NAME)

$(BUILD_DIR)/%.o: %.asm
	mkdir -p $(dir $@)
	$(AS) $(ASFLAGS) $< -o $@

$(NAME): $(OBJ)
	$(CC) -shared $(CFLAGS) -o $@ $^

.PHONY: all

clean:
	$(RM) -r $(BUILD_DIR)

fclean: clean
	$(RM) $(NAME)

.PHONY: clean fclean

re: fclean all

.PHONY: re
.NOTPARALLEL: re
