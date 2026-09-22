class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() => _instance;

  AppConfig._internal();

  String theme = 'light';
}

void main() {
  AppConfig().theme = 'dark';
  print(AppConfig().theme);
  print(identical(AppConfig(), AppConfig()));
}
