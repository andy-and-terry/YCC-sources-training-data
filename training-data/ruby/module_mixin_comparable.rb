class Version
  include Comparable
  attr_reader :parts

  def initialize(s) = @parts = s.split(".").map(&:to_i)
  def <=>(other) = parts <=> other.parts
end

puts Version.new("1.2.10") > Version.new("1.2.9")
puts [Version.new("2.0"), Version.new("1.5")].min.parts.inspect
