from abc import ABC, abstractmethod


class Expr(ABC):
    @abstractmethod
    def accept(self, visitor): ...


class Number(Expr):
    def __init__(self, value):
        self.value = value

    def accept(self, visitor):
        return visitor.visit_number(self)


class Add(Expr):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def accept(self, visitor):
        return visitor.visit_add(self)


class EvalVisitor:
    def visit_number(self, node: Number):
        return node.value

    def visit_add(self, node: Add):
        return node.left.accept(self) + node.right.accept(self)


if __name__ == "__main__":
    expr = Add(Number(1), Add(Number(2), Number(3)))
    print(expr.accept(EvalVisitor()))
