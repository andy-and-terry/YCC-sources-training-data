def classify(x) {
    switch (x) {
        case null:               return 'null'
        case Integer:            return x > 100 ? 'big int' : 'int'
        case ~/^\d+$/:           return 'numeric string'
        case String:             return 'string'
        case 1..5:               return 'in range'
        case [10, 20, 30]:       return 'in list'
        case { it instanceof List && it.size() > 2 }: return 'long list'
        default:                 return 'other'
    }
}

[null, 7, 500, '42', 'hi', 3.0, [1, 2, 3], 4.5d].each {
    println "${it} -> ${classify(it)}"
}
