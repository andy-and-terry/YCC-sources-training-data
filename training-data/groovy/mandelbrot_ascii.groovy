int escape(double cr, double ci) {
    double zr = 0, zi = 0
    for (int n = 0; n < 30; n++) {
        if (zr * zr + zi * zi >= 4) return n
        (zr, zi) = [zr * zr - zi * zi + cr, 2 * zr * zi + ci]
    }
    30
}

(-5..5).each { yi ->
    println (-40..12).collect { xi -> escape(xi / 20d, yi / 5d) == 30 ? '#' : '.' }.join()
}
