/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strcmp
*/

#include "tests.h"

static void test_strcmp(const char *s1, const char *s2, strcmp_t func)
{
    int result = func(s1, s2);
    int expected = strcmp(s1, s2);

    result = (result > 0) - (result < 0);
    expected = (expected > 0) - (expected < 0);

    cr_assert_eq(
        expected, result, "strcmp(\"%s\", \"%s\"): expected %d, got %d", s1, s2,
        expected, result);
}

TestLibShared(strcmp, same)
{
    test_strcmp("hello world", "hello world", func);
}

TestLibShared(strcmp, longer)
{
    test_strcmp("hello", "hello world", func);
}

TestLibShared(strcmp, different)
{
    test_strcmp("hello epitech", "hello world", func);
}

TestLibShared(strcmp, reverse)
{
    test_strcmp("hello world", "hello epitech", func);
}
