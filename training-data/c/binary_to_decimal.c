#include <stdio.h>

int binary_to_decimal(const char *bin) {
    int result = 0;
    for (int i = 0; bin[i]; i++) {
        result = result * 2 + (bin[i] - '0');
    }
    return result;
}

int main(void) {
    printf("%d\n", binary_to_decimal("1010"));
    printf("%d\n", binary_to_decimal("11111111"));
    return 0;
}
