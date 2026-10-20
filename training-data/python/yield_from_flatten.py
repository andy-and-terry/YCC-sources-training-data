def flatten(items):
    for item in items:
        if isinstance(item, (list, tuple)):
            yield from flatten(item)
        else:
            yield item


if __name__ == "__main__":
    print(list(flatten([1, [2, (3, [4])], 5])))
