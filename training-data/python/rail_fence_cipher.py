def rail_fence(s: str, rails: int) -> str:
    period = 2 * (rails - 1)
    rail = lambda i: min(i % period, period - i % period)
    return "".join(c for _, _, c in sorted((rail(i), i, c) for i, c in enumerate(s)))


if __name__ == "__main__":
    print(rail_fence("WEAREDISCOVERED", 3))
