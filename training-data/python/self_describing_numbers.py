def is_self_describing(n):
    s = str(n)
    return all(s.count(str(i)) == int(d) for i, d in enumerate(s))


for n in (1210, 2020, 21200, 1211):
    print(n, is_self_describing(n))
