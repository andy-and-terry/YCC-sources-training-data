#include <stdio.h>

#define LIMIT 50

int main(void) {
    int nums[LIMIT];
    int len = 0;
    for (int v = 1; v <= LIMIT; v += 2) nums[len++] = v;
    for (int i = 1; i < len && nums[i] <= len; i++) {
        int step = nums[i];
        int kept = 0;
        for (int idx = 0; idx < len; idx++) {
            if ((idx + 1) % step != 0) nums[kept++] = nums[idx];
        }
        len = kept;
    }
    for (int i = 0; i < len; i++) printf("%d ", nums[i]);
    printf("\n");
    return 0;
}
