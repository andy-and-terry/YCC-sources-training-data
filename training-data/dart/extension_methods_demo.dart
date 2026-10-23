extension StringX on String {
  String get capitalized =>
      isEmpty ? this : this[0].toUpperCase() + substring(1);
  bool get isPalindrome => this == split('').reversed.join();
}

extension IntX on int {
  Duration get seconds => Duration(seconds: this);
}

void main() {
  print('hello'.capitalized);
  print('level'.isPalindrome);
  print(5.seconds);
}
