extension ListStats on List<num> {
  double get mean => isEmpty ? 0 : reduce((a, b) => a + b) / length;
  num get range => isEmpty ? 0 : reduce((a, b) => a > b ? a : b) - reduce((a, b) => a < b ? a : b);
}

void main() {
  print([2, 4, 9].mean);
  print([2, 4, 9].range);
}
