#define _DEFAULT_SOURCE
#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

static int cmp(const void *a, const void *b) {
    return strcmp(*(const char *const *)a, *(const char *const *)b);
}

int main(void) {
    char dir[] = "/tmp/readdir_demoXXXXXX";
    if (!mkdtemp(dir)) { perror("mkdtemp"); return 1; }

    const char *names[] = {"zeta.txt", "alpha.txt", "mid.log"};
    for (int i = 0; i < 3; i++) {
        char path[128];
        snprintf(path, sizeof path, "%s/%s", dir, names[i]);
        FILE *f = fopen(path, "w");
        if (f) { fputs("x", f); fclose(f); }
    }

    DIR *d = opendir(dir);
    if (!d) { perror("opendir"); return 1; }
    char *list[16];
    size_t n = 0;
    struct dirent *e;
    while ((e = readdir(d)) != NULL && n < 16) {
        if (e->d_name[0] == '.') continue;      /* skip . and .. */
        list[n++] = strdup(e->d_name);
    }
    closedir(d);

    qsort(list, n, sizeof list[0], cmp);        /* readdir order is unspecified */
    for (size_t i = 0; i < n; i++) {
        char path[128];
        struct stat st;
        snprintf(path, sizeof path, "%s/%s", dir, list[i]);
        if (stat(path, &st) == 0)
            printf("%-10s %ld bytes\n", list[i], (long)st.st_size);
        unlink(path);
        free(list[i]);
    }
    rmdir(dir);
    return 0;
}
