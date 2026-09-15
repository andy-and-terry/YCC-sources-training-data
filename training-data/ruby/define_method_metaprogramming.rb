class Product
  ATTRIBUTES = %i[name price quantity].freeze

  ATTRIBUTES.each do |attribute|
    define_method(attribute) { instance_variable_get("@#{attribute}") }
    define_method("#{attribute}=") { |value| instance_variable_set("@#{attribute}", value) }
  end

  def initialize(attrs = {})
    attrs.each { |key, value| public_send("#{key}=", value) }
  end

  class << self
    def create_validated(attrs)
      new(attrs).tap do |product|
        raise ArgumentError, 'price must be positive' unless product.price.positive?
      end
    end
  end
end

widget = Product.new(name: 'Widget', price: 9.99, quantity: 3)
puts widget.name
puts widget.price
widget.quantity = 10
puts widget.quantity

begin
  Product.create_validated(name: 'Bad', price: -1, quantity: 1)
rescue ArgumentError => e
  puts "rejected: #{e.message}"
end
