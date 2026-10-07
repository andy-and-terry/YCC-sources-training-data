#include <stdio.h>

int start_station(const int *gas, const int *cost, int n) {
    int total = 0, tank = 0, start = 0;
    for (int i = 0; i < n; i++) {
        int d = gas[i] - cost[i];
        total += d;
        tank += d;
        if (tank < 0) {
            start = i + 1;
            tank = 0;
        }
    }
    return total < 0 ? -1 : start;
}

int main(void) {
    int g1[] = {1, 2, 3, 4, 5}, c1[] = {3, 4, 5, 1, 2};
    int g2[] = {2, 3, 4}, c2[] = {3, 4, 3};
    printf("%d %d\n", start_station(g1, c1, 5), start_station(g2, c2, 3));
    return 0;
}
