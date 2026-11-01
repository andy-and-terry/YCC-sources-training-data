#include <stdio.h>
#include <string.h>

#define MAXSUM 400

/* Greedy sequence whose pairwise sums are all distinct. */
int main(void) {
    int seq[8], n = 0;
    char used[MAXSUM] = {0};
    for (int cand = 1; n < 8; cand++) {
        char fresh[MAXSUM] = {0};
        int ok = 1;
        seq[n] = cand;
        for (int i = 0; i <= n && ok; i++) {
            int s = seq[i] + cand;
            if (used[s] || fresh[s]) ok = 0;
            else fresh[s] = 1;
        }
        if (ok) {
            for (int s = 0; s < MAXSUM; s++) used[s] |= fresh[s];
            n++;
        }
    }
    for (int i = 0; i < 8; i++) printf("%d ", seq[i]);
    printf("\n");
    return 0;
}
