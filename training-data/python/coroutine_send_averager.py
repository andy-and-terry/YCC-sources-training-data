"""Generator-based coroutines: using send() to feed values into a
running generator that keeps state between calls."""


def running_average():
    total, count = 0.0, 0
    average = None
    while True:
        value = yield average
        total += value
        count += 1
        average = total / count


def prime_coroutine(func):
    def wrapper(*args, **kwargs):
        gen = func(*args, **kwargs)
        next(gen)  # advance to the first yield
        return gen

    return wrapper


@prime_coroutine
def collector(sink: list):
    while True:
        item = yield
        sink.append(item.upper())


if __name__ == "__main__":
    avg = running_average()
    next(avg)
    for x in (10, 20, 60):
        print(avg.send(x))

    out = []
    c = collector(out)
    for w in ("a", "b", "c"):
        c.send(w)
    c.close()
    print(out)
