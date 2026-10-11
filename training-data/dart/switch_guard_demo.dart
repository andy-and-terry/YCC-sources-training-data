String classify(int n) => switch (n) {
      < 0 => 'negative',
      0 => 'zero',
      > 0 && < 10 => 'small',
      >= 10 && < 100 => 'medium',
      _ => 'large',
    };

void main() {
  for (final n in [-5, 0, 7, 42, 1000]) {
    print('$n -> ${classify(n)}');
  }
}
