String ordinal(int n) {
  final suffix = switch ((n % 100, n % 10)) {
    (>= 11 && <= 13, _) => 'th',
    (_, 1) => 'st',
    (_, 2) => 'nd',
    (_, 3) => 'rd',
    _ => 'th',
  };
  return '$n$suffix';
}

void main() => print([1, 2, 3, 4, 11, 12, 13, 21, 101, 111].map(ordinal).join(' '));
