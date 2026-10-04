import std.stdio;

struct Buffer {
    int[] data;

    this(int size) {
        data = new int[size];
        writeln("constructed with size ", size);
    }

    this(ref return scope const Buffer other) {
        data = other.data.dup;
        writeln("copy constructed");
    }

    ~this() {
        writeln("destroyed buffer of ", data.length);
    }
}

Buffer makeBuffer() {
    return Buffer(2);
}

void main() {
    auto a = Buffer(3);
    a.data[0] = 7;
    auto b = a;
    b.data[0] = 9;
    writeln(a.data[0], " ", b.data[0]);
    auto c = makeBuffer();
    writeln("end of main");
}
