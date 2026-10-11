void main() {
  final fixed = List<int>.unmodifiable([1, 2, 3]);
  try {
    fixed.add(4);
  } on UnsupportedError catch (e) {
    print('cannot modify: ${e.message}');
  }

  const constList = [1, 2, 3];
  try {
    constList.add(4);
  } on UnsupportedError {
    print('const list is immutable');
  }

  final growable = List<int>.generate(4, (i) => i * i);
  growable.add(16);
  print(growable);
  print(List.filled(3, 'x'));
}
