import std.stdio;
import std.algorithm : max;

int rodCutting(int[] prices, int length) {
    auto best = new int[](length + 1);

    foreach (n; 1 .. length + 1) {
        foreach (cut; 1 .. n + 1) {
            int revenue = prices[cut - 1] + best[n - cut];
            best[n] = max(best[n], revenue);
        }
    }

    return best[length];
}

void main() {
    auto prices = [1, 5, 8, 9, 10, 17, 17, 20];
    writeln(rodCutting(prices, 4));
    writeln(rodCutting(prices, 8));
}
