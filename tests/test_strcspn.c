/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strcspn
*/

#include <stdio.h>
#include "tests.h"

static void my_assert(char *str, char *to_find, strcspn_t func)
{
    size_t expected = strcspn(str, to_find);
    size_t got = func(str, to_find);
    cr_assert_eq(expected, got, "Expected %ld, got %ld\n", expected, got);
}

TestLibShared(strcspn, tests)
{
    my_assert("Hello, World!", " ", func);
    my_assert("Hello, World!", "elo", func);
    my_assert("Hello, World!", "eHe", func);
    my_assert("Hello, World!", "yu", func);
    my_assert("Hello, World!", "", func);
    my_assert("", "", func);
    my_assert("", "aaaaa", func);
    my_assert("", "H", func);
    my_assert("", "!", func);
    my_assert("Hello, World!", "yiyiyiiyyuyuyyiyiyiyiuyiyiyiuyiyiuyie", func);
}
