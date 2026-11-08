double area(List<List<double>> p) {
  var s = 0.0;
  for (var i = 0; i < p.length; i++) {
    final j = (i + 1) % p.length;
    s += p[i][0] * p[j][1] - p[j][0] * p[i][1];
  }
  return s.abs() / 2;
}

void main() => print(area([[0, 0], [4, 0], [4, 3], [0, 3]]));
