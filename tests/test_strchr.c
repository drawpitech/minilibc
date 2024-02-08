/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strchr
*/

#include "tests.h"

TestStrchr(first_char)
{
    char* str = "Hello, World!";
    cr_assert_eq(strchr(str, 'H'), rawFunc(str, 'H'));
}

TestStrchr(in_str)
{
    char* str = "Hello, World!";
    cr_assert_eq(strchr(str, 'W'), rawFunc(str, 'W'));
}

TestStrchr(multiple)
{
    char* str = "Hello, World!";
    cr_assert_eq(strchr(str, 'l'), rawFunc(str, 'l'));
}

TestStrchr(not_found)
{
    char* str = "Hello, World!";
    cr_assert_eq(strchr(str, 'k'), rawFunc(str, 'k'));
}
