#include <stdio.h>

/* A pointer to const data can't modify what it points to, but the
 * pointer itself can be reseated; a const pointer is the opposite. */
int sum_array(const int *arr, int n) {
    int total = 0;
    for (int i = 0; i < n; i++) {
        total += arr[i];
        /* arr[i] = 0; would fail to compile: arr points to const int */
    }
    return total;
}

void print_label(char *const label) {
    printf("%s\n", label);
    /* label = "other"; would fail to compile: label itself is const */
}

int main(void) {
    const int values[] = {1, 2, 3, 4, 5};
    printf("sum: %d\n", sum_array(values, 5));

    char buffer[] = "fixed pointer";
    print_label(buffer);
    return 0;
}
