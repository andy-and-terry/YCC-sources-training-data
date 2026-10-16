void level3() => throw StateError('deep failure');
void level2() => level3();
void level1() => level2();

void main() {
  try {
    level1();
  } catch (e, st) {
    print('caught: $e');
    final first = st.toString().split('\n').first;
    print(first.isNotEmpty);
  }
}
