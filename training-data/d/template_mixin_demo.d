import std.stdio;

mixin template Greet() {
    void greet() { writeln("Hello from ", typeof(this).stringof); }
}

class A { mixin Greet; }

void main() { new A().greet(); }
