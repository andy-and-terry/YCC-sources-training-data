// noSuchMethod lets an object intercept calls to members it does not define.
class Recorder {
  final List<String> calls = [];

  @override
  dynamic noSuchMethod(Invocation invocation) {
    final name = invocation.memberName.toString();
    final args = invocation.positionalArguments;
    calls.add('$name$args');
    if (invocation.isGetter) return 'getter-value';
    return args.isEmpty ? null : args.first;
  }
}

abstract class Greeter {
  String greet(String name);
}

// Implementing an interface without writing the methods
class AutoGreeter implements Greeter {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #greet) {
      return 'Hello, ${invocation.positionalArguments.first}!';
    }
    return super.noSuchMethod(invocation);
  }
}

void main() {
  final dynamic r = Recorder();
  print(r.anything(1, 2));
  print(r.other('x'));
  print(r.someProperty);
  print(r.calls);

  final Greeter g = AutoGreeter();
  print(g.greet('Ada'));
}
