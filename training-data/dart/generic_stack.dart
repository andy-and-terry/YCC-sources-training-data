class Stack<T> {
  final List<T> _items = [];

  void push(T item) => _items.add(item);

  T? pop() => _items.isEmpty ? null : _items.removeLast();

  T? peek() => _items.isEmpty ? null : _items.last;

  bool get isEmpty => _items.isEmpty;
}

void main() {
  final intStack = Stack<int>();
  intStack.push(1);
  intStack.push(2);
  intStack.push(3);
  print(intStack.pop());
  print(intStack.peek());
}
