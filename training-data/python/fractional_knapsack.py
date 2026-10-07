def fractional_knapsack(items, capacity):
    """items: list of (value, weight). Returns (total value, taken fractions)."""
    total = 0.0
    taken = []
    for value, weight in sorted(items, key=lambda it: it[0] / it[1], reverse=True):
        if capacity <= 0:
            break
        amount = min(weight, capacity)
        total += value * amount / weight
        taken.append((value, weight, amount / weight))
        capacity -= amount
    return total, taken


if __name__ == "__main__":
    val, parts = fractional_knapsack([(60, 10), (100, 20), (120, 30)], 50)
    print(val)
    for p in parts:
        print(p)
