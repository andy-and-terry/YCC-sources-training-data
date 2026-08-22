def describe(value)
  case value
  in Integer => n if n.negative?
    "negative integer #{n}"
  in 0
    'zero'
  in Integer
    'positive integer'
  in [Integer, Integer]
    'pair of integers'
  in { name: String => name }
    "has name #{name}"
  else
    'unknown'
  end
end

puts describe(-5)
puts describe(0)
puts describe([1, 2])
puts describe({ name: 'Alice' })
