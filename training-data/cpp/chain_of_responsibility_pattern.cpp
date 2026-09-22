#include <iostream>
#include <memory>
#include <string>

class Handler {
public:
    void set_next(std::shared_ptr<Handler> next) { next_handler = std::move(next); }

    virtual void handle(int amount) {
        if (next_handler) next_handler->handle(amount);
        else std::cout << "No handler could approve amount " << amount << std::endl;
    }

    virtual ~Handler() = default;

protected:
    std::shared_ptr<Handler> next_handler;
};

class Supervisor : public Handler {
public:
    void handle(int amount) override {
        if (amount <= 1000) std::cout << "Supervisor approved " << amount << std::endl;
        else Handler::handle(amount);
    }
};

class Manager : public Handler {
public:
    void handle(int amount) override {
        if (amount <= 5000) std::cout << "Manager approved " << amount << std::endl;
        else Handler::handle(amount);
    }
};

class Director : public Handler {
public:
    void handle(int amount) override {
        if (amount <= 20000) std::cout << "Director approved " << amount << std::endl;
        else Handler::handle(amount);
    }
};

int main() {
    auto supervisor = std::make_shared<Supervisor>();
    auto manager = std::make_shared<Manager>();
    auto director = std::make_shared<Director>();

    supervisor->set_next(manager);
    manager->set_next(director);

    supervisor->handle(500);
    supervisor->handle(3000);
    supervisor->handle(15000);
    supervisor->handle(50000);

    return 0;
}
