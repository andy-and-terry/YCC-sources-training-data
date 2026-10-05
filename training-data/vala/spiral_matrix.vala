int[] spiral_order(int[,] m) {
    int[] result = {};
    int top = 0;
    int bottom = m.length[0] - 1;
    int left = 0;
    int right = m.length[1] - 1;

    while (top <= bottom && left <= right) {
        for (int c = left; c <= right; c++) result += m[top, c];
        top++;
        for (int r = top; r <= bottom; r++) result += m[r, right];
        right--;
        if (top <= bottom) {
            for (int c = right; c >= left; c--) result += m[bottom, c];
            bottom--;
        }
        if (left <= right) {
            for (int r = bottom; r >= top; r--) result += m[r, left];
            left++;
        }
    }
    return result;
}

void main() {
    int[,] grid = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } };
    foreach (int v in spiral_order(grid)) {
        stdout.printf("%d ", v);
    }
    stdout.printf("\n");
}
