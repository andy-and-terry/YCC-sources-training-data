protocol ModernPlug {
    func connect() -> String
}

final class EuropeanPlug {
    func plugIntoSocket() -> String { "220V European plug connected" }
}

final class EuropeanPlugAdapter: ModernPlug {
    private let plug: EuropeanPlug

    init(_ plug: EuropeanPlug) {
        self.plug = plug
    }

    func connect() -> String {
        "[adapter] \(plug.plugIntoSocket())"
    }
}

final class USPlug: ModernPlug {
    func connect() -> String { "120V US plug connected" }
}

func powerUp(_ device: ModernPlug) {
    print(device.connect())
}

powerUp(USPlug())
powerUp(EuropeanPlugAdapter(EuropeanPlug()))
