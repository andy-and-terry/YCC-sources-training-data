#include <stdio.h>

/* A function-local `static` variable keeps its value between calls,
 * initialized only once, without needing a global. */
int next_id(void) {
    static int counter = 0;
    counter++;
    return counter;
}

int main(void) {
    for (int i = 0; i < 5; i++) {
        printf("id: %d\n", next_id());
    }
    return 0;
}
