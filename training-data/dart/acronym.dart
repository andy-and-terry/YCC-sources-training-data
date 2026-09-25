String abbreviate(String phrase) =>
    RegExp(r"[A-Za-z][A-Za-z']*").allMatches(phrase).map((m) => m[0]![0].toUpperCase()).join();

void main() {
  print(abbreviate('Portable Network Graphics'));
  print(abbreviate('Complementary metal-oxide semiconductor'));
}
