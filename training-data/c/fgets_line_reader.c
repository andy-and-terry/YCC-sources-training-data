#include <stdio.h>
#include <string.h>

int main(void) {
    const char *text = "alpha\nbeta gamma\n\ndelta\n";
    FILE *f = tmpfile();
    if (!f) return 1;
    fputs(text, f);
    rewind(f);
    char line[64];
    int n = 0;
    while (fgets(line, sizeof line, f)) {
        line[strcspn(line, "\n")] = '\0';
        printf("%d: [%s]\n", ++n, line);
    }
    fclose(f);
    return 0;
}
