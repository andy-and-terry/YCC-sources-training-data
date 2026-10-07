#!/usr/bin/awk -f
# Reads one string per line; prints whether brackets are balanced.
function balanced(s,    i, c, sp, stack, open) {
    open[")"] = "("; open["]"] = "["; open["}"] = "{"
    sp = 0
    for (i = 1; i <= length(s); i++) {
        c = substr(s, i, 1)
        if (c == "(" || c == "[" || c == "{") stack[++sp] = c
        else if (c in open) {
            if (sp == 0 || stack[sp] != open[c]) return 0
            sp--
        }
    }
    return sp == 0
}
{ print $0 ": " (balanced($0) ? "balanced" : "unbalanced") }
