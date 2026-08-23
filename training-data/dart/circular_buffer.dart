class CircularBuffer {
  final List<int?> buffer;
  final int capacity;
  int head = 0;
  int size = 0;

  CircularBuffer(this.capacity) : buffer = List<int?>.filled(capacity, null);

  void add(int value) {
    final tail = (head + size) % capacity;
    buffer[tail] = value;
    if (size < capacity) {
      size++;
    } else {
      head = (head + 1) % capacity;
    }
  }

  List<int> toList() {
    return [for (var i = 0; i < size; i++) buffer[(head + i) % capacity]!];
  }
}

void main() {
  final cb = CircularBuffer(3);
  for (final v in [1, 2, 3, 4, 5]) cb.add(v);
  print(cb.toList());
}
