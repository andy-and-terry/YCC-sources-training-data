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

  Timer(const Duration(milliseconds: 5), () => print('one-shot fired first'));

  await done.future;
  print('finished after $ticks ticks');
}
