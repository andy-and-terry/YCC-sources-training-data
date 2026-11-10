void main () {
    const int LIMIT = 80;
    bool[] composite = new bool[LIMIT + 1];
    for (int i = 2; i * i <= LIMIT; i++)
        if (!composite[i])
            for (int j = i * i; j <= LIMIT; j += i) composite[j] = true;
    for (int p = 3; p + 2 <= LIMIT; p++)
        if (!composite[p] && !composite[p + 2]) print ("(%d,%d) ", p, p + 2);
    print ("\n"); // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
}
