/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strchr
*/

#include "tests.h"

TestLibShared(strchr, first_char)
{
    char* str = "Hello, World!";
    cr_assert_eq(strchr(str, 'H'), rawFunc(str, 'H'));
}

TestLibShared(strchr, in_str)
{
    char* str = "Hello, World!";
    cr_assert_eq(strchr(str, 'W'), rawFunc(str, 'W'));
}

TestLibShared(strchr, multiple)
{
    char* str = "Hello, World!";
    cr_assert_eq(strchr(str, 'l'), rawFunc(str, 'l'));
}

TestLibShared(strchr, not_found)
{
    char* str = "Hello, World!";
    cr_assert_eq(strchr(str, 'k'), rawFunc(str, 'k'));
}
