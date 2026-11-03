def second_largest(values):
    distinct = sorted(set(values), reverse=True)
    return distinct[1] if len(distinct) > 1 else None


if __name__ == "__main__":
    print(second_largest([5, 3, 9, 9, 1]))
    print(second_largest([2, 2]))
