extension type Meters(double value) {
  Meters operator +(Meters other) => Meters(value + other.value);

  String describe() => '${value}m';
}

extension type UserId(int value) implements int {}

void printUserId(UserId id) => print('user #$id');

void main() {
  final a = Meters(5.0);
  final b = Meters(2.5);
  final total = a + b;
  print(total.describe());

  final id = UserId(42);
  printUserId(id);
  print(id + 1);
}
