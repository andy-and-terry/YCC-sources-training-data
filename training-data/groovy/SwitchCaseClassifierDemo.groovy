def classify(x) {
    switch (x) {
        case null: return 'null'
        case 0: return 'zero'
        case Integer: return x > 0 ? 'positive int' : 'negative int'
        case BigDecimal: return 'decimal'
        case ~/\d+/: return 'digit string'
        case String: return 'string'
        case { it instanceof List && it.isEmpty() }: return 'empty list'
        case List: return "list of ${x.size()}"
        case Map: return 'map'
        default: return 'unknown'
    }
}

[null, 0, 7, -3, 1.5, '123', 'abc', [], [1, 2], [a: 1], new Date()].each {
    println "${it} -> ${classify(it)}"
}

def grade(score) {
    switch (score) {
        case 90..100: 'A'; break
        case 80..<90: 'B'; break
        default: 'C'
    }
}
println([95, 85, 50].collect { grade(it) })

println([3, 20, 50].collect { n ->
    switch (n) {
        case 1..5: return 'small'
        case [10, 20, 30]: return 'round'
        default: return 'other'
    }
})
