void main() {
  const primes = [2, 3, 5, 7];
  const lookup = {'a': 1, 'b': 2};
  const tags = {'x', 'y'};
  print(primes.length + lookup.length + tags.length);

  final a = const [1, 2];
  final b = const [1, 2];
  print(identical(a, b));

  final c = [1, 2];
  final d = [1, 2];
  print(identical(c, d));
}
