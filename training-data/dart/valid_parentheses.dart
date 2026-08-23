bool isValid(String s) {
  final stack = <String>[];
  final pairs = {')': '(', ']': '[', '}': '{'};
  for (var i = 0; i < s.length; i++) {
    final ch = s[i];
    if (pairs.containsValue(ch)) {
      stack.add(ch);
    } else if (pairs.containsKey(ch)) {
      if (stack.isEmpty || stack.removeLast() != pairs[ch]) return false;
    }
  }
  return stack.isEmpty;
}

void main() {
  print(isValid('({[]})'));
  print(isValid('(]'));
}
