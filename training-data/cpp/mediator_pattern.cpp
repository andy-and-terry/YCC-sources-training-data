#include <iostream>
#include <memory>
#include <string>
#include <vector>

class Colleague;

class Mediator {
public:
    virtual void broadcast(Colleague* sender, const std::string& message) = 0;
    virtual ~Mediator() = default;
};

class Colleague {
public:
    Colleague(Mediator& mediator, std::string name) : mediator(mediator), name(std::move(name)) {}
    virtual ~Colleague() = default;

    void send(const std::string& message) { mediator.broadcast(this, message); }

    virtual void receive(const std::string& from, const std::string& message) {
        std::cout << name << " received from " << from << ": " << message << std::endl;
    }

    const std::string& getName() const { return name; }

protected:
    Mediator& mediator;
    std::string name;
};

class ChatRoom : public Mediator {
public:
    void join(std::shared_ptr<Colleague> member) { members.push_back(member); }

    void broadcast(Colleague* sender, const std::string& message) override {
        for (auto& member : members) {
            if (member.get() != sender) member->receive(sender->getName(), message);
        }
    }

private:
    std::vector<std::shared_ptr<Colleague>> members;
};

int main() {
    ChatRoom room;
    auto alice = std::make_shared<Colleague>(room, "Alice");
    auto bob = std::make_shared<Colleague>(room, "Bob");
    auto carol = std::make_shared<Colleague>(room, "Carol");

    room.join(alice);
    room.join(bob);
    room.join(carol);

    alice->send("hello everyone");
    bob->send("hi Alice");

    return 0;
}
