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

#define TestLibShared(func_name, test_name)                              \
    void nicest_test_ever_##func_name##_##test_name(func_name##_t func); \
                                                                         \
    Test(func_name, test_name)                                           \
    {                                                                    \
        void *handle = dlopen("./libasm.so", RTLD_LAZY);                 \
        if (!handle)                                                     \
            cr_skip("Failed to open shared library: %s", dlerror());     \
        func_name##_t func = dlsym(handle, #func_name);                  \
        if (!func)                                                       \
            cr_skip("Failed to get function pointer: %s", dlerror());    \
        nicest_test_ever_##func_name##_##test_name(func);                \
        dlclose(handle);                                                 \
    }                                                                    \
                                                                         \
    void nicest_test_ever_##func_name##_##test_name(func_name##_t func)

typedef size_t (*strlen_t)(char *str);
typedef char *(*strchr_t)(const char *s, int c);
typedef char *(*strrchr_t)(const char *s, int c);
typedef void *(*memset_t)(void *s, int c, size_t n);
typedef void *(*memcpy_t)(void *dest, const void *src, size_t n);
typedef int (*strcmp_t)(const char *s1, const char *s2);
typedef void *(*memmove_t)(void *dest, const void *src, size_t n);
typedef int (*strncmp_t)(const char *s1, const char *s2, size_t n);
typedef int (*strcasecmp_t)(const char *s1, const char *s2);
typedef char *(*strstr_t)(const char *haystack, const char *needle);
typedef char *(*strpbrk_t)(const char *s, const char *accept);
typedef size_t (*strcspn_t)(const char *s, const char *reject);
