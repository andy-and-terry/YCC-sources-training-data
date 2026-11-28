def encode(String text, int rails) {
    def rows = (0..<rails).collect { new StringBuilder() }
    int r = 0, step = 1
    text.each { ch ->
        rows[r] << ch
        if (r == 0) step = 1
        else if (r == rails - 1) step = -1
        r += step
    }
    rows.join('')
}

println encode('WEAREDISCOVERED', 3)
