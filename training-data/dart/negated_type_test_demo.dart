// "is" and "is!" test runtime types; "as" casts.
String describe(Object? value) {
  if (value is! num) {
    return value == null ? 'null' : 'not a number: ${value.runtimeType}';
  }
  // value is promoted to num here because the negative case returned
  if (value is int) return 'int ${value.isEven ? "even" : "odd"}';
  return 'double ${value.toStringAsFixed(1)}';
}

void printLength(Object value) {
  if (value is! String) {
    print('skipping ${value.runtimeType}');
    return;
  }
  print('length ${value.length}');
}

void main() {
  for (final v in [3, 4, 2.55, 'hi', null, [1, 2]]) {
    print(describe(v));
  }

  printLength('hello');
  printLength(42);

  Object o = 'text';
  print(o is String);
  print(o is! int);
  print(o is Object);

  try {
    final n = o as int;
    print(n);
  } on TypeError catch (e) {
    print('cast failed: ${e.runtimeType}');
  }
}
