int hamming(String a, String b) {
  if (a.length != b.length) {
    throw ArgumentError('strands must be of equal length');
  }
  var d = 0;
  for (var i = 0; i < a.length; i++) {
    if (a.codeUnitAt(i) != b.codeUnitAt(i)) d++;
  }
  return d;
}

void main() {
  print(hamming('GAGCCTACTAACGGGAT', 'CATCGTAATGACGGCCT'));
  try {
    hamming('AB', 'A');
  } on ArgumentError catch (e) {
    print('error: ${e.message}');
  }
}
