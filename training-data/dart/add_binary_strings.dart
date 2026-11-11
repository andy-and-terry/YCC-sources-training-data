String addBinary(String a, String b) {
  var i = a.length - 1, j = b.length - 1, carry = 0;
  final out = StringBuffer();
  final digits = <int>[];
  while (i >= 0 || j >= 0 || carry > 0) {
    var sum = carry;
    if (i >= 0) sum += int.parse(a[i--]);
    if (j >= 0) sum += int.parse(b[j--]);
    digits.add(sum % 2);
    carry = sum ~/ 2;
  }
  for (final d in digits.reversed) {
    out.write(d);
  }
  return out.toString();
}

void main() {
  print(addBinary('1010', '1011')); // 10101
}
