from abc import ABC, abstractmethod
from typing import Dict


class Expression(ABC):
    @abstractmethod
    def interpret(self, context: Dict[str, int]) -> int: ...


class Number(Expression):
    def __init__(self, value: int):
        self.value = value

    def interpret(self, context: Dict[str, int]) -> int:
        return self.value


class Variable(Expression):
    def __init__(self, name: str):
        self.name = name

    def interpret(self, context: Dict[str, int]) -> int:
        return context[self.name]


class Add(Expression):
    def __init__(self, left: Expression, right: Expression):
        self.left = left
        self.right = right

    def interpret(self, context: Dict[str, int]) -> int:
        return self.left.interpret(context) + self.right.interpret(context)


class Multiply(Expression):
    def __init__(self, left: Expression, right: Expression):
        self.left = left
        self.right = right

    def interpret(self, context: Dict[str, int]) -> int:
        return self.left.interpret(context) * self.right.interpret(context)


if __name__ == "__main__":
    # Represents: (x + 3) * y
    expr = Multiply(Add(Variable("x"), Number(3)), Variable("y"))
    print(expr.interpret({"x": 2, "y": 5}))
