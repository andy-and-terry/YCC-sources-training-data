import std.stdio;
import std.exception;

class DivisionByZeroException : Exception {
    this(string msg) {
        super(msg);
    }
}

int safeDivide(int a, int b) {
    if (b == 0) {
        throw new DivisionByZeroException("cannot divide by zero");
    }
    return a / b;
}

void main() {
    try {
        writeln(safeDivide(10, 2));
        writeln(safeDivide(5, 0));
    } catch (DivisionByZeroException e) {
        writeln("error: ", e.msg);
    }
}
