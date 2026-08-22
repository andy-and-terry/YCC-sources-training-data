#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

struct Person {
    std::string name;
    int age;
};

int main() {
    std::vector<Person> people = {{"Alice", 30}, {"Bob", 25}, {"Carol", 35}};
    std::sort(people.begin(), people.end(), [](const Person& a, const Person& b) {
        return a.age < b.age;
    });
    for (auto& p : people) std::cout << p.name << " (" << p.age << ") ";
    std::cout << std::endl;
    return 0;
}
