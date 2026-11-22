// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
void main() {
  var row = [1];
  final out = [1];
  for (var i = 0; i < 9; i++) {
    final next = [0];
    for (final x in row.reversed) {
      next.add(next.last + x);
    }
    row = next;
    out.add(row.last);
  }
  print(out.join(' '));
}
