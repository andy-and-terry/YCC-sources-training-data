def is_rotation(a: str, b: str) -> bool:
    return len(a) == len(b) and b in a + a


if __name__ == "__main__":
    print(is_rotation("waterbottle", "erbottlewat"))
    print(is_rotation("abc", "acb"))
