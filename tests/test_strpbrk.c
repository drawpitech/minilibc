/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strpbrk
*/

#include "tests.h"

#include <string.h>

static void my_assert(const char *str, const char *to_find, strpbrk_t func)
{
    char *expected = strpbrk(str, to_find);
    char *got = func(str, to_find);
    cr_assert_eq(expected, got, "Expected %p, got %p\n", expected, got);
}

TestLibShared(strpbrk, tests)
{
    my_assert("Hello, World!", " ", func);
    my_assert("Hello, World!", "elo", func);
    my_assert("Hello, World!", "eHe", func);
    my_assert("Hello, World!", "yu", func);
    my_assert("Hello, World!", "", func);
    my_assert("", "", func);
    my_assert("", "aaaaa", func);
    my_assert("", "H", func);
    my_assert("", "!", func);
    my_assert("Hello, world!", "eeeeeeeeeeeeeeeee", func);
}
