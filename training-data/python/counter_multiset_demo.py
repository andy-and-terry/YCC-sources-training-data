"""collections.Counter used as a multiset."""
from collections import Counter


def can_build(word, letters):
    need = Counter(word)
    have = Counter(letters)
    return not (need - have)


def main():
    c = Counter("mississippi")
    print(c.most_common(2))
    a = Counter(x=3, y=1)
    b = Counter(x=1, y=2, z=5)
    print(a + b)
    print(a - b)
    print(a & b)
    print(a | b)
    print(can_build("cab", "abacus"), can_build("zoo", "abacus"))
    c.subtract("ms")
    print(sorted(c.elements()))


if __name__ == "__main__":
    main()
