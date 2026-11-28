List<String> duval(String s) {
  final out = <String>[];
  var i = 0;
  while (i < s.length) {
    var j = i + 1, k = i;
    while (j < s.length && s[k].compareTo(s[j]) <= 0) {
      k = s[k].compareTo(s[j]) < 0 ? i : k + 1;
      j++;
    }
    while (i <= k) {
      out.add(s.substring(i, i + j - k));
      i += j - k;
    }
  }
  return out;
}

void main() => print(duval('banana'));
