// P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
def a = 0G
def b = 1G
15.times { i ->
    println "P($i) = $a"
    (a, b) = [b, 2 * b + a]
}
