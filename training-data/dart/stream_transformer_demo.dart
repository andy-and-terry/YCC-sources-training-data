import 'dart:async';

Future<void> main() async {
  final doubler = StreamTransformer<int, int>.fromHandlers(
    handleData: (data, sink) => sink.add(data * 2),
    handleDone: (sink) {
      sink.add(-1);
      sink.close();
    },
  );

  final stream = Stream.fromIterable([1, 2, 3]).transform(doubler);
  print(await stream.toList());

  final broadcast = Stream.periodic(const Duration(milliseconds: 5), (i) => i)
      .take(5)
      .asBroadcastStream();
  print(await broadcast.where((n) => n.isOdd).toList());
  print(await Stream.fromIterable([3, 1, 2]).reduce((a, b) => a + b));
}
