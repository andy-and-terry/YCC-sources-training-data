class LegacyPrinter {
  printOld(text) {
    console.log(`[legacy] ${text}`);
  }
}

class PrinterAdapter {
  constructor(legacyPrinter) {
    this.legacyPrinter = legacyPrinter;
  }
  print(text) {
    this.legacyPrinter.printOld(text);
  }
}

function clientCode(printer) {
  printer.print('Hello, Adapter Pattern');
}

clientCode(new PrinterAdapter(new LegacyPrinter()));
module.exports = { LegacyPrinter, PrinterAdapter };
