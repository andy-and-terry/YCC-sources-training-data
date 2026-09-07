class ReportGenerator
  def generate
    header = build_header
    body = build_body
    footer = build_footer
    "#{header}\n#{body}\n#{footer}"
  end

  def build_header
    "=== Report ==="
  end

  def build_footer
    "=== End ==="
  end

  def build_body
    raise NotImplementedError, "subclasses must implement build_body"
  end
end

class SalesReport < ReportGenerator
  def initialize(total)
    @total = total
  end

  def build_body
    "Total sales: $#{@total}"
  end
end

class InventoryReport < ReportGenerator
  def initialize(items)
    @items = items
  end

  def build_body
    "Items in stock: #{@items}"
  end
end

puts SalesReport.new(1000).generate
puts InventoryReport.new(42).generate
