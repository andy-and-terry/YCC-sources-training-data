Iterable<int> triangular(int count) sync* {
  var sum = 0;
  for (var n = 1; n <= count; n++) {
    sum += n;
    yield sum;
  }
}

void main() => print(triangular(10).toList());
