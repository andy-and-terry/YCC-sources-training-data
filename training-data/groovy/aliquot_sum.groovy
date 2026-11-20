// Aliquot sum classification with a switch.
[6, 12, 15, 28].each { n ->
    def a = (1..<n).findAll { n % it == 0 }.sum()
    def kind = a == n ? 'perfect' : a > n ? 'abundant' : 'deficient'
    println "$n $a $kind"
}
