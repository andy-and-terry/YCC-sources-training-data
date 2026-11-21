// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
bool isBouncy(int n) {
  final d = n.toString().split('');
  final up = [...d]..sort();
  final down = up.reversed.toList();
  return d.join() != up.join() && d.join() != down.join();
}

void main() {
  print([for (var n = 1; n < 1000; n++) if (isBouncy(n)) n].length);
}
