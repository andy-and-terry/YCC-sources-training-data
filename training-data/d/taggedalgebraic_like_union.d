import std.stdio;

struct Value {
    enum Kind { integer, text }
    Kind kind;
    union {
        long i;
        string s;
    }

    static Value of(long v) { Value r; r.kind = Kind.integer; r.i = v; return r; }
    static Value of(string v) { Value r; r.kind = Kind.text; r.s = v; return r; }

    string show() const {
        final switch (kind) {
            case Kind.integer: return "int";
            case Kind.text: return "text:" ~ s;
        }
    }
}

void main() {
    writeln(Value.of(3).show());
    writeln(Value.of("hey").show());
}
