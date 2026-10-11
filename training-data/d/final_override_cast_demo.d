import std.stdio;

class Base { string who() { return "base"; } }
class Derived : Base {
    override string who() { return "derived"; }
    void extra() { writeln("extra"); }
}

void main() {
    Base b = new Derived;
    writeln(b.who());
    if (auto d = cast(Derived) b) d.extra();
    Base plain = new Base;
    writeln(cast(Derived) plain is null);
}
