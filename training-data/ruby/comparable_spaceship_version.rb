class Version
  include Comparable
  attr_reader :parts
  def initialize(s) = @parts = s.split(".").map(&:to_i)
  def <=>(o) = parts <=> o.parts
  def to_s = parts.join(".")
end
vs = %w[1.10.0 1.2.0 1.2.10].map { Version.new(_1) }
puts vs.sort.join(" < ")
puts vs.max
