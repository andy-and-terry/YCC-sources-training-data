extension StringX on String {
  String get capitalized => isEmpty ? this : this[0].toUpperCase() + substring(1);
  bool get isPalin => this == split('').reversed.join();
}

void main() {
  print('dart'.capitalized);
  print('racecar'.isPalin);
}
