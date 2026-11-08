class Version
  include Comparable
  attr_reader :parts

  def initialize(str)
    @parts = str.split('.').map(&:to_i)
  end

  def <=>(other)
    parts <=> other.parts
  end

  def to_s = parts.join('.')
end

vs = %w[1.10.0 1.2.9 1.2.10].map { |s| Version.new(s) }
puts vs.sort.join(' < ')
puts vs.max
