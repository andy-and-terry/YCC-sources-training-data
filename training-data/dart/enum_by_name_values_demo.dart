enum Level { debug, info, warn, error }

void main() {
  print(Level.values.map((l) => l.name).toList());
  print(Level.values.byName('warn').index);
  print(Level.error.compareTo(Level.info));
  final counts = <Level, int>{};
  for (final l in [Level.info, Level.warn, Level.info]) {
    counts[l] = (counts[l] ?? 0) + 1;
  }
  print(counts);
  try {
    Level.values.byName('fatal');
  } on ArgumentError {
    print('no such level');
  }
}
