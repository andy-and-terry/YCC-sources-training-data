class Config {
  String? name;
  List<int>? ports;
}

void main() {
  final c = Config();
  print(c.name?.length);
  print(c.name ?? 'unnamed');
  c.name ??= 'default';
  print(c.name);
  print(c.ports?.first);
  c.ports = [80];
  print(c.ports!.first);
  final list = [1, null, 3];
  print([...list.whereType<int>(), ...?c.ports]);
  String? maybe;
  print(maybe?.toUpperCase() ?? 'null!');
}
