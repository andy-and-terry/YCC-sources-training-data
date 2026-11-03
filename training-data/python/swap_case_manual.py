def swap_case(s: str) -> str:
    return "".join(c.lower() if c.isupper() else c.upper() for c in s)


if __name__ == "__main__":
    print(swap_case("Hello World 42"))
