def evaluate_rpn(tokens):
    stack = []
    ops = {
        "+": lambda a, b: a + b,
        "-": lambda a, b: a - b,
        "*": lambda a, b: a * b,
        "/": lambda a, b: a / b,
    }
    for tok in tokens:
        if tok in ops:
            b = stack.pop()
            a = stack.pop()
            stack.append(ops[tok](a, b))
        else:
            stack.append(float(tok))
    return stack[0]


if __name__ == "__main__":
    print(evaluate_rpn(["3", "4", "+", "2", "*"]))
