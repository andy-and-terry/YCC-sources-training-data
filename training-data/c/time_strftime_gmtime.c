#include <stdio.h>
#include <time.h>

int main(void) {
    time_t t = 86400L * 365;
    struct tm tm;
    gmtime_r(&t, &tm);
    char buf[64];
    strftime(buf, sizeof buf, "%Y-%m-%d %H:%M:%S %a", &tm);
    puts(buf);
    tm.tm_mday += 45;
    timegm(&tm);
    strftime(buf, sizeof buf, "%b %d", &tm);
    puts(buf);
    return 0;
}
