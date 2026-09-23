import 'dart:collection';

class Range with IterableMixin<int> {
  final int start;
  final int end;

  Range(this.start, this.end);

  @override
  Iterator<int> get iterator => _RangeIterator(start, end);
}

class _RangeIterator implements Iterator<int> {
  final int end;
  int _current;

  _RangeIterator(int start, this.end) : _current = start - 1;

  @override
  int get current => _current;

  @override
  bool moveNext() {
    if (_current + 1 >= end) return false;
    _current++;
    return true;
  }
}

void main() {
  final range = Range(1, 6);
  print(range.toList());
  print(range.map((n) => n * n).toList());
  print(range.where((n) => n.isEven).toList());
}
