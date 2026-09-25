from collections import deque


class SimpleMovingAverage:
    def __init__(self, window):
        self.window = deque(maxlen=window)
        self.total = 0.0

    def add(self, x):
        if len(self.window) == self.window.maxlen:
            self.total -= self.window[0]
        self.window.append(x)
        self.total += x
        return self.total / len(self.window)


def ema(values, alpha):
    out, cur = [], None
    for v in values:
        cur = v if cur is None else alpha * v + (1 - alpha) * cur
        out.append(round(cur, 3))
    return out


if __name__ == "__main__":
    prices = [10, 11, 12, 13, 12, 11, 15, 18, 17, 16]
    sma = SimpleMovingAverage(3)
    print([round(sma.add(p), 3) for p in prices])
    print(ema(prices, 0.5))
