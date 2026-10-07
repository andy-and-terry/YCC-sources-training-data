import std.stdio;
import std.string : format;

struct Complex {
    double re;
    double im;

    Complex opBinary(string op)(Complex other) const if (op == "+" || op == "-") {
        static if (op == "+") return Complex(re + other.re, im + other.im);
        else return Complex(re - other.re, im - other.im);
    }

    Complex opBinary(string op : "*")(Complex other) const {
        return Complex(re * other.re - im * other.im, re * other.im + im * other.re);
    }

    bool opEquals(const Complex other) const {
        return re == other.re && im == other.im;
    }

    Complex opUnary(string op : "-")() const {
        return Complex(-re, -im);
    }

    string toString() const {
        return format("%s%s%si", re, im >= 0 ? "+" : "", im);
    }
}

void main() {
    auto a = Complex(1.0, 2.0);
    auto b = Complex(3.0, -1.0);

    writeln(a + b);
    writeln(a - b);
    writeln(a * b);
    writeln(-a);
    writeln(a == Complex(1.0, 2.0));
}
