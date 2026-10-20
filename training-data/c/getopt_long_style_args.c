#include <stdio.h>
#include <unistd.h>

int main(int argc, char **argv) {
    int opt, verbose = 0;
    const char *out = "a.out";
    while ((opt = getopt(argc, argv, "vo:")) != -1) {
        switch (opt) {
        case 'v': verbose++; break;
        case 'o': out = optarg; break;
        default: fprintf(stderr, "usage: %s [-v] [-o file] args\n", argv[0]); return 2;
        }
    }
    printf("verbose=%d out=%s rest=%d\n", verbose, out, argc - optind);
    return 0;
}
