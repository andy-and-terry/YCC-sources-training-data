#include <iostream>
#include <map>

enum class State { Idle, Loading, Success, Error };

std::ostream& operator<<(std::ostream& os, State state) {
    switch (state) {
        case State::Idle: return os << "Idle";
        case State::Loading: return os << "Loading";
        case State::Success: return os << "Success";
        case State::Error: return os << "Error";
    }
    return os;
}

class StateMachine {
public:
    State current = State::Idle;

    bool transition(State from, State to) {
        if (current != from) return false;
        current = to;
        return true;
    }
};

int main() {
    StateMachine sm;
    sm.transition(State::Idle, State::Loading);
    std::cout << sm.current << std::endl;
    sm.transition(State::Loading, State::Success);
    std::cout << sm.current << std::endl;
    return 0;
}
