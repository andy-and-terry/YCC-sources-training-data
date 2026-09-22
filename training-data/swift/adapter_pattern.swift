protocol ModernPrinter {
    func printDocument(_ text: String)
}

class LegacyPrinter {
    func oldPrint(content: String) {
        print("[legacy] \(content)")
    }
}

class LegacyPrinterAdapter: ModernPrinter {
    private let legacy: LegacyPrinter

    init(_ legacy: LegacyPrinter) {
        self.legacy = legacy
    }

    func printDocument(_ text: String) {
        legacy.oldPrint(content: text)
    }
}

class NativePrinter: ModernPrinter {
    func printDocument(_ text: String) {
        print("[native] \(text)")
    }
}

func run(printer: ModernPrinter, text: String) {
    printer.printDocument(text)
}

let printers: [ModernPrinter] = [NativePrinter(), LegacyPrinterAdapter(LegacyPrinter())]
for printer in printers {
    run(printer: printer, text: "Quarterly report")
}
