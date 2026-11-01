#include <assert.h>
#include <stdint.h>
#include <stdio.h>

struct Header { uint8_t tag; uint8_t pad; uint16_t len; uint32_t id; };

static_assert(sizeof(struct Header) == 8, "header must be 8 bytes");
static_assert(sizeof(int) >= 4, "int too small");

int main(void) {
    puts("layout ok");
    return 0;
}
