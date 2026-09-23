Stream<int> countUpAsync(int limit) async* {
  for (var i = 1; i <= limit; i++) {
    await Future.delayed(const Duration(milliseconds: 1));
    yield i;
  }
}

Stream<int> evensOnly(Stream<int> source) async* {
  await for (final value in source) {
    if (value.isEven) {
      yield value;
    }
  }
}

void main() async {
  final values = await countUpAsync(5).toList();
  print(values);

  final evens = await evensOnly(countUpAsync(6)).toList();
  print(evens);
}
