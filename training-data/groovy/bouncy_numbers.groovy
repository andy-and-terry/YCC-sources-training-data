// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
def isBouncy = { int n ->
    def d = n.toString().toList()
    d != d.sort(false) && d != d.sort(false).reverse()
}

println((1..<1000).count(isBouncy))
