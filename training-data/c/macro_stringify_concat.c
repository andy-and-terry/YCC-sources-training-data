#include <stdio.h>

#define STR(x) #x
#define CAT(a, b) a##b
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define ARRAY_LEN(a) (sizeof(a) / sizeof((a)[0]))

int main(void) {
    int CAT(val, 1) = 5, CAT(val, 2) = 9;
    int arr[] = {1, 2, 3, 4};
    printf("%s = %d\n", STR(val2), val2);
    printf("max=%d len=%zu\n", MAX(val1, val2), ARRAY_LEN(arr));
    return 0;
}
