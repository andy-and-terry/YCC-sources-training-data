module Trackable
  def self.included(base)
    puts "#{self} included in #{base}"
    base.extend(ClassMethods)
  end

  def self.extended(obj)
    puts "extended #{obj.inspect}"
  end

  module ClassMethods
    def tracked = @tracked ||= []
    def track(*names) = tracked.concat(names)
  end

  def tracked_values = self.class.tracked.map { |n| send(n) }
end

class Item
  include Trackable
  track :name, :price
  attr_reader :name, :price

  def initialize(n, p) = (@name, @price = n, p)
end

puts Item.new("pen", 2).tracked_values.inspect
o = Object.new
o.extend(Trackable)
puts o.singleton_class.include?(Trackable)
