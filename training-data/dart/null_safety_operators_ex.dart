String? lookup(Map<String, String> m, String k) => m[k];

void main() {
  final m = {'a': 'alpha'};
  print(lookup(m, 'a')?.toUpperCase());
  print(lookup(m, 'z')?.length ?? -1);
  String? name;
  name ??= 'guest';
  print(name);
  print(lookup(m, 'a')!.length);
}
