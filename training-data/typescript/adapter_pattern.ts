interface ModernPrinter {
  printDocument(text: string): void;
}

// Legacy interface with an incompatible method signature.
class LegacyPrinter {
  printOldFormat(payload: { content: string; uppercase: boolean }): void {
    const text = payload.uppercase ? payload.content.toUpperCase() : payload.content;
    console.log(`[legacy] ${text}`);
  }
}

class LegacyPrinterAdapter implements ModernPrinter {
  constructor(private legacy: LegacyPrinter) {}

  printDocument(text: string): void {
    this.legacy.printOldFormat({ content: text, uppercase: false });
  }
}

function render(printer: ModernPrinter, text: string): void {
  printer.printDocument(text);
}

const adapted: ModernPrinter = new LegacyPrinterAdapter(new LegacyPrinter());
render(adapted, "hello from the adapter pattern");
