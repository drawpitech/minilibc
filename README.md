# MinilibC

Going deeper into the rabbit hole

> **Note** This is the first project of the second year at
> [Epitech](https://www.epitech.eu/).


## Compilation

Build the `libasm.so` shared library.

### Nix x86_64

```sh
nix build
```

### Generic Linux x86_64

You'll need the following dependencies:
- `gcc`
- `gnumake`
- `nasm`

```sh
make
```


## Test in the real world

```sh
LD_PRELOAD=./libasm.so firefox
```


## Implemented functions

These function respect the x86_64 calling convention, and followed the man
pages from [kernel.org/doc/man-pages](https://www.kernel.org/doc/man-pages).

- [X] strlen
- [X] strchr
- [X] strrchr
- [X] memset
- [X] memcpy
- [X] strcmp
- [X] memmove
- [X] strncmp
- [X] strcasecmp
- [X] strstr
- [X] strpbrk
- [X] strcspn
