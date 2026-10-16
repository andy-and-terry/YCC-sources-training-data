interface class Logger {
  void log(String message) => print('[log] $message');
}

base class Entity {
  final int id;
  Entity(this.id);
}

final class User extends Entity {
  final String name;
  User(super.id, this.name);
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) => print('console: $message');
}

void main() {
  Logger l = ConsoleLogger();
  l.log('started');
  final u = User(1, 'sam');
  print('${u.id} ${u.name}');
}
