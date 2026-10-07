class Widget
  def initialize(name)
    @name = name
  end

  def to_s
    @name
  end
end

special = Widget.new("gizmo")
ordinary = Widget.new("gadget")

# Opening the singleton class lets you add behavior to exactly one
# object, without affecting any other instance of the same class.
class << special
  def glow
    "#{self} is glowing!"
  end
end

puts special.glow
puts special.singleton_methods.inspect

begin
  ordinary.glow
rescue NoMethodError => e
  puts "as expected: #{e.message}"
end

# Class methods are just singleton methods on the class object itself.
class Widget
  class << self
    def factory_default
      new("default")
    end
  end
end

puts Widget.factory_default
