import queue
import threading


def worker(q, out, lock):
    while True:
        prio, task = q.get()
        if task is None:
            q.task_done()
            return
        with lock:
            out.append((prio, task))
        q.task_done()


if __name__ == "__main__":
    q = queue.PriorityQueue()
    for prio, task in [(3, "low"), (1, "urgent"), (2, "normal")]:
        q.put((prio, task))
    out, lock = [], threading.Lock()
    q.put((99, None))  # sentinel sorts last
    t = threading.Thread(target=worker, args=(q, out, lock))
    t.start()
    q.join()
    t.join()
    print(out)
