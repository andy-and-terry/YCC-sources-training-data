#include <stdio.h>

int next_id(void) {
    static int counter = 0;   /* initialized once, persists across calls */
    return ++counter;
}

int call_count_with_reset(int reset) {
    static int calls;
    if (reset) {
        calls = 0;
        return 0;
    }
    return ++calls;
}

int main(void) {
    int a = next_id();
    int b = next_id();
    int c = next_id();
    printf("ids: %d %d %d\n", a, b, c);

    call_count_with_reset(0);
    call_count_with_reset(0);
    printf("calls so far: %d\n", call_count_with_reset(0));
    call_count_with_reset(1);
    printf("after reset: %d\n", call_count_with_reset(0));
    return 0;
}
