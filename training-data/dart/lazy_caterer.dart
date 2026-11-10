int pieces(int cuts) => (cuts * cuts + cuts + 2) ~/ 2;

void main() {
  print(List.generate(10, pieces).join(' ')); // 1 2 4 7 11 16 22 29 37 46
}
