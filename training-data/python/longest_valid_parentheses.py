def longest_valid(s):
    stack = [-1]
    best = 0
    for i, c in enumerate(s):
        if c == "(":
            stack.append(i)
        else:
            stack.pop()
            if not stack:
                stack.append(i)
            else:
                best = max(best, i - stack[-1])
    return best


if __name__ == "__main__":
    for s in ("(()", ")()())", "", "()(()", "((()))()"):
        print(repr(s), longest_valid(s))
