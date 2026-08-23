#include <stdio.h>

int main(void) {
    FILE *f = fopen("/tmp/c_file_io_demo.txt", "w");
    if (!f) return 1;
    fprintf(f, "hello\nworld\n");
    fclose(f);

    f = fopen("/tmp/c_file_io_demo.txt", "r");
    if (!f) return 1;
    char line[64];
    while (fgets(line, sizeof(line), f)) {
        printf("read: %s", line);
    }
    fclose(f);
    remove("/tmp/c_file_io_demo.txt");
    return 0;
}
