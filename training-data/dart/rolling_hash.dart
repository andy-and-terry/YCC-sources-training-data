void main() {
  const s = 'abcabc';
  const k = 3, b = 31, m = 1000003;
  var pw = 1;
  for (var i = 1; i < k; i++) pw = pw * b % m;
  var h = 0;
  for (var i = 0; i < k; i++) h = (h * b + s.codeUnitAt(i)) % m;
  print('0 $h');
  for (var i = 1; i + k <= s.length; i++) {
    h = (h - s.codeUnitAt(i - 1) * pw % m + m) % m;
    h = (h * b + s.codeUnitAt(i + k - 1)) % m;
    print('$i $h');
  }
}
