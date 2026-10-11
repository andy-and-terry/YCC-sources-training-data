class ValidationError implements Exception {
  final String field;
  ValidationError(this.field);
  @override
  String toString() => 'ValidationError($field)';
}

void validate(Map<String, String> data) {
  if ((data['name'] ?? '').isEmpty) throw ValidationError('name');
}

void process(Map<String, String> data) {
  try {
    validate(data);
  } on ValidationError {
    print('logging failure');
    rethrow;
  }
}

void main() {
  try {
    process({'name': ''});
  } catch (e) {
    print('main got $e');
  }
}
