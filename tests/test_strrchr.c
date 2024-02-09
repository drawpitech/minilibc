/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strrchr
*/

#include "tests.h"

TestLibShared(strrchr, first_char)
{
    char* str = "Hello, World!";
    cr_assert_eq(strrchr(str, 'H'), func(str, 'H'));
}

TestLibShared(strrchr, in_str)
{
    char* str = "Hello, World!";
    cr_assert_eq(strrchr(str, 'W'), func(str, 'W'));
}

TestLibShared(strrchr, multiple)
{
    char* str = "Hello, World!";
    cr_assert_eq(strrchr(str, 'l'), func(str, 'l'));
}

TestLibShared(strrchr, not_found)
{
    char* str = "Hello, World!";
    cr_assert_eq(strrchr(str, 'k'), func(str, 'k'));
}
