#include <iostream>
#include <memory>
#include <string>
#include <unordered_map>

class TreeType {
public:
    TreeType(std::string name, std::string color) : name(std::move(name)), color(std::move(color)) {}

    void render(int x, int y) const {
        std::cout << "Tree(" << name << ", " << color << ") at (" << x << ", " << y << ")" << std::endl;
    }

private:
    std::string name;
    std::string color;
};

class TreeFactory {
public:
    std::shared_ptr<TreeType> get_tree_type(const std::string &name, const std::string &color) {
        std::string key = name + "-" + color;
        auto it = cache.find(key);
        if (it != cache.end()) return it->second;

        auto type = std::make_shared<TreeType>(name, color);
        cache[key] = type;
        created_count++;
        return type;
    }

    int distinct_types_created() const { return created_count; }

private:
    std::unordered_map<std::string, std::shared_ptr<TreeType>> cache;
    int created_count = 0;
};

int main() {
    TreeFactory factory;

    auto oak_green = factory.get_tree_type("Oak", "green");
    auto oak_green_2 = factory.get_tree_type("Oak", "green");
    auto pine_dark = factory.get_tree_type("Pine", "dark green");

    oak_green->render(1, 2);
    oak_green_2->render(5, 6);
    pine_dark->render(10, 10);

    std::cout << "distinct types: " << factory.distinct_types_created() << std::endl;
    std::cout << "same instance: " << (oak_green.get() == oak_green_2.get()) << std::endl;

    return 0;
}
