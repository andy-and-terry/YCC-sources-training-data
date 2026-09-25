String nextTerm(String s) => s.replaceAllMapped(RegExp(r'(\d)\1*'), (m) => '${m[0]!.length}${m[1]}');

Iterable<String> lookAndSay() sync* {
  var s = '1';
  while (true) {
    yield s;
    s = nextTerm(s);
  }
}

void main() => lookAndSay().take(8).forEach(print);
