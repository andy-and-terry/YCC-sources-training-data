_DELETED = object()


class OpenHashSet:
    def __init__(self, capacity=8):
        self._slots = [None] * capacity
        self._count = 0

    def _probe(self, key):
        i = hash(key) % len(self._slots)
        while True:
            yield i
            i = (i + 1) % len(self._slots)

    def add(self, key):
        if (self._count + 1) * 2 > len(self._slots):
            self._resize()
        first_free = None
        for i in self._probe(key):
            slot = self._slots[i]
            if slot is None:
                self._slots[first_free if first_free is not None else i] = key
                self._count += 1
                return
            if slot is _DELETED:
                if first_free is None:
                    first_free = i
            elif slot == key:
                return

    def __contains__(self, key):
        for i in self._probe(key):
            slot = self._slots[i]
            if slot is None:
                return False
            if slot is not _DELETED and slot == key:
                return True

    def remove(self, key):
        for i in self._probe(key):
            slot = self._slots[i]
            if slot is None:
                raise KeyError(key)
            if slot is not _DELETED and slot == key:
                self._slots[i] = _DELETED
                self._count -= 1
                return

    def _resize(self):
        old = [s for s in self._slots if s is not None and s is not _DELETED]
        self._slots = [None] * (len(self._slots) * 2)
        self._count = 0
        for k in old:
            self.add(k)

    def __len__(self):
        return self._count


if __name__ == "__main__":
    s = OpenHashSet()
    for w in "the quick brown fox jumps over the lazy dog".split():
        s.add(w)
    s.remove("fox")
    print(len(s), "fox" in s, "dog" in s)
