# The `inherited` macro hook runs at compile time whenever a class is subclassed.
class Plugin
  REGISTRY = [] of String

  macro inherited
    {% puts "registering #{@type.name}" %}
    Plugin::REGISTRY << {{ @type.name.stringify }}
  end
end

class CsvPlugin < Plugin
end

class JsonPlugin < Plugin
end

puts Plugin::REGISTRY.inspect
