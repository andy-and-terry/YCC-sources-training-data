import 'dart:async';

Future<void> main() async {
  var ticks = 0;
  final done = Completer<void>();

  Timer.periodic(const Duration(milliseconds: 20), (timer) {
    ticks++;
    print('tick $ticks');
    if (ticks == 3) {
      timer.cancel();
      done.complete();
    }
  });

  Timer(const Duration(milliseconds: 10), () => print('one-shot fired'));
  await done.future;

  final cancelled = Timer(const Duration(seconds: 5), () => print('never'));
  cancelled.cancel();
  print('active: ${cancelled.isActive}');

  final result = await Future.delayed(const Duration(milliseconds: 5), () => 'delayed value');
  print(result);

  await Future.any([
    Future.delayed(const Duration(milliseconds: 30), () => print('slow')),
    Future.delayed(const Duration(milliseconds: 5), () => print('fast')),
  ]);
}
