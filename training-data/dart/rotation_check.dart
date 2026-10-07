bool isRotation(String a, String b) => a.length == b.length && (a + a).contains(b);

void main() {
  print(isRotation('waterbottle', 'erbottlewat'));
  print(isRotation('abc', 'acb'));
}
