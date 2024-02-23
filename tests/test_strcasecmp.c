/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strcasecmp
*/

#include "tests.h"

static void test_strcasecmp(const char *s1, const char *s2, strcmp_t func)
{
    int result = func(s1, s2);
    int expected = strcasecmp(s1, s2);

    result = (result > 0) - (result < 0);
    expected = (expected > 0) - (expected < 0);

    cr_assert_eq(
        expected, result, "strcasecmp(\"%s\", \"%s\"): expected %d, got %d", s1,
        s2, expected, result);
}

TestLibShared(strcasecmp, same)
{
    test_strcasecmp("hello world", "hello world", func);
}

TestLibShared(strcasecmp, same_but_diff_case)
{
    test_strcasecmp("HELLO world", "hello WORLD", func);
}

TestLibShared(strcasecmp, longer)
{
    test_strcasecmp("hello", "hello world", func);
}

TestLibShared(strcasecmp, different)
{
    test_strcasecmp("hello epitech", "hello world", func);
}

TestLibShared(strcasecmp, reverse)
{
    test_strcasecmp("hello world", "hello epitech", func);
}
