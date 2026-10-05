#include <assert.h>
#include <limits.h>
#include <stddef.h>
#include <stdio.h>

struct header {
    unsigned char type;
    unsigned int length;
};

/* C11 compile-time checks */
_Static_assert(CHAR_BIT == 8, "bytes must be 8 bits");
_Static_assert(sizeof(int) >= 4, "int must be at least 32 bits");
static_assert(offsetof(struct header, type) == 0, "type is first");

int main(void) {
    printf("sizeof(struct header) = %zu\n", sizeof(struct header));
    printf("offsetof(length) = %zu\n", offsetof(struct header, length));
    return 0;
}
