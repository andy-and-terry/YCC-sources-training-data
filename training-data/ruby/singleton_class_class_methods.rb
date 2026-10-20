class Config
  class << self
    attr_accessor :level
    def configure = yield(self)
  end
end

Config.configure { |c| c.level = :debug }
puts Config.level
obj = Object.new
def obj.hi = "hi from singleton"
puts obj.hi, obj.singleton_methods.inspect
