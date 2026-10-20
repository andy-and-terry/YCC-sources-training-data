import threading

count = 0
lock = threading.Lock()


def work():
    global count
    for _ in range(10000):
        with lock:
            count += 1


if __name__ == "__main__":
    ts = [threading.Thread(target=work) for _ in range(4)]
    [t.start() for t in ts]
    [t.join() for t in ts]
    print(count)
