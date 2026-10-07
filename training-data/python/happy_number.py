def is_happy(n: int) -> bool:
    def step(x):
        return sum(int(d) ** 2 for d in str(x))

    slow, fast = n, step(n)
    while fast != 1 and slow != fast:
        slow = step(slow)
        fast = step(step(fast))
    return fast == 1


if __name__ == "__main__":
    print([n for n in range(1, 50) if is_happy(n)])
