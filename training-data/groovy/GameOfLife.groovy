def step(Set cells) {
    def counts = [:].withDefault { 0 }
    cells.each { x, y ->
        [-1, 0, 1].each { dx ->
            [-1, 0, 1].each { dy ->
                if (dx || dy) counts[[x + dx, y + dy]]++
            }
        }
    }
    counts.findAll { cell, n -> n == 3 || (n == 2 && cell in cells) }.keySet()
}

def show(Set cells) {
    (0..4).each { y -> println((0..4).collect { x -> [x, y] in cells ? '#' : '.' }.join()) }
    println()
}

Set cells = [[1, 2], [2, 2], [3, 2]] as Set
3.times {
    show(cells)
    cells = step(cells)
}
