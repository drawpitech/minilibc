/*
** EPITECH PROJECT, 2024
** minilibc
** File description:
** tests
*/

#pragma once

#include <criterion/criterion.h>
#include <dlfcn.h>
#include <stddef.h>

#define TestLibShared(func_name, test_name, func)                           \
    Test(func_name, test_name)                                              \
    {                                                                       \
        void* handle = dlopen("./libasm.so", RTLD_LAZY);                    \
        if (!handle)                                                        \
            cr_skip("Failed to open shared library: %s", dlerror());        \
        my_##func_name rawFunc = (my_##func_name)dlsym(handle, #func_name); \
        if (!rawFunc)                                                       \
            cr_skip("Failed to get function pointer: %s", dlerror());       \
        do                                                                  \
            func while (0);                                                 \
        dlclose(handle);                                                    \
    }

typedef size_t (*my_strlen)(char* str);
#define TestStrlen(test_name, func) TestLibShared(strlen, test_name, func)
