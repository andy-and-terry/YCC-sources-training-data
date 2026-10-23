import 'dart:convert';

void main() {
  const text = 'héllo €';
  final bytes = utf8.encode(text);
  print(bytes);
  print('chars: ${text.length}, bytes: ${bytes.length}');
  print(utf8.decode(bytes));

  final b64 = base64.encode(bytes);
  print(b64);
  print(utf8.decode(base64.decode(b64)));

  print(latin1.encode('abc'));
  print(ascii.decode([72, 105]));
}
