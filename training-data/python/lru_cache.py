from collections import OrderedDict
from typing import Any, Optional


class LRUCache:
    """Fixed-capacity cache that evicts the least-recently-used entry."""

    def __init__(self, capacity: int):
        if capacity <= 0:
            raise ValueError("capacity must be positive")
        self.capacity = capacity
        self._store: "OrderedDict[Any, Any]" = OrderedDict()

    def get(self, key: Any) -> Optional[Any]:
        if key not in self._store:
            return None
        self._store.move_to_end(key)
        return self._store[key]

    def put(self, key: Any, value: Any) -> None:
        if key in self._store:
            self._store.move_to_end(key)
        self._store[key] = value
        if len(self._store) > self.capacity:
            self._store.popitem(last=False)

    def __contains__(self, key: Any) -> bool:
        return key in self._store

    def __len__(self) -> int:
        return len(self._store)


class TTLCache(LRUCache):
    """LRU cache where entries also expire after a fixed number of seconds."""

    def __init__(self, capacity: int, ttl_seconds: float, clock=None):
        super().__init__(capacity)
        self.ttl_seconds = ttl_seconds
        self._clock = clock or __import__("time").monotonic
        self._expiry: dict = {}

    def put(self, key: Any, value: Any) -> None:
        super().put(key, value)
        self._expiry[key] = self._clock() + self.ttl_seconds

    def get(self, key: Any) -> Optional[Any]:
        if key in self._expiry and self._clock() > self._expiry[key]:
            del self._store[key]
            del self._expiry[key]
            return None
        return super().get(key)


if __name__ == "__main__":
    cache = LRUCache(2)
    cache.put("a", 1)
    cache.put("b", 2)
    cache.get("a")
    cache.put("c", 3)  # evicts "b"
    print("b" in cache, "a" in cache, "c" in cache)
