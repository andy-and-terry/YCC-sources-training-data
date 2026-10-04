#include <stddef.h>
#include <stdio.h>

struct Padded { char a; int b; char c; };
struct Packed { int b; char a; char c; };

int main(void) {
    printf("sizeof(Padded)=%zu sizeof(Packed)=%zu\n", sizeof(struct Padded), sizeof(struct Packed));
    printf("offsetof Padded: a=%zu b=%zu c=%zu\n",
           offsetof(struct Padded, a), offsetof(struct Padded, b), offsetof(struct Padded, c));
    printf("alignof(double)=%zu alignof(int)=%zu\n", _Alignof(double), _Alignof(int));
    int arr[10];
    printf("array length = %zu\n", sizeof arr / sizeof arr[0]);
    return 0;
}
