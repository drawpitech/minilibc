##
## EPITECH PROJECT, 2024
## minilibc
## File description:
## Makefile
##

LD := ld
LDFLAGS :=

AS := nasm
ASFLAGS := -f elf64

CC := gcc
CFLAGS := -W -Wall -Wextra

NAME := libasm.so
NAME_TEST := unit_tests

BUILD_DIR := .build
SRC := $(shell find . -name '*.asm')
OBJ := $(SRC:%.asm=${BUILD_DIR}/%.o)

SRC_TEST := $(shell find tests -name '*.c')
OBJ_TEST := $(SRC_TEST:%.c=${BUILD_DIR}/%.o)


all: $(NAME)

# Libasm
$(BUILD_DIR)/%.o: %.asm
	@ mkdir -p $(dir $@)
	$(AS) $(LDFLAGS) $(ASFLAGS) $< -o $@

$(NAME): LDFLAGS += -shared
$(NAME): $(OBJ)
	$(LD) $(LDFLAGS) -o $@ $^

.PHONY: all

# Tests
$(BUILD_DIR)/%.o: %.c $(NAME)
	@ mkdir -p $(dir $@)
	$(CC) $(LDFLAGS) $(CFLAGS) -c $< -o $@

$(NAME_TEST): LDFLAGS += -lcriterion
$(NAME_TEST): $(OBJ_TEST)
	$(CC) $(LDFLAGS) -o $@ $^

tests_run: $(NAME_TEST)
	@-./$<

.NOTPARALLEL: tests_run
.PHONY: tests_run

# Clean
clean:
	$(RM) -r $(BUILD_DIR)

fclean: clean
	$(RM) $(NAME) $(NAME_TEST)

.PHONY: clean fclean

re: fclean all

.NOTPARALLEL: re
.PHONY: re
