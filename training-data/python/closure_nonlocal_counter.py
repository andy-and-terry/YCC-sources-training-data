def make_counter(start=0, step=1):
    count = start

    def increment():
        nonlocal count
        count += step
        return count

    def reset():
        nonlocal count
        count = start

    increment.reset = reset
    return increment


def make_accumulators():
    history = []

    def record(value):
        history.append(value)
        return sum(history)

    return record, lambda: list(history)


def late_binding_pitfall():
    bad = [lambda: i for i in range(3)]
    good = [lambda i=i: i for i in range(3)]
    return [f() for f in bad], [f() for f in good]


if __name__ == "__main__":
    c = make_counter(10, 5)
    print(c(), c(), c())
    c.reset()
    print(c())
    record, get = make_accumulators()
    record(3)
    print(record(4), get())
    print(late_binding_pitfall())
    print(c.__closure__ is not None, [cell.cell_contents for cell in c.__closure__])
