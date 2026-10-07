from itertools import product

KEYPAD = {
    "2": "abc", "3": "def", "4": "ghi", "5": "jkl",
    "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz",
}


def letter_combinations(digits):
    if not digits:
        return []
    return ["".join(p) for p in product(*(KEYPAD[d] for d in digits))]


if __name__ == "__main__":
    print(letter_combinations("23"))
    print(len(letter_combinations("7979")))
