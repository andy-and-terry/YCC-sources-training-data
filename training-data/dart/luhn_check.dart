bool luhnValid(String input) {
  final s = input.replaceAll(' ', '');
  if (s.length < 2 || !RegExp(r'^\d+$').hasMatch(s)) return false;
  var sum = 0;
  for (var i = 0; i < s.length; i++) {
    var d = int.parse(s[s.length - 1 - i]);
    if (i.isOdd) {
      d *= 2;
      if (d > 9) d -= 9;
    }
    sum += d;
  }
  return sum % 10 == 0;
}

void main() {
  print('${luhnValid("4539 3195 0343 6467")} ${luhnValid("8273 1232 7352 0569")}');
}
