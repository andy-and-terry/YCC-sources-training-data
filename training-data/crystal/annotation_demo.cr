annotation Route
end

class Controller
  @[Route(path: "/users", method: "GET")]
  def list
    "users list"
  end

  @[Route(path: "/users/new", method: "POST")]
  def create
    "user created"
  end

  def helper
    "not routed"
  end

  def self.routes
    {% begin %}
      [
        {% for m in @type.methods %}
          {% if ann = m.annotation(Route) %}
            { {{ ann[:method] }}, {{ ann[:path] }}, {{ m.name.stringify }} },
          {% end %}
        {% end %}
      ]
    {% end %}
  end
end

Controller.routes.each { |verb, path, name| puts "#{verb} #{path} -> #{name}" }
