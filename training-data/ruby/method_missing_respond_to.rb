class Ghost
  def method_missing(name, *args)
    if name.to_s.start_with?("get_")
      "value of #{name.to_s.sub('get_', '')}"
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false) = name.to_s.start_with?("get_") || super
end

g = Ghost.new
puts g.get_color, g.respond_to?(:get_x), g.respond_to?(:other)
begin
  g.other
rescue NoMethodError => e
  puts "NoMethodError"
end
