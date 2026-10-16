import std.stdio;
import std.json;

void main() {
    auto j = parseJSON(`{"name":"widget","tags":["a","b"],"price":9.5}`);
    writeln(j["name"].str);
    writeln(j["price"].floating);
    foreach (t; j["tags"].array) writeln(t.str);
    j["stock"] = JSONValue(12);
    writeln(j.toString());
}
