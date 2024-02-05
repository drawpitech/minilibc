##
## EPITECH PROJECT, 2024
## minilibc
## File description:
## Makefile
##

CC := gcc
CFLAGS := -Wall -Wextra -fPIC -z noexecstack
SRC := $(shell find . -name '*.asm')

BUILD_DIR := .build
OBJ := $(SRC:%.asm=${BUILD_DIR}/%.o)

NAME := libasm.so

all: $(NAME)

$(BUILD_DIR)/%.o: %.asm
	mkdir -p $(dir $@)
	nasm -f elf64 $< -o $@

$(NAME): $(OBJ)
	$(CC) -shared $(CFLAGS) -o $@ $^

.PHONY: all $(NAME)

clean:
	$(RM) -r $(BUILD_DIR)

fclean: clean
	$(RM) $(NAME)

.PHONY: clean fclean

re: fclean
	$(MAKE) $(MAKEFLAGS) all

.PHONY: re
