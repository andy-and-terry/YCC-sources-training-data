import std.stdio;

struct Meters {
    double value;
    alias value this;

    Meters opBinary(string op : "+")(Meters other) {
        return Meters(value + other.value);
    }
}

double addTenPercent(double x) {
    return x * 1.1;
}

void main() {
    Meters distance = Meters(5.0);

    double asDouble = distance;
    writeln(asDouble);

    writeln(addTenPercent(distance));

    Meters total = distance + Meters(2.5);
    writeln(total.value);
}
