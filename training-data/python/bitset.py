class BitSet:
    def __init__(self, size: int):
        self.size = size
        self.bits = 0

    def set(self, index: int):
        self.bits |= (1 << index)

    def clear(self, index: int):
        self.bits &= ~(1 << index)

    def toggle(self, index: int):
        self.bits ^= (1 << index)

    def get(self, index: int) -> bool:
        return bool(self.bits & (1 << index))

    def count(self) -> int:
        return bin(self.bits).count("1")


if __name__ == "__main__":
    bs = BitSet(8)
    bs.set(1)
    bs.set(3)
    bs.toggle(3)
    print(bs.get(1), bs.get(3), bs.count())
