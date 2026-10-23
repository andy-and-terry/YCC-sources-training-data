# `case/when` calls `===` on the pattern, so different classes define
# "matches" differently: Class (is_a?), Range (cover?), Regexp (match), Proc (call).
def classify(x)
  case x
  when Integer, Float then "number"
  when (/^\d+$/)      then "digit string"
  when String         then "string"
  when ->(v) { v.respond_to?(:each) } then "enumerable"
  when nil            then "nil"
  else "other"
  end
end

[3, 2.5, "42", "hi", [1], nil, :sym].each { |v| puts "#{v.inspect} -> #{classify(v)}" }

puts Integer === 3
puts((1..5) === 3)
puts(/ab/ === "cabin")
