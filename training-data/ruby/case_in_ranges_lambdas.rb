def classify(x)
  case x
  when Integer, Float then "number"
  when /^\d+$/ then "digit string"
  when String then "string"
  when ->(v) { v.respond_to?(:each) } then "enumerable"
  when nil then "nil"
  else "other"
  end
end

[1, 2.5, "42", "hi", [1], { a: 1 }, nil, :sym].each { |v| puts "#{v.inspect} -> #{classify(v)}" }

is_even = ->(n) { n.even? }
case 4
when is_even then puts "even via lambda"
end

grade = case 85 when 90.. then "A" when 80..89 then "B" else "C" end
puts grade
x = if false then 1 end
puts x.inspect
