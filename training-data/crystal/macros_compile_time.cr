macro define_getter(name, value)
  def {{name.id}}
    {{value}}
  end
end

define_getter answer, 42
define_getter greeting, "hello"
puts answer, greeting

macro debug(expr)
  puts "{{expr}} = #{ {{expr}} }"
end
debug 1 + 2 * 3
debug "abc".upcase

class Config
  {% for key in %w(host port user) %}
    property {{key.id}} : String = ""
  {% end %}
end
c = Config.new
c.host = "localhost"
puts c.host

{% if flag?(:linux) %}
  puts "linux"
{% else %}
  puts "other os"
{% end %}
puts {{ 1 + 2 }}
puts {{ [1, 2, 3].map { |x| x * x } }}
puts {{ "abc".upcase }}
