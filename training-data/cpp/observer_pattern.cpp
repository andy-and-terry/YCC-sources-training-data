#include <functional>
#include <iostream>
#include <vector>

class Subject {
public:
    void subscribe(std::function<void(double)> observer) { observers.push_back(observer); }
    void notify(double value) { for (auto& o : observers) o(value); }

private:
    std::vector<std::function<void(double)>> observers;
};

int main() {
    Subject sensor;
    sensor.subscribe([](double t) { std::cout << "Alert: temperature is now " << t << std::endl; });
    sensor.notify(25.5);
    return 0;
}
