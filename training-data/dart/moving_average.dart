import 'dart:collection';

class MovingAverage {
  MovingAverage(this.size);

  final int size;
  final _window = Queue<double>();
  double _sum = 0;

  double next(double v) {
    _window.addLast(v);
    _sum += v;
    if (_window.length > size) _sum -= _window.removeFirst();
    return _sum / _window.length;
  }
}

void main() {
  final ma = MovingAverage(3);
  print([1.0, 10, 3, 5, 8, 2].map((v) => ma.next(v.toDouble()).toStringAsFixed(2)).join(' '));
}
