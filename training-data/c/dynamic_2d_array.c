#include <stdio.h>
#include <stdlib.h>

/* Allocate a rows x cols matrix as one contiguous block plus row pointers. */
static int **make_matrix(size_t rows, size_t cols) {
    int **m = malloc(rows * sizeof *m);
    int *data = calloc(rows * cols, sizeof *data);
    if (!m || !data) {
        free(m);
        free(data);
        return NULL;
    }
    for (size_t i = 0; i < rows; i++) m[i] = data + i * cols;
    return m;
}

static void free_matrix(int **m) {
    if (m) {
        free(m[0]);   /* the single data block */
        free(m);
    }
}

int main(void) {
    size_t rows = 3, cols = 4;
    int **m = make_matrix(rows, cols);
    if (!m) return 1;

    for (size_t i = 0; i < rows; i++)
        for (size_t j = 0; j < cols; j++)
            m[i][j] = (int)(i * cols + j);

    for (size_t i = 0; i < rows; i++) {
        for (size_t j = 0; j < cols; j++) printf("%3d", m[i][j]);
        printf("\n");
    }
    free_matrix(m);

    /* C99 variable length array / pointer to array for contiguous storage */
    int (*grid)[cols] = malloc(rows * sizeof *grid);
    if (!grid) return 1;
    grid[2][3] = 99;
    printf("grid[2][3] = %d\n", grid[2][3]);
    free(grid);
    return 0;
}
