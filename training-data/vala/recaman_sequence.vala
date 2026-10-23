void main() {
    bool[] seen = new bool[256];
    int prev = 0;
    seen[0] = true;
    stdout.printf("%d", prev);
    for (int i = 1; i < 20; i++) {
        int next = prev - i;
        if (next <= 0 || seen[next]) {
            next = prev + i;
        }
        seen[next] = true;
        prev = next;
        stdout.printf(" %d", next);
    }
    stdout.printf("\n");
}
