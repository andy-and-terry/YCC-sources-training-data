"""Recursive-descent parser/evaluator for + - * / ^ and parentheses."""
import re


class Parser:
    def __init__(self, text):
        self.tokens = re.findall(r"\d+\.?\d*|[-+*/^()]", text)
        self.i = 0

    def peek(self):
        return self.tokens[self.i] if self.i < len(self.tokens) else None

    def take(self):
        tok = self.peek()
        self.i += 1
        return tok

    def parse(self):
        v = self.expr()
        if self.peek() is not None:
            raise SyntaxError(f"unexpected {self.peek()}")
        return v

    def expr(self):
        v = self.term()
        while self.peek() in ("+", "-"):
            v = v + self.term() if self.take() == "+" else v - self.term()
        return v

    def term(self):
        v = self.factor()
        while self.peek() in ("*", "/"):
            v = v * self.factor() if self.take() == "*" else v / self.factor()
        return v

    def factor(self):
        base = self.unary()
        if self.peek() == "^":
            self.take()
            return base ** self.factor()  # right associative
        return base

    def unary(self):
        if self.peek() == "-":
            self.take()
            return -self.unary()
        return self.primary()

    def primary(self):
        tok = self.take()
        if tok == "(":
            v = self.expr()
            if self.take() != ")":
                raise SyntaxError("expected )")
            return v
        return float(tok)


if __name__ == "__main__":
    for e in ("1 + 2 * 3", "(1 + 2) * 3", "2 ^ 3 ^ 2", "-4 + 10 / 4", "-(2 + 3) * 2"):
        print(e, "=", Parser(e).parse())
