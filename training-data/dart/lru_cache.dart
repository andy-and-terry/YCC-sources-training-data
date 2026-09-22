class LruCache<K, V> {
  final int capacity;
  final Map<K, V> _map = {};
  final List<K> _order = [];

  LruCache(this.capacity);

  V? get(K key) {
    if (!_map.containsKey(key)) return null;
    _order.remove(key);
    _order.add(key);
    return _map[key];
  }

  void put(K key, V value) {
    if (_map.containsKey(key)) {
      _order.remove(key);
    } else if (_map.length >= capacity) {
      final oldest = _order.removeAt(0);
      _map.remove(oldest);
    }
    _map[key] = value;
    _order.add(key);
  }
}

void main() {
  final cache = LruCache<int, String>(2);
  cache.put(1, 'a');
  cache.put(2, 'b');
  print(cache.get(1));
  cache.put(3, 'c');
  print(cache.get(2));
  print(cache.get(3));
}
