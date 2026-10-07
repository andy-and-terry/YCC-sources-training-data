class Fraction
  include Comparable
  attr_reader :numerator, :denominator

  def initialize(numerator, denominator)
    divisor = numerator.gcd(denominator)
    @numerator = numerator / divisor
    @denominator = denominator / divisor
  end

  def +(other)
    other = coerce_other(other)
    Fraction.new(numerator * other.denominator + other.numerator * denominator, denominator * other.denominator)
  end

  def *(other)
    other = coerce_other(other)
    Fraction.new(numerator * other.numerator, denominator * other.denominator)
  end

  def <=>(other)
    other = coerce_other(other)
    (numerator * other.denominator) <=> (other.numerator * denominator)
  end

  def coerce(numeric)
    [Fraction.new(numeric, 1), self]
  end

  def to_s
    "#{numerator}/#{denominator}"
  end

  private

  def coerce_other(other)
    other.is_a?(Fraction) ? other : Fraction.new(other, 1)
  end
end

half = Fraction.new(1, 2)
third = Fraction.new(1, 3)

puts (half + third).to_s
puts (half * third).to_s
puts (2 + half).to_s
puts half > third
puts [half, third].sort.map(&:to_s).inspect
