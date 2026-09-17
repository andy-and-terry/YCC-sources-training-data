class DListNode<T> {
  T value;
  DListNode<T>? prev;
  DListNode<T>? next;
  DListNode(this.value);
}

class DoublyLinkedList<T> {
  DListNode<T>? _head;
  DListNode<T>? _tail;

  void pushBack(T value) {
    final node = DListNode<T>(value);
    if (_tail == null) {
      _head = node;
      _tail = node;
    } else {
      _tail!.next = node;
      node.prev = _tail;
      _tail = node;
    }
  }

  void pushFront(T value) {
    final node = DListNode<T>(value);
    if (_head == null) {
      _head = node;
      _tail = node;
    } else {
      _head!.prev = node;
      node.next = _head;
      _head = node;
    }
  }

  List<T> toList() {
    final result = <T>[];
    var node = _head;
    while (node != null) {
      result.add(node.value);
      node = node.next;
    }
    return result;
  }
}

void main() {
  final list = DoublyLinkedList<int>();
  list.pushBack(2);
  list.pushBack(3);
  list.pushFront(1);
  print(list.toList());
}
