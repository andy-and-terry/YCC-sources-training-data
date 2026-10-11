import std.stdio;

struct Dynamic {
    string[string] props;

    void opDispatch(string name)(string value) {
        props[name] = value;
    }

    string opDispatch(string name)() {
        return props.get(name, "<unset>");
    }
}

void main() {
    Dynamic d;
    d.color("red");
    d.size("large");
    writeln(d.color);
    writeln(d.size);
    writeln(d.weight);
}
