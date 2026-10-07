#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char id;
    int deadline, profit;
} job;

static int by_profit_desc(const void *a, const void *b) { return ((const job *)b)->profit - ((const job *)a)->profit; }

int main(void) {
    job jobs[] = {{'a', 2, 100}, {'b', 1, 19}, {'c', 2, 27}, {'d', 1, 25}, {'e', 3, 15}};
    int n = sizeof jobs / sizeof jobs[0], max_d = 0;
    qsort(jobs, (size_t)n, sizeof *jobs, by_profit_desc);
    for (int i = 0; i < n; i++)
        if (jobs[i].deadline > max_d) max_d = jobs[i].deadline;
    char slots[16] = {0};
    int profit = 0;
    for (int i = 0; i < n; i++)
        for (int t = jobs[i].deadline; t > 0; t--)
            if (!slots[t]) {
                slots[t] = jobs[i].id;
                profit += jobs[i].profit;
                break;
            }
    printf("schedule:");
    for (int t = 1; t <= max_d; t++)
        if (slots[t]) printf(" %c", slots[t]);
    printf("  profit=%d\n", profit);
    return 0;
}
