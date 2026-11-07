List<int> plusOne(List<int> digits) {
  final d = List<int>.of(digits);
  for (var i = d.length - 1; i >= 0; i--) {
    if (d[i] < 9) {
      d[i]++;
      return d;
    }
    d[i] = 0;
  }
  return [1, ...d];
}

void main() {
  print(plusOne([1, 2, 9])); // [1, 3, 0]
  print(plusOne([9, 9])); // [1, 0, 0]
}
