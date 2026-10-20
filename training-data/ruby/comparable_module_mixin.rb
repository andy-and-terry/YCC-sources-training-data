class Version
  include Comparable
  attr_reader :parts

  def initialize(s) = @parts = s.split(".").map(&:to_i)
  def <=>(other) = parts <=> other.parts
  def to_s = parts.join(".")
end

vs = %w[1.10.0 1.2.0 1.2.10].map { |s| Version.new(s) }
puts vs.sort.join(" "), vs.max, Version.new("1.0").between?(Version.new("0.9"), Version.new("1.1"))
