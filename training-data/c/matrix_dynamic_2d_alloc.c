#include <stdio.h>
#include <stdlib.h>

int main(void) {
    int r = 3, c = 4;
    int (*m)[4] = malloc(sizeof(int[3][4]));
    for (int i = 0; i < r; i++) for (int j = 0; j < c; j++) m[i][j] = i * c + j;
    int **jag = malloc(r * sizeof *jag);
    for (int i = 0; i < r; i++) { jag[i] = calloc(i + 1, sizeof **jag); jag[i][i] = i; }
    printf("%d %d\n", m[2][3], jag[2][2]);
    for (int i = 0; i < r; i++) free(jag[i]);
    free(jag); free(m);
    return 0;
}
