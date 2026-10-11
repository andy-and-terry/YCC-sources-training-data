#include <stdio.h>

int main(void) {
    FILE *f = tmpfile();
    if (!f) return 1;
    fputs("0123456789ABCDEF", f);
    fseek(f, 0, SEEK_END);
    long size = ftell(f);
    fseek(f, -4, SEEK_END);
    char tail[5] = {0};
    fread(tail, 1, 4, f);
    fseek(f, 3, SEEK_SET);
    int c = fgetc(f);
    printf("size=%ld tail=%s char@3=%c\n", size, tail, c);
    fclose(f);
    return 0;
}
