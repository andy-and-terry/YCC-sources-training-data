import std.stdio;

abstract class Animal {
    string name;
    this(string name) { this.name = name; }
    abstract string sound();
    void speak() { writeln(name, " says ", sound()); }
}

class Dog : Animal {
    this() { super("Dog"); }
    override string sound() { return "woof"; }
}

class Cat : Animal {
    this() { super("Cat"); }
    override string sound() { return "meow"; }
}

void main() {
    foreach (a; [cast(Animal) new Dog, new Cat]) a.speak();
}
