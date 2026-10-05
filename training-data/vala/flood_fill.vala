void flood_fill(int[,] image, int row, int col, int new_color) {
    int old = image[row, col];
    if (old == new_color) return;

    int rows = image.length[0];
    int cols = image.length[1];
    var queue = new Queue<int>();
    queue.push_tail(row * cols + col);

    while (!queue.is_empty()) {
        int idx = queue.pop_head();
        int r = idx / cols;
        int c = idx % cols;
        if (image[r, c] != old) continue;
        image[r, c] = new_color;
        if (r + 1 < rows) queue.push_tail((r + 1) * cols + c);
        if (r > 0) queue.push_tail((r - 1) * cols + c);
        if (c + 1 < cols) queue.push_tail(r * cols + c + 1);
        if (c > 0) queue.push_tail(r * cols + c - 1);
    }
}

void main() {
    int[,] image = { { 1, 1, 0 }, { 1, 0, 0 }, { 1, 1, 1 } };
    flood_fill(image, 0, 0, 7);
    for (int r = 0; r < 3; r++) {
        for (int c = 0; c < 3; c++) stdout.printf("%d ", image[r, c]);
        stdout.printf("\n");
    }
}
