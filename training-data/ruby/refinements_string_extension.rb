# Refinements scope a monkey patch to files/blocks that opt in with `using`.
module Shout
  refine String do
    def shout = upcase + "!"
  end
end

module Demo
  using Shout
  def self.run = "hello".shout
end

puts Demo.run
puts "hello".respond_to?(:shout)  # false outside the refinement's scope
