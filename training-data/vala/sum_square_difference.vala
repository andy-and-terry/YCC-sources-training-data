// Square of the sum minus sum of squares for 1..10 (expect 2640)
void main () {
    int sum = 0;
    int squares = 0;
    for (int i = 1; i <= 10; i++) {
        sum += i;
        squares += i * i;
    }
    stdout.printf ("%d\n", sum * sum - squares);
}
