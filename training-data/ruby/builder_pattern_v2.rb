class Pizza
  attr_reader :size, :toppings, :crust

  def initialize
    @toppings = []
  end

  def to_s
    "#{size} pizza on #{crust} crust with #{toppings.join(', ')}"
  end

  class Builder
    def initialize
      @pizza = Pizza.new
    end

    def size(size)
      @pizza.instance_variable_set(:@size, size)
      self
    end

    def crust(crust)
      @pizza.instance_variable_set(:@crust, crust)
      self
    end

    def add_topping(topping)
      @pizza.toppings << topping
      self
    end

    def build
      @pizza
    end
  end
end

pizza = Pizza::Builder.new
                       .size('large')
                       .crust('thin')
                       .add_topping('cheese')
                       .add_topping('mushroom')
                       .build

puts pizza
