import std.stdio;
import std.algorithm : sort;

struct Person {
    string name;
    int age;
}

void main() {
    auto people = [Person("Zed", 40), Person("Amy", 22), Person("Bob", 31)];
    people.sort!((a, b) => a.age < b.age);
    foreach (p; people) writeln(p.name, " ", p.age);
    people.sort!((a, b) => a.name < b.name);
    foreach (p; people) writeln(p.name, " ", p.age);
}
