/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strlen
*/

#include "tests.h"

TestLibShared(strlen, hello_world)
{
    char* str = "Hello, World!";
    cr_assert_eq(strlen(str), func(str));
}

TestLibShared(strlen, empty)
{
    char* str = "";
    cr_assert_eq(strlen(str), func(str));
}
