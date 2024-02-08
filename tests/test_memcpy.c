/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for memcpy
*/

#include "tests.h"

TestMemcpy(hello_world)
{
    char origin[] = "hello world";
    char got[sizeof(origin)];

    cr_assert_eq(rawFunc(got, origin, sizeof(origin)), got);
    cr_assert_str_eq(got, origin);
}

TestMemcpy(null_byte)
{
    char origin[] = "\0hello world";
    char got[sizeof(origin)];

    cr_assert_eq(rawFunc(got, origin, sizeof(origin)), got);
    cr_assert_str_eq(got, origin);
}

TestMemcpy(int_arr)
{
    int origin[] = {1, 2, 3, 4, 5};
    int got[sizeof(origin)];

    cr_assert_eq(rawFunc(got, origin, sizeof(origin)), got);
    cr_assert_arr_eq(got, origin, sizeof(origin));
}
