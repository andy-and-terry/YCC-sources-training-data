#include <algorithm>
#include <compare>
#include <iostream>
#include <vector>

struct Version {
    int major;
    int minor;
    int patch;

    auto operator<=>(const Version&) const = default;
};

int main() {
    Version a{1, 2, 3};
    Version b{1, 3, 0};
    Version c{1, 2, 3};

    std::cout << (a == c) << " " << (a < b) << " " << (b > a) << std::endl;

    std::vector<Version> versions{{2, 0, 0}, {1, 0, 0}, {1, 5, 2}};
    std::sort(versions.begin(), versions.end());
    for (const auto& v : versions) {
        std::cout << v.major << "." << v.minor << "." << v.patch << " ";
    }
    std::cout << std::endl;

    auto ordering = (a <=> b);
    if (ordering < 0) std::cout << "a is less than b" << std::endl;

    return 0;
}
