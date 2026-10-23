from math import gcd


def farey(n: int) -> list[str]:
    """Farey sequence F_n: reduced fractions in [0, 1] with denominator <= n."""
    fracs = [(a, b) for b in range(1, n + 1) for a in range(0, b + 1) if gcd(a, b) == 1]
    fracs.sort(key=lambda f: f[0] / f[1])
    return [f"{a}/{b}" for a, b in fracs]


if __name__ == "__main__":
    print(" ".join(farey(5)))
