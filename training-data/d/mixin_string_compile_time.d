import std.stdio;
enum ops = ["add", "sub"];
string gen() { string s; foreach (o; ops) s ~= "int " ~ o ~ "(int a, int b){ return a " ~ (o == "add" ? "+" : "-") ~ " b; }\n"; return s; }
mixin(gen());
void main() { writeln(add(5, 3), " ", sub(5, 3)); }
