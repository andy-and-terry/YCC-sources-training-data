def rob(houses):
    take, skip = 0, 0
    for h in houses:
        take, skip = skip + h, max(take, skip)
    return max(take, skip)


def rob_circular(houses):
    if len(houses) == 1:
        return houses[0]
    return max(rob(houses[1:]), rob(houses[:-1]))


if __name__ == "__main__":
    print(rob([2, 7, 9, 3, 1]))
    print(rob_circular([2, 3, 2]), rob_circular([1, 2, 3, 1]))
