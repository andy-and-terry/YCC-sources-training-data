#include <stdio.h>
#include <string.h>

/* Generic gnome sort over elements of arbitrary size, qsort-style. */
void gnome_sort(void *base, size_t n, size_t size, int (*cmp)(const void *, const void *)) {
    char *a = base;
    char tmp[64];
    size_t i = 0;
    if (size > sizeof tmp) return;
    while (i < n) {
        if (i == 0 || cmp(a + (i - 1) * size, a + i * size) <= 0) {
            i++;
        } else {
            memcpy(tmp, a + i * size, size);
            memcpy(a + i * size, a + (i - 1) * size, size);
            memcpy(a + (i - 1) * size, tmp, size);
            i--;
        }
    }
}

static int cmp_int(const void *x, const void *y) {
    int a = *(const int *)x, b = *(const int *)y;
    return (a > b) - (a < b);
}

static int cmp_str(const void *x, const void *y) {
    return strcmp(*(const char *const *)x, *(const char *const *)y);
}

int main(void) {
    int nums[] = {34, 2, 10, -9, 7};
    const char *words[] = {"delta", "alpha", "charlie", "bravo"};
    gnome_sort(nums, 5, sizeof nums[0], cmp_int);
    gnome_sort(words, 4, sizeof words[0], cmp_str);
    for (int i = 0; i < 5; i++) printf("%d ", nums[i]);
    printf("\n");
    for (int i = 0; i < 4; i++) printf("%s ", words[i]);
    printf("\n");
    return 0;
}
