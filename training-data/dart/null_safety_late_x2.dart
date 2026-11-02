class Lazy {
  late final String value = _compute();
  String _compute() {
    print('computing');
    return 'result';
  }
}

void main() {
  final l = Lazy();
  print(l.value);
  print(l.value);
}
