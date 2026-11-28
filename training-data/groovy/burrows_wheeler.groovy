def bwt(String s) {
    (0..<s.size()).collect { s[it..-1] + s[0..<it] }.sort().collect { it[-1] }.join()
}
println bwt('banana$')
