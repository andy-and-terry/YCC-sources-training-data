String encode(String input) {
  if (input.isEmpty) return '';

  final buffer = StringBuffer();
  var count = 1;

  for (var i = 1; i <= input.length; i++) {
    if (i < input.length && input[i] == input[i - 1]) {
      count++;
    } else {
      buffer.write(input[i - 1]);
      buffer.write(count);
      count = 1;
    }
  }

  return buffer.toString();
}

void main() {
  print(encode('aaabbbcca'));
}
