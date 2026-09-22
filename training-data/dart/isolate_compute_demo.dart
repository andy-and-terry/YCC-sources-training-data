import 'dart:isolate';

int sumOfSquares(int n) {
  var total = 0;
  for (var i = 1; i <= n; i++) {
    total += i * i;
  }
  return total;
}

Future<void> main() async {
  final result = await Isolate.run(() => sumOfSquares(1000));
  print(result);
}
