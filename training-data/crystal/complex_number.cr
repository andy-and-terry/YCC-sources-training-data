struct Complex
  getter real : Float64
  getter imag : Float64

  def initialize(@real : Float64, @imag : Float64)
  end

  def +(other : Complex) : Complex
    Complex.new(real + other.real, imag + other.imag)
  end

  def -(other : Complex) : Complex
    Complex.new(real - other.real, imag - other.imag)
  end

  def *(other : Complex) : Complex
    Complex.new(real * other.real - imag * other.imag, real * other.imag + imag * other.real)
  end

  def -@ : Complex
    Complex.new(-real, -imag)
  end

  def ==(other : Complex) : Bool
    real == other.real && imag == other.imag
  end

  def to_s(io)
    sign = imag < 0 ? "-" : "+"
    io << "#{real}#{sign}#{imag.abs}i"
  end
end

a = Complex.new(2.0, 3.0)
b = Complex.new(1.0, -4.0)
puts a + b
puts a - b
puts a * b
puts -a
puts a == Complex.new(2.0, 3.0)
