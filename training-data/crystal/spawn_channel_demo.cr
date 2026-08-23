channel = Channel(Int32).new

spawn do
  channel.send(42)
end

result = channel.receive
puts result
