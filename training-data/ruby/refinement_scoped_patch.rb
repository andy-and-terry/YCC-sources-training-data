module Shout
  refine String do
    def shout = upcase + "!"
  end

  refine Integer do
    def double = self * 2
  end
end

begin
  "a".shout
rescue NoMethodError
  puts "not active yet"
end

using Shout
puts "hello".shout, 4.double
puts ["a", "b"].map(&:shout).inspect
puts "x".respond_to?(:shout)
puts "x".send(:shout) rescue puts "send ok in 2.4+"
puts Shout.refinements.size rescue puts "n/a"
