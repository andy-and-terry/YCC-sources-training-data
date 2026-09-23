interface Command : Object {
    public abstract void execute();
    public abstract void undo();
}

class Light : Object {
    public bool is_on = false;

    public void turn_on() {
        is_on = true;
        stdout.printf("Light is ON\n");
    }

    public void turn_off() {
        is_on = false;
        stdout.printf("Light is OFF\n");
    }
}

class TurnOnCommand : Object, Command {
    private Light light;

    public TurnOnCommand(Light light) {
        this.light = light;
    }

    public void execute() { light.turn_on(); }
    public void undo() { light.turn_off(); }
}

class TurnOffCommand : Object, Command {
    private Light light;

    public TurnOffCommand(Light light) {
        this.light = light;
    }

    public void execute() { light.turn_off(); }
    public void undo() { light.turn_on(); }
}

class RemoteControl : Object {
    private Gee.ArrayList<Command> history = new Gee.ArrayList<Command>();

    public void perform(Command command) {
        command.execute();
        history.add(command);
    }

    public void undo_last() {
        if (history.size == 0) {
            return;
        }
        var last = history[history.size - 1];
        history.remove_at(history.size - 1);
        last.undo();
    }
}

void main() {
    var light = new Light();
    var remote = new RemoteControl();

    remote.perform(new TurnOnCommand(light));
    remote.perform(new TurnOffCommand(light));
    remote.undo_last();

    stdout.printf("final state is_on: %s\n", light.is_on.to_string());
}
