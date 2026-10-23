#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

struct Employee {
    std::string name;
    int department;
};

int main() {
    std::vector<Employee> staff = {
        {"Ana", 2}, {"Ben", 1}, {"Cy", 2}, {"Dee", 1}, {"Eli", 3}
    };

    // stable_sort keeps the original order of elements with equal keys,
    // which std::sort does not guarantee.
    std::stable_sort(staff.begin(), staff.end(),
                     [](const Employee& a, const Employee& b) {
                         return a.department < b.department;
                     });

    for (const auto& e : staff)
        std::cout << e.department << " " << e.name << "\n";
    return 0;
}
