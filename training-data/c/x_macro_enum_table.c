#include <stdio.h>

#define COLORS(X) X(RED, 0xff0000) X(GREEN, 0x00ff00) X(BLUE, 0x0000ff)

enum Color {
#define X(n, v) n,
    COLORS(X)
#undef X
    COLOR_COUNT
};

static const char *names[] = {
#define X(n, v) #n,
    COLORS(X)
#undef X
};

static const unsigned rgb[] = {
#define X(n, v) v,
    COLORS(X)
#undef X
};

int main(void) {
    for (int i = 0; i < COLOR_COUNT; i++) printf("%s=%06x\n", names[i], rgb[i]);
    return 0;
}
