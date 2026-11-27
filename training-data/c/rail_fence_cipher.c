#include <stdio.h>
#include <string.h>

void encode(const char *text, int rails, char *out) {
    int n = (int)strlen(text), k = 0;
    for (int row = 0; row < rails; row++) {
        int r = 0, step = 1;
        for (int i = 0; i < n; i++) {
            if (r == row) out[k++] = text[i];
            if (r == 0) step = 1;
            else if (r == rails - 1) step = -1;
            r += step;
        }
    }
    out[k] = '\0';
}

int main(void) {
    char out[64];
    encode("WEAREDISCOVERED", 3, out);
    puts(out);
    return 0;
}
