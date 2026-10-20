class Point {
  final double x, y;
  const Point(this.x, this.y);
  Point.origin() : this(0, 0);
  Point.fromJson(Map<String, dynamic> j) : x = j['x'].toDouble(), y = j['y'].toDouble();
  factory Point.parse(String s) {
    final p = s.split(',');
    return Point(double.parse(p[0]), double.parse(p[1]));
  }
  Point operator +(Point o) => Point(x + o.x, y + o.y);
  @override
  bool operator ==(Object o) => o is Point && o.x == x && o.y == y;
  @override
  int get hashCode => Object.hash(x, y);
  @override
  String toString() => 'Point($x, $y)';
}

class Logger {
  static final Map<String, Logger> _cache = {};
  final String name;
  factory Logger(String name) => _cache.putIfAbsent(name, () => Logger._(name));
  Logger._(this.name);
}

void main() {
  print(Point(1, 2) + Point.origin());
  print(Point.fromJson({'x': 1, 'y': 2}) == Point.parse('1,2'));
  print(identical(Logger('a'), Logger('a')));
  print(identical(const Point(1, 1), const Point(1, 1)));
  print({Point(1, 1), Point(1, 1)}.length);
}
