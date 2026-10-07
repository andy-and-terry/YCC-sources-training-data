#include <iostream>
#include <map>
#include <memory>
#include <string>

class Expression {
public:
    virtual int interpret(const std::map<std::string, int>& context) const = 0;
    virtual ~Expression() = default;
};

class Number : public Expression {
public:
    explicit Number(int value) : value(value) {}
    int interpret(const std::map<std::string, int>&) const override { return value; }

private:
    int value;
};

class Variable : public Expression {
public:
    explicit Variable(std::string name) : name(std::move(name)) {}
    int interpret(const std::map<std::string, int>& context) const override {
        return context.at(name);
    }

private:
    std::string name;
};

class Add : public Expression {
public:
    Add(std::unique_ptr<Expression> left, std::unique_ptr<Expression> right)
        : left(std::move(left)), right(std::move(right)) {}
    int interpret(const std::map<std::string, int>& context) const override {
        return left->interpret(context) + right->interpret(context);
    }

private:
    std::unique_ptr<Expression> left, right;
};

class Multiply : public Expression {
public:
    Multiply(std::unique_ptr<Expression> left, std::unique_ptr<Expression> right)
        : left(std::move(left)), right(std::move(right)) {}
    int interpret(const std::map<std::string, int>& context) const override {
        return left->interpret(context) * right->interpret(context);
    }

private:
    std::unique_ptr<Expression> left, right;
};

int main() {
    // Builds (x + 3) * y
    std::unique_ptr<Expression> expr = std::make_unique<Multiply>(
        std::make_unique<Add>(std::make_unique<Variable>("x"), std::make_unique<Number>(3)),
        std::make_unique<Variable>("y"));

    std::map<std::string, int> context = {{"x", 2}, {"y", 5}};
    std::cout << "(x + 3) * y = " << expr->interpret(context) << std::endl;

    return 0;
}
