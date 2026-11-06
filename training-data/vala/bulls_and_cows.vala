// Bulls and Cows scoring for equal-length digit strings.
void score (string secret, string guess, out int bulls, out int cows) {
    bulls = 0;
    cows = 0;
    int[] sc = new int[10];
    int[] gc = new int[10];
    for (int i = 0; i < secret.length; i++) {
        if (secret[i] == guess[i]) {
            bulls++;
        } else {
            sc[secret[i] - '0']++;
            gc[guess[i] - '0']++;
        }
    }
    for (int d = 0; d < 10; d++) cows += int.min (sc[d], gc[d]);
}

void main () {
    int b, c;
    score ("1807", "7810", out b, out c);
    print ("%d bull(s), %d cow(s)\n", b, c);
}
