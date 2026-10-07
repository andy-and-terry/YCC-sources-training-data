int toGray(int n) => n ^ (n >> 1);

int fromGray(int g) {
  var n = 0;
  for (; g != 0; g >>= 1) {
    n ^= g;
  }
  return n;
}

void main() {
  for (var i = 0; i < 8; i++) {
    final g = toGray(i);
    print('$i -> ${g.toRadixString(2).padLeft(3, '0')} -> ${fromGray(g)}');
  }
}
