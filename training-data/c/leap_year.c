#include <stdio.h>

int is_leap(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
}

int main(void) {
    int years[] = {2000, 1900, 2024, 2023};
    for (int i = 0; i < 4; i++) {
        printf("%d: %d\n", years[i], is_leap(years[i]));
    }
    return 0;
}
