#include <stdio.h>

static char grade(int score) {
    return score >= 90 ? 'A' :
           score >= 80 ? 'B' :
           score >= 70 ? 'C' :
           score >= 60 ? 'D' : 'F';
}

int main(void) {
    int scores[] = {95, 83, 71, 64, 12};
    for (int i = 0; i < 5; i++)
        printf("%d -> %c\n", scores[i], grade(scores[i]));
    return 0;
}
