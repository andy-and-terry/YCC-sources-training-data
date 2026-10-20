# Including Comparable gives <, >, between?, clamp from a single <=> definition.
class Version
  include Comparable
  attr_reader :parts

  def initialize(str)
    @parts = str.split(".").map(&:to_i)
  end

  def <=>(other)
    parts <=> other.parts
  end

  def to_s = parts.join(".")
end

versions = %w[1.10.0 1.2.0 1.2.10].map { |s| Version.new(s) }
puts versions.sort.map(&:to_s).inspect
puts Version.new("1.5").between?(Version.new("1.0"), Version.new("2.0"))
puts versions.max
