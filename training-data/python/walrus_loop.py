data = iter([3, 5, 0, 7])
while (n := next(data, None)) is not None and n != 0:
    print("got", n)
