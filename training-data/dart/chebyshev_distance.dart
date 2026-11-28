import 'dart:math';

int chebyshev(List<int> a, List<int> b) {
  var m = 0;
  for (var i = 0; i < a.length; i++) {
    m = max(m, (a[i] - b[i]).abs());
  }
  return m;
}

void main() {
  print(chebyshev([1, 2], [4, 6]));
}
