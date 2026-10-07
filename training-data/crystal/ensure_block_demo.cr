# begin/rescue/else/ensure and retry-free cleanup.
def risky(n : Int32)
  begin
    puts "start #{n}"
    raise ArgumentError.new("negative") if n < 0
    10 // n
  rescue ex : DivisionByZeroError
    puts "div by zero"
    -1
  rescue ex : ArgumentError
    puts "bad arg: #{ex.message}"
    -2
  else
    puts "no error"
    0
  ensure
    puts "cleanup #{n}"
  end
end

puts risky(2)
puts risky(0)
puts risky(-1)
