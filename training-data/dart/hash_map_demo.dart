class HashMap<K, V> {
  final List<List<MapEntry<K, V>>> _buckets;

  HashMap(int size) : _buckets = List.generate(size, (_) => []);

  int _indexFor(K key) => key.hashCode.abs() % _buckets.length;

  void put(K key, V value) {
    final bucket = _buckets[_indexFor(key)];
    for (var i = 0; i < bucket.length; i++) {
      if (bucket[i].key == key) {
        bucket[i] = MapEntry(key, value);
        return;
      }
    }
    bucket.add(MapEntry(key, value));
  }

  V? get(K key) {
    final bucket = _buckets[_indexFor(key)];
    for (final entry in bucket) {
      if (entry.key == key) return entry.value;
    }
    return null;
  }
}

void main() {
  final map = HashMap<String, int>(8);
  map.put('a', 1);
  map.put('b', 2);
  map.put('a', 10);
  print(map.get('a'));
  print(map.get('b'));
  print(map.get('z'));
}
