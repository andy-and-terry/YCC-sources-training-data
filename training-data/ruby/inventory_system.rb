class Inventory
  class UnknownSku < StandardError; end
  class OutOfStock < StandardError; end

  Product = Struct.new(:sku, :name, :price_cents, :reorder_level, :qty, keyword_init: true)

  def initialize = @products = {}

  def add(sku:, name:, price_cents:, reorder_level: 5)
    @products[sku] = Product.new(sku: sku, name: name, price_cents: price_cents, reorder_level: reorder_level, qty: 0)
  end

  def receive(sku, qty) = fetch(sku).qty += qty

  def sell(sku, qty)
    product = fetch(sku)
    raise OutOfStock, "#{product.name}: have #{product.qty}, want #{qty}" if product.qty < qty

    product.qty -= qty
    qty * product.price_cents
  end

  def reorder_list = @products.values.select { |p| p.qty <= p.reorder_level }.map(&:name)
  def valuation_cents = @products.values.sum { |p| p.qty * p.price_cents }

  private

  def fetch(sku) = @products.fetch(sku) { raise UnknownSku, sku }
end

inv = Inventory.new
inv.add(sku: 'A1', name: 'apple', price_cents: 50, reorder_level: 10)
inv.add(sku: 'P1', name: 'pear', price_cents: 75)
inv.receive('A1', 40)
inv.receive('P1', 8)
revenue = inv.sell('A1', 32) + inv.sell('P1', 2)
begin
  inv.sell('P1', 100)
rescue Inventory::OutOfStock => e
  puts "error: #{e.message}"
end
puts format('revenue %.2f, stock value %.2f, reorder %s', revenue / 100.0, inv.valuation_cents / 100.0, inv.reorder_list.inspect)
