class Model
  def self.attribute(name, default: nil)
    define_method(name) { instance_variable_get("@#{name}") || default }
    define_method("#{name}=") { |v| instance_variable_set("@#{name}", v) }
    define_method("#{name}?") { !!send(name) }
  end
  attribute :title, default: "untitled"
  attribute :done
end

m = Model.new
puts m.title, m.done?
m.done = true
puts m.done?
