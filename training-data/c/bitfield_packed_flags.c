#include <stdio.h>

struct Flags {
    unsigned read : 1;
    unsigned write : 1;
    unsigned exec : 1;
    unsigned mode : 5;
};

int main(void) {
    struct Flags f = {1, 0, 1, 17};
    printf("r=%u w=%u x=%u mode=%u\n", f.read, f.write, f.exec, f.mode);
    return 0;
}
