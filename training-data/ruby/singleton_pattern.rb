require 'singleton'

class Config
  include Singleton
  attr_accessor :value
end

Config.instance.value = 42
puts Config.instance.value
puts Config.instance.equal?(Config.instance)
