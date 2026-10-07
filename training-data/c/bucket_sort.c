#include <stdio.h>

#define N 10
#define NUM_BUCKETS 5

void bucket_sort(float arr[], int n) {
    float buckets[NUM_BUCKETS][N];
    int bucket_count[NUM_BUCKETS] = {0};

    for (int i = 0; i < n; i++) {
        int idx = (int)(arr[i] * NUM_BUCKETS);
        if (idx >= NUM_BUCKETS) idx = NUM_BUCKETS - 1;
        buckets[idx][bucket_count[idx]++] = arr[i];
    }

    for (int b = 0; b < NUM_BUCKETS; b++) {
        for (int i = 1; i < bucket_count[b]; i++) {
            float key = buckets[b][i];
            int j = i - 1;
            while (j >= 0 && buckets[b][j] > key) {
                buckets[b][j + 1] = buckets[b][j];
                j--;
            }
            buckets[b][j + 1] = key;
        }
    }

    int pos = 0;
    for (int b = 0; b < NUM_BUCKETS; b++) {
        for (int i = 0; i < bucket_count[b]; i++) {
            arr[pos++] = buckets[b][i];
        }
    }
}

int main(void) {
    float arr[N] = {0.78f, 0.17f, 0.39f, 0.26f, 0.72f, 0.94f, 0.21f, 0.12f, 0.23f, 0.68f};

    bucket_sort(arr, N);

    for (int i = 0; i < N; i++) printf("%.2f ", arr[i]);
    printf("\n");
    return 0;
}
