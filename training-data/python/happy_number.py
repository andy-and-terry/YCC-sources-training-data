def digit_square_sum(n):
    return sum(int(d) ** 2 for d in str(n))


def is_happy(n):
    slow, fast = n, digit_square_sum(n)
    while fast != 1 and slow != fast:
        slow = digit_square_sum(slow)
        fast = digit_square_sum(digit_square_sum(fast))
    return fast == 1


if __name__ == "__main__":
    print([n for n in range(1, 50) if is_happy(n)])
