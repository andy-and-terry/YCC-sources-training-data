#include <cctype>
#include <cmath>
#include <iostream>
#include <map>
#include <memory>
#include <stdexcept>
#include <string>

struct Node {
    virtual ~Node() = default;
    virtual double eval(const std::map<std::string, double>& env) const = 0;
};
using Ptr = std::unique_ptr<Node>;

struct Num : Node {
    double v;
    explicit Num(double v) : v(v) {}
    double eval(const std::map<std::string, double>&) const override { return v; }
};

struct Var : Node {
    std::string name;
    explicit Var(std::string n) : name(std::move(n)) {}
    double eval(const std::map<std::string, double>& env) const override { return env.at(name); }
};

struct Bin : Node {
    char op;
    Ptr l, r;
    Bin(char op, Ptr l, Ptr r) : op(op), l(std::move(l)), r(std::move(r)) {}
    double eval(const std::map<std::string, double>& env) const override {
        double a = l->eval(env), b = r->eval(env);
        switch (op) {
            case '+': return a + b;
            case '-': return a - b;
            case '*': return a * b;
            case '/': return a / b;
            default: return std::pow(a, b);
        }
    }
};

class Parser {
public:
    explicit Parser(std::string s) : s_(std::move(s)) {}
    Ptr parse() {
        auto e = expr();
        skip();
        if (i_ != s_.size()) throw std::runtime_error("trailing input at " + std::to_string(i_));
        return e;
    }

private:
    void skip() {
        while (i_ < s_.size() && std::isspace(static_cast<unsigned char>(s_[i_]))) ++i_;
    }
    bool eat(char c) {
        skip();
        if (i_ < s_.size() && s_[i_] == c) return ++i_, true;
        return false;
    }
    Ptr expr() {
        auto e = term();
        for (;;) {
            if (eat('+')) e = std::make_unique<Bin>('+', std::move(e), term());
            else if (eat('-')) e = std::make_unique<Bin>('-', std::move(e), term());
            else return e;
        }
    }
    Ptr term() {
        auto e = power();
        for (;;) {
            if (eat('*')) e = std::make_unique<Bin>('*', std::move(e), power());
            else if (eat('/')) e = std::make_unique<Bin>('/', std::move(e), power());
            else return e;
        }
    }
    Ptr power() {
        auto base = unary();
        if (eat('^')) return std::make_unique<Bin>('^', std::move(base), power());
        return base;
    }
    Ptr unary() {
        if (eat('-')) return std::make_unique<Bin>('-', std::make_unique<Num>(0), unary());
        return primary();
    }
    Ptr primary() {
        if (eat('(')) {
            auto e = expr();
            if (!eat(')')) throw std::runtime_error("expected )");
            return e;
        }
        skip();
        std::size_t start = i_;
        if (i_ < s_.size() && std::isalpha(static_cast<unsigned char>(s_[i_]))) {
            while (i_ < s_.size() && std::isalnum(static_cast<unsigned char>(s_[i_]))) ++i_;
            return std::make_unique<Var>(s_.substr(start, i_ - start));
        }
        while (i_ < s_.size() && (std::isdigit(static_cast<unsigned char>(s_[i_])) || s_[i_] == '.')) ++i_;
        if (start == i_) throw std::runtime_error("unexpected character at " + std::to_string(i_));
        return std::make_unique<Num>(std::stod(s_.substr(start, i_ - start)));
    }

    std::string s_;
    std::size_t i_ = 0;
};

int main() {
    std::map<std::string, double> env{{"x", 2}, {"y", 4}};
    for (std::string src : {"1 + 2 * 3", "2 ^ 3 ^ 2", "-(x + 3) * y", "(1 + 2", "x / 0.5"}) {
        try {
            double v = Parser(src).parse()->eval(env);
            std::cout << src << " = " << v << '\n';
        } catch (const std::exception& e) {
            std::cout << src << " : error: " << e.what() << '\n';
        }
    }
}
