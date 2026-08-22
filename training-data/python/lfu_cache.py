from collections import defaultdict


class LFUCache:
    def __init__(self, capacity: int):
        self.capacity = capacity
        self.values = {}
        self.freq = {}
        self.freq_groups = defaultdict(dict)
        self.min_freq = 0

    def get(self, key):
        if key not in self.values:
            return None
        self._bump(key)
        return self.values[key]

    def put(self, key, value):
        if self.capacity <= 0:
            return
        if key in self.values:
            self.values[key] = value
            self._bump(key)
            return
        if len(self.values) >= self.capacity:
            evict_key, _ = next(iter(self.freq_groups[self.min_freq].items()))
            del self.freq_groups[self.min_freq][evict_key]
            del self.values[evict_key]
            del self.freq[evict_key]
        self.values[key] = value
        self.freq[key] = 1
        self.freq_groups[1][key] = True
        self.min_freq = 1

    def _bump(self, key):
        freq = self.freq[key]
        del self.freq_groups[freq][key]
        if not self.freq_groups[freq] and self.min_freq == freq:
            self.min_freq += 1
        self.freq[key] = freq + 1
        self.freq_groups[freq + 1][key] = True


if __name__ == "__main__":
    cache = LFUCache(2)
    cache.put("a", 1)
    cache.put("b", 2)
    cache.get("a")
    cache.put("c", 3)
    print(cache.get("b"), cache.get("a"), cache.get("c"))
