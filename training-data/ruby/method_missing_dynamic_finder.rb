class Record
  def initialize(h) = @h = h
  def method_missing(name, *args)
    key = name.to_s
    return @h[key.to_sym] if @h.key?(key.to_sym)
    super
  end
  def respond_to_missing?(n, p = false) = @h.key?(n) || super
end
r = Record.new(name: "Ann")
puts r.name, r.respond_to?(:name)
begin; r.age; rescue NoMethodError => e; puts "no #{e.name}"; end
