int n = 8
n.times { r ->
    print ' ' * (n - r - 1)
    (0..r).each { c -> print((r & c) == c ? '* ' : '  ') }
    println()
}
