PREC = {"+": 1, "-": 1, "*": 2, "/": 2, "^": 3}
RIGHT = {"^"}
OPS = {
    "+": lambda a, b: a + b,
    "-": lambda a, b: a - b,
    "*": lambda a, b: a * b,
    "/": lambda a, b: a / b,
    "^": lambda a, b: a ** b,
}


def to_rpn(tokens):
    out, ops = [], []
    for t in tokens:
        if t.replace(".", "", 1).isdigit():
            out.append(t)
        elif t in PREC:
            while ops and ops[-1] in PREC and (
                PREC[ops[-1]] > PREC[t] or (PREC[ops[-1]] == PREC[t] and t not in RIGHT)
            ):
                out.append(ops.pop())
            ops.append(t)
        elif t == "(":
            ops.append(t)
        elif t == ")":
            while ops[-1] != "(":
                out.append(ops.pop())
            ops.pop()
    while ops:
        out.append(ops.pop())
    return out


def eval_rpn(rpn):
    st = []
    for t in rpn:
        if t in PREC:
            b, a = st.pop(), st.pop()
            st.append(OPS[t](a, b))
        else:
            st.append(float(t))
    return st[0]


if __name__ == "__main__":
    toks = "3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3".split()
    rpn = to_rpn(toks)
    print(" ".join(rpn))
    print(eval_rpn(rpn))
