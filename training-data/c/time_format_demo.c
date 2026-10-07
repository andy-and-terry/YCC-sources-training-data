#include <stdio.h>
#include <time.h>

int main(void) {
    struct tm t = {0};
    t.tm_year = 2024 - 1900;
    t.tm_mon = 1;      /* February */
    t.tm_mday = 29;
    t.tm_hour = 13;
    t.tm_min = 5;
    mktime(&t);        /* normalizes and fills tm_wday / tm_yday */

    char buf[64];
    strftime(buf, sizeof buf, "%Y-%m-%d %H:%M (%A)", &t);
    printf("%s, day of year %d\n", buf, t.tm_yday + 1);

    t.tm_mday += 30;   /* overflow rolls into the next month */
    mktime(&t);
    strftime(buf, sizeof buf, "%B %d, %Y", &t);
    printf("30 days later: %s\n", buf);
    return 0;
}
