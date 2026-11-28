#include <stdio.h>
#include <ctype.h>

static int mod_inverse(int a, int m) {
    for (int x = 1; x < m; x++)
        if (a * x % m == 1) return x;
    return 0;
}

void affine(char *s, int a, int b, int decrypt) {
    int inv = mod_inverse(a, 26);
    for (; *s; s++) {
        if (isupper((unsigned char)*s)) {
            int x = *s - 'A';
            int y = decrypt ? ((inv * (x - b)) % 26 + 26) % 26 : (a * x + b) % 26;
            *s = 'A' + y;
        }
    }
}

int main(void) {
    char msg[] = "AFFINE";
    affine(msg, 5, 8, 0);
    printf("%s ", msg);
    affine(msg, 5, 8, 1);
    printf("%s\n", msg);
    return 0;
}
