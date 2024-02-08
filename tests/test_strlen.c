/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests for strlen
*/

#include "tests.h"

TestStrlen(hello_world)
{
    char* str = "Hello, World!";
    cr_assert_eq(strlen(str), rawFunc(str));
}

TestStrlen(empty)
{
    char* str = "";
    cr_assert_eq(strlen(str), rawFunc(str));
}
