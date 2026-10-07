#include <stdio.h>
#include <string.h>

int main(void) {
    const char *path = "/usr/local/lib/libexample.so.1";

    const char *first_slash = strchr(path, '/');
    const char *last_slash = strrchr(path, '/');
    const char *dot = strstr(path, ".so");

    printf("first '/' at %td\n", first_slash - path);
    printf("last '/' at %td, filename: %s\n", last_slash - path, last_slash + 1);
    printf(".so found at %td\n", dot - path);

    printf("span of lowercase letters in \"abc123\": %zu\n",
           strspn("abc123", "abcdefghijklmnopqrstuvwxyz"));
    printf("chars before first digit in \"abc123\": %zu\n",
           strcspn("abc123", "0123456789"));
    printf("missing: %s\n", strstr(path, "xyz") ? "found" : "not found");
    return 0;
}
