def averager():
    total, n, avg = 0.0, 0, None
    while True:
        x = yield avg
        total += x
        n += 1
        avg = total / n


g = averager()
next(g)
print(g.send(10), g.send(20), g.send(60))
g.close()
