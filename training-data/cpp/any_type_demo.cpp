#include <any>
#include <iostream>
#include <string>
#include <vector>

int main() {
    std::vector<std::any> values;
    values.push_back(42);
    values.push_back(std::string("hello"));
    values.push_back(3.14);

    for (const auto& value : values) {
        if (value.type() == typeid(int)) {
            std::cout << "int: " << std::any_cast<int>(value) << std::endl;
        } else if (value.type() == typeid(std::string)) {
            std::cout << "string: " << std::any_cast<const std::string&>(value) << std::endl;
        } else if (value.type() == typeid(double)) {
            std::cout << "double: " << std::any_cast<double>(value) << std::endl;
        }
    }

    std::any empty;
    std::cout << "has value: " << empty.has_value() << std::endl;

    try {
        std::any_cast<int>(std::any(std::string("oops")));
    } catch (const std::bad_any_cast& e) {
        std::cout << "caught: " << e.what() << std::endl;
    }

    return 0;
}
