class Config
  {% for name, default in {host: "localhost", port: 8080, debug: false} %}
    property {{ name.id }} = {{ default }}
  {% end %}

  {% for op in %w(start stop restart) %}
    def {{ op.id }}!
      "{{ op.id }}ing on #{host}:#{port}"
    end
  {% end %}
end

c = Config.new
c.port = 9090
puts c.start!
puts c.restart!
puts c.debug
puts Config.instance_vars.size rescue puts "n/a"
