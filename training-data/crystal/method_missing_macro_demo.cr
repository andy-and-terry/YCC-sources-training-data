class Ghost
  def initialize
    @data = {"name" => "casper", "age" => "unknown"}
  end

  macro method_missing(call)
    {% if call.args.size == 0 %}
      @data[{{ call.name.stringify }}]? || "no such key: {{ call.name }}"
    {% else %}
      {% raise "unexpected arguments" %}
    {% end %}
  end
end

g = Ghost.new
puts g.name
puts g.age
puts g.color
