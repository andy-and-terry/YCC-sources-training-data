struct Point
  getter x : Int32
  getter y : Int32

  def initialize(@x : Int32, @y : Int32); end

  def +(other : Point) : Point
    Point.new(x + other.x, y + other.y)
  end

  def to_s(io) : Nil
    io << "(" << x << ", " << y << ")"
  end
end

class Account
  property owner : String
  getter balance : Float64 = 0.0
  @@count = 0

  def initialize(@owner : String)
    @@count += 1
  end

  def deposit(amount : Float64) : self
    raise ArgumentError.new("must be positive") unless amount > 0
    @balance += amount
    self
  end

  def self.count; @@count; end
end

puts Point.new(1, 2) + Point.new(3, 4)
a = Account.new("Ada").deposit(10.5).deposit(4.5)
puts a.balance, Account.count
begin
  a.deposit(-1.0)
rescue ex : ArgumentError
  puts "error: #{ex.message}"
end
