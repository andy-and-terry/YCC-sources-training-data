import std.stdio;

interface Animal { string sound(); }
class Dog : Animal { string sound() { return "woof"; } }
class Cow : Animal { string sound() { return "moo"; } }

void main() {
    Animal[] zoo = [new Dog, new Cow];
    foreach (a; zoo) writeln(a.sound());
}
