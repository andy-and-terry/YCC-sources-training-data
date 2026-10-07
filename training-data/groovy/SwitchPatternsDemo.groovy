def classify(x) {
    switch (x) {
        case null:
            return 'null'
        case 0:
            return 'zero'
        case 1..9:
            return 'single digit'
        case [10, 20, 30]:
            return 'round number'
        case Integer:
            return 'some other integer'
        case ~/h.*o/:
            return 'matches h...o'
        case String:
            return "string '${x}'"
        case { it instanceof List && it.size() > 2 }:
            return 'long list'
        case List:
            return 'short list'
        case BigDecimal:
            return 'decimal'
        default:
            return 'unknown'
    }
}

[null, 0, 5, 20, 99, 'hello', 'hi', [1, 2, 3], [1], 2.5G, new Object()].each {
    println "${it.getClass().simpleName.padRight(12)} -> ${classify(it)}"
}

def grade = 85
switch (grade) {
    case { it >= 90 }: println 'A'; break
    case 80..89: println 'B'; break
    default: println 'lower'
}
