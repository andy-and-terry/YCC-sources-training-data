interface Command {
  execute(): void;
  undo(): void;
}

class Light {
  on = false;
}

class TurnOnCommand implements Command {
  constructor(private light: Light) {}
  execute(): void {
    this.light.on = true;
  }
  undo(): void {
    this.light.on = false;
  }
}

class CommandHistory {
  private history: Command[] = [];

  execute(command: Command): void {
    command.execute();
    this.history.push(command);
  }

  undoLast(): void {
    const command = this.history.pop();
    command?.undo();
  }
}

const light = new Light();
const history = new CommandHistory();
history.execute(new TurnOnCommand(light));
console.log(light.on);
history.undoLast();
console.log(light.on);
