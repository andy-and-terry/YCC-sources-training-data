BEGIN {
    seq[0] = 0; seq[1] = 1
    for (i = 2; i < 15; i++) {
        h = int(i / 2)
        seq[i] = (i % 2 == 0) ? seq[h] : seq[h] + seq[h + 1]
    }
    for (i = 0; i < 15; i++) printf "%d ", seq[i]
    print "" # 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
}
