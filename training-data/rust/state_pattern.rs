enum State {
    Red,
    Green,
    Yellow,
}

impl State {
    fn next(self) -> State {
        match self {
            State::Red => State::Green,
            State::Green => State::Yellow,
            State::Yellow => State::Red,
        }
    }

    fn name(&self) -> &'static str {
        match self {
            State::Red => "red",
            State::Green => "green",
            State::Yellow => "yellow",
        }
    }
}

struct TrafficLight {
    state: State,
}

impl TrafficLight {
    fn new() -> Self {
        TrafficLight { state: State::Red }
    }

    fn advance(&mut self) {
        self.state = std::mem::replace(&mut self.state, State::Red).next();
    }
}

fn main() {
    let mut light = TrafficLight::new();
    for _ in 0..4 {
        println!("{}", light.state.name());
        light.advance();
    }
}
