def kind(x) {
    switch (x) {
        case 0..9: return 'digit'
        case String: return 'text'
        case [10, 20]: return 'round'
        default: return 'other'
    }
}
println([5, 'hi', 20, 99.5].collect { kind(it) })
