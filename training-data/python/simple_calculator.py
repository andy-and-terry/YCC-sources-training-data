import re
from typing import List, Union

Token = Union[float, str]


def tokenize(expr: str) -> List[Token]:
    return [
        float(tok) if re.match(r"^-?\d+(\.\d+)?$", tok) else tok
        for tok in re.findall(r"\d+\.\d+|\d+|[()+\-*/]", expr)
    ]


def to_postfix(tokens: List[Token]) -> List[Token]:
    precedence = {"+": 1, "-": 1, "*": 2, "/": 2}
    output, ops = [], []
    for tok in tokens:
        if isinstance(tok, float):
            output.append(tok)
        elif tok == "(":
            ops.append(tok)
        elif tok == ")":
            while ops[-1] != "(":
                output.append(ops.pop())
            ops.pop()
        else:
            while ops and ops[-1] != "(" and precedence.get(ops[-1], 0) >= precedence[tok]:
                output.append(ops.pop())
            ops.append(tok)
    while ops:
        output.append(ops.pop())
    return output


def eval_postfix(postfix: List[Token]) -> float:
    stack: List[float] = []
    ops = {"+": lambda a, b: a + b, "-": lambda a, b: a - b,
           "*": lambda a, b: a * b, "/": lambda a, b: a / b}
    for tok in postfix:
        if isinstance(tok, float):
            stack.append(tok)
        else:
            b, a = stack.pop(), stack.pop()
            stack.append(ops[tok](a, b))
    return stack[0]


def calculate(expr: str) -> float:
    return eval_postfix(to_postfix(tokenize(expr)))


if __name__ == "__main__":
    print(calculate("3 + 4 * (2 - 1)"))
