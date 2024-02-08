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

#define TestLibShared(func_name, test_name)                                 \
    void nicest_test_ever_##func_name##test_name(my_##func_name rawFunc);   \
                                                                            \
    Test(func_name, test_name)                                              \
    {                                                                       \
        void *handle = dlopen("./libasm.so", RTLD_LAZY);                    \
        if (!handle)                                                        \
            cr_skip("Failed to open shared library: %s", dlerror());        \
        my_##func_name rawFunc = (my_##func_name)dlsym(handle, #func_name); \
        if (!rawFunc)                                                       \
            cr_skip("Failed to get function pointer: %s", dlerror());       \
        nicest_test_ever_##func_name##test_name(rawFunc);                   \
        dlclose(handle);                                                    \
    }                                                                       \
                                                                            \
    void nicest_test_ever_##func_name##test_name(my_##func_name rawFunc)

typedef size_t (*my_strlen)(char *str);
typedef char *(*my_strchr)(const char *s, int c);
typedef char *(*my_strrchr)(const char *s, int c);
typedef void *(*my_memset)(void *s, int c, size_t n);
typedef void *(*my_memcpy)( void *restrict dest, const void *restrict src, size_t n);
