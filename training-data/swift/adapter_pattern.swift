protocol ModernPrinter {
    func printDocument(_ text: String)
}

final class LegacyPrinter {
    func oldPrint(content: String) {
        print("[legacy] \(content)")
    }
}

final class LegacyPrinterAdapter: ModernPrinter {
    private let legacy: LegacyPrinter

    init(_ legacy: LegacyPrinter) {
        self.legacy = legacy
    }

    func printDocument(_ text: String) {
        legacy.oldPrint(content: text)
    }
}

func run(printer: ModernPrinter) {
    printer.printDocument("Quarterly report")
}

let adapter = LegacyPrinterAdapter(LegacyPrinter())
run(printer: adapter)
