import threading
import time
import random

barrier = threading.Barrier(3)
lock = threading.Lock()


def worker(name):
    time.sleep(random.random() * 0.1)
    with lock:
        print(f"{name} reached barrier")
    barrier.wait()
    with lock:
        print(f"{name} passed barrier")


threads = [threading.Thread(target=worker, args=(f"w{i}",)) for i in range(3)]
for t in threads:
    t.start()
for t in threads:
    t.join()
print("all done")
