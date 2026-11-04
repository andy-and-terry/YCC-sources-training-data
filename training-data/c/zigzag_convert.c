#include <stdio.h>
#include <string.h>

void zigzag(const char *s, int rows, char *out) {
    int n = strlen(s), k = 0;
    if (rows == 1 || rows >= n) { strcpy(out, s); return; }
    int cycle = 2 * (rows - 1);
    for (int r = 0; r < rows; r++)
        for (int i = r; i < n; i += cycle) {
            out[k++] = s[i];
            int diag = i + cycle - 2 * r;
            if (r > 0 && r < rows - 1 && diag < n) out[k++] = s[diag];
        }
    out[k] = '\0';
}

int main(void) {
    char out[64];
    zigzag("PAYPALISHIRING", 3, out);
    puts(out);
    return 0;
}
