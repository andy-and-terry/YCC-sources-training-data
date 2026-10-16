int percent(int part, int whole) {
  assert(whole != 0, 'whole must be nonzero');
  return part * 100 ~/ whole;
}

void main() {
  print(percent(1, 4));
  try {
    print(percent(1, 0));
  } on AssertionError catch (e) {
    print('assertion: ${e.message}');
  }
}
