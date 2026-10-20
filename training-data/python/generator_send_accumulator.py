def running_total():
    total = 0
    while True:
        value = yield total
        total += value or 0


if __name__ == "__main__":
    g = running_total()
    next(g)
    for n in (5, 10, 20):
        print(g.send(n))
