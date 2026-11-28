bool isHappy(int start) {
  final seen = <int>{};
  var n = start;
  while (n != 1 && seen.add(n)) {
    n = n.toString().split('').map(int.parse).fold(0, (s, d) => s + d * d);
  }
  return n == 1;
}

void main() {
  final found = <int>[];
  for (var n = 1; found.length < 8; n++) {
    if (isHappy(n)) found.add(n);
  }
  print(found); // [1, 7, 10, 13, 19, 23, 28, 31]
}
