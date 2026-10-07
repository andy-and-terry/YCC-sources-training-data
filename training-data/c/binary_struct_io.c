#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Record {
    int id;
    char name[16];
    double score;
};

int main(void) {
    const char *path = "records.bin";
    struct Record out[] = {
        {1, "alpha", 91.5},
        {2, "beta", 78.25},
        {3, "gamma", 85.0},
    };
    size_t count = sizeof out / sizeof out[0];

    FILE *f = fopen(path, "wb");
    if (!f) { perror("fopen"); return 1; }
    if (fwrite(out, sizeof out[0], count, f) != count) { perror("fwrite"); fclose(f); return 1; }
    fclose(f);

    f = fopen(path, "rb");
    if (!f) { perror("fopen"); return 1; }

    /* Random access: jump straight to the second record */
    struct Record rec;
    fseek(f, (long)sizeof rec * 1, SEEK_SET);
    if (fread(&rec, sizeof rec, 1, f) == 1)
        printf("record 2: id=%d name=%s score=%.2f\n", rec.id, rec.name, rec.score);

    fseek(f, 0, SEEK_END);
    printf("file holds %ld records\n", ftell(f) / (long)sizeof rec);
    fclose(f);

    remove(path);
    return 0;
}
