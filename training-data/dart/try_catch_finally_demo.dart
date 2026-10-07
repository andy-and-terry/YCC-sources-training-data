class ValidationError implements Exception {
  final String message;
  ValidationError(this.message);

  @override
  String toString() => 'ValidationError: $message';
}

int parseAge(String input) {
  final age = int.parse(input);
  if (age < 0 || age > 150) throw ValidationError('age out of range: $age');
  return age;
}

void attempt(String input) {
  try {
    print('age = ${parseAge(input)}');
  } on FormatException catch (e) {
    print('bad format: ${e.message}');
  } on ValidationError catch (e) {
    print(e);
  } catch (e, stack) {
    print('unexpected: $e (${stack.runtimeType})');
  } finally {
    print('done with "$input"');
  }
}

void main() {
  attempt('42');
  attempt('abc');
  attempt('200');
}
