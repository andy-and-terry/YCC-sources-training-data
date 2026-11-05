module Tracked
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def instances = @instances ||= []
  end

  def register = self.class.instances << self
end

class Thing
  include Tracked
end

Thing.new.register
Thing.new.register
puts Thing.instances.size
