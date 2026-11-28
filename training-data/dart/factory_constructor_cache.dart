class Logger {
  static final Map<String, Logger> _cache = {};
  final String name;

  factory Logger(String name) => _cache.putIfAbsent(name, () => Logger._(name));
  Logger._(this.name);
}

void main() {
  print(identical(Logger('a'), Logger('a')));
  print(identical(Logger('a'), Logger('b')));
}
