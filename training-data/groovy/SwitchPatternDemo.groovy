// Groovy's switch does class/range/regex/collection matching via `isCase()`,
// well beyond Java's plain equality switch. Matches are tried top to bottom,
// so more specific patterns (regex, list membership, range) are placed
// before the generic class checks, the same order Groovy's own docs use.
def classify(def value) {
    switch (value) {
        case ~/^[a-z]+@[a-z]+\.com$/:
            return "an email address"
        case [1, 2, 3]:
            return "in the list [1, 2, 3]"
        case 1..10:
            return "in range 1..10"
        case Integer:
            return "an Integer"
        case String:
            return "a String"
        default:
            return "something else"
    }
}

["hello", 5, 42, "user@example.com", 3.14, 2].each {
    println "${it} -> ${classify(it)}"
}
