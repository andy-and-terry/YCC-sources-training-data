import 'dart:async';

Future<String> slowCall(int ms) async {
  await Future.delayed(Duration(milliseconds: ms));
  return 'done after $ms ms';
}

Future<void> main() async {
  try {
    print(await slowCall(10).timeout(const Duration(milliseconds: 200)));
    print(await slowCall(500).timeout(const Duration(milliseconds: 50)));
  } on TimeoutException catch (e) {
    print('timed out: ${e.duration}');
  }

  final fallback = await slowCall(500)
      .timeout(const Duration(milliseconds: 50), onTimeout: () => 'fallback');
  print(fallback);

  final first = await Future.any([slowCall(80), slowCall(20)]);
  print(first);
}
