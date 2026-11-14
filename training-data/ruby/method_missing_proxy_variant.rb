class Ghost
  def method_missing(name, *args)
    name.to_s.start_with?("get_") ? "value of #{name.to_s.sub('get_', '')}" : super
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.start_with?("get_") || super
  end
end

g = Ghost.new
puts g.get_color
puts g.respond_to?(:get_size)
