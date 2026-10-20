#include <assert.h>
#include <stdint.h>
#include <stdio.h>

struct Header { uint8_t tag; uint8_t pad[3]; uint32_t len; };

static_assert(sizeof(struct Header) == 8, "header must be 8 bytes");
static_assert(sizeof(uint32_t) == 4, "uint32 size");

int main(void) {
    printf("%zu\n", sizeof(struct Header));
    return 0;
}
