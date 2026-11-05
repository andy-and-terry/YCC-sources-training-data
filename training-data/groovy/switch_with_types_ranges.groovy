def kind(x) {
    switch (x) {
        case 0..9: return 'digit'
        case ~/[a-z]+/: return 'lower word'
        case String: return 'string'
        case [10, 20]: return 'ten or twenty'
        default: return 'other'
    }
}
println([5, 'abc', 'ABC', 20, 3.5].collect { kind(it) })
