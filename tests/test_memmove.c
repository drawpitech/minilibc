/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for memmove
*/

#include "tests.h"

static const char str[] = "hello world bob aaah j'en peut plus ce code me rend zinzin bordel je suis a bout arretez ca svp mon dieu ce module";
static const size_t len = sizeof(str) / sizeof(int);

TestLibShared(memmove, move_before)
{
    int got[len];
    int expected[len];

    memcpy(got, str, sizeof(got));
    memcpy(expected, got, sizeof(got));

    func(got + 3, got, sizeof(got) - 3 * sizeof(int));
    memmove(expected + 3, expected, sizeof(got) - 3 * sizeof(int));

    cr_assert_arr_eq(got, expected, sizeof(got));
}

TestLibShared(memmove, move_after)
{
    int got[len];
    int expected[len];

    memcpy(got, str, sizeof(got));
    memcpy(expected, got, sizeof(got));

    func(got, got + 3, sizeof(got) - 3 * sizeof(int));
    memmove(expected, expected + 3, sizeof(got) - 3 * sizeof(int));

    cr_assert_arr_eq(got, expected, sizeof(got));
}

TestLibShared(memmove, move_same)
{
    int got[len];
    int expected[len];

    memcpy(got, str, sizeof(got));
    memcpy(expected, got, sizeof(got));

    func(got, got, sizeof(got));
    memmove(expected, expected, sizeof(got));

    cr_assert_arr_eq(got, expected, sizeof(got));
}
