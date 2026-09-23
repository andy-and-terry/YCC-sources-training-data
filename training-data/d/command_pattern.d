import std.stdio;

interface Command {
    void execute();
    void undo();
}

class Light {
    bool on = false;
    void turnOn() { on = true; writeln("light on"); }
    void turnOff() { on = false; writeln("light off"); }
}

class TurnOnCommand : Command {
    private Light light;
    this(Light light) { this.light = light; }
    void execute() { light.turnOn(); }
    void undo() { light.turnOff(); }
}

class TurnOffCommand : Command {
    private Light light;
    this(Light light) { this.light = light; }
    void execute() { light.turnOff(); }
    void undo() { light.turnOn(); }
}

class RemoteControl {
    private Command[] history;

    void submit(Command command) {
        command.execute();
        history ~= command;
    }

    void undoLast() {
        if (history.length == 0) return;
        auto last = history[$ - 1];
        history = history[0 .. $ - 1];
        last.undo();
    }
}

void main() {
    auto light = new Light();
    auto remote = new RemoteControl();
    remote.submit(new TurnOnCommand(light));
    remote.submit(new TurnOffCommand(light));
    remote.undoLast();
}
