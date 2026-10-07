class Product
  ATTRIBUTES = [:name, :price, :quantity].freeze

  ATTRIBUTES.each do |attr|
    define_method(attr) { instance_variable_get("@#{attr}") }
    define_method("#{attr}=") { |value| instance_variable_set("@#{attr}", value) }
  end

  def initialize(name:, price:, quantity:)
    @name = name
    @price = price
    @quantity = quantity
  end

  def self.define_query(name, &block)
    define_method(name, &block)
  end

  define_query(:in_stock?) { quantity > 0 }
  define_query(:total) { price * quantity }
end

item = Product.new(name: "Widget", price: 2.5, quantity: 4)
puts item.name
puts item.total
puts item.in_stock?

item.quantity = 0
puts item.in_stock?
