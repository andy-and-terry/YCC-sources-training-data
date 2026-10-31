int alternatingDigitSum(int n) {
    n.toString().reverse().toList().withIndex().sum { d, i ->
        (i % 2 == 0 ? 1 : -1) * Integer.parseInt(d)
    } as int
}

[1234, 99999, 1000].each { println "$it ${alternatingDigitSum(it)}" }
