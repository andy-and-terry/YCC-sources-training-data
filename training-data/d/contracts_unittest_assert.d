import std.stdio;

int safeDiv(int a, int b)
in { assert(b != 0, "divisor must be nonzero"); }
out (r) { assert(r * b <= a); }
do { return a / b; }

struct Account {
    private long cents;
    invariant { assert(cents >= 0); }
    void deposit(long c) in (c > 0) { cents += c; }
    void withdraw(long c) in (c > 0 && c <= cents) { cents -= c; }
    long balance() const { return cents; }
}

unittest {
    assert(safeDiv(7, 2) == 3);
    Account a;
    a.deposit(100);
    a.withdraw(30);
    assert(a.balance == 70);
}

unittest {
    import std.exception : assertThrown;
    assertThrown!Error(safeDiv(1, 0));
}

void main() {
    writeln(safeDiv(20, 4));
    Account a;
    a.deposit(5);
    writeln(a.balance);
}
