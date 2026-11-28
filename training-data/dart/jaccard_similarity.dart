double jaccard<T>(Set<T> a, Set<T> b) {
  final union = a.union(b).length;
  return union == 0 ? 1.0 : a.intersection(b).length / union;
}

void main() {
  print(jaccard({1, 2, 3, 4}, {3, 4, 5}));
}
