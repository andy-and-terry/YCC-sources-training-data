def kind(x) {
    switch (x) {
        case Integer: return 'int'
        case ~/\d+/: return 'digits'
        case [1, 2]: return 'small'
        case { it.toString().size() > 3 }: return 'long'
        default: return 'other'
    }
}
println([1, '42', 2.5, 'abcdef'].collect { kind(it) })
