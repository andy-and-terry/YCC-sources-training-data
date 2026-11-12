class Logger2 {
  static final Map<String, Logger2> _cache = {};
  final String name;
  factory Logger2(String n) => _cache.putIfAbsent(n, () => Logger2._(n));
  Logger2._(this.name);
}
void main() {
  print(identical(Logger2('a'), Logger2('a')));
  print(identical(Logger2('a'), Logger2('b')));
}
