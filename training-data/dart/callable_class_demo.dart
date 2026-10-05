class Multiplier {
  final int factor;
  const Multiplier(this.factor);

  int call(int value) => value * factor;
}

class Pipeline {
  final List<int Function(int)> _steps = [];

  Pipeline add(int Function(int) step) {
    _steps.add(step);
    return this;
  }

  int call(int input) => _steps.fold(input, (acc, step) => step(acc));
}

void main() {
  const triple = Multiplier(3);
  print(triple(7));
  print([1, 2, 3].map(triple.call).toList());

  final pipe = Pipeline()
      .add(Multiplier(2).call)
      .add((x) => x + 1)
      .add(triple.call);
  print(pipe(5));
}
