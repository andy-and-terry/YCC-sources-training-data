mixin Logger {
  void log(String m) => print('[${runtimeType}] $m');
}
mixin Counted on Object {
  int count = 0;
  void bump() => count++;
}
class Svc with Logger, Counted {}
void main() {
  final s = Svc()..bump()..bump();
  s.log('count=${s.count}');
}
