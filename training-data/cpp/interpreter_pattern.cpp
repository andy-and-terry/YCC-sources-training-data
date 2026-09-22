#include <iostream>
#include <memory>
#include <string>
#include <sstream>
#include <vector>

// Grammar: Expression ::= Number | Expression '+' Expression | Expression '-' Expression
class Expression {
public:
    virtual ~Expression() = default;
    virtual int interpret() const = 0;
};

class Number : public Expression {
public:
    explicit Number(int value) : value_(value) {}
    int interpret() const override { return value_; }

private:
    int value_;
};

class Add : public Expression {
public:
    Add(std::unique_ptr<Expression> lhs, std::unique_ptr<Expression> rhs)
        : lhs_(std::move(lhs)), rhs_(std::move(rhs)) {}
    int interpret() const override { return lhs_->interpret() + rhs_->interpret(); }

private:
    std::unique_ptr<Expression> lhs_;
    std::unique_ptr<Expression> rhs_;
};

class Subtract : public Expression {
public:
    Subtract(std::unique_ptr<Expression> lhs, std::unique_ptr<Expression> rhs)
        : lhs_(std::move(lhs)), rhs_(std::move(rhs)) {}
    int interpret() const override { return lhs_->interpret() - rhs_->interpret(); }

private:
    std::unique_ptr<Expression> lhs_;
    std::unique_ptr<Expression> rhs_;
};

// Parses a simple space-separated postfix expression like "5 3 + 2 -"
std::unique_ptr<Expression> parsePostfix(const std::string& tokens) {
    std::vector<std::unique_ptr<Expression>> stack;
    std::istringstream iss(tokens);
    std::string tok;
    while (iss >> tok) {
        if (tok == "+" || tok == "-") {
            auto rhs = std::move(stack.back());
            stack.pop_back();
            auto lhs = std::move(stack.back());
            stack.pop_back();
            if (tok == "+") {
                stack.push_back(std::make_unique<Add>(std::move(lhs), std::move(rhs)));
            } else {
                stack.push_back(std::make_unique<Subtract>(std::move(lhs), std::move(rhs)));
            }
        } else {
            stack.push_back(std::make_unique<Number>(std::stoi(tok)));
        }
    }
    return std::move(stack.back());
}

int main() {
    auto expr = parsePostfix("5 3 + 2 -");
    std::cout << "5 3 + 2 - = " << expr->interpret() << std::endl;

    auto expr2 = parsePostfix("10 4 - 3 +");
    std::cout << "10 4 - 3 + = " << expr2->interpret() << std::endl;

    return 0;
}
