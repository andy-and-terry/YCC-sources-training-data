# Tracking method definitions with the method_added and singleton_method_added hooks.

class Tracked
  @log = []

  class << self
    attr_reader :log

    def method_added(name)
      super
      @log << "instance method #{name}"
    end

    def singleton_method_added(name)
      super
      @log << "class method #{name}" unless name == :singleton_method_added
    end
  end

  def run; end
  def stop; end

  def self.build
    new
  end

  define_method(:dynamic) { :ok }
  alias_method :halt, :stop
end

puts Tracked.log
