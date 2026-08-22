from collections import Counter
from typing import List


def mean(values: List[float]) -> float:
    return sum(values) / len(values)


def median(values: List[float]) -> float:
    sorted_vals = sorted(values)
    n = len(sorted_vals)
    mid = n // 2
    if n % 2 == 0:
        return (sorted_vals[mid - 1] + sorted_vals[mid]) / 2
    return sorted_vals[mid]


def mode(values: List[float]) -> float:
    return Counter(values).most_common(1)[0][0]


def variance(values: List[float]) -> float:
    m = mean(values)
    return sum((x - m) ** 2 for x in values) / len(values)


def stdev(values: List[float]) -> float:
    return variance(values) ** 0.5


if __name__ == "__main__":
    data = [2, 4, 4, 4, 5, 5, 7, 9]
    print(mean(data), median(data), mode(data), round(stdev(data), 3))
