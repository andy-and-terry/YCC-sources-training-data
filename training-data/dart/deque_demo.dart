import 'dart:collection';

void main() {
  final deque = Queue<int>();
  deque.addLast(1);
  deque.addLast(2);
  deque.addFirst(0);
  print(deque.toList());

  final front = deque.removeFirst();
  print(front);

  final back = deque.removeLast();
  print(back);

  print(deque.toList());
}
