/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strstr
*/

#include <stdio.h>
#include "tests.h"

static void assert_strstr(char *str, char *to_find, strstr_t func)
{
    char *res = strstr(str, to_find);
    char *res2 = func(str, to_find);

    cr_assert_eq(res, res2, "Expected `%s`, got `%s`", res, res2);
}

TestLibShared(strstr, hello)
{
    assert_strstr("hello world", "hello", func);
    assert_strstr("hello world", "world", func);
    assert_strstr("hello world", "epitech", func);
    assert_strstr("This is hell", "hello", func);
    assert_strstr("this is hell", "\0", func);
    assert_strstr("\0 is hell", "bob", func);
    assert_strstr("hello", "hello my name is bob", func);
    assert_strstr("dev", "je devienne fou", func);
    assert_strstr("je devienne fou", "dev", func);
    assert_strstr("hello world", "world", func);
    assert_strstr("hello world", "hello", func);
    assert_strstr("hello world", "o", func);
    assert_strstr("hello world", "l", func);
    assert_strstr("hello world", "d", func);
    assert_strstr("hello world", "hello world", func);
    assert_strstr("hello world", "hello world!", func);
    assert_strstr("hello world", "", func);
    assert_strstr("", "hello", func);
    assert_strstr("", "", func);
    assert_strstr(NULL, "", func);
}
