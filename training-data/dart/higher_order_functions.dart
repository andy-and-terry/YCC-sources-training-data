void main() {
  final numbers = [1, 2, 3, 4, 5];
  final doubled = numbers.map((n) => n * 2).toList();
  final evens = numbers.where((n) => n % 2 == 0).toList();
  final sum = numbers.fold(0, (acc, n) => acc + n);

  print(doubled);
  print(evens);
  print(sum);
}
