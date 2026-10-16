class Registry
  def self.const_missing(name)
    puts "const_missing: #{name}"
    const_set(name, name.to_s.downcase)
  end
end

puts Registry::Foo
puts Registry::Foo  # defined now, hook not called again
puts Registry.constants.inspect

module Colors
  RED = 1
  GREEN = 2
  def self.name_of(v) = constants.find { |c| const_get(c) == v }
end
puts Colors.name_of(2).inspect
puts Colors.const_defined?(:BLUE)
Colors.send(:remove_const, :RED)
puts Colors.constants.inspect
puts Object.const_get("Colors::GREEN")
