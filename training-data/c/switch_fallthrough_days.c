#include <stdio.h>

static int days(int month, int leap) {
    switch (month) {
    case 2:
        return leap ? 29 : 28;
    case 4: case 6: case 9: case 11:
        return 30;
    default:
        return 31;
    }
}

int main(void) {
    for (int m = 1; m <= 12; m++) printf("%d:%d ", m, days(m, 0));
    printf("\nleap Feb: %d\n", days(2, 1));
    return 0;
}
