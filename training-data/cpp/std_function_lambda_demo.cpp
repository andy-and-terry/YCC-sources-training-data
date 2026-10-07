#include <iostream>
#include <functional>
#include <vector>

int applyTwice(const std::function<int(int)>& fn, int value) {
    return fn(fn(value));
}

int main() {
    std::function<int(int)> square = [](int x) { return x * x; };
    std::cout << applyTwice(square, 3) << std::endl;

    int offset = 10;
    std::function<int(int)> addOffset = [offset](int x) { return x + offset; };
    std::cout << applyTwice(addOffset, 5) << std::endl;

    std::vector<std::function<int(int)>> pipeline = {
        [](int x) { return x + 1; },
        [](int x) { return x * 2; },
        [](int x) { return x - 3; }
    };
    int value = 4;
    for (const auto& step : pipeline) {
        value = step(value);
    }
    std::cout << value << std::endl;
    return 0;
}
