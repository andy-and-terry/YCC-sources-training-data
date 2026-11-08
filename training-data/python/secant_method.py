def secant(f, a, b, iters=40):
    for _ in range(iters):
        fa, fb = f(a), f(b)
        if fa == fb:
            break
        a, b = b, b - fb * (b - a) / (fb - fa)
    return b


if __name__ == "__main__":
    print(f"{secant(lambda x: x * x - 2, 1, 2):.8f}")
