#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

// C++20 constrained algorithms in std::ranges take whole containers and an
// optional projection, so no begin()/end() pairs or comparator lambdas needed.
struct Person {
    std::string name;
    int age;
};

int main() {
    std::vector<Person> people = {
        {"Dana", 41}, {"Alex", 29}, {"Chris", 35}, {"Bea", 29}};

    // Sort by a member via projection.
    std::ranges::sort(people, {}, &Person::age);
    for (const auto& p : people) std::cout << p.name << ":" << p.age << " ";
    std::cout << "\n";

    // Descending by name: custom comparison plus projection.
    std::ranges::sort(people, std::ranges::greater{}, &Person::name);
    for (const auto& p : people) std::cout << p.name << " ";
    std::cout << "\n";

    auto oldest = std::ranges::max_element(people, {}, &Person::age);
    std::cout << "oldest: " << oldest->name << "\n";

    auto it = std::ranges::find(people, "Chris", &Person::name);
    std::cout << "found Chris aged " << it->age << "\n";

    std::cout << "any under 30: "
              << std::boolalpha
              << std::ranges::any_of(people, [](int a) { return a < 30; },
                                     &Person::age)
              << "\n";
}
