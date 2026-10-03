#include <stdio.h>

typedef struct {
    int id;
    double score;
} Record;

int main(void) {
    const char *path = "/tmp/binary_file_io_demo.bin";
    Record records[] = {{1, 91.5}, {2, 82.25}, {3, 77.0}};
    size_t n = sizeof(records) / sizeof(records[0]);

    FILE *out = fopen(path, "wb");
    if (!out) {
        perror("fopen");
        return 1;
    }
    fwrite(records, sizeof(Record), n, out);
    fclose(out);

    Record loaded[3];
    FILE *in = fopen(path, "rb");
    if (!in) {
        perror("fopen");
        return 1;
    }
    size_t read_count = fread(loaded, sizeof(Record), n, in);
    fclose(in);

    for (size_t i = 0; i < read_count; i++) {
        printf("id=%d score=%.2f\n", loaded[i].id, loaded[i].score);
    }
    remove(path);
    return 0;
}
