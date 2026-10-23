require "yaml"

class Config
  include YAML::Serializable

  property name : String
  property port : Int32
  property tags : Array(String)
end

source = <<-YAML
name: demo
port: 8080
tags:
  - web
  - api
YAML

config = Config.from_yaml(source)
puts config.name
puts config.port
puts config.tags.join(",")

config.port = 9090
puts config.to_yaml
