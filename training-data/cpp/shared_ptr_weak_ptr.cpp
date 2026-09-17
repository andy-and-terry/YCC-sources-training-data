#include <iostream>
#include <memory>

struct Owner;

struct Pet {
    std::string name;
    std::weak_ptr<Owner> owner;
    explicit Pet(std::string n) : name(std::move(n)) {}
};

struct Owner {
    std::string name;
    std::shared_ptr<Pet> pet;
    explicit Owner(std::string n) : name(std::move(n)) {}
};

int main() {
    auto owner = std::make_shared<Owner>("Ada");
    auto pet = std::make_shared<Pet>("Rex");
    owner->pet = pet;
    pet->owner = owner;

    std::cout << "use_count(owner): " << owner.use_count() << std::endl;

    if (auto locked = pet->owner.lock()) {
        std::cout << pet->name << " belongs to " << locked->name << std::endl;
    }

    owner.reset();
    std::cout << "owner expired: " << pet->owner.expired() << std::endl;
    return 0;
}
