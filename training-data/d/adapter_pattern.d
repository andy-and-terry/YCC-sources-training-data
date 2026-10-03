import std.stdio;

interface ModernPrinter {
    void print(string text);
}

class LegacyPrinter {
    void oldPrint(string text) {
        writeln("[legacy] ", text);
    }
}

class PrinterAdapter : ModernPrinter {
    private LegacyPrinter legacy;

    this(LegacyPrinter legacy) {
        this.legacy = legacy;
    }

    void print(string text) {
        legacy.oldPrint(text);
    }
}

void main() {
    ModernPrinter printer = new PrinterAdapter(new LegacyPrinter());
    printer.print("hello via adapter");
}
