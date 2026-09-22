// Adapter: wrap an existing type behind the trait client code
// expects, without modifying the wrapped type itself.

struct LegacyPrinter;

impl LegacyPrinter {
    fn print_inches(&self, value: f64) {
        println!("legacy: {value} inches");
    }
}

trait MetricPrinter {
    fn print_cm(&self, value_cm: f64);
}

struct MetricPrinterAdapter {
    legacy: LegacyPrinter,
}

impl MetricPrinter for MetricPrinterAdapter {
    fn print_cm(&self, value_cm: f64) {
        self.legacy.print_inches(value_cm / 2.54);
    }
}

fn describe(printer: &dyn MetricPrinter, value_cm: f64) {
    printer.print_cm(value_cm);
}

fn main() {
    let adapter = MetricPrinterAdapter { legacy: LegacyPrinter };
    describe(&adapter, 25.4);
    describe(&adapter, 5.08);
}
