import std.stdio;

struct Countdown {
    int start;

    int opApply(scope int delegate(int) dg) {
        int result = 0;
        for (int i = start; i > 0; i--) {
            result = dg(i);
            if (result) break;
        }
        return result;
    }
}

void main() {
    auto countdown = Countdown(5);
    foreach (n; countdown) {
        writeln(n);
    }
}
