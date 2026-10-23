#include <stdio.h>

#define COUNT 20

int main(void) {
    int s[COUNT + 2] = {0, 1};
    for (int i = 2; i < COUNT; i++) {
        s[i] = (i % 2 == 0) ? s[i / 2] : s[i / 2] + s[i / 2 + 1];
    }
    for (int i = 0; i < COUNT; i++) printf("%d ", s[i]);
    printf("\n");
    return 0;
}
