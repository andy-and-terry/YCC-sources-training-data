#include <iostream>
#include <string>
#include <vector>

struct Pizza {
    std::vector<std::string> toppings;
    std::string size = "medium";
};

class PizzaBuilder {
public:
    PizzaBuilder& withSize(const std::string& s) {
        pizza.size = s;
        return *this;
    }

    PizzaBuilder& addTopping(const std::string& t) {
        pizza.toppings.push_back(t);
        return *this;
    }

    Pizza build() { return pizza; }

private:
    Pizza pizza;
};

int main() {
    Pizza pizza = PizzaBuilder().withSize("large").addTopping("cheese").addTopping("olives").build();
    std::cout << pizza.size << ": ";
    for (auto& t : pizza.toppings) std::cout << t << " ";
    std::cout << std::endl;
    return 0;
}
