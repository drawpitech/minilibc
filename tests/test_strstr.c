/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strstr
*/

#include "tests.h"

TestLibShared(strstr, hello)
{
    char* str = "hello world";
    cr_assert_eq(strstr(str, "hello"), func(str, "hello"));
}

TestLibShared(strstr, world)
{
    char* str = "hello world";
    cr_assert_eq(strstr(str, "hello"), func(str, "hello"));
}

TestLibShared(strstr, notfound)
{
    char* str = "hello world";
    cr_assert_eq(strstr(str, "epitech"), func(str, "epitech"));
}

TestLibShared(strstr, hell)
{
    char* str = "This is hell";
    cr_assert_eq(strstr(str, "hello"), func(str, "hello"));
}
