#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

/* rename() moves or renames a file atomically on the same filesystem;
 * remove() deletes it. Both return 0 on success. */
static void write_text(const char *path, const char *text) {
    FILE *f = fopen(path, "w");
    if (!f) { perror("fopen"); exit(1); }
    fputs(text, f);
    fclose(f);
}

int main(void) {
    const char *old_name = "rename_demo_old.txt";
    const char *new_name = "rename_demo_new.txt";

    write_text(old_name, "hello rename\n");

    if (rename(old_name, new_name) != 0) {
        perror("rename");
        return 1;
    }
    printf("renamed %s -> %s\n", old_name, new_name);

    /* the old name is gone */
    FILE *f = fopen(old_name, "r");
    printf("old name opens: %s\n", f ? "yes" : "no");
    if (f) fclose(f);

    /* renaming a missing file reports ENOENT */
    if (rename(old_name, "other.txt") != 0)
        printf("second rename failed: %s\n", strerror(errno));

    if (remove(new_name) == 0)
        printf("removed %s\n", new_name);
    return 0;
}
