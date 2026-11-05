foreach ($f in 'a.txt', 'b.log', 'c.md') {
    switch -Wildcard ($f) {
        '*.txt' { "$f text"; break }
        '*.log' { "$f log"; break }
        default { "$f other" }
    }
}
