bool isSelfDescribing(String s) {
  for (var i = 0; i < s.length; i++) {
    final count = s.split('').where((c) => c == '$i').length;
    if (count != int.parse(s[i])) return false;
  }
  return true;
}

void main() {
  for (final s in ['1210', '2020', '21200', '1211']) {
    print('$s ${isSelfDescribing(s)}');
  }
}
