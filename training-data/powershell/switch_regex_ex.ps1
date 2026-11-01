foreach ($s in 'apple', 'banana42', 'x') {
    switch -Regex ($s) {
        '^\d+$'   { "$s is numeric"; break }
        '\d'      { "$s contains a digit"; break }
        '^a'      { "$s starts with a"; break }
        default   { "$s other" }
    }
}
