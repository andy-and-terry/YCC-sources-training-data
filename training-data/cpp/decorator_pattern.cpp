#include <iostream>
#include <memory>
#include <string>

class Coffee {
public:
    virtual std::string description() const = 0;
    virtual double cost() const = 0;
    virtual ~Coffee() = default;
};

class PlainCoffee : public Coffee {
public:
    std::string description() const override { return "coffee"; }
    double cost() const override { return 2.0; }
};

class CoffeeDecorator : public Coffee {
public:
    explicit CoffeeDecorator(std::unique_ptr<Coffee> inner) : inner(std::move(inner)) {}

protected:
    std::unique_ptr<Coffee> inner;
};

class MilkDecorator : public CoffeeDecorator {
public:
    using CoffeeDecorator::CoffeeDecorator;
    std::string description() const override { return inner->description() + " + milk"; }
    double cost() const override { return inner->cost() + 0.5; }
};

class SugarDecorator : public CoffeeDecorator {
public:
    using CoffeeDecorator::CoffeeDecorator;
    std::string description() const override { return inner->description() + " + sugar"; }
    double cost() const override { return inner->cost() + 0.25; }
};

int main() {
    std::unique_ptr<Coffee> order = std::make_unique<SugarDecorator>(
        std::make_unique<MilkDecorator>(std::make_unique<PlainCoffee>()));
    std::cout << order->description() << " = " << order->cost() << std::endl;
    return 0;
}
