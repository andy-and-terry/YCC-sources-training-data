import 'dart:async';

void main() {
  runZonedGuarded(() {
    Future.delayed(const Duration(milliseconds: 5), () {
      throw StateError('async boom');
    });
  }, (error, stack) {
    print('zone caught: $error');
  });

  runZoned(() {
    print('inside zone');
  });
}
