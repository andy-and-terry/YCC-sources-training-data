#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <string.h>

int main(void) {
    const char *path = "/tmp/mmap_file_demo.txt";
    const char *message = "hello from mmap";

    int fd = open(path, O_CREAT | O_RDWR | O_TRUNC, 0644);
    if (fd == -1) {
        perror("open");
        return 1;
    }

    size_t len = strlen(message);
    if (ftruncate(fd, (off_t)len) == -1) {
        perror("ftruncate");
        close(fd);
        return 1;
    }

    char *mapped = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (mapped == MAP_FAILED) {
        perror("mmap");
        close(fd);
        return 1;
    }

    memcpy(mapped, message, len);
    msync(mapped, len, MS_SYNC);

    printf("wrote via mmap: %.*s\n", (int)len, mapped);

    munmap(mapped, len);
    close(fd);
    unlink(path);
    return 0;
}
