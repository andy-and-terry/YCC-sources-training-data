protocol Command {
    func execute()
    func undo()
}

final class Light {
    private(set) var isOn = false

    func turnOn() {
        isOn = true
        print("Light is ON")
    }

    func turnOff() {
        isOn = false
        print("Light is OFF")
    }
}

final class TurnOnCommand: Command {
    private let light: Light
    init(_ light: Light) { self.light = light }
    func execute() { light.turnOn() }
    func undo() { light.turnOff() }
}

final class TurnOffCommand: Command {
    private let light: Light
    init(_ light: Light) { self.light = light }
    func execute() { light.turnOff() }
    func undo() { light.turnOn() }
}

final class RemoteControl {
    private var history: [Command] = []

    func perform(_ command: Command) {
        command.execute()
        history.append(command)
    }

    func undoLast() {
        guard let last = history.popLast() else { return }
        last.undo()
    }
}

let light = Light()
let remote = RemoteControl()

remote.perform(TurnOnCommand(light))
remote.perform(TurnOffCommand(light))
remote.undoLast()
print("final state isOn=\(light.isOn)")
