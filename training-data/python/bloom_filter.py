import hashlib


class BloomFilter:
    def __init__(self, size: int = 1000, num_hashes: int = 3):
        self.size = size
        self.num_hashes = num_hashes
        self.bits = [False] * size

    def _hashes(self, item: str):
        for i in range(self.num_hashes):
            digest = hashlib.sha256(f"{i}:{item}".encode()).hexdigest()
            yield int(digest, 16) % self.size

    def add(self, item: str):
        for idx in self._hashes(item):
            self.bits[idx] = True

    def might_contain(self, item: str) -> bool:
        return all(self.bits[idx] for idx in self._hashes(item))


if __name__ == "__main__":
    bf = BloomFilter()
    bf.add("hello")
    print(bf.might_contain("hello"), bf.might_contain("world"))
