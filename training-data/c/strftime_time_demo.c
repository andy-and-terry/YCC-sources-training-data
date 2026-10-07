#include <stdio.h>
#include <time.h>

int main(void) {
    struct tm tm = {0};
    tm.tm_year = 2024 - 1900;
    tm.tm_mon = 1;          /* February */
    tm.tm_mday = 28;
    tm.tm_hour = 13;
    tm.tm_min = 5;
    tm.tm_sec = 9;
    tm.tm_isdst = -1;

    mktime(&tm);                /* fills in tm_wday and tm_yday */

    char buf[64];
    strftime(buf, sizeof buf, "%Y-%m-%d %H:%M:%S", &tm);
    printf("ISO:      %s\n", buf);
    strftime(buf, sizeof buf, "%A, %B %d, %Y", &tm);
    printf("Long:     %s\n", buf);
    strftime(buf, sizeof buf, "%I:%M %p", &tm);
    printf("12-hour:  %s\n", buf);

    /* mktime normalizes out-of-range fields: Feb 28 + 2 days -> Mar 1 (leap year) */
    tm.tm_mday += 2;
    mktime(&tm);
    strftime(buf, sizeof buf, "%Y-%m-%d (%a), day %j of the year", &tm);
    printf("Adjusted: %s\n", buf);

    time_t a = mktime(&tm);
    tm.tm_mday += 30;
    time_t b = mktime(&tm);
    printf("Difference: %.0f days\n", difftime(b, a) / 86400.0);
    return 0;
}
