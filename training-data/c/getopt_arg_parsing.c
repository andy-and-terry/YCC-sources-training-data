#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int verbose = 0;
    char *name = "world";
    int count = 1;
    int opt;

    while ((opt = getopt(argc, argv, "vn:c:")) != -1) {
        switch (opt) {
            case 'v':
                verbose = 1;
                break;
            case 'n':
                name = optarg;
                break;
            case 'c':
                count = atoi(optarg);
                break;
            default:
                fprintf(stderr, "usage: %s [-v] [-n name] [-c count]\n", argv[0]);
                return 1;
        }
    }

    for (int i = 0; i < count; i++) {
        if (verbose) {
            printf("[verbose] greeting %d: ", i + 1);
        }
        printf("Hello, %s!\n", name);
    }
    return 0;
}
