import math


def jump_search(a, target):
    n = len(a)
    step = int(math.sqrt(n)) or 1
    prev = 0
    while prev < n and a[min(prev + step, n) - 1] < target:
        prev += step
    for i in range(prev, min(prev + step, n)):
        if a[i] == target:
            return i
    return -1


if __name__ == "__main__":
    data = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]
    print(jump_search(data, 55), jump_search(data, 4))
