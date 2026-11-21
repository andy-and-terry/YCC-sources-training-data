// Disarium numbers: digits raised to their 1-based positions sum to n.
def isDisarium = { int n ->
    n.toString().toList().withIndex().sum { c, i -> (c as int) ** (i + 1) } == n
}

println((1..<1000).findAll(isDisarium).join(' '))
