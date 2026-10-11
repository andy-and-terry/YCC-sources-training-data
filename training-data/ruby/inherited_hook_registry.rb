class Plugin
  @registry = []

  class << self
    attr_reader :registry

    def inherited(sub)
      super
      Plugin.registry << sub
    end
  end

  def self.run_all = registry.map { |k| k.new.run }
end

class Alpha < Plugin
  def run = "alpha"
end

class Beta < Plugin
  def run = "beta"
end

puts Plugin.registry.inspect
puts Plugin.run_all.inspect
puts Alpha.superclass, Alpha.ancestors.first(2).inspect
puts Plugin.subclasses.map(&:name).sort.inspect
