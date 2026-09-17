#include <iostream>
#include <memory>
#include <string>

class TrafficLightContext;

class LightState {
public:
    virtual void next(TrafficLightContext& ctx) = 0;
    virtual std::string name() const = 0;
    virtual ~LightState() = default;
};

class TrafficLightContext {
public:
    explicit TrafficLightContext(std::unique_ptr<LightState> state) : state(std::move(state)) {}

    void setState(std::unique_ptr<LightState> newState) { state = std::move(newState); }
    void next() { state->next(*this); }
    std::string name() const { return state->name(); }

private:
    std::unique_ptr<LightState> state;
};

class RedState : public LightState {
public:
    void next(TrafficLightContext& ctx) override;
    std::string name() const override { return "Red"; }
};

class GreenState : public LightState {
public:
    void next(TrafficLightContext& ctx) override;
    std::string name() const override { return "Green"; }
};

class YellowState : public LightState {
public:
    void next(TrafficLightContext& ctx) override;
    std::string name() const override { return "Yellow"; }
};

void RedState::next(TrafficLightContext& ctx) { ctx.setState(std::make_unique<GreenState>()); }
void GreenState::next(TrafficLightContext& ctx) { ctx.setState(std::make_unique<YellowState>()); }
void YellowState::next(TrafficLightContext& ctx) { ctx.setState(std::make_unique<RedState>()); }

int main() {
    TrafficLightContext light(std::make_unique<RedState>());
    for (int i = 0; i < 4; i++) {
        std::cout << light.name() << " ";
        light.next();
    }
    std::cout << std::endl;
    return 0;
}
