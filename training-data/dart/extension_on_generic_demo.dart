extension ListStats on List<num> {
  double get mean => isEmpty ? 0 : reduce((a, b) => a + b) / length;
  num get range => isEmpty ? 0 : reduce((a, b) => a > b ? a : b) - reduce((a, b) => a < b ? a : b);
}

extension Chunk<T> on List<T> {
  List<List<T>> chunked(int size) => [
        for (var i = 0; i < length; i += size)
          sublist(i, i + size > length ? length : i + size)
      ];
}

void main() {
  print([2, 4, 9].mean);
  print([2, 4, 9].range);
  print([1, 2, 3, 4, 5].chunked(2));
}
