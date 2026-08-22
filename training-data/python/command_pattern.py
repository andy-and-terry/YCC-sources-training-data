from abc import ABC, abstractmethod
from typing import List


class Command(ABC):
    @abstractmethod
    def execute(self): ...

    @abstractmethod
    def undo(self): ...


class Light:
    def __init__(self):
        self.on = False


class TurnOnCommand(Command):
    def __init__(self, light: Light):
        self.light = light

    def execute(self):
        self.light.on = True

    def undo(self):
        self.light.on = False


class CommandHistory:
    def __init__(self):
        self.history: List[Command] = []

    def execute(self, command: Command):
        command.execute()
        self.history.append(command)

    def undo_last(self):
        if self.history:
            self.history.pop().undo()


if __name__ == "__main__":
    light = Light()
    history = CommandHistory()
    history.execute(TurnOnCommand(light))
    print(light.on)
    history.undo_last()
    print(light.on)
