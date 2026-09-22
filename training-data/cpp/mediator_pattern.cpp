#include <iostream>
#include <memory>
#include <string>
#include <vector>

class Mediator;

class Colleague {
public:
    explicit Colleague(std::string name) : name_(std::move(name)) {}
    virtual ~Colleague() = default;
    void setMediator(Mediator* mediator) { mediator_ = mediator; }
    const std::string& name() const { return name_; }
    virtual void receive(const std::string& from, const std::string& message) = 0;

protected:
    std::string name_;
    Mediator* mediator_ = nullptr;
};

class Mediator {
public:
    virtual ~Mediator() = default;
    virtual void broadcast(Colleague* sender, const std::string& message) = 0;
};

class ChatRoom : public Mediator {
public:
    void join(std::shared_ptr<Colleague> member) {
        member->setMediator(this);
        members_.push_back(member);
    }

    void broadcast(Colleague* sender, const std::string& message) override {
        for (const auto& member : members_) {
            if (member.get() != sender) {
                member->receive(sender->name(), message);
            }
        }
    }

private:
    std::vector<std::shared_ptr<Colleague>> members_;
};

class ChatUser : public Colleague {
public:
    using Colleague::Colleague;

    void say(const std::string& message) {
        std::cout << name_ << " sends: " << message << std::endl;
        mediator_->broadcast(this, message);
    }

    void receive(const std::string& from, const std::string& message) override {
        std::cout << "  " << name_ << " received from " << from << ": " << message << std::endl;
    }
};

int main() {
    ChatRoom room;
    auto alice = std::make_shared<ChatUser>("Alice");
    auto bob = std::make_shared<ChatUser>("Bob");
    auto carol = std::make_shared<ChatUser>("Carol");

    room.join(alice);
    room.join(bob);
    room.join(carol);

    alice->say("hello everyone");
    bob->say("hi Alice");

    return 0;
}
