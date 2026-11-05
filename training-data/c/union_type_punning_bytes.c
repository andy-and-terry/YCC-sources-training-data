#include <stdio.h>
#include <stdint.h>

union Word {
    uint32_t u;
    uint8_t b[4];
};

int main(void) {
    union Word w = {.u = 0x01020304};
    for (int i = 0; i < 4; i++)
        printf("%02x ", w.b[i]);
    printf("\n");
    return 0;
}
