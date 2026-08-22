#include <iostream>
#include <memory>
#include <vector>

class Resource {
public:
    explicit Resource(int id) : id(id) { std::cout << "acquire " << id << std::endl; }
    ~Resource() { std::cout << "release " << id << std::endl; }
    int id;
};

int main() {
    std::vector<std::shared_ptr<Resource>> pool;
    auto r1 = std::make_shared<Resource>(1);
    pool.push_back(r1);
    pool.push_back(r1);
    std::cout << "use count: " << r1.use_count() << std::endl;

    {
        auto r2 = std::make_unique<Resource>(2);
        std::cout << "r2 id: " << r2->id << std::endl;
    }
    std::cout << "after scope" << std::endl;
    return 0;
}
