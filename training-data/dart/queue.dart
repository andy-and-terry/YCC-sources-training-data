import 'dart:collection';

class Queue<T> {
  final _items = ListQueue<T>();

  void enqueue(T item) => _items.addLast(item);

  T dequeue() => _items.removeFirst();

  bool get isEmpty => _items.isEmpty;
}

void main() {
  final q = Queue<int>();
  q.enqueue(1);
  q.enqueue(2);
  q.enqueue(3);
  print('${q.dequeue()} ${q.isEmpty}');
}
