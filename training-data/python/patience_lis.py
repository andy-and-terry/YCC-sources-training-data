from bisect import bisect_left


def lis_length(a: list[int]) -> int:
    tails: list[int] = []
    for x in a:
        i = bisect_left(tails, x)
        if i == len(tails):
            tails.append(x)
        else:
            tails[i] = x
    return len(tails)


print(lis_length([10, 9, 2, 5, 3, 7, 101, 18]))
