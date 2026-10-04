#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

static void usage(const char *prog) {
    fprintf(stderr, "usage: %s [-v] [-n count] [-o file] [args...]\n", prog);
}

int main(int argc, char **argv) {
    int verbose = 0;
    int count = 1;
    const char *outfile = "stdout";
    int opt;

    while ((opt = getopt(argc, argv, "vn:o:h")) != -1) {
        switch (opt) {
        case 'v': verbose = 1; break;
        case 'n': count = atoi(optarg); break;
        case 'o': outfile = optarg; break;
        case 'h': usage(argv[0]); return 0;
        default:  usage(argv[0]); return 2;
        }
    }

    printf("verbose=%d count=%d output=%s\n", verbose, count, outfile);
    for (int i = optind; i < argc; i++)
        printf("positional[%d]=%s\n", i - optind, argv[i]);
    return 0;
}
