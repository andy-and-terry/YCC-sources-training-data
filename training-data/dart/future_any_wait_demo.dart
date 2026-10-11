Future<String> slow(String name, int ms) =>
    Future.delayed(Duration(milliseconds: ms), () => name);

Future<void> main() async {
  final fastest = await Future.any([slow('a', 60), slow('b', 10), slow('c', 30)]);
  print('first: $fastest');

  final all = await Future.wait([slow('x', 20), slow('y', 5)]);
  print(all);

  final (p, q) = await (slow('p', 5), Future.value(2)).wait;
  print('$p $q');
}
