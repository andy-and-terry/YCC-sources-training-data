#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <limits.h>

int main(void) {
    printf("int8   : %d .. %d\n", INT8_MIN, INT8_MAX);
    printf("uint16 : 0 .. %u\n", UINT16_MAX);
    printf("int32  : %" PRId32 " .. %" PRId32 "\n", INT32_MIN, INT32_MAX);
    printf("uint64 : %" PRIu64 "\n", UINT64_MAX);
    printf("char bits: %d\n", CHAR_BIT);
    return 0;
}
