class Config {
  late final String environment;
  late int _cachedValue;
  bool _computed = false;

  void loadEnvironment(String env) {
    environment = env;
  }

  int get cachedValue {
    if (!_computed) {
      print('computing expensive value...');
      _cachedValue = 42;
      _computed = true;
    }
    return _cachedValue;
  }
}

void main() {
  final config = Config();
  config.loadEnvironment('production');
  print(config.environment);
  print(config.cachedValue);
  print(config.cachedValue);
}
