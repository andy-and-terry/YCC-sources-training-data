import std.stdio;

class AppConfig {
    private static AppConfig instance_;
    string theme = "light";

    private this() {}

    static AppConfig instance() {
        if (instance_ is null) instance_ = new AppConfig();
        return instance_;
    }
}

void main() {
    AppConfig.instance().theme = "dark";
    writeln(AppConfig.instance().theme);
    writeln(AppConfig.instance() is AppConfig.instance());
}
