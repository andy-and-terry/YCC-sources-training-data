def classify(x) {
    switch (x) {
        case 0: return "zero"
        case 1..9: return "digit"
        case [10, 20, 30]: return "round"
        case Integer: return "big int"
        case ~/^h.*/: return "starts with h"
        case String: return "string"
        case { it instanceof List && it.size() > 2 }: return "long list"
        case null: return "null"
        default: return "unknown"
    }
}

[0, 5, 20, 99, "hello", "world", [1, 2, 3], null, 2.5].each {
    println "${it} -> ${classify(it)}"
}
