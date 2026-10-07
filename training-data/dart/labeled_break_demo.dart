void main() {
  final grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  int? found;
  outer:
  for (final row in grid) {
    for (final value in row) {
      if (value * value > 30) {
        found = value;
        break outer;
      }
    }
  }
  print('first value with square > 30: $found');

  var evens = 0;
  rows:
  for (final row in grid) {
    for (final value in row) {
      if (value.isOdd) continue rows;
      evens++;
    }
  }
  print('evens counted before odd rows: $evens');

  var n = 0;
  do {
    n += 3;
  } while (n < 10);
  print(n);
}
