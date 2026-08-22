from collections import defaultdict
from typing import Callable, Dict, List


class PubSub:
    def __init__(self):
        self._subscribers: Dict[str, List[Callable]] = defaultdict(list)

    def subscribe(self, topic: str, handler: Callable):
        self._subscribers[topic].append(handler)

    def publish(self, topic: str, message):
        for handler in self._subscribers.get(topic, []):
            handler(message)


if __name__ == "__main__":
    bus = PubSub()
    bus.subscribe("news", lambda msg: print(f"received: {msg}"))
    bus.publish("news", "hello subscribers")
