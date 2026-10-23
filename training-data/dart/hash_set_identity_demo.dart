import 'dart:collection';

class Tag {
  final String name;
  Tag(this.name);

  @override
  bool operator ==(Object other) => other is Tag && other.name == name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => 'Tag($name)';
}

void main() {
  final a = Tag('x');
  final b = Tag('x');

  // Regular set uses == and hashCode
  final normal = <Tag>{a, b};
  print(normal.length);

  // identity: true compares with identical()
  final byIdentity = HashSet<Tag>.identity();
  byIdentity.addAll([a, b]);
  print(byIdentity.length);
  print(byIdentity.contains(a));
  print(byIdentity.contains(Tag('x')));

  // Custom equality via HashSet constructor arguments
  final caseInsensitive = HashSet<String>(
    equals: (p, q) => p.toLowerCase() == q.toLowerCase(),
    hashCode: (s) => s.toLowerCase().hashCode,
  );
  caseInsensitive.addAll(['Dart', 'DART', 'dart', 'Flutter']);
  print(caseInsensitive.length);

  // HashMap.identity works the same way
  final ids = HashMap<Tag, int>.identity();
  ids[a] = 1;
  ids[b] = 2;
  print(ids.length);
}
