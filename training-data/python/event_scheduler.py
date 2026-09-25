import heapq
import itertools


class EventScheduler:
    """Discrete-event simulator: events run in time order, ties by insertion."""

    def __init__(self):
        self.now = 0.0
        self._queue = []
        self._seq = itertools.count()

    def schedule(self, delay, action, *args):
        heapq.heappush(self._queue, (self.now + delay, next(self._seq), action, args))

    def run(self, until=float("inf")):
        while self._queue and self._queue[0][0] <= until:
            self.now, _, action, args = heapq.heappop(self._queue)
            action(*args)


if __name__ == "__main__":
    sim = EventScheduler()

    def customer(name, service):
        print(f"t={sim.now:4.1f} {name} arrives")
        sim.schedule(service, lambda: print(f"t={sim.now:4.1f} {name} leaves"))

    for i, (arrive, service) in enumerate([(0, 3), (1, 2), (1.5, 4), (6, 1)]):
        sim.schedule(arrive, customer, f"c{i}", service)
    sim.run()
