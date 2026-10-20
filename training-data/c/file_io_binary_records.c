#include <stdio.h>

struct Rec { int id; double score; };

int main(void) {
    FILE *f = tmpfile();
    struct Rec out[3] = { {1, 9.5}, {2, 7.25}, {3, 8.0} };
    fwrite(out, sizeof out[0], 3, f);
    rewind(f);
    fseek(f, (long)sizeof(struct Rec), SEEK_SET);
    struct Rec r;
    fread(&r, sizeof r, 1, f);
    printf("%d %.2f size=%ld\n", r.id, r.score, (fseek(f, 0, SEEK_END), ftell(f)));
    fclose(f);
    return 0;
}
