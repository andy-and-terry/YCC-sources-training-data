interface Command {
    void execute()
    void undo()
}

class Light {
    boolean on = false
}

class TurnOnCommand implements Command {
    Light light

    void execute() { light.on = true }
    void undo() { light.on = false }
}

class TurnOffCommand implements Command {
    Light light

    void execute() { light.on = false }
    void undo() { light.on = true }
}

class CommandHistory {
    List<Command> history = []

    void run(Command command) {
        command.execute()
        history << command
    }

    void undoLast() {
        if (!history) return
        history.pop().undo()
    }
}

def light = new Light()
def history = new CommandHistory()

history.run(new TurnOnCommand(light: light))
println "light on? ${light.on}"

history.run(new TurnOffCommand(light: light))
println "light on? ${light.on}"

history.undoLast()
println "light on after undo? ${light.on}"
