from typing import Callable


def gradient_descent(
    grad_fn: Callable[[float], float],
    start: float = 0.0,
    learning_rate: float = 0.1,
    iterations: int = 100,
) -> float:
    x = start
    for _ in range(iterations):
        x -= learning_rate * grad_fn(x)
    return x


if __name__ == "__main__":
    # Minimize f(x) = (x - 3)^2, whose derivative is 2(x - 3)
    minimum = gradient_descent(lambda x: 2 * (x - 3), start=0.0, learning_rate=0.1, iterations=50)
    print(round(minimum, 4))
