class Ver
  include Comparable
  attr_reader :parts
  def initialize(s) = @parts = s.split(".").map(&:to_i)
  def <=>(o) = parts <=> o.parts
  def to_s = parts.join(".")
end

vs = %w[1.10.0 1.2.0 1.9.5].map { Ver.new(_1) }
puts vs.sort.join(" ")
puts vs.max, vs.min
puts Ver.new("1.2.0").between?(vs.min, vs.max)
