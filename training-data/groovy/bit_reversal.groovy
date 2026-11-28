int reverseBits(int value, int width = 8) {
    String bin = Integer.toBinaryString(value).padLeft(width, '0')
    return Integer.parseInt(bin.reverse(), 2)
}

[1, 6, 13, 128].each { println "$it ${reverseBits(it)}" } // 128 96 176 1
