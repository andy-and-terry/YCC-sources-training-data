class Config
  {% for name in %w(host port user) %}
    def {{name.id}}
      "{{name.id}}-value"
    end
  {% end %}
end

c = Config.new
puts c.host, c.port, c.user
