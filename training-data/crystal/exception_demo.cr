class DivisionByZeroError < Exception
end

def safe_divide(a : Int32, b : Int32) : Int32
  raise DivisionByZeroError.new("cannot divide by zero") if b == 0
  a // b
end

begin
  puts safe_divide(10, 2)
  puts safe_divide(5, 0)
rescue ex : DivisionByZeroError
  puts "error: #{ex.message}"
end
