(int, String) pair() => (7, 'seven');

({int min, int max}) bounds(List<int> xs) =>
    (min: xs.reduce((a, b) => a < b ? a : b), max: xs.reduce((a, b) => a > b ? a : b));

void main() {
  var (n, s) = pair();
  print('$n $s');
  var b = bounds([3, 1, 9]);
  print('${b.min}..${b.max}');
}
