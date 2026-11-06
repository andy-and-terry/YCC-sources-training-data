// Repunits: numbers made only of the digit 1.
Iterable<int> repunits(int count) sync* {
  var r = 0;
  for (var i = 0; i < count; i++) {
    r = r * 10 + 1;
    yield r;
  }
}

void main() => print(repunits(5).toList());
