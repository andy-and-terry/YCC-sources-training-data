@Singleton
class AppConfig {
    Map<String, String> settings = [:]

    void set(String key, String value) {
        settings[key] = value
    }

    String get(String key) {
        return settings[key]
    }
}

AppConfig.instance.set("env", "production")
def other = AppConfig.instance
println other.get("env")
println(AppConfig.instance.is(other))
