String bwt(String s) {
  final rots = [for (var i = 0; i < s.length; i++) s.substring(i) + s.substring(0, i)]..sort();
  return rots.map((r) => r[r.length - 1]).join();
}

void main() => print(bwt('banana\$'));
