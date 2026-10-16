values = [0, 0.0, "", [], {}, set(), None, False, " ", [0], "0", 0.1]
for v in values:
    print(f"{v!r:>8} -> {bool(v)}")


class Box:
    def __init__(self, n):
        self.n = n

    def __len__(self):
        return self.n


class Flag:
    def __bool__(self):
        return False

    def __len__(self):
        return 10


print(bool(Box(0)), bool(Box(2)), bool(Flag()))
print([] or "fallback", "" or None, 0 and 1, "a" and "b")
