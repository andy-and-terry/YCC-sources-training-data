def railFence(String s, int rails) {
    def rows = (0..<rails).collect { new StringBuilder() }
    int r = 0, dir = 1
    s.each { ch ->
        rows[r] << ch
        if (r == 0) dir = 1
        if (r == rails - 1) dir = -1
        r += dir
    }
    rows.join('')
}

println railFence('WEAREDISCOVERED', 3)
