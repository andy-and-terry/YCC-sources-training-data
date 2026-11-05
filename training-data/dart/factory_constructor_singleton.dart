class Registry {
  static final Registry _inst = Registry._();
  final List<String> items = [];
  Registry._();
  factory Registry() => _inst;
}

void main() {
  Registry().items.add('a');
  print(Registry().items);
  print(identical(Registry(), Registry()));
}
