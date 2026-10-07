#!/usr/bin/awk -f
# Reads bracket strings from stdin, one per line, and reports whether
# each one is balanced.
function is_valid(s,    i, ch, top, stack) {
    top = 0
    for (i = 1; i <= length(s); i++) {
        ch = substr(s, i, 1)
        if (ch == "(" || ch == "[" || ch == "{") {
            stack[++top] = ch
        } else if (ch == ")" || ch == "]" || ch == "}") {
            if (top == 0) return 0
            if ((ch == ")" && stack[top] != "(") ||
                (ch == "]" && stack[top] != "[") ||
                (ch == "}" && stack[top] != "{")) return 0
            top--
        }
    }
    return top == 0
}
{
    print $0 ": " (is_valid($0) ? "valid" : "invalid")
}
