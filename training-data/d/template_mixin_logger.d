import std.stdio;

mixin template Logger() {
    void log(string m) { writeln("[", typeof(this).stringof, "] ", m); }
}

class Service { mixin Logger; }

void main() { new Service().log("started"); }
