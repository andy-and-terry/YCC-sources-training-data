class Counter
  @@total = 0
  @instances = 0

  class << self
    attr_accessor :instances
  end

  def self.total = @@total

  def initialize
    @@total += 1
    self.class.instances += 1
  end
end

class SubCounter < Counter
  @instances = 0
end

Counter.new
Counter.new
SubCounter.new
puts Counter.total          # shared across hierarchy
puts Counter.instances      # per-class
puts SubCounter.instances
puts Counter.class_variable_get(:@@total)
puts Counter.class_variables.inspect
puts Counter.instance_variables.inspect
