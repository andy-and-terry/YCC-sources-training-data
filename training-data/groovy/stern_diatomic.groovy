List<Integer> stern(int count) {
    def seq = [0, 1]
    (2..<count).each { i ->
        seq << (i % 2 == 0 ? seq[i.intdiv(2)] : seq[i.intdiv(2)] + seq[i.intdiv(2) + 1])
    }
    return seq.take(count)
}

println stern(15) // [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3]
