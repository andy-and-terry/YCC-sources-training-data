from itertools import permutations, combinations


def all_permutations(items):
    return list(permutations(items))


def all_combinations(items, r):
    return list(combinations(items, r))


if __name__ == "__main__":
    print(all_permutations([1, 2, 3]))
    print(all_combinations([1, 2, 3, 4], 2))
