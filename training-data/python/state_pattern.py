from abc import ABC, abstractmethod


class State(ABC):
    @abstractmethod
    def handle(self, light):
        ...

    @abstractmethod
    def name(self):
        ...


class RedState(State):
    def handle(self, light):
        light.state = GreenState()

    def name(self):
        return "red"


class GreenState(State):
    def handle(self, light):
        light.state = YellowState()

    def name(self):
        return "green"


class YellowState(State):
    def handle(self, light):
        light.state = RedState()

    def name(self):
        return "yellow"


class TrafficLight:
    def __init__(self):
        self.state: State = RedState()

    def advance(self):
        self.state.handle(self)


if __name__ == "__main__":
    light = TrafficLight()
    for _ in range(4):
        print(light.state.name())
        light.advance()
