class Model
  def self.attribute(name, default: nil)
    define_method(name) { instance_variable_get("@#{name}") || default }
    define_method("#{name}=") { |v| instance_variable_set("@#{name}", v) }
  end

  attribute :title, default: "untitled"
  attribute :views, default: 0
end

m = Model.new
puts m.title
m.views = 5
puts m.views
