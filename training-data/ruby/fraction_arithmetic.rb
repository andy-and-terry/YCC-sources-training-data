# Ruby has built-in Rationals; this shows a hand-rolled class next to them.
class Frac
  include Comparable
  attr_reader :num, :den

  def initialize(num, den = 1)
    raise ZeroDivisionError, 'zero denominator' if den.zero?

    num, den = -num, -den if den.negative?
    g = num.gcd(den)
    @num = num / g
    @den = den / g
  end

  def +(other) = Frac.new(num * other.den + other.num * den, den * other.den)
  def -(other) = Frac.new(num * other.den - other.num * den, den * other.den)
  def *(other) = Frac.new(num * other.num, den * other.den)
  def /(other) = Frac.new(num * other.den, den * other.num)
  def <=>(other) = num * other.den <=> other.num * den
  def to_s = den == 1 ? num.to_s : "#{num}/#{den}"
end

a = Frac.new(1, 3)
b = Frac.new(1, 6)
puts [a + b, a - b, a * b, a / b].join(' '), a > b
h = (1..20).map { |k| Frac.new(1, k) }.reduce(:+)
puts "H(20) = #{h} (Rational: #{(1..20).sum { |k| Rational(1, k) }})"
puts [Frac.new(3, 4), Frac.new(-1, 2), Frac.new(2, 3)].sort.join(' < ')
