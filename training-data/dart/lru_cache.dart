import 'dart:collection';

class LruCache<K, V> {
  final int capacity;
  final LinkedHashMap<K, V> _map = LinkedHashMap<K, V>();

  LruCache(this.capacity);

  V? get(K key) {
    if (!_map.containsKey(key)) return null;
    final value = _map.remove(key) as V;
    _map[key] = value;
    return value;
  }

  void put(K key, V value) {
    if (_map.containsKey(key)) {
      _map.remove(key);
    } else if (_map.length >= capacity) {
      _map.remove(_map.keys.first);
    }
    _map[key] = value;
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
