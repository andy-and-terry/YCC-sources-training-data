from collections import OrderedDict


class RecentSet:
    """Keeps at most `limit` items, most recent last."""

    def __init__(self, limit):
        self.limit = limit
        self.items = OrderedDict()

    def touch(self, key):
        self.items[key] = True
        self.items.move_to_end(key)
        if len(self.items) > self.limit:
            self.items.popitem(last=False)

    def __iter__(self):
        return iter(self.items)


if __name__ == "__main__":
    r = RecentSet(3)
    for k in "abcab":
        r.touch(k)
    print(list(r))
    r.touch("d")
    print(list(r))
    print(OrderedDict(a=1, b=2) == OrderedDict(b=2, a=1), {"a": 1, "b": 2} == {"b": 2, "a": 1})
