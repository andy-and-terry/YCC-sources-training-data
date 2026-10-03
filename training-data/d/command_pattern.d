import std.stdio;

interface Command {
    void execute();
    void undo();
}

class Light {
    bool on = false;

    void turnOn() {
        on = true;
        writeln("Light on");
    }

    void turnOff() {
        on = false;
        writeln("Light off");
    }
}

class LightOnCommand : Command {
    private Light light;

    this(Light light) {
        this.light = light;
    }

    void execute() { light.turnOn(); }
    void undo() { light.turnOff(); }
}

void main() {
    auto light = new Light();
    Command cmd = new LightOnCommand(light);
    cmd.execute();
    cmd.undo();
}
