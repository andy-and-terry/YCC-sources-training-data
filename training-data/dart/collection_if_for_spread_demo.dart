List<int> buildList(bool includeExtras, List<int> extras) {
  return [
    1,
    2,
    3,
    if (includeExtras) 4,
    for (final e in extras) e * 10,
    ...extras,
  ];
}

void main() {
  print(buildList(true, [7, 8]));
  print(buildList(false, []));

  final base = {'a': 1, 'b': 2};
  final merged = {
    ...base,
    'c': 3,
    if (base.length > 1) 'd': 4,
  };
  print(merged);
}
