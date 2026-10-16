e = [1, 2, 3].each
loop do
  puts e.next
end
puts "loop swallowed StopIteration"

result = loop do
  e.next
end
puts result.inspect   # the exception's result (the array)

en = Enumerator.new do |y|
  y << :a
  y << :b
  :done
end
r = loop { puts en.next }
puts r.inspect

e2 = [10, 20].each
puts e2.next, e2.peek, e2.next
begin
  e2.next
rescue StopIteration => ex
  puts "stop: #{ex.message}"
end
e2.rewind
puts e2.next
i = 0
i += 1 while i < 5
puts i
begin; i -= 1; end until i <= 2
puts i
