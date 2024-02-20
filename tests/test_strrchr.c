/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strrchr
*/

#include <stdio.h>

#include "tests.h"

static void my_assert(const char *str, char c, strrchr_t func)
{
    void *got = func(str, c);
    void *expected = strrchr(str, c);
    cr_assert_eq(
        got, expected, "strrchr(\"%s\", '%c') -> %p: got: %p, expected: %p",
        str, c, str, got, expected);
}

TestLibShared(strrchr, first_char)
{
    my_assert("Hello, World!", 'H', func);
}

TestLibShared(strrchr, in_str)
{
    my_assert("Hello, World!", 'W', func);
}

TestLibShared(strrchr, multiple)
{
    my_assert("Hello, World!", 'l', func);
}

TestLibShared(strrchr, not_found)
{
    my_assert("Hello, World!", 'k', func);
}

TestLibShared(strrchr, empty_str)
{
    my_assert("", 'k', func);
}

TestLibShared(strrchr, null_byte)
{
    my_assert("Hello, World!", '\0', func);
}
