#include <stdio.h>

#define LOG(level, fmt, ...) \
    fprintf(stdout, "[%s] %s:%d " fmt "\n", level, __func__, __LINE__, ##__VA_ARGS__)

static void work(int n) {
    LOG("INFO", "starting with n=%d", n);
    LOG("DEBUG", "no extra args");
}

int main(void) {
    work(3);
    return 0;
}
