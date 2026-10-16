import std.stdio;

struct Grid {
    int w, h;
    int[] data;

    this(int w, int h) {
        this.w = w;
        this.h = h;
        data = new int[w * h];
    }

    ref int opIndex(size_t x, size_t y) {
        return data[y * w + x];
    }
}

void main() {
    auto g = Grid(3, 2);
    g[1, 1] = 5;
    g[2, 0] = 7;
    g[1, 1] += 10;
    writeln(g.data);
    writeln(g[1, 1]);
}
