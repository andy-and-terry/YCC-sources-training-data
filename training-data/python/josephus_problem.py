def josephus(n: int, k: int) -> int:
    """0-indexed survivor position in the Josephus problem via recurrence."""
    result = 0
    for i in range(2, n + 1):
        result = (result + k) % i
    return result


def josephus_simulation(n: int, k: int) -> int:
    """Same answer via explicit elimination, for cross-checking the recurrence."""
    people = list(range(n))
    idx = 0
    while len(people) > 1:
        idx = (idx + k - 1) % len(people)
        people.pop(idx)
    return people[0]


if __name__ == "__main__":
    print(josephus(7, 3))
    print(josephus_simulation(7, 3))
    assert josephus(41, 3) == josephus_simulation(41, 3)
