List<int> encode(List<int> xs) =>
    [for (var i = 0; i < xs.length; i++) i == 0 ? xs[0] : xs[i] - xs[i - 1]];

List<int> decode(List<int> ds) {
  var acc = 0;
  return ds.map((d) => acc += d).toList();
}

void main() {
  final d = encode([10, 12, 15, 15, 20]);
  print(d);
  print(decode(d));
}
