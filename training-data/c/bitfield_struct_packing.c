#include <stdio.h>

struct Flags {
    unsigned ready : 1;
    unsigned mode : 3;
    unsigned level : 4;
};

int main(void) {
    struct Flags f = { 1, 5, 9 };
    f.level += 10;
    printf("%u %u %u size=%zu\n", f.ready, f.mode, f.level, sizeof f);
    return 0;
}
