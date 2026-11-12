#include <stdio.h>
#define COLORS(X) X(RED) X(GREEN) X(BLUE)
#define AS_ENUM(n) n,
#define AS_STR(n) #n,
enum color { COLORS(AS_ENUM) COLOR_COUNT };
static const char *names[] = { COLORS(AS_STR) };
int main(void) {
    for (int i = 0; i < COLOR_COUNT; i++) printf("%d=%s\n", i, names[i]);
    return 0;
}
