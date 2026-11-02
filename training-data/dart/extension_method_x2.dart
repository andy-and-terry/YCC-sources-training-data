extension Capitalize on String {
  String get capitalized => isEmpty ? this : this[0].toUpperCase() + substring(1);
}

void main() => print('dart'.capitalized);
