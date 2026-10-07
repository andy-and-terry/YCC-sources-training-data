interface Command {
    void execute()
    void undo()
}

class Light {
    boolean on = false

    void turnOn() {
        on = true
        println "light on"
    }

    void turnOff() {
        on = false
        println "light off"
    }
}

class LightOnCommand implements Command {
    Light light

    LightOnCommand(Light light) { this.light = light }

    void execute() { light.turnOn() }
    void undo() { light.turnOff() }
}

class LightOffCommand implements Command {
    Light light

    LightOffCommand(Light light) { this.light = light }

    void execute() { light.turnOff() }
    void undo() { light.turnOn() }
}

class RemoteControl {
    List<Command> history = []

    void submit(Command command) {
        command.execute()
        history.push(command)
    }

    void undoLast() {
        if (history) {
            history.pop().undo()
        }
    }
}

def light = new Light()
def remote = new RemoteControl()

remote.submit(new LightOnCommand(light))
remote.submit(new LightOffCommand(light))
remote.undoLast()
println "final state: ${light.on}"
