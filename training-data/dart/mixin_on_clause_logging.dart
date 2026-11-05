abstract class Base { void run(); }

mixin Timing on Base {
  void timed() {
    print('before');
    run();
    print('after');
  }
}

class Job extends Base with Timing {
  @override
  void run() => print('running');
}

void main() => Job().timed();
