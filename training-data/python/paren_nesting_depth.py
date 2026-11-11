"""Maximum nesting depth of parentheses; -1 if the string is unbalanced."""


def max_depth(s):
    depth = best = 0
    for ch in s:
        if ch == "(":
            depth += 1
            best = max(best, depth)
        elif ch == ")":
            depth -= 1
            if depth < 0:
                return -1
    return best if depth == 0 else -1


print(max_depth("(1+(2*(3)))"), max_depth("(()"))
