def classify(x) {
    switch (x) {
        case null:              return 'null'
        case 0:                 return 'zero'
        case 1..9:              return 'single digit'
        case [10, 20, 30]:      return 'round number'
        case Integer:           return 'other integer'
        case ~/^\d+$/:          return 'numeric string'
        case String:            return 'string'
        case { it instanceof List && it.size() > 2 }:
                                return 'long list'
        case List:              return 'short list'
        case Map:               return 'map'
        default:                return "unknown: ${x.getClass().simpleName}"
    }
}

[null, 0, 5, 20, 1234, '987', 'hello', [1, 2, 3], [1], [a: 1], 3.5d].each {
    println "${it.inspect().padRight(12)} -> ${classify(it)}"
}

def grade = 82
def letter = switch (grade) {
    case 90..100 -> 'A'
    case 80..<90 -> 'B'
    default      -> 'C'
}
println letter
