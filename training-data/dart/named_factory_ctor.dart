class Config {
  final String host;
  final int port;
  Config._(this.host, this.port);
  factory Config.local() => Config._('localhost', 8080);
  factory Config.fromMap(Map<String, dynamic> m) => Config._(m['host'], m['port']);
}

void main() => print(Config.fromMap({'host': 'a', 'port': 1}).host);
