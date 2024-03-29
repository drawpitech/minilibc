/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for memset
*/

#include "tests.h"

TestLibShared(memset, ten_bytes)
{
    const size_t size = 10;
    char got[size];
    cr_assert_eq(func(got, 0, size), got);

    char expected[size];
    memset(expected, 0, size);
    cr_assert_arr_eq(got, expected, size);
}

TestLibShared(memset, ten_bytes_with_h)
{
    const size_t size = 10;
    char got[size];
    cr_assert_eq(func(got, 'h', size), got);

    char expected[size];
    memset(expected, 'h', size);
    cr_assert_arr_eq(got, expected, size);
}
