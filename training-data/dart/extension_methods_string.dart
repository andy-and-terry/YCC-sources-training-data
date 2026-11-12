extension Caps on String {
  String get title => split(' ').map((w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1)).join(' ');
}
extension Sum on Iterable<int> {
  int get total => fold(0, (a, b) => a + b);
}
void main() {
  print('hello big world'.title);
  print([1, 2, 3].total);
}
