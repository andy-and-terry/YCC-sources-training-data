# A coroutine-style generator that receives values via send() and keeps a running total.
def running_total():
    total = 0
    while True:
        value = yield total
        if value is None:
            break
        total += value

if __name__ == "__main__":
    gen = running_total()
    next(gen)  # prime
    for n in (5, 10, 20):
        print(gen.send(n))
