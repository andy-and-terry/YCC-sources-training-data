void main() {
  const limit = 80;
  final composite = List<bool>.filled(limit + 1, false);
  for (var i = 2; i * i <= limit; i++) {
    if (!composite[i]) {
      for (var j = i * i; j <= limit; j += i) {
        composite[j] = true;
      }
    }
  }
  final pairs = <String>[
    for (var p = 3; p + 2 <= limit; p++)
      if (!composite[p] && !composite[p + 2]) '($p,${p + 2})'
  ];
  print(pairs.join(' ')); // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
}
