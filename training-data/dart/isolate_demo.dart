import 'dart:isolate';

class SumRequest {
  final List<int> numbers;
  final SendPort replyPort;
  SumRequest(this.numbers, this.replyPort);
}

void sumWorker(SumRequest request) {
  final total = request.numbers.fold<int>(0, (acc, n) => acc + n);
  request.replyPort.send(total);
}

Future<int> sumInIsolate(List<int> numbers) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(sumWorker, SumRequest(numbers, receivePort.sendPort));
  final result = await receivePort.first;
  return result as int;
}

Future<void> main() async {
  final result = await sumInIsolate([1, 2, 3, 4, 5]);
  print(result);
}
