/* Bulls and Cows scoring for equal-length digit strings. */
#include <stdio.h>
#include <string.h>

static void score(const char *secret, const char *guess, int *bulls, int *cows) {
    int sc[10] = {0}, gc[10] = {0};
    *bulls = *cows = 0;
    for (size_t i = 0; i < strlen(secret); i++) {
        if (secret[i] == guess[i]) (*bulls)++;
        else { sc[secret[i] - '0']++; gc[guess[i] - '0']++; }
    }
    for (int d = 0; d < 10; d++)
        *cows += sc[d] < gc[d] ? sc[d] : gc[d];
}

int main(void) {
    int b, c;
    score("1807", "7810", &b, &c);
    printf("%d bull(s), %d cow(s)\n", b, c);
    return 0;
}
