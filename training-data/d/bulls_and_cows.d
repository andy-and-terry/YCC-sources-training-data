// Bulls and Cows scoring for equal-length digit strings.
import std.algorithm : min;
import std.stdio;
import std.typecons : tuple;

auto score(string secret, string guess) {
    int bulls = 0, cows = 0;
    int[10] sc, gc;
    foreach (i; 0 .. secret.length) {
        if (secret[i] == guess[i]) bulls++;
        else { sc[secret[i] - '0']++; gc[guess[i] - '0']++; }
    }
    foreach (d; 0 .. 10) cows += min(sc[d], gc[d]);
    return tuple(bulls, cows);
}

void main() {
    auto r = score("1807", "7810");
    writefln("%d bull(s), %d cow(s)", r[0], r[1]);
}
