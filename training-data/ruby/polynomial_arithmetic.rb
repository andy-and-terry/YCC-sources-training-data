class Polynomial
  attr_reader :coeffs

  def initialize(coeffs)
    c = coeffs.dup
    c.pop while c.size > 1 && c.last.zero?
    @coeffs = c.empty? ? [0] : c
  end

  def +(other)
    n = [coeffs.size, other.coeffs.size].max
    Polynomial.new(Array.new(n) { |i| coeffs.fetch(i, 0) + other.coeffs.fetch(i, 0) })
  end

  def *(other)
    out = Array.new(coeffs.size + other.coeffs.size - 1, 0)
    coeffs.each_with_index { |a, i| other.coeffs.each_with_index { |b, j| out[i + j] += a * b } }
    Polynomial.new(out)
  end

  def call(x) = coeffs.reverse.reduce(0) { |acc, c| acc * x + c }
  def derivative = Polynomial.new(coeffs.each_with_index.drop(1).map { |c, i| c * i })

  def to_s
    terms = coeffs.each_with_index.reverse_each.filter_map do |c, i|
      next if c.zero? && coeffs.size > 1

      case i
      when 0 then c.to_s
      when 1 then "#{c == 1 ? '' : c}x"
      else "#{c == 1 ? '' : c}x^#{i}"
      end
    end
    terms.join(' + ')
  end
end

p1 = Polynomial.new([1, 1])
cube = p1 * p1 * p1
puts cube, cube.derivative, cube.call(2)
puts Polynomial.new([-1, 0, 1]) + Polynomial.new([1, 0, -1])
