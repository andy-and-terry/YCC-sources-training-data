List<int> order(int n, int k) {
  final cycle = 2 * (k - 1);
  int rail(int i) {
    final r = i % cycle;
    return r < k ? r : cycle - r;
  }

  final idx = List.generate(n, (i) => i);
  idx.sort((a, b) => rail(a) != rail(b) ? rail(a).compareTo(rail(b)) : a.compareTo(b));
  return idx;
}

String encrypt(String t, int k) => order(t.length, k).map((i) => t[i]).join();

String decrypt(String c, int k) {
  final out = List.filled(c.length, '');
  final idx = order(c.length, k);
  for (var pos = 0; pos < idx.length; pos++) {
    out[idx[pos]] = c[pos];
  }
  return out.join();
}

void main() {
  final c = encrypt('WEAREDISCOVERED', 3);
  print('$c ${decrypt(c, 3)}');
}
