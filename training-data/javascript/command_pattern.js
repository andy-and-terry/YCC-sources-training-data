class Light {
  constructor() {
    this.on = false;
  }
}

class TurnOnCommand {
  constructor(light) {
    this.light = light;
  }
  execute() {
    this.light.on = true;
  }
  undo() {
    this.light.on = false;
  }
}

class CommandHistory {
  #history = [];

  execute(command) {
    command.execute();
    this.#history.push(command);
  }

  undoLast() {
    const command = this.#history.pop();
    if (command) command.undo();
  }
}

const light = new Light();
const history = new CommandHistory();
history.execute(new TurnOnCommand(light));
console.log(light.on);
history.undoLast();
console.log(light.on);
module.exports = { Light, TurnOnCommand, CommandHistory };
