import 'dart:collection';

// Josephus problem: every k-th person is eliminated from a circle of n.

List<int> eliminationOrder(int n, int k) {
  final queue = Queue<int>.from(List.generate(n, (i) => i + 1));
  final order = <int>[];
  while (queue.isNotEmpty) {
    for (var i = 0; i < k - 1; i++) {
      queue.addLast(queue.removeFirst());
    }
    order.add(queue.removeFirst());
  }
  return order;
}

int survivor(int n, int k) {
  var result = 0;
  for (var i = 2; i <= n; i++) {
    result = (result + k) % i;
  }
  return result + 1;
}

void main() {
  final order = eliminationOrder(7, 3);
  print('Elimination order: $order');
  print('Survivor (queue): ${order.last}');
  print('Survivor (recurrence): ${survivor(7, 3)}');
  print('n=41, k=3 survivor: ${survivor(41, 3)}');
}
