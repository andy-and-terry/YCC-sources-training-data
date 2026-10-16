import std.stdio;

class AppException : Exception {
    this(string msg) { super(msg); }
}

class ConfigException : AppException {
    string key;
    this(string key) {
        super("missing key: " ~ key);
        this.key = key;
    }
}

void load(string key) {
    throw new ConfigException(key);
}

void main() {
    try load("port");
    catch (ConfigException e) writeln("config ", e.key);
    catch (AppException e) writeln("app ", e.msg);
}
