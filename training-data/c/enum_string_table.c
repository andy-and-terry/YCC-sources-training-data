#include <stdio.h>

enum Color { RED, GREEN, BLUE, COLOR_COUNT };

static const char *const color_names[COLOR_COUNT] = {
    [RED] = "red", [GREEN] = "green", [BLUE] = "blue"
};

int main(void) {
    for (int c = 0; c < COLOR_COUNT; c++)
        printf("%d => %s\n", c, color_names[c]);
    return 0;
}
