#include <stdio.h>

/* Running median with a simple insertion-sorted buffer. */
int main(void) {
    int stream[] = {5, 15, 1, 3, 8, 7, 9, 10};
    int buf[8], n = 0;
    for (int i = 0; i < 8; i++) {
        int j = n++;
        while (j > 0 && buf[j - 1] > stream[i]) { buf[j] = buf[j - 1]; j--; }
        buf[j] = stream[i];
        double med = (n % 2) ? buf[n / 2] : (buf[n / 2 - 1] + buf[n / 2]) / 2.0;
        printf("after %d: median %.1f\n", stream[i], med);
    }
    return 0;
}
