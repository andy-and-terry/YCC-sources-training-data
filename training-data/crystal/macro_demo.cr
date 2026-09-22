macro define_getter(name)
  def {{name.id}}
    @{{name.id}}
  end
end

class Product
  def initialize(@title : String, @price : Float64)
  end

  define_getter title
  define_getter price
end

product = Product.new("Widget", 9.99)
puts "#{product.title}: #{product.price}"
