(String, int) lookup() => ('alice', 30);

({double x, double y}) origin() => (x: 0, y: 0);

void main() {
  var (name, age) = lookup();
  print('$name is $age');

  final (:x, :y) = origin();
  print('$x,$y');

  var [first, ...rest] = [1, 2, 3, 4];
  print('$first and $rest');

  final {'k': v} = {'k': 9};
  print(v);
}
