List<int> stern(int count) {
  final seq = <int>[0, 1];
  for (var i = 2; i < count; i++) {
    seq.add(i.isEven ? seq[i ~/ 2] : seq[i ~/ 2] + seq[i ~/ 2 + 1]);
  }
  return seq.sublist(0, count);
}

void main() => print(stern(15)); // [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3]
