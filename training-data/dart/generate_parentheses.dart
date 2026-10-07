void backtrack(List<String> result, String current, int open, int close, int max) {
  if (current.length == max * 2) {
    result.add(current);
    return;
  }
  if (open < max) backtrack(result, '$current(', open + 1, close, max);
  if (close < open) backtrack(result, '$current)', open, close + 1, max);
}

void main() {
  final result = <String>[];
  backtrack(result, '', 0, 0, 3);
  print(result);
}
