#include <stdint.h>
#include <stdio.h>

static volatile uint32_t fake_status = 0;

static void tick(void) { static int n; if (++n == 3) fake_status |= 1u; }

int main(void) {
    int polls = 0;
    while (!(fake_status & 1u)) { tick(); polls++; }
    printf("ready after %d polls\n", polls);
    return 0;
}
