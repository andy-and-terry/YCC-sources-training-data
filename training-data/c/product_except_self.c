#include <stdio.h>

void product_except_self(const int *nums, long long *out, int n) {
    long long prefix = 1;
    for (int i = 0; i < n; i++) {
        out[i] = prefix;
        prefix *= nums[i];
    }
    long long suffix = 1;
    for (int i = n - 1; i >= 0; i--) {
        out[i] *= suffix;
        suffix *= nums[i];
    }
}

int main(void) {
    int a[] = {1, 2, 3, 4}, b[] = {-1, 1, 0, -3, 3};
    long long out[5];
    product_except_self(a, out, 4);
    for (int i = 0; i < 4; i++) printf("%lld ", out[i]);
    printf("\n");
    product_except_self(b, out, 5);
    for (int i = 0; i < 5; i++) printf("%lld ", out[i]);
    printf("\n");
    return 0;
}
