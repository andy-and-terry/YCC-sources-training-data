final _vowelStart = RegExp(r'^([aeiou]|xr|yt)');
final _consonant = RegExp(r'^([^aeiou]*qu|[^aeiou]+?(?=y)|[^aeiou]+)(.*)$');

String pigWord(String w) {
  if (_vowelStart.hasMatch(w)) return '${w}ay';
  final m = _consonant.firstMatch(w);
  return m == null ? '${w}ay' : '${m[2]}${m[1]}ay';
}

String translate(String s) => s.toLowerCase().split(RegExp(r'\s+')).map(pigWord).join(' ');

void main() => print(translate('quick fast run apple rhythm square'));
