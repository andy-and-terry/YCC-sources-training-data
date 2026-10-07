interface ModernPrinter {
    String print(String text)
}

class LegacyPrinter {
    String printLegacy(String text) {
        return "[legacy] ${text}"
    }
}

class LegacyPrinterAdapter implements ModernPrinter {
    LegacyPrinter legacy

    LegacyPrinterAdapter(LegacyPrinter legacy) {
        this.legacy = legacy
    }

    String print(String text) {
        return legacy.printLegacy(text)
    }
}

def render(ModernPrinter printer, String text) {
    return printer.print(text)
}

def adapter = new LegacyPrinterAdapter(new LegacyPrinter())
println render(adapter, "hello")
