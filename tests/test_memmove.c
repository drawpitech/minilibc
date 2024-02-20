/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for memmove
*/

#include "tests.h"

TestLibShared(memmove, move_before)
{
    int got[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int expected[] = {1, 2, 3, 1, 2, 3, 7, 8, 9, 10};

    func(got + 3, got, 7 * sizeof(int));
    memmove(expected + 3, expected, 7 * sizeof(int));
    cr_assert_arr_eq(got, expected, 10);
}

TestLibShared(memmove, move_after)
{
    int got[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int expected[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    func(got, got + 3, 7 * sizeof(int));
    memmove(expected, expected + 3, 7 * sizeof(int));
    cr_assert_arr_eq(got, expected, 10);
}
