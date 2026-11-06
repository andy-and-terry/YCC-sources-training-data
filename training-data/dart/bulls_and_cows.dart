// Bulls and Cows scoring for equal-length digit strings.
(int, int) score(String secret, String guess) {
  var bulls = 0;
  final sc = <String, int>{};
  final gc = <String, int>{};
  for (var i = 0; i < secret.length; i++) {
    final s = secret[i], g = guess[i];
    if (s == g) {
      bulls++;
    } else {
      sc[s] = (sc[s] ?? 0) + 1;
      gc[g] = (gc[g] ?? 0) + 1;
    }
  }
  var cows = 0;
  sc.forEach((c, n) {
    final m = gc[c] ?? 0;
    cows += n < m ? n : m;
  });
  return (bulls, cows);
}

void main() {
  final (b, c) = score('1807', '7810');
  print('$b bull(s), $c cow(s)');
}
