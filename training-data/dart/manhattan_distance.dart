// Manhattan distance of two vectors.
int manhattan(List<int> a, List<int> b) {
  var s = 0;
  for (var i = 0; i < a.length; i++) {
    s += (a[i] - b[i]).abs();
  }
  return s;
}

void main() => print(manhattan([1, 2], [4, 6]));
