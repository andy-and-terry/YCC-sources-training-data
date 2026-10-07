import std.stdio;
import std.algorithm : sort;

mixin template OrderedById() {
    int opCmp(const typeof(this) other) const {
        return id < other.id ? -1 : (id > other.id ? 1 : 0);
    }

    bool opEquals(const typeof(this) other) const {
        return id == other.id;
    }
}

struct Ticket {
    int id;
    string label;

    mixin OrderedById;
}

void main() {
    auto tickets = [Ticket(3, "c"), Ticket(1, "a"), Ticket(2, "b")];
    sort(tickets);
    foreach (t; tickets) writeln(t.id, " ", t.label);

    writeln(Ticket(5, "x") == Ticket(5, "y"));
}
