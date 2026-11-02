def averager():
    total = n = 0
    avg = None
    while True:
        x = yield avg
        total += x; n += 1
        avg = total / n

g = averager(); next(g)
print([g.send(v) for v in (10, 20, 60)])
