int countVowels(String s) {
  return s.split('').where((c) => 'aeiou'.contains(c)).length;
}

void main() {
  print(countVowels('hello world'));
}
