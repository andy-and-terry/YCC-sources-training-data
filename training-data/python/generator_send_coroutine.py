"""Generators as coroutines using send() and close()."""


def running_average():
    total = 0.0
    count = 0
    avg = None
    try:
        while True:
            value = yield avg
            total += value
            count += 1
            avg = total / count
    finally:
        print("averager closed")


def delegating():
    result = yield from sub_gen()
    yield f"sub returned {result}"


def sub_gen():
    yield 1
    yield 2
    return "ok"


def main():
    g = running_average()
    next(g)
    for v in (10, 20, 60):
        print(g.send(v))
    g.close()
    print(list(delegating()))


if __name__ == "__main__":
    main()
