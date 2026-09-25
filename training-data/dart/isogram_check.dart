bool isIsogram(String word) {
  final letters = word.toLowerCase().replaceAll(RegExp('[^a-z]'), '');
  return letters.split('').toSet().length == letters.length;
}

void main() {
  for (final w in ['lumberjacks', 'background', 'six-year-old', 'isograms']) {
    print('$w ${isIsogram(w)}');
  }
}
