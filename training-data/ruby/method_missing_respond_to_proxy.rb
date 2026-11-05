class Ghost
  def method_missing(name, *args)
    name.to_s.start_with?("get_") ? name.to_s.sub("get_", "") : super
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.start_with?("get_") || super
  end
end

g = Ghost.new
puts g.get_name
puts g.respond_to?(:get_x)
begin
  g.other
rescue NoMethodError => e
  puts "no method"
end
