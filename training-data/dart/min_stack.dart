class MinStack {
  final List<int> _stack = [];
  final List<int> _minStack = [];

  void push(int value) {
    _stack.add(value);
    if (_minStack.isEmpty || value <= _minStack.last) {
      _minStack.add(value);
    }
  }

  int pop() {
    final top = _stack.removeLast();
    if (top == _minStack.last) _minStack.removeLast();
    return top;
  }

  int min() => _minStack.last;
}

void main() {
  final stack = MinStack();
  stack.push(5);
  stack.push(2);
  stack.push(7);
  print(stack.min());
  stack.pop();
  print(stack.min());
}
