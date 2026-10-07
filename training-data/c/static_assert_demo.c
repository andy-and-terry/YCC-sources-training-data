#include <assert.h>
#include <limits.h>
#include <stdint.h>
#include <stdio.h>

/* Compile-time checks (C11): failure stops compilation. */
struct packet { uint8_t type; uint8_t flags; uint16_t length; uint32_t id; };

static_assert(sizeof(struct packet) == 8, "packet must be 8 bytes");
static_assert(CHAR_BIT == 8, "8-bit bytes required");
static_assert(sizeof(int) >= 4, "int must be at least 32 bits");

int main(void) {
    printf("sizeof(struct packet) = %zu\n", sizeof(struct packet));
    return 0;
}
