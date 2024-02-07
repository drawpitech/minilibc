/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strrchr
*/

#include "tests.h"

TestStrrchr(first_char, {
    char* str = "Hello, World!";
    cr_assert_eq(strrchr(str, 'H'), rawFunc(str, 'H'));
})

TestStrrchr(in_str, {
    char* str = "Hello, World!";
    cr_assert_eq(strrchr(str, 'W'), rawFunc(str, 'W'));
})

TestStrrchr(multiple, {
    char* str = "Hello, World!";
    cr_assert_eq(strrchr(str, 'l'), rawFunc(str, 'l'));
})

TestStrrchr(not_found, {
    char* str = "Hello, World!";
    cr_assert_eq(strrchr(str, 'k'), rawFunc(str, 'k'));
})
