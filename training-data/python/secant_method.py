def secant(f, x0, x1, tol=1e-12, limit=50):
    for _ in range(limit):
        f0, f1 = f(x0), f(x1)
        if f1 == f0:
            break
        x0, x1 = x1, x1 - f1 * (x1 - x0) / (f1 - f0)
        if abs(x1 - x0) < tol:
            break
    return x1


if __name__ == "__main__":
    print(secant(lambda x: x * x - 2, 1, 2))
