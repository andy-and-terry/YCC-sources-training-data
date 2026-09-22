class LegacyPrinter
  def print_inches(value)
    puts "legacy: #{value} inches"
  end
end

class MetricPrinterAdapter
  def initialize(legacy_printer)
    @legacy_printer = legacy_printer
  end

  def print_cm(value_cm)
    @legacy_printer.print_inches(value_cm / 2.54)
  end
end

printer = MetricPrinterAdapter.new(LegacyPrinter.new)
printer.print_cm(25.4)
printer.print_cm(5.08)
