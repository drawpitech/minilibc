/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for memcpy
*/

#include "tests.h"

TestLibShared(memcpy, hello_word)
{
    char origin[] = "hello world";
    char got[sizeof(origin)];

    cr_assert_eq(rawFunc(got, origin, sizeof(origin)), got);
    cr_assert_str_eq(got, origin);
}

TestLibShared(memcpy, null_byte)
{
    char origin[] = "\0hello world";
    char got[sizeof(origin)];

    cr_assert_eq(rawFunc(got, origin, sizeof(origin)), got);
    cr_assert_str_eq(got, origin);
}

TestLibShared(memcpy, int_arr)
{
    int origin[] = {1, 2, 3, 4, 5};
    int got[sizeof(origin)];

    cr_assert_eq(rawFunc(got, origin, sizeof(origin)), got);
    cr_assert_arr_eq(got, origin, sizeof(origin));
}
