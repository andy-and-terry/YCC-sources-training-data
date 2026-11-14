#include <stdint.h>
#include <stdio.h>

union U { uint32_t u; unsigned char b[4]; };

int main(void) {
    union U x = { .u = 0x01020304 };
    for (int i = 0; i < 4; i++) printf("%02x ", x.b[i]);
    putchar('\n');
    return 0;
}
