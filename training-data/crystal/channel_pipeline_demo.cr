def generate(count : Int32) : Channel(Int32)
  channel = Channel(Int32).new
  spawn do
    (1..count).each { |n| channel.send(n) }
    channel.close
  end
  channel
end

def square(input : Channel(Int32)) : Channel(Int32)
  output = Channel(Int32).new
  spawn do
    loop do
      value = input.receive?
      break if value.nil?
      output.send(value * value)
    end
    output.close
  end
  output
end

numbers = generate(5)
squares = square(numbers)

total = 0
loop do
  value = squares.receive?
  break if value.nil?
  total += value
end
puts total
