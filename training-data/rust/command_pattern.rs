trait Command {
    fn execute(&self, light: &mut Light);
    fn undo(&self, light: &mut Light);
}

struct Light {
    on: bool,
}

struct TurnOnCommand;

impl Command for TurnOnCommand {
    fn execute(&self, light: &mut Light) {
        light.on = true;
    }
    fn undo(&self, light: &mut Light) {
        light.on = false;
    }
}

struct CommandHistory {
    history: Vec<Box<dyn Command>>,
}

impl CommandHistory {
    fn new() -> Self {
        CommandHistory { history: vec![] }
    }

    fn execute(&mut self, command: Box<dyn Command>, light: &mut Light) {
        command.execute(light);
        self.history.push(command);
    }

    fn undo_last(&mut self, light: &mut Light) {
        if let Some(command) = self.history.pop() {
            command.undo(light);
        }
    }
}

fn main() {
    let mut light = Light { on: false };
    let mut history = CommandHistory::new();
    history.execute(Box::new(TurnOnCommand), &mut light);
    println!("{}", light.on);
    history.undo_last(&mut light);
    println!("{}", light.on);
}
