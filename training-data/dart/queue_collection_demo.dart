import 'dart:collection';

void main() {
  final q = Queue<int>()..addAll([1, 2, 3]);
  q.addFirst(0);
  q.addLast(4);
  print(q);
  print(q.removeFirst());
  print(q.removeLast());
  print(q);
}
