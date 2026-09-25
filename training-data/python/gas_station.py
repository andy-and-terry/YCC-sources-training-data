def can_complete_circuit(gas, cost):
    if sum(gas) < sum(cost):
        return -1
    start = tank = 0
    for i, (g, c) in enumerate(zip(gas, cost)):
        tank += g - c
        if tank < 0:
            start, tank = i + 1, 0
    return start


if __name__ == "__main__":
    print(can_complete_circuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]))
    print(can_complete_circuit([2, 3, 4], [3, 4, 3]))
