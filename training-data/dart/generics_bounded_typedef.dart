typedef Transformer<T, R> = R Function(T);
typedef Json = Map<String, dynamic>;

class Box<T extends Comparable<T>> {
  final List<T> items;
  Box(this.items);
  T get max => items.reduce((a, b) => a.compareTo(b) >= 0 ? a : b);
}

R apply<T, R>(T value, Transformer<T, R> f) => f(value);

class Cache<K, V> {
  final _store = <K, V>{};
  V putIfMissing(K k, V Function() make) => _store.putIfAbsent(k, make);
  int get size => _store.length;
}

void main() {
  print(Box([3, 9, 4]).max);
  print(Box(['b', 'z', 'a']).max);
  print(apply<int, String>(5, (n) => 'n=$n'));
  var c = Cache<String, int>();
  c.putIfMissing('a', () => 1);
  c.putIfMissing('a', () => 2);
  print('${c.putIfMissing('a', () => 3)} ${c.size}');
  Json j = {'k': [1, 2], 'n': null};
  print(j);
}
