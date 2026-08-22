String? findName(Map<String, String> lookup, String key) {
  return lookup[key];
}

void main() {
  final lookup = {'a': 'Ada', 'b': 'Bob'};
  final name = findName(lookup, 'a') ?? 'unknown';
  final missing = findName(lookup, 'z') ?? 'unknown';
  print(name);
  print(missing);

  final maybeLength = findName(lookup, 'a')?.length;
  print(maybeLength);
}
