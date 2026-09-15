class Vector2D {
  final double x;
  final double y;

  const Vector2D(this.x, this.y);

  Vector2D operator +(Vector2D other) => Vector2D(x + other.x, y + other.y);
  Vector2D operator -(Vector2D other) => Vector2D(x - other.x, y - other.y);
  Vector2D operator *(double scalar) => Vector2D(x * scalar, y * scalar);

  @override
  bool operator ==(Object other) =>
      other is Vector2D && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => 'Vector2D($x, $y)';
}

void main() {
  final a = Vector2D(1, 2);
  final b = Vector2D(3, 4);

  print(a + b);
  print(a - b);
  print(a * 2.5);
  print(a == Vector2D(1, 2));
}
