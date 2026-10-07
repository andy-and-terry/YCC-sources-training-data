#include <stdio.h>
#include <string.h>

/* memmove handles overlapping regions correctly; memcpy does not. */
int main(void) {
    char buf[] = "abcdefghij";
    memmove(buf + 2, buf, 5);   /* shift "abcde" right by two */
    printf("after memmove: %s\n", buf);

    int nums[6] = {1, 2, 3, 4, 5, 6};
    memmove(nums, nums + 2, 4 * sizeof nums[0]);  /* shift left */
    for (int i = 0; i < 6; i++) printf("%d ", nums[i]);
    printf("\n");
    return 0;
}
