# A small configuration DSL built on instance_eval.
class RouteTable
  Route = Struct.new(:verb, :path, :handler)

  def self.build(&block)
    table = new
    table.instance_eval(&block)
    table
  end

  def initialize
    @routes = []
  end

  %i[get post delete].each do |verb|
    define_method(verb) do |path, to:|
      @routes << Route.new(verb.to_s.upcase, path, to)
    end
  end

  def namespace(prefix)
    saved = @prefix
    @prefix = "#{saved}#{prefix}"
    yield
  ensure
    @prefix = saved
  end

  def dump
    @routes.each { |r| puts "#{r.verb.ljust(6)} #{r.path} -> #{r.handler}" }
  end
end

RouteTable.build do
  get "/", to: "home#index"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end.dump
