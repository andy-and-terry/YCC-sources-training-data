from collections import Counter

a = Counter("abracadabra")
b = Counter("alakazam")

if __name__ == "__main__":
    print(a + b)
    print(a - b)
    print(a & b)
    print(a.most_common(2))
