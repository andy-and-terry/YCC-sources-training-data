class Multiplier:
    def __init__(self, k):
        self.k = k

    def __call__(self, x):
        return x * self.k


if __name__ == "__main__":
    double = Multiplier(2)
    print(list(map(double, [1, 2, 3])))
