import 'dart:async';

void main() async {
  final controller = StreamController<int>.broadcast();

  final subscription1 = controller.stream.listen((value) {
    print('listener 1 got $value');
  });

  final evenStream = controller.stream.where((value) => value.isEven);
  final subscription2 = evenStream.listen((value) {
    print('listener 2 (evens only) got $value');
  });

  controller.add(1);
  controller.add(2);
  controller.add(3);
  controller.add(4);

  await Future.delayed(Duration.zero);

  await subscription1.cancel();
  await subscription2.cancel();
  await controller.close();
}
