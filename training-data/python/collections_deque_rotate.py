from collections import deque

if __name__ == "__main__":
    d = deque(range(6), maxlen=6)
    d.rotate(2)
    print(list(d))
    d.appendleft(99)
    print(list(d))
