#include <stddef.h>
#include <stdio.h>

struct A { char c; int i; char d; };
struct B { int i; char c; char d; };
struct __attribute__((packed)) C { char c; int i; };

int main(void) {
    printf("%zu %zu %zu\n", sizeof(struct A), sizeof(struct B), sizeof(struct C));
    printf("%zu %zu\n", offsetof(struct A, i), offsetof(struct A, d));
    return 0;
}
