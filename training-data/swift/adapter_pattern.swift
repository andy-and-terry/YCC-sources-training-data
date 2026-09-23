protocol ModernPrinter {
    func print(text: String)
}

// Incompatible legacy interface we cannot change.
final class LegacyPrinter {
    func legacyPrint(_ payload: String) {
        Swift.print("[legacy] \(payload)")
    }
}

// Adapter makes LegacyPrinter conform to the interface client code expects.
final class LegacyPrinterAdapter: ModernPrinter {
    private let legacy: LegacyPrinter

    init(_ legacy: LegacyPrinter) {
        self.legacy = legacy
    }

    func print(text: String) {
        legacy.legacyPrint(text)
    }
}

final class NativePrinter: ModernPrinter {
    func print(text: String) {
        Swift.print("[native] \(text)")
    }
}

func run(printer: ModernPrinter, message: String) {
    printer.print(text: message)
}

let printers: [ModernPrinter] = [
    NativePrinter(),
    LegacyPrinterAdapter(LegacyPrinter()),
]

for printer in printers {
    run(printer: printer, message: "hello")
}
