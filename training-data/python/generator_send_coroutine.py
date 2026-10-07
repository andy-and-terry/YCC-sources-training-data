def running_average():
    total = 0.0
    count = 0
    average = None
    while True:
        value = yield average
        total += value
        count += 1
        average = total / count


avg = running_average()
next(avg)  # prime the generator
for v in (10, 20, 30, 40):
    print(avg.send(v))
avg.close()


def delegating():
    result = yield from sub()
    print("sub returned", result)


def sub():
    yield 1
    yield 2
    return "finished"


print(list(delegating()))
