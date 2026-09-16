interface ModernPrinter {
  print(text: string): string;
}

class LegacyPrinter {
  printLegacy(text: string): string {
    return `[LEGACY] ${text.toUpperCase()}`;
  }
}

class LegacyPrinterAdapter implements ModernPrinter {
  constructor(private readonly legacy: LegacyPrinter) {}

  print(text: string): string {
    return this.legacy.printLegacy(text);
  }
}

class NativePrinter implements ModernPrinter {
  print(text: string): string {
    return `[NATIVE] ${text}`;
  }
}

function renderAll(printers: ModernPrinter[], text: string): string[] {
  return printers.map((p) => p.print(text));
}

const printers: ModernPrinter[] = [
  new NativePrinter(),
  new LegacyPrinterAdapter(new LegacyPrinter()),
];

console.log(renderAll(printers, "hello world"));
