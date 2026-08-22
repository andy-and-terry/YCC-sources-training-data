class QueueViaStacks:
    def __init__(self):
        self._in = []
        self._out = []

    def enqueue(self, item):
        self._in.append(item)

    def dequeue(self):
        if not self._out:
            while self._in:
                self._out.append(self._in.pop())
        return self._out.pop()

    def is_empty(self):
        return not self._in and not self._out


if __name__ == "__main__":
    q = QueueViaStacks()
    q.enqueue(1)
    q.enqueue(2)
    q.enqueue(3)
    print(q.dequeue(), q.dequeue(), q.is_empty())
