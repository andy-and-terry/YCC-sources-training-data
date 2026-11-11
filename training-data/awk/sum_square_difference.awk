# Square of the sum minus sum of squares for 1..10 (expect 2640)
BEGIN {
    for (i = 1; i <= 10; i++) { sum += i; squares += i * i }
    print sum * sum - squares
}
