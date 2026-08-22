#include <functional>
#include <iostream>
#include <string>
#include <unordered_map>
#include <vector>

class PubSub {
public:
    void subscribe(const std::string& topic, std::function<void(const std::string&)> handler) {
        subscribers[topic].push_back(handler);
    }

    void publish(const std::string& topic, const std::string& message) {
        for (auto& handler : subscribers[topic]) handler(message);
    }

private:
    std::unordered_map<std::string, std::vector<std::function<void(const std::string&)>>> subscribers;
};

int main() {
    PubSub bus;
    bus.subscribe("news", [](const std::string& msg) { std::cout << "received: " << msg << std::endl; });
    bus.publish("news", "hello subscribers");
    return 0;
}
