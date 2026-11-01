#include <stdio.h>

struct Flags {
    unsigned read : 1;
    unsigned write : 1;
    unsigned mode : 3;
};

int main(void) {
    struct Flags f = { .read = 1, .write = 0, .mode = 5 };
    printf("%u %u %u size=%zu\n", f.read, f.write, f.mode, sizeof f);
    return 0;
}
