def newton_sqrt(x, tol=1e-12):
    if x < 0:
        raise ValueError("negative input")
    if x == 0:
        return 0.0
    guess = x if x >= 1 else 1.0
    while True:
        nxt = 0.5 * (guess + x / guess)
        if abs(nxt - guess) < tol:
            return nxt
        guess = nxt


if __name__ == "__main__":
    for v in (2, 9, 0.25, 1e10):
        print(v, newton_sqrt(v))
