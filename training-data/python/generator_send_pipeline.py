def accumulator():
    total = 0
    while True:
        x = yield total
        if x is None:
            break
        total += x


g = accumulator()
next(g)
print(g.send(5), g.send(10), g.send(1))
