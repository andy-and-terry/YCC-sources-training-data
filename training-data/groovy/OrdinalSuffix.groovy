String ordinal(int n) {
    def suffix
    switch (n % 10) {
        case 1: suffix = 'st'; break
        case 2: suffix = 'nd'; break
        case 3: suffix = 'rd'; break
        default: suffix = 'th'
    }
    if (n % 100 in 11..13) suffix = 'th'
    "$n$suffix"
}

println([1, 2, 3, 4, 11, 12, 13, 21, 101, 111].collect { ordinal(it) }.join(' '))
