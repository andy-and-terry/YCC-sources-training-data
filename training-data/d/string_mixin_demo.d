import std.stdio;

string makeGetter(string name, string type) {
    return type ~ " get" ~ name ~ "() { return _" ~ name ~ "; }";
}

struct Config {
    int _port = 8080;
    string _host = "localhost";

    mixin(makeGetter("Port", "int"));
    mixin(makeGetter("Host", "string"));
}

void main() {
    auto config = Config();
    writeln(config.getPort());
    writeln(config.getHost());
}
