# Module#prepend wraps a method and can call super; included hooks register behavior.
module Timing
  def compute(n)
    result = super
    puts "compute(#{n}) -> #{result}"
    result
  end
end

class Calculator
  prepend Timing

  def compute(n) = (1..n).sum
end

module Tracked
  def self.included(base)
    (@classes ||= []) << base.name
  end

  def self.classes = @classes
end

class Widget; include Tracked; end

Calculator.new.compute(4)
puts Calculator.ancestors.first(2).inspect
puts Tracked.classes.inspect
