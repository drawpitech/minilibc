/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strrchr
*/

#include <string.h>

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
    my_assert("Hello, World!", 'H', func);        // first char
    my_assert("Hello, World!", '!', func);        // last char
    my_assert("Hello, World!", 'W', func);        // in str
    my_assert("Hello, World!", 'l', func);        // multiple
    my_assert("Hello, World!", 'k', func);        // not found
    my_assert("Hello, World!", '\0', func);       // null byte
    my_assert("", 'k', func);                     // empty string
    my_assert("", '\0', func);                    // empty string
    my_assert("bon\nis in his car", '\n', func);  // special char
    my_assert("bon\0is in his car", '\0', func);  // split in middle
}
