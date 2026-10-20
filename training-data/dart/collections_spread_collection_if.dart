void main() {
  var base = [1, 2, 3];
  var more = [...base, 4, if (base.length > 2) 99, for (var i in base) i * 10];
  print(more);
  Set<int> s = {...base, 3, 3};
  Map<String, int> m = {'a': 1, ...{'b': 2}, if (s.length == 3) 'c': 3};
  print('$s $m');
  List<int>? maybe;
  print([0, ...?maybe]);
  print(base.where((e) => e.isOdd).map((e) => e * e).toList());
  print(base.fold<int>(0, (a, b) => a + b));
  print(more.take(3).skip(1).toList());
  print(base.any((e) => e > 2) && base.every((e) => e > 0));
  var sorted = [5, 1, 4]..sort((a, b) => b.compareTo(a));
  print(sorted);
  print(m.entries.map((e) => '${e.key}=${e.value}').join(','));
  print(base.asMap());
  var grouped = <bool, List<int>>{};
  for (var n in [1, 2, 3, 4]) { (grouped[n.isEven] ??= []).add(n); }
  print(grouped);
  print([3, 1, 2].reversed.toList()..add(0));
  print(List.generate(4, (i) => i * i));
  print(List.filled(3, 'x'));
  print('${base.first} ${base.last} ${base.indexOf(2)} ${base.sublist(1)}');
}
