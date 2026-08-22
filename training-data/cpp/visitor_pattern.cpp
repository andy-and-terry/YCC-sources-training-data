#include <iostream>
#include <memory>

class Number;
class Add;

class Visitor {
public:
    virtual int visitNumber(const Number&) = 0;
    virtual int visitAdd(const Add&) = 0;
    virtual ~Visitor() = default;
};

class Expr {
public:
    virtual int accept(Visitor& visitor) const = 0;
    virtual ~Expr() = default;
};

class Number : public Expr {
public:
    explicit Number(int value) : value(value) {}
    int accept(Visitor& visitor) const override { return visitor.visitNumber(*this); }
    int value;
};

class Add : public Expr {
public:
    Add(std::unique_ptr<Expr> l, std::unique_ptr<Expr> r) : left(std::move(l)), right(std::move(r)) {}
    int accept(Visitor& visitor) const override { return visitor.visitAdd(*this); }
    std::unique_ptr<Expr> left, right;
};

class EvalVisitor : public Visitor {
public:
    int visitNumber(const Number& n) override { return n.value; }
    int visitAdd(const Add& a) override { return a.left->accept(*this) + a.right->accept(*this); }
};

int main() {
    auto expr = std::make_unique<Add>(
        std::make_unique<Number>(1),
        std::make_unique<Add>(std::make_unique<Number>(2), std::make_unique<Number>(3)));
    EvalVisitor visitor;
    std::cout << expr->accept(visitor) << std::endl;
    return 0;
}
