#include <stdio.h>

struct Cfg { int port; const char *host; int flags[4]; };

int main(void) {
    struct Cfg c = { .host = "localhost", .flags = { [2] = 7 }, .port = 80 };
    int a[6] = { [1] = 10, [4] = 40 };
    printf("%s:%d %d\n", c.host, c.port, c.flags[2]);
    for (int i = 0; i < 6; i++) printf("%d ", a[i]);
    printf("\n");
    return 0;
}
