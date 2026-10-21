"""Bell numbers via the Bell triangle."""


def bell(n):
    row = [1]
    for _ in range(n):
        new = [row[-1]]
        for x in row:
            new.append(new[-1] + x)
        row = new
    return row[0]


if __name__ == "__main__":
    print([bell(i) for i in range(10)])
    assert bell(5) == 52
