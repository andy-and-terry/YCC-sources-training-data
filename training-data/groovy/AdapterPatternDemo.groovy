interface ModernPrinter {
    String print(String text)
}

class LegacyPrinter {
    String printLegacy(String text) {
        return "[legacy] ${text}"
    }
}

class LegacyPrinterAdapter implements ModernPrinter {
    private LegacyPrinter legacy

    LegacyPrinterAdapter(LegacyPrinter legacy) {
        this.legacy = legacy
    }

    String print(String text) {
        return legacy.printLegacy(text)
    }
}

def render(ModernPrinter p, String text) {
    return p.print(text)
}

def adapter = new LegacyPrinterAdapter(new LegacyPrinter())
println render(adapter, "hello")
