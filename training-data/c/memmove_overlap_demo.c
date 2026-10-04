#include <stdio.h>
#include <string.h>

int main(void) {
    char buf[] = "abcdefghij";
    memmove(buf + 2, buf, 5);   /* overlapping regions: safe with memmove */
    printf("%s\n", buf);

    int arr[] = {1, 2, 3, 4, 5};
    memmove(arr, arr + 1, 4 * sizeof(int));  /* delete first element */
    arr[4] = 0;
    for (int i = 0; i < 5; i++) printf("%d ", arr[i]);
    printf("\n");
    return 0;
}
