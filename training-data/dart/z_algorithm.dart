List<int> zArray(String s) {
  final n = s.length;
  final z = List<int>.filled(n, 0);
  var l = 0, r = 0;

  for (var i = 1; i < n; i++) {
    if (i < r) {
      final candidate = r - i;
      final mirror = z[i - l];
      z[i] = mirror < candidate ? mirror : candidate;
    }
    while (i + z[i] < n && s[z[i]] == s[i + z[i]]) {
      z[i]++;
    }
    if (i + z[i] > r) {
      l = i;
      r = i + z[i];
    }
  }

  return z;
}

void main() {
  print(zArray('aabxaabxcaabxaabxay'));
}
