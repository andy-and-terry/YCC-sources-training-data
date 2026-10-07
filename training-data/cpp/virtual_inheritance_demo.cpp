#include <iostream>

// Without `virtual` inheritance, Amphibious would contain two separate
// Vehicle subobjects (the classic diamond problem); with it, both
// paths share a single Vehicle base.
class Vehicle {
public:
    explicit Vehicle(int wheels) : wheels_(wheels) {}
    int wheels() const { return wheels_; }
protected:
    int wheels_;
};

class Car : public virtual Vehicle {
public:
    Car() : Vehicle(4) {}
};

class Boat : public virtual Vehicle {
public:
    Boat() : Vehicle(0) {}
};

class Amphibious : public Car, public Boat {
public:
    Amphibious() : Vehicle(4), Car(), Boat() {}
};

int main() {
    Amphibious a;
    std::cout << "wheels: " << a.wheels() << std::endl;
    std::cout << "sizeof shared base kept single: "
              << (&static_cast<Vehicle&>(static_cast<Car&>(a)) ==
                  &static_cast<Vehicle&>(static_cast<Boat&>(a)))
              << std::endl;
    return 0;
}
