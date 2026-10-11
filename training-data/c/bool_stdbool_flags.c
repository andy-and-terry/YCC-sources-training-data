#include <stdio.h>
#include <stdbool.h>

static bool is_even(int n) { return n % 2 == 0; }

int main(void) {
    bool seen_odd = false, seen_even = false;
    int vals[] = {2, 4, 7, 10};
    for (int i = 0; i < 4; i++) {
        if (is_even(vals[i])) seen_even = true;
        else seen_odd = true;
    }
    printf("even: %d odd: %d both: %s\n", seen_even, seen_odd,
           (seen_even && seen_odd) ? "true" : "false");
    return 0;
}
