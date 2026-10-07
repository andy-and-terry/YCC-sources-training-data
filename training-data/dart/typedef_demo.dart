typedef Validator = bool Function(String value);
typedef IntTransform = int Function(int value);

bool isNotEmpty(String value) => value.isNotEmpty;
bool isNumeric(String value) => int.tryParse(value) != null;

List<String> filterValid(List<String> values, Validator validator) {
  return values.where(validator).toList();
}

int applyTwice(int value, IntTransform transform) {
  return transform(transform(value));
}

void main() {
  final inputs = ['42', '', 'abc', '7'];
  print(filterValid(inputs, isNotEmpty));
  print(filterValid(inputs, isNumeric));
  print(applyTwice(3, (n) => n * 2));
}
