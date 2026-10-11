void describe(Object? value) {
  if (value case int n when n > 100) {
    print('big int $n');
  } else if (value case [int a, int b]) {
    print('pair $a,$b');
  } else if (value case String s) {
    print('string of ${s.length}');
  } else {
    print('other');
  }
}

void main() {
  describe(500);
  describe([1, 2]);
  describe('hello');
  describe(3.5);
}
