from typing import List, Tuple


def fit(xs: List[float], ys: List[float]) -> Tuple[float, float]:
    n = len(xs)
    mean_x = sum(xs) / n
    mean_y = sum(ys) / n
    numerator = sum((x - mean_x) * (y - mean_y) for x, y in zip(xs, ys))
    denominator = sum((x - mean_x) ** 2 for x in xs)
    slope = numerator / denominator
    intercept = mean_y - slope * mean_x
    return slope, intercept


def predict(slope: float, intercept: float, x: float) -> float:
    return slope * x + intercept


if __name__ == "__main__":
    xs = [1, 2, 3, 4, 5]
    ys = [2, 4, 5, 4, 5]
    slope, intercept = fit(xs, ys)
    print(f"y = {slope:.2f}x + {intercept:.2f}")
    print(predict(slope, intercept, 6))
