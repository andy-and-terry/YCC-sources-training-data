#include <iostream>
#include <memory>

class TrafficLight;

class State {
public:
    virtual void handle(TrafficLight& light) = 0;
    virtual std::string name() const = 0;
    virtual ~State() = default;
};

class TrafficLight {
public:
    explicit TrafficLight(std::unique_ptr<State> initial) : state_(std::move(initial)) {}

    void setState(std::unique_ptr<State> state) { state_ = std::move(state); }
    void next() { state_->handle(*this); }
    std::string current() const { return state_->name(); }

private:
    std::unique_ptr<State> state_;
};

class RedState : public State {
public:
    void handle(TrafficLight& light) override;
    std::string name() const override { return "Red"; }
};

class GreenState : public State {
public:
    void handle(TrafficLight& light) override;
    std::string name() const override { return "Green"; }
};

class YellowState : public State {
public:
    void handle(TrafficLight& light) override;
    std::string name() const override { return "Yellow"; }
};

void RedState::handle(TrafficLight& light) { light.setState(std::make_unique<GreenState>()); }
void GreenState::handle(TrafficLight& light) { light.setState(std::make_unique<YellowState>()); }
void YellowState::handle(TrafficLight& light) { light.setState(std::make_unique<RedState>()); }

int main() {
    TrafficLight light(std::make_unique<RedState>());
    for (int i = 0; i < 4; i++) {
        std::cout << light.current() << std::endl;
        light.next();
    }
    return 0;
}
