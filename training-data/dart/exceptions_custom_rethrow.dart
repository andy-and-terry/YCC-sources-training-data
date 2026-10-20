class InsufficientFunds implements Exception {
  final double needed;
  InsufficientFunds(this.needed);
  @override
  String toString() => 'InsufficientFunds(needed: $needed)';
}

void withdraw(double bal, double amt) {
  if (amt > bal) throw InsufficientFunds(amt - bal);
}

void main() {
  try {
    withdraw(10, 25);
  } on InsufficientFunds catch (e) {
    print('caught $e');
  }
  try {
    int.parse('abc');
  } on FormatException catch (e) {
    print('format: ${e.message}');
  } catch (e, st) {
    print('other $e ${st.runtimeType}');
  } finally {
    print('finally');
  }
  try {
    try { throw StateError('inner'); } catch (e) { print('log $e'); rethrow; }
  } catch (e) {
    print('outer $e');
  }
  try { [1][5]; } on RangeError catch (e) { print(e.runtimeType); }
  try { assert(1 > 2, 'assertion'); } on AssertionError { print('assert'); }
  try { null as dynamic; (null as dynamic).foo(); } on NoSuchMethodError { print('nsm'); }
}
