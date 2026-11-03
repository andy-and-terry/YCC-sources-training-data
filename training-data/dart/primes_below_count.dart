int countPrimesBelow(int n) {
  if (n < 3) return 0;
  final composite = List<bool>.filled(n, false);
  var count = 0;
  for (var i = 2; i < n; i++) {
    if (composite[i]) continue;
    count++;
    for (var j = i * i; j < n; j += i) {
      composite[j] = true;
    }
  }
  return count;
}

void main() => print(countPrimesBelow(100));
