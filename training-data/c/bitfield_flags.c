#include <stdio.h>

struct Flags {
    unsigned read : 1;
    unsigned write : 1;
    unsigned exec : 1;
};

int main(void) {
    struct Flags f = { 1, 0, 1 };
    printf("r=%u w=%u x=%u size=%zu\n", f.read, f.write, f.exec, sizeof f);
    return 0;
}
