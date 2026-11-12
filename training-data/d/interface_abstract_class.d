import std.stdio;
interface Greeter { string greet(); }
class En : Greeter { string greet() { return "hello"; } }
class Fr : Greeter { string greet() { return "bonjour"; } }
void main() { foreach (g; [cast(Greeter) new En, new Fr]) writeln(g.greet()); }
