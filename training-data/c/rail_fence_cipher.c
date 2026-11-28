#include <stdio.h>
#include <string.h>

static int rail_of(int i, int k) {
    int cycle = 2 * (k - 1);
    int r = i % cycle;
    return r < k ? r : cycle - r;
}

void encrypt(const char *t, int k, char *out) {
    int n = strlen(t), p = 0;
    for (int r = 0; r < k; r++)
        for (int i = 0; i < n; i++)
            if (rail_of(i, k) == r) out[p++] = t[i];
    out[p] = '\0';
}

void decrypt(const char *c, int k, char *out) {
    int n = strlen(c), p = 0;
    for (int r = 0; r < k; r++)
        for (int i = 0; i < n; i++)
            if (rail_of(i, k) == r) out[i] = c[p++];
    out[n] = '\0';
}

int main(void) {
    char c[64], d[64];
    encrypt("WEAREDISCOVERED", 3, c);
    decrypt(c, 3, d);
    printf("%s %s\n", c, d);
    return 0;
}
