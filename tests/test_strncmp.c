/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strncmp
*/

#include "tests.h"

static void test_strncmp(
    const char *s1, const char *s2, size_t n, strncmp_t func)
{
    int result = func(s1, s2, n);
    int expected = strncmp(s1, s2, n);

    result = (result > 0) - (result < 0);
    expected = (expected > 0) - (expected < 0);

    cr_assert_eq(
        expected, result, "strncmp(\"%s\", \"%s\", %lu): expected %d, got %d",
        s1, s2, n, expected, result);
}

TestLibShared(strncmp, same)
{
    test_strncmp("hello world", "hello world", 11, func);
}

TestLibShared(strncmp, longer)
{
    test_strncmp("hello", "hello world", 5, func);
}

TestLibShared(strncmp, different)
{
    test_strncmp("hello epitech", "hello world", 11, func);
}

TestLibShared(strncmp, reverse)
{
    test_strncmp("hello world", "hello epitech", 11, func);
}
