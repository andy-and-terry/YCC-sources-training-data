def grayCode(int n) {
    (0..<(1 << n)).collect { it ^ (it >> 1) }
}

grayCode(3).each { println Integer.toBinaryString(it).padLeft(3, '0') }

println Integer.bitCount(0b101101)
println 6 ^ 3
println 1 << 10
println(-16 >> 2)
println(-16 >>> 28)
println 0b1100 | 0b0011
println 12 & 10
println(~5)
println Integer.toHexString(255) + ' ' + Integer.parseInt('ff', 16)
