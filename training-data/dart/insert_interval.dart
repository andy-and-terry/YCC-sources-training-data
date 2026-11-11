import 'dart:math';

List<List<int>> insertInterval(List<List<int>> iv, List<int> next) {
  final out = <List<int>>[];
  var i = 0;
  while (i < iv.length && iv[i][1] < next[0]) {
    out.add(iv[i++]);
  }
  while (i < iv.length && iv[i][0] <= next[1]) {
    next = [min(next[0], iv[i][0]), max(next[1], iv[i][1])];
    i++;
  }
  out.add(next);
  out.addAll(iv.sublist(i));
  return out;
}

void main() {
  print(insertInterval([[1, 3], [6, 9]], [2, 5])); // [[1, 5], [6, 9]]
}
