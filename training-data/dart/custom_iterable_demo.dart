class Range extends Iterable<int> {
  final int start;
  final int end;
  final int step;

  Range(this.start, this.end, {this.step = 1});

  @override
  Iterator<int> get iterator => _RangeIterator(start, end, step);
}

class _RangeIterator implements Iterator<int> {
  final int end;
  final int step;
  int _current;

  _RangeIterator(int start, this.end, this.step) : _current = start - step;

  @override
  int get current => _current;

  @override
  bool moveNext() {
    _current += step;
    return _current < end;
  }
}

void main() {
  final range = Range(0, 10, step: 2);
  print(range.toList());
  print(range.where((n) => n > 4).toList());
  print(range.length);
}
