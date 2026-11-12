#include <stdio.h>
struct flags {
    unsigned read : 1;
    unsigned write : 1;
    unsigned exec : 1;
    unsigned mode : 4;
};
int main(void) {
    struct flags f = { .read = 1, .exec = 1, .mode = 9 };
    printf("r=%u w=%u x=%u mode=%u\n", f.read, f.write, f.exec, f.mode);
    return 0;
}
