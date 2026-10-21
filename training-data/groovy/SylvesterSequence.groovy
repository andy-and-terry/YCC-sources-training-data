// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
BigInteger s = 2
(0..<8).each { i ->
    println "s($i) = $s"
    s = s * s - s + 1
}
