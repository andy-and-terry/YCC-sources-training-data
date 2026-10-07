#include <stdio.h>

/* X-macro: a single source of truth for a list of (enum, name) pairs,
   expanded twice below to generate both the enum and its string table. */
#define COLOR_LIST \
    X(COLOR_RED) \
    X(COLOR_GREEN) \
    X(COLOR_BLUE) \
    X(COLOR_YELLOW)

typedef enum {
#define X(name) name,
    COLOR_LIST
#undef X
    COLOR_COUNT
} Color;

static const char *color_names[] = {
#define X(name) #name,
    COLOR_LIST
#undef X
};

int main(void) {
    for (Color c = 0; c < COLOR_COUNT; c++) {
        printf("%d: %s\n", c, color_names[c]);
    }
    return 0;
}
