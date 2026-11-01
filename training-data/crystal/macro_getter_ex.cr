macro make_getters(*names)
  {% for n in names %}
    def {{n.id}}
      @{{n.id}}
    end
  {% end %}
end

class Cfg
  def initialize(@host : String, @port : Int32); end
  make_getters host, port
end

c = Cfg.new("localhost", 80)
puts "#{c.host}:#{c.port}"
