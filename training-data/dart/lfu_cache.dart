class LfuCache<K, V> {
  final int capacity;
  final Map<K, V> _values = {};
  final Map<K, int> _frequencies = {};

  LfuCache(this.capacity);

  V? get(K key) {
    if (!_values.containsKey(key)) return null;
    _frequencies[key] = (_frequencies[key] ?? 0) + 1;
    return _values[key];
  }

  void put(K key, V value) {
    if (capacity <= 0) return;
    if (!_values.containsKey(key) && _values.length >= capacity) {
      final leastUsedKey =
          _frequencies.entries.reduce((a, b) => a.value <= b.value ? a : b).key;
      _values.remove(leastUsedKey);
      _frequencies.remove(leastUsedKey);
    }
    _values[key] = value;
    _frequencies[key] = (_frequencies[key] ?? 0) + 1;
  }
}

void main() {
  final cache = LfuCache<int, String>(2);
  cache.put(1, 'a');
  cache.put(2, 'b');
  cache.get(1);
  cache.put(3, 'c');
  print(cache.get(1));
  print(cache.get(2));
  print(cache.get(3));
}
