#include <stdio.h>
#include <string.h>

int main(void) {
    FILE *f = fopen("/etc/hostname", "r");
    if (!f) { perror("fopen"); return 1; }
    char line[256];
    int n = 0;
    while (fgets(line, sizeof line, f)) {
        line[strcspn(line, "\n")] = 0;
        printf("%d: %s\n", ++n, line);
    }
    fclose(f);
    return 0;
}
