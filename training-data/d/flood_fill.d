import std.stdio;

void floodFill(int[][] img, int sr, int sc, int color) {
    int original = img[sr][sc];
    if (original == color) return;
    int[2][] queue = [[sr, sc]];
    img[sr][sc] = color;
    immutable int[4] dr = [1, -1, 0, 0];
    immutable int[4] dc = [0, 0, 1, -1];
    while (queue.length > 0) {
        auto cur = queue[0];
        queue = queue[1 .. $];
        foreach (k; 0 .. 4) {
            int nr = cur[0] + dr[k];
            int nc = cur[1] + dc[k];
            if (nr >= 0 && nr < img.length && nc >= 0 && nc < img[0].length && img[nr][nc] == original) {
                img[nr][nc] = color;
                queue ~= [nr, nc];
            }
        }
    }
}

void main() {
    int[][] img = [[1, 1, 0], [1, 0, 0], [1, 1, 1]];
    floodFill(img, 0, 0, 7);
    foreach (row; img)
        writeln(row);
}
