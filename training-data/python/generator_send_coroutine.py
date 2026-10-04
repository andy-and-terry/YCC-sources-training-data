def running_average():
    """Coroutine that receives numbers via send() and yields the running mean."""
    total = 0.0
    count = 0
    average = None
    while True:
        value = yield average
        total += value
        count += 1
        average = total / count


def accumulator(start=0):
    total = start
    while True:
        amount = yield total
        if amount is None:
            break
        total += amount
    return total


if __name__ == "__main__":
    avg = running_average()
    next(avg)  # prime the coroutine
    for n in (10, 20, 30, 40):
        print(avg.send(n))
    avg.close()

    acc = accumulator(100)
    next(acc)
    print(acc.send(5), acc.send(7))
    try:
        acc.send(None)
    except StopIteration as stop:
        print("final:", stop.value)
