int fib(int n) => n < 2 ? n : fib(n - 1) + fib(n - 2);

void main() {
  final sw = Stopwatch()..start();
  final result = fib(25);
  sw.stop();

  print('fib(25) = $result');
  print('ran: ${sw.elapsedMicroseconds >= 0}');
  print('running: ${sw.isRunning}');

  sw.reset();
  print('after reset: ${sw.elapsedTicks}');
  print('frequency > 0: ${sw.frequency > 0}');
}
