module Trackable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def instances
      @instances ||= []
    end

    def create(*args)
      new(*args).tap { |o| instances << o }
    end
  end
end

class Item
  include Trackable
  def initialize(n) = @n = n
end

Item.create(1)
Item.create(2)
puts Item.instances.size
