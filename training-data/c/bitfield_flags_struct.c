#include <stdio.h>

struct Perm {
    unsigned read : 1;
    unsigned write : 1;
    unsigned exec : 1;
};

int main(void) {
    struct Perm p = {1, 0, 1};
    printf("r=%u w=%u x=%u\n", p.read, p.write, p.exec);
    p.write = 1;
    printf("%s\n", (p.read && p.write && p.exec) ? "rwx" : "partial");
    return 0;
}
