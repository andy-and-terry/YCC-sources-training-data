extension StringExtension on String {
  bool get isPalindrome {
    final cleaned = toLowerCase();
    return cleaned == cleaned.split('').reversed.join('');
  }
}

void main() {
  print('A man a plan a canal Panama'.replaceAll(' ', '').isPalindrome);
  print('hello'.isPalindrome);
}
